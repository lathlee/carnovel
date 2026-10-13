import AVFoundation
import AVKit
import SwiftUI

// ═══════════════════════════════════════════════════════════════════
//  投屏诊断面板
// ═══════════════════════════════════════════════════════════════════
//
//  AirPlay 路由选单里"看不到车机"这件事，可能的原因有好几层：
//  音频会话没配好 / 播放器没在播 / 车机不支持视频路由 / 根本不是同一回事。
//  光靠猜没用，这个面板把能读到的系统状态全摊出来。
//
//  上车后按顺序看：
//    ① 类别必须是 Playback、模式必须是 MoviePlayback
//    ② 配置是否成功；如果不成功，看具体 NSError domain/code
//    ③ 输出路由：点过路由按钮之后，这里应该从「内置扬声器」变成车机名字
//    ④ 播放器必须显示「播放中」—— 暂停状态下列表里什么都没有
//    ⑤ 两个路由按钮并排，视频优先那个才应该出现车机屏

struct RouteDiagnosticsView: View {

    @ObservedObject var player: PageTurnPlayer
    @Environment(\.dismiss) private var dismiss

    @State private var snap = AudioSessionConfig.Snapshot()

    private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            List {
                Section("① 音频会话（投屏的前提）") {
                    row("类别", snap.category, ok: snap.category.contains("Playback"))
                    row("模式", snap.mode, ok: snap.mode.contains("Movie"))
                    row("配置结果", snap.lastSuccess ? "成功" : "失败", ok: snap.lastSuccess)
                    if !snap.lastMessage.isEmpty && snap.lastMessage != "(无)" {
                        Text(snap.lastMessage)
                            .font(.caption)
                            .foregroundColor(snap.lastSuccess ? .secondary : .orange)
                    }
                    if !snap.lastDomainCode.isEmpty {
                        Text("错误码: \(snap.lastDomainCode)")
                            .font(.caption2)
                            .foregroundColor(.red)
                    }
                    row("采样率", String(format: "%.0f Hz", snap.sampleRate))
                    row("声道数", "\(snap.channelCount)")
                    if snap.otherAudioPlaying {
                        Text("有其它 App 正在播音 —— 会抢走音频会话。先关掉它。")
                            .font(.caption)
                            .foregroundColor(.orange)
                    }
                }

                Section("② 当前输出路由") {
                    row("名称", snap.outputName)
                    row("类型", snap.outputType)
                    row("路由数", "\(snap.outputPorts)")
                    Text("点过路由按钮之后，这里应该从「内置扬声器」变成车机的名字。没变就是没投出去。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Section("③ 播放器") {
                    row("状态", player.playerStateText, ok: player.isPlaying)
                    row("当前页", "\(player.currentPage + 1) / \(player.pageCount)")
                    Toggle("单页循环（保持会话活跃）", isOn: Binding(
                        get: { player.loopsCurrentPage },
                        set: { player.setLooping($0) }
                    ))
                    Text("关掉它画面会停在末帧，但媒体会话也随之被系统回收 —— 这正是旧版本投不出去的原因，留着做对照。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Section("④ 路由选单对照") {
                    Text("分别点开两个按钮，看选单内容是否不同。「视频优先」那个才应该出现车机屏。")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    HStack {
                        VStack(spacing: 8) {
                            AirPlayRouteButton(prioritizesVideoDevices: true)
                                .frame(width: 48, height: 48)
                            Text("视频优先").font(.caption2)
                        }
                        Spacer()
                        VStack(spacing: 8) {
                            AirPlayRouteButton(prioritizesVideoDevices: false)
                                .frame(width: 48, height: 48)
                            Text("仅音频").font(.caption2)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                }

                Section("⑤ 操作") {
                    Button("重新配置音频会话") {
                        _ = AudioSessionConfig.configure()
                        refresh()
                    }
                    Button("立即刷新状态") { refresh() }
                }

                Section("⑥ 车机上该看哪里") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("★ 首选：CarPlay 浏览器打开网页")
                            .font(.footnote.bold())
                        Text("在阅读页点「CarPlay 浏览器打开」拿到 127.0.0.1 地址，粘到车机 APTV / 车联投屏 的浏览器里即可全屏阅读。这条路不需要 CarPlay entitlement、不需要 AirPlay 视频能力、也不需要屏幕镜像。")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("备选：「正在播放 / Now Playing」")
                            .font(.footnote.bold())
                        Text("CarPlay 协议的基础模板，任何车机都实现，不需要 entitlement。去车机 CarPlay 里找「正在播放」，能看到标题「第 X 章 · 第 Y/Z 页」。但封面区域只有约 1/3 屏且无法放大，只能当进度提示，看不了正文。")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("为什么不做 CarPlay 应用图标")
                            .font(.footnote.bold())
                        Text("APTV /「车联投屏」能出现在车机首页，是因为它们持有 Apple 正式审批的 CarPlay entitlement（付费开发者账号 + 逐个审批）。免费 Apple ID 侧载拿不到任何 entitlement，这条路封死。")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("AirPlay 视频路由（已确认走不通）")
                            .font(.caption.bold())
                        Text("车机是 DiPlay —— 用从 Carlinkit 固件提取的实验性 MFi 身份冒充 CarPlay 车机。它只做 CarPlay 接收，不广播 AirPlay 视频/镜像接收能力，所以屏幕镜像里没有车机。")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("投屏诊断")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("完成") { dismiss() }
                }
            }
        }
        .onAppear {
            _ = AudioSessionConfig.configure()
            refresh()
        }
        .onReceive(timer) { _ in refresh() }
    }

    private func refresh() {
        snap = AudioSessionConfig.snapshot()
    }

    @ViewBuilder
    private func row(_ label: String, _ value: String, ok: Bool? = nil) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.trailing)
            if let ok {
                Image(systemName: ok ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundStyle(ok ? Color.green : Color.red)
            }
        }
        .font(.footnote)
    }
}

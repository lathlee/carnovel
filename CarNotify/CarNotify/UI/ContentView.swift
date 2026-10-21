//
//  ContentView.swift
//  Glass-view
//
//  iPhone 端主界面：状态 / 消息调试 / 触控板 三个标签页。
//  触控板：小触控区 + 返回/桌面/多任务/点击 + 上下左右方向键（短视频切换、翻页）。
//  输入面板：由眼镜端触发（文本框聚焦时弹出），占 2/3 屏高，平常隐藏。
//

import SwiftUI
import UIKit
import AVFoundation

struct ContentView: View {

    @ObservedObject var server: NotifyServer

    var body: some View {
        ZStack {
            TabView {
                StatusView(server: server)
                    .tabItem { Label("状态", systemImage: "dot.radiowaves.left.and.right") }
                DebugView(server: server)
                    .tabItem { Label("调试", systemImage: "bell.badge") }
                TouchpadView(server: server)
                    .tabItem { Label("触控板", systemImage: "hand.tap") }
            }
            if server.imeShow {
                InputPanel(server: server)
                    .transition(.move(edge: .bottom))
                    .zIndex(10)
            }
        }
        .preferredColorScheme(.dark)
    }
}

// ═══════════════════════════════════════════════════════════════════
//  ① 状态
// ═══════════════════════════════════════════════════════════════════

struct StatusView: View {
    @ObservedObject var server: NotifyServer
    @State private var keepAliveMessage = "未启动"
    @State private var keepAliveOn = false
    @State private var copied = false
    @State private var routeText = "iPhone"
    @State private var routeTimer: Timer?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    statusCard
                    linkCard
                    audioCard
                    controlCard
                }
                .padding(18)
            }
            .background(Color(red: 0.03, green: 0.04, blue: 0.03).ignoresSafeArea())
            .navigationTitle("Glass-view")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .onAppear {
            refreshKeepAlive()
            refreshRoute()
            routeTimer?.invalidate()
            // 音频插拔（连上/断开眼镜蓝牙）时刷新输出通道显示
            routeTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                refreshRoute()
            }
        }
        .onDisappear { routeTimer?.invalidate(); routeTimer = nil }
    }

    private var statusCard: some View {
        card {
            HStack(spacing: 10) {
                Circle()
                    .fill(server.isRunning ? Color.green : Color.gray)
                    .frame(width: 11, height: 11)
                Text(server.isRunning ? "服务器运行中" : "服务器已停止")
                    .font(.system(size: 17, weight: .semibold))
                Spacer()
                Text("端口 \(server.port)")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }

            if !server.lastError.isEmpty {
                Text(server.lastError)
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }

            HStack(spacing: 18) {
                metric("收到通知", "\(server.pushedCount)")
                metric("在线页面", "\(server.clientCount)")
            }
            .padding(.top, 8)

            HStack(spacing: 16) {
                Text("后台保活：\(keepAliveMessage)")
                    .font(.system(size: 12))
                    .foregroundColor(keepAliveOn ? .green : .orange)
                Spacer()
            }
            .padding(.top, 2)
        }
    }

    /// 眼镜连接状态（右侧显示眼镜电量）
    private var linkCard: some View {
        card {
            sectionTitle("眼镜连接")
            HStack(spacing: 10) {
                Circle()
                    .fill(server.glassesConnected ? Color.green : Color.gray)
                    .frame(width: 11, height: 11)
                Text(server.glassesConnected ? "眼镜已连接" : "眼镜未连接")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                batteryBadge
            }
            Text("眼镜连 iPhone 个人热点后自动接入（ws://172.20.10.1:\(server.port)/ws）")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .padding(.top, 4)
            if server.glassesBattery >= 0 {
                Text(batteryFootnote)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
    }

    // MARK: - 眼镜电量

    /// 电池图标按电量段选，看一眼就知道大概还剩多少
    private var batteryIcon: String {
        switch server.glassesBattery {
        case 76...100: return "battery.100"
        case 51...75:  return "battery.75"
        case 26...50:  return "battery.50"
        case 11...25:  return "battery.25"
        case 0...10:   return "battery.0"
        default:       return "battery.0"     // -1：未知
        }
    }

    private var batteryColor: Color {
        switch server.glassesBattery {
        case 0...15:  return .red
        case 16...30: return .orange
        case 31...100: return .green
        default:      return .gray            // 未连接
        }
    }

    private var batteryBadge: some View {
        HStack(spacing: 6) {
            if server.glassesCharging {
                Image(systemName: "bolt.fill")
                    .font(.system(size: 11))
                    .foregroundColor(.yellow)
            }
            Image(systemName: batteryIcon)
                .font(.system(size: 17))
            Text(server.glassesBattery >= 0 ? "\(server.glassesBattery)%" : "--")
                .font(.system(size: 17, weight: .semibold, design: .monospaced))
        }
        .foregroundColor(batteryColor)
    }

    private var batteryFootnote: String {
        var s = "眼镜电量 \(server.glassesBattery)%"
        if server.glassesCharging { s += " · 充电中" }
        if let d = server.batteryUpdatedAt {
            s += " · " + Self.timeFormatter.string(from: d) + " 更新"
        }
        return s
    }

    private static let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "HH:mm:ss"
        return f
    }()

    /// 当前音频输出通道：iPhone 本机 / 眼镜（蓝牙）
    private var audioCard: some View {
        card {
            sectionTitle("当前音频输出")
            HStack {
                Image(systemName: routeText.contains("眼镜") ? "eyeglasses" : "iphone")
                    .font(.system(size: 20))
                    .foregroundColor(.green)
                Text(routeText)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
            }
            Text("在控制中心或蓝牙设置里切换输出设备，这里会跟着变")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .padding(.top, 4)
        }
    }

    private var controlCard: some View {
        card {
            sectionTitle("控制")

            HStack(spacing: 10) {
                Button {
                    if server.isRunning { server.stop() } else { server.start() }
                } label: {
                    label(server.isRunning ? "停止服务器" : "启动服务器",
                          system: server.isRunning ? "stop.fill" : "play.fill")
                }
                .buttonStyle(.borderedProminent)

                Button {
                    BackgroundKeepAlive.shared.ensureRunning()
                    refreshKeepAlive()
                } label: {
                    label("重启保活", system: "arrow.clockwise")
                }
                .buttonStyle(.bordered)
            }

            Text("地址：\(server.urlString)")
                .font(.system(size: 13, design: .monospaced))
                .foregroundColor(.green)
                .textSelection(.enabled)
                .padding(.top, 6)

            HStack(spacing: 10) {
                Button {
                    UIPasteboard.general.string = server.urlString
                    copied = true
                } label: {
                    label(copied ? "已复制" : "复制地址", system: "doc.on.doc")
                }
                .buttonStyle(.bordered)
            }
            .padding(.top, 2)
        }
    }

    private func refreshKeepAlive() {
        keepAliveOn = BackgroundKeepAlive.shared.active
        keepAliveMessage = BackgroundKeepAlive.shared.lastMessage
    }

    private func refreshRoute() {
        routeText = AudioRoute.describe()
    }

    // MARK: - 小部件

    private func card<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) { content() }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(Color(red: 0.08, green: 0.10, blue: 0.08))
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.16, green: 0.24, blue: 0.16), lineWidth: 1))
            .cornerRadius(12)
    }

    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.secondary)
            .textCase(.uppercase)
    }

    private func metric(_ name: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(value).font(.system(size: 19, weight: .semibold, design: .monospaced))
            Text(name).font(.system(size: 11)).foregroundColor(.secondary)
        }
    }

    private func label(_ text: String, system: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: system)
            Text(text)
        }
        .font(.system(size: 14, weight: .medium))
    }
}

/// 音频输出通道识别：iPhone 本机 vs 眼镜（蓝牙）
enum AudioRoute {
    static func describe() -> String {
        let route = AVAudioSession.sharedInstance().currentRoute
        guard let out = route.outputs.first else { return "无输出" }
        let type = out.portType
        if type == .builtInSpeaker { return "iPhone 扬声器" }
        if type == .builtInReceiver { return "iPhone 听筒" }
        if type == .bluetoothA2DP || type == .bluetoothHFP || type == .bluetoothLE {
            let name = out.portName.isEmpty ? "蓝牙" : out.portName
            return "眼镜（蓝牙 · \(name)）"
        }
        if type == .headphones { return "耳机（\(out.portName)）" }
        return out.portName.isEmpty ? "其他输出" : out.portName
    }
}

// ═══════════════════════════════════════════════════════════════════
//  ② 调试
// ═══════════════════════════════════════════════════════════════════

struct DebugView: View {
    @ObservedObject var server: NotifyServer
    @State private var source = "微信"
    @State private var title = "张三"
    @State private var body_ = "在吗？方便接个电话"
    let sources = ["微信", "短信", "QQ", "抖音", "邮件", "自定义"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    card {
                        sectionTitle("来源（决定眼镜上的颜色）")
                        Picker("", selection: $source) {
                            ForEach(sources, id: \.self) { Text($0) }
                        }
                        .pickerStyle(.segmented)

                        sectionTitle("标题 / 内容").padding(.top, 8)
                        TextField("标题", text: $title)
                            .textFieldStyle(.roundedBorder)
                        TextField("内容", text: $body_)
                            .textFieldStyle(.roundedBorder)

                        HStack(spacing: 10) {
                            Button {
                                server.push(app: source, title: title, body: body_)
                            } label: {
                                label("发测试通知", system: "paperplane")
                            }
                            .buttonStyle(.borderedProminent)

                            Button {
                                server.clear()
                            } label: {
                                label("清屏", system: "trash")
                            }
                            .buttonStyle(.bordered)
                        }
                        .padding(.top, 6)
                    }
                    card {
                        sectionTitle("说明")
                        bullet("来源选「微信/短信/QQ/抖音/邮件」时，眼镜端按对应配色显示色条。")
                        bullet("眼镜熄屏时来消息会自动亮屏，5 秒后无人操作再熄屏（需激活设备管理员）。")
                    }
                }
                .padding(18)
            }
            .background(Color(red: 0.03, green: 0.04, blue: 0.03).ignoresSafeArea())
            .navigationTitle("消息调试")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }

    private func card<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) { content() }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(Color(red: 0.08, green: 0.10, blue: 0.08))
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.16, green: 0.24, blue: 0.16), lineWidth: 1))
            .cornerRadius(12)
    }

    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.secondary)
            .textCase(.uppercase)
    }

    private func label(_ text: String, system: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: system)
            Text(text)
        }
        .font(.system(size: 14, weight: .medium))
    }

    private func bullet(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•").foregroundColor(.green)
            Text(text).font(.system(size: 13))
        }
    }
}

// ═══════════════════════════════════════════════════════════════════
//  ③ 触控板
// ═══════════════════════════════════════════════════════════════════

struct TouchpadView: View {
    @ObservedObject var server: NotifyServer
    /// 归一化光标位置（0..1），拖动累计位移
    @State private var cursor = CGPoint(x: 0.5, y: 0.5)

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("拖动区域 = 移动眼镜光标 · 轻点 = 点击")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .padding(.top, 6)

                // 触控区：撑满剩余空间，触控区 + 全部按钮正好一屏
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(red: 0.08, green: 0.10, blue: 0.08))
                        .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 0.16, green: 0.24, blue: 0.16), lineWidth: 1))
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .font(.system(size: 22))
                        .foregroundColor(Color(red: 0.16, green: 0.24, blue: 0.16))
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { g in
                            // 增量驱动：本次位移相对上一帧，换算成归一化坐标。
                            // 全触控区宽 ≈ 眼镜屏一整趟（x），高 ≈ 一整趟（y）
                            let dx = g.translation.width - lastTranslate.width
                            let dy = g.translation.height - lastTranslate.height
                            guard dx != 0 || dy != 0 else { return }
                            let nx = min(1, max(0, cursor.x + dx / 300))
                            let ny = min(1, max(0, cursor.y + dy / 130))
                            cursor = CGPoint(x: nx, y: ny)
                            server.sendCommand(["type": "pointer", "x": nx, "y": ny])
                            lastTranslate = g.translation
                        }
                        .onEnded { g in
                            // 基本没动 -> 视为轻点 = 点击
                            let moved = abs(g.translation.width) + abs(g.translation.height)
                            if moved < 6 {
                                server.sendCommand(["type": "tap", "x": cursor.x, "y": cursor.y])
                            }
                            lastTranslate = .zero
                        }
                )

                // 主按钮：返回 / 桌面 / 多任务 / 点击
                HStack(spacing: 10) {
                    padBtn("chevron.left", "返回") {
                        server.sendCommand(["type": "action", "name": "back"])
                    }
                    padBtn("house", "桌面") {
                        server.sendCommand(["type": "action", "name": "home"])
                    }
                    padBtn("square.on.square", "多任务") {
                        server.sendCommand(["type": "action", "name": "recents"])
                    }
                    padBtn("hand.tap", "点击") {
                        server.sendCommand(["type": "tap", "x": cursor.x, "y": cursor.y])
                    }
                }
                .padding(.horizontal, 16)

                // 方向键：上下左右十字形居中（上/下滑 = 短视频切换，左/右滑 = 翻页）
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        Spacer(minLength: 0)
                        dirBtn("arrow.up", "上滑") { server.sendCommand(["type": "swipe", "dir": "up"]) }
                        Spacer(minLength: 0)
                    }
                    HStack(spacing: 10) {
                        dirBtn("arrow.left", "左滑") { server.sendCommand(["type": "swipe", "dir": "left"]) }
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .fill(Color(red: 0.07, green: 0.08, blue: 0.07))
                                .overlay(RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color(red: 0.15, green: 0.18, blue: 0.15), lineWidth: 1))
                            Text("滑动").font(.system(size: 11))
                                .foregroundColor(Color(red: 0.29, green: 0.32, blue: 0.29))
                        }
                        .frame(width: 108, height: 58)
                        dirBtn("arrow.right", "右滑") { server.sendCommand(["type": "swipe", "dir": "right"]) }
                    }
                    HStack(spacing: 10) {
                        Spacer(minLength: 0)
                        dirBtn("arrow.down", "下滑") { server.sendCommand(["type": "swipe", "dir": "down"]) }
                        Spacer(minLength: 0)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            }
            .background(Color(red: 0.03, green: 0.04, blue: 0.03).ignoresSafeArea())
            .navigationTitle("触控板")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }

    @State private var lastTranslate: CGSize = .zero

    private func padBtn(_ system: String, _ text: String, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: system).font(.system(size: 17, weight: .medium))
                Text(text).font(.system(size: 12))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 9)
            .background(Color(red: 0.11, green: 0.12, blue: 0.11))
            .overlay(RoundedRectangle(cornerRadius: 9)
                .stroke(Color(red: 0.2, green: 0.23, blue: 0.2), lineWidth: 1))
            .cornerRadius(9)
            .foregroundColor(.white)
        }
        .buttonStyle(.plain)
    }

    /// 十字方向键单元（固定尺寸，居中摆放）
    private func dirBtn(_ system: String, _ text: String, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: system).font(.system(size: 20, weight: .medium))
                Text(text).font(.system(size: 12))
            }
            .frame(width: 108, height: 58)
            .background(Color(red: 0.09, green: 0.11, blue: 0.09))
            .overlay(RoundedRectangle(cornerRadius: 11)
                .stroke(Color(red: 0.2, green: 0.23, blue: 0.2), lineWidth: 1))
            .cornerRadius(11)
            .foregroundColor(.white)
        }
        .buttonStyle(.plain)
    }
}

// ═══════════════════════════════════════════════════════════════════
//  输入面板：眼镜端文本框聚焦时由眼镜触发，平常隐藏。
//  直接聚焦用系统键盘，底部只按键盘高度预留空位。
// ═══════════════════════════════════════════════════════════════════

struct InputPanel: View {
    @ObservedObject var server: NotifyServer
    @State private var text = ""
    /// 直接聚焦 -> 用系统键盘（不再自绘键盘）
    @FocusState private var focused: Bool
    /// 系统键盘高度：面板底部按它让位，只「预留位置」
    @State private var kbHeight: CGFloat = 300

    var body: some View {
        VStack(spacing: 0) {
            // 上方黑色区域：点击关闭
            Color.black
                .contentShape(Rectangle())
                .onTapGesture {
                    text = ""
                    hide()
                }

            VStack(spacing: 8) {
                // 面板标题
                VStack(alignment: .leading, spacing: 4) {
                    Text("眼镜端输入")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Text("点上方黑色区域关闭 · 发送后写入眼镜端当前聚焦的输入框")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                TextEditor(text: $text)
                    .focused($focused)
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .padding(6)
                    .background(Color(red: 0.11, green: 0.12, blue: 0.11))
                    .cornerRadius(10)
                    .overlay(
                        // 占位提示
                        Group {
                            if text.isEmpty {
                                Text("输入要发送到眼镜的文字…")
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 12)
                                    .frame(maxWidth: .infinity, maxHeight: 120,
                                           alignment: .topLeading)
                                    .allowsHitTesting(false)
                            }
                        }
                    )

                // 清空靠左、发送靠右，分开放在键盘上方两端，避免误触
                HStack {
                    Button {
                        text = ""
                    } label: {
                        Text("清空").font(.system(size: 14))
                            .padding(.horizontal, 16).padding(.vertical, 8)
                            .background(Color(red: 0.2, green: 0.22, blue: 0.2))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)

                    Spacer()

                    Button {
                        server.sendCommand(["type": "ime", "text": text])
                    } label: {
                        Text("发送").font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 20).padding(.vertical, 8)
                            .background(text.isEmpty ? Color(red: 0.15, green: 0.25, blue: 0.16) : Color.green)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                    .disabled(text.isEmpty)
                }
            }
            .padding(12)
            .background(Color(red: 0.06, green: 0.07, blue: 0.06))

            // 系统键盘占位：键盘是系统窗口，这里只留空
            Spacer().frame(height: kbHeight)
        }
        .frame(height: UIScreen.main.bounds.height, alignment: .bottom)
        .background(Color.black.opacity(0.98))
        .onAppear { focused = true }
        .onReceive(NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillShowNotification)) { note in
            if let f = note.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                kbHeight = f.height
            }
        }
        .onReceive(NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillHideNotification)) { _ in
            kbHeight = 0
        }
    }

    private func hide() {
        focused = false
        server.closeIme() // 本地收起；眼镜端再聚焦会重新弹
    }
}

//
//  ContentView.swift
//  GlassNotify
//
//  iPhone 上用来看状态 + 发调试通知 + 当眼镜触控板。
//  三个标签页：状态 / 调试 / 触控板。
//

import SwiftUI
import UIKit

struct ContentView: View {

    @ObservedObject var server: NotifyServer

    @State private var keepAliveMessage = "未启动"
    @State private var keepAliveOn = false
    @State private var copied = false

    // 调试页状态
    @State private var source = "微信"
    @State private var customSource = ""
    @State private var titleText = "张三"
    @State private var bodyText = "在吗？方便接个电话"

    // 触控板页状态
    @State private var dragStart: CGPoint? = nil
    @State private var lastX: Double = 0.5
    @State private var lastY: Double = 0.5

    private let sources = ["微信", "短信", "QQ", "抖音", "邮件", "自定义"]

    var body: some View {
        TabView {
            statusTab.tag(0).tabItem { Label("状态", systemImage: "antenna.radiowaves.left.and.right") }
            debugTab.tag(1).tabItem { Label("调试", systemImage: "bell.badge.fill") }
            touchpadTab.tag(2).tabItem { Label("触控板", systemImage: "hand.tap") }
        }
        .preferredColorScheme(.dark)
        .onAppear { refreshKeepAlive() }
    }

    // MARK: - 状态

    private var statusTab: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    statusCard
                    addressCard
                    controlCard
                }
                .padding(18)
            }
            .background(Color(red: 0.03, green: 0.04, blue: 0.03).ignoresSafeArea())
            .navigationTitle("GlassNotify")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
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
                Text("\(server.clientCount) 副眼镜")
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
                metric("监听端口", "\(server.port)")
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

    private var addressCard: some View {
        card {
            sectionTitle("眼镜连接地址（连 iPhone 个人热点后）")
            Text(server.glassesAddress)
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .foregroundColor(.green)
                .textSelection(.enabled)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text("iPhone 个人热点的 IP 固定是 172.20.10.1，眼镜端 WS 连这个地址。")
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
                    if server.isRunning { server.stop() }
                    else { server.start() }
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
        }
    }

    // MARK: - 调试（消息）

    private var debugTab: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    card {
                        sectionTitle("来源（决定眼镜上的颜色）")
                        Picker("来源", selection: $source) {
                            ForEach(sources, id: \.self) { Text($0) }
                        }
                        .pickerStyle(.segmented)
                        .padding(.top, 4)

                        if source == "自定义" {
                            TextField("自定义来源名", text: $customSource)
                                .textFieldStyle(.roundedBorder)
                                .padding(.top, 6)
                        }

                        sectionTitle("标题 / 内容")
                            .padding(.top, 8)
                        TextField("标题", text: $titleText)
                            .textFieldStyle(.roundedBorder)
                        TextField("内容", text: $bodyText)
                            .textFieldStyle(.roundedBorder)

                        HStack(spacing: 10) {
                            Button {
                                let app = (source == "自定义" && !customSource.isEmpty) ? customSource : source
                                server.push(app: app, title: titleText, body: bodyText)
                            } label: { label("发测试通知", system: "paperplane.fill") }
                            .buttonStyle(.borderedProminent)

                            Button { server.clear() } label: { label("清屏", system: "trash") }
                            .buttonStyle(.bordered)
                        }
                        .padding(.top, 6)
                    }

                    card {
                        sectionTitle("说明")
                        bullet("来源选「微信/短信/QQ/抖音/邮件」时，眼镜端按对应配色显示色条。")
                        bullet("自定义来源名会原样透传给眼镜，颜色走默认灰。")
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

    // MARK: - 触控板

    private var touchpadTab: some View {
        NavigationView {
            VStack(spacing: 14) {
                Text("在下方区域拖动 = 移动眼镜光标；轻点 = 点击")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                GeometryReader { geo in
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(red: 0.08, green: 0.10, blue: 0.08))
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(red: 0.16, green: 0.24, blue: 0.16), lineWidth: 1))
                        // 中心十字，提示绝对映射
                        Path { p in
                            p.move(to: CGPoint(x: geo.size.width / 2, y: 0))
                            p.addLine(to: CGPoint(x: geo.size.width / 2, y: geo.size.height))
                            p.move(to: CGPoint(x: 0, y: geo.size.height / 2))
                            p.addLine(to: CGPoint(x: geo.size.width, y: geo.size.height / 2))
                        }
                        .stroke(Color(red: 0.16, green: 0.24, blue: 0.16), lineWidth: 1)
                    }
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { v in
                                if dragStart == nil { dragStart = v.startLocation }
                                let n = norm(v.location, geo.size)
                                lastX = n.x; lastY = n.y
                                server.pointer(x: n.x, y: n.y)
                            }
                            .onEnded { v in
                                let dx = v.location.x - v.startLocation.x
                                let dy = v.location.y - v.startLocation.y
                                if hypot(dx, dy) < 12 {
                                    let n = norm(v.location, geo.size)
                                    lastX = n.x; lastY = n.y
                                    server.tap(x: n.x, y: n.y)
                                }
                                dragStart = nil
                            }
                    )
                }
                .frame(maxHeight: .infinity)

                HStack(spacing: 10) {
                    navBtn("返回", system: "arrow.left") { server.action(name: "back") }
                    navBtn("桌面", system: "house.fill") { server.action(name: "home") }
                    navBtn("多任务", system: "square.on.square") { server.action(name: "recents") }
                    navBtn("点击", system: "hand.tap.fill") { server.tap(x: lastX, y: lastY) }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .background(Color(red: 0.03, green: 0.04, blue: 0.03).ignoresSafeArea())
            .navigationTitle("触控板")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }

    private func norm(_ p: CGPoint, _ size: CGSize) -> (x: Double, y: Double) {
        let x = min(max(p.x / max(size.width, 1), 0), 1)
        let y = min(max(p.y / max(size.height, 1), 0), 1)
        return (Double(x), Double(y))
    }

    private func navBtn(_ text: String, system: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: system)
                Text(text).font(.system(size: 12))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
        }
        .buttonStyle(.bordered)
    }

    // MARK: - 小组件

    private func card<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(red: 0.08, green: 0.10, blue: 0.08))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.16, green: 0.24, blue: 0.16), lineWidth: 1)
        )
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
            Text(value)
                .font(.system(size: 19, weight: .semibold, design: .monospaced))
            Text(name)
                .font(.system(size: 11))
                .foregroundColor(.secondary)
        }
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

    private func refreshKeepAlive() {
        keepAliveOn = BackgroundKeepAlive.shared.active
        keepAliveMessage = BackgroundKeepAlive.shared.lastMessage
    }
}

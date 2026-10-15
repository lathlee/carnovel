//
//  ContentView.swift
//  CarNotify
//
//  这个界面只在 iPhone 上看着用；车机屏上显示的是浏览器里的 index.html。
//  它的作用是：告诉用户服务器起没起来、地址是多少、保活有没有生效。
//

import SwiftUI
import UIKit

struct ContentView: View {

    @ObservedObject var server: NotifyServer

    @State private var keepAliveMessage = "未启动"
    @State private var keepAliveOn = false
    @State private var copied = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    statusCard
                    addressCard
                    controlCard
                    howToCard
                }
                .padding(18)
            }
            .background(Color(red: 0.03, green: 0.04, blue: 0.03).ignoresSafeArea())
            .navigationTitle("CarNotify")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
        .onAppear { refreshKeepAlive() }
    }

    // MARK: - 卡片

    private var statusCard: some View {
        card {
            HStack(spacing: 10) {
                Circle()
                    .fill(server.isRunning ? Color.green : Color.gray)
                    .frame(width: 11, height: 11)
                Text(server.isRunning ? "服务器运行中" : "服务器已停止")
                    .font(.system(size: 17, weight: .semibold))
                Spacer()
                Text("\(server.clientCount) 个页面")
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
            sectionTitle("在 APTV 浏览器里输入")

            Text(server.urlString)
                .font(.system(size: 22, weight: .bold, design: .monospaced))
                .foregroundColor(.green)
                .textSelection(.enabled)
                .lineLimit(1)
                .minimumScaleFactor(0.5)

            HStack(spacing: 10) {
                Button {
                    UIPasteboard.general.string = server.urlString
                    copied = true
                } label: {
                    label(copied ? "已复制" : "复制地址", system: "doc.on.doc")
                }
                .buttonStyle(.bordered)

                Text("必须带 http:// 前缀")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            .padding(.top, 4)
        }
    }

    private var controlCard: some View {
        card {
            sectionTitle("控制")

            HStack(spacing: 10) {
                Button {
                    if server.isRunning {
                        server.stop()
                    } else {
                        server.start()
                    }
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

            HStack(spacing: 10) {
                Button {
                    server.push(app: "测试", title: "CarNotify 自检",
                                 body: "这条是 App 里点出来的，没经过快捷指令。")
                } label: {
                    label("发测试通知", system: "bell")
                }
                .buttonStyle(.bordered)

                Button {
                    server.clear()
                } label: {
                    label("清屏", system: "trash")
                }
                .buttonStyle(.bordered)
            }
            .padding(.top, 2)
        }
    }

    private var howToCard: some View {
        card {
            sectionTitle("快捷指令怎么配")

            bullet("新建自动化 → 触发条件选「信息」或「电子邮件」")
            bullet("动作：获取 URL 内容")
            bullet("URL 填  http://127.0.0.1:\(server.port)/push")
            bullet("方法选 POST，请求体选 JSON：")
            Text(#"{"app":"短信","title":"发件人","body":"信息"}"#)
                .font(.system(size: 12, design: .monospaced))
                .foregroundColor(.green)
                .textSelection(.enabled)
                .padding(.leading, 14)
                .padding(.top, 2)
            bullet("「发件人」「信息」用快捷指令里的变量插进去")

            Text("短信触发器必须指定联系人，这是 iOS 的限制，不是本 App 的。")
                .font(.system(size: 11))
                .foregroundColor(.secondary)
                .padding(.top, 4)
        }
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

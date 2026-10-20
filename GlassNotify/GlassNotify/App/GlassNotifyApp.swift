//
//  GlassNotifyApp.swift
//  GlassNotify
//
//  眼镜版 CarNotify：iPhone 开个人热点 -> 眼镜连上来 -> 8090 WS 收通知 + 收触控板指令。
//  不需要 CarPlay / 小组件 / 实时活动（那些是车机版的）。
//

import SwiftUI
import UIKit

@main
struct GlassNotifyApp: App {

    @StateObject private var server = NotifyServer.shared
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView(server: server)
                .onAppear {
                    // 顺序：先把音频拉起来（拿到后台执行权），再开服务器。
                    BackgroundKeepAlive.shared.start()
                    server.start()

                    // 新通知：原生提示音（锁屏也能响）。
                    server.onPush = { _ in
                        BackgroundKeepAlive.shared.playAlert()
                    }
                }
                .onChange(of: scenePhase) { _, phase in
                    // 回到前台补一次保活（被系统中断后 iOS 不会自动恢复）
                    if phase == .active {
                        BackgroundKeepAlive.shared.ensureRunning()
                    }
                }
        }
    }
}

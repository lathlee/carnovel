//
//  CarNotifyApp.swift
//  CarNotify
//

import SwiftUI
import UIKit
import WidgetKit

@main
struct CarNotifyApp: App {

    @StateObject private var server = NotifyServer.shared

    var body: some Scene {
        WindowGroup {
            ContentView(server: server)
                .onAppear {
                    // 顺序有讲究：先把音频拉起来（拿到后台执行权），再开服务器。
                    // 反过来的话，如果 App 一起手就被切到后台，监听可能来不及起来。
                    BackgroundKeepAlive.shared.start()
                    server.start()

                    // 新通知：原生提示音（锁屏也能响，CarPlay 下走车喇叭）
                    //          + 让小组件立刻重绘（不等 15 分钟的兜底刷新）
                    server.onPush = { _ in
                        BackgroundKeepAlive.shared.playAlert()
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                    server.onClear = {
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                }
        }
    }
}

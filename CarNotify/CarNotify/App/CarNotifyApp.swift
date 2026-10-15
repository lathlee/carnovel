//
//  CarNotifyApp.swift
//  CarNotify
//

import SwiftUI
import UIKit

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
                }
        }
    }
}

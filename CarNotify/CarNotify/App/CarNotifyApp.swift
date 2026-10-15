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
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView(server: server)
                .onAppear {
                    // 顺序有讲究：先把音频拉起来（拿到后台执行权），再开服务器。
                    // 反过来的话，如果 App 一起手就被切到后台，监听可能来不及起来。
                    BackgroundKeepAlive.shared.start()
                    server.start()

                    // 新通知：原生提示音（锁屏也能响，CarPlay 下走车喇叭）
                    //          + 让小组件立刻重绘（后台 reload 受 WidgetKit 预算限制，
                    //          可能被推迟，所以还要靠下面的前台兜底）
                    server.onPush = { _ in
                        BackgroundKeepAlive.shared.playAlert()
                        WidgetCenter.shared.reloadAllTimelines()
                        // 锁屏时系统可能推迟单次 reload；错峰多试几次提高命中率
                        // （WWDC25：App 运行中调用不占刷新预算，多调无副作用）
                        for delay in [3.0, 15.0, 60.0] {
                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                WidgetCenter.shared.reloadAllTimelines()
                            }
                        }
                    }
                    server.onClear = {
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                }
                .onChange(of: scenePhase) { _, phase in
                    // App 回到前台（解锁手机、点开 App）时补一次刷新：
                    // 前台的 reload 系统必执行，保证小组件立刻追平后台错过的消息。
                    if phase == .active {
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                }
        }
    }
}

//
//  CarNotifyApp.swift
//  CarNotify
//

import SwiftUI
import UIKit
import WidgetKit
import ActivityKit

// MARK: - 实时活动管理
//
// 为什么需要它：WidgetKit 小组件的时间线重载会被系统在锁屏时推迟
// （开发者模式也绕不过，Apple TSI 确认是平台行为），做不到实时。
// 实时活动（Live Activity）的本地更新不走那套调度 —— 我们的进程
// 靠音频保活常驻，收到推送就 update，锁屏 / CarPlay 上即时生效。
// iOS 26 起实时活动显示在 CarPlay 仪表盘（或屏幕底部通知）。
//
// 唯一限制：**启动**实时活动要求 App 在前台（免费签名没有 APNs，
// 无法用推送启动）。所以装好后打开一次 CarNotify；之后熄屏更新全由后台完成。
// 实时活动有 8 小时系统上限，被结束后回到前台时 ensureRunning() 会重建。

enum LiveNotifier {

    private static var lastState: NotificationActivityAttributes.ContentState?

    static func push(_ item: [String: Any], count: Int) {
        let state = NotificationActivityAttributes.ContentState(
            app: item["app"] as? String ?? "通知",
            title: item["title"] as? String ?? "",
            body: item["body"] as? String ?? "",
            count: count,
            ts: item["ts"] as? Int ?? Int(Date().timeIntervalSince1970))
        lastState = state

        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        if let act = Activity<NotificationActivityAttributes>.activities.first {
            Task { await act.update(ActivityContent(state: state, staleDate: nil)) }
        } else {
            // 后台调用 request 会失败，静默忽略；回前台时 ensureRunning() 补建
            _ = try? Activity.request(
                attributes: NotificationActivityAttributes(),
                content: ActivityContent(state: state, staleDate: nil))
        }
    }

    static func clear() {
        lastState = nil
        Task {
            for act in Activity<NotificationActivityAttributes>.activities {
                await act.end(nil, dismissalPolicy: .immediate)
            }
        }
    }

    /// App 回前台时调用：实时活动被系统按 8 小时上限结束后，在这里重建。
    static func ensureRunning() {
        guard let state = lastState,
              Activity<NotificationActivityAttributes>.activities.isEmpty,
              ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        _ = try? Activity.request(
            attributes: NotificationActivityAttributes(),
            content: ActivityContent(state: state, staleDate: nil))
    }
}

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

                    // 新通知三件事：原生提示音（锁屏也能响，CarPlay 下走车喇叭）
                    //              + 小组件刷新（尽力而为，受系统调度约束）
                    //              + 实时活动更新（锁屏/CarPlay 的实时显示，即时生效）
                    server.onPush = { item in
                        BackgroundKeepAlive.shared.playAlert()
                        WidgetCenter.shared.reloadAllTimelines()
                        // 锁屏时系统可能推迟单次 reload；错峰多试几次提高命中率
                        // （WWDC25：App 运行中调用不占刷新预算，多调无副作用）
                        for delay in [3.0, 15.0, 60.0] {
                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                WidgetCenter.shared.reloadAllTimelines()
                            }
                        }
                        LiveNotifier.push(item, count: server.pushedCount)
                    }
                    server.onClear = {
                        WidgetCenter.shared.reloadAllTimelines()
                        LiveNotifier.clear()
                    }
                }
                .onChange(of: scenePhase) { _, phase in
                    // App 回到前台（解锁手机、点开 App）时：
                    // 1. 补一次小组件刷新，追平后台被推迟的消息
                    // 2. 实时活动若被系统结束（8 小时上限）则重建
                    if phase == .active {
                        WidgetCenter.shared.reloadAllTimelines()
                        LiveNotifier.ensureRunning()
                    }
                }
        }
    }
}

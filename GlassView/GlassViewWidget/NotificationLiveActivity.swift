//
//  NotificationLiveActivity.swift
//  GlassViewWidget
//
//  实时活动的 UI —— 住在小组件扩展里（ActivityKit 的规矩）。
//  同一份视图用于：iPhone 锁屏 / 灵动岛展开 / Apple Watch 智能叠放 /
//  CarPlay（iOS 26，supplementalActivityFamilies 传 .small 后
//  CarPlay 渲染的就是锁屏同款视图）。
//

import ActivityKit
import WidgetKit
import SwiftUI

struct NotificationLiveActivity: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NotificationActivityAttributes.self) { context in
            LiveNotificationView(state: context.state)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.state.app)
                        .font(.caption2.bold())
                        .foregroundColor(.green)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.title.isEmpty ? context.state.app : context.state.title)
                        .font(.callout.weight(.semibold))
                        .lineLimit(1)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.state.body)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            } compactLeading: {
                Image(systemName: "bell.fill")
                    .foregroundColor(.green)
            } compactTrailing: {
                Text("\(context.state.count)")
                    .font(.caption2.monospacedDigit())
                    .foregroundColor(.green)
            } minimal: {
                Image(systemName: "bell.fill")
                    .foregroundColor(.green)
            }
        }
        // .small：锁屏同款完整卡片 + Apple Watch 智能叠放。
        // 关于 CarPlay：Apple 文档/WWDC25 #278 称 .small 即覆盖 CarPlay；
        // 但实测 APTV 这类第三方转接盒不渲染实时活动（连默认紧凑视图都不显示），
        // 且 .carPlay 这个 ActivityFamily 在当前 iOS 26.5 SDK 中并不存在。
        // 故 CarPlay 上的实时显示只能退回 APTV 浏览器页面（WebSocket，已验证可显示）。
        .supplementalActivityFamilies([.small])
    }
}

private struct LiveNotificationView: View {

    let state: NotificationActivityAttributes.ContentState

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "bell.fill")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.green)
                .padding(7)
                .background(Circle().fill(Color.green.opacity(0.15)))

            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(state.app)
                        .font(.caption2.bold())
                        .padding(.horizontal, 5)
                        .padding(.vertical, 1)
                        .background(Capsule().fill(Color.green))
                        .foregroundColor(.black)
                    Spacer()
                    if state.count > 1 {
                        Text("共 \(state.count) 条")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                Text(state.title.isEmpty ? state.app : state.title)
                    .font(.subheadline.weight(.semibold))
                    .lineLimit(1)
                if !state.body.isEmpty {
                    Text(state.body)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            }
        }
    }
}

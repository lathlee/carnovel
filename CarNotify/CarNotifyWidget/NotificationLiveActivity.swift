//
//  NotificationLiveActivity.swift
//  CarNotifyWidget
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
        let base = ActivityConfiguration(for: NotificationActivityAttributes.self) { context in
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
        // 关键：声明 .small 活动家族后，CarPlay（iOS 26）显示锁屏同款视图；
        // 不声明的话 CarPlay 只能回退到灵动岛的紧凑前后视图。
        // 这是 iOS 18 的 API，17 上退回紧凑视图（CarPlay 实时活动本来就要求 iOS 26）。
        if #available(iOS 18.0, *) {
            return AnyWidgetConfiguration(base.supplementalActivityFamilies([.small]))
        }
        return AnyWidgetConfiguration(base)
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

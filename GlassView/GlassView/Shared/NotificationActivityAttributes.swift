//
//  NotificationActivityAttributes.swift
//  GlassView
//
//  实时活动的数据模型。主 App 和小组件扩展两个 target 都编译这个文件
//  （project.yml 里各自引用 GlassView/Shared）——
//  ActivityKit 的规矩：attributes 定义必须两端一致，实时活动的 UI 在扩展里，
//  而启动/更新在主 App 里。
//

import ActivityKit

struct NotificationActivityAttributes: ActivityAttributes {

    struct ContentState: Codable & Hashable {
        /// 通知来源（短信 / 邮件 / 测试…）
        var app: String
        /// 标题
        var title: String
        /// 正文
        var body: String
        /// 当前未读总数
        var count: Int
        /// 最新一条的 Unix 时间戳（秒）
        var ts: Int
    }

    // 固定属性（启动后不变的部分）没有需要展示的，留空。
}

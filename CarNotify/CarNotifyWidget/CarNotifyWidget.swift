//
//  CarNotifyWidget.swift
//  CarNotifyWidget
//
//  CarPlay 小组件屏 / iPhone 主屏共用的小组件：显示 CarNotify 收到的最新通知。
//
//  关键事实（Apple CarPlay Developer Guide + WWDC25 #216，已核实）：
//  - iOS 26 起 CarPlay 支持小组件，**App 不需要是 CarPlay App**，
//    不需要任何 carplay-* 权益 —— 免费签名侧载就能上。
//  - CarPlay 只认 .systemSmall 尺寸。
//  - 小组件自己不能发声（WidgetKit 是静态快照）；
//    提示音由主 App 原生播（BackgroundKeepAlive.playAlert），不在这里。
//  - 数据不走 App Group 共享存储，直接 HTTP 拉本机服务器 /latest ——
//    服务器常驻（静音音频保活），锁屏下也拿得到。
//    实时刷新靠主 App 收到推送时调 WidgetCenter.reloadAllTimelines()，
//    这里的 15 分钟只是兜底周期。
//  - 点小组件不能启动 App（我们的 App 不是 CarPlay App，Apple 规则），
//    所以没设 widgetURL；但触屏车机上按钮交互可用（清屏按钮）。
//

import WidgetKit
import SwiftUI
import AppIntents

// MARK: - 数据

struct NotificationItem: Decodable {
    let app: String
    let title: String
    let body: String
    let ts: Int
}

private struct LatestResponse: Decodable { let items: [NotificationItem] }

struct LatestEntry: TimelineEntry {
    let date: Date
    let items: [NotificationItem]
    let reachable: Bool
}

// MARK: - Provider

struct LatestProvider: TimelineProvider {

    static let base = "http://127.0.0.1:8081"

    private let sample = NotificationItem(
        app: "短信", title: "示例通知",
        body: "服务器就绪后，这里显示收到的最新一条", ts: 0)

    func placeholder(in context: Context) -> LatestEntry {
        LatestEntry(date: Date(), items: [sample], reachable: true)
    }

    func getSnapshot(in context: Context, completion: @escaping (LatestEntry) -> Void) {
        fetch(completion)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<LatestEntry>) -> Void) {
        fetch { entry in
            let next = Calendar.current.date(byAdding: .minute, value: 15, to: Date()) ?? Date()
            completion(Timeline(entries: [entry], policy: .after(next)))
        }
    }

    private func fetch(_ done: @escaping (LatestEntry) -> Void) {
        guard let url = URL(string: Self.base + "/latest") else {
            done(LatestEntry(date: Date(), items: [], reachable: false))
            return
        }
        var req = URLRequest(url: url)
        req.timeoutInterval = 8
        URLSession.shared.dataTask(with: req) { data, _, _ in
            var items: [NotificationItem] = []
            var ok = false
            if let data, let obj = try? JSONDecoder().decode(LatestResponse.self, from: data) {
                items = obj.items
                ok = true
            }
            DispatchQueue.main.async {
                done(LatestEntry(date: Date(), items: items, reachable: ok))
            }
        }.resume()
    }
}

// MARK: - 清屏按钮（触屏车机 / 主屏都能点，POST /clear 到本机服务器）

struct ClearIntent: AppIntent {
    static var title: LocalizedStringResource = "清屏"
    static var description = IntentDescription("清空 CarNotify 的通知列表")

    func perform() async throws -> some IntentResult & ProvidesDialog {
        var req = URLRequest(url: URL(string: LatestProvider.base + "/clear")!)
        req.httpMethod = "POST"
        req.timeoutInterval = 5
        let ok = (try? await URLSession.shared.data(for: req)) != nil
        return .result(dialog: ok ? "已清屏" : "服务器没连上")
    }
}

// MARK: - 视图

struct LatestWidgetView: View {
    let entry: LatestEntry

    private var timeText: String {
        guard let first = entry.items.first else { return "" }
        let d = Date(timeIntervalSince1970: TimeInterval(first.ts))
        return d.formatted(date: .omitted, time: .shortened)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            if let first = entry.items.first {
                HStack(spacing: 5) {
                    Text(first.app)
                        .font(.system(size: 10, weight: .bold))
                        .padding(.horizontal, 5)
                        .padding(.vertical, 1.5)
                        .background(Capsule().fill(Color.green))
                        .foregroundColor(.black)
                    Spacer()
                    Text(timeText)
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }
                Text(first.title.isEmpty ? first.app : first.title)
                    .font(.system(size: 13, weight: .semibold))
                    .lineLimit(1)
                Text(first.body)
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                if entry.items.count > 1 {
                    Text("还有 \(entry.items.count - 1) 条")
                        .font(.system(size: 10))
                        .foregroundColor(.green)
                }
            } else if entry.reachable {
                Spacer()
                Image(systemName: "bell.slash")
                    .foregroundColor(.secondary)
                Text("暂无通知")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
            } else {
                Spacer()
                Image(systemName: "wifi.slash")
                    .foregroundColor(.orange)
                Text("服务器未连接")
                    .font(.system(size: 11))
                    .foregroundColor(.orange)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .containerBackground(for: .widget) { Color(red: 0.03, green: 0.05, blue: 0.03) }
        .overlay(alignment: .bottomTrailing) {
            Button(intent: ClearIntent()) {
                Image(systemName: "trash")
                    .font(.system(size: 10))
                    .foregroundColor(.red)
                    .padding(5)
                    .background(Circle().fill(Color.white.opacity(0.08)))
            }
            .buttonStyle(.plain)
            .padding(4)
        }
    }
}

// MARK: - 入口

struct LatestNotificationWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "CarNotifyLatest", provider: LatestProvider()) { entry in
            LatestWidgetView(entry: entry)
        }
        .configurationDisplayName("最新通知")
        .description("CarNotify 收到的最新消息。CarPlay 小组件屏与主屏通用。")
        .supportedFamilies([.systemSmall])
    }
}

@main
struct CarNotifyWidgetBundle: WidgetBundle {
    var body: some Widget {
        LatestNotificationWidget()
    }
}

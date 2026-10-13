import AVKit
import SwiftData
import SwiftUI

// ═══════════════════════════════════════════════════════════════════
//  阅读 / 投屏页 —— 整个 App 的核心界面
// ═══════════════════════════════════════════════════════════════════
//
//  流程：载入本章正文 → 分页排版 → 生成单页视频 → AirPlay 投到车机
//
//  重要：这个界面**只负责"把页面准备好 + 投出去"**。
//  投屏之后手机可以息屏，翻页全靠方向盘。
//
//  性能上的关键取舍：**按章按需生成，生成后落盘缓存**。
//  一本 797 万字的书不可能整本预生成（要几十 GB 视频）。
//  所以第一次进某章等几秒，之后秒开。

struct ReadView: View {

    @Environment(\.modelContext) private var context
    @Bindable var book: ShelfBook
    let chapterIndex: Int

    @StateObject private var player = PageTurnPlayer()

    @State private var chapterText = ""
    @State private var pageURLs: [URL] = []
    @State private var phase: Phase = .idle
    @State private var errorMessage: String?
    @State private var showingDiagnostics = false
    @State private var showingBrowserURL = false

    enum Phase: Equatable {
        case idle
        case fetchingText
        case rendering(done: Int, total: Int)
        case ready

        var label: String {
            switch self {
            case .idle: "准备中"
            case .fetchingText: "获取正文…"
            case .rendering(let done, let total): "排版 \(done)/\(total)"
            case .ready: "就绪"
            }
        }
    }

    private var chapter: ChapterRef? {
        book.chapterList.indices.contains(chapterIndex)
            ? book.chapterList[chapterIndex] : nil
    }

    var body: some View {
        VStack(spacing: 20) {
            header

            switch phase {
            case .ready:
                readyPanel
            default:
                progressPanel
            }

            Spacer()
        }
        .padding()
        .navigationTitle(chapter?.title ?? "阅读")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingDiagnostics = true
                } label: {
                    Image(systemName: "wave.3.right.circle")
                }
                .accessibilityLabel("投屏诊断")
            }
        }
        .sheet(isPresented: $showingDiagnostics) {
            RouteDiagnosticsView(player: player)
        }
        .sheet(isPresented: $showingBrowserURL) {
            BrowserURLSheet(bookID: book.bookID, chapter: chapterIndex, page: player.currentPage)
        }
        .task { await prepare() }
        .onDisappear { persistProgress() }
        .alert("出错了", isPresented: .constant(errorMessage != nil)) {
            Button("好") { errorMessage = nil }
        } message: {
            Text(errorMessage ?? "")
        }
    }

    // MARK: - 组件

    private var header: some View {
        VStack(spacing: 6) {
            Text(book.title)
                .font(.caption)
                .foregroundStyle(.tertiary)
            Text(chapter?.title ?? "")
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }

    private var progressPanel: some View {
        VStack(spacing: 14) {
            ProgressView()

            Text(phase.label)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .monospacedDigit()

            if case .rendering(let done, let total) = phase, total > 0 {
                ProgressView(value: Double(done), total: Double(total))
                    .frame(maxWidth: 240)
            }

            Text("首次打开某章需要生成页面，之后会缓存秒开")
                .font(.caption2)
                .foregroundStyle(.tertiary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 40)
    }

    private var readyPanel: some View {
        VStack(spacing: 20) {
            VStack(spacing: 6) {
                Text("\(player.currentPage + 1)")
                    .font(.system(size: 60, weight: .semibold, design: .rounded))
                    .monospacedDigit()
                Text("共 \(player.pageCount) 页")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            VStack(spacing: 10) {
                AirPlayRouteButton()
                    .frame(width: 56, height: 56)

                Text("点上方按钮投到车机屏")
                    .font(.footnote)

                Text("投屏后方向盘「上一曲 / 下一曲」翻页\n手机可以息屏")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                Text(player.statusText)
                    .font(.caption2)
                    .foregroundStyle(.tertiary)

                Button {
                    showingBrowserURL = true
                } label: {
                    Label("CarPlay 浏览器打开", systemImage: "car.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 8) {
                Label("车机屏上不会出现任何控件", systemImage: "rectangle.slash")
                Label("每页播完自动停住，翻页由你控制", systemImage: "hand.tap")
                Label("行驶中画面自动关闭（系统限制）", systemImage: "car")
            }
            .font(.footnote)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: - 准备流程

    @MainActor
    private func prepare() async {
        guard let chapter else {
            errorMessage = "章节目录里没有这一章"
            return
        }

        do {
            // 1. 取正文
            phase = .fetchingText
            chapterText = try await loadText(chapter: chapter)

            // 2. 分页 + 生成单页视频（已有缓存就直接返回）
            let store = PageStore()
            let dir = await store.folderURL(bookID: book.remoteID, chapter: chapterIndex)

            phase = .rendering(done: 0, total: 0)
            // progress 闭包是 @Sendable，可能在任意线程被调。
            // 所以这里不直接碰 @State（会触发 Swift 6 的并发检查报错），
            // 而是用 Task { @MainActor } 把值搬回主线程。
            let urls = try await store.pages(
                for: book.remoteID,
                chapter: chapterIndex,
                text: chapterText,
                style: .car,
                seconds: 1.0,
                progress: { done, total in
                    Task { @MainActor in
                        phase = .rendering(done: done, total: total)
                    }
                }
            )

            guard !urls.isEmpty else {
                throw BookSourceError.badResponse("这一章没排版出任何页面")
            }

            pageURLs = urls
            _ = dir

            // 3. 交给播放器
            let resume = (book.currentChapter == chapterIndex) ? book.currentPage : 0
            player.load(pages: urls,
                        bookID: book.remoteID,
                        bookTitle: book.title,
                        chapterIndex: chapterIndex,
                        startAt: min(resume, urls.count - 1))

            phase = .ready

        } catch {
            errorMessage = error.localizedDescription
            phase = .idle
        }
    }

    private func loadText(chapter: ChapterRef) async throws -> String {
        guard let source = SourceRegistry.shared.source(id: book.sourceID) else {
            throw BookSourceError.notFound
        }

        // 本地源已经落盘，直接读文件，不走网络
        if book.sourceID == "local" {
            return try await source.content(bookID: book.remoteID,
                                            chapterID: chapter.chapterID)
        }

        // 在线源：先看本地有没有缓存过这一章
        if let cached = ChapterCache.shared.text(bookID: book.remoteID,
                                                 chapterID: chapter.chapterID) {
            return cached
        }

        let text = try await source.content(bookID: book.remoteID,
                                            chapterID: chapter.chapterID)
        ChapterCache.shared.store(bookID: book.remoteID,
                                  chapterID: chapter.chapterID,
                                  text: text)
        return text
    }

    private func persistProgress() {
        book.currentChapter = chapterIndex
        book.currentPage = player.currentPage
        book.lastReadAt = Date()
        try? context.save()
    }
}

// MARK: - 章节正文缓存

/// 在线源的正文缓存。避免同一章反复走网络。
/// 磁盘上按 bookID/chapterID 存成纯文本，容量可控（一章几 KB）。
final class ChapterCache {

    static let shared = ChapterCache()

    private let root: URL

    private init() {
        let caches = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        root = caches.appendingPathComponent("ChapterText", isDirectory: true)
        try? FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    }

    func text(bookID: String, chapterID: String) -> String? {
        let url = fileURL(bookID: bookID, chapterID: chapterID)
        return try? String(contentsOf: url, encoding: .utf8)
    }

    func store(bookID: String, chapterID: String, text: String) {
        let dir = root.appendingPathComponent(safe(bookID), isDirectory: true)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try? text.write(to: dir.appendingPathComponent("\(chapterID).txt"),
                        atomically: true, encoding: .utf8)
    }

    func clear() {
        try? FileManager.default.removeItem(at: root)
        try? FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    }

    private func fileURL(bookID: String, chapterID: String) -> URL {
        root.appendingPathComponent(safe(bookID), isDirectory: true)
            .appendingPathComponent("\(chapterID).txt")
    }

    private func safe(_ s: String) -> String {
        s.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? s
    }
}

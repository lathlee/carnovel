import AVKit
import MediaPlayer
import SwiftUI
import UIKit

// ═══════════════════════════════════════════════════════════════════
//  翻页播放器 —— 方向盘「上一曲 / 下一曲」翻页
// ═══════════════════════════════════════════════════════════════════
//
//  为什么用「播放列表」而不是「一个长视频」：
//
//  CarPlay 里方向盘的上一曲/下一曲操作的是**播放列表里的媒体项**，
//  不是视频内的时间点。Apple 官方文档写得很明确：
//      短按 = 跳到下一首歌曲，长按 = 快进
//  而且 MPRemoteCommandCenter 的回调**没有长按参数** —— 短按/长按是车机
//  固件自己判断的，iOS 侧根本收不到"长按"事件。所以「对换短按和长按」
//  在应用层做不到，那不是 App 能控制的东西。
//
//  正解：让每一页成为一个独立媒体项。这样"下一曲"就天然等于"翻下一页"，
//  完全是系统原生行为，不依赖任何 hack，也不受 iOS 版本变动影响。
//
//  ═══ 这个 App 故意不申请 CarPlay entitlement ═══
//
//  正因为不是 CarPlay 应用，它不会出现在车机首页，车机屏上就不会有
//  上一曲/下一曲/播放暂停那一排控件来遮挡文字。
//
//  ═══ v2 修复：为什么之前点投屏没反应 ═══
//
//  两个硬伤，都在这个文件里：
//
//  ① 从来没有配置过 AVAudioSession。
//     没有音频会话 → AVPlayer 播不起来 → 系统认为"没有媒体在播"
//     → AirPlay 路由选单里没有任何可投内容，只剩系统默认音频设备。
//     → 见 AudioSessionConfig.swift
//
//  ② load() 之后从来没有 player.play()。
//     只有"回退一页"的分支里有 play()，首次载入根本不播，
//     画面永远是黑的，媒体会话也建立不起来。
//
//  现在：load() 里配置好会话并真正开始播放，默认单页循环 ——
//  画面一直亮着（看起来是静止的一页），媒体会话也持续活着，
//  这样车机才能一直收到画面。

@MainActor
final class PageTurnPlayer: ObservableObject {

    @Published private(set) var currentPage = 0
    @Published private(set) var pageCount = 0

    /// 诊断面板显示用
    @Published private(set) var statusText = "未装载"
    /// 单页是否循环播放（保持媒体会话活跃）
    @Published var loopsCurrentPage = true

    private let player = AVQueuePlayer()
    private var looper: AVPlayerLooper?
    private var pages: [URL] = []
    private var bookID = ""
    private var bookTitle = ""
    private var chapterIndex = 0
    private var endObserver: NSObjectProtocol?

    /// 「正在播放」封面图缓存（只留最近几张）
    private var artworkCache: [Int: UIImage] = [:]

    var avPlayer: AVPlayer { player }

    /// 播放器状态的可读描述（诊断面板用）
    var playerStateText: String {
        switch player.timeControlStatus {
        case .playing: return "播放中"
        case .waitingToPlayAtSpecifiedRate: return "缓冲中"
        case .paused: return "已暂停"
        @unknown default: return "未知"
        }
    }

    var isPlaying: Bool { player.timeControlStatus == .playing }

    /// 诊断用：当前页的封面图（CarPlay「正在播放」用）到底有没有生成
    var artworkStatusText: String {
        guard pages.indices.contains(currentPage) else { return "无页面" }
        let url = PageStore.artworkURL(besideVideo: pages[currentPage])
        guard let attrs = try? FileManager.default.attributesOfItem(atPath: url.path),
              let size = attrs[.size] as? Int else {
            return "缺失 —— 封面不会显示"
        }
        return "存在（\(size / 1024) KB）"
    }

    // MARK: - 装载

    /// - Parameter urls: 按页序排列的单页视频文件（ch01_p001.mp4 … ch01_p018.mp4）
    /// - Parameter title: 书名，会显示在 CarPlay「正在播放」的艺术家一栏
    func load(pages urls: [URL], bookID: String, bookTitle title: String = "",
              chapterIndex: Int, startAt: Int = 0) {
        self.pages = urls
        self.pageCount = urls.count
        self.bookID = bookID
        self.bookTitle = title
        self.chapterIndex = chapterIndex
        artworkCache.removeAll()

        // ★ ① 先配置音频会话。必须在起播之前 ——
        //    没有会话，AVPlayer 播不起来，投屏选单也是空的。
        AudioSessionConfig.activateForCasting()

        // 让画面能外放到 AirPlay 设备 —— 车机走的就是这条路
        player.allowsExternalPlayback = true

        // ★ ② 不再用 actionAtItemEnd = .pause。
        //    之前"播完就停住"看似聪明，实际上会让媒体会话被系统回收，
        //    车机画面随之中断。改成单页循环：画面静止但会话常活。
        player.actionAtItemEnd = .advance

        removeObservers()
        buildItems(from: max(0, min(startAt, urls.count - 1)))

        observeItemEnd()
        registerRemoteCommands()
        updateNowPlaying()

        // ★ ③ 真正开始播放。这一步之前根本不存在。
        player.play()
        statusText = "已装载 \(pageCount) 页，播放中"
    }

    private func buildItems(from index: Int) {
        // 顺序很重要：必须先释放 looper，再清队列。
        // 反过来的话 AVPlayerLooper 还持着已经被移除的媒体项，会出乱子。
        looper = nil
        player.removeAllItems()

        guard pages.indices.contains(index) else { return }

        if loopsCurrentPage {
            // 单个媒体项 + looper = 无限循环这一页。
            // 画面看起来是静止的一张纸，但会话一直活着。
            // AVPlayerLooper 要求 actionAtItemEnd 是 .advance。
            player.actionAtItemEnd = .advance
            let item = AVPlayerItem(url: pages[index])
            looper = AVPlayerLooper(player: player, templateItem: item)
        } else {
            // 对照模式：整章排队，每页播完停住
            player.actionAtItemEnd = .pause
            for url in pages[index...] {
                player.insert(AVPlayerItem(url: url), after: nil)
            }
        }
        currentPage = index
    }

    /// 切换"单页循环"并重建队列
    func setLooping(_ on: Bool) {
        loopsCurrentPage = on
        let wasPlaying = isPlaying
        buildItems(from: currentPage)
        if wasPlaying { player.play() }
    }

    // MARK: - 翻页

    func nextPage() {
        guard currentPage + 1 < pageCount else { return }
        currentPage += 1
        rebuildAndPlay()
    }

    func previousPage() {
        guard currentPage > 0 else { return }
        currentPage -= 1
        rebuildAndPlay()
    }

    /// 切换页面：重建队列到目标页并继续播放
    private func rebuildAndPlay() {
        buildItems(from: currentPage)
        player.play()
        updateNowPlaying()
        saveProgress()
    }

    /// 在 iPhone 上打开某一页（用于从书架续读 / 从章节列表跳转）
    func jump(to page: Int) {
        guard pages.indices.contains(page) else { return }
        currentPage = page
        rebuildAndPlay()
    }

    /// 从另一个章节重新载入（章节列表直接跳章用）
    func reload(pages urls: [URL], chapterIndex: Int, startAt: Int = 0) {
        self.pages = urls
        self.pageCount = urls.count
        self.chapterIndex = chapterIndex
        currentPage = 0
        buildItems(from: max(0, min(startAt, urls.count - 1)))
        player.play()
        updateNowPlaying()
        statusText = "已切到第 \(chapterIndex + 1) 章"
    }

    func stop() {
        player.pause()
        statusText = "已停止"
    }

    // MARK: - 进度

    private func saveProgress() {
        UserDefaults.standard.set(
            ["chapter": chapterIndex, "page": currentPage],
            forKey: "progress.\(bookID)"
        )
    }

    // MARK: - Now Playing 元数据

    /// ★ 这是目前唯一**不需要 CarPlay entitlement** 就能在车机上显示内容的通道。
    ///
    ///   CarPlay 的「正在播放」是协议里的基础模板，任何车机（含 DiPlay 这类
    ///   开源接收端）都会实现它。它读的就是 MPNowPlayingInfoCenter：
    ///     · 标题 / 艺术家 / 播放状态 —— 纯文字
    ///     · 封面 —— MPMediaItemPropertyArtwork，可以放任意图片
    ///
    ///   所以我们把**当前页的渲染图**当作封面推过去，车机上就能看到这一页。
    ///
    ///   能走通的关键前提（现在都具备了）：
    ///     ① 音频会话配置成功  → AudioSessionConfig
    ///     ② 播放器确实在播    → load() 里的 player.play()
    ///     ③ 封面图存在        → PageStore 与 mp4 同目录写出的 p%03d.jpg
    private func updateNowPlaying() {
        var info: [String: Any] = [
            MPMediaItemPropertyTitle: "第 \(chapterIndex + 1) 章 · 第 \(currentPage + 1)/\(pageCount) 页",
            MPMediaItemPropertyArtist: bookTitle.isEmpty ? "CarNovel" : bookTitle,
            MPMediaItemPropertyAlbumTitle: "CarNovel",
            MPNowPlayingInfoPropertyPlaybackRate: 1.0,   // 声明"正在播放"，车机才会维持会话
            MPNowPlayingInfoPropertyIsLiveStream: true,  // 让系统不渲染可拖动进度条
        ]

        if let image = artworkImage(for: currentPage) {
            // boundsSize 给个大方值；系统会按车机实际的封面区域来要尺寸，
            // 回调里直接把整页图交给它，缩放由系统做。
            info[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { _ in
                image
            }
        }

        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }

    /// 取某一页的封面图（懒加载 + 只缓存最近几张，避免内存膨胀）
    private func artworkImage(for index: Int) -> UIImage? {
        if let cached = artworkCache[index] { return cached }

        guard pages.indices.contains(index) else { return nil }
        let url = PageStore.artworkURL(besideVideo: pages[index])
        guard let image = UIImage(contentsOfFile: url.path) else { return nil }

        if artworkCache.count >= 6 { artworkCache.removeAll() }
        artworkCache[index] = image
        return image
    }

    // MARK: - 方向盘 / 锁屏遥控

    private func registerRemoteCommands() {
        let center = MPRemoteCommandCenter.shared()

        // ★ 这一对就是车机方向盘的「上一曲 / 下一曲」短按。
        //   注意：长按由车机固件自己处理（快进/快退），不会到这里 ——
        //   所以我们不需要、也无法区分长短按。
        center.nextTrackCommand.isEnabled = true
        center.nextTrackCommand.addTarget { [weak self] _ in
            guard let self else { return .commandFailed }
            Task { @MainActor in self.nextPage() }
            return .success
        }

        center.previousTrackCommand.isEnabled = true
        center.previousTrackCommand.addTarget { [weak self] _ in
            guard let self else { return .commandFailed }
            Task { @MainActor in self.previousPage() }
            return .success
        }

        // 部分车型方向盘只有快进/快退，没有上一曲/下一曲，一并绑上。
        // 快进 = 下一页，快退 = 上一页，符合"按一下翻一页"的直觉。
        center.skipForwardCommand.isEnabled = true
        center.skipForwardCommand.preferredIntervals = [NSNumber(value: 1)]
        center.skipForwardCommand.addTarget { [weak self] _ in
            guard let self else { return .commandFailed }
            Task { @MainActor in self.nextPage() }
            return .success
        }

        center.skipBackwardCommand.isEnabled = true
        center.skipBackwardCommand.preferredIntervals = [NSNumber(value: 1)]
        center.skipBackwardCommand.addTarget { [weak self] _ in
            guard let self else { return .commandFailed }
            Task { @MainActor in self.previousPage() }
            return .success
        }

        // 播放/暂停保持可用 —— 用户可能想主动掐掉画面。
        // 之前把 play/pause 全关了，结果"手贱按了暂停"和"根本没在播"
        // 在车机屏上看起来一模一样，反而更难排查。这里放开。
        center.playCommand.isEnabled = true
        center.playCommand.addTarget { [weak self] _ in
            guard let self else { return .commandFailed }
            Task { @MainActor in self.player.play() }
            return .success
        }
        center.pauseCommand.isEnabled = true
        center.pauseCommand.addTarget { [weak self] _ in
            guard let self else { return .commandFailed }
            Task { @MainActor in self.player.pause() }
            return .success
        }
        center.togglePlayPauseCommand.isEnabled = true
        center.togglePlayPauseCommand.addTarget { [weak self] _ in
            guard let self else { return .commandFailed }
            Task { @MainActor in
                self.isPlaying ? self.player.pause() : self.player.play()
            }
            return .success
        }
        // 进度拖动仍然关掉 —— 单页视频拖时间轴没有意义
        center.changePlaybackPositionCommand.isEnabled = false
    }

    private func observeItemEnd() {
        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: nil,
            queue: .main
        ) { [weak self] note in
            Task { @MainActor in
                guard let self, let item = note.object as? AVPlayerItem else { return }
                // 非循环模式下：播完停住，不自动往下播（翻页由方向盘决定）
                if !self.loopsCurrentPage, item === self.player.currentItem {
                    self.player.pause()
                    self.statusText = "本页播完，等方向盘翻页"
                }
            }
        }
    }

    private func removeObservers() {
        if let observer = endObserver {
            NotificationCenter.default.removeObserver(observer)
            endObserver = nil
        }
    }

    deinit {
        if let observer = endObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}

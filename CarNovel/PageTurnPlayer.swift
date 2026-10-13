import AVKit
import MediaPlayer
import SwiftUI

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
//  ═══ 关键：这个 App 故意不申请 CarPlay entitlement ═══
//
//  正因为不是 CarPlay 应用，它不会出现在车机首页，车机屏上就不会有
//  上一曲/下一曲/播放暂停那一排控件来遮挡文字 —— 屏幕里只有一个纯视频画面。
//
//  代价：没有 CarPlay 场景，只能在 iPhone 上开 App 开始播放，
//  然后画面通过 AirPlay 视频镜像到车机。播放开始后手机可以息屏。
//  这正是我们想要的取舍。

@MainActor
final class PageTurnPlayer: ObservableObject {

    @Published private(set) var currentPage = 0
    @Published private(set) var pageCount = 0

    private let player = AVQueuePlayer()
    private var pages: [URL] = []
    private var bookID = ""
    private var chapterIndex = 0
    private var endObserver: NSObjectProtocol?

    var avPlayer: AVPlayer { player }

    // MARK: - 装载

    /// - Parameter urls: 按页序排列的单页视频文件（ch01_p001.mp4 … ch01_p018.mp4）
    func load(pages urls: [URL], bookID: String, chapterIndex: Int, startAt: Int = 0) {
        self.pages = urls
        self.pageCount = urls.count
        self.bookID = bookID
        self.chapterIndex = chapterIndex

        // 让画面能外放到 AirPlay 设备 —— 车机走的就是这条路
        player.allowsExternalPlayback = true

        // ★ 播完停在最后一帧，不自动切下一页。
        //   翻不翻页完全由方向盘决定，这就是"不用连播"。
        player.actionAtItemEnd = .pause

        removeObservers()
        buildItems(from: max(0, min(startAt, urls.count - 1)))

        observeItemEnd()
        registerRemoteCommands()
        updateNowPlaying()
    }

    private func buildItems(from index: Int) {
        player.removeAllItems()
        for url in pages[index...] {
            let item = AVPlayerItem(url: url)
            item.allowsExternalPlayback = true
            player.insert(item, after: nil)
        }
        currentPage = index
    }

    // MARK: - 翻页

    /// 下一页：让 AVQueuePlayer 前进一个媒体项，并立刻暂停在它的最后一帧。
    /// 之所以 advance + pause 而不是 play，是因为我们只想要"静止的一页"。
    func nextPage() {
        guard currentPage + 1 < pageCount else { return }
        player.advanceToNextItem()
        currentPage += 1

        if let item = player.currentItem {
            // 跳到这一页的末尾再停住 —— 单页视频只有 1 秒，
            // 直接停在末帧能确保画面完整显示，也不会触发自动播放。
            let end = item.duration
            if end.isNumeric {
                player.seek(to: end, toleranceBefore: .zero, toleranceAfter: .zero) { [weak self] _ in
                    self?.player.pause()
                }
            } else {
                player.pause()
            }
        }
        updateNowPlaying()
        saveProgress()
    }

    func previousPage() {
        guard currentPage > 0 else { return }
        let target = currentPage - 1
        // 队列只能往后推进，回退要重建队列
        buildItems(from: target)
        showCurrentFrame()
        updateNowPlaying()
        saveProgress()
    }

    /// 把当前页的画面摆出来（跳到末帧后暂停）
    private func showCurrentFrame() {
        guard let item = player.currentItem else { return }
        player.play()   // 先播放一下，让 AVPlayer 把这一帧解出来
        let end = item.duration
        if end.isNumeric {
            player.seek(to: end, toleranceBefore: .zero, toleranceAfter: .zero) { [weak self] _ in
                self?.player.pause()
            }
        }
    }

    /// 在 iPhone 上打开某一页（用于从书架续读）
    func jump(to page: Int) {
        guard pages.indices.contains(page) else { return }
        buildItems(from: page)
        showCurrentFrame()
        updateNowPlaying()
        saveProgress()
    }

    // MARK: - 进度

    private func saveProgress() {
        UserDefaults.standard.set(
            ["chapter": chapterIndex, "page": currentPage],
            forKey: "progress.\(bookID)"
        )
    }

    // MARK: - Now Playing 元数据

    /// 车机屏上看不到 UI，但锁屏/小组件上有个标题会比较友好。
    /// 这里只填最少的字段，不设 artwork —— artwork 可能触发某些车机的画面叠加。
    private func updateNowPlaying() {
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: "第 \(chapterIndex + 1) 章 · 第 \(currentPage + 1)/\(pageCount) 页",
            MPMediaItemPropertyArtist: "",
            MPNowPlayingInfoPropertyPlaybackRate: 0.0,   // 声明"未在播放"，避免误显进度条
            MPNowPlayingInfoPropertyIsLiveStream: true,  // 让系统不渲染可拖动进度条
        ]
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

        // ★ 显式关掉播放/暂停和进度拖动。
        //   我们要的是"静止的一页纸"，被误触播放会打乱翻页状态。
        center.playCommand.isEnabled = false
        center.pauseCommand.isEnabled = false
        center.togglePlayPauseCommand.isEnabled = false
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
                // 播完就停住 —— 不自动往下播
                if item === self.player.currentItem {
                    self.player.pause()
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

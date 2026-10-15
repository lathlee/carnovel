//
//  BackgroundKeepAlive.swift
//  CarNotify
//
//  让 App 在 iPhone 息屏 / 后台之后继续活着，服务器才不会死。
//
//  这就是「A 方案」相对 a-Shell 的**全部价值所在**：
//    a-Shell 是终端模拟器，没有后台模式声明，一切到后台就被冻结，
//    Python 服务器跟着停，快捷指令 POST 直接超时。
//
//  办法是 iOS 官方给的口子：UIBackgroundModes 里的 audio。
//  声明之后，只要进程在播音频（哪怕内容是数字静音），系统就不回收它。
//
//  代价与注意：
//  1. 控制中心 / CarPlay 的「正在播放」里会出现本 App。
//     用 .mixWithOthers 让车机上的音乐继续放，不抢播放权。
//  2. 播放的音量设成 0，用户听不到任何东西。
//  3. 来电等中断结束后系统不会自动恢复，得监听 interruption 通知重开。
//

import AVFoundation
import Foundation

final class BackgroundKeepAlive {

    static let shared = BackgroundKeepAlive()

    private(set) var active = false
    private(set) var lastMessage = "未启动"

    private var engine: AVAudioEngine?
    private var player: AVAudioPlayerNode?
    private var silence: AVAudioPCMBuffer?
    private var observer: NSObjectProtocol?

    private init() {}

    /// App 启动时调一次。重复调用安全。
    @discardableResult
    func start() -> Bool {
        if active, engine?.isRunning == true { return true }

        configureSession()
        buildEngine()
        startPlayback()
        installInterruptionObserver()

        active = (engine?.isRunning ?? false)
        if !active { lastMessage = "音频引擎启动失败" }
        return active
    }

    /// 从后台被唤醒 / 被打断之后调
    func ensureRunning() {
        if engine?.isRunning != true {
            start()
        } else if player?.isPlaying != true {
            startPlayback()
        }
    }

    func stop() {
        player?.stop()
        engine?.stop()
        active = false
        lastMessage = "已停止"
        try? AVAudioSession.sharedInstance().setActive(false,
                                                       options: .notifyOthersOnDeactivation)
    }

    // MARK: - 私有

    private func configureSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            // .mixWithOthers：不抢车机上正在放的音乐；
            // .duckOthers 不要 —— 那会把别人的音乐压低，很扰人。
            try session.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try session.setActive(true)
            lastMessage = "音频会话已激活"
        } catch {
            lastMessage = "音频会话失败：\(error.localizedDescription)"
        }
    }

    private func buildEngine() {
        guard engine == nil else { return }

        let e = AVAudioEngine()
        let p = AVAudioPlayerNode()

        // 采样率用 44100 单声道即可；输出设备是多少，mixer 会自己转换
        guard let format = AVAudioFormat(standardFormatWithSampleRate: 44100, channels: 1) else {
            lastMessage = "音频格式创建失败"
            return
        }

        // 1 秒的数字静音。全是 0 就是静音，不需要额外降音量。
        guard let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: 44100) else {
            lastMessage = "音频缓冲创建失败"
            return
        }
        buffer.frameLength = 44100
        if let channel = buffer.floatChannelData {
            for i in 0..<Int(buffer.frameLength) { channel[0][i] = 0 }
        }

        e.attach(p)
        e.connect(p, to: e.mainMixerNode, format: format)
        // 刻意不去动 mainMixerNode.outputVolume ——
        // buffer 本身就是全 0 的静音，不会有声音。
        // 把 mixer 音量设成 0 反而有风险：万一系统据此判定"没在播音频"，
        // 后台执行权可能被收回，那就白折腾了。

        engine = e
        player = p
        silence = buffer
    }

    private func startPlayback() {
        guard let e = engine, let p = player, let buffer = silence else { return }
        do {
            if !e.isRunning { try e.start() }
            p.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
            p.play()
            active = true
            lastMessage = "保活中（静音音频）"
        } catch {
            active = false
            lastMessage = "播放启动失败：\(error.localizedDescription)"
        }
    }

    private func installInterruptionObserver() {
        guard observer == nil else { return }
        observer = NotificationCenter.default.addObserver(
            forName: AVAudioSession.interruptionNotification,
            object: nil,
            queue: .main
        ) { [weak self] note in
            guard let self,
                  let raw = note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt,
                  let type = AVAudioSession.InterruptionType(rawValue: raw) else { return }

            switch type {
            case .began:
                self.lastMessage = "被系统中断（来电等）"
            case .ended:
                // 中断结束不会自动恢复，得自己来
                self.configureSession()
                self.ensureRunning()
            @unknown default:
                break
            }
        }
    }
}

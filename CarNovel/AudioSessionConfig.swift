import AVFoundation
import Foundation

// ═══════════════════════════════════════════════════════════════════
//  音频会话配置 —— 投屏能不能成功，成败全在这
// ═══════════════════════════════════════════════════════════════════
//
//  这是 v1 最致命的遗漏。App 原来没有 AVAudioSession 调用，导致
//  AVPlayer 播不起来，AirPlay 选单里只有音频设备。
//
//  v2 的问题：当 iPhone 已经连了 CarPlay 时，CarPlay 自己占着音频会话，
//  我们直接 `setActive(true)` 会失败。所以 v3 改成三级回退：
//
//    ① 标准：.playback + .moviePlayback + allowAirPlay/allowBluetoothA2DP
//       能激活最好，会话由我们独占，AirPlay 视频路由优先列出来。
//    ② 回退：加 .mixWithOthers
//       不强求独占，可能和 CarPlay 音频共存。激活成功就能投。
//    ③ 最后：只设 category/mode，不主动 setActive
//       让 AVPlayer.play() 自己激活；如果 CarPlay 已有会话，
//       AVPlayer 会加入/复用。category/mode 设对是关键。

enum AudioSessionConfig {

    struct ConfigureResult {
        var success = false
        var message = "未配置"
        var domainCode = ""
        var routeName = ""
    }

    private(set) static var lastResult = ConfigureResult()

    /// App 启动时调一次。重复调用安全。
    /// 返回最后一次实际尝试的结果。
    @discardableResult
    static func configure() -> ConfigureResult {
        let session = AVAudioSession.sharedInstance()

        // 第一级：标准独占配置
        if let r = tryActivate(session: session, options: [.allowAirPlay, .allowBluetoothA2DP]) {
            lastResult = r
            return r
        }

        // 第二级：允许与其它音频混合
        if let r = tryActivate(session: session, options: [.mixWithOthers]) {
            lastResult = r
            return r
        }

        // 第三级：只设 category/mode，不主动激活。
        // 让 AVPlayer.play() 自己处理激活；同时让系统知道我们要投视频。
        lastResult = setCategoryOnly(session: session)
        return lastResult
    }

    /// 起播前再确认一次（用户可能切过别的 App）
    @discardableResult
    static func activateForCasting() -> ConfigureResult {
        configure()
    }

    /// 供诊断面板读取的一份人类可读快照
    struct Snapshot {
        var category = "(未读取)"
        var mode = "(未读取)"
        var isActive = "(未知)"
        var outputName = "(无输出)"
        var outputType = "(无)"
        var outputPorts = 0
        var sampleRate: Double = 0
        var channelCount = 0
        var otherAudioPlaying = false
        var lastMessage = "(无)"
        var lastSuccess = false
        var lastDomainCode = ""
        var routeName = ""

        /// 类别和模式都对，才算是能投视频的状态
        var looksCastable: Bool {
            category.contains("Playback") && mode.contains("Movie")
        }
    }

    static func snapshot() -> Snapshot {
        let s = AVAudioSession.sharedInstance()
        let route = s.currentRoute
        let out = route.outputs.first
        var snap = Snapshot()
        snap.category = s.category.rawValue
        snap.mode = s.mode.rawValue
        // isActive 没有公开 API，用我们最后一次配置结果近似表达
        snap.isActive = lastResult.success ? "已激活（\(lastResult.message)）" : "激活失败"
        snap.outputName = out?.portName ?? "(无输出)"
        snap.outputType = describe(out?.portType)
        snap.outputPorts = route.outputs.count
        snap.sampleRate = s.sampleRate
        snap.channelCount = s.outputNumberOfChannels
        snap.otherAudioPlaying = s.isOtherAudioPlaying
        snap.lastMessage = lastResult.message
        snap.lastSuccess = lastResult.success
        snap.lastDomainCode = lastResult.domainCode
        snap.routeName = lastResult.routeName
        return snap
    }

    // MARK: - 私有回退逻辑

    private static func tryActivate(session: AVAudioSession,
                                    options: AVAudioSession.CategoryOptions) -> ConfigureResult? {
        do {
            try session.setCategory(.playback, mode: .moviePlayback, options: options)
            try session.setActive(true)
            let out = session.currentRoute.outputs.first
            return ConfigureResult(
                success: true,
                message: "OK (options=\(options.rawValue))",
                domainCode: "",
                routeName: out?.portName ?? "(无输出)"
            )
        } catch {
            let ns = error as NSError
            // 返回 nil 表示这一级没成功，让外层继续 fallback
            return nil
        }
    }

    private static func setCategoryOnly(session: AVAudioSession) -> ConfigureResult {
        do {
            try session.setCategory(.playback, mode: .moviePlayback, options: [.mixWithOthers])
            let out = session.currentRoute.outputs.first
            return ConfigureResult(
                success: true,
                message: "已设 category/mode，未主动 setActive（AVPlayer 将接管）",
                domainCode: "",
                routeName: out?.portName ?? "(无输出)"
            )
        } catch {
            let ns = error as NSError
            return ConfigureResult(
                success: false,
                message: error.localizedDescription,
                domainCode: "\(ns.domain) code=\(ns.code)",
                routeName: ""
            )
        }
    }

    static func describe(_ type: AVAudioSession.Port?) -> String {
        guard let type else { return "(无)" }
        switch type {
        case .airPlay: return "AirPlay"
        case .carAudio: return "CarPlay 车载"
        case .builtInSpeaker: return "内置扬声器"
        case .builtInReceiver: return "听筒"
        case .headphones: return "有线耳机"
        case .bluetoothA2DP, .bluetoothLE: return "蓝牙"
        case .HDMI: return "HDMI"
        case .usbAudio: return "USB 音频"
        default: return type.rawValue
        }
    }
}

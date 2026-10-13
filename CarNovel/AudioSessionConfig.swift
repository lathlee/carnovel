import AVFoundation
import Foundation

// ═══════════════════════════════════════════════════════════════════
//  音频会话配置 —— 投屏能不能成功，成败全在这
// ═══════════════════════════════════════════════════════════════════
//
//  ⚠️ 这是 v1 最致命的遗漏。
//
//  之前的版本整个 App 里没有一处 AVAudioSession 调用，后果是：
//    · AVPlayer 没有可用的音频会话，播放根本起不来
//    · 系统认为"这个 App 没有任何媒体在播"
//    · 于是 AVRoutePickerView 里没有任何可投的内容，
//      只能列出系统默认的音频路由（iPhone 扬声器 / CarPlay 车载）
//
//  这就是"点了投屏没反应、列表里只有音频设备"的真正原因。
//
//  ▸ category = .playback
//      允许后台播放 + 允许 AirPlay 外放。用 .ambient 是投不出去的。
//  ▸ mode = .moviePlayback
//      声明"这是视频内容"，系统才会把视频设备列进 AirPlay 选单。
//      用默认的 .default 模式，选单里只会出现音频设备。
//  ▸ setActive(true)
//      必须显式激活，否则会话只是"配置好了"但没生效。

enum AudioSessionConfig {

    /// 配置并激活。App 启动时调一次，起播前再确认一次。
    /// 重复调用是安全的。
    @discardableResult
    static func configure() -> Bool {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(
                .playback,
                mode: .moviePlayback,
                options: [.allowAirPlay, .allowBluetoothA2DP]
            )
            try session.setActive(true)
            return true
        } catch {
            // 不崩。失败时诊断面板会把状态显示出来。
            print("[AudioSession] 配置失败: \(error)")
            return false
        }
    }

    /// 起播前再确保一次（用户可能中途切过别的 App 的音频）
    @discardableResult
    static func activateForCasting() -> Bool {
        configure()
    }

    /// 供诊断面板读取的一份人类可读快照
    struct Snapshot {
        var category = "(未读取)"
        var mode = "(未读取)"
        var outputName = "(未读取)"
        var outputType = "(未读取)"
        var outputPorts = 0
        var sampleRate: Double = 0
        var channelCount = 0
        var otherAudioPlaying = false

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
        snap.outputName = out?.portName ?? "(无输出)"
        snap.outputType = describe(out?.portType)
        snap.outputPorts = route.outputs.count
        snap.sampleRate = s.sampleRate
        snap.channelCount = s.outputNumberOfChannels
        snap.otherAudioPlaying = s.isOtherAudioPlaying
        return snap
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

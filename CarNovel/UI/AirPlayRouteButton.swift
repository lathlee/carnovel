import AVKit
import SwiftUI
import UIKit

// ═══════════════════════════════════════════════════════════════════
//  AirPlay 路由按钮
// ═══════════════════════════════════════════════════════════════════
//
//  SwiftUI 至今没有官方的 AirPlay 路由按钮，只能用 AVRoutePickerView 包一层。
//  这个按钮点开就是系统 AirPlay 选单。
//
//  ⚠️ 一个关键点：AVRoutePickerView 的按钮是它自带的，我们只能改 tint 颜色，
//     没法换成自己的 SF Symbol。所以别指望它长成自定义图标的样子。
//
//  ⚠️ 选单里"能看到什么"，取决于两件事（v1 两件都做错了，见 git log）：
//     ① 音频会话：必须是以 .playback / .moviePlayback 激活的会话，
//        否则选单里只有音频设备，没有视频设备。→ AudioSessionConfig.swift
//     ② 是否真的在播：暂停状态下系统认为"没有可投内容"，
//        选单会退化成一串音频路由。→ PageTurnPlayer.load() 里会起播
//
//  ⚠️ 还有一层不是我们能改的：车机本身是否支持 AirPlay 视频。
//     iOS 26 起 Apple 允许了，但需要**车厂在车机端集成**。
//     选单里出现车机、但投上去没反应，多半就是这一层。
//     诊断面板 → UI/RouteDiagnosticsView.swift

struct AirPlayRouteButton: UIViewRepresentable {

    /// 是否优先列出视频设备（车机屏属于这一类）
    var prioritizesVideoDevices: Bool = true

    func makeUIView(context: Context) -> AVRoutePickerView {
        let view = AVRoutePickerView()
        view.tintColor = .label
        view.activeTintColor = .systemBlue
        view.prioritizesVideoDevices = prioritizesVideoDevices
        // 让它自己撑满容器，SwiftUI 那边用 .frame 控制大小
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }

    func updateUIView(_ uiView: AVRoutePickerView, context: Context) {
        uiView.prioritizesVideoDevices = prioritizesVideoDevices
    }
}

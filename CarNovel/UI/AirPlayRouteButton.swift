import AVKit
import SwiftUI
import UIKit

// ═══════════════════════════════════════════════════════════════════
//  AirPlay 路由按钮
// ═══════════════════════════════════════════════════════════════════
//
//  SwiftUI 至今没有官方的 AirPlay 路由按钮，只能用 AVRoutePickerView 包一层。
//  这个按钮点开就是系统 AirPlay 选单 —— 车机屏会出现在里面（前提是车机屏
//  分辨率 ≥ 1920×1080，否则根本不会列出）。
//
//  ⚠️ 一个关键点：AVRoutePickerView 的按钮是它自带的，我们只能改 tint 颜色，
//     没法换成自己的 SF Symbol。所以别指望它长成自定义图标的样子。
//
//  ⚠️ 另一个坑：AVRoutePickerView 默认只列「音频」路由。视频要外放到车机，
//     必须把 prioritizesVideoDevices 设成 true，否则选单里看不到车机屏。

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

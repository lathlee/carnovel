import AVFoundation
import SwiftUI

//  CarNovel —— App 入口
//
//  注意：这里**没有** CarPlay 场景代理（CPTemplateApplicationSceneDelegate），
//  也没有 CarPlay entitlement。这是刻意的 —— 车机屏上要保持零控件。

@main
struct CarNovelApp: App {

    init() {
        // ★★ 必须调用，否则方向盘的「上一曲 / 下一曲」事件收不到。
        //    这是这类项目最容易漏的一步。
        UIApplication.shared.beginReceivingRemoteControlEvents()

        // ★★ 同样必须：没有音频会话，AVPlayer 起不来，
        //     AirPlay 路由选单里也没有任何可投内容。
        //     见 AudioSessionConfig.swift 顶部说明。
        AudioSessionConfig.configure()
    }

    var body: some Scene {
        WindowGroup {
            LibraryView()
        }
        .modelContainer(for: [ShelfBook.self, ReadingRecord.self])
    }
}

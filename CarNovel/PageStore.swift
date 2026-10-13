//
//  PageStore.swift
//  CarNovel
//
//  单页视频的生成与缓存。
//
//  为什么要"每页一个 mp4"而不是"整章一个 mp4"：
//  见 PageTurnPlayer.swift 顶部的说明 —— 方向盘上一曲/下一曲操作的是
//  播放列表里的**媒体项**，所以每页必须是一个独立媒体项。
//
//  尺寸参考：一页 1 秒的 1080p HEVC 静止画面 ≈ 180 KB。
//  一章 20 页 ≈ 3.6 MB。按章按需生成 + 落盘缓存，不要整本预生成。
//

import AVFoundation
import CoreGraphics
import Foundation

actor PageStore {

    private let root: URL
    private let ffmpegSize = CGSize(width: 1920, height: 1080)

    init() {
        let caches = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        root = caches.appendingPathComponent("PageVideos", isDirectory: true)
        try? FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    }

    // MARK: - 对外接口

    /// 取某一章的整页视频列表；没有就现场生成。
    /// 返回按页序排好的 URL 数组，可直接喂给 PageTurnPlayer。
    ///
    /// - Parameter progress: 进度回调（已完成页数, 总页数），用于界面显示排版进度。
    func pages(for bookID: String, chapter: Int, text: String,
               style: PageStyle, seconds: Double = 1.0,
               progress: (@Sendable (Int, Int) -> Void)? = nil) async throws -> [URL] {
        let dir = folder(bookID: bookID, chapter: chapter)

        // 已生成过就直接用
        if let cached = existingPages(in: dir) {
            progress?(cached.count, cached.count)
            return cached
        }

        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)

        let rendered = Paginator.paginate(text, style: style)
        guard !rendered.isEmpty else { return [] }

        progress?(0, rendered.count)

        var urls: [URL] = []
        for page in rendered {
            let url = dir.appendingPathComponent(String(format: "p%03d.mp4", page.index + 1))
            try await writeSinglePageVideo(page.image, to: url, seconds: seconds)
            urls.append(url)
            progress?(urls.count, rendered.count)
        }
        return urls
    }

    /// 暴露章节目录路径（调试 / 预生成用）
    func folderURL(bookID: String, chapter: Int) -> URL {
        folder(bookID: bookID, chapter: chapter)
    }

    /// 某本书已缓存的章节数（清理界面用）
    func cachedChapterCount(bookID: String) -> Int {
        let safe = bookID.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? bookID
        let bookDir = root.appendingPathComponent(safe, isDirectory: true)
        guard let dirs = try? FileManager.default.contentsOfDirectory(
            at: bookDir, includingPropertiesForKeys: nil
        ) else { return 0 }
        return dirs.filter { $0.lastPathComponent.hasPrefix("ch") }.count
    }

    func clear(bookID: String) {
        let safe = bookID.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? bookID
        try? FileManager.default.removeItem(at: root.appendingPathComponent(safe, isDirectory: true))
    }

    func clearAll() {
        try? FileManager.default.removeItem(at: root)
        try? FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    }

    func diskUsage() -> Int64 {
        guard let e = FileManager.default.enumerator(at: root,
                                                     includingPropertiesForKeys: [.fileSizeKey])
        else { return 0 }
        var total: Int64 = 0
        for case let url as URL in e {
            total += Int64((try? url.resourceValues(forKeys: [.fileSizeKey]).fileSize) ?? 0)
        }
        return total
    }

    // MARK: - 私有

    private func folder(bookID: String, chapter: Int) -> URL {
        let safe = bookID.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? bookID
        return root.appendingPathComponent("\(safe)/ch\(chapter)", isDirectory: true)
    }

    private func existingPages(in dir: URL) -> [URL]? {
        guard let files = try? FileManager.default.contentsOfDirectory(
            at: dir, includingPropertiesForKeys: nil
        ) else { return nil }

        let mp4s = files
            .filter { $0.pathExtension.lowercased() == "mp4" }
            .sorted { $0.lastPathComponent < $1.lastPathComponent }

        return mp4s.isEmpty ? nil : mp4s
    }

    /// 把一张位图写成一个 1 秒的 HEVC mp4。
    ///
    /// 用 AVAssetWriter 逐帧写：先写 1 帧关键帧，再补几帧重复帧撑到指定时长。
    /// 不用 AVAssetWriter 的"单帧 + 超长时长"是因为部分播放器对超稀疏的时间轴
    /// 处理不一致，写几帧更保险。
    private func writeSinglePageVideo(_ image: CGImage, to url: URL,
                                      seconds: Double, fps: Int32 = 2) async throws {
        try? FileManager.default.removeItem(at: url)

        let writer = try AVAssetWriter(outputURL: url, fileType: .mp4)

        let settings: [String: Any] = [
            AVVideoCodecKey: AVVideoCodecType.hevc,
            AVVideoWidthKey: Int(ffmpegSize.width),
            AVVideoHeightKey: Int(ffmpegSize.height),
            AVVideoCompressionPropertiesKey: [
                AVVideoAverageBitRateKey: 2_000_000,
                AVVideoMaxKeyFrameIntervalKey: 1,   // 单页视频，全关键帧，seek 无代价
                AVVideoProfileLevelKey: "HEVC_Main_AutoLevel",
            ],
        ]

        let input = AVAssetWriterInput(mediaType: .video, outputSettings: settings)
        input.expectsMediaDataInRealTime = false

        let adaptor = AVAssetWriterInputPixelBufferAdaptor(
            assetWriterInput: input,
            sourcePixelBufferAttributes: [
                kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
                kCVPixelBufferWidthKey as String: Int(ffmpegSize.width),
                kCVPixelBufferHeightKey as String: Int(ffmpegSize.height),
                kCVPixelBufferCGImageCompatibilityKey as String: true,
                kCVPixelBufferCGBitmapContextCompatibilityKey as String: true,
            ]
        )

        guard writer.canAdd(input) else { throw PageStoreError.cannotAddInput }
        writer.add(input)

        // 静音音轨：没有音轨时 AirPlay 视频路由和方向盘媒体键都可能不生效
        let audioSettings: [String: Any] = [
            AVFormatIDKey: kAudioFormatMPEG4AAC,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100,
            AVEncoderBitRateKey: 64_000,
        ]
        let audioInput = AVAssetWriterInput(mediaType: .audio, outputSettings: audioSettings)
        audioInput.expectsMediaDataInRealTime = false
        if writer.canAdd(audioInput) { writer.add(audioInput) }

        writer.startWriting()
        writer.startSession(atSourceTime: .zero)

        guard let pool = adaptor.pixelBufferPool else { throw PageStoreError.poolUnavailable }

        let frameCount = max(1, Int((seconds * Double(fps)).rounded()))
        for i in 0..<frameCount {
            while !input.isReadyForMoreMediaData {
                try await Task.sleep(nanoseconds: 2_000_000)
            }
            let buffer = try makeBuffer(from: image, pool: pool)
            let pts = CMTime(value: CMTimeValue(i), timescale: fps)
            guard adaptor.append(buffer, withPresentationTime: pts) else {
                throw writer.error ?? PageStoreError.appendFailed
            }
        }

        input.markAsFinished()

        // 补一段静音 AAC，让容器里确实有音轨
        try await appendSilence(to: audioInput, seconds: seconds)
        audioInput.markAsFinished()

        await writer.finishWriting()
        if let error = writer.error { throw error }
    }

    private func makeBuffer(from image: CGImage, pool: CVPixelBufferPool) throws -> CVPixelBuffer {
        var pb: CVPixelBuffer?
        guard CVPixelBufferPoolCreatePixelBuffer(nil, pool, &pb) == kCVReturnSuccess,
              let buffer = pb else { throw PageStoreError.bufferUnavailable }

        CVPixelBufferLockBaseAddress(buffer, [])
        defer { CVPixelBufferUnlockBaseAddress(buffer, []) }

        guard let base = CVPixelBufferGetBaseAddress(buffer),
              let ctx = CGContext(
                data: base,
                width: CVPixelBufferGetWidth(buffer),
                height: CVPixelBufferGetHeight(buffer),
                bitsPerComponent: 8,
                bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
                space: CGColorSpaceCreateDeviceRGB(),
                bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
              ) else { throw PageStoreError.contextUnavailable }

        ctx.draw(image, in: CGRect(origin: .zero, size: ffmpegSize))
        return buffer
    }

    /// 写入静音 PCM→AAC 样本。
    private func appendSilence(to input: AVAssetWriterInput, seconds: Double) async throws {
        let sampleRate = 44100.0
        let totalFrames = Int(sampleRate * seconds)
        let framesPerBuffer = 1024
        var written = 0

        var asbd = AudioStreamBasicDescription(
            mSampleRate: sampleRate,
            mFormatID: kAudioFormatLinearPCM,
            mFormatFlags: kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked,
            mBytesPerPacket: 4, mFramesPerPacket: 1, mBytesPerFrame: 4,
            mChannelsPerFrame: 2, mBitsPerChannel: 16, mReserved: 0
        )
        var format: CMAudioFormatDescription?
        CMAudioFormatDescriptionCreate(allocator: kCFAllocatorDefault,
                                       asbd: &asbd, layoutSize: 0, layout: nil,
                                       magicCookieSize: 0, magicCookie: nil,
                                       extensions: nil, formatDescriptionOut: &format)
        guard let formatDescription = format else { return }

        while written < totalFrames {
            while !input.isReadyForMoreMediaData {
                try await Task.sleep(nanoseconds: 2_000_000)
            }
            let count = min(framesPerBuffer, totalFrames - written)

            var block: CMBlockBuffer?
            let byteCount = count * 4
            guard CMBlockBufferCreateWithMemoryBlock(
                allocator: kCFAllocatorDefault, memoryBlock: nil,
                blockLength: byteCount, blockAllocator: kCFAllocatorDefault,
                customBlockSource: nil, offsetToData: 0, dataLength: byteCount,
                flags: 0, blockBufferOut: &block
            ) == kCMBlockBufferNoErr, let blockBuffer = block else { break }

            CMBlockBufferFillDataBytes(with: 0, blockBuffer: blockBuffer,
                                       offsetIntoDestination: 0, dataLength: byteCount)

            var sample: CMSampleBuffer?
            var timing = CMSampleTimingInfo(
                duration: CMTime(value: 1, timescale: CMTimeScale(sampleRate)),
                presentationTimeStamp: CMTime(value: CMTimeValue(written),
                                              timescale: CMTimeScale(sampleRate)),
                decodeTimeStamp: .invalid
            )
            CMSampleBufferCreateReady(
                allocator: kCFAllocatorDefault, dataBuffer: blockBuffer,
                formatDescription: formatDescription, sampleCount: count,
                sampleTimingEntryCount: 1, sampleTimingArray: &timing,
                sampleSizeEntryCount: 0, sampleSizeArray: nil,
                sampleBufferOut: &sample
            )
            if let sampleBuffer = sample, !input.append(sampleBuffer) { break }
            written += count
        }
    }

    enum PageStoreError: LocalizedError {
        case cannotAddInput, poolUnavailable, bufferUnavailable, contextUnavailable, appendFailed

        var errorDescription: String? {
            switch self {
            case .cannotAddInput: "无法添加视频轨"
            case .poolUnavailable: "像素缓冲池创建失败"
            case .bufferUnavailable: "取像素缓冲失败"
            case .contextUnavailable: "位图上下文创建失败"
            case .appendFailed: "写入帧失败"
            }
        }
    }
}

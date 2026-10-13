import CoreText
import UIKit

// 车机屏观看距离约 60-80cm，字号必须比手机大得多。
// 1920×1080 画布上 64pt 的观感 ≈ 手机 22pt。别按手机习惯给 17pt，上车完全看不清。

/// 排版样式。
/// 标 Sendable 是因为它要作为参数传进 PageStore（actor）——
/// Swift 6 的严格并发检查会拒绝跨隔离域传非 Sendable 值。
struct PageStyle: Sendable {
    var canvas = CGSize(width: 1920, height: 1080)
    var fontName = "PingFangSC-Regular"
    var fontSize: CGFloat = 64
    var lineSpacing: CGFloat = 28
    var paragraphSpacing: CGFloat = 16
    var margin: CGFloat = 96
    var textColor: UIColor = .white
    var backgroundColor: UIColor = .black
    var showsPageNumber = true

    // 深色背景 + 白字在车机上最省眼，也最适合 OLED 屏。想换浅色自己改上面两行。
    static let car = PageStyle()
}

/// CoreText 分页结果。image 是 CGImage（线程安全），text 是纯值 —— 可安全跨 actor。
struct NovelPage: Sendable {
    let index: Int
    let image: CGImage
    let text: String
}

enum Paginator {

    /// 把整章文本按 `style` 切页并渲染成位图。
    /// 纯 CoreText 实现，不走 UIKit 绘制 —— 因此**不需要翻转坐标系**。
    /// （常见坑：网上大部分示例为了配 NSAttributedString.draw 做了 translate+scale 翻转，
    ///  而 CTFrameDraw / CTLineDraw 本身就是左下角原点，翻了反而倒着画。）
    ///
    /// 标 nonisolated：它是无状态的纯函数，被 actor（PageStore）调用时
    /// 不该要求切换到主线程。
    nonisolated static func paginate(_ text: String, style: PageStyle = .car) -> [NovelPage] {
        let font = CTFontCreateWithName(style.fontName as CFString, style.fontSize, nil)

        let para = NSMutableParagraphStyle()
        para.lineSpacing = style.lineSpacing
        para.paragraphSpacing = style.paragraphSpacing
        para.lineBreakMode = .byWordWrapping

        let attrs: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: style.textColor,
            .paragraphStyle: para,
        ]
        let attributed = NSAttributedString(string: text, attributes: attrs)
        let framesetter = CTFramesetterCreateWithAttributedString(attributed)

        let content = CGRect(
            x: style.margin,
            y: style.margin,
            width: style.canvas.width - style.margin * 2,
            height: style.canvas.height - style.margin * 2
        )

        var pages: [NovelPage] = []
        var cursor = 0
        let total = attributed.length
        let nsText = text as NSString

        while cursor < total {
            let path = CGPath(rect: content, transform: nil)
            let frame = CTFramesetterCreateFrame(
                framesetter,
                CFRange(location: cursor, length: 0),
                path,
                nil
            )

            // 关键：framesetter 自己决定这一页能放下多少字。
            // 不要自己按「每页 N 字」硬切 —— 中英混排 + 标点避头尾会让行数不准。
            let visible = CTFrameGetVisibleStringRange(frame)
            guard visible.length > 0 else { break }

            let chunk = nsText.substring(with: NSRange(location: cursor, length: visible.length))
            let image = render(frame: frame, pageNumber: pages.count + 1, style: style)

            pages.append(NovelPage(index: pages.count, image: image, text: chunk))
            cursor += visible.length
        }

        return pages
    }

    // MARK: - private

    private static func render(frame: CTFrame, pageNumber: Int, style: PageStyle) -> CGImage {
        let w = Int(style.canvas.width)
        let h = Int(style.canvas.height)

        guard let ctx = CGContext(
            data: nil,
            width: w,
            height: h,
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        ) else {
            fatalError("无法创建位图上下文")
        }

        ctx.setFillColor(style.backgroundColor.cgColor)
        ctx.fill(CGRect(x: 0, y: 0, width: w, height: h))

        ctx.textMatrix = .identity
        CTFrameDraw(frame, ctx)

        if style.showsPageNumber {
            drawPageNumber(pageNumber, in: ctx, style: style)
        }

        guard let image = ctx.makeImage() else {
            fatalError("位图导出失败")
        }
        return image
    }

    private static func drawPageNumber(_ number: Int, in ctx: CGContext, style: PageStyle) {
        let font = CTFontCreateWithName(style.fontName as CFString, style.fontSize * 0.55, nil)
        let attrs: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: style.textColor.withAlphaComponent(0.5),
        ]
        let line = CTLineCreateWithAttributedString(
            NSAttributedString(string: "— \(number) —", attributes: attrs)
        )
        let bounds = CTLineGetBoundsWithOptions(line, .useOpticalBounds)

        // 左下角原点，所以 y 取小值 = 屏幕下方
        ctx.textPosition = CGPoint(x: (style.canvas.width - bounds.width) / 2, y: style.margin * 0.45)
        CTLineDraw(line, ctx)
    }
}

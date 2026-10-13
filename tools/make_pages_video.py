#!/usr/bin/env python3
"""
小说 TXT → CarPlay 可投屏的 HEVC 视频（Windows 参考实现）

这套脚本和 carplay-novel/CarNovel/ 里的 Swift 代码逻辑一一对应，
作用是先在 Windows 上把整条链路跑通、验证车机能不能放，
Swift 版留给最终的 iPhone App。

  Paginator.swift       -> load_txt() / split_chapters() / wrap_units() / paginate() / render_page()
  PageVideoWriter.swift -> encode_video()

关键参数（都是为了过车机那一关）:
  - 1920x1080 横屏     : 车机屏低于这个分辨率 AirPlay 视频根本不出现
  - H.265 / HEVC       : H.264 会被拒
  - -tag:v hvc1        : 不加这个 Apple 系设备不认 HEVC，必踩
  - keyint=1           : 每帧都是关键帧 -> 任意页 seek 瞬时，翻页不卡
  - 静音 AAC 音轨       : 没有音轨时 AirPlay 视频路由和方向盘媒体键都可能不生效

用法:
  python make_pages_video.py --input "D:/D/Personal/凡人修仙传.txt" --chapter 1 --pages 12
"""

import argparse
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

# ---------------------------------------------------------------- 版面常量

W, H = 1920, 1080          # 横屏，车机硬门槛
MARGIN_L = 110
MARGIN_R = 110
HEADER_Y = 62
CONTENT_TOP = 140
LINE_H = 114               # 72px 字号 × 1.58 行距
LINES_PER_PAGE = 7
PAGE_NUM_Y = 1000          # 底部留 60px 安全区：车机屏下沿常被边框/遮光板挡掉一截

BG = (0, 0, 0)
FG = (255, 255, 255)
DIM = (122, 122, 122)      # 章节名
DIM2 = (105, 105, 105)     # 页码

FONT_PATH = r"C:\Windows\Fonts\msyhbd.ttc"   # 微软雅黑 Bold
SIZE_BODY = 72             # 「字稍大」—— 1080p 画布上 72px ≈ 手机 22pt 的观感
SIZE_META = 38

# 避头尾：这些字符不能落在行首 / 行尾
NO_START = set("。，、；：？！）】》」』”’…—·%℃〉")
NO_END = set("（【《「『“‘〈")


# ---------------------------------------------------------------- 文本处理

def load_txt(path: Path) -> str:
    raw = path.read_bytes()
    for enc in ("utf-8-sig", "utf-8", "gb18030"):
        try:
            return raw.decode(enc)
        except UnicodeDecodeError:
            continue
    raise SystemExit("无法识别文件编码（试过 utf-8 / gb18030）")


# 章节标记与卷标记必须分开 —— 很多 TXT 里「卷名」也独立成行（第十卷 / 第二卷）。
# 混用会切出一堆伪章节。实测《凡人修仙传》：
#   混用 → 2495 条，分开 → 1554 条，差的 941 条全是卷。
CHAPTER_PATTERNS = [
    r"^第\s*[0-9０-９一二三四五六七八九十百千万零两]+\s*[章回节]\s*[:：.、]?\s*\S*$",
    r"^正文\s*第\s*[0-9０-９一二三四五六七八九十百千万零两]+\s*[章回节卷篇].*$",
    r"^Chapter\s+\d+.*$",
]
VOLUME_PATTERNS = [
    r"^第\s*[0-9０-９一二三四五六七八九十百千万零两]+\s*[卷篇]\s*[:：.、]?\s*\S*$",
    r"^[卷篇]\s*[0-9０-９一二三四五六七八九十百千万零两]+.*$",
]

# 章号提取。★ 必须取**最后一个**「第X章」——
# 「第六卷通天灵宝第九百九十一章」里既有卷号又有章号，取第一个会拿到 6，跟 991 对不上。
_CH_NUM = re.compile(r"第\s*([0-9０-９]+|[一二三四五六七八九十百千万零两]+)\s*[章回节]")
_CH_NUM_LOOSE = re.compile(r"([0-9０-９]{1,4}|[一二三四五六七八九十百千万零两]{1,10})\s*[章回节]")

_CN_DIGIT = {"零": 0, "一": 1, "二": 2, "两": 2, "三": 3, "四": 4,
             "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
_CN_UNIT = {"十": 10, "百": 100, "千": 1000}

STUB_THRESHOLD = 80          # 正文少于这个字数视为脏数据残渣，并进上一章
MAX_CHARS_PER_CHAPTER = 12000  # 超长章（源文件缺标记）按字数再切


def _cn_to_int(s: str):
    total = section = current = 0
    saw = False
    for ch in s:
        if ch in _CN_DIGIT:
            current = _CN_DIGIT[ch]
            saw = True
        elif ch in _CN_UNIT:
            section += (current or 1) * _CN_UNIT[ch]
            current = 0
            saw = True
        elif ch == "万":
            section = (section + current) * 10000
            total += section
            section = current = 0
            saw = True
        else:
            return None
    return total + section + current if saw else None


def _normalize_number(raw: str) -> str:
    """阿拉伯数字和中文数字统一，让「第2151章」和「第两千一百五十一章」能对上。"""
    s = raw.strip()
    if s.isdigit():
        return str(int(s))
    half = "".join(chr(0x30 + int(c)) if c.isdigit() else c for c in s)
    if half.isdigit():
        return str(int(half))
    value = _cn_to_int(s)
    return str(value) if value is not None else s


def _chapter_key(title: str):
    for regex in (_CH_NUM, _CH_NUM_LOOSE):     # 严格模式抓不到时放宽（有些章名丢了"第"字）
        matches = list(regex.finditer(title))
        if matches:
            return _normalize_number(matches[-1].group(1))
    return None


def split_chapters(text: str):
    """
    按「第X章」切分。返回 [(标题, 正文), ...]

    三级兜底，都是从《凡人修仙传》那个脏 TXT 上实测出来的：

      1. 去重：同一个章常有两条标记（「第六卷通天灵宝第九百九十一章紫雾」
         和「第九百九十一章紫雾」），只保留最后一条，否则中间夹的内容会变空章。
      2. 合并残渣：正文 < 80 字的章并进上一章。源文件脏法太多，正则修不完，
         只保证「阅读不断」。
      3. 切超长章：源文件有整段缺章标记的情况（实测最大 94.9 万字），
         按 12000 字再切，后续块标「（续 N）」。

    实测效果（1554 章的真实文件）：空章 97 → 0，章数 2592 → 1770。
    """
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    lines = [l.strip() for l in text.split("\n")]

    def scan(patterns):
        compiled = [re.compile(p) for p in patterns]
        return [i for i, l in enumerate(lines)
                if l and len(l) <= 40 and any(c.match(l) for c in compiled)]

    chapter_hits = scan(CHAPTER_PATTERNS)
    volume_hits = scan(VOLUME_PATTERNS)

    # 优先章标记；只有整本一个章标记都没有时才退回卷标记。绝不混用。
    marks = chapter_hits if len(chapter_hits) >= 3 else sorted(set(chapter_hits + volume_hits))
    if not marks:
        body = "\n".join(lines).strip()
        return [("正文", body)] if body else []

    def body_len(a, b):
        return sum(len(lines[j]) for j in range(a + 1, b)) if a + 1 < b else 0

    # --- 1. 去重 ---
    kept = [marks[0]]
    for i in range(1, len(marks)):
        prev, cur = kept[-1], marks[i]
        ka, kb = _chapter_key(lines[prev]), _chapter_key(lines[cur])
        if body_len(prev, cur) < 40 and ka and ka == kb:
            kept[-1] = cur          # 前一条是「卷名+章号」的重复标记，丢掉
        else:
            kept.append(cur)

    raw = []
    # 首个章标记之前的内容（书名、作者、简介）。
    # 只在够长时才单列一章 —— 通常只有两三行，单独成章体验很差，
    # 而且会把 --chapter 的序号整体推后一位。
    if kept[0] > 0:
        head = "\n".join(lines[:kept[0]]).strip()
        if len(head) >= STUB_THRESHOLD * 2:
            raw.append(("卷首", head))

    for n, start in enumerate(kept):
        end = kept[n + 1] if n + 1 < len(kept) else len(lines)
        raw.append((lines[start], "\n".join(l for l in lines[start + 1:end] if l)))

    # --- 2. 合并残渣 ---
    merged = []
    for title, body in raw:
        if len(body) < STUB_THRESHOLD and merged:
            if body:
                merged[-1][1] += "\n" + body
        else:
            merged.append([title, body])

    # --- 3. 切超长章 ---
    out = []
    for title, body in merged:
        # 极短的开头不单独成章，接进第一章
        if len(body) < STUB_THRESHOLD and out:
            out[-1] = (out[-1][0], out[-1][1] + ("\n" + body if body else ""))
            continue

        if len(body) <= MAX_CHARS_PER_CHAPTER:
            out.append((title, body))
            continue

        buf, part = "", 1

        def flush():
            nonlocal buf, part
            if not buf:
                return
            out.append((title if part == 1 else f"{title}（续 {part}）", buf))
            part += 1
            buf = ""

        for para in body.split("\n"):
            while len(para) > MAX_CHARS_PER_CHAPTER:      # 单段超限，硬切
                flush()
                buf, para = para[:MAX_CHARS_PER_CHAPTER], para[MAX_CHARS_PER_CHAPTER:]
                flush()
            if len(buf) + len(para) + 1 > MAX_CHARS_PER_CHAPTER:
                flush()
            buf += ("" if not buf else "\n") + para
        flush()

    return [(t, b) for t, b in out if b]


def tokenize(s: str):
    """
    切成排版单元：CJK 字符和标点各算一个单元，
    连续的 ASCII 字母/数字算一个单元（避免把英文单词从中间截断）。
    """
    units, buf = [], ""
    for ch in s:
        if ch.isascii() and (ch.isalnum() or ch in "._-'/@&+"):
            buf += ch
        else:
            if buf:
                units.append(buf)
                buf = ""
            units.append(ch)
    if buf:
        units.append(buf)
    return units


def _width(units, font) -> float:
    return sum(font.getlength(u) for u in units)


def _reflow(lines, font, max_w: float):
    """
    避头尾修正后行宽会溢出（把标点从下一行拉回来会变长），
    所以必须再跑一遍重排，把超长的行按「留出的余量」重新折。
    不做这一步的话，中文引号多的行会直接顶出屏幕右边。
    """
    out = []
    for line in lines:
        cur, cur_w = [], 0.0
        for u in line:
            w = font.getlength(u)
            if cur and cur_w + w > max_w:
                out.append(cur)
                cur, cur_w = [u], w
            else:
                cur.append(u)
                cur_w += w
        if cur:
            out.append(cur)
    return out


def wrap_units(units, font, max_w: float):
    """
    贪心折行 + 避头尾 + 溢出重排。

    为了给避头尾留余量，折行时按 max_w 的 96% 切，
    剩下的 4% 足够容纳一个被拉回来的标点，避免反修正后再次溢出。
    """
    limit = max_w * 0.96

    lines, cur, cur_w = [], [], 0.0
    for u in units:
        if u == "\n":
            if cur:
                lines.append(cur)
            cur, cur_w = [], 0.0
            continue
        w = font.getlength(u)
        if cur and cur_w + w > limit:
            lines.append(cur)
            cur, cur_w = [u], w
        else:
            cur.append(u)
            cur_w += w
    if cur:
        lines.append(cur)

    # 行首禁则：把下一行开头的收尾标点拉回上一行
    for i in range(len(lines) - 1):
        while (lines[i + 1] and len(lines[i + 1][0]) == 1
               and lines[i + 1][0] in NO_START
               and _width(lines[i], font) + font.getlength(lines[i + 1][0]) <= max_w):
            lines[i].append(lines[i + 1].pop(0))

    # 行尾禁则：把上一行末尾的开引号推到下一行
    for i in range(len(lines) - 1):
        while lines[i] and len(lines[i][-1]) == 1 and lines[i][-1] in NO_END:
            lines[i + 1].insert(0, lines[i].pop())

    # 无论如何不能让字符超出右边界
    lines = _reflow(lines, font, max_w)

    return ["".join(l) for l in lines if l]


def paginate(lines, per_page: int):
    return [lines[i:i + per_page] for i in range(0, len(lines), per_page)]


# ---------------------------------------------------------------- 渲染

def render_page(page_lines, page_no: int, total: int, chapter: str,
                font_body, font_meta) -> Image.Image:
    img = Image.new("RGB", (W, H), BG)
    d = ImageDraw.Draw(img)

    if chapter:
        d.text((MARGIN_L, HEADER_Y), chapter, font=font_meta, fill=DIM, anchor="la")

    y = CONTENT_TOP
    for line in page_lines:
        d.text((MARGIN_L, y), line, font=font_body, fill=FG, anchor="la")
        y += LINE_H

    d.text((W // 2, PAGE_NUM_Y), f"— {page_no} / {total} —",
           font=font_meta, fill=DIM2, anchor="mm")
    return img


# ---------------------------------------------------------------- 编码

def encode_video(frames_dir: Path, count: int, seconds: float, fps: int,
                 out_path: Path, ffmpeg_exe: str):
    """
    用 concat demuxer 给每张图指定时长，再用 fps 滤镜重采样成固定帧率。

    关键帧策略：**一页一个关键帧**，而不是每帧都是关键帧。
    keyint = fps × 每页秒数，正好落在每个页边界上。
    这样任意页 seek 都是瞬时的，而页内的重复帧走 P 帧几乎不占体积 ——
    实测全关键帧 6 分钟要 66MB，改成每页一个关键帧后降到 1MB 级别。
    """
    keyint = max(1, round(fps * seconds))

    concat = frames_dir / "list.txt"
    with open(concat, "w", encoding="utf-8") as f:
        for i in range(count):
            p = (frames_dir / f"p{i:04d}.png").as_posix()
            f.write(f"file '{p}'\nduration {seconds}\n")
        # concat demuxer 会丢掉最后一帧，再补一次
        f.write(f"file '{(frames_dir / f'p{count-1:04d}.png').as_posix()}'\n")

    cmd = [
        ffmpeg_exe, "-hide_banner", "-loglevel", "error", "-y",
        "-f", "concat", "-safe", "0", "-i", str(concat),
        "-f", "lavfi", "-i", "anullsrc=channel_layout=stereo:sample_rate=44100",
        "-vf", f"fps={fps},format=yuv420p",
        "-c:v", "libx265",
        "-x265-params", f"keyint={keyint}:min-keyint={keyint}:scenecut=0:log-level=error",
        "-tag:v", "hvc1",              # 关键：Apple 系设备只认 hvc1
        "-crf", "21",
        "-c:a", "aac", "-b:a", "64k",  # 静音轨，保证 AirPlay 视频路由和媒体键可用
        "-shortest",
        "-movflags", "+faststart",
        str(out_path),
    ]
    print(f"  ffmpeg 编码中…（keyint={keyint}，即每 {seconds:g} 秒一个关键帧）")
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode != 0:
        print(r.stderr[-3000:])
        raise SystemExit(f"ffmpeg 失败，返回码 {r.returncode}")


def encode_page_file(png: Path, out_path: Path, seconds: float, fps: int, ffmpeg_exe: str):
    """
    单页一个文件。这是给「方向盘翻页」用的形态 ——

    CarPlay 里方向盘的「上一曲 / 下一曲」操作的是**播放列表里的媒体项**，
    不是视频内的时间点。所以要让按键翻页，每一页必须是一个独立媒体项。

    每个文件只有 1 秒（或 --seconds 指定），配合 App 里的 actionAtItemEnd = .pause，
    播完就停在最后一帧，不会自动往下走 —— 翻不翻页完全由方向盘决定。
    """
    cmd = [
        ffmpeg_exe, "-hide_banner", "-loglevel", "error", "-y",
        "-loop", "1", "-t", f"{seconds:g}", "-i", str(png),
        "-f", "lavfi", "-t", f"{seconds:g}",
        "-i", "anullsrc=channel_layout=stereo:sample_rate=44100",
        "-vf", f"fps={fps},format=yuv420p",
        "-c:v", "libx265",
        "-x265-params", "keyint=1:log-level=error",
        "-tag:v", "hvc1",              # 关键：Apple 系设备只认 hvc1
        "-crf", "21",
        "-c:a", "aac", "-b:a", "64k",
        "-shortest",
        "-movflags", "+faststart",
        str(out_path),
    ]
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode != 0:
        print(r.stderr[-2000:])
        raise SystemExit("ffmpeg 单页编码失败")


def probe(out_path: Path, ffmpeg_exe: str, fps: int, seconds: float):
    """打印视频流参数。imageio-ffmpeg 不带 ffprobe，所以从 ffmpeg 的 stderr 里抓。"""
    r = subprocess.run([ffmpeg_exe, "-hide_banner", "-i", str(out_path)],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    for line in r.stderr.splitlines():
        s = line.strip()
        if s.startswith("Stream #") and ("Video" in s or "Audio" in s):
            print("  " + s)


def verify_seek(frames_dir: Path, count: int, seconds: float,
                out_path: Path, ffmpeg_exe: str):
    """
    最实在的一项验证：按页 seek 抽帧，和源图逐像素比。

    这一步直接回答「方向盘翻页能不能落到正确的页」——
    比看关键帧时间戳更贴近真实使用。
    """
    from PIL import Image, ImageChops, ImageStat

    samples = sorted({0, count // 3, (2 * count) // 3, count - 1})
    print(f"  seek 校验（抽 {len(samples)} 页）:")

    ok = 0
    with tempfile.TemporaryDirectory() as td:
        for idx in samples:
            # 落在该页中间取帧，避开边界抖动
            t = idx * seconds + seconds / 2
            shot = Path(td) / f"s{idx}.png"
            r = subprocess.run(
                [ffmpeg_exe, "-hide_banner", "-loglevel", "error", "-y",
                 "-ss", f"{t:.3f}", "-i", str(out_path),
                 "-frames:v", "1", str(shot)],
                capture_output=True, text=True, encoding="utf-8", errors="replace")
            if r.returncode != 0 or not shot.exists():
                print(f"    第 {idx+1:>3} 页  t={t:7.1f}s  抽帧失败")
                continue

            a = Image.open(frames_dir / f"p{idx:04d}.png").convert("L")
            b = Image.open(shot).convert("L")
            if a.size != b.size:
                print(f"    第 {idx+1:>3} 页  尺寸不符 {a.size} vs {b.size}")
                continue

            mean = ImageStat.Stat(ImageChops.difference(a, b)).mean[0]
            # 平均差 < 3/255 视为同一画面（HEVC 有轻微振铃，不可能完全为 0）
            good = mean < 3.0
            ok += good
            print(f"    第 {idx+1:>3} 页  t={t:7.1f}s  平均像素差={mean:5.2f}  {'一致' if good else '不一致'}")

    print(f"  → {ok}/{len(samples)} 页 seek 命中正确画面")


# ---------------------------------------------------------------- main

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--input", required=True, help="小说 TXT 路径")
    ap.add_argument("--chapter", type=int, default=1, help="取第几章（从 1 开始）")
    ap.add_argument("--pages", type=int, default=12, help="最多生成多少页")
    ap.add_argument("--seconds", type=float, default=20.0, help="每页停留秒数")
    ap.add_argument("--fps", type=int, default=2, help="视频帧率")
    ap.add_argument("--font", default=FONT_PATH)
    ap.add_argument("--outdir", default=None)
    ap.add_argument("--preview", action="store_true",
                    help="额外导出第 1 页 PNG，方便不上车先看版面")
    ap.add_argument("--per-page", action="store_true",
                    help="每页输出一个独立 mp4（方向盘翻页用），而不是合并成整章一个文件")
    args = ap.parse_args()

    src = Path(args.input)
    if not src.exists():
        raise SystemExit(f"找不到文件：{src}")

    import imageio_ffmpeg
    ffmpeg_exe = imageio_ffmpeg.get_ffmpeg_exe()

    outdir = Path(args.outdir) if args.outdir else Path(__file__).resolve().parent.parent / "out"
    outdir.mkdir(parents=True, exist_ok=True)

    print(f"[1/5] 读取 {src.name}")
    text = load_txt(src)
    print(f"      解码完成，{len(text):,} 字")

    print("[2/5] 切分章节")
    chapters = split_chapters(text)
    if not chapters:
        raise SystemExit("没找到章节标记")
    if not 1 <= args.chapter <= len(chapters):
        raise SystemExit(f"章号超范围（共 {len(chapters)} 章）")
    title, body = chapters[args.chapter - 1]
    print(f"      共 {len(chapters)} 章，本次取第 {args.chapter} 章：{title}（{len(body):,} 字）")

    print("[3/5] 折行 + 分页")
    font_body = ImageFont.truetype(args.font, SIZE_BODY, index=0)
    font_meta = ImageFont.truetype(args.font, SIZE_META, index=0)

    lines = wrap_units(tokenize(body), font_body, W - MARGIN_L - MARGIN_R)
    all_pages = paginate(lines, LINES_PER_PAGE)
    pages = all_pages[:args.pages]
    print(f"      全章 {len(all_pages)} 页，本次生成前 {len(pages)} 页")

    print("[4/5] 渲染位图")
    with tempfile.TemporaryDirectory() as td:
        tdp = Path(td)
        for i, pl in enumerate(pages):
            img = render_page(pl, i + 1, len(pages), title, font_body, font_meta)
            img.save(tdp / f"p{i:04d}.png", optimize=True)
        print(f"      {len(pages)} 张 1920x1080 已渲染")

        if args.per_page:
            # 每页一个文件 —— 给方向盘「上一曲 / 下一曲」翻页用
            folder = outdir / f"{src.stem}_ch{args.chapter:02d}_单页"
            folder.mkdir(parents=True, exist_ok=True)
            print(f"[5/5] 逐页编码 -> {folder.name}/")
            for i in range(len(pages)):
                encode_page_file(tdp / f"p{i:04d}.png",
                                 folder / f"ch{args.chapter:02d}_p{i+1:03d}.mp4",
                                 args.seconds, args.fps, ffmpeg_exe)
            total = sum(f.stat().st_size for f in folder.glob("*.mp4"))
            print(f"\n完成：{folder}")
            print(f"  {len(pages)} 个文件 ｜ 合计 {total/1024/1024:.2f} MB ｜ 每个 {args.seconds:g} 秒")
            print(f"  文件名 ch{args.chapter:02d}_p001.mp4 … ch{args.chapter:02d}_p{len(pages):03d}.mp4（按名排序即页序）")
            return

        out = outdir / f"{src.stem}_ch{args.chapter:02d}_p{len(pages)}.mp4"
        print(f"[5/5] 合成视频 -> {out.name}")
        encode_video(tdp, len(pages), args.seconds, args.fps, out, ffmpeg_exe)

        if args.preview:
            pv = outdir / f"{src.stem}_ch{args.chapter:02d}_预览.png"
            render_page(pages[0], 1, len(pages), title, font_body, font_meta).save(pv)
            print(f"  预览图 -> {pv.name}")

        size_mb = out.stat().st_size / 1024 / 1024
        print(f"\n完成：{out}")
        print(f"  大小 {size_mb:.1f} MB ｜ 时长约 {len(pages) * args.seconds / 60:.1f} 分钟 ｜ 每页 {args.seconds:g} 秒")
        probe(out, ffmpeg_exe, args.fps, args.seconds)
        verify_seek(tdp, len(pages), args.seconds, out, ffmpeg_exe)


if __name__ == "__main__":
    main()

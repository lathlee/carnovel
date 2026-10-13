# Windows 端验证工具

这些脚本用 Python 先把整条链路跑通，**目的是不上车就能验证**，
以及在没有 Xcode 的机器上快速试参数。App 本身不依赖它们。

## 安装

```bash
python -m venv .venv
.venv/Scripts/activate
pip install -r requirements.txt
```

`imageio-ffmpeg` 自带静态 ffmpeg（含 libx265），不需要单独装 ffmpeg。

## 用法

```bash
# 每页一个文件（方向盘翻页用）★ 主要用法
python tools/make_pages_video.py \
  --input "D:/D/Personal/凡人修仙传.txt" \
  --chapter 1 --pages 18 --seconds 1 --fps 2 --per-page

# 整章合成一个文件（对比用）
python tools/make_pages_video.py \
  --input "D:/D/Personal/凡人修仙传.txt" \
  --chapter 1 --pages 18 --seconds 20 --fps 2 --preview
```

| 参数 | 说明 |
|---|---|
| `--chapter N` | 第 N 章（从 1 开始） |
| `--pages N` | 最多生成多少页 |
| `--seconds N` | 每页停留秒数 |
| `--fps N` | 帧率，默认 2 |
| `--per-page` | 每页一个 mp4（方向盘翻页） |
| `--preview` | 额外导出第 1 页 PNG |

## 与 Swift 的对应关系

| Swift | Python |
|---|---|
| `Sources/TXTParser.swift` | `load_txt()` / `split_chapters()` |
| `Paginator.swift` | `tokenize()` / `wrap_units()` / `paginate()` / `render_page()` |
| `PageStore.swift` | `encode_page_file()` |
| `encode_video()` | （仅 Python 有，整章合成用）|

两边切章逻辑保持一致 —— 改一边记得同步另一边。

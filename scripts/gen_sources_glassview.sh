#!/usr/bin/env bash
set -euo pipefail

# 生成 Glass-view 的 SideStore / AltStore 源文件 source.json
# 用法: gen_sources_glassview.sh <VERSION> <BASE_URL> <IDENTIFIER> <OUT_FILE>
#   VERSION    例如 1.8
#   BASE_URL   源根地址，例如 https://raw.githubusercontent.com/lathlee/carnovel/glassview-build/ci-logs
#   IDENTIFIER 源的 identifier，例如 com.lath.glassview.sidestore.raw
#   OUT_FILE   输出的 source.json 路径
# 环境变量 IPA_SIZE 可选，提供则写入 size 字段。
#
# 注意：与 CarNotify / GlassNotify 的源脚本各自独立 ——
# 三个 App 是三个独立项目，bundle id / 源 / 构建分支互不相干。

VER="$1"
BASE="$2"
IDENT="$3"
OUTFILE="$4"
IPA_SIZE="${IPA_SIZE:-0}"
DATE=$(date -u '+%Y-%m-%d')

mkdir -p "$(dirname "$OUTFILE")"

cat > "$OUTFILE" <<JSON
{
  "name": "Glass-view",
  "identifier": "$IDENT",
  "sourceURL": "$BASE/source.json",
  "apps": [
    {
      "name": "Glass-view",
      "bundleIdentifier": "com.lath.glassview",
      "version": "$VER",
      "versionDate": "$DATE",
      "downloadURL": "$BASE/GlassView-$VER-unsigned.ipa",
      "localizedDescription": "iPhone 端 Glass-view：给安卓眼镜实时推通知 + 触控板 + 输入法 + 眼镜电量显示。眼镜连 iPhone 个人热点后自动接入。",
      "iconURL": "$BASE/icon.png",
      "tintColor": "34C759",
      "size": $IPA_SIZE,
      "permissions": []
    }
  ],
  "news": [
    {
      "title": "Glass-view $VER",
      "date": "$DATE",
      "caption": "SideStore 自动更新源已就绪，添加源后可一键安装 / 更新。"
    }
  ]
}
JSON

echo "已生成 $OUTFILE"

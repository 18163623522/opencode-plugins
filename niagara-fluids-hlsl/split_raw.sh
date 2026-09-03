#!/bin/bash
# =============================================================================
# split_raw.sh — 把 raw/<版本>.txt 按"小节边界"切成 ≤8MB 的分卷
#
# 用法:   bash split_raw.sh
# 输入:   raw/UE5.3.txt ... raw/UE5.8.txt（每小节以 "########## 路径" 开头）
# 输出:   raw_parts/<版本>/<版本>_partNN.txt（小节完整，不跨卷截断）
# 完整性: 切完自动校验 各卷字节数之和 == 原文件，并在通过后删除原文件
# =============================================================================
set -e
base="/d/001_Archive/AI/niagara-fluids-hlsl"
LIMIT=$((8*1024*1024))
mkdir -p "$base/raw_parts"
for f in "$base"/raw/UE*.txt; do
  v=$(basename "$f" .txt)
  outdir="$base/raw_parts/$v"; mkdir -p "$outdir"; rm -f "$outdir"/*.txt
  awk -v outdir="$outdir" -v v="$v" -v LIMIT="$LIMIT" '
    BEGIN { part=1; size=0; fname=sprintf("%s/%s_part%02d.txt", outdir, v, part) }
    /^########## / && size > 0 {
      # 超限则开新卷（小节不跨卷）
      if (size >= LIMIT) { close(fname); part++; fname=sprintf("%s/%s_part%02d.txt", outdir, v, part); size=0 }
    }
    { print > fname; size += length($0) + 1 }
    END { close(fname); printf "%s: %d 卷\n", v, part > "/dev/stderr" }
  ' "$f"
  # 完整性校验：卷大小之和 == 原文件大小
  orig=$(stat -c %s "$f")
  sum=$(cat "$outdir"/*.txt | wc -c)
  if [ "$orig" -eq "$sum" ]; then
    echo "  校验通过 ($orig 字节)，删除原文件 $f"
    rm "$f"
  else
    echo "  !! 校验失败 orig=$orig sum=$sum，保留原文件"; exit 1
  fi
done
du -sh "$base/raw_parts"

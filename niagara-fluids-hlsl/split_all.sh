#!/bin/bash
# =============================================================================
# split_all.sh — 把 raw/<版本>.txt 的每个资产小节拆成独立 .hlsl 文件
#
# 用法:   bash split_all.sh <版本标签>
# 输入:   raw/<版本>.txt   （extract_version.sh 的产物，########## 相对路径 分节）
# 输出:   split/<版本>/<路径中/换成__>.hlsl   每资产一个文件，便于按名索引/ diff
#
# 注意:
#   - 文件名用 __ 替换 / （Windows 路径分隔符不能出现在文件名里）。
#     教训: 必须先对"相对路径"做 gsub 再拼绝对目录——如果对拼好的绝对路径
#     整体 gsub("/")，盘符 D:/ 也会被毁掉，文件会以怪名散落到 cwd。
#   - 小节正文行原样落盘（未做任何改写），可作为官方写法的引用原文。
# =============================================================================
v=$1
base="/d/001_Archive/AI/niagara-fluids-hlsl"
raw="$base/raw/$v.txt"
outdir="$base/split/$v"
mkdir -p "$outdir"
awk -v outdir="$outdir" '
# 小节头: ########## <相对路径>。substr($0,12) 跳过 10 个 # + 1 个空格
/^########## / {
  path=substr($0, 12)
  fname=path
  gsub("/", "__", fname)          # 只对相对路径替换，绝对目录保持完整
  outfile=outdir "/" fname ".hlsl"
  insection=1
  next
}
insection && outfile != "" { print > outfile }
' "$raw"
echo "[$v] split done: $(find "$outdir" -name '*.hlsl' | wc -l) files"

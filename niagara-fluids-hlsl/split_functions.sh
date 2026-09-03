#!/bin/bash
# 用法: split_functions.sh <版本>  — 把 raw/<版本>.txt 中 Functions/ 与 DynamicInput/ 小节拆成独立文件
v=$1
base="/d/001_Archive/AI/niagara-fluids-hlsl"
raw="$base/raw/$v.txt"
outdir="$base/functions/$v"
mkdir -p "$outdir"
awk -v outdir="$outdir" '
/^########## / {
  path=substr($0, 12)
  if (path ~ /^(Functions|DynamicInput)\//) {
    fname=path
    gsub("/", "__", fname)
    outfile=outdir "/" fname ".hlsl"
    insection=1
    next
  } else { insection=0 }
}
insection { print > outfile }
' "$raw"
echo "[$v] split done: $(find "$outdir" -name '*.hlsl' | wc -l) files"

#!/bin/bash
# =============================================================================
# make_stdlib_note.sh — 从 TSV 生成《Niagara 标准库查询表》
#
# 用法:   bash make_stdlib_note.sh <输出.md>
# 输入:   inv/niagara_std_modules.tsv / inv/niagara_std_functions.tsv
#
# 行级清洗:
#   假阳性描述过滤——Niagara 资产里还序列化了别的文本，会被散文启发式误抓:
#     · "Default value for Module.X ..."（动态输入的级联默认值说明）
#     · 含 '(' '=' 的代码行、Context.Map/OutputData 开头的 HLSL 行
#     · "640 | 1" 类非文本
#   剩下的才视为官方 Description。
#   分类列: 面包屑 Keywords；抓不到时用路径首段目录名。
# =============================================================================
out="$1"
inv="/d/001_Archive/AI/niagara-fluids-hlsl/inv"
emit_kind() { # $1=tsv $2=显示名 $3=路径前缀(Modules/Functions)
  awk -F'\t' -v kind="$2" '
  {
    path=$1; name=$2; cat=$3; desc=$4
    # 假阳性描述过滤
    if (desc=="—" ) d=""
    else if (desc ~ /^Default value for/ || desc ~ /^Module\./) d=""
    else if (desc ~ /^Context\./ || desc ~ /^OutputData/) d=""
    else if (desc ~ /[=(]/ && desc !~ /[;]/ && length(desc)<120) d=""
    else d=desc
    # 分类一律用路径第二段目录名（面包屑是序列化噪声）
    split(path, p, "/")
    c=p[2]
    key=toupper(substr(c,1,1)) substr(c,2)
    rows[key]=rows[key] sprintf("| %s | %s | %s |\n", name, c, (d==""?"—（源未提供，可点名补写）":d))
    if (d!="") withdesc++; total++
  }
  END {
    print "## " kind "（" total " 个，含官方描述 " withdesc "）\n"
    n=asorti(rows, sk)
    for (i=1;i<=n;i++) { print "### " sk[i] "\n"; print "| 名称 | 分类 | 官方描述（详细功能） |"; print "|---|---|---|"; printf "%s", rows[sk[i]] }
  }' "$1"
}
{
echo "---"
echo "title: Niagara 标准库查询表（模块/函数）"
echo "created: 2026-09-03 00:00"
echo "source: UE5.7 Niagara 插件官方内容 Modules 324 + Functions 250 的资产元数据（名称/分类/Description）"
echo "tags:"
echo "  - Niagara"
echo "  - 查询表"
echo "---"
echo
echo "# Niagara 标准库查询表（模块/函数）"
echo
echo "> 覆盖引擎自带 Niagara 插件 Content 的全部模块（324）与函数（250）。"
echo "> 描述列为**资产自带的官方 Description 原文**（Epic 撰写的功能说明）；已过滤序列化噪声（级联默认值文本/HLSL 行）。标"—（源未提供…）"的资产在源里没有描述元数据——需要哪个的可点名，我按源码/节点展开补写详细说明。"
echo "> 流体侧资产见 [[NiagaraFluids 模块查询表]] / [[NiagaraFluids 函数与动态输入查询表]] / [[流体材质查询表]]。"
echo
emit_kind "$inv/niagara_std_modules.tsv" "模块 Modules"
echo
emit_kind "$inv/niagara_std_functions.tsv" "函数 Functions"
} > "$out"
echo "生成: $out（$(grep -c '^| ' "$out") 表行）"

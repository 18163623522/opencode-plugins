#!/bin/bash
# =============================================================================
# extract_asset_info.sh — 批量提取 Niagara/材质资产的元信息
#   名称 / 分类面包屑(Keywords) / 官方 Description
#
# 用法:   bash extract_asset_info.sh <内容根> <类别:Modules|Functions|DynamicInput|Materials> <输出.tsv>
# 输出:   Tab 分隔: 相对路径<TAB>资产名<TAB>分类<TAB>描述
#
# 提取逻辑（uasset 明文序列化，单 awk/文件）:
#   - 分类: 含 '|' 的面包屑串（Niagara Keywords 字段，形如 "Grid 2D|Solver"）
#   - 描述: 第一条"散文形"串——>=40 字、含空格句号、大写开头、
#           不含 '/'(路径) '::'(枚举) '_'(标识符)
#     Niagara 标准库模块/函数多带 Description；材质本体大多没有→待手工补
#     （材质函数 MF_* 的 Description 同样能被抓到）
# =============================================================================
set -e
root="$1"; kind="$2"; out="$3"
: > "$out"
find "$root/$kind" -name '*.uasset' 2>/dev/null | sort | while read -r f; do
  rel="${f#$root/}"
  name=$(basename "$f" .uasset)
  IFS=$'\t' read -r cat_ desc < <(awk 'BEGIN{RS="[^ -~]"}
    /^[A-Za-z0-9 +&\/-]+\|[A-Za-z0-9 +&\/-]+$/ && length($0)<=60 && c=="" { c=$0 }
    length($0)>=40 && /[ ]/ && /[.]/ && !/\// && !/::/ && !/_/ && /^[A-Z]/ && d=="" { d=$0 }
    END { printf "%s\t%s\n", c, d }' "$f")
  cat_out="${cat_:-}"; [ -z "$cat_out" ] && cat_out="—"
  desc_out="${desc:-}"; [ -z "$desc_out" ] && desc_out="—"
  printf '%s\t%s\t%s\t%s\n' "$rel" "$name" "$cat_out" "$desc_out" >> "$out"
done
echo "[$kind] $(wc -l < "$out") assets, 带描述: $(awk -F'\t' '$4!="" && $4!="—"' "$out" | wc -l)"

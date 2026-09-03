#!/bin/bash
# =============================================================================
# extract_module_interfaces.sh — 提取 Niagara 模块资产的"接口参数"
#
# 用法:   bash extract_module_interfaces.sh <内容根> <类别:Modules|Functions|DynamicInput> <输出.tsv>
# 输出:   Tab 分隔: 相对路径<TAB>模块名<TAB>Module参数<TAB>Emitter/Transient属性<TAB>Particles属性<TAB>DI绑定
#
# 原理（uasset 明文序列化）:
#   模块图里引用的参数以带命名空间的字符串存储——
#     Module.*      = 模块自身输入参数（Details 面板/引脚，含 DI 类型引脚）
#     Emitter.*/Transient.* = 发射器级读写属性（网格、索引缓存、力累积）
#     Particles.*   = 粒子属性（源模块读写粒子数据）
#   DI 绑定 = 出现的 "/Script/Niagara.NiagaraDataInterfaceXxx" 类路径
#   （读/写方向无法从字符串判定，按命名空间分组呈现即"接口面"）
#
# 铁律：整行由 awk 直接 printf 输出——不要用 bash `IFS=$'\t' read` 接列，
#       tab 属 IFS 空白类会把空字段折叠，造成整列错位（DI 名左移进 Emitter 列）。
# =============================================================================
set -e
root="$1"; kind="$2"; out="$3"
: > "$out"
find "$root/$kind" -name '*.uasset' 2>/dev/null | sort | while read -r f; do
  rel="${f#$root/}"; name=$(basename "$f" .uasset)
  awk -v rel="$rel" -v name="$name" 'BEGIN{RS="[^ -~]"}
    {
      if ($0 ~ /^Module\.[A-Za-z0-9_.]+$/ && length($0)<=60) m[$0]=1
      else if ($0 ~ /^(Emitter|Transient)\.[A-Za-z0-9_.]+$/ && length($0)<=60) e[$0]=1
      else if ($0 ~ /^Particles\.[A-Za-z0-9_.]+$/ && length($0)<=60) p[$0]=1
      else if ($0 ~ /NiagaraDataInterface[A-Za-z0-9]+$/) {
        di=$0; sub(/^.*NiagaraDataInterface/, "NiagaraDataInterface", di); sub(/[^A-Za-z0-9].*$/, "", di); d[di]=1
      }
    }
    END {
      nm=nc=0; s1=s2=s3=s4=""
      for (k in m) { if (nm<24) s1=s1 (nm?"、":"") k; nm++ }
      for (k in e) { s2=s2 (nc?"、":"") k; nc++ }
      nc=0
      for (k in p) { s3=s3 (nc?"、":"") k; nc++ }
      nc=0
      for (k in d) { s4=s4 (nc?"、":"") k; nc++ }
      printf "%s\t%s\t%s\t%s\t%s\t%s\n", rel, name, (s1==""?"—":s1), (s2==""?"—":s2), (s3==""?"—":s3), (s4==""?"—":s4)
    }' "$f" >> "$out"
done
echo "[$kind] $(wc -l < "$out") 模块接口已提取"

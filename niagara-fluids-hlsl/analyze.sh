#!/bin/bash
# =============================================================================
# analyze.sh — 统计某版本提取结果里的 DI（Data Interface）点调用
#
# 用法:   bash analyze.sh <版本标签>          （需先跑过 extract_version.sh）
# 输入:   raw/<版本>.txt
# 输出:   inv/<版本>_calls_unique.txt  全部独特点调用（含 <Attribute="..."> 完整模板）
#         inv/<版本>_dicalls.txt       按函数名聚合计数（排除命名空间访问），Top40 打到终端
#
# 匹配的点调用形态（两种）:
#   引脚名.函数名(            —— 普通调用
#   引脚名.函数名<Key="V">(   —— 带 Specifier 的调用（如 <Attribute="Velocity">）
#   注意: 引脚名必须小写开头、函数名大写开头，天然避开 float2()/int( 之类的内建
#
# 命名空间排除表（这些是参数访问，不是 DI 调用）:
#   Context./Particles./Emitter./Engine./System./Transient./Local./Module./
#   DataInstance./OUTPUT_VAR./Map./In./Out.
#
# 用途: 各版本 inv/*_dicalls.txt 的函数名集合做 comm 对比 → 版本差异表
#       （手册 README 第 9 节就是这么算出来的）
# =============================================================================
v=$1
base="/d/001_Archive/AI/niagara-fluids-hlsl"
raw="$base/raw/$v.txt"
[ -s "$raw" ] || { echo "raw/$v.txt 不存在或为空"; exit 1; }

# ① 全部点调用去重清单（保留 <...> 模板原文，便于看属性名用法）
grep -aoE '[A-Za-z_][A-Za-z0-9_]*\.[A-Z][A-Za-z0-9_]*(<[A-Za-z]+="[^"]*">)?\(' "$raw" \
  | sort -u > "$base/inv/${v}_calls_unique.txt"

# ② 按函数名聚合计数：先排除命名空间前缀，再剥掉引脚名只留函数名
grep -aoE '[A-Za-z_][A-Za-z0-9_]*\.[A-Z][A-Za-z0-9_]*(<[A-Za-z]+="[^"]*">)?\(' "$raw" \
  | grep -avE '^(Context|Particles|Emitter|Engine|System|Transient|Local|Module|DataInstance|OUTPUT_VAR|Map|In|Out)\.' \
  | sed -E 's/^[A-Za-z0-9_]+\.//' \
  | sort | uniq -c | sort -rn > "$base/inv/${v}_dicalls.txt"

echo "== $v DI 调用 Top40（已排除命名空间）:"
head -40 "$base/inv/${v}_dicalls.txt"
echo
echo "== $v 独特调用总数: $(wc -l < "$base/inv/${v}_calls_unique.txt")"

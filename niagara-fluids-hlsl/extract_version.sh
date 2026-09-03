#!/bin/bash
# =============================================================================
# extract_version.sh — 从一套引擎的 NiagaraFluids 内容资产里批量提取明文 HLSL
#
# 用法:   bash extract_version.sh <版本标签> <NiagaraFluids/Content 绝对路径>
# 示例:   bash extract_version.sh UE5.7 "/e/UE/UE5.7/Engine/Plugins/FX/NiagaraFluids/Content"
# 输出:   /d/001_Archive/AI/niagara-fluids-hlsl/raw/<版本标签>.txt
#
# 原理:
#   Niagara 的 Custom HLSL / HLSL Graph 源码以明文 FString 存在 .uasset 二进制里。
#   awk 的 RS="[^ -~]" 把"非可打印字节"当记录分隔符 → 每条记录恰好是一段可打印
#   字符串（等效 strings），从而绕开 uasset 的 LinkTable/压缩段，无需解析格式。
#
# 代码行过滤规则（三选一命中即保留）:
#   1) 含分号 / 含 //（绝大多数 HLSL 语句与注释）
#   2) 行首空白 + 标识符（HLSL Graph 源码带缩进存储）
#   排除: VersionData(版本记录)、/NiagaraFluids/(包路径)、长度<=5 的碎片
#   去重: awk 的 !seen[$0]++ —— 按文件内首次出现序去重（资产里 HLSL 常存两份）
#
# 已知坑:
#   - Windows Git Bash 每文件多进程管道极慢，故整个过滤收敛为单 awk/文件；
#     提取多版本时建议像本库一样并行跑三个后台任务。
#   - awk 对二进制会刷 "Invalid multibyte data" 警告，无害，可忽略。
#   - 部分函数资产是薄包装（Functions/ 下），真 HLSL 在 Modules/ 同名资产里，
#     因此必须扫整个 Content 而不是只扫 Functions/。
# =============================================================================
v=$1; base=$2
out="/d/001_Archive/AI/niagara-fluids-hlsl/raw/$v.txt"
: > "$out"   # 清空目标文件（幂等：重跑覆盖旧结果）

# find | sort 保证小节顺序稳定（不同机器/重跑结果可 diff）
find "$base" -name '*.uasset' | sort | while read -r f; do
  # 单 awk 完成三件事：按非打印字节切串 → 过滤代码行 → 文件内去重
  tmp=$(awk 'BEGIN{RS="[^ -~]"} (/;/ || /\/\// || /^[ \t]+[A-Za-z_]/) && length($0)>5 && $0 !~ /VersionData|\/NiagaraFluids\// && !seen[$0]++' "$f")
  # 有内容才写小节：小节头 = ########## 相对路径，供 split_all.sh 按前缀切分
  [ -n "$tmp" ] && { printf '\n########## %s\n' "${f#$base/}"; printf '%s\n' "$tmp"; } >> "$out"
done
echo "[$v] assets_with_code=$(grep -c '^##########' "$out") total_lines=$(wc -l < "$out") DONE"

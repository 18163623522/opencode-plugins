#!/bin/bash
# =============================================================================
# make_interface_note.sh — 从模块接口 TSV 生成《NiagaraFluids 模块参数接口查询表》
# 用法:   bash make_interface_note.sh <输出.md>
# 分组:   按路径段（Grid2D 根/Secondary/ShallowWater/Grid3D/Particles/Staging）
# 截断:   超长字段截 240 字符加 …（完整清单见 TSV）
# =============================================================================
out="$1"
tsv="/d/001_Archive/AI/niagara-fluids-hlsl/inv/fluids_module_interfaces.tsv"
{
echo "---"
echo "title: NiagaraFluids 模块参数接口查询表"
echo "created: 2026-09-03 00:00"
echo "source: UE5.7 NiagaraFluids 243 个模块资产的参数引用提取（uasset 明文命名空间字符串）"
echo "tags:"
echo "  - Niagara"
echo "  - 流体"
echo "  - 查询表"
echo "---"
echo
echo "# NiagaraFluids 模块参数接口查询表"
echo
echo "> 回答\"这个节点接什么\":**Module 参数列** = 模块自身输入参数（Details 面板/引脚，含网格与 DI 引脚）；**Emitter/Transient 列** = 模块读写的发射器级属性；**Particles 列** = 粒子属性；**DI 列** = 绑定的 Data Interface 类型。全部为资产内序列化的真实引用，非推断。"
echo "> 功能说明（这个节点是干什么的）见 [[NiagaraFluids 模块查询表]]；两表按模块名对齐。"
echo "> 命名空间约定：Module.* 局部参数 / Emitter.* 发射器共享 / Transient.* 帧内临时（力累积）/ Particles.* 粒子数据。读/写方向无法从序列化判定，引用即接口面。"
echo
awk -F'\t' '
{
  path=$1; name=$2; m=$3; e=$4; p=$5; d=$6
  split(path, seg, "/")
  grp = seg[2] (seg[3] ~ /^(Secondary|ShallowWater)$/ ? "/" seg[3] : "")
  if (length(m)>240) m=substr(m,1,240) "…"
  if (length(e)>240) e=substr(e,1,240) "…"
  if (length(p)>200) p=substr(p,1,200) "…"
  rows[grp]=rows[grp] sprintf("| %s | %s | %s | %s | %s |\n", name, (m=="—"?"—":m), (e=="—"?"—":e), (p=="—"?"—":p), (d=="—"?"—":d))
  cnt[grp]++
}
END {
  n=asorti(rows, gk)
  for (i=1;i<=n;i++) {
    print "## " gk[i] "（" cnt[gk[i]] "）\n"
    print "| 模块 | Module 参数（输入引脚/Details） | Emitter/Transient 读写属性 | Particles 属性 | 绑定 DI |"
    print "|---|---|---|---|---|"
    printf "%s", rows[gk[i]]
    print ""
  }
}' "$tsv"
} > "$out"
echo "生成: $out（$(grep -ac '^| ' "$out") 表行）"

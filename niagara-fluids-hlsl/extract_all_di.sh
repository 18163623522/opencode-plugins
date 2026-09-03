#!/bin/bash
# =============================================================================
# extract_all_di.sh — 提取一套引擎里全部 Data Interface 的函数名面
#
# 用法:   bash extract_all_di.sh <引擎根目录> <输出文件>
# 示例:   bash extract_all_di.sh "/e/UE/UE5.7" inv/UE5.7_all_DI_functions.txt
# 输出:   每行一个 "@@@ <DI名> [NO-NAMES]" 或 "@@@ <DI名>" + 函数名空格列表
#
# 扫描范围: Niagara/Source/Niagara/Private/*.cpp + Private/DataInterface/*.cpp
#           中文件名含 NiagaraDataInterface 的（剔除函数库/工具/基类/内部绑定类）
#
# 函数名捕获三种声明风格（正则要点: 类限定名含 :: 必须包含在字符类里，
# 否则 UNiagaraDataInterfaceGrid2DCollection::SetGridValueFunctionName(...) 全漏）:
#   1) const FName XFunctionName("SetGridValue");          —— Grid/RT/大多数族
#   2) static const FName NAME_X("SpawnDirect");           —— NDC Read 族
#   3) Sig.Name = TEXT("Num");                             —— NDC Write 族
# 过滤掉的是 Specifier 键名不是函数: VarName / VarType / Attribute / X / Y / Z
#
# [NO-NAMES] 的已知原因与补救（5.7 实测）:
#   - GBuffer:         函数名 = "Decode"+属性名 动态生成 → 读属性表（14 个）
#   - Array 家族:      名字藏在 Array_XxxDesc 描述键里 → sed 反推
#   - Static/SkeletalMesh: 现代面在 NDI_*_Sampling.cpp 扩展文件里
#   - Grid2D/3DReader: 无自有常量，继承对应 Collection 的完整表面
#   - SkeletalMeshConnectivity / StaticMeshUvMapping / StaticMeshIndirect: 动态构造
#   这些族需按上述线索手查（伴生笔记《Niagara Data Interface 全目录函数面速查》已收录）
#
# 用途: 不同版本的输出按 @@@ 名单做 comm → DI 家族存在性版本对比
# =============================================================================
root=$1; out=$2
: > "$out"
cd "$root/Engine/Plugins/FX/Niagara/Source/Niagara/Private" || exit 1
for f in $( (ls *.cpp DataInterface/*.cpp 2>/dev/null | grep -aE "NiagaraDataInterface|^NDI" | grep -avE "FunctionLibrary|Utilities|Common|Impl|Base|Binding|IspcTest"; echo "DataInterface/NiagaraDataInterfaceSimpleCounter.cpp") | sort -u ); do
  [ -f "$f" ] || continue
  # 两条管道分别抓 FName 常量定义与 Sig.Name 直接赋值；-(T)EXT 可选、限定名 :: 兼容
  names=$(
    {
      grep -haE 'FName [A-Za-z0-9_:]+\((TEXT\()?"[A-Za-z0-9_]+"' "$f" 2>/dev/null
      grep -haE 'Sig\.Name = TEXT\("[A-Za-z0-9_]+"\)' "$f" 2>/dev/null
      grep -haE 'Sig\.Name = FName\(TEXT\("[A-Za-z0-9_]+"' "$f" 2>/dev/null
    } | grep -aoE '"[A-Za-z0-9_]+"' | tr -d '"' \
      | grep -avE '^(VarName|VarType|Attribute|X|Y|Z)$' | sort -u
  )
  # DI 名去掉统一前缀便于阅读；无结果的标注 NO-NAMES 便于后续手查
  di=$(basename "$f" .cpp | sed 's/^NiagaraDataInterface//')
  if [ -n "$names" ]; then
    echo "@@@ $di" >> "$out"
    echo "$names" | tr '\n' ' ' >> "$out"; echo >> "$out"
  else
    echo "@@@ $di [NO-NAMES]" >> "$out"
  fi
done
grep -c '@@@' "$out"

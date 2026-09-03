#!/bin/bash
# =============================================================================
# extract_di_signatures.sh — 从 DI 源码的 GetFunctions 实现里解析函数签名表
#
# 用法:   bash extract_di_signatures.sh <引擎根> <输出文件>
# 示例:   bash extract_di_signatures.sh "/e/UE/UE5.7" inv/UE5.7_DI_signatures.md
# 输出:   每个 DI 一节：@@@ <DI名>，随后 markdown 表体行
#         | 函数 | 输入 | 输出 | 属性 |
#
# 解析原理:
#   签名构造的源码惯用写法是
#       Sig.Name = <常量名 或 TEXT("字面量") 或 动态表达式>;
#       Sig.AddInput*(FNiagaraVariable(<类型表达式>, TEXT("参数名")));
#       Sig.AddOutput(...);  Sig.bRequiresExecPin/bSupportsGPU/bSupportsCPU = ...;
#   常量名先由本文件内的 FName 常量定义（FName XFunctionName("名")）解析成字符串。
#   状态机以 Sig.Name= 为界开新记录，收集其后的 Add* 行——Add* 在签名构造
#   之外几乎不出现，因此无需精确界定函数体边界。
#
# 输出约定:
#   类型缩写: float/int/bool/vec2/vec3/vec4/position/quat/color(matrix 等保留原文)
#             DI=DI 自身句柄, enum:X=枚举, ?=未识别（多为循环生成的动态类型）
#   参数名: 取 TEXT("...") 字面量；循环生成处可能为空
#   属性列: E=需 Exec 引脚(非纯函数) / G✗=不支持GPU / C✗=不支持CPU
#   函数名前 ⏵ = 名字由表达式动态生成（需看源码/节点确认）
#   ⚠️ 已知局限: 循环生成的一族签名只落第一行；跨行 Add* 参数可能截断
# =============================================================================
root=$1; out=$2
: > "$out"
cd "$root/Engine/Plugins/FX/Niagara/Source/Niagara/Private" || exit 1
for f in $( (ls *.cpp DataInterface/*.cpp 2>/dev/null | grep -aE "NiagaraDataInterface|^NDI" | grep -avE "FunctionLibrary|Utilities|Common|Impl|Base|Binding|IspcTest"; echo "DataInterface/NiagaraDataInterfaceSimpleCounter.cpp") | sort -u ); do
  [ -f "$f" ] || continue
  # 小节名：NDI 扩展文件 → "SkeletalMesh·BoneSampling" 形式；普通 DI 去统一前缀
  di=$(basename "$f" .cpp | sed 's/^NiagaraDataInterface//')
  case "$di" in NDISkeletalMesh_*) di="SkeletalMesh·${di#NDISkeletalMesh_}" ;; NDIRenderTargetSimCacheData) di="RenderTargetSimCacheData" ;; esac
  # pass1: 抽常量映射 "名字=字符串"；除 cpp 外还要扫对应头文件
  #（StaticMesh/SkeletalMesh 等把 FName 常量声明在 Classes/*.h 里）
  hdr=""
  case "$f" in
    DataInterface/*) hdr="DataInterface/../../Classes/$(basename "$f" .cpp).h" ;;
    *)               hdr="../Classes/$(basename "$f" .cpp).h" ;;
  esac
  [ -f "$hdr" ] || hdr=""
  consts=$( { grep -hoE 'FName [A-Za-z0-9_:]+\((TEXT\()?"[A-Za-z0-9_]+"' "$f"; \
              [ -n "$hdr" ] && grep -hoE 'FName [A-Za-z0-9_:]+\((TEXT\()?"[A-Za-z0-9_]+"' "$hdr"; } \
    | sed -E 's/FName ([A-Za-z0-9_:]+)\((TEXT\()?"([A-Za-z0-9_]+)".*/\1=\3/' \
    | sed -E 's/^.*:://' | tr '\n' ';')
  tbl=$(awk -v CONSTS="$consts" '
    BEGIN {
      n=split(CONSTS, a, ";")
      for (i=1; i<=n; i++) if (a[i] ~ /=/) {
        split(a[i], kv, "=")
        k=kv[1]; sub(/^.*::/, "", k)
        constmap[k]=kv[2]
      }
    }
    # 新函数记录开始
    /\.Name = / {
      if (fname != "") emit()
      expr=$0; sub(/^.*\.Name = /,"",expr); sub(/;.*$/,"",expr); gsub(/[ \t]+$/,"",expr)
      if (expr ~ /^TEXT\(/) { nm=expr; gsub(/TEXT\(|\)|"/,"",nm) }
      else {
        n=expr; sub(/^.*::/,"",n); nm=(n in constmap)? constmap[n] : ""
        # 兜底: 未映射的 XxxName 常量按惯例去掉 Name 后缀作显示名
        if (nm=="" && n ~ /Name$/) { nm=n; sub(/Name$/,"",nm) }
      }
      fname=(nm=="")? expr : nm; dynamic=(nm=="")?1:0
      nin=""; nout=""; flags=""; desc=""
      next
    }
    # 参数行
    /\.Add(Input|Output)/ {
      t=$0; ty="?"
      if (match(t, /Get[A-Za-z0-9]+Def\(\)/)) { ty=substr(t,RSTART,RLENGTH-5); sub(/^Get/,"",ty); sub(/Def$/,"",ty) }
      else if (match(t, /StaticEnum<[^>]+>/)) { ty="enum:" substr(t,RSTART+12,RLENGTH-13) }
      else if (t ~ /StaticClass\(\)/ || t ~ /GetClass\(\)/) ty="DI"
      pn=""
      if (match(t, /TEXT\("[A-Za-z0-9_ .]+"\)/)) pn=substr(t,RSTART+6,RLENGTH-8)  # 减 8 = 去 TEXT(" 和 ")
      if (t ~ /\.AddInput/) nin=nin (nin==""?"":", ") ty" "pn
      else nout=nout (nout==""?"":", ") ty" "pn
      next
    }
    # 官方描述行：LOCTEXT("Key", "Text...") / NSLOCTEXT("Ns", "Key", "Text...")
    # 文本可含 \n\ 续行与转义引号，累积到引号+括号平衡为止
    /\.Description = (N?LOCTEXT)\(/ {
      d=$0
      if ($0 !~ /\).*$/) { while ((getline more)>0) { d=d" "more; if (more ~ /"\)/) break } }
      sub(/^.*\.Description = /, "", d)
      isNS=(d ~ /^NSLOCTEXT/)
      sub(/^(N?LOCTEXT)\(/, "", d); sub(/\);?[ \t]*$/, "", d)
      # 跳过 Key（NSLOCTEXT 还要跳 Namespace），取最后的整段文本
      nskip=(isNS? 2 : 1); rest=d
      for (i=0; i<nskip; i++) { if (match(rest, /"[^"]*",/)) rest=substr(rest, RSTART+RLENGTH) }
      txt=rest; gsub(/^ "|"$/,"",txt)
      gsub(/\\n\\?|\\r/, " ", txt); gsub(/\\"/, "\"", txt); gsub(/_[ _]+/, "_", txt)
      gsub(/ +/, " ", txt)
      desc=txt
      next
    }
    /bRequiresExecPin = true/ { flags=flags "E" }
    /bSupportsGPU = false/   { flags=flags ",G✗" }
    /bSupportsCPU = false/   { flags=flags ",C✗" }
    function emit() {
      if (!(fname in printed)) {
        printf "| %s | %s | %s | %s | %s |\n", (dynamic?"⏵"fname:fname), (nin==""?"—":nin), (nout==""?"—":nout), (flags==""?"—":flags), (desc==""?"—":desc)
        printed[fname]=1
      }
    }
    END { if (fname != "") emit() }
  ' "$f")
  if [ -n "$tbl" ]; then echo "@@@ $di" >> "$out"; echo "$tbl" >> "$out"; fi
done
echo "DI 数: $(grep -c '^@@@' "$out")，函数行: $(grep -c '^|' "$out")"

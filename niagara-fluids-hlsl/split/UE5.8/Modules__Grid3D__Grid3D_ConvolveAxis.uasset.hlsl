ConvolvedValue = 0;
int3 CurrCell = int3(IndexX, IndexY, IndexZ);
int3 MaxCells = int3(NumCellsX, NumCellsY, NumCellsZ)  - 1;
for (int uu = -Radius; uu <= Radius; ++uu) {
  int3 SampleVec = uu * ConvAxis;
  int3 CurrIndex = clamp(CurrCell + SampleVec, int3(0,0,0), MaxCells);
  float Sample;
  Grid.GetPreviousFloatValueAtIndex(CurrIndex.x, CurrIndex.y, CurrIndex.z, AttributeIndex, Sample);
  float KernelValue;
  Kernel.Get(abs(uu), KernelValue);
  ConvolvedValue += Sample * KernelValue;
  Grid.GetFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, AttributeIndex, Sample);
;W/èÀ]
  KernelGrid.GetPreviousFloatValue<Attribute="k">(abs(uu), 0, KernelValue);
;W/èÀ]‹
HµÚ6;³H
;© û(æåF
šºL¤;33
è—1YÂ*;×÷´T
‡dùïn;ÉG¦Ş=mú€D(ˆ
Áƒ*—ö¥€.;ÄÑ


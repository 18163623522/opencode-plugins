BlurredValue = 0;
float TotalKernel = 0.f;
int2 CurrCell = int2(IndexX, IndexY);
int2 MaxCells = int2(NumCellsX, NumCellsY)  - 1;
for (int xx = -Radius; xx <= Radius; ++xx) {
for (int yy = -Radius; yy <= Radius; ++yy) {
  int2 SampleVec = int2(xx,yy);
  int2 SampelCell = clamp(CurrCell + SampleVec, int2(0,0), MaxCells);
  float2 Sample;
  Grid.GetPreviousValueAtIndex(SampelCell.x, SampelCell.y, VectorIndex, Sample.x);
  Grid.GetPreviousValueAtIndex(SampelCell.x, SampelCell.y, VectorIndex+1, Sample.y);
  float KernelValue = length(float2(1. - 1. * abs(xx)/(Radius+1), 1. - 1. * abs(yy)/(Radius+1)));
  TotalKernel += KernelValue;
  BlurredValue += Sample * KernelValue;
    BlurredValue /= TotalKernel;
$;‘Mº¬Êf»rH'
$;‘Mº¬Êf»rH'€
=B F;e
4‚>>;µ
Áƒ*ž—ö¥€.;ÄÑ


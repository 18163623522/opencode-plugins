BlurredValue = 0;
float Width = Radius * 2. + 1;
float Sigma = (Radius - 1.) / 6.;
float TwoSigmaSquared = 2. * Sigma * Sigma;
float Coeff = 1./(sqrt(2 * 3.141569) * Sigma);
float3 TotalKernel = float3(0.0,0.0,0.0);
int2 CurrCell = int2(IndexX, IndexY);
int2 MaxCells = int2(NumCellsX, NumCellsY)  - 1;
for (int xx = -Radius; xx <= Radius; ++xx) {
for (int yy = -Radius; yy <= Radius; ++yy) {
  int2 SampleVec = int2(xx,yy);
  int2 SampelCell = clamp(CurrCell + SampleVec, int2(0,0), MaxCells);
  float SampleX;
  Grid.GetPreviousValueAtIndex(SampelCell.x, SampelCell.y, ScalarIndex, SampleX);
  float SampleY;
  Grid.GetPreviousValueAtIndex(SampelCell.x, SampelCell.y, ScalarIndex, SampleY);
  float SampleZ;
  Grid.GetPreviousValueAtIndex(SampelCell.x, SampelCell.y, ScalarIndex, SampleZ);
  float3 Sample = float3(SampleX,SampleY,SampleZ);
  float KernelValue = Coeff * exp(-1. * length2(SampleVec) / (TwoSigmaSquared)); 
  TotalKernel += KernelValue;
  BlurredValue += Sample * KernelValue;
BlurredValue /= TotalKernel;


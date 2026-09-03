BlurredValue = 0;
float Width = Radius * 2. + 1;
float Sigma = (Radius - 1.) / 6.;
float TwoSigmaSquared = 2. * Sigma * Sigma;
float Coeff = 1./(sqrt(2 * 3.141569) * Sigma);
float TotalKernel = 0;
int2 CurrCell = int2(IndexX, IndexY);
int2 MaxCells = int2(NumCellsX, NumCellsY)  - 1;
for (int xx = -Radius; xx <= Radius; ++xx) {
for (int yy = -Radius; yy <= Radius; ++yy) {
  int2 SampleVec = int2(xx,yy);
  int2 SampelCell = clamp(CurrCell + SampleVec, int2(0,0), MaxCells);
  float Sample;
  Grid.GetPreviousValueAtIndex(SampelCell.x, SampelCell.y, ScalarIndex, Sample);
  float KernelValue = Coeff * exp(-1. * length2(SampleVec) / (TwoSigmaSquared)); 
  TotalKernel += KernelValue;
  BlurredValue += Sample * KernelValue;
BlurredValue /= TotalKernel;
  float centerSample;
  Grid.GetPreviousValueAtIndex(CurrCell.x, CurrCell.y, ScalarIndex, centerSample);
  float delta = (Sample-centerSample);
  if ( delta < MaxPositiveDelta && delta > MaxNegativeDelta) {
      float KernelValue = Coeff * exp(-1. * length2(SampleVec) / (TwoSigmaSquared)); 
      TotalKernel += KernelValue;
      BlurredValue += Sample * KernelValue;
BlurredValue /= max(TotalKernel,1.0f);
    BlurredValue = centerSample;


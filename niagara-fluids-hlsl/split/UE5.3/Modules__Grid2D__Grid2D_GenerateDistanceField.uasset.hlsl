float Width = Radius * 2. + 1;
TotalKernel = 0;
float KernelValue = 1.0f;
int2 CurrCell = int2(IndexX, IndexY);
int2 MaxCells = int2(NumCellsX, NumCellsY)  - 1;
float CenterBitmaskSample;
Grid.GetPreviousValueAtIndex(CurrCell.x, CurrCell.y, BitmaskAttIndex, CenterBitmaskSample);
for (int xx = -Radius; xx <= Radius; ++xx) {
for (int yy = -Radius; yy <= Radius; ++yy) {
    int2 SampleVec = int2(xx,yy);
    int2 SampelCell = clamp(CurrCell + SampleVec, int2(0,0), MaxCells);
    float BitmaskSample;
    Grid.GetPreviousValueAtIndex(SampelCell.x, SampelCell.y, BitmaskAttIndex, BitmaskSample);
    float DistanceFieldFalloff = saturate(length (SampleVec)/Radius);
    if ( CenterBitmaskSample>0.0f && BitmaskSample == 0){
        KernelValue = min(KernelValue, DistanceFieldFalloff);
TotalKernel = KernelValue*CenterBitmaskSample;


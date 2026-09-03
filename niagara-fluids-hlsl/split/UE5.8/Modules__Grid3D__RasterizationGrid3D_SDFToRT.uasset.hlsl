BlurredValue = 0;
float Width = Radius * 2. + 1;
float Sigma = (Radius - 1.) / 6.;
float TwoSigmaSquared = 2. * Sigma * Sigma;
float Coeff = 1./(sqrt(2 * 3.141569) * Sigma);
float TotalKernel = 0;
int3 CurrCell = int3(IndexX, IndexY, IndexZ);
int3 MaxCells = int3(NumCellsX, NumCellsY, NumCellsZ)  - 1;
for (int xx = -Radius; xx <= Radius; ++xx) {
for (int yy = -Radius; yy <= Radius; ++yy) {
for (int zz = -Radius; zz <= Radius; ++zz) {
  int3 SampleVec = int3(xx,yy,zz);
  int3 CurrIndex = clamp(CurrCell + SampleVec, int3(0,0,0), MaxCells);
 if (  CurrIndex.x >= 0 && CurrIndex.x < NumCellsX &&
        CurrIndex.y >= 0 && CurrIndex.y < NumCellsY &&
        CurrIndex.z >= 0 && CurrIndex.z < NumCellsZ) 
    float Sample;
    Grid.GetFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, 0, Sample);
    float KernelValue = Coeff * exp(-1. * length2(SampleVec) / (TwoSigmaSquared)); 
    TotalKernel += KernelValue;
    BlurredValue += Sample * KernelValue;
BlurredValue /= TotalKernel;
;W/èÀ]
float MaxDist = length(float3(Radius, Radius, Radius));
    float KernelValue = 1. - smoothstep(0, MaxDist, length(SampleVec));
    TotalKernel+=KernelValue;
    BlurredValue += Sample;
    TotalKernel++;
ˆx½âvk`L•¾W0;ƒS²¦
ÌfgR uêH‚àô_ð;J©
¤€,tÐmðN²’ø½;É&
;W/èÀ]«
¥®{×#ÿ;G€^AŠ
´H;û¦©
Hd;} #
=y;f9PIá
RÞõ;M¨
;© û(æåF
Hdî•;„ìzªz±
Áƒ*ž—ö¥€.;ÄÑ


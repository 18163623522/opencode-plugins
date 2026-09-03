SÀ¼w;µù
SÀ¼w;µá
SÀ¼w;µ
Occlusion = 0;
Normal = 0;
int3 NumCellsVec = int3(NumCellsX, NumCellsY, NumCellsZ);
int NumCellsDiag = length(NumCellsVec);
int3 RayStart = int3(IndexX, IndexY, IndexZ);
// Initialize Normal to avoid zero length output.
float3 DefaultNorm = normalize(float3(RayStart) - (float3(NumCellsVec) * 0.5));
    Occlusion = 1;
    Normal = DefaultNorm;
    return;
for (int xx = -1; xx <= 1; ++xx) {
for (int yy = -1; yy <= 1; ++yy) {
for (int zz = -1; zz <= 1; ++zz) {
    float Transmittance = 1.0;
    float3 N = float3(0, 0, 0);
    int3 RayDir = int3(xx, yy, zz) / RenderQuality;
    float  WorldStepSize = length(float3(RayDir)) * dx;
    float3 RayDirNorm = (WorldStepSize > 0.0) ? normalize(float3(RayDir)) : DefaultNorm;
    float CurrDensityMult = DensityMult * WorldStepSize;
    int NumStepsForRay = min(MaxNumSteps, NumCellsDiag);
    int3 CurrPos = RayStart;
    for (int i = 0; i < NumStepsForRay && Transmittance > 1e-5 && 
        CurrPos.x >= 0 && CurrPos.x < NumCellsX &&
        CurrPos.y >= 0 && CurrPos.y < NumCellsY &&
        CurrPos.z >= 0 && CurrPos.z < NumCellsZ;
        float Density = 0;
        Grid.GetGridValue(CurrPos.x, CurrPos.y, CurrPos.z, DensityIndex, Density); 
        if( UseDensityCurve )
          float remap = (Density - DensityCurveOffset) / DensityCurveRange;
          DensityCurve.SampleCurve(remap, Density);
        Transmittance *= exp(-1. * Density * CurrDensityMult);
        RayDirNorm *= 1.0 + (1.0 - exp(-1. * Density * CurrDensityMult));
        CurrPos = RayStart + RayDir * i;
    Occlusion += Transmittance;
    Normal += -1. * RayDirNorm;
Occlusion /= 27.;
Normal /= 27.;
=;E¾I^W”¦
wSuŒ{;·J¾ì
wseó!`$AšÐ;
=B F;e
°ðB¢€Y;P„ ò
šh­;hžDƒ
 _§(È.AH´Ñðt’wwÃ
Áƒ*ž—ö¥€.;ÄÑ


Occlusion = 0;
int3 NumCellsVec = int3(NumCellsX, NumCellsY, NumCellsZ);
int NumCellsDiag = length(NumCellsVec);
int3 RayStart = int3(IndexX, IndexY, IndexZ);
    return;
for (int xx = -1; xx <= 1; ++xx) {
for (int yy = -1; yy <= 1; ++yy) {
for (int zz = -1; zz <= 1; ++zz) {
    float Transmittance = 1.0;
    int3 RayDir = int3(xx, yy, zz) / RenderQuality;
    float  WorldStepSize = length(float3(RayDir)) * dx;
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
        CurrPos = RayStart + RayDir * i;
    Occlusion +=Transmittance;
Occlusion /= 27.;
=;E¾I^W”¦
;å†Cè¶ü©X–o‹
=B F;e
°ðB¢€Y;P„ ò
qÔùÇt’–KÈ};
Áƒ*ž—ö¥€.;ÄÑ


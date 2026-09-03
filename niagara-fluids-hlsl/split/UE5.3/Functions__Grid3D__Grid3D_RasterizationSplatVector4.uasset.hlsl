int IGNORE;
const int IntParticleRadius = round(ParticleIndexRadius);
for (int xx = -IntParticleRadius; xx <= IntParticleRadius; ++xx) {
for (int yy = -IntParticleRadius; yy <= IntParticleRadius; ++yy) {
for (int zz = -IntParticleRadius; zz <= IntParticleRadius; ++zz) {
    const int3 Offset = int3(xx,yy,zz);
    const int3 CurrIndex = FloatIndex + Offset;
    if (CurrIndex.x >= 0 && CurrIndex.x < NumCellsX && 
        CurrIndex.y >= 0 && CurrIndex.y < NumCellsY &&
        CurrIndex.z >= 0 && CurrIndex.z < NumCellsZ) 
        const float Falloff = 1. - smoothstep(ParticleIndexRadius-1.41421, ParticleIndexRadius+1, length(FloatIndex - CurrIndex));
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+0, VectorValue.x * Falloff, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+1, VectorValue.y * Falloff, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+2, VectorValue.z * Falloff, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+3, VectorValue.w * Falloff, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+4, Falloff, IGNORE);
    if (length(Offset) <= ParticleIndexRadius && 
        CurrIndex.x >= 0 && CurrIndex.x < NumCellsX && 
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+0, VectorValue.x, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+1, VectorValue.y, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+2, VectorValue.z, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+3, VectorValue.w, IGNORE);
        Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+4, 1.0, IGNORE);
int NumStreakParticles = 1;
    NumStreakParticles = min(MaxStreakSamples, max(1, StreakDensity * IndexVelocityMagnitude / (2. * ParticleIndexRadius)));
// Don't normalize for vector4s for now
float4 ValueToUse = Vector4Value;// / NumStreakParticles;
for (int ww = 0; ww < NumStreakParticles; ++ww)
    float StreakPosition = 1.0 * ww / NumStreakParticles;
    float3 FloatIndexToUse = FloatIndex - StreakPosition * IndexVelocity;
    float ParticleIndexRadiusToUse = lerp(ParticleIndexRadius, PreviousParticleIndexRadius, StreakPosition);
    int IntParticleRadius = ceil(ParticleIndexRadiusToUse);
    for (int xx = -IntParticleRadius; xx <= IntParticleRadius; ++xx) {
    for (int yy = -IntParticleRadius; yy <= IntParticleRadius; ++yy) {
    for (int zz = -IntParticleRadius; zz <= IntParticleRadius; ++zz) {
        const int3 Offset = int3(xx,yy,zz);
        const int3 CurrIndex = FloatIndexToUse + Offset;
        if (length(Offset) <= ParticleIndexRadiusToUse && 
            CurrIndex.x >= 0 && CurrIndex.x < NumCellsX && 
            CurrIndex.y >= 0 && CurrIndex.y < NumCellsY &&
            CurrIndex.z >= 0 && CurrIndex.z < NumCellsZ) 
            float Falloff = 1.0;
            if (UseFalloff)
               Falloff = 1. - smoothstep(max(0,ParticleIndexRadiusToUse-2.41421), ParticleIndexRadiusToUse, length(FloatIndexToUse - CurrIndex));
            Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+0, ValueToUse.x * Falloff, IGNORE);
            Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+1, ValueToUse.y * Falloff, IGNORE);
            Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+2, ValueToUse.z * Falloff, IGNORE);
            Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+3, ValueToUse.w * Falloff, IGNORE);
            if (UseWeightGrid)
                // Required an extra grid so the average value can be calculated. Max operations will not work for vectors with negative values.
                Grid.InterlockedAddFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex+4, Falloff, IGNORE);


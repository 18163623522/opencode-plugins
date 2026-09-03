;SnFRM
int IGNORE;
int NumStreakParticles = 1;
    NumStreakParticles = min(MaxStreakSamples, max(1, StreakDensity * IndexVelocityMagnitude / (2. * ParticleIndexRadius)));
const float3 VectorValueToUse = AverageStreakedVelocity ? VectorValue / NumStreakParticles : VectorValue;
for (int ww = 0; ww < NumStreakParticles; ++ww)
    const float StreakPosition = 1.0 * ww / NumStreakParticles;
    const float3 FloatIndexToUse = FloatIndex - StreakPosition * IndexVelocity;
    const float ParticleIndexRadiusToUse = lerp(ParticleIndexRadius, PreviousParticleIndexRadius, StreakPosition);
    const int IntParticleRadius = ceil(ParticleIndexRadiusToUse);
    for (int xx = -IntParticleRadius; xx <= IntParticleRadius; ++xx) {
    for (int yy = -IntParticleRadius; yy <= IntParticleRadius; ++yy) {
    for (int zz = -IntParticleRadius; zz <= IntParticleRadius; ++zz) {
        const int3 Offset = int3(xx,yy,zz);
        const int3 CurrIntIndex = FloatIndexToUse + Offset;
        if (length(Offset) <= ParticleIndexRadiusToUse && 
            CurrIntIndex.x >= 0 && CurrIntIndex.x < NumCellsX && 
            CurrIntIndex.y >= 0 && CurrIntIndex.y < NumCellsY &&
            CurrIntIndex.z >= 0 && CurrIntIndex.z < NumCellsZ) 
            Grid.SetVector3ValueAtIndex(CurrIntIndex.x,CurrIntIndex.y, CurrIntIndex.z, GridAttributeIndex, VectorValueToUse);


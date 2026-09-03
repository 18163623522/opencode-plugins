;4Üî¹1$(‚‚X­'øÙ-Ük
int IGNORE;
const int NumStreakParticles = min(MaxStreakSamples, max(1, StreakDensity * IndexVelocityMagnitude / (2. * ParticleIndexRadius)));
const float2 Vector2DValueToUse = Vector2DValue / NumStreakParticles;
for (int ww = 0; ww < NumStreakParticles; ++ww)
    const float StreakPosition = 1.0 * ww / NumStreakParticles;
    const float3 FloatIndexToUse = FloatIndex - StreakPosition * IndexVelocity;
    const float ParticleIndexRadiusToUse = lerp(ParticleIndexRadius, PreviousParticleIndexRadius, StreakPosition);
    const int IntParticleRadius = ceil(ParticleIndexRadiusToUse);
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
            Grid.SetVector2ValueAtIndex(CurrIndex.x, CurrIndex.y, CurrIndex.z, GridAttributeIndex, Vector2DValueToUse * Falloff);
 P¼Aö·•B¯
int NumStreakParticles = 1;
    NumStreakParticles = min(MaxStreakSamples, max(1, StreakDensity * IndexVelocityMagnitude / (2. * ParticleIndexRadius)));
ô2Ì;R¿ãM¹§
Áƒ*ž—ö¥€.;ÄÑ


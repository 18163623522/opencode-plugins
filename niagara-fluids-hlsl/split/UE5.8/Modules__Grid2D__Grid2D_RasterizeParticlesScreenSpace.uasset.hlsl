YåKj±lcF¡çd`ëÄ∏cπ_;
Ù˙;6ìmTCÉ`ôeXJ¢$
–LèrÁë;
MinWorld = float3(0,0,0);
MaxWorld = float3(0,0,0);
float3 MinLocal = 3.402823466e+38F;
float3 MaxLocal = -3.402823466e+38F;
const float3 RayStart = CameraPosLocal;
const float3 PlaneOrigin = float3(0,0,0);
const float3 PlaneNormal = float3(0,0,-1);
for (int x = -1; x <= 1; x+=2) {
for (int y = -1; y <= 1; y+=2) {
    float3 RayDir = normalize(ParticlePosLocal + float3(x,y,0) * ParticleRadius - RayStart);
    float t;
    // assuming vectors are all normalized
    float denom = dot(PlaneNormal, RayDir);
    if (denom > 1e-6) {
        float3 p0l0 = PlaneOrigin - RayStart;
        t = dot(p0l0, PlaneNormal) / denom; 
        if (t >= 0)
            float3 Tmp = RayStart + RayDir * t;
            MinLocal = min(MinLocal, Tmp);
            MaxLocal = max(MaxLocal, Tmp);
MinWorld = mul(float4(MinLocal, 1.0), LocalToWorld).xyz;
MaxWorld = mul(float4(MaxLocal, 1.0), LocalToWorld).xyz;
float3 MinUnit = mul(float4(MinWorld, 1.0), WorldToUnit).xyz;
float3 MaxUnit = mul(float4(MaxWorld, 1.0), WorldToUnit).xyz;
float3 MinIndex;
float3 MaxIndex;
Grid.UnitToFloatIndex(MinUnit, MinIndex);
Grid.UnitToFloatIndex(MaxUnit, MaxIndex);
float RadiusLocalSquared = ParticleRadius * ParticleRadius;
int IGNORE;
int MinX = max(MinIndex.x, 0);
int MinY = max(MinIndex.y, 0);
int MaxX = min(MaxIndex.x, NumCellsX-1);
int MaxY = min(MaxIndex.y, NumCellsY-1);
float3 L = CameraPosLocal - ParticlePosLocal;
float c = dot(L, L) - RadiusLocalSquared;
const float4x4 UnitToLocal = mul(UnitToWorld, WorldToLocal);
for (int xx = MinX; xx <= MaxX; ++xx) {
for (int yy = MinY; yy <= MaxY; ++yy) {
    float3 GridUnit;
    Grid.IndexToUnit(xx, yy, 0, GridUnit);
    const float3 GridLocal = mul(float4(GridUnit, 1.0), UnitToLocal).xyz;
    const float3 RayDir = normalize(GridLocal - CameraPosLocal);
    const float a = 1.0;// dot(RayDir, RayDir); length is 1
    const float b = 2.0 * dot(RayDir, L);
    float x0 = 0;
    float x1 = 0;
    float discr = b * b - 4.0 * a * c;
    if (discr < 1e-5) 
        continue;
    else if (abs(discr) < 1e-5)
        x0 = x1 = - 0.5 * b / a;
    else 
        float SqrtDiscr = sqrt(discr); 
        float q = (b > 0) ?
            -0.5 * (b - SqrtDiscr);
        x0 = q / a;
        x1 = c / q;
    float Dist = min(x0, x1);
    float DistMax = max(x0, x1);
    const float3 WorldRayDir = mul(float4(RayDir, 0), LocalToWorld).xyz;
    const float DistMult = dot(normalize(WorldRayDir), CameraDirectionVector);
    Dist *= DistMult;
    DistMax *= DistMult;
    Grid.InterlockedMinFloatGridValue(xx, yy, 0, 0, Dist, IGNORE);    
    GridBack.InterlockedMaxFloatGridValue(xx, yy, 0, 0, DistMax, IGNORE);    
DØ«WuWÇ*’;
// ------------------- determine grid bounds for projected sphere -------------------
for (int z = -1; z <= 1; z+=2) {
    const float3 RayDir = normalize(ParticlePosLocal + float3(x,y,z) * ParticleRadius - RayStart);
        const float3 p0l0 = PlaneOrigin - RayStart;
        const float t = dot(p0l0, PlaneNormal) / denom; 
            const float3 Tmp = RayStart + RayDir * t;
const float3 MinWorld = mul(float4(MinLocal, 1.0), LocalToWorld).xyz;
const float3 MaxWorld = mul(float4(MaxLocal, 1.0), LocalToWorld).xyz;
const float2 MinUnit = mul(float4(MinWorld, 1.0), WorldToUnit).xy;
const float2 MaxUnit = mul(float4(MaxWorld, 1.0), WorldToUnit).xy;
float2 MinIndex;
float2 MaxIndex;
const float2 NumCellsVec = float2(NumCellsX, NumCellsY);
MinIndex = MinUnit * NumCellsVec - 0.5;
MaxIndex = MaxUnit * NumCellsVec - 0.5;
const int MinX = max(MinIndex.x, 0);
const int MinY = max(MinIndex.y, 0);
const int MaxX = min(MaxIndex.x, NumCellsX-1);
const int MaxY = min(MaxIndex.y, NumCellsY-1);
// ------------------- accumulate -------------------
const float RadiusLocalSquared = ParticleRadius * ParticleRadius;
const float3 L = CameraPosLocal - ParticlePosLocal;
const float c = dot(L, L) - RadiusLocalSquared;
    const float3 GridUnit = float3((float2(xx, yy) + 0.5) / NumCellsVec, 0); 
    if (discr < 0.0) 
    else if (abs(discr) < 0.0)
    const float Dist = min(x0, x1) * DistMult;
    const float DistMax = max(x0, x1) * DistMult;
û\ÛJ¸¢;
;˜$¨»Ï
;˜$¨»!
=L;üîË
BØ∑+ya;V.1
BØ∑+ya;V.Ë
BØ∑+ya;V.6
«;Æv‘Lãà˝dÖiÔã>
«;Æv‘Lãà˝dÖiÔã
«;Æv‘Lãà˝dÖiÔã?
bÔ«Ÿzó…I§T•ï;
¡É*ûóˆ•Ä.;ƒ—


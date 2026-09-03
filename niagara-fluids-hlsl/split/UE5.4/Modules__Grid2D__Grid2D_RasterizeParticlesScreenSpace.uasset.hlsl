float3 MinLocal = 3.402823466e+38F;
float3 MaxLocal = -3.402823466e+38F;
float3 RayStart = CameraPosLocal;
float3 PlaneOrigin = float3(0,0,0);
float3 PlaneNormal = float3(0,0,-1);
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
            //float3 tmpW1= mul(float4(Tmp, 1.0), LocalToWorld).xyz;
            //DebugDraw.DrawSphere(true, tmpW1, 10, 7, float4(1,0,0,1));
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
for (int xx = MinX; xx <= MaxX; ++xx) {
for (int yy = MinY; yy <= MaxY; ++yy) {
    const int3 Offset = int3(xx,yy,0);
    const int3 CurrIndex = Offset;
    float3 GridIndex = float3(CurrIndex);
    float3 GridUnit;
    Grid.IndexToUnit(GridIndex.x, GridIndex.y, 0, GridUnit);
    float3 GridWorld = mul(float4(GridUnit, 1.0), UnitToWorld).xyz;
    float3 GridLocal = mul(float4(GridWorld, 1.0), WorldToLocal).xyz;    
    float3 RayDir = normalize(GridLocal - CameraPosLocal);
    float3 L = CameraPosLocal - ParticlePosLocal;
    float a = dot(RayDir, RayDir);
    float b = 2.0 * dot(RayDir, L);
    float c = dot(L, L) - RadiusLocalSquared;
    float x0, x1;
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
    Grid.InterlockedMinFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, 0, Dist, IGNORE);    
    GridBack.InterlockedMaxFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, 0, DistMax, IGNORE);    
+ya;V.
 mG|FK


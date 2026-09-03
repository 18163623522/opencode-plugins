float DensityOut = 0;
float2 VelocityOut = float2(0,0);
float TemperatureOut = 0;
int IGNORE = 0;
int MaxParticleCells = ceil(MaxParticleRadiusFloatIndex);
int2 ParticleCenterIntIndex = floor(ParticleCenterFloatIndex);
ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
float noiseScale = .05 * noiseScalePP;
float noiseIntensity = .2 * Radius * noiseIntensityPP;
float ParticleRadius = Radius * RadiusScale;
ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz;
for (int y = -ParticleRadiusIndex; y < ParticleRadiusIndex; ++y) {
for (int x = -ParticleRadiusIndex; x < ParticleRadiusIndex; ++x) {
    int2 CellIndex = int2(x,y) + ParticleCenterIntIndex;
    float3 CellUnit;
    Grid.IndexToUnit(CellIndex.x, CellIndex.y, CellUnit);
    float3 CellPos = mul(float4(CellUnit, 1.), UnitToSimulation).xyz;
    CellPos = mul(float4(CellPos, 1.), SimulationToLocal).xyz;        
    float noise = FastGradientPerlinNoise3D_TEX(float3(ParticlePos.xy,1.0)*noiseScale) *noiseIntensity;
    float Dist = length(CellPos - ParticlePos.xy) + noise;
    if (Dist <= ParticleRadius && 
         CellIndex.x >= 0 && CellIndex.x < NumCellsX &&
         CellIndex.y >= 0 && CellIndex.y < NumCellsY)
        float FalloffMult = 1. - pow(smoothstep(ParticleRadius * Core, ParticleRadius, Dist), Falloff);
        DensityOut = ParticleDensity * DensityMult * FalloffMult;
        TemperatureOut = ParticleTemperature * TemperatureMult * FalloffMult;
        VelocityOut = ParticleVel * VelocityMult * FalloffMult * VelocityScalePP;    
        Grid.SetFloatValue<Attribute="Density">(CellIndex.x,CellIndex.y, DensityOut);
        Grid.SetFloatValue<Attribute="Temperature">(CellIndex.x,CellIndex.y, TemperatureOut);
        Grid.SetVector2DValue<Attribute="Velocity">(CellIndex.x,CellIndex.y, VelocityOut);
9;;/Bn
 EdG{_


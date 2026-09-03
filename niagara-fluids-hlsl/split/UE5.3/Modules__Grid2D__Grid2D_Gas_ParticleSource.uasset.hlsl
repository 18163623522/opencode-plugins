DensityOut = Density;
VelocityOut = Velocity;
TemperatureOut = Temperature;
bool Valid;
////////////////////////////////////////////////////////
// Path when wave intrinsics are supported and all lanes are active
int ActiveLanes = WaveActiveCountBits(true);
for (int iWaveParticle = 0; iWaveParticle < NumParticles; iWaveParticle += ActiveLanes)
int iLaneParticle = iWaveParticle + WavePrefixSum(1);
float3 LaneParticlePosition = 0;
float LaneParticleRadius = 0;
float LaneParticleNoiseScale = 0;
float LaneParticleNoiseIntensity = 0;
ParticleReader.GetVectorByIndex<Attribute = "Position">(iLaneParticle, Valid, LaneParticlePosition);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_radius">(iLaneParticle, Valid, LaneParticleRadius);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseScale">(iLaneParticle, Valid, LaneParticleNoiseScale);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseIntensity">(iLaneParticle, Valid, LaneParticleNoiseIntensity);
LaneParticlePosition = mul(float4(LaneParticlePosition, 1.), SimulationToLocal).xyz;
float LaneParticleNoise = FastGradientPerlinNoise3D_TEX(float3(CellPos.xy + LaneParticlePosition.xy, 1.0) * .05 * LaneParticleNoiseScale) * .2 * LaneParticleRadius * LaneParticleNoiseIntensity;
LaneParticleRadius = LaneParticleRadius * RadiusScale;
int iLastLane = min(ActiveLanes, NumParticles - iWaveParticle);
for (int iLane = 0; iLane < iLastLane; ++iLane)
int iParticle = iWaveParticle + iLane;
float3 ParticlePosition = float3(WaveReadLaneAt(LaneParticlePosition.x, iLane), WaveReadLaneAt(LaneParticlePosition.y, iLane), WaveReadLaneAt(LaneParticlePosition.z, iLane));
float ParticleRadius = WaveReadLaneAt(LaneParticleRadius, iLane);
float ParticleNoiseScale = WaveReadLaneAt(LaneParticleNoiseScale, iLane);
float ParticleNoiseIntensity = WaveReadLaneAt(LaneParticleNoiseIntensity, iLane);
float ParticleNoise = FastGradientPerlinNoise3D_TEX(float3(CellPos.xy + ParticlePosition.xy, 1.0) * ParticleNoiseScale) * ParticleNoiseIntensity;
float ParticleNoise = SimplexNoise3D_TEX(float3(CellPos.xy + ParticlePosition.xy, 1.0) * ParticleNoiseScale) * ParticleNoiseIntensity;
#else //PER_PARTICLE_NOISE
float ParticleNoise = WaveReadLaneAt(LaneParticleNoise, iLane);
#endif //PER_PARTICLE_NOISE
float Dist = length(CellPos.xy - ParticlePosition.xy) + ParticleNoise;
float ParticleDensity = 0;
float ParticleTemperature = 0;
float ParticleVelocityScale = 0;
float3 ParticleVelocity = 0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_density">(iParticle, Valid, ParticleDensity);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_temperature">(iParticle, Valid, ParticleTemperature);
ParticleReader.GetVectorByIndex<Attribute = "fluids_source_velocity">(iParticle, Valid, ParticleVelocity);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_velocityScale">(iParticle, Valid, ParticleVelocityScale);
float FalloffMult = 1. - pow(smoothstep(ParticleRadius * Core, ParticleRadius, Dist), Falloff);
ParticleDensity *= DensityMult * FalloffMult;
ParticleTemperature *= TemperatureMult * FalloffMult;
ParticleVelocity = mul(float4(ParticleVelocity, 0.), SimulationToLocal).xyz;
ParticleVelocity *= VelocityMult * ParticleVelocityScale * FalloffMult;
DensityOut += ParticleDensity;
TemperatureOut += ParticleTemperature;
VelocityOut += ParticleVelocity.xy;
DensityOut = max(DensityOut, ParticleDensity);
TemperatureOut = max(TemperatureOut, ParticleTemperature);
if (dot(ParticleVelocity.xy, ParticleVelocity.xy) > dot(VelocityOut, VelocityOut)) VelocityOut = ParticleVelocity.xy;
#else //PLATFORM_SUPPORTS_SM6_0_WAVE_OPERATIONS
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 ParticlePos = float3(0, 0, 0);
ParticleReader.GetVectorByIndex<Attribute = "Position">(CurrIdx, Valid, ParticlePos);
ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
float VelocityScalePP = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_velocityScale">(CurrIdx, Valid, VelocityScalePP);
float Radius = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_radius">(CurrIdx, Valid, Radius);
float noiseScalePP = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseScale">(CurrIdx, Valid, noiseScalePP);
float noiseIntensityPP = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseIntensity">(CurrIdx, Valid, noiseIntensityPP);
float noiseScale = .05 * noiseScalePP;
float noiseIntensity = .2 * Radius * noiseIntensityPP;
float noise = FastGradientPerlinNoise3D_TEX(float3(CellPos.xy + ParticlePos.xy, 1.0) * noiseScale) * noiseIntensity;
float Dist = length(CellPos - ParticlePos.xy) + noise;
float ParticleRadius = Radius * RadiusScale;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_density">(CurrIdx, Valid, ParticleDensity);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_temperature">(CurrIdx, Valid, ParticleTemperature);
float3 ParticleVel = float3(0, 0, 0);
ParticleReader.GetVectorByIndex<Attribute = "fluids_source_velocity">(CurrIdx, Valid, ParticleVel);
ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz;
ParticleVel *= VelocityMult * VelocityScalePP * FalloffMult;
VelocityOut += ParticleVel;
if (dot(ParticleVel, ParticleVel) > dot(VelocityOut, VelocityOut)) VelocityOut = ParticleVel;
#endif //PLATFORM_SUPPORTS_SM6_0_WAVE_OPERATIONS
#endif //GPU_SIMULATION
float DensityOut = 0;
float2 VelocityOut = float2(0,0);
float TemperatureOut = 0;
int IGNORE = 0;
int MaxParticleCells = ceil(MaxParticleRadiusFloatIndex);
int2 ParticleCenterIntIndex = floor(ParticleCenterFloatIndex);
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
        Grid.SetGridValue(CellIndex.x,CellIndex.y, 0, VelocityOut.x, IGNORE);
        Grid.SetGridValue(CellIndex.x,CellIndex.y, 1, VelocityOut.y, IGNORE);
        Grid.SetGridValue(CellIndex.x,CellIndex.y, 2, DensityOut, IGNORE);
        Grid.SetGridValue(CellIndex.x,CellIndex.y, 3, TemperatureOut, IGNORE);
  DensityOut /= Count;
  VelocityOut /= Count;
  TemperatureOut /= Count;
int2 CellIndex = ParticleCenterIntIndex;  
     CellIndex.y >= 0 && CellIndex.y < NumCellsY)
    float FalloffMult = 1.;
    DensityOut = ParticleDensity * DensityMult * FalloffMult;
    TemperatureOut = ParticleTemperature * TemperatureMult * FalloffMult;
    VelocityOut = ParticleVel * VelocityMult * FalloffMult * VelocityScalePP;    
    Grid.SetGridValue(CellIndex.x,CellIndex.y, 0, VelocityOut.x, IGNORE);
    Grid.SetGridValue(CellIndex.x,CellIndex.y, 1, VelocityOut.y, IGNORE);
    Grid.SetGridValue(CellIndex.x,CellIndex.y, 2, DensityOut, IGNORE);
    Grid.SetGridValue(CellIndex.x,CellIndex.y, 3, TemperatureOut, IGNORE);
int MaxNeighborsPerCell;
NeighborGrid.MaxNeighborsPerCell(MaxNeighborsPerCell);
for (int i = 0; i < MaxNeighborsPerCell; ++i)
    int3 IndexToUse;
    NeighborGrid.UnitToIndex(float3(Unit,0), IndexToUse.x, IndexToUse.y, IndexToUse.z);
int NeighborLinearIndex;
NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, 0, i, NeighborLinearIndex);
int CurrIdx;
NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrIdx);
float3 ParticlePos  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Position">(CurrIdx, Valid, ParticlePos);
    ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
    float VelocityScalePP = 0.0;
    ParticleReader.GetFloatByIndex<Attribute="fluids_source_velocityScale">(CurrIdx, Valid, VelocityScalePP);
    float Radius= 0.0;
    ParticleReader.GetFloatByIndex<Attribute="fluids_source_radius">(CurrIdx, Valid, Radius);
    float noiseScalePP = 0.0;
    ParticleReader.GetFloatByIndex<Attribute="fluids_source_noiseScale">(CurrIdx, Valid, noiseScalePP);
    float noiseIntensityPP = 0.0;
    ParticleReader.GetFloatByIndex<Attribute="fluids_source_noiseIntensity">(CurrIdx, Valid, noiseIntensityPP);
    float noiseScale = .05 * noiseScalePP;
    float noiseIntensity = .2 * Radius  * noiseIntensityPP;
    float noise = FastGradientPerlinNoise3D_TEX(float3(CellPos.xy + ParticlePos.xy,1.0)*noiseScale) *noiseIntensity;
    float ParticleRadius = Radius * RadiusScale;
    if (Dist <= ParticleRadius)
        float ParticleDensity = 0;
ParticleReader.GetFloatByIndex<Attribute="fluids_source_density">(CurrIdx, Valid, ParticleDensity);
        ParticleDensity *= DensityMult * FalloffMult;
        float ParticleTemperature = 0;
ParticleReader.GetFloatByIndex<Attribute="fluids_source_temperature">(CurrIdx, Valid, ParticleTemperature);
        ParticleTemperature *= TemperatureMult * FalloffMult;   
float3 ParticleVel  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="fluids_source_velocity">(CurrIdx, Valid, ParticleVel);
        ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz;
        ParticleVel *= VelocityMult * VelocityScalePP * FalloffMult;
        if( AddOrMax )
            DensityOut +=ParticleDensity;
            TemperatureOut +=ParticleTemperature;
            VelocityOut += ParticleVel;    
        else
            DensityOut = max(DensityOut, ParticleDensity);
            TemperatureOut = max(TemperatureOut, ParticleTemperature);
            if( dot(ParticleVel, ParticleVel) > dot(VelocityOut, VelocityOut) ) VelocityOut = ParticleVel;    
C = mul(A,B);
R(9v4;
 EdG{_


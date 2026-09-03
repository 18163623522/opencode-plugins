DensityOut = Density;
VelocityOut = Velocity;
TemperatureOut = Temperature;
DivergenceOut = 0;
if( ! Enable ) return;
bool Valid;
int MaxNeighborsPerCell;
NeighborGrid.MaxNeighborsPerCell(MaxNeighborsPerCell);
int3 IndexToUse;
int NeighborLinearIndex;
int CurrIdx;
for (int i = 0; i < MaxNeighborsPerCell; ++i)
    NeighborGrid.UnitToIndex(UnitScalar, IndexToUse.x, IndexToUse.y, IndexToUse.z);
NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, NeighborLinearIndex);
NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrIdx);
    float3 ParticlePos = float3(0, 0, 0);
ParticleReader.GetVectorByIndex<Attribute = "Position">(CurrIdx, Valid, ParticlePos);
ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
float Radius = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_radius">(CurrIdx, Valid, Radius);
float Dist = length(CellPosScalarGrid - ParticlePos);
float ParticleRadius = Radius * RadiusScale;
    float ParticleDensity = 0;
    float ParticleTemperature = 0;
    float3 ParticleVel = float3(0, 0, 0);
    float ParticleDivergence = 0;
    float NoiseScalePP = 1.;
    ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseScale">(CurrIdx, Valid, NoiseScalePP);
        NoiseScalePP = Valid  ? NoiseScalePP : 1;
    float NoiseIntensityPP = 1.;
    ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseIntensity">(CurrIdx, Valid, NoiseIntensityPP);
        NoiseIntensityPP = Valid  ? NoiseIntensityPP : 1;
    NoiseScale *= NoiseScalePP;
    NoiseIntensity *= NoiseIntensityPP;
 float FalloffMult = 1. - smoothstep(ParticleRadius * Core, ParticleRadius, Dist);
        float noise = 1.0;
        float3 QueryPos = ParticlePos;
        if( ParticleSpaceNoise )
            uint id = 0;
            ParticleReader.GetIntByIndex<Attribute = "UniqueID">(CurrIdx, Valid, id);
            float offset  = Valid  ? float(id) : 0.0;
            QueryPos += float3(offset, 0, 0) - CellPosScalarGrid;
        else
            QueryPos += CellPosScalarGrid;
       noise = .5 * (FastGradientPerlinNoise3D_TEX(( QueryPos) * NoiseScale + Time * NoiseSpeed) + 1);
       noise = pow(noise, Falloff);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_density">(CurrIdx, Valid, ParticleDensity);
ParticleDensity *= DensityMult * FalloffMult;
       ParticleDensity  = lerp(ParticleDensity, ParticleDensity * noise, NoiseIntensity);
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_temperature">(CurrIdx, Valid, ParticleTemperature);
ParticleTemperature *= TemperatureMult * FalloffMult;
       ParticleTemperature  = lerp(ParticleTemperature, ParticleTemperature * noise, NoiseIntensity);
    // velocity and divergence grid
    if (VelocityCurrCell < VelocityNumCells)
        NeighborGrid.UnitToIndex(UnitVelocity, IndexToUse.x, IndexToUse.y, IndexToUse.z);
    NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, NeighborLinearIndex);
    NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrIdx);
    ParticleReader.GetVectorByIndex<Attribute = "Position">(CurrIdx, Valid, ParticlePos);
    ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
    ParticleReader.GetFloatByIndex<Attribute = "fluids_source_radius">(CurrIdx, Valid, Radius);
    Dist = length(CellPosVelocityGrid - ParticlePos);
    ParticleRadius = Radius * RadiusScale * VelocityRadiusMult;
        if (CurrIdx >= 0 && Dist <= ParticleRadius)
           ParticleReader.GetVectorByIndex<Attribute = "fluids_source_velocity">(CurrIdx, Valid, ParticleVel);
    ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz * VelocityMult;
           ParticleReader.GetFloatByIndex<Attribute = "fluids_source_divergence">(CurrIdx, Valid, ParticleDivergence);      
           ParticleDivergence *= DivergenceMult;
    if (CompositingMethod == 0)
     DensityOut += ParticleDensity;
     TemperatureOut += ParticleTemperature;
   VelocityOut += ParticleVel;
            DivergenceOut += ParticleDivergence;
DensityOut = max(DensityOut, ParticleDensity);
TemperatureOut = max(TemperatureOut, ParticleTemperature);
if (dot(ParticleVel, ParticleVel) > dot(VelocityOut, VelocityOut)) VelocityOut = ParticleVel;
        DivergenceOut = max(DivergenceOut, ParticleDivergence);
#endif //GPU_SIMULATION
ﬂ÷Ÿ˘¨Mà;
I§yÚ;>„®‘
AwÅGÄB;ƒ9J{D
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 ParticlePos = float3(0, 0, 0);
float DistVelocity = length(CellPosVelocityGrid - ParticlePos);
    if (DistVelocity <= ParticleRadius * VelocityRadiusMult)
       ParticleReader.GetVectorByIndex<Attribute = "fluids_source_velocity">(CurrIdx, Valid, ParticleVel);
ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz * VelocityMult;
       ParticleReader.GetFloatByIndex<Attribute = "fluids_source_divergence">(CurrIdx, Valid, ParticleDivergence);      
       ParticleDivergence *= DivergenceMult;
AwÅGÄB;ƒ9J{DÁ
Ô˘c/QVY˝;_E≤"
B∫˛¢;Qóâ∞WÊ
Ã„D™˘=•TßÎìrHÎ¯¥d;Mök
~ ãŸPçSÀ;H®QV∞©4
B∫˛¢;Qóâ
ˆMπ?ôúı5S;*
ˆMπ?ôúı5S;ø
ãŸPçSÀ;H®QV∞©4
?OÅ«ƒÛjÍ;}˚Ñ∫6jé
?OÅ«ƒÛjÍ;}
ˆMπ?ôúı5S;0
7aP#j1}BñÙxü;
‹Oê„æKí#Œ“;¿µq
:@∞˘p†*ÂÈà;
 U"/∞EöHîM
;∑˝ÔSª˘Cñë@>ÏJ
åó#6O‘nH∫¥cÂ%&üy;
e*WLòì–#ôXò-;
˝.}πC7;
cL∑y¨Ì‰ë˝Õ;
MÈ/ˆNÊˆG´˙Û¢d·\Ó;
ÚEº[[„√uVY;
L´ú¿é∏ñ<á;
¨¥NC˚7;B™
éœR5ï„;Mªw˙@¨
;©|GK±Íø<ù≈6
ë;CÆsW€H"é
;z\Ûx8Ú@Ω ÿ·u
¡É*ûóˆ•Ä.;ƒ—


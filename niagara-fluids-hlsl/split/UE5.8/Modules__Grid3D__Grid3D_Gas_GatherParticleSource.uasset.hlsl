ºÀ@ÖÚ)˘ïπ_êj;RNnÒ°J∫EÏ!à6
[π;LéØP=>ƒYﬁj
wm;íçØ`Ï”
 GÿÕÊà âwä∫√›A•
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
I§yÚ;>„®‘T
AwÅGÄB;ƒ9J{D
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 ParticlePos = float3(0, 0, 0);
float DistVelocity = length(CellPosVelocityGrid - ParticlePos);
    if (DistVelocity <= ParticleRadius * VelocityRadiusMult)
       ParticleReader.GetVectorByIndex<Attribute = "fluids_source_velocity">(CurrIdx, Valid, ParticleVel);
ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz * VelocityMult;
       ParticleReader.GetFloatByIndex<Attribute = "fluids_source_divergence">(CurrIdx, Valid, ParticleDivergence);      
       ParticleDivergence *= DivergenceMult;
IndexX < Width - 1 && IndexY < Height - 1 && IndexZ < Depth - 1;
ïJä˜b8éDé!;÷D¶≤â
DensityOut = 0;
VelocityOut = 0;
TemperatureOut = 0;
TextureCoordOut = 0;
DistanceOut = 1000000;
ColorOut = float4(0,0,0,0);
float TotalWeight = 0;
int NumOverlapParticles = 0;
float3 ParticlePos;
float3 ParticleGridLocalPos = mul(float4(ParticlePos, 1.), WorldToLocal).xyz;
float Dist = length(CellGridLocalPos - ParticleGridLocalPos);
    float4 ParticleColor = 0;
        float3 ParticleRestPos;
        ParticleReader.GetVectorByIndex<Attribute = "RestPosition">(CurrIdx, Valid, ParticleRestPos);
float3 ParticleGridLocalRestPos = mul(float4(ParticleRestPos, 1.), WorldToLocal).xyz;
        float4 MeshOrientation;
        ParticleReader.GetQuaternionByIndex<Attribute="MeshOrientation">(CurrIdx, Valid, MeshOrientation);
        ParticleReader.GetFloatByIndex<Attribute = "fluids_source_density">(CurrIdx, Valid, ParticleDensity);
        ParticleDensity *= DensityMult;
        ParticleReader.GetFloatByIndex<Attribute = "fluids_source_temperature">(CurrIdx, Valid, ParticleTemperature);
        ParticleTemperature *= TemperatureMult;
        ParticleReader.GetVectorByIndex<Attribute = "fluids_source_velocity">(CurrIdx, Valid, ParticleVel);
        ParticleVel = mul(float4(ParticleVel, 0.), WorldToLocal).xyz * VelocityMult;
        ParticleReader.GetColorByIndex<Attribute="fluids_source_color">(CurrIdx, Valid, ParticleColor);
        float3 TextureGridLocalPos = CellGridLocalPos - ParticleGridLocalPos - ParticleGridLocalRestPos;
        TextureGridLocalPos = NiagaraQuatRotateVector(MeshOrientation, TextureGridLocalPos);
        float Weight = 1. - smoothstep(0, ParticleRadius+3*dx, Dist);
        TextureCoordOut += mul(float4(TextureGridLocalPos, 1.), LocalToUnit).xyz * Weight;
        ColorOut += ParticleColor * Weight;
        TotalWeight += Weight;
        float CurrDist = clamp((Dist - ParticleRadius) / dx, -3, 3);
        DistanceOut = min(DistanceOut, CurrDist);
        NumOverlapParticles++;
        if (CompositingMethod == 0)
            DensityOut += ParticleDensity;
            TemperatureOut += ParticleTemperature;
            VelocityOut += ParticleVel;
        else if (CompositingMethod == 1)
            DensityOut = max(DensityOut, ParticleDensity);
            TemperatureOut = max(TemperatureOut, ParticleTemperature);
            if (dot(ParticleVel, ParticleVel) > dot(VelocityOut, VelocityOut))
                VelocityOut = ParticleVel;
//    TextureCoordOut = float3(0,0,0);
   // DistanceOut = 1000;
    TextureCoordOut /= TotalWeight;
    ColorOut /= TotalWeight;
È›Hâi;–Xá
7aP#j1}BñÙxü;
ïJä˜b8éDé!;÷D¶≤âR
AwÅGÄB;ƒ9J{D/
Ô˘c/QVY˝;_E≤"
B∫˛¢;Qóâ∞WÊ
Ã„D™˘=•TßÎìrHÎ¯¥d;Mök
~ ãŸPçSÀ;H®QV∞©4
B∫˛¢;Qóâ
ˆMπ?ôúı5S;$
ˆMπ?ôúı5S;
ãŸPçSÀ;H®QV∞©4
?OÅ«ƒÛjÍ;}˚Ñ∫6jé
?OÅ«ƒÛjÍ;}
;§™W@°
e∆&P»ıÊM¢ë®*R◊';'
e∆&P»ıÊM¢ë®*R◊';
‹Oê„æKí#Œ“;¿µq
fwÆj(º∏Bêj;
 U"/∞EöHîM
;∑˝ÔSª˘Cñë@>ÏJ
¨¥NC˚7;B™
éœR5ï„;Mªw˙@¨
;z\Ûx8Ú@Ω ÿ·u
¡É*ûóˆ•Ä.;ƒ—


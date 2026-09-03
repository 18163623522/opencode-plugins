;ñJŒBB
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
AwG€B;Ä9J{D
int NumStreakParticles = 1;
float3 Velocity = mul(float4(ParticleVel, 0.), WorldToLocal).xyz;  
const float3 IndexVelocity = dt * Velocity / dx;
const float IndexVelocityMagnitude = length(IndexVelocity);
Velocity *= VelocityMult;
    NumStreakParticles = min(MaxStreakSamples, max(1, StreakDensity * IndexVelocityMagnitude / (2. * ParticleRadiusIndex)));
ParticleDensity /= NumStreakParticles;
ParticleTemperature /= NumStreakParticles;
ParticlePos = mul(float4(ParticlePos, 1.), WorldToLocal).xyz;
const float Density = ParticleDensity * DensityMult;
const float Temperature = ParticleTemperature * TemperatureMult;
ParticleRadiusIndex = min(MaxParticleRadiusCells, ParticleRadiusIndex);
for (int ww = 0; ww < NumStreakParticles; ++ww)
    const float StreakPosition = 1.0 * ww / NumStreakParticles;
    const float2 FloatIndexToUse = ParticleCenterFloatIndex - StreakPosition * IndexVelocity.xy;
    for (int y = -ParticleRadiusIndex; y < ParticleRadiusIndex; ++y) {
    for (int x = -ParticleRadiusIndex; x < ParticleRadiusIndex; ++x) {
        int2 CellIndex = int2(x,y) + FloatIndexToUse;
        float Dist = length(FloatIndexToUse - float2(CellIndex.x, CellIndex.y));
        if (Dist <= ParticleRadiusIndex && 
             CellIndex.x >= 0 && CellIndex.x < NumCellsX &&
             CellIndex.y >= 0 && CellIndex.y < NumCellsY)
            float FalloffMult = 1. - pow(smoothstep(ParticleRadius * Core, ParticleRadius, Dist), Falloff);
            Grid.SetFloatValue<Attribute="Density">(CellIndex.x,CellIndex.y, Density * FalloffMult);
            Grid.SetFloatValue<Attribute="Temperature">(CellIndex.x,CellIndex.y, Temperature * FalloffMult);
            Grid.SetVector2DValue<Attribute="Velocity">(CellIndex.x,CellIndex.y, Velocity.xy * FalloffMult);
            if (UseColor)
                Grid.SetVector4Value<Attribute="Color">(CellIndex.x, CellIndex.y, ParticleColor);
³J¬;=ë—~fë9
³J¬;=ë—~fë˜
ECœ[º%"@§S;
`,Jn„±‚wÍX;
 KÃrAè’
³J¬;=ë—~fëC
AwG€B;Ä9J{DK
AwG€B;Ä9J{DN
ÖípE¡;xaÌòäW
AwG€B;Ä9J{DR
fN·9™ÍnÊÍ0åY{8Â2³O§9;;/Bnê:
åY{8Â2³O§9;;/Bnê
tS¼n>I;
íO©*;M³#×úL­Áï
ïùc/QVYı;_E²"
Bºğş¢;Q—‰°Wæ
ÌãDªù=¥T§ë“rHëø´d;Mšk
³J¬;=ë—~fë
/QVYı;_E²"
Bºğş¢;Q—‰
?OÇÄójê;}û„º6j
?OÇÄójê;}
fN·9™ÍnÊÍ0åY{8Â2³O§9;;/BnêvÚ
² ïó7%cA“;I¨M6uú
 U"/°EšH”M
2;|£¯É
=³éù­;œF¦ù„ş
ÅC¡©ù¾aB¬ƒ;™[¼#
XôS9Qá;@¡eğÊÎä!
Áƒ*—ö¥€.;ÄÑ


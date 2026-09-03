hõƒì¿%;
}HB@õê5…Úø;
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
        Grid.SetVector4Value<Attribute="Color">(CellIndex.x, CellIndex.y, Color);
AwG€B;Ä9J{D
³J¬;=ë—~fë
³J¬;=ë—~fël
AwG€B;Ä9J{Dß
ÖípE¡;xaÌòäW°
fN·9™ÍnÊÍ0åY{8Â2³O§9;;/Bnê$
åY{8Â2³O§9;;/Bnê
tS¼n>I;
íO©*;M³#×úL­Áï
ïùc/QVYı;_E²"
Bºğş¢;Q—‰°Wæ
ÌãDªù=¥T§ë“rHëø´d;Mšk
/QVYı;_E²"
Bºğş¢;Q—‰
?OÇÄójê;}û„º6j
?OÇÄójê;}
 U"/°EšH”M
ÅC¡©ù¾aB¬ƒ;™[¼#·
;ñJŒBB
XôS9Qá;@¡eğÊÎä!·
Áƒ*—ö¥€.;ÄÑ


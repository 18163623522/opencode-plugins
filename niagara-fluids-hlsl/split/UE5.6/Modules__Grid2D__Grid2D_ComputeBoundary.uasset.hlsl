M·±%; ó
Boundary = 0;
  Boundary = OpenBoundaryRight ? 2 : 1;
  Boundary = OpenBoundaryLeft ? 2 : 1;
  Boundary = OpenBoundaryDown ? 2 : 1;
  Boundary = OpenBoundaryUp ? 2 : 1;
:ó\KÈ;cAš²c
X©5ù;ZVE¾
BoundaryOut = 0;
VelocityOut = float2(0,0);
int Count = 0;
bool Valid;
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 ParticlePos  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Position">(CurrIdx, Valid, ParticlePos);
    ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
    float2 ParticleSpriteSize = float2(0,0);
ParticleReader.GetVector2DByIndex<Attribute="SpriteSize">(CurrIdx, Valid, ParticleSpriteSize);
    float Dist = length(CellPos - ParticlePos.xy);
    float ParticleRadius = ParticleSpriteSize.x * .5;
    if (Dist <= ParticleRadius)
float3 ParticleVel  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Velocity">(CurrIdx, Valid, ParticleVel);
        ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz;
        Count++;
        BoundaryOut = 1;
        VelocityOut += ParticleVel * VelocityMult;
  VelocityOut /= Count;
ßÖÙù¬Mˆ;
    float Dist = length(CellPos - ParticlePos);
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity;
RetBoundary = 0;
  RetBoundary = SolidValue;
  RetBoundary = 2;
C = mul(A,B);
ScreenUV = float2(0,0);
float4 SamplePosition = float4(In_SamplePos + View.PreViewTranslation, 1);
float4 ClipPosition = mul(SamplePosition, View.TranslatedWorldToClip);
float2 ScreenPosition = ClipPosition.xy / ClipPosition.w;
// Check if the sample is inside the view.
// Sample the depth buffer to get a world position near the sample position.
    ScreenUV = ScreenPosition * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity/dt;
HU<H¨QP¡*;ñ¯
ÇÁyGª?è;
¥;¶YÞÅ
B”;P£V
íA}JjA¤•;Kbq=÷
—ØC‚Q+W®Ì*E;
œ­!±Í@¹gÄó„"0k;
íA}JjA¤•;Kbq=÷M
íA}JjA¤•;Kbq=÷¦
ÃÕDšú;8m@%
£;ƒÉ-’dåÁ«æH‡2©
ïùc/QVYý;_E²"
Bºðþ¢;Q—‰°Wæ
ÌãDªù=¥T§ë“rHëø´d;Mšk
¨tòLµ;Ü
íA}JjA¤•;Kbq=÷U
A©;òvx5]–.
A©;òvx5]–
á(ž}ö—ùEˆ;cOo§óÀ
MÖNƒ±À'£;²Î
’Áý;Óö,O0 Á¹¼
z¦Ž.áÚNž¶€“°5;ÄÂ
MÖNƒ±À'£;²Îq
MÖNƒ±À'£;²
d!*;x
uš Ä8>;F¼F\x^¾þ§Å
aî#;MòŽB—,(i¬3æLÅ
Áƒ*ž—ö¥€.;ÄÑ


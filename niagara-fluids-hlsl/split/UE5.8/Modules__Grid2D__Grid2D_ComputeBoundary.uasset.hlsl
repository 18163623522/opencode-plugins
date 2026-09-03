áÍÁÍ&38;ÔM
ÕkäUT;
M∑±%; Û
;#u˛)c‰w
.Ä.d¿;
æaèø2;
Boundary = 0;
  Boundary = OpenBoundaryRight ? 2 : 1;
  Boundary = OpenBoundaryLeft ? 2 : 1;
  Boundary = OpenBoundaryDown ? 2 : 1;
  Boundary = OpenBoundaryUp ? 2 : 1;
:Û\K»;cAö≤c
X©5˘;ZVEæ
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
ﬂ÷Ÿ˘¨Mà;
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
float2 ParticleSpriteSize = float2(0,0);
float ParticleRadius = 0;
    Read_Emitter_ComputeBoundaryGrid2D_NDCReader_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat(CurrIdx, Valid, ParticlePos, ParticleVel, ParticleRadius);
    float Dist = length(CellPos.xy - ParticlePos.xy);
        VelocityOut += ParticleVel.xy * VelocityMult;
    BoundaryOut = 1;
    VelocityOut /= Count;
    ParticleReader.GetVectorByIndex<Attribute="Position">(CurrIdx, Valid, ParticlePos);
    ParticleReader.GetVector2DByIndex<Attribute="SpriteSize">(CurrIdx, Valid, ParticleSpriteSize);
    ParticleRadius = ParticleSpriteSize.x * .5;
lÔ;LûÌ
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity/dt;
HU<H®QP°*;ÒØK
HU<H®QP°*;ÒØ
«¡yG™?Ë;è
Bî;P£V
ÌA}JjA§ï;Kbq=˜
8wÌ≈;ÔËMé·Àn0É)Ÿ
ÌA}JjA§ï;Kbq=˜Ü
ÌA}JjA§ï;Kbq=˜ﬁ
√’Dö˙;8m@%
£;É…-ídÂ¡´ÊHá2©
Ô˘c/QVY˝;_E≤"
B∫˛¢;Qóâ∞WÊ
Ã„D™˘=•TßÎìrHÎ¯¥d;Mök
®tÚLµ;‹
 Cs<JA
ô4W}‰;™Gü
ÌA}JjA§ï;Kbq=˜í
;ÑåÌ°ˆNøp#g
A©;Úvx5]ñA
A©;Úvx5]ñ
·(û}ˆó˘Eà;cOoßÛ¿
M÷NÉ±¿'£;≤Œ
¨˙¡∆;◊˛G©©¨„
í¡˝;”ˆ,OÅ0†¡πº
z¶é.·⁄Nû∂Äì∞5;ƒ
M÷NÉ±¿'£;≤Œƒ
M÷NÉ±¿'£;≤Œ
d!*;xù
uö ƒ8>;FºF\x^æ˛ß
aÓ#;MÚéBó,(i¨3ÊL
¡É*ûóˆ•Ä.;ƒ—


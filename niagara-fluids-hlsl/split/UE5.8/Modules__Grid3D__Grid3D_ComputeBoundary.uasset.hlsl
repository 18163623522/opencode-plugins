 ;Õ3M_s
;I_¬eğ¥³g†…o
 K$ç/“
»¼´U¸¸;
djö§p¯O–ËSìøğ’z;
||· vÏ?N›/)˜h‚™;
ıoù;Ôõ
ıoù;Ôõ¤
ıoù;Ôõ<
ıoù;Ôõ*
Boundary = 0;
  Boundary = OpenBoundaryRight ? 2 : 1;
  Boundary = OpenBoundaryLeft ? 2 : 1;
  Boundary = OpenBoundaryDown ? 2 : 1;
  Boundary = OpenBoundaryUp ? 2 : 1;
  Boundary = OpenBoundaryBack ? 2 : 1;
  Boundary = OpenBoundaryFront ? 2 : 1;
:ó\KÈ;cAš²c
X©5ù;ZVE¾
BoundaryOut = 0;
VelocityOut = float3(0,0,0);
bool Valid;
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 ParticlePos  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Position">(CurrIdx, Valid, ParticlePos);
    ParticlePos = mul(float4(ParticlePos, 1.), WorldToLocal).xyz;
    float2 ParticleSpriteSize = float2(0,0);
ParticleReader.GetVector2DByIndex<Attribute="SpriteSize">(CurrIdx, Valid, ParticleSpriteSize);
    float Dist = length(CellPos - ParticlePos);
    float ParticleRadius = ParticleSpriteSize.x * .5;
    if (Dist <= ParticleRadius)
float3 ParticleVel  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Velocity">(CurrIdx, Valid, ParticleVel);
        ParticleVel = mul(float4(ParticleVel, 0.), WorldToLocal).xyz;
        BoundaryOut = 1;
        VelocityOut += ParticleVel * VelocityMult;
ßÖÙù¬Mˆ;
OutBoundary = 0;
OutVelocity = float3(0,0,0);
  OutBoundary = 1;
  OutVelocity = ClosestVelocity;
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
const  int RASTERIZED_FLUID_CELL = 3;
RetBoundary = EMPTY_CELL;
  RetBoundary = FLUID_CELL;
  RetBoundary = SolidValue;
V;E¿F80kœpt
ScreenUV = float2(0,0);
float4 SamplePosition = float4(In_SamplePos + View.PreViewTranslation, 1);
float4 ClipPosition = mul(SamplePosition, View.TranslatedWorldToClip);
float2 ScreenPosition = ClipPosition.xy / ClipPosition.w;
// Check if the sample is inside the view.
// Sample the depth buffer to get a world position near the sample position.
    ScreenUV = ScreenPosition * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
UnitPos.z >= 0 && UnitPos.z <= 1;
int MaxNeighborsPerCell;
NeighborGrid.MaxNeighborsPerCell(MaxNeighborsPerCell);
for (int i = 0; i < MaxNeighborsPerCell; ++i)
    int3 IndexToUse;
    NeighborGrid.UnitToIndex(Unit, IndexToUse.x, IndexToUse.y, IndexToUse.z);
int NeighborLinearIndex;
NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, NeighborLinearIndex);
int CurrIdx;
NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrIdx);
    if (CurrIdx >=0)
ûyUOŠæEI™™¯uÙqG~;
*´´\H›»;
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity/dt;
Jç%»;DMB”
ret = (a.x >= 1-1e-5) && (a.y >= 1-1e-5) && (a.z >= 1-1e-5);
i_½·ãj©Eš‘¥$6;gÅW
i_½·ãj©Eš‘¥$6;g
SignedDistance = 3.402823466e+38;
    SignedDistance = min(SignedDistance, Dist - ParticleRadius);
FaceFraction.x = Face.x > 1e-20 ? max(Face.x, MinFaceFraction) : 0;
FaceFraction.y = Face.y > 1e-20 ? max(Face.y, MinFaceFraction) : 0;
FaceFraction.z = Face.z > 1e-20 ? max(Face.z, MinFaceFraction) : 0;
FaceFraction = saturate(FaceFraction);
FLWCVector3 CameraPos = PrimaryView.WorldCameraOrigin;
LWCSetTile(CameraPos, LWCGetTile(CameraPos) - Tile); // convert to simulation space
Out_CameraPosWorld = LWCToFloat(CameraPos);
//FLWCVector3 LwcSamplePos = MakeLWCVector3(Tile, vv);
float4 SamplePosition = float4(LWCToFloat(LWCAdd(LwcSamplePos, PrimaryView.PreViewTranslation)), 1); // TODO[mg]: LWCToFloat here?
ScreenUV = ScreenPosition * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
    float3 ParticleMeshSize = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Scale">(CurrIdx, Valid, ParticleMeshSize);
    float4 q = float4(0,0,0,0);
    ParticleReader.GetQuaternionByIndex<Attribute="MeshOrientation">(CurrIdx, Valid, q);
    float ParticleRadius = ParticleMeshSize.x * .5 * 100. * 2;
    float3 LocalPos = CellPos - ParticlePos;
    // invert
    q.w *= -1;
    LocalPos = dot(LocalPos, q.xyz) * 2. * q.xyz + ((q.w * q.w - dot(q.xyz,q.xyz)) * LocalPos) + (cross(q.xyz,LocalPos) * 2.0 * q.w);
    // hack for now since our mesh sphere is 100x100x100
    float3 Radius = ParticleMeshSize * 100 / 2.;
    // signed distance to the ellipsoid
    float ScaledDist = length(LocalPos/Radius);
    float Grad = length(LocalPos/(Radius*Radius));
    SignedDistance = ScaledDist*(ScaledDist-1.0)/Grad;
    if (SignedDistance <= 0)
        float4 prevq = float4(0,0,0,0);
        ParticleReader.GetQuaternionByIndex<Attribute="PrevMeshOrientation">(CurrIdx, Valid, prevq);
    float3 PrevParticlePos  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="PrevPosition">(CurrIdx, Valid, PrevParticlePos);
        float3 PrevLocalPos = dot(LocalPos, prevq.xyz) * 2. * prevq.xyz + ((prevq.w * prevq.w - dot(prevq.xyz,prevq.xyz)) * LocalPos) + (cross(prevq.xyz,LocalPos) * 2.0 * prevq.w);
        PrevLocalPos += PrevParticlePos;
        PrevLocalPos = mul(float4(PrevLocalPos, 1.), WorldToLocal).xyz;
        float3 VelFromRot = (CellPos - PrevLocalPos) / dt;
        ParticleVel = mul(float4(VelFromRot, 0.), WorldToLocal).xyz;
e‘wÎ%Oş¦¥³5;^o
%;©CŸcáÕÂ]
İNQ®äbcİ;
À-G†KcÙ&‘;
{_»L;J­
Ìû”÷;úßH°Tó
ğz­¤;rNµŸ
×H¼¶ò6Ç;ÈIk
oû³;¥hğM¡Ğ
OŠƒ.È;òDSK
<Ìw;0F€x æğ[
Î?yÇJ;€
Î?yÇJ;¼
<zŠwêÅNF¤S;çÿ†J
>:Ìõ³Ÿ±G¼ˆr¨;-‚`k
›?;Á½m
³ixcp,;D¡AAS
ã¯÷¤A¦Æ:;BÑä*«
ã¯÷¤A¦Æ:;BÑä*ø
ÇÁyGª?è;
¥;¶YŞo
B”;P£V
ˆ;©Xûß
;®¨J®î-
íA}JjA¤•;Kbq=÷
ˆ;©Xûò
Ô?q;ÁËëAªwRß
°@fØ5O(Cˆ¯5–z;º
';áˆò€"M}Ip
á¸ï%ª;À@¤G‰ˆ8¾Š‘+
á¸ï%ª;À@¤G‰ˆ8¾Š‘
[.€%ÔõNEt;zÿgu
P;aAäxk
;BÏéÃJ:
;BÏéÃJù
ã¯÷¤A¦Æ:;BÑä*
dYmK¢2'I†"¸Ù>Şv¾;
á¸ï%ª;À@¤G‰ˆ8¾Š‘@
íA}JjA¤•;Kbq=÷^
íA}JjA¤•;Kbq=÷5
ÃÕDšú;8m@%
£;ƒÉ-’dåÁ«æH‡2©
ïùc/QVYı;_E²"
Bºğş¢;Q—‰°Wæ
ÌãDªù=¥T§ë“rHëø´d;Mšk
¨tòLµ;Ü
ÆÇ'‰W½…D§;¶II±
O"Pi;h
íA}JjA¤•;Kbq=÷v
şLlhYïğ;2K¢h~ø
íA}JjA¤•;Kbq=÷
lhYïğ;2K¢h~ø
íA}JjA¤•;Kbq=÷£
3Ç;ÑFƒ8rD
Ke‡jC¹;_l†M—
òß;6‹åREšÚã†ôÿ&
òß;6‹åREšÚã†ôÿ&Ì
íA}JjA¤•;Kbq=÷¼
;BÏéÃJ
‚$ñ×D)GI¿¯ö³;…
òß;6‹åREšÚã†ôÿ&ÌÔ
òß;6‹åREšÚã†ôÿ&Ì1
íA}JjA¤•;Kbq=÷Õ
á(}ö—ùEˆ;cOo§óÀ
¨,I†~\õ;‡ç
è8F!ÿ;}@¬‰yæù
€9&È?1ÎN’A<NÀ;)0
êÔğÜ;]â@¦´|»şn*6û
êÔğÜ;]â@¦´|»şn*6
óğC›†n¾D³J‡;¨
¨,I†~\õ;‡çà
;ü=óF¤§G†•×
H³‹¥s;s½;k
¨,I†~\õ;‡ç'
¾šƒ}¼MÔJåúÙ;EyÓo
€9&È?1ÎN’A<NÀ;)01
€9&È?1ÎN’A<NÀ;)0”
×g™;Fœ4GtlƒP†k
¨,I†~\õ;‡ç7
åè¢C×;
@¦qV…½Ç*ú;
I;ß3«
€9&È?1ÎN’A<NÀ;)0P
¨,I†~\õ;‡çU
€9&È?1ÎN’A<NÀ;)0m
 A™5¿{Ú
°A;sïÎ0A˜
°@fØ5O(Cˆ¯5–z;ºp
°@fØ5O(Cˆ¯5–z;ºq
°@fØ5O(Cˆ¯5–z;ºs
°@fØ5O(Cˆ¯5–z;ºt
°@fØ5O(Cˆ¯5–z;ºv
°@fØ5O(Cˆ¯5–z;ºw
°@fØ5O(Cˆ¯5–z;ºy
°@fØ5O(Cˆ¯5–z;ºz
i_½·ãj©Eš‘¥$6;gÅ
°@fØ5O(Cˆ¯5–z;º{
°@fØ5O(Cˆ¯5–z;º}
°@fØ5O(Cˆ¯5–z;º~
°@fØ5O(Cˆ¯5–z;º‚
°@fØ5O(Cˆ¯5–z;ºƒ
V;E¿F80kœpt
V;E¿F80kœpt0
9N=‡{#“®óVAå‹;™D
‡{#“®óVAå‹;™D
V;E¿F80kœpt—
ıƒE™¢;‡
†°¢Fºh)a;/ 3
†°¢Fºh)a;/ 3
É>êW‹ì.(p;jJ°
‹ì.(p;jJ°
NˆÖC#C®;Gk
İNQ®äbcİ;¾
ÿ LÏZ;çr
PØÃ;Êù†o
K©ªÓ;•Œø@o
Áƒ*—ö¥€.;ÄÑ


 ;Õ3M_s
-dÄ{*Ö;‡õ2¥™<
;SRO•k
;SRO•l
 C™t™H%e›§
;SRO•F
;SRO•\
³E¾ã/!;ì¤ù£
1;zú9¤J¬™ZP /
³E¾ã/!;ì¤ùl
³E¾ã/!;ì¤ùJ
³E¾ã/!;ì¤ù»
ão^è;PE R
ì;7]¹‹şA
èÍÖ_ú!ôL˜½'£;"®åN
èÍÖ_ú!ôL˜½'£;"®å
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
*´´\H›»;
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity/dt;
Jç%»;DMB”
ret = (a.x >= 1-1e-5) && (a.y >= 1-1e-5) && (a.z >= 1-1e-5);
i_½·ãj©Eš‘¥$6;gÅi
i_½·ãj©Eš‘¥$6;gÅ
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
³E¾ã/!;ì¤ù
À-G†KcÙ&‘;
{_»L;J­
Ìû”÷;úßH°Tó
ğz­¤;rNµŸ
×H¼¶ò6Ç;ÈI8
oû³;¥hğM¡Ğ
OŠƒ.È;òDS=
<Ìw;0F€x æğ[
<zŠwêÅNF¤S;çÿ†J
>:Ìõ³Ÿ±G¼ˆr¨;-‚`8
›?;Á½m
ã¯÷¤A¦Æ:;BÑä*¹
ã¯÷¤A¦Æ:;BÑä*º
$;´§™+¸J{–o”¤
;ÿJ¼hË
0®’;I¾M3Û9s(8
ÇÁyGª?è;
¥;¶YŞ<
B”;P£V
ˆ;©Xûì
;®¨J®î-
íA}JjA¤•;Kbq=÷
ˆ;©Xûÿ
Ô?q;ÁËëAªwRß
°@fØ5O(Cˆ¯5–z;º
';áˆò€"M}Ip
á¸ï%ª;À@¤G‰ˆ8¾Š‘8
á¸ï%ª;À@¤G‰ˆ8¾Š‘
òÙÉïÀhÇJ–O%§MNS–;
[.€%ÔõNEt;zÿgu
P;aAäx8
;BÏéÃJG
;BÏéÃJÔ
ã¯÷¤A¦Æ:;BÑä*
 C™t™H%e›§L
 C™t™H%e›§~
 C™t™H%e›§W
 C™t™H%e›§X
 C™t™H%e›§]
íA}JjA¤•;Kbq=÷l
ÃÕDšú;8m@%
£;ƒÉ-’dåÁ«æH‡2©
ïùc/QVYı;_E²"
Bºğş¢;Q—‰°Wæ
ÌãDªù=¥T§ë“rHëø´d;Mšk
¨tòLµ;Ü
ÆÇ'‰W½…D§;¶II±
O"Pi;h
íA}JjA¤•;Kbq=÷„
şLlhYïğ;2K¢h~ø
íA}JjA¤•;Kbq=÷›
lhYïğ;2K¢h~ø
íA}JjA¤•;Kbq=÷±
3Ç;ÑFƒ8rD
Ke‡jC¹;_l†M—
òß;6‹åREšÚã†ôÿ&ÌÉ
òß;6‹åREšÚã†ôÿ&Ì
íA}JjA¤•;Kbq=÷Ê
;BÏéÃJ
‚$ñ×D)GI¿¯ö³;…
;(L†BfLğt
á(}ö—ùEˆ;cOo§óÀ
¨,I†~\õ;‡ç
è8F!ÿ;}@¬‰yæù
€9&È?1ÎN’A<NÀ;)0
êÔğÜ;]â@¦´|»şn*6ø
êÔğÜ;]â@¦´|»şn*6
êÔğÜ;]â@¦´|»şn*6û
¡G¼;Ü"§£
óğC›†n¾D³J‡;¨
¨,I†~\õ;‡çÀ
;ü=óF¤§G†•×
H³‹¥s;s½;8
¨,I†~\õ;‡ç!
¾šƒ}¼MÔJåúÙ;EyÓ<
€9&È?1ÎN’A<NÀ;)0+
€9&È?1ÎN’A<NÀ;)0`
×g™;Fœ4GtlƒP†8
¨,I†~\õ;‡ç1
I;ß3«
€9&È?1ÎN’A<NÀ;)0J
;)0[Ø
äWEœÑw¤Ojš;<
 A™5¿{Ú
°A;sïÎ0A˜
°@fØ5O(Cˆ¯5–z;ºb
°@fØ5O(Cˆ¯5–z;ºÒ
°@fØ5O(Cˆ¯5–z;ºc
°@fØ5O(Cˆ¯5–z;ºe
°@fØ5O(Cˆ¯5–z;ºf
°@fØ5O(Cˆ¯5–z;ºh
°@fØ5O(Cˆ¯5–z;ºi
°@fØ5O(Cˆ¯5–z;ºk
°@fØ5O(Cˆ¯5–z;ºl
°@fØ5O(Cˆ¯5–z;ºm
°@fØ5O(Cˆ¯5–z;ºo
°@fØ5O(Cˆ¯5–z;ºp
°@fØ5O(Cˆ¯5–z;ºq
V;E¿F80kœpt|
V;E¿F80kœpt(
9N=‡{#“®óVAå‹;™D
‡{#“®óVAå‹;™D
V;E¿F80kœpt†
ıƒE™¢;‡
†°¢Fºh)a;/ 3P
†°¢Fºh)a;/ 3
É>êW‹ì.(p;jJ°
‹ì.(p;jJ°
ÿ LÏZ;çr
>á-ÿ^;zå_
K©ªÓ;•Œø@<
—çH›€;?O¯§2Ï
Áƒ*—ö¥€.;ÄÑ


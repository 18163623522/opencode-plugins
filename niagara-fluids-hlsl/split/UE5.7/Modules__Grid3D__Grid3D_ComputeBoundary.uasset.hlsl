 ;Õ3M_s
†EL†æ­×m•AF;
ëúºN¹d=¢( ÈQ;
Ó)K ¿Ói2¶&;
Dœ‘¾À¨/·;
ÆÌãeÆ;
 K$ç/“
0%A·V;
ıoù;Ôõl
ıoù;Ôõm
Õzk;
ıoù;ÔõN
ıoù;Ôõä
Boundary = 0;
  Boundary = OpenBoundaryRight ? 2 : 1;
  Boundary = OpenBoundaryLeft ? 2 : 1;
  Boundary = OpenBoundaryDown ? 2 : 1;
  Boundary = OpenBoundaryUp ? 2 : 1;
  Boundary = OpenBoundaryBack ? 2 : 1;
  Boundary = OpenBoundaryFront ? 2 : 1;
h”¤í3;
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
i @¸Twşí|\˜;
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
i_½·ãj©Eš‘¥$6;gÅh
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
PÅBº!ĞÅb8;
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
e‘wÎ%Oş¦¥³5;^?
%;©CŸcáÕÂ]
EÌSx6A;
İNQ®äbcİ;
À-G†KcÙ&‘;
{_»L;J­
šeI„i;
Ìû”÷;úßH°Tó
BŠ6n^¼§­×;
Á‚½M*´X˜X6´;
}øäV#;
ğz­¤;rNµŸ
K¦\ÀÓìúk-;
×H¼¶ò6Ç;ÈI;
MHŸ1à·J€$dWQcWM;
oû³;¥hğM¡Ğ
OŠƒ.È;òDSA
<Ìw;0F€x æğ[
>åËşC”¼OK.c/b;
_ÂèXH;
F3omğXÊ`;
³HE,¶J©j0øøgáÄ;
Î?yÇJ;‘
Î?yÇJ;£
ShH»¥±<nñÌS;
<zŠwêÅNF¤S;çÿ†J
e÷#İü;
ÇŞM»3û.7kv‘;
à³p™â„yE¯zš{ÔtKÜ;
Fˆ£¢ñ6è;
>:Ìõ³Ÿ±G¼ˆr¨;-‚`;
›?;Á½m
³ixcp,;D¡AAS
ã¯÷¤A¦Æ:;BÑä*¼
ã¯÷¤A¦Æ:;BÑä*¸
r¾i@œ—íY„1X·;
"/FŒ6LrRğN‹;
ıoù;Ôõ
ÇÁyGª?è;
¥;¶YŞ?
B”;P£V
0Û=ËJ¥;
v<D¬LB"7ZuE;
qD§roâ%?vÅ;
M«IÊáÑÒEß;
ıK‡áß\Iµ=õ;
3¤ÜÉ-O¸Ùoc?ğ ¯;
a ÑÄN„@cY¾¶¸;
ˆ;©Xûğ
;®¨J®î-
íA}JjA¤•;Kbq=÷
1P™é~F¿•“R¢ûMï;
P†›ÙF˜¯Yºù‹–/;
šf@IN£ä?œ~?IÈ;
C–éÃ%0ÒFÿ;
f-¡òİ;
¶‹a‰½¿E‡Šò†.¼fæ;
Ô?q;ÁËëAªwRß
I®#£"I^S;
°@fØ5O(Cˆ¯5–z;º
L¯Âe…“ûF‘gífIÇÁº;
+ÉGL!;
ÃòQfJ;
Nnª®GŒ»`ÃÓ4şÒ;
';áˆò€"M}Ip
á¸ï%ª;À@¤G‰ˆ8¾Š‘<
á¸ï%ª;À@¤G‰ˆ8¾Š‘
´aôÖ );
&ŠàQl;
[.€%ÔõNEt;zÿgu
P;aAäx;
ü@x§Æ%ˆº;
;BÏéÃJK
;BÏéÃJÒ
ã¯÷¤A¦Æ:;BÑä*
á¸ï%ª;À@¤G‰ˆ8¾Š‘Q
l·€NÓ×jG¶ç¦~£¢FL;
BŸaXXì„^ó;
ÚÕ/n!àM‚­×v<õi¿;
ø[Úxï‹!N€+ê÷˜òVÛ;
­AL¯Å<ó½ıPP;
CÑJn¢B’T´‰òÒå^;
íA}JjA¤•;Kbq=÷o
ÃÕDšú;8m@%
£;ƒÉ-’dåÁ«æH‡2©
+ßû3‘È;
ïùc/QVYı;_E²"
Bºğş¢;Q—‰°Wæ
ÌãDªù=¥T§ë“rHëø´d;Mšk
¨tòLµ;Ü
»¼Çûê(ƒC­tAÑ7<-V;
NŠrÙb÷|âÃ;
`„ÿEå+7H¨Írú„7ù;
ùÑÔ.Î;
ÆÇ'‰W½…D§;¶II±
N„|º“a^@2;
†vC/+M•¼ºïí¹p;
¥¸x@T’;
O"Pi;h
²K¹H—Z€*v]Ôm;
ò@´SÃÚgôÕ;
íA}JjA¤•;Kbq=÷‡
M6b(nE¦Ä;
êÊo©L;
C¹Èä±óÑåE;
şLlhYïğ;2K¢h~ø
†±^¼K»÷˜‚SæùJ;
íA}JjA¤•;Kbq=÷
lhYïğ;2K¢h~ø
íA}JjA¤•;Kbq=÷´
“¶H‰KéJÊX^à-ãÂ;
u´ó“½GtA­Ù+FÊ*(•;
3Ç;ÑFƒ8rD
I­$¯*08ò¦;
ÑÖÕEK*H©jÀ"0ÅJ;
ÑòôDüš:İÿju;
g2`ÇæƒÈL½F¹mÁÔô;
Ke‡jC¹;_l†M—
‰J¤GzB/…K;
òß;6‹åREšÚã†ôÿ&ÌÌ
òß;6‹åREšÚã†ôÿ&Ì
³A‰7pÕ64v;
íA}JjA¤•;Kbq=÷Í
VF°«!ßï:*Á;
½Ä>Oaù YÃ*å;
;BÏéÃJ
L“n}7·d1ƒ;
‚$ñ×D)GI¿¯ö³;…
"I3[Ò(D•´ˆŸ÷+Y;
òß;6‹åREšÚã†ôÿ&Ìå
íA}JjA¤•;Kbq=÷æ
8>¤’¥,ÚJ‡n\|BRäP;
n­¥[hi E˜à%"›ò™Ğ;
ÒpB`-‚ŞIªĞFÎ×uÍF;
á(}ö—ùEˆ;cOo§óÀ
‘‚Ón¬DÎI…Œ»}¸>:µ;
55ku¶ÁOšŒàò •Õ);
¨,I†~\õ;‡ç
J‰&Yş¨x]Û;
¨ÒPí8;
è8F!ÿ;}@¬‰yæù
À~kö®;
€9&È?1ÎN’A<NÀ;)0
ájM´¹×A1éå^;
ïë°-@%İF½æß&µ]);
êÔğÜ;]â@¦´|»şn*6
ÇfÿL;
¥ö—ƒIÓM»˜oƒ«òtä;
”ÎqL¥&;
oL*û"$ªG§óz9—Äl”;
óğC›†n¾D³J‡;¨
€éXéd®;
¨,I†~\õ;‡ç¾
Š–"ºvøôM˜9 bÅXˆ¥;
€'F·&*â÷Guu;
;ü=óF¤§G†•×
ÈxÚhiê"Nƒ°¿éG'/Ù;
’bM¸÷=\áI¾;
*«äğL;
¨,I†~\õ;‡ç+
&q>&¢˜ØD…\^@T¨±‹;
H³‹¥s;s½;;
 C§-J†Äyü(;
¨,I†~\õ;‡ç8
½í—Ê&â;
¾šƒ}¼MÔJåúÙ;EyÓ?
¥dgEÀf@¸m9%±åã';
³ı²+äø\G—sV6rw¹ô;
G‰ÖĞ;
@ÇíHí;
£§dIŸ¤Õx:ãGö;
€9&È?1ÎN’A<NÀ;)0B
€9&È?1ÎN’A<NÀ;)0a
R‹ï`ôiÎH´Û<iV9V;
²C¬½ı4ƒkXq;
×g™;Fœ4GtlƒP†;
¨,I†~\õ;‡çH
2=œ·U+;
æ~F‚±N*»¶I;
âŞä´*)5Kƒ‹õ„eßãğ;
I;ß3«
Kšl9lä;
uÃnYH¡’àZ%â®q;
IF.¯t;
0›6ÕJˆO.kè¯úï;
$„C‰[Y¡¤b«;
¨,I†~\õ;‡çf
ùKª“8uÚ8òW;
€9&È?1ÎN’A<NÀ;)0~
 A™5¿{Ú
°A;sïÎ0A˜
°@fØ5O(Cˆ¯5–z;º
°@fØ5O(Cˆ¯5–z;ºĞ
3³iÌëÀÉLˆ'ıíş²7’;
°@fØ5O(Cˆ¯5–z;º‚
°@fØ5O(Cˆ¯5–z;º„
M9L³_º/ö>Jˆ;
°@fØ5O(Cˆ¯5–z;º…
°@fØ5O(Cˆ¯5–z;º‡
°@fØ5O(Cˆ¯5–z;ºˆ
°@fØ5O(Cˆ¯5–z;ºŠ
°@fØ5O(Cˆ¯5–z;º‹
i_½·ãj©Eš‘¥$6;gÅ
°@fØ5O(Cˆ¯5–z;ºŒ
°@fØ5O(Cˆ¯5–z;º
°@fØ5O(Cˆ¯5–z;º
°@fØ5O(Cˆ¯5–z;º
°@fØ5O(Cˆ¯5–z;º“
TÑ$2ÕJ®™ñA©‰‡;
°@fØ5O(Cˆ¯5–z;º”
İÅñ7ó;
DƒQş’Ìß6õ;
gW©@ÿ…;
äıL¶Ÿ>ò8áó’;
V;E¿F80kœpt
V;E¿F80kœpt-
9N=‡{#“®óVAå‹;™D
x£B…GŸU?ÑD};
‡{#“®óVAå‹;™D
V;E¿F80kœpt¨
ŠÚLÙTû¯N7Zœÿ³u‚;
\T{X‹¾äI°·,ËF9°c;
ıƒE™¢;‡
†°¢Fºh)a;/ 3Q
Œìbz¥ì‹D¶oGIÚÌe;
†°¢Fºh)a;/ 3
É>êW‹ì.(p;jJ°
~Z¯¨@à[E…/¨:J¢kÖ;
‹ì.(p;jJ°
Nª ­5.°Ö{;
—àëuIÖıB•1$rÙI5Ü;
yğd§j+F‡|@ÏÂH.X;
NˆÖC#C®;G;
İNQ®äbcİ;Ï
İNQ®äbcİ;Ñ
¸Âü&F‚ ã®ÎóÉÊ;
%B²%I~±”öw;
‘@’2©dnDä^;
ïµWæl»;
ÿ LÏZ;çr
PØÃ;Êù†?
K©ªÓ;•Œø@?
Áƒ*—ö¥€.;ÄÑ


vŒ–;¬U
N‘CØ≠%£Bó;Lo0~‚ Z
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
∞J‰0µjXZnµ;0U
ˇú;oF%1Cûl
Â*'[m4ñ¥'Ê‡·-Å’;·∞?QU
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
;®Âl‰˚D¨è\•—Yß€/a<eEU
/Oƒ;)îAx‰¢U
\)ê;˚ÔÜ‚3”Zo
åãdNT;
;0fÂi±æüq_¸
Î;aæoV>
¶;ÑAçX]§éùı
ùæ`7·$Ë∂XËôÊ;9c°¶FÑ∏U
;“≈Tz:ßL©M!N
⁄*tD<;úEì&É
fπ∏NêX´;M°˛ΩU
ÿ>ëk*I¨;ç¨}Ü
\é`);|„Hê
N‘CØ≠%£Bó;Lo0~‚ n
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊
·Ä;2Kx+J≤Bè§]â‹#û
s;Mi”DÅéÄµó«RËû
öc,„( ÒCí;˙™gÊN1û
9øy;ﬁJñ
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
]9¢(Qb—Dò⁄8ÅU;É
cMäI#í;…
—Xd°JeG∏;(
;ÊLìô+:¬bœj
ﬁJΩu&ÑkU„;3
ﬁJΩu&ÑkU„;ˆ
—Ì7;GΩ
ﬁJΩu&ÑkU„;
ﬁJΩu&ÑkU„;|
‡gYßÖ¯Hê");rÆ◊\]
‡gYßÖ¯Hê");rÆ◊\ˆ
‡gYßÖ¯Hê");rÆ◊\
C;Ní®ã|« !¿
int IGNORE = 0;
Grid.SetGridValue(IndexX, IndexY, IndexZ, AttributeIndex, Value.x, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, AttributeIndex+1, Value.y, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, AttributeIndex+2, Value.z, IGNORE);
BlurredValue = 0;
float Width = Radius * 2. + 1;
float Sigma = (Radius - 1.) / 6.;
float TwoSigmaSquared = 2. * Sigma * Sigma;
float Coeff = 1./(sqrt(2 * 3.141569) * Sigma);
float TotalKernel = 0;
int3 CurrCell = int3(IndexX, IndexY, IndexZ);
int3 MaxCells = int3(NumCellsX, NumCellsY, NumCellsZ)  - 1;
for (int xx = -Radius; xx <= Radius; ++xx) {
for (int yy = -Radius; yy <= Radius; ++yy) {
for (int zz = -Radius; zz <= Radius; ++zz) {
  int3 SampleVec = int3(xx,yy,zz);
  int3 SampelCell = clamp(CurrCell + SampleVec, int3(0,0,0), MaxCells);
  float Sample;
  Grid.GetFloatGridValue(SampelCell.x, SampelCell.y, SampelCell.z, Sample);
  float KernelValue = Coeff * exp(-1. * length2(SampleVec) / (TwoSigmaSquared)); 
  TotalKernel += KernelValue;
  BlurredValue += Sample * KernelValue;
BlurredValue /= TotalKernel;
;W/Ë¿]
float S_right;
Grid.GetFloatGridValue(IndexX+1, IndexY, IndexZ, S_right);
float S_left;
Grid.GetFloatGridValue(IndexX-1, IndexY, IndexZ, S_left);
float S_up;
Grid.GetFloatGridValue(IndexX, IndexY+1, IndexZ, S_up);
float S_down;
Grid.GetFloatGridValue(IndexX, IndexY-1, IndexZ, S_down);
float S_front;
Grid.GetFloatGridValue(IndexX, IndexY, IndexZ+1, S_front);
float S_back;
Grid.GetFloatGridValue(IndexX, IndexY, IndexZ-1, S_back);
Grad = float3(S_right - S_left, S_up - S_down, S_front - S_back) / (2.0 * dx);
Grad = float3(0.0, 0.0, 0.0);
âo5ﬁ GÇG1o.¥±ã;
ÙÓ´l«aB¶^K9%ın[;
Fà⁄zAÿı´Ï;
£îÛ@dÖ;
∫]±+4V=@µTi¡m∫y@;
float3 IndexF = Unit * float3(NumCellsX, NumCellsZ, NumCellsZ) - .5;
float3 IndexWaterHeight = UnitWaterHeight * float3(NumCellsX, NumCellsZ, NumCellsZ) - .5;
const int IntParticleRadius = round(ParticleIndexRadius)+2;
float FaceArea = dx*dx;
float3 CurrPressureGrad = float3(0,0,0);
BuoyancyForce = float3(0,0,0);
Frac = 0;
numright = 0;
numleft = 0;
numco = 0;
for (int xx = -IntParticleRadius; xx <= IntParticleRadius; ++xx) {
for (int yy = -IntParticleRadius; yy <= IntParticleRadius; ++yy) {
for (int zz = -IntParticleRadius; zz <= IntParticleRadius; ++zz) {
    const int3 Offset = int3(xx,yy,zz);
    const int3 CurrIntIndex = IndexF + Offset;
    if (length(Offset) <= IntParticleRadius && 
        CurrIntIndex.x >= 0 && CurrIntIndex.x < NumCellsX && 
        CurrIntIndex.y >= 0 && CurrIntIndex.y < NumCellsY &&
        CurrIntIndex.z >= 0 && CurrIntIndex.z < NumCellsZ) 
        float4 SolidVelocity_Boundary;       
        BoundaryReader.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
        float Boundary = SolidVelocity_Boundary.w;        
        // if we have a fluid cell
        if (CurrIntIndex.z < IndexWaterHeight.z)// && round(Boundary) == 0)
            // get pressure
            float Pressure;
            PressureReader.GetPreviousFloatValue<Attribute="Pressure">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
            // debug pressure at depth
            //Pressure = CurrIntIndex.z < IndexWaterHeight.z ? (IndexWaterHeight.z - CurrIntIndex.z) * dx * 980 : 0;
            // get face fractions for current cell
            float3 TmpFraction;
            FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
            float F_right = TmpFraction.x;
            float F_up = TmpFraction.y;
            float F_front = TmpFraction.z;
            FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
            float F_left = TmpFraction.x;
            FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
            float F_down = TmpFraction.y;
            FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
            float F_back = TmpFraction.z;
            if (F_right > 1e-8)            
                 numright++;
            if (F_left > 1e-8)            
                numleft++;
            // debug sample cells
             float3 TmpCenter = CurrIntIndex;
             FaceReader.IndexToUnit(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpCenter);
             TmpCenter = mul(float4(TmpCenter,1), UnitToWorld);
             DebugDraw.DrawSphere(true, TmpCenter, 1.0, 16, float4(1,0,0,1));
            Frac += F_right - F_left;
            numco++;
            // integrate and sum
            float3 FractionIntegral = 
                F_right * float3(1,0,0) + F_left * float3(-1,0,0) + //*1.025 + 
                F_up * float3(0,1,0) + F_down * float3(0,-1,0) + //*1.025 + 
                F_front * float3(0,0,1) + F_back * float3(0,0,-1) / FaceArea;
            BuoyancyForce += 10*Pressure * FractionIntegral;
float3 IndexF = Unit * float3(NumCellsX, NumCellsY, NumCellsZ) - .5;
const int IntParticleRadius = ceil(ParticleIndexRadius)+2;
        if (round(Boundary) == 0)
       // if (CurrIntIndex.x == 16 && CurrIntIndex.z == 16)
          //   float3 TmpCenter = CurrIntIndex;
           //  TmpCenter = (.5 + TmpCenter) / float3(NumCellsX, NumCellsY, NumCellsZ);
             //FaceReader.IndexToUnit(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpCenter);
            // TmpCenter = mul(float4(TmpCenter,1), UnitToWorld);
             //DebugDraw.DrawSphere(true, TmpCenter, 1.0, 4, float4(1,0,0,1));
                F_right * float3(1,0,0) + F_left * float3(-1,0,0) +
                F_up * float3(0,1,0) + F_down * float3(0,-1,0) + 
                F_front * float3(0,0,1) + F_back * float3(0,0,-1);
            BuoyancyForce += Pressure * FractionIntegral * FaceArea;
ÍSÇ~à$EÖËl±;2∞ÒU
RotationalForce = float3(0,0,0);
        float4 SolidVelocity_Boundary;
        if (UseReader)
            BoundaryReader.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
        else
            BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
            float F_right;
            float F_up;
            float F_front;
            float F_left;
            float F_down;
            float F_back;
            if (UseReader)
                PressureReader.GetPreviousFloatValue<Attribute="Pressure">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                F_right = TmpFraction.x;
                F_up = TmpFraction.y;
                F_front = TmpFraction.z;
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                F_left = TmpFraction.x;
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
                F_down = TmpFraction.y;
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
                F_back = TmpFraction.z;
            else
                PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
            // compute torque
            // world space of current cell
            float3 CurrUnitPos = (.5 + CurrIntIndex) / float3(NumCellsX, NumCellsY, NumCellsZ);
            float3 CurrWorldPos = mul(float4(CurrUnitPos, 1), UnitToWorld);
            float3 ForceDir = CurrWorldPos - WorldParticleCenter;
            float3 TmpForce = -cross(ForceDir, Pressure * FractionIntegral * FaceArea);
            RotationalForce += TmpForce;
            if (Debug && CurrIntIndex.x == 32 && CurrIntIndex.z == 32)
                float3 TmpCenter = CurrIntIndex;
                TmpCenter = (.5 + TmpCenter) / float3(NumCellsX, NumCellsY, NumCellsZ);
                FaceReader.IndexToUnit(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpCenter);
                TmpCenter = mul(float4(TmpCenter,1), UnitToWorld);
                DebugDraw.DrawSphere(true, WorldParticleCenter, 1.0, 4, float4(1,0,0,1));
                DebugDraw.DrawLine(true, CurrWorldPos, CurrWorldPos+normalize(FractionIntegral)*-50, float4(1,0,0,1));
                DebugDraw.DrawLine(true, CurrWorldPos, CurrWorldPos+normalize(cross(FractionIntegral, ForceDir))*50, float4(1,0,0,1));
//DebugDraw.DrawLine(true, WorldParticleCenter, WorldParticleCenter+RotationalForce, float4(1,0,0,1));
            float ForceLength = length(BuoyancyForce);
            if (ForceLength > 1e-8)
                //BuoyancyForce = min(10000000, ForceLength) * BuoyancyForce / ForceLength;
Vol = 4./3 * 3.1415926 * Rad.x * Rad.y * Rad.z;
Ëí˜@ÒK;D∏ ø]jY›…@
Ëí˜@ÒK;D∏ ø]jY›…
//  https://math.stackexchange.com/questions/1778627/ellipsoid-moment-of-inertia-matrix
MomentOfInertia.x = r.y * r.y + r.z * r.z;
MomentOfInertia.y = r.z * r.z + r.x * r.x;
MomentOfInertia.z = r.y * r.y + r.x * r.x;
MomentOfInertia *= m / 5.;
SpriteSize = 2.0 * max(max(Radius.x, Radius.y), Radius.z);
øJ;ÜPLÇk°
Ëí˜@ÒK;D∏ ø]jY›…D
?%:ùWC JâCÛ;I\7ï
?%:ùWC JâCÛ;I\7ïI
?%:ùWC JâCÛ;I\7ï°
£;n4‰EfC∞Ì
±qú©#N7O™ª;eﬂ
W`Äd˘å°B≥t¥÷;ƒk|Q
nÂ¢q“qMâ;}tk
;W/Ë¿]c
;W/Ë¿]`
Â√˙»S;ÅD†ò
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3r
ãsL≥L©j;Ö®¨¶ºÃ
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿Ã
>Â;N™Õ)vãh.ZÃ
b\^ÇPÛEü;±
”5oU;Já±±@†®%9i
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™$
K˜ZC ö;Mòïs
;Iò£+1
TA±;ãÒ¢!Áyy
TA±;ãÒ¢!Áy
87ô5¶3Në;
Ñq;dœDÿJë`†à]ÀÁÆ4
¸ëØNµ‹P%Náw;
EÉ©N}í.;
ãß;ÂR@ø©àm¯êúJD
÷ÎÜ˚õAé;¿Ùc.ó∑S
Ò≈;ªO≠lÜ••˙C≥Ã
Æ;IN:ˆ
˝í;ÎÈS
;≠ã£πÏ™G•'∆5
ˇÚEì;Ú"∑
*J;œ’$ÓI¥ÒƒƒÚo‘~
Oö;P2π¸Æ*C
!;ÌBÔΩ«@†À<Ç*
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^
mk†;$û•O´ÜáVóIø¥D
OÆÎi;^¡òŸU
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;D
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.È|
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í |
†HæÂ˛†’H-;
;Ô“].º
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Û
Y{3;FçûRô®<NCC
 DÄ÷bûYPc7
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Óã
xH;A˘qC
˜cKª‰´˛;‡Úˇg
 iÈJÜ-g$ûZH⁄
7uù¬‘RçKô'î£lÅ;kC
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿Ç8
:Ã;3ËBqM£<Y)ôfH$g
AÉ%F;XOÖ6x‡jæÊ\U
xùù⁄€HH≠cç;[*Y>â
xùù⁄€HH≠cç;[*Y>
Ñq;dœDÿJë`†à]ÀÁÆ8
¶;(guˇN£bîÚÿÂ≈U
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
;|ã´Îø
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>mÃ
Dó0¿¯;ÑOæÃ
 l;æNÉÒÌ‡~ 4=i
ÑÒ`@ºèS;<»Zöi
%wäJÄ‚+“;Eh–Q
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜É
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
I ;qÚKí
(s±;î`ÏCö6⁄V`6X3¶
z;›˜™O†lÏwêäNVQ
X;hï(óJâ™◊x!rL
Iù≥l;hf
ê˚÷;Oü2mSáÊ{l™
ê˚÷;Oü2mSáÊ{l
;*≈‹)yOèY_P∑C∞∫X
o;ƒxVÔFπM4
?g[i;ÏÕEâ>ràP`∂?
‰S∫Ì=M9O†<ù.Ü;mî—
úÄˆﬂ&O¢Pÿ¡æƒ;7U
ÛLV‚µc}I≠º;∂c
\∏Aä;!ô-¬€¡U
;+¯OOûû7>
;W/Ë¿]–
TA±;ãÒ¢!Áy‰
xùù⁄€HH≠cç;[*Y>Ù
‚˘áRê;KJö¥°
∞ßã @É;H{d~¨ª
`;5(ÊM
Qäh;≤IUE§⁄
I'Gï»;$¢eœG&
I'Gï»;$¢eœG˜
I'Gï»;$¢eœG
îMæ[JéÊœ;cQ
`Gß‰;úé
‚=;ıEJ±
)—Kï;˘â`O
a∞@äˇ]úBˇñ∂;
d∏dm©√;
¶pH;Ï{Bí£o}·T GU
fk$DÖÑ;l˛åwﬁ
∆N‡˚ú7—AçÂµ;Ωv·
∂ÙµO≥;3Yx‘(ÇQ
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†]
;aJΩzO ?∆+†
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;FO
;ïµ%◊7–Eéõﬁs
Ä~E;ﬁÂ
B≥%Îë;
∞@õG;pJÆ'gO
;?%¶f\
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
Ü;‚{v¡!JéDY†a
∆M±\Oå;µxK
¨•;ª´Ê“Kß√t
Ö∏:“)¢ŒOò;æíÖ√
Ö∏:“)¢ŒOò;æíÖ√„õ
;aJΩzO ?∆+†Õ
˘;gf&€
FØà^&∏;+
˚;YPaGî
ä{“D°;µMú-lí
ó‚‰z;XUIÄt7a!EÏ
Úó;˝3g.Dì
z;O∫kÉ^˝öËTQ
≤´;à‘ÿ
;óKàri‰59vìr
;óKàri‰59vì3
C;Ní®ã|« !¿u
C;Ní®ã|« !¿j
îƒzM≤o;J
FIÄ~–//
;óKàri‰59vìà
C;Ní®ã|« !¿ã
…r+;ñ±
ä,ªf;¥CH•–2ÈÓπ
)Ç-=ûéMí'i«9ﬂ;ñU
;óKàri‰59vìó
C;Ní®ã|« !¿ö
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;”O
iƒGÅZ;
XûEøEø;bÒ1°—
XûEøEø;bÒ1°°
XûEøEø;bÒ1°
;aªã3œŸKΩ9
N[áÆ;|]HøsìΩﬂ]¨ØR
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;Q
q‘ı;EûuCdﬁ&5›R
q‘ı;EûuCdﬁ&5›U
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
£í;Cä˘G¥
@™ÛlØ,;
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]d
Aì;˝ˇ\∑Ç]î
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_k
É∆:JóÑƒ—;Tá_X
9á‚ s‘]MäSr;˚±µ`O
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNıt
9;˛π$J»Añ{C8·åNıU
ùY˝;BEî¢
;@ß\€È-ï–„É
;@ß\€È-ï–„
Ò¢;•BˆCî
÷≈'àö;HHÜuUF…7F∑ä
÷≈'àö;HHÜuUF…7F∑U
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€
Ω.BπYÎ;k7Î˜ê
Ω.BπYÎ;k7Î˜X
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Gò;ä∆…±
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“A¶
 ZSiBº´AéÓ—lÜ∆“AU
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
Ø;yb8S.GÜˆ∞—_(/,≥§h
Ø;yb8S.GÜˆ∞—_(/,
 C®ØHŸ˜ÎRﬁU
––˙»H™;[á}zŒBQ
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
M°;IÅ_
;ªÑê*%¿
;ªÑê*%
N´†;zXã
%fÏ;∫ÆJä?,x
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
jA∏^πΩ—;lı—
jA∏^πΩ—;lı+
EñC‡w@¸k;U
Çõ·;∑G`@ÜóB!‚L
&≠,ÿ;´§Oª‚œ
 r∆◊h€
 r∆◊hd
Y;k≠dDø®Yù¿h8›
Y;k≠dDø®Yù¿h8U
$ÚÔ⁄Ì;ﬁ
$ÚÔ⁄Ì;Í
Î;óXS›¬M¨
)∞ºA’;|LÇ˝
’d;ö4 Nò
iyH≠T‘;0
X;hï(óJâ™◊x!rLÁ
X;hï(óJâ™◊x!rLX
î°öª¬H;Cºî≠
é⁄p(‡çQMÜPÕ‰˛;euQ
˘';hPNû
ü;Ñ—Jó
∆ÀI;∫ä'L™
Ã58;øQÆHΩQø
H;Îw‹_MKØ˚µ2Z‘Á‰
H;Îw‹_MKØ˚µ2Z‘Á‰»
∆M±\Oå;µxKX
=˜ƒ;≠A7Eô≤"}_3J
=˜ƒ;≠A7Eô≤"}_3JU
¯;·€J_UD®9&Ÿ
àd∂;ì9êEù&
;˚Óo≠¶≈Nπ¯)äˇôæâ
C˝_;÷p|Cí"
@Â;MÙ„q$Éé¨Jè∂lB˙ë'
8ú˛Q-ºUKé|Kàl;…hQ
Oæ≥FGÄÛ}3;`‡Î
Oæ≥FGÄÛ}3;`‡ÎÇ
zM;˙JâéLΩ
¬;]O•ª≥Kßg
ÛÆ¸Eg6;@Å÷ﬁW
˘5D;Ö¯-AÖUß„à]1§U
<À$Hò¢aπ¬!Dü;€G’œ¿¸ö
Hò¢aπ¬!Dü;€G’œ¿¸
ìlUm‹˚B¥];
nL;^i™
Û;VG‰A´U
?g[i;ÏÕEâ>ràP`∂?+
?g[i;ÏÕEâ>ràP`∂?X
¬;ØgJ∫˝KÄ¯ò
’-Ë@Ö;
8—d≤G©G¡`Q;◊HQ
Íi+;<’Nö±w
Û]¯;¨òïBá
 h◊ﬂ+Q
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9J
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;ö
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
ı‰®I¶;
¨3êC?D´Ü∂v;“%1^
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆa
ùΩ;Bêa¢óoÆóˆX
 A´KUTFöR!c
 A´KUTFöR!U
DH;Eêé$,*H‹–h
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡j
GåÁÂé-;Ë‡∂
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;ö
;YÂLËU
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQbU
©ÁI°Q-¸;_◊
û∞‘Y§;#BÑJé
q‘ı;EûuCdﬁ&5
Aì;˝ˇ\∑Ç]ó
É∆:JóÑƒ—;Tá_û
9;˛π$J»Añ{C8·åNıß
;@ß\€È-ï–„∂
÷≈'àö;HHÜuUF…7F∑Ω
Ω.BπYÎ;k7Î˜√
 ZSiBº´AéÓ—lÜ∆“A‘
;ªÑê*%Ó
jA∏^πΩ—;lı˛
Y;k≠dDø®Yù¿h8
$ÚÔ⁄Ì;
H;Îw‹_MKØ˚µ2Z‘Á‰-
∆M±\Oå;µxK.
=˜ƒ;≠A7Eô≤"}_3J2
õ~+òç«;LÅ#=∫JSl^Q
A∂ÌN¢HÛË¸xø9;
Oæ≥FGÄÛ}3;`‡Î<
?g[i;ÏÕEâ>ràP`∂?V
˘;gf&€]
˘;gf&€X
Nñ;ö€W1ˆz…I©ı‰xÔZ
¬W˛∞˚JC±;>‰'S
J°_ycô‰;
∂;ΩR\U
¯;@QÆ@Ç-˘i_¸1”Ó•r
¯;@QÆ@Ç-˘i_¸1”
®+´c ı„A©W!∑;
∞ßã @É;H{d~¨ªk
∞ßã @É;H{d~¨ªX
H^˛;DU
ˆúr//k°N≠(d:¥
p;xì±≥∞Lù@
ÔHÍP∂‘*G∞¬;
oi∑;_Aå¢õÜ‘ÃÈ9ë
¨3êC?D´Ü∂v;“%1•
ùΩ;Bêa¢óoÆóˆ®
 A´KUTFöR!™
GåÁÂé-;Ë‡Æ
jDÖa#˘;˚|?Q
˙∆FÄe;mUwË>≈
˙∆FÄe;mUwË>U
INí^;©ı”ﬁﬂKÁˆ
INí^;©ı”ﬁﬂ
@;TÈ∞M∞I®TLô≥ß¥ﬁ
U™yE≤3a;§“œk
∞)‡XCnEOü ;
 MÚÆÉ~Oë‘
`Wúπû75O∞ØD;˘ùA‰Õ
`Wúπû75O∞ØD;˘ùA‰U
˙∆FÄe;mUwË>–
 l˛[>ÅEéÈ¨x}#6qL›
 l˛[>ÅEéÈ¨x}#6q
≤◊,‡ƒ;}¿ÛZ[´DØMV±
;}¿ÛZ[´DØMV±
hÖM©ªÈˆHàC;¥
sñ'Áª7;F´
$xø)˙k;M§nΩ\
°±5/∏èÍL∏˙ÔNˇ;%nU
C>7™Jª}*eÛ;ﬁˆ}F
C>7™Jª}*eÛ;ﬁˆ
Ö√Ú";ú»AΩπ
u≠;ÂÔ™3Et€@¢Sµ≥r%˘˜ö
+lÿ-;’ÒBûòæˇîû
Bä&˚Z;
 rœ¯•‰
iKê; C
`Wúπû75O∞ØD;˘ùA‰Î
˙∆FÄe;mUwË>Ó
ä{“D°;µMú-lí˘
ä{“D°;µMú-líX
◊*åä;jO∏˘øg
‰˜DÖ0;èU
7D{C°èÅG¢#pÓ[;7
ó‚‰z;XUIÄt7a!EÏX
;©†˚(ÊÂFêç
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•U
Aì;˝ˇ\∑Ç]
x´;Bé§í‡Òä`Ê 
x´;Bé§í‡Òä`Ê°
‰g;•†0MÜQ:âıπº^"
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
ã≤X¡O®;Ú
K;Óñ‰ﬁ6
K;Óñ‰ﬁ
ºiP7.b[BÉã|€?H]\;
€‰»W‡‡;
*NLpÁOé ‡KÕW]q;
&HÚ´;R
DÅ)¯P√}i;<
DÅ)¯P√}i;-
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
Úh;|}}
qi;;¥E∂o>2e
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯XE
;˙/¯X3
ıR9ÿ"D¨Úq;Ã
¶;(guˇN£bîÚÿÂ≈UG
¶;(guˇN£bîÚÿÂ≈U2
 iß§A†ÌMıkÚd;Q
g‹I∏xü;Ü
%îh;˘Ä_G∑
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
GåÁÂé-;Ë‡
ìáï∆)K;Mà±≠/˜˜ùöQ
;M¸è¿sK£ﬁ»u8q„eU
eCSFç_ï˝;6¿J
#9°π™Ö⁄Lß;fRˆ˝Û∂
˛´T“@õÜ;˘TÑq™]
˛´T“@õÜ;˘TÑq™£
\Ày`AçÇZ≥Ñ˙;±^
\Ày`AçÇZ≥Ñ˙;±2
;\AŒ#Ú≤JêO<ê†Kue
kgÉÄ§DÅPŒrq1;Ô
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
&—√n‡]⁄KØ;û
˘aûª;D°Oá
 Cã˛¡î
ñt;Nö®√
jA∏^πΩ—;lı
;˚Óo≠¶≈Nπ¯)äˇôæâÓ
˘¶Mb†;\Lõº≤œÌO˙·
å·;ˆ÷hÆNóıÓŸƒq±∞Ö
å·;ˆ÷hÆNóıÓŸƒq±∞
nL;^i™á
nL;^i™’
™UdÛ”˙xEæ;πΩ}B≥ö
 —<;?h™Môç•ØZüòUë
x´;Bé§í‡Òä`Êî
‰g;•†0MÜQ:âıπº^ñ
DÅ)¯P√}i;∞
;˙/¯Xπ
¶;(guˇN£bîÚÿÂ≈Uª
√˜©„BAåÊÀ;`w^C
˛´T“@õÜ;˘TÑq™—
\Ày`AçÇZ≥Ñ˙;±“
;˚Óo≠¶≈Nπ¯)äˇôæâÛ
å·;ˆ÷hÆNóıÓŸƒq±∞˘
nL;^i™˚
°€J;0ÛWCà
?Â;®q@L∑p<XıÍoÛ
GœVkNHÓ@®‡sÊˆ;qq
;ON≥=Úqv⁄ƒ
:.>âDµË˛1[è…;
JΩR⁄^;
:.>âDµË˛1[è…;0
;√nQm7
â\D⁄M¢ZûYV@¸º;
SiI¢n‹1Ò G};
NæÆÄqæ∫;*©
ó±√;ÚM¢°
NæÆÄqæ∫;*
õ…;ÔÙ∞NíDK∫O6Ë¿F
õ…;ÔÙ∞NíDK∫O6Ë¿
v†S]¶Æ"Kª;ò_YIto©
v†S]¶Æ"Kª;ò_YIto
õ…;ÔÙ∞NíDK∫O6Ë¿I
——6¸'…;`
ÿˇR:˘≤zñy;Ÿ
// Shader generated by Niagara HLSL Translator
// SimStage[0] = ParticleSpawnUpdate
// SimStage[1] = Build Kernel Array
// SimStage[2] = Init Temporary Grid
// SimStage[3] = Initialize StartVelocity Grid
// SimStage[4] = Rasterize Particles
// SimStage[5] = Compute Boundary
// SimStage[6] = Compute Boundary High Precision 2
// SimStage[7] = Extrapolate Velocity
// SimStage[8] = Compute Divergence
// SimStage[9] = Solve Pressure
// SimStage[10] = Project Pressure
// SimStage[11] = Extrapolate Velocities Again
// SimStage[12] = FLIP / PIC force
// SimStage[13] = Fill Rasterization Grid
// SimStage[14] = Smooth in X
// SimStage[15] = Smooth in Y
// SimStage[16] = Smooth in Z and Output
// SimStage[17] = Output
// SimStage[18] = Generate Mesh
// Compile Data> Static Variables Input: 
// Compile Data> PinToConstantValues Input: 
int ID;
int Index;
int AcquireTag;
float Engine_WorldDeltaTime;
float Engine_DeltaTime;
float Engine_InverseDeltaTime;
float Engine_Time;
float Engine_RealTime;
int Engine_QualityLevel;
int Engine_PaddingInt32_0;
int Engine_PaddingInt32_1;
float Engine_Owner_TimeSinceRendered;
float Engine_Owner_LODDistance;
float Engine_Owner_LODDistanceFraction;
float Engine_System_Age;
int Engine_Owner_ExecutionState;
int Engine_System_TickCount;
int Engine_System_NumEmitters;
int Engine_System_NumEmittersAlive;
int Engine_System_SignificanceIndex;
int Engine_System_RandomSeed;
int Engine_System_CurrentTimeStep;
int Engine_System_NumTimeSteps;
float Engine_System_TimeStepFraction;
int Engine_System_NumParticles;
int Engine_System_PaddingInt32_0;
int Engine_System_PaddingInt32_1;
float4x4 Engine_Owner_SystemLocalToWorld;
float4x4 Engine_Owner_SystemWorldToLocal;
float4x4 Engine_Owner_SystemLocalToWorldTransposed;
float4x4 Engine_Owner_SystemWorldToLocalTransposed;
float4x4 Engine_Owner_SystemLocalToWorldNoScale;
float4x4 Engine_Owner_SystemWorldToLocalNoScale;
float4 Engine_Owner_Rotation;
float3 Engine_Owner_Position;
int Engine_Owner_PaddingInt32_0;
float3 Engine_Owner_Velocity;
int Engine_Owner_PaddingInt32_1;
float3 Engine_Owner_SystemXAxis;
int Engine_Owner_PaddingInt32_2;
float3 Engine_Owner_SystemYAxis;
int Engine_Owner_PaddingInt32_3;
float3 Engine_Owner_SystemZAxis;
int Engine_Owner_PaddingInt32_4;
float3 Engine_Owner_Scale;
int Engine_Owner_PaddingInt32_5;
float4 Engine_Owner_LWCTile;
int Engine_Emitter_NumParticles;
int Engine_Emitter_TotalSpawnedParticles;
float Engine_Emitter_SpawnCountScale;
float Emitter_Age;
int Emitter_RandomSeed;
int Engine_Emitter_InstanceSeed;
int Engine_Emitter_PaddingInt32_0;
int Engine_Emitter_PaddingInt32_1;
float4x4 Emitter_UnitToWorld;
float4x4 Emitter_WorldToUnit;
float4x4 Emitter_WorldToLocal;
float4x4 Emitter_LocalToWorld;
float3 Emitter_SimGrid_Velocity;
float Emitter_SDF_dx;
float3 Emitter_StartVelocityGrid_StartVelocity;
float Emitter_SDFGrid_SDF;
float Emitter_dx;
bool Emitter_Grid3D_FLIP_Tank_Spawn_HasSpawnedThisFrame;
int Emitter_OVERRIDE_ParticlesPerCell;
int Emitter_Grid3D_FLIP_Tank_Spawn_WaterHeightZIndex;
int Emitter_Grid3D_FLIP_Tank_Spawn_TotalEmissionCells;
float Emitter_DeltaTime;
int Emitter_Grid3D_InitializeConvolutionKernel_Radius;
float Emitter_TemporaryGrid_SimFloat;
int Emitter_SimGrid_SimFloatIndex;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_CollisionVelocityMult;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryUp;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryLeft;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryRight;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryDown;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryFront;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryBack;
int Emitter_SimGrid_VelocityIndex;
float Emitter_PressureGrid_Pressure;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_PressureRelaxation;
int Emitter_SimGrid_PressureIndex;
int Emitter_SimGrid_BoundaryIndex;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_PICFLIPRatio;
float Emitter_RasterizationGrid3D_Initialize_dx;
int Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_SDFParticleSizeMult;
float Boundary;
float BoundarySignedDistance;
float3 FaceFraction;
bool Kill;
float Len;
float3 PhysicsForce;
float SimFloat;
float3 SolidVelocity;
float3 Velocity;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter Emitter;
float SDF;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter Emitter;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48_Emitter Emitter;
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC_Transient Transient;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter Emitter;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704_Transient Transient;
float Pressure;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_PressureGrid PressureGrid;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter Emitter;
FParamMap0_SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter Emitter;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter Emitter;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B_Transient Transient;
float3 FaceVals;
bool UseHighPrecision;
float dx;
int HalfBandwidth;
float RadiusMult;
bool SourceIsLocalSpace;
float4x4 WorldToUnit;
float3 Position;
float2 SpriteSize;
int UniqueID;
bool IsInsideBoundary;
bool IsInsideDomain;
float3 ExtrapolatedVelocity;
float ConvolvedValue;
float3 Grad;
float Div;
FParamMap0_OUTPUT_VAR_Grid3D_ComputeDivergence Grid3D_ComputeDivergence;
FParamMap0_OUTPUT_VAR_Grid3D_ComputeGradient Grid3D_ComputeGradient;
FParamMap0_OUTPUT_VAR_Grid3D_ComputeGradient001 Grid3D_ComputeGradient001;
FParamMap0_OUTPUT_VAR_Grid3D_ConvolveAxis Grid3D_ConvolveAxis;
FParamMap0_OUTPUT_VAR_Grid3D_ConvolveAxis001 Grid3D_ConvolveAxis001;
FParamMap0_OUTPUT_VAR_Grid3D_ConvolveAxis002 Grid3D_ConvolveAxis002;
FParamMap0_OUTPUT_VAR_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_OUTPUT_VAR_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_OUTPUT_VAR_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute Grid3D_GetFluidAttribute;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute001 Grid3D_GetFluidAttribute001;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute002 Grid3D_GetFluidAttribute002;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute003 Grid3D_GetFluidAttribute003;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute004 Grid3D_GetFluidAttribute004;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute005 Grid3D_GetFluidAttribute005;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute006 Grid3D_GetFluidAttribute006;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute007 Grid3D_GetFluidAttribute007;
FParamMap0_OUTPUT_VAR_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_OUTPUT_VAR_Grid3D_ProjectPressure Grid3D_ProjectPressure;
int Channel;
float3 VECTOR_VAR;
float4 Value;
bool Resample;
float3 Unit;
float3 UnitPosition;
float3 WorldPos;
FParamMap0_Local_Grid3D_ComputeBoundary Grid3D_ComputeBoundary;
FParamMap0_Local_Grid3D_ComputeHighPrecisionBoundary Grid3D_ComputeHighPrecisionBoundary;
FParamMap0_Local_Grid3D_GetFluidAttribute Grid3D_GetFluidAttribute;
FParamMap0_Local_Grid3D_GetFluidAttribute001 Grid3D_GetFluidAttribute001;
FParamMap0_Local_Grid3D_GetFluidAttribute002 Grid3D_GetFluidAttribute002;
FParamMap0_Local_Grid3D_GetFluidAttribute003 Grid3D_GetFluidAttribute003;
FParamMap0_Local_Grid3D_GetFluidAttribute004 Grid3D_GetFluidAttribute004;
FParamMap0_Local_Grid3D_GetFluidAttribute005 Grid3D_GetFluidAttribute005;
FParamMap0_Local_Grid3D_GetFluidAttribute006 Grid3D_GetFluidAttribute006;
FParamMap0_Local_Grid3D_GetFluidAttribute007 Grid3D_GetFluidAttribute007;
FParamMap0_Local_Grid3D_SetRTValues Grid3D_SetRTValues;
FParamMap0_Local_Grid3D_SetRTValues001 Grid3D_SetRTValues001;
bool KillParticles;
float Alpha;
float Blue;
float Green;
float Red;
float3 StartVelocity;
float dt;
float3 PressureGradient;
float Divergence;
float Relaxation;
float CellSize;
float4x4 UnitToWorld;
int BoundaryIndex;
float4x4 WorldToLocal;
float4x4 LocalToWorld;
float PicOrFlip;
int ParticlesPerCell;
bool SpawnedThisFrame;
int TotalEmissionCells;
int WaterHeightZIndex;
int VelocityIndex;
int Radius;
bool OpenBoundaryASC43X;
bool OpenBoundaryASC43Y;
bool OpenBoundaryASC43Z;
bool OpenBoundaryASC45X;
bool OpenBoundaryASC45Y;
bool OpenBoundaryASC45Z;
int ScalarIndex;
int VectorIndex;
float3 OffsetSamplePosition;
float VelocityScale;
float Age;
int CurrentTimeStep;
int NumEmitters;
int NumEmittersAlive;
int NumParticles;
int NumTimeSteps;
int PaddingInt32_0;
int PaddingInt32_1;
int RandomSeed;
int SignificanceIndex;
int TickCount;
float TimeStepFraction;
int ExecutionState;
float LODDistance;
float LODDistanceFraction;
float4 LWCTile;
int PaddingInt32_2;
int PaddingInt32_3;
int PaddingInt32_4;
int PaddingInt32_5;
float4 Rotation;
float3 Scale;
float4x4 SystemLocalToWorld;
float4x4 SystemLocalToWorldNoScale;
float4x4 SystemLocalToWorldTransposed;
float4x4 SystemWorldToLocal;
float4x4 SystemWorldToLocalNoScale;
float4x4 SystemWorldToLocalTransposed;
float3 SystemXAxis;
float3 SystemYAxis;
float3 SystemZAxis;
float TimeSinceRendered;
NiagaraEmitterID ID;
int InstanceSeed;
float SpawnCountScale;
int TotalSpawnedParticles;
float DeltaTime;
FParamMap0_Engine_Emitter Emitter;
int ExecIndex;
float InverseDeltaTime;
FParamMap0_Engine_Owner Owner;
int QualityLevel;
float RealTime;
FParamMap0_Engine_System System;
float Time;
float WorldDeltaTime;
bool HasSpawnedThisFrame;
float CollisionVelocityMult;
bool OpenBoundaryBack;
bool OpenBoundaryDown;
bool OpenBoundaryFront;
bool OpenBoundaryLeft;
bool OpenBoundaryRight;
bool OpenBoundaryUp;
float PICFLIPRatio;
float PressureRelaxation;
float SDFParticleSizeMult;
FParamMap0_Emitter_Grid3D_FLIP_FLUID_CONTROLS Grid3D_FLIP_FLUID_CONTROLS;
FParamMap0_Emitter_Grid3D_FLIP_Tank_Spawn Grid3D_FLIP_Tank_Spawn;
FParamMap0_Emitter_Grid3D_InitializeConvolutionKernel Grid3D_InitializeConvolutionKernel;
FParamMap0_Emitter_OVERRIDE OVERRIDE;
FParamMap0_Emitter_PressureGrid PressureGrid;
FParamMap0_Emitter_RasterizationGrid3D_Initialize RasterizationGrid3D_Initialize;
float SDF_dx;
FParamMap0_Emitter_SDFGrid SDFGrid;
FParamMap0_Emitter_SimGrid SimGrid;
int SimGrid_BoundaryIndex;
int SimGrid_PressureIndex;
int SimGrid_SimFloatIndex;
int SimGrid_VelocityIndex;
FParamMap0_Emitter_StartVelocityGrid StartVelocityGrid;
FParamMap0_Emitter_TemporaryGrid TemporaryGrid;
bool Alive;
int Position;
int SpriteSize;
int Velocity;
FParamMap0_Array Array;
FParamMap0_DataInstance DataInstance;
FParamMap0_Emitter Emitter;
FParamMap0_Engine Engine;
FParamMap0_Grid3D_ComputeBoundary Grid3D_ComputeBoundary;
FParamMap0_Grid3D_ComputeDivergence Grid3D_ComputeDivergence;
FParamMap0_Grid3D_ComputeGradient Grid3D_ComputeGradient;
FParamMap0_Grid3D_ComputeGradient001 Grid3D_ComputeGradient001;
FParamMap0_Grid3D_ComputeHighPrecisionBoundary Grid3D_ComputeHighPrecisionBoundary;
FParamMap0_Grid3D_CreateConvolutionKernel Grid3D_CreateConvolutionKernel;
FParamMap0_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_Grid3D_Flip_GridParticles Grid3D_Flip_GridParticles;
FParamMap0_Grid3D_FLIP_IntegrateParticleVelocity Grid3D_FLIP_IntegrateParticleVelocity;
FParamMap0_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
FParamMap0_Grid3D_FLIP_RasterizeParticles Grid3D_FLIP_RasterizeParticles;
FParamMap0_Grid3D_GenerateMeshFromDistanceField Grid3D_GenerateMeshFromDistanceField;
FParamMap0_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_Grid3D_SetFluidAttribute Grid3D_SetFluidAttribute;
FParamMap0_Grid3D_SetFluidAttribute001 Grid3D_SetFluidAttribute001;
FParamMap0_Grid3D_SetFluidAttribute002 Grid3D_SetFluidAttribute002;
FParamMap0_Grid3D_SetFluidAttribute003 Grid3D_SetFluidAttribute003;
FParamMap0_Grid3D_SetRTValues Grid3D_SetRTValues;
FParamMap0_Grid3D_SetRTValues001 Grid3D_SetRTValues001;
FParamMap0_KillParticles KillParticles;
FParamMap0_KillParticles001 KillParticles001;
FParamMap0_Local Local;
FParamMap0_MakeFloatFromVector MakeFloatFromVector;
FParamMap0_MakeFloatFromVector001 MakeFloatFromVector001;
FParamMap0_MakeFloatFromVector002 MakeFloatFromVector002;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_Particles Particles;
FParamMap0_RasterizationGrid_ParticleSource RasterizationGrid_ParticleSource;
FParamMap0_ScratchDynamicInput_01 ScratchDynamicInput_01;
FParamMap0_ScratchModule_02 ScratchModule_02;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B SetVariables_196415D64713B26D008A18AD62DEAC4B;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7 SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7;
FParamMap0_SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2 SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4 SetVariables_9DBFE6D34A13F2D4792275A8C97387E4;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704 SetVariables_A6C8B03743BE41C39A693F9918B79704;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB SetVariables_A802BB404624ACFB5C9C96987F3207AB;
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC SetVariables_C70B065E4ACA60099D622884219EB2AC;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48 SetVariables_C7A11F704885D153E91991B58A269A48;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939 SetVariables_E132597143CDBB6A0359E5AE7A16F939;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686 SetVariables_F07AF7D941D725DF04BE00AD577F0686;
FParamMap0_Transient Transient;
#if ((SimulationStageIndex == 0)) // MapSpawn
FParamMap0 MapSpawn;
#endif // MapSpawn
#if ((SimulationStageIndex == 0)) // MapUpdate
FParamMap0 MapUpdate;
#endif // MapUpdate
#if ((SimulationStageIndex == 1)) // MapSimStage1_BuildKernelArray
FParamMap0 MapSimStage1_BuildKernelArray;
#endif // MapSimStage1_BuildKernelArray
#if ((SimulationStageIndex == 2)) // MapSimStage2_InitTemporaryGrid
FParamMap0 MapSimStage2_InitTemporaryGrid;
#endif // MapSimStage2_InitTemporaryGrid
#if ((SimulationStageIndex == 3)) // MapSimStage3_InitializeStartVelocityGrid
FParamMap0 MapSimStage3_InitializeStartVelocityGrid;
#endif // MapSimStage3_InitializeStartVelocityGrid
#if ((SimulationStageIndex == 4)) // MapSimStage4_RasterizeParticles
FParamMap0 MapSimStage4_RasterizeParticles;
#endif // MapSimStage4_RasterizeParticles
#if ((SimulationStageIndex == 5)) // MapSimStage5_ComputeBoundary
FParamMap0 MapSimStage5_ComputeBoundary;
#endif // MapSimStage5_ComputeBoundary
#if ((SimulationStageIndex == 6)) // MapSimStage6_ComputeBoundaryHighPrecision2
FParamMap0 MapSimStage6_ComputeBoundaryHighPrecision2;
#endif // MapSimStage6_ComputeBoundaryHighPrecision2
#if ((SimulationStageIndex == 7)) // MapSimStage7_ExtrapolateVelocity
FParamMap0 MapSimStage7_ExtrapolateVelocity;
#endif // MapSimStage7_ExtrapolateVelocity
#if ((SimulationStageIndex == 8)) // MapSimStage8_ComputeDivergence
FParamMap0 MapSimStage8_ComputeDivergence;
#endif // MapSimStage8_ComputeDivergence
#if ((SimulationStageIndex == 9)) // MapSimStage9_SolvePressure
FParamMap0 MapSimStage9_SolvePressure;
#endif // MapSimStage9_SolvePressure
#if ((SimulationStageIndex == 10)) // MapSimStage10_ProjectPressure
FParamMap0 MapSimStage10_ProjectPressure;
#endif // MapSimStage10_ProjectPressure
#if ((SimulationStageIndex == 11)) // MapSimStage11_ExtrapolateVelocitiesAgain
FParamMap0 MapSimStage11_ExtrapolateVelocitiesAgain;
#endif // MapSimStage11_ExtrapolateVelocitiesAgain
#if ((SimulationStageIndex == 12)) // MapSimStage12_FLIP_PICforce
FParamMap0 MapSimStage12_FLIP_PICforce;
#endif // MapSimStage12_FLIP_PICforce
#if ((SimulationStageIndex == 13)) // MapSimStage13_FillRasterizationGrid
FParamMap0 MapSimStage13_FillRasterizationGrid;
#endif // MapSimStage13_FillRasterizationGrid
#if ((SimulationStageIndex == 14)) // MapSimStage14_SmoothinX
FParamMap0 MapSimStage14_SmoothinX;
#endif // MapSimStage14_SmoothinX
#if ((SimulationStageIndex == 15)) // MapSimStage15_SmoothinY
FParamMap0 MapSimStage15_SmoothinY;
#endif // MapSimStage15_SmoothinY
#if ((SimulationStageIndex == 16)) // MapSimStage16_SmoothinZandOutput
FParamMap0 MapSimStage16_SmoothinZandOutput;
#endif // MapSimStage16_SmoothinZandOutput
#if ((SimulationStageIndex == 17)) // MapSimStage17_Output
FParamMap0 MapSimStage17_Output;
#endif // MapSimStage17_Output
#if ((SimulationStageIndex == 18)) // MapSimStage18_GenerateMesh
FParamMap0 MapSimStage18_GenerateMesh;
#endif // MapSimStage18_GenerateMesh
static float HackSpawnInterp = 1.0;
void CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void LinearToIndex_Emitter_SimGrid(int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void CustomHlsl15F57A17D3C6CD872453D57109EEFC09FB22EC22_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, out bool Out_ret);
void Grid3D_Flip_GridParticles_Emitter_Func_(inout FSimulationContext Context);
void KillParticles001_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_IndexX, int In_IndexY, float In_Value);
void CustomHlslD5A9A830D1BCA669EECAFF07FD41F646A6C3FA88Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
void Grid3D_CreateConvolutionKernel_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void TransformBase_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TemporaryGrid(float3 In_Unit, out float3 Out_Index);
void Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SetGridValue_Emitter_TemporaryGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslAC6AA32E19D571ACCAF1F6D5C21DBA04E251D543Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_01_Emitter_Func_(out float3 Out_Output, inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetClosestPoint_User_Collide_Meshes(float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestNormal, out float3 Out_ClosestVelocity);
void CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReader(out int Out_NumParticles);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeScale(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeMeshOrientation(int In_ParticleIndex, out bool Out_Valid, out float4 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeVelocity(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevMeshOrientation(int In_ParticleIndex, out bool Out_Valid, out float4 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevPosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_(float3 In_CellPos, float In_VelocityMult, int In_NumParticles, float4x4 In_WorldToLocal, float In_dt, out float Out_BoundaryOut, out float3 Out_VelocityOut, out float Out_SignedDistance);
void CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute006_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void Grid3D_GetFluidAttribute007_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_TransientGrid(out float3 Out_Unit);
void CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float In_dt, out float Out_theta_ppp, out float Out_theta_ppn, out float Out_theta_pnn, out float Out_theta_pnp, out float Out_theta_nnp, out float Out_theta_npp, out float Out_theta_npn, out float Out_theta_nnn, out float3 Out_AverageSolidVelocity);
void CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlslF7896E8302019A2109B3480BCA89BE7700735867_Func_(float3 In_theta, out float Out_AreaFraction);
void ComputeAreaFraction_Func_(float3 In_INPUT_VAR, out float Out_AreaFraction, inout FSimulationContext Context);
void CustomHlslA44BBB265F0C85C41C0B2022D17AAB9EB3B95101_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlslAA55C57AA779F1FEBC42024B4E5A83C6DFC37A3C_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl162B8FBDA44E74CF2A6B1F20F61E119BE51BB43E_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void ComputeFaceFractions_Func_(float In_ppp, float In_ppn, float In_pnn, float In_pnp, float In_nnp, float In_npp, float In_npn, out float3 Out_FaceFractions, inout FSimulationContext Context);
void CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_(float In_theta_ppp, float In_theta_ppn, float In_theta_pnn, float In_theta_pnp, float In_theta_nnp, float In_theta_npp, float In_theta_npn, float In_theta_nnn, out bool Out_IsFullyInsideBoundary);
void Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(float In_dt, out float Out_XFace, out float Out_YFace, out float Out_ZFace, out bool Out_IsFullyInsideBoundary, out float3 Out_SolidVelocity, inout FSimulationContext Context);
void CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_(float3 In_Face, float In_MinFaceFraction, out float3 Out_FaceFraction);
void GetNumCells_Emitter_TransientGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_FaceGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void ScratchModule_02_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_RasterizationGrid_velocity(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetFloatGridValue_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
void SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslB2C1C42F933D291AF1EFD33F67D0CA2952A466C4Emitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
void Grid3D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void Grid3D_GetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void Grid3D_GetFluidAttribute005_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void SimulationStageIterationInfo_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl9F14A6AE80252C6E7EEC2CBCB99F6AFCD412BDBF_Func_(float In_InFloat, out float Out_OutFloat);
void SaturateFloat_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
void Grid3D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
void Grid3D_ProjectPressure_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_Visualize_VectorField_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TransientGrid(float3 In_Unit, out float3 Out_Index);
void CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_(float3 In_UnitPos, out float Out_ret);
void CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_(float In_Mask, out bool Out_IsInside);
void SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_Emitter_Func_(inout FSimulationContext Context);
void KillParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(int In_ParticleIndex, out bool Out_Valid, out float2 Out_Value);
void UnitToFloatIndex_Emitter_RasterizationGrid(float3 In_Unit, out float3 Out_Index);
void GetNumCells_Emitter_RasterizationGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void InterlockedMinFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl1F121CE02C1427DEA34B35005FC46D826DAEF815Emitter_RasterizationGrid_Func_(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
void RasterizationGrid_ParticleSource_Emitter_Func_(inout FSimulationContext Context);
void GetNumCells_Emitter_KernelGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void GetPreviousFloatValue_Emitter_KernelGrid_Attributek(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SDFGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void GetNumCells_Emitter_SDFGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_ConvolveAxis002_Emitter_Func_(inout FSimulationContext Context);
void ScratchModule_03_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_Func_(inout FSimulationContext Context);
void ExecToIndex_Emitter_SimRT(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_SDFGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient001_Emitter_Func_(inout FSimulationContext Context);
void SelectV3Channel_Particle_Func_(float3 In_VECTOR_VAR, int In_TargetChannel, out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector001_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector002_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void Grid3D_SetRTValues001_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_SDFGrid_AttributeSDF(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void GetRenderTargetSize_Emitter_SimRT(out int Out_Width, out int Out_Height, out int Out_Depth);
void AppendTriangle_Emitter_GeneratedMesh_UEImpureCall(bool In_Execute, int In_SectionIndex, float3 In_Position0, float3 In_TangentX0, float3 In_TangentY0, float3 In_TangentZ0, float2 In_TexCoord0, float4 In_Color0, float3 In_Position1, float3 In_TangentX1, float3 In_TangentY1, float3 In_TangentZ1, float2 In_TexCoord1, float4 In_Color1, float3 In_Position2, float3 In_TangentX2, float3 In_TangentY2, float3 In_TangentZ2, float2 In_TexCoord2, float4 In_Color2, out int Out_TriangleIndex);
void GetRenderTargetValue_Emitter_SimRT(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void SampleRenderTargetValue_Emitter_SimRT(float3 In_UVW, float In_MipLevel, out float4 Out_Value);
void CustomHlslD01B102F45DBB09196AE4A4C3EC9E430AF7674E0Emitter_GeneratedMeshEmitter_SimRT_Func_(float In_CubeSize, float3 In_Position, float In_IsoValue, int In_NumVerticesX, int In_NumVerticesY, int In_NumVerticesZ, float4x4 In_UnitToWorld, float4x4 In_WorldToUnit, inout FSimulationContext Context);
void Grid3D_GenerateMeshFromDistanceField_Emitter_Func_(inout FSimulationContext Context);
float GetSpawnInterpolation();
bool Constant15 = false;
float3 Result = In_RangeMax - In_RangeMin;
float3 Result1 = rand(Result);
float3 Result2 = In_RangeMin + Result1;
Out_RandomValue = Result2;
Out_IsDeterministic = Constant15;
In_IndexX >= In_NumCellsX - 2 || In_IndexY >= In_NumCellsY - 2 || In_IndexZ >= In_NumCellsZ - 2;
float Constant6 = 1;
float Constant7 = 1;
int Constant8 = (0);
float3 Constant9 = float3(-0.5,-0.5,-0.5);
float3 Constant10 = float3(0.5,0.5,0.5);
int Constant11 = -1;
int Constant12 = 0;
int Constant13 = (0);
int Constant14 = (0);
float3 CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue;
bool CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant8, Constant9, Constant10, Constant11, Constant12, Constant13, Constant14, CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue, CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
int Result3 = ExecIndex();
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
int Result4 = GetNumCells_Emitter_SimGridOutput_NumCellsX * GetNumCells_Emitter_SimGridOutput_NumCellsY * Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex;
bool Result5 = NiagaraAll(Result3 >= Result4);
float Constant16 = 1;
float3 Result6 = CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue * Constant7 * Result5 * Constant16;
int Result7 = ModuloPrecise(Result3, Result4);
int LinearToIndex_Emitter_SimGridOutput_IndexX;
int LinearToIndex_Emitter_SimGridOutput_IndexY;
int LinearToIndex_Emitter_SimGridOutput_IndexZ;
LinearToIndex_Emitter_SimGrid(Result7, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, LinearToIndex_Emitter_SimGridOutput_IndexZ);
int Result8 = Context.MapSpawn.Grid3D_Flip_GridParticles.ParticlesPerCell * Context.MapSpawn.Grid3D_Flip_GridParticles.TotalEmissionCells;
bool Result9 = NiagaraAll(Result3 > Result8);
int Constant17 = 1;
int Result10 = Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex - Constant17;
int Constant18 = (0);
int IndexZ_SelectResult = Constant18;
IndexZ_SelectResult = Result10;
IndexZ_SelectResult = LinearToIndex_Emitter_SimGridOutput_IndexZ;
float3 Output1;
Output1.x = LinearToIndex_Emitter_SimGridOutput_IndexX;
Output1.y = LinearToIndex_Emitter_SimGridOutput_IndexY;
Output1.z = IndexZ_SelectResult;
float3 Result11 = Result6 + Output1;
float X;
float Y;
float Z;
X = Result11.x;
Y = Result11.y;
Z = Result11.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Result12 = mul(float4(IndexToUnit_Emitter_SimGridOutput_Unit,1.0),Context.MapSpawn.Grid3D_Flip_GridParticles.UnitToWorld).xyz;
float Constant19 = 0;
float4x4 Constant20 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Result13 = NiagaraAll(IndexZ_SelectResult >= Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex);
bool CustomHlsl15F57A17D3C6CD872453D57109EEFC09FB22EC22_Func_Output_ret;
CustomHlsl15F57A17D3C6CD872453D57109EEFC09FB22EC22_Func_(LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, IndexZ_SelectResult, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, CustomHlsl15F57A17D3C6CD872453D57109EEFC09FB22EC22_Func_Output_ret);
bool Result14 = Result13 || CustomHlsl15F57A17D3C6CD872453D57109EEFC09FB22EC22_Func_Output_ret;
float Result15 = Context.MapSpawn.Grid3D_Flip_GridParticles.dx * Constant6;
float3 Constant21 = float3(0,0,0);
float3 Constant22 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult1 = Constant22;
bool Constant23 = (false);
bool NiagaraBool_SelectResult1 = Constant23;
float2 Constant24 = float2(0.0, 0.0);
float2 Vector2D_SelectResult1 = Constant24;
float3 Constant25 = float3(0.0, 0.0, 0.0);
float3 Vector3f001_SelectResult1 = Constant25;
Vector3f_SelectResult1 = Result12;
NiagaraBool_SelectResult1 = Result14;
Vector2D_SelectResult1 = Result15;
Vector3f001_SelectResult1 = Constant21;
Vector3f_SelectResult1 = Context.MapSpawn.Particles.Position;
NiagaraBool_SelectResult1 = Context.MapSpawn.Transient.Kill;
Vector2D_SelectResult1 = Context.MapSpawn.Particles.SpriteSize;
Vector3f001_SelectResult1 = Context.MapSpawn.Particles.Velocity;
Context.MapSpawn.Particles.Position = Vector3f_SelectResult1;
Context.MapSpawn.Transient.Kill = NiagaraBool_SelectResult1;
Context.MapSpawn.Particles.SpriteSize = Vector2D_SelectResult1;
Context.MapSpawn.Particles.Velocity = Vector3f001_SelectResult1;
bool Constant27 = false;
bool bool_IfResult;
bool_IfResult = Constant27;
bool_IfResult = Context.MapSpawn.DataInstance.Alive;
Context.MapSpawn.DataInstance.Alive = bool_IfResult;
float3 Constant30 = float3(0,0,-980);
float3 Result16 = Context.MapUpdate.Transient.PhysicsForce + Constant30;
float3 Result17 = Result16 * Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result18 = Context.MapUpdate.Particles.Velocity + Result17;
Context.MapUpdate.Particles.Velocity = Result18;
   SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0,0,1);
    float Sigma = In_Radius;
    float TwoSigmaSquared = 2. * Sigma * Sigma;
    float Coeff = 1./sqrt(3.141569 * TwoSigmaSquared);
    float Total = 0.0;
    int i;
    for (i = 0; i <= In_Radius; ++i)
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared));
        Total +=  Val;
        // add negative side to total
        if (i > 0)
            Total += Val;
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared)); 
        SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(i, 0, Val/Total);
//SetConstantByStaticVariable "/Grid 3D Create Convolution Kernel/Map Get/Map Get->Module.Smoothing Kernel"
int Constant31 = 0;
CustomHlslD5A9A830D1BCA669EECAFF07FD41F646A6C3FA88Emitter_KernelGrid_Func_(Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius, Context);
float Constant33 = 0;
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Constant33;
float3 Constant35 = float3(0,0,0);
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Constant35;
int Constant41 = 0;
bool Result19 = NiagaraAll(In_SourceSpace == Constant41);
int Constant42 = 0;
bool Result20 = NiagaraAll(In_DestinationSpace == Constant42);
bool Result21 = Result19 && Result20;
int Constant43 = 1;
bool Result22 = NiagaraAll(In_SourceSpace == Constant43);
int Constant44 = 1;
bool Result23 = NiagaraAll(In_DestinationSpace == Constant44);
bool Result24 = Result22 && Result23;
bool Result25 = Result21 || Result24;
int Constant45 = 2;
bool Result26 = NiagaraAll(In_SourceSpace == Constant45);
int Constant46 = 2;
bool Result27 = NiagaraAll(In_DestinationSpace == Constant46);
bool Result28 = Result26 && Result27;
bool Result29 = Result25 || Result28;
bool Result30 = Result19 && Result27;
bool Result31 = Result26 && Result20;
bool Result32 = Result30 || Result31;
bool Result33 = In_bLocalSpace && Result32;
bool Result34 = Result29 || Result33;
bool Result35 = !In_bLocalSpace;
bool Result36 = Result19 && Result23;
bool Result37 = Result22 && Result20;
bool Result38 = Result36 || Result37;
bool Result39 = Result35 && Result38;
bool Result40 = Result34 || Result39;
bool Result41 = In_bLocalSpace && Result36;
bool Result42 = Result26 && Result23;
bool Result43 = Result41 || Result42;
bool Result44 = Result35 && Result31;
bool Result45 = Result43 || Result44;
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result40;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result45;
bool Constant40 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal;
float4x4 TransformBase_Func_Output_OutTransform;
bool TransformBase_Func_Output_LocalToWorld;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant40, TransformBase_Func_Output_bUseOriginal, TransformBase_Func_Output_OutTransform, TransformBase_Func_Output_LocalToWorld, Context);
float3 Result46 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InPosition;
Vector_IfResult = Result46;
Out_OutPosition = Vector_IfResult;
bool Constant50 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal1;
float4x4 TransformBase_Func_Output_OutTransform1;
bool TransformBase_Func_Output_LocalToWorld1;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant50, TransformBase_Func_Output_bUseOriginal1, TransformBase_Func_Output_OutTransform1, TransformBase_Func_Output_LocalToWorld1, Context);
float3 Result48 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result48;
Out_OutVector = Vector_IfResult1;
int XIndexInt = floor(In_Index.x);
int YIndexInt = floor(In_Index.y);
int ZIndexInt = floor(In_Index.z);
float3 GridFraction = In_Index - float3(XIndexInt, YIndexInt, ZIndexInt);
for (int x = 0; x <= 1; ++x) {
    const float GridWeightX = (x == 0) ? 1.0 - GridFraction.x : GridFraction.x;
    for (int y = 0; y <= 1; ++y) {
        const float GridWeightY = (y == 0) ? 1.0 - GridFraction.y : GridFraction.y;
            for (int z = 0; z <= 1; ++z) {
                const float GridWeightZ = (z == 0) ? 1.0 - GridFraction.z : GridFraction.z;
                const float GridWeightXYZ = 1;//GridWeightX*GridWeightY*GridWeightZ;
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 0, GridWeightXYZ*In_Velocity.x, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 1, GridWeightXYZ*In_Velocity.y, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 2, GridWeightXYZ*In_Velocity.z, IGNORE);
                InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 3, GridWeightXYZ, IGNORE);
                SetGridValue_Emitter_TemporaryGrid(XIndexInt+x, YIndexInt+y, ZIndexInt+z, In_BoundaryIndex, 3, IGNORE);
int Constant37 = 0;
int Constant38 = 1;
bool Constant39 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Position, Constant37, Constant38, Constant39, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result47 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(Result47, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant47 = 0;
int Constant48 = 1;
bool Constant49 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Velocity, Constant47, Constant48, Constant49, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result49 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlslAC6AA32E19D571ACCAF1F6D5C21DBA04E251D543Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result49, Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
int Constant51 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant52 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
int Constant53 = 0;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Resample = Constant53;
float3 Constant54 = float3(0,0,0);
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Unit = Constant54;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
Context.MapSimStage5_ComputeBoundary.Transient.SimFloat = Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
float3 Constant56 = float3(0.5,0.5,0.5);
Out_Output = Constant56;
#if ((SimulationStageIndex == 5) || (SimulationStageIndex == 6)) // Multiple stages
Out_Boundary = 0;
  Out_Boundary = In_OpenBoundaryRight ? 2 : 1;
  Out_Boundary = In_OpenBoundaryLeft ? 2 : 1;
  Out_Boundary = In_OpenBoundaryDown ? 2 : 1;
  Out_Boundary = In_OpenBoundaryUp ? 2 : 1;
  Out_Boundary = In_OpenBoundaryBack ? 2 : 1;
  Out_Boundary = In_OpenBoundaryFront ? 2 : 1;
#endif // Multiple stages
Out_BoundaryOut = 0;
Out_VelocityOut = float3(0,0,0);
Out_SignedDistance = 3.402823466e+38;
bool Valid;
for (int CurrIdx = 0; CurrIdx < In_NumParticles; ++CurrIdx)
float3 ParticlePos  = float3(0,0,0);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePosition(CurrIdx, Valid, ParticlePos);
    ParticlePos = mul(float4(ParticlePos, 1.), In_WorldToLocal).xyz;
    float3 ParticleMeshSize = float3(0,0,0);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeScale(CurrIdx, Valid, ParticleMeshSize);
    float4 q = float4(0,0,0,0);
    GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeMeshOrientation(CurrIdx, Valid, q);
    float Dist = length(In_CellPos - ParticlePos);
    float ParticleRadius = ParticleMeshSize.x * .5 * 100. * 2;
    Out_SignedDistance = min(Out_SignedDistance, Dist - ParticleRadius);
    float3 LocalPos = In_CellPos - ParticlePos;
    // invert
    q.w *= -1;
    LocalPos = dot(LocalPos, q.xyz) * 2. * q.xyz + ((q.w * q.w - dot(q.xyz,q.xyz)) * LocalPos) + (cross(q.xyz,LocalPos) * 2.0 * q.w);
    // hack for now since our mesh sphere is 100x100x100
    float3 Radius = ParticleMeshSize * 100 / 2.;
    // signed distance to the ellipsoid
    float ScaledDist = length(LocalPos/Radius);
    float Grad = length(LocalPos/(Radius*Radius));
    Out_SignedDistance = ScaledDist*(ScaledDist-1.0)/Grad;
    if (Out_SignedDistance <= 0)
float3 ParticleVel  = float3(0,0,0);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeVelocity(CurrIdx, Valid, ParticleVel);
        float4 prevq = float4(0,0,0,0);
        GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevMeshOrientation(CurrIdx, Valid, prevq);
    float3 PrevParticlePos  = float3(0,0,0);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevPosition(CurrIdx, Valid, PrevParticlePos);
        float3 PrevLocalPos = dot(LocalPos, prevq.xyz) * 2. * prevq.xyz + ((prevq.w * prevq.w - dot(prevq.xyz,prevq.xyz)) * LocalPos) + (cross(prevq.xyz,LocalPos) * 2.0 * prevq.w);
        PrevLocalPos += PrevParticlePos;
        PrevLocalPos = mul(float4(PrevLocalPos, 1.), In_WorldToLocal).xyz;
        float3 VelFromRot = (In_CellPos - PrevLocalPos) / In_dt;
        ParticleVel = mul(float4(VelFromRot, 0.), In_WorldToLocal).xyz;
        Out_BoundaryOut = 1;
        Out_VelocityOut += ParticleVel * In_VelocityMult;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
const  int RASTERIZED_FLUID_CELL = 3;
Out_RetBoundary = EMPTY_CELL;
  Out_RetBoundary = FLUID_CELL;
  Out_RetBoundary = In_SolidValue;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float3 Output11;
Output11.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output11.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output11.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result50 = Output11 + Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OffsetSamplePosition;
float X1;
float Y1;
float Z1;
X1 = Result50.x;
Y1 = Result50.y;
Z1 = Result50.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit1;
IndexToUnit_Emitter_SimGrid(X1, Y1, Z1, IndexToUnit_Emitter_SimGridOutput_Unit1);
float3 Constant57 = float3(0,0,0);
float3 Output12;
Output12.x = IndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output12.y = IndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output12.z = IndexToUnit_Emitter_SimGridOutput_Unit1.z;
float3 Result51 = mul(float4(Output12,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit1;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Constant57;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos = Result51;
float GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance;
float3 GetClosestPoint_User_Collide_MeshesOutput_ClosestPosition;
float3 GetClosestPoint_User_Collide_MeshesOutput_ClosestNormal;
float3 GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity;
GetClosestPoint_User_Collide_Meshes(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, Context.MapSimStage5_ComputeBoundary.Engine.WorldDeltaTime, Context.MapSimStage5_ComputeBoundary.Engine.System.TimeStepFraction, GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance, GetClosestPoint_User_Collide_MeshesOutput_ClosestPosition, GetClosestPoint_User_Collide_MeshesOutput_ClosestNormal, GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity);
float Constant58 = 0;
bool Result52 = NiagaraAll(GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance <= Constant58);
float Constant59 = 1;
float3 Result53 = GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity * Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale;
float3 Result54 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity + Result53;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
int Constant60 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX1;
int GetNumCells_Emitter_SimGridOutput_NumCellsY1;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ1;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary;
CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant60, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary);
float Constant61 = (0.0);
float NiagaraFloat_SelectResult2 = Constant61;
float3 Constant62 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult2 = Constant62;
NiagaraFloat_SelectResult2 = Constant59;
Vector3f_SelectResult2 = Result54;
NiagaraFloat_SelectResult2 = CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary;
Vector3f_SelectResult2 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Vector3f_SelectResult2;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Local Space Particles"
int Constant63 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Size"
int Constant64 = 1;
float3 Result55 = mul(float4(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.WorldToLocal).xyz;
float3 Output13;
Output13.x = Result55.x;
Output13.y = Result55.y;
Output13.z = Result55.z;
int GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles;
GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReader(GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles);
float CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut;
float3 CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut;
float CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance;
CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_(Output13, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale, GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.WorldToLocal, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.dt, CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut, CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut, CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance);
float3 Result56 = CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut + Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Result56;
float Result57 = max(NiagaraFloat_SelectResult2, CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut);
float CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary;
CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_(Result57, Context.MapSimStage5_ComputeBoundary.Transient.Boundary, CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary);
float Constant65 = 1e+17;
float Result58 = min(GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance, Constant65);
float Result59 = min(CustomHlsl004350BD6023B81C96600244D1ED22256BE1968B260Emitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance, Result58);
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary;
Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance = Result59;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float X2;
float Y2;
float Z2;
X2 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.SolidVelocity.x;
Y2 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.SolidVelocity.y;
Z2 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.SolidVelocity.z;
float4 Output14;
Output14.x = X2;
Output14.y = Y2;
Output14.z = Z2;
Output14.w = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output14);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample To Another Grid"
int Constant66 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant67 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Logic OR (Static)/Logic OR (Static)->Result"
int Constant68 = 0;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Resample = Constant68;
float3 Constant69 = float3(0,0,0);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Unit = Constant69;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat = Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Module.Resample To Another Grid"
int Constant70 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant71 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Logic OR (Static)/Logic OR (Static)->Result"
int Constant72 = 0;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute007.Resample = Constant72;
float3 Constant73 = float3(0,0,0);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute007.Unit = Constant73;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float3 Output15;
Output15.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Output15.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Output15.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Output16;
Output16 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute007.SolidVelocity = Output15;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute007.Boundary = Output16;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute007.SolidVelocity;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary = Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute007.Boundary;
float4 TmpSolidVelocity_Boundary;
Out_AverageSolidVelocity = float3(0,0,0);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY, In_IndexZ, TmpSolidVelocity_Boundary);
Out_AverageSolidVelocity += TmpSolidVelocity_Boundary.xyz;
Out_theta_ppp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY, In_IndexZ-1, TmpSolidVelocity_Boundary);
Out_theta_ppn = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY-1, In_IndexZ-1, TmpSolidVelocity_Boundary);
Out_theta_pnn = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY-1, In_IndexZ, TmpSolidVelocity_Boundary);
Out_theta_pnp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX-1, In_IndexY-1, In_IndexZ, TmpSolidVelocity_Boundary);
Out_theta_nnp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX-1, In_IndexY, In_IndexZ, TmpSolidVelocity_Boundary);
Out_theta_npp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX-1, In_IndexY, In_IndexZ-1, TmpSolidVelocity_Boundary);
Out_theta_npn = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX-1, In_IndexY-1, In_IndexZ-1, TmpSolidVelocity_Boundary);
Out_theta_nnn = TmpSolidVelocity_Boundary.w;
Out_AverageSolidVelocity /= 8.0;
float Theta_Center = .25 * (In_A+In_B+In_C+In_D);
Out_Tri0 = float3(In_A,In_B,Theta_Center);
Out_Tri1 = float3(In_B,In_C,Theta_Center);
Out_Tri2 = float3(In_C,In_D,Theta_Center);
Out_Tri3 = float3(In_D,In_A,Theta_Center);
Out_AreaFraction = 0;
// sort theta values in current triangle
float3 SortedTheta;
SortedTheta.x = min(min(In_theta.x, In_theta.y), In_theta.z);
SortedTheta.z = max(max(In_theta.x, In_theta.y), In_theta.z);
SortedTheta.y = In_theta.x+In_theta.y+In_theta.z - SortedTheta.x-SortedTheta.z;
    Out_AreaFraction = 0;
    Out_AreaFraction = 1;
    Out_AreaFraction = SortedTheta.z/(SortedTheta.z-SortedTheta.x);
    Out_AreaFraction *= SortedTheta.z/(SortedTheta.z-SortedTheta.y);
    Out_AreaFraction = 1. - Out_AreaFraction;
    Out_AreaFraction = SortedTheta.x/(SortedTheta.x-SortedTheta.y);
    Out_AreaFraction *= SortedTheta.x/(SortedTheta.x-SortedTheta.z);
    Out_AreaFraction = Out_AreaFraction;
float CustomHlslF7896E8302019A2109B3480BCA89BE7700735867_Func_Output_AreaFraction;
CustomHlslF7896E8302019A2109B3480BCA89BE7700735867_Func_(In_INPUT_VAR, CustomHlslF7896E8302019A2109B3480BCA89BE7700735867_Func_Output_AreaFraction);
Out_AreaFraction = CustomHlslF7896E8302019A2109B3480BCA89BE7700735867_Func_Output_AreaFraction;
Out_Avg = .25 * (In_A+In_B+In_C+In_D);
float3 CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri0;
float3 CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri1;
float3 CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri2;
float3 CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri3;
CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_(In_ppp, In_ppn, In_pnn, In_pnp, CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri0, CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri1, CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri2, CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri3);
float ComputeAreaFraction_Func_Output_AreaFraction;
ComputeAreaFraction_Func_(CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri0, ComputeAreaFraction_Func_Output_AreaFraction, Context);
float ComputeAreaFraction_Func_Output_AreaFraction1;
ComputeAreaFraction_Func_(CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri1, ComputeAreaFraction_Func_Output_AreaFraction1, Context);
float ComputeAreaFraction_Func_Output_AreaFraction2;
ComputeAreaFraction_Func_(CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri2, ComputeAreaFraction_Func_Output_AreaFraction2, Context);
float ComputeAreaFraction_Func_Output_AreaFraction3;
ComputeAreaFraction_Func_(CustomHlsl9B36CEFB3399EA1F01A55E75FF2540B232CA272C_Func_Output_Tri3, ComputeAreaFraction_Func_Output_AreaFraction3, Context);
float CustomHlslA44BBB265F0C85C41C0B2022D17AAB9EB3B95101_Func_Output_Avg;
CustomHlslA44BBB265F0C85C41C0B2022D17AAB9EB3B95101_Func_(ComputeAreaFraction_Func_Output_AreaFraction, ComputeAreaFraction_Func_Output_AreaFraction1, ComputeAreaFraction_Func_Output_AreaFraction2, ComputeAreaFraction_Func_Output_AreaFraction3, CustomHlslA44BBB265F0C85C41C0B2022D17AAB9EB3B95101_Func_Output_Avg);
float3 CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri0;
float3 CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri1;
float3 CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri2;
float3 CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri3;
CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_(In_ppp, In_ppn, In_npp, In_npn, CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri0, CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri1, CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri2, CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri3);
float ComputeAreaFraction_Func_Output_AreaFraction4;
ComputeAreaFraction_Func_(CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri0, ComputeAreaFraction_Func_Output_AreaFraction4, Context);
float ComputeAreaFraction_Func_Output_AreaFraction5;
ComputeAreaFraction_Func_(CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri1, ComputeAreaFraction_Func_Output_AreaFraction5, Context);
float ComputeAreaFraction_Func_Output_AreaFraction6;
ComputeAreaFraction_Func_(CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri2, ComputeAreaFraction_Func_Output_AreaFraction6, Context);
float ComputeAreaFraction_Func_Output_AreaFraction7;
ComputeAreaFraction_Func_(CustomHlslDEA03FF1C23808386AD8B2077720C47772FD8D5C_Func_Output_Tri3, ComputeAreaFraction_Func_Output_AreaFraction7, Context);
float CustomHlslAA55C57AA779F1FEBC42024B4E5A83C6DFC37A3C_Func_Output_Avg;
CustomHlslAA55C57AA779F1FEBC42024B4E5A83C6DFC37A3C_Func_(ComputeAreaFraction_Func_Output_AreaFraction4, ComputeAreaFraction_Func_Output_AreaFraction5, ComputeAreaFraction_Func_Output_AreaFraction6, ComputeAreaFraction_Func_Output_AreaFraction7, CustomHlslAA55C57AA779F1FEBC42024B4E5A83C6DFC37A3C_Func_Output_Avg);
float3 CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri0;
float3 CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri1;
float3 CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri2;
float3 CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri3;
CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_(In_ppp, In_pnp, In_nnp, In_npp, CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri0, CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri1, CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri2, CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri3);
float ComputeAreaFraction_Func_Output_AreaFraction8;
ComputeAreaFraction_Func_(CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri0, ComputeAreaFraction_Func_Output_AreaFraction8, Context);
float ComputeAreaFraction_Func_Output_AreaFraction9;
ComputeAreaFraction_Func_(CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri1, ComputeAreaFraction_Func_Output_AreaFraction9, Context);
float ComputeAreaFraction_Func_Output_AreaFraction10;
ComputeAreaFraction_Func_(CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri2, ComputeAreaFraction_Func_Output_AreaFraction10, Context);
float ComputeAreaFraction_Func_Output_AreaFraction11;
ComputeAreaFraction_Func_(CustomHlsl76CB494C24A678878F43207A089FB53E7B7EB098_Func_Output_Tri3, ComputeAreaFraction_Func_Output_AreaFraction11, Context);
float CustomHlsl162B8FBDA44E74CF2A6B1F20F61E119BE51BB43E_Func_Output_Avg;
CustomHlsl162B8FBDA44E74CF2A6B1F20F61E119BE51BB43E_Func_(ComputeAreaFraction_Func_Output_AreaFraction8, ComputeAreaFraction_Func_Output_AreaFraction9, ComputeAreaFraction_Func_Output_AreaFraction10, ComputeAreaFraction_Func_Output_AreaFraction11, CustomHlsl162B8FBDA44E74CF2A6B1F20F61E119BE51BB43E_Func_Output_Avg);
float3 Output18;
Output18.x = CustomHlslA44BBB265F0C85C41C0B2022D17AAB9EB3B95101_Func_Output_Avg;
Output18.y = CustomHlslAA55C57AA779F1FEBC42024B4E5A83C6DFC37A3C_Func_Output_Avg;
Output18.z = CustomHlsl162B8FBDA44E74CF2A6B1F20F61E119BE51BB43E_Func_Output_Avg;
Out_FaceFractions = Output18;
    In_theta_ppp < 1e-20 && 
    In_theta_ppn < 1e-20 && 
    In_theta_pnn < 1e-20 && 
    In_theta_pnp < 1e-20 && 
    In_theta_nnp < 1e-20 && 
    In_theta_npp < 1e-20 && 
    In_theta_npn < 1e-20 && 
    In_theta_nnn < 1e-20;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2);
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnn;
float3 CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_AverageSolidVelocity;
CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, In_dt, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_AverageSolidVelocity);
float3 ComputeFaceFractions_Func_Output_FaceFractions;
ComputeFaceFractions_Func_(CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn, ComputeFaceFractions_Func_Output_FaceFractions, Context);
float X3;
float Y3;
float Z3;
X3 = ComputeFaceFractions_Func_Output_FaceFractions.x;
Y3 = ComputeFaceFractions_Func_Output_FaceFractions.y;
Z3 = ComputeFaceFractions_Func_Output_FaceFractions.z;
bool CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_Output_IsFullyInsideBoundary;
CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_(CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_Output_IsFullyInsideBoundary);
Out_XFace = X3;
Out_YFace = Y3;
Out_ZFace = Z3;
Out_IsFullyInsideBoundary = CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_Output_IsFullyInsideBoundary;
Out_SolidVelocity = CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_AverageSolidVelocity;
Out_FaceFraction.x = In_Face.x > 1e-20 ? max(In_Face.x, In_MinFaceFraction) : 0;
Out_FaceFraction.y = In_Face.y > 1e-20 ? max(In_Face.y, In_MinFaceFraction) : 0;
Out_FaceFraction.z = In_Face.z > 1e-20 ? max(In_Face.z, In_MinFaceFraction) : 0;
Out_FaceFraction = saturate(Out_FaceFraction);
float Constant76 = 0;
float3 ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
ExecutionIndexToUnit_Emitter_TransientGrid(ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit);
float3 Constant77 = float3(0,0,0);
float3 Output17;
Output17.x = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.x;
Output17.y = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.y;
Output17.z = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.z;
float3 Result60 = mul(float4(Output17,1.0),Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld).xyz;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.UnitPosition = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Constant77;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.WorldPos = Result60;
float Constant78 = 0;
float Constant79 = 0.1;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
bool Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary;
float3 Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(Constant78, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity, Context);
float3 Output19;
Output19.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output19.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output19.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
float3 CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_Output_FaceFraction;
CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_(Output19, Constant79, CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_Output_FaceFraction);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction = CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_Output_FaceFraction;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
float Constant80 = 1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3);
int Constant81 = 2;
int GetNumCells_Emitter_TransientGridOutput_NumCellsX;
int GetNumCells_Emitter_TransientGridOutput_NumCellsY;
int GetNumCells_Emitter_TransientGridOutput_NumCellsZ;
GetNumCells_Emitter_TransientGrid(GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ);
float CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary1;
CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3, Constant81, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary1);
float Constant82 = (0.0);
float NiagaraFloat_SelectResult3 = Constant82;
NiagaraFloat_SelectResult3 = Constant80;
NiagaraFloat_SelectResult3 = CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary1;
float CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary1;
CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_(NiagaraFloat_SelectResult3, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat, CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary = CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4);
float X4;
float Y4;
float Z4;
X4 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.x;
Y4 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.y;
Z4 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.z;
float4 Output110;
Output110.x = X4;
Output110.y = Y4;
Output110.z = Z4;
Output110.w = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4, Output110);
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_FaceGrid(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ);
SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.ScratchModule_02.FaceVals);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample To Another Grid"
int Constant83 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant84 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Logic OR (Static)/Logic OR (Static)->Result"
int Constant85 = 0;
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Resample = Constant85;
float3 Constant86 = float3(0,0,0);
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Unit = Constant86;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY5;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ5;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ5);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ5, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1);
float3 Output111;
Output111.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.x;
Output111.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.y;
Output111.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.z;
float Output112;
Output112 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.w;
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity = Output111;
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary = Output112;
Context.MapSimStage7_ExtrapolateVelocity.Transient.SolidVelocity = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity;
Context.MapSimStage7_ExtrapolateVelocity.Transient.Boundary = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
Context.MapSimStage7_ExtrapolateVelocity.Transient.Boundary = Context.MapSimStage7_ExtrapolateVelocity.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary;
GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX, In_IndexY, In_IndexZ, 0, Out_OutVelocity.x);
GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX, In_IndexY, In_IndexZ, 1, Out_OutVelocity.y);
GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX, In_IndexY, In_IndexZ, 2, Out_OutVelocity.z);
float TmpWeight;
GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX, In_IndexY, In_IndexZ, 3, TmpWeight);
    Out_OutVelocity /= TmpWeight;
    Out_OutVelocity = float3(0,0,0);
int CellType = round(In_Boundary);
float TotalWeight = 0;
// if we have a boundary cell, then gather value from closest neighbor cell
    for (int xx = -In_ExtrapolationHalfWidth; xx <= In_ExtrapolationHalfWidth; ++xx)  {
    for (int yy = -In_ExtrapolationHalfWidth; yy <= In_ExtrapolationHalfWidth; ++yy)  {        
    for (int zz = -In_ExtrapolationHalfWidth; zz <= In_ExtrapolationHalfWidth; ++zz)  { 
        const int TmpIndexX = In_IndexX + xx;
        const int TmpIndexY = In_IndexY + yy;
        const int TmpIndexZ = In_IndexZ + zz;
        float4 TmpV;
        GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(TmpIndexX, TmpIndexY, TmpIndexZ, TmpV);
        int TmpCellType = round(TmpV.a);
        // only extrapolate from fluid cells
        // don't extrapolate from the boundary of the domain to allow particles to pass through as ballistic when they leave
        if (TmpCellType == FLUID_CELL)
            float Weight = 1./length2(float3(xx,yy,zz));
            float3 TmpVelocity;
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 0, TmpVelocity.x);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 1, TmpVelocity.y);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 2, TmpVelocity.z);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 3, TmpWeight);
            if (TmpWeight > 1e-5)
                TmpVelocity /= TmpWeight;
                Out_OutVelocity += TmpVelocity * Weight;
                TotalWeight  += Weight;
                TmpVelocity = float3(0,0,0);
    if (TotalWeight > 1e-5)
        Out_OutVelocity /= TotalWeight;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ);
int Constant88 = 1;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant88, Context.MapSimStage7_ExtrapolateVelocity.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid.Velocity = Context.MapSimStage7_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ);
SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ, Context.MapSimStage7_ExtrapolateVelocity.Grid3D_SetFluidAttribute001.StartVelocity);
float Vx_right;
GetGridValue_Emitter_SimGrid(In_IndexX+1, In_IndexY, In_IndexZ, In_VectorIndex, Vx_right);
float Vx_left;
GetGridValue_Emitter_SimGrid(In_IndexX-1, In_IndexY, In_IndexZ, In_VectorIndex, Vx_left);
float Vy_up;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY+1, In_IndexZ, In_VectorIndex+1, Vy_up);
float Vy_down;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY-1, In_IndexZ, In_VectorIndex+1, Vy_down);
float Vz_front;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY, In_IndexZ+1, In_VectorIndex+2, Vz_front);
float Vz_back;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY, In_IndexZ-1, In_VectorIndex+2, Vz_back);
Out_Div = (Vx_right - Vx_left + Vy_up - Vy_down + Vz_front - Vz_back) / (2. * In_dx);
Out_Div = 0.0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2);
float CustomHlslB2C1C42F933D291AF1EFD33F67D0CA2952A466C4Emitter_SimGrid_Func_Output_Div;
CustomHlslB2C1C42F933D291AF1EFD33F67D0CA2952A466C4Emitter_SimGrid_Func_(Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex, CustomHlslB2C1C42F933D291AF1EFD33F67D0CA2952A466C4Emitter_SimGrid_Func_Output_Div);
Context.MapSimStage8_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlslB2C1C42F933D291AF1EFD33F67D0CA2952A466C4Emitter_SimGrid_Func_Output_Div;
float Constant90 = 0;
Context.MapSimStage8_ComputeDivergence.Emitter.PressureGrid.Pressure = Constant90;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample To Another Grid"
int Constant91 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant92 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Logic OR (Static)/Logic OR (Static)->Result"
int Constant93 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Resample = Constant93;
float3 Constant94 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Unit = Constant94;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
Context.MapSimStage9_SolvePressure.Transient.SimFloat = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample To Another Grid"
int Constant95 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant96 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Logic OR (Static)/Logic OR (Static)->Result"
int Constant97 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Resample = Constant97;
float3 Constant98 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Unit = Constant98;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
Context.MapSimStage9_SolvePressure.Transient.Velocity = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
Out_IterationIndex = SimulationStage_GetIterationIndex();
Out_MaxIterations = SimulationStage_GetNumIterations();
Out_NormalizedIterationIndex = SimulationStage_GetNormalizedIterationIndex();
Out_LoopIndex = SimulationStage_GetLoopIndex();
Out_NumberOfLoops = SimulationStage_GetNumLoops();
Out_NormalizedLoopIndex = SimulationStage_GetNormalizedLoopIndex();
Out_IterationIndex = 0;
Out_MaxIterations = 0;
Out_NormalizedIterationIndex = 0.0f;
Out_LoopIndex = 0;
Out_NumberOfLoops = 0;
Out_NormalizedLoopIndex = 0.0f;
int CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_IterationIndex;
int CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_MaxIterations;
float CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NormalizedIterationIndex;
int CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_LoopIndex;
int CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NumberOfLoops;
float CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NormalizedLoopIndex;
CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_(CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_IterationIndex, CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_MaxIterations, CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NormalizedIterationIndex, CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_LoopIndex, CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NumberOfLoops, CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NormalizedLoopIndex);
Out_IterationIndex = CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_IterationIndex;
Out_MaxIterations = CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_MaxIterations;
Out_NormalizedIterationIndex = CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NormalizedIterationIndex;
Out_LoopIndex = CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_LoopIndex;
Out_NumberOfLoops = CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_Output_NormalizedLoopIndex;
Out_OutFloat = saturate (In_InFloat);
float CustomHlsl9F14A6AE80252C6E7EEC2CBCB99F6AFCD412BDBF_Func_Output_OutFloat;
CustomHlsl9F14A6AE80252C6E7EEC2CBCB99F6AFCD412BDBF_Func_(In_Value, CustomHlsl9F14A6AE80252C6E7EEC2CBCB99F6AFCD412BDBF_Func_Output_OutFloat);
Out_ClampedValue = CustomHlsl9F14A6AE80252C6E7EEC2CBCB99F6AFCD412BDBF_Func_Output_OutFloat;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
const int FLUID_CELL = 0;
const int SOLID_CELL = 1;
const int EMPTY_CELL = 2;
float3 TmpFraction;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(In_IndexX, In_IndexY, In_IndexZ, TmpFraction);
Out_F_right = TmpFraction.x;
Out_F_up = TmpFraction.y;
Out_F_front = TmpFraction.z;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(In_IndexX-1, In_IndexY, In_IndexZ, TmpFraction);
Out_F_left = TmpFraction.x;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(In_IndexX, In_IndexY-1, In_IndexZ, TmpFraction);
Out_F_down = TmpFraction.y;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(In_IndexX, In_IndexY, In_IndexZ - 1, TmpFraction);
Out_F_back = TmpFraction.z;
Out_F_right = round(In_B_right.w) == SOLID_CELL ? 1 : Out_F_right;
Out_F_left = round(In_B_left.w) == SOLID_CELL ? 1 : Out_F_left;
Out_F_up = round(In_B_up.w) == SOLID_CELL ? 1 : Out_F_up;
Out_F_down = round(In_B_down.w) == SOLID_CELL ? 1 : Out_F_down;
Out_F_front = round(In_B_front.w) == SOLID_CELL ? 1 : Out_F_front;
Out_F_back = round(In_B_back.w) == SOLID_CELL ? 1 : Out_F_back;
Out_Pressure = 0;
float4 B_center;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY, In_IndexZ, B_center);
int CellType = round(B_center.w);
float P_right;
float P_left;
float P_up;
float P_down;
float P_front;
float P_back;
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX+1, In_IndexY, In_IndexZ, P_right);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX-1, In_IndexY, In_IndexZ, P_left);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX, In_IndexY+1, In_IndexZ, P_up);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX, In_IndexY-1, In_IndexZ, P_down);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX, In_IndexY, In_IndexZ+1, P_front);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX, In_IndexY, In_IndexZ-1, P_back);
float Scale = In_dx / In_dt;
float FluidCellCount = 6.0;
float BoundaryAdd = 0.0;
float Weight;
    // same as regular jacobi
    Weight = 1;
    int SliceParity = (In_IndexZ + In_IterationIndex) % 2;
    int RowParity = (In_IndexY + SliceParity+1) % 2;
    int CellParity = (In_IndexX + RowParity ) % 2;
    // will do red-black SOR
    // add 1 since we want to expose a 0-1 parameter
    Weight = CellParity * min(1.93, In_Relaxation + 1);
int CellType_right = round(In_B_right.w);
   P_right = 0;
    FluidCellCount -= lerp(0, 1, In_F_right);
    BoundaryAdd += lerp(0, Scale * (In_Velocity.x - In_B_right.x), In_F_right);
    P_right = lerp(P_right, 0, In_F_right);
int CellType_left = round(In_B_left.w);
   P_left = 0;
    FluidCellCount -= lerp(0, 1, In_F_left);
    BoundaryAdd -= lerp(0, Scale * (In_Velocity.x - In_B_left.x), In_F_left);
    P_left = lerp(P_left, 0, In_F_left);
int CellType_up = round(In_B_up.w);
   P_up = 0;
    FluidCellCount -= lerp(0, 1, In_F_up);
    BoundaryAdd += lerp(0, Scale * (In_Velocity.y - In_B_up.y), In_F_up);
    P_up = lerp(P_up, 0, In_F_up);
int CellType_down = round(In_B_down.w);
   P_down = 0;
    FluidCellCount -= lerp(0, 1, In_F_down);
    BoundaryAdd -= lerp(0, Scale * (In_Velocity.y - In_B_down.y), In_F_down);
    P_down = lerp(P_down, 0, In_F_down);
int CellType_front = round(In_B_front.w);
   P_front = 0;
    FluidCellCount -= lerp(0, 1, In_F_front);
    BoundaryAdd += lerp(0, Scale * (In_Velocity.z - In_B_front.z), In_F_front);
    P_front = lerp(P_front, 0, In_F_front);
int CellType_back = round(In_B_back.w);
   P_back = 0;
    FluidCellCount -= lerp(0, 1, In_F_back);
    BoundaryAdd -= lerp(0, Scale * (In_Velocity.z - In_B_back.z), In_F_back);
    P_back = lerp(P_back, 0, In_F_back);
    float JacobiPressure = (P_right + P_left + P_up + P_down + P_front + P_back -  In_dx * In_dx * In_Divergence / In_dt + BoundaryAdd) / FluidCellCount;
    Out_Pressure = (1.f - Weight) * In_P_center + Weight * JacobiPressure;
//SetConstantByStaticVariable "/Grid 3D Pressure Iteration/Map Get/Map Get->Module.Use High Precision Collisions"
int Constant99 = 1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4);
int SimulationStageIterationInfo_Func_Output_IterationIndex;
int SimulationStageIterationInfo_Func_Output_MaxIterations;
float SimulationStageIterationInfo_Func_Output_NormalizedIterationIndex;
int SimulationStageIterationInfo_Func_Output_LoopIndex;
int SimulationStageIterationInfo_Func_Output_NumberOfLoops;
float SimulationStageIterationInfo_Func_Output_NormalizedLoopIndex;
SimulationStageIterationInfo_Func_(SimulationStageIterationInfo_Func_Output_IterationIndex, SimulationStageIterationInfo_Func_Output_MaxIterations, SimulationStageIterationInfo_Func_Output_NormalizedIterationIndex, SimulationStageIterationInfo_Func_Output_LoopIndex, SimulationStageIterationInfo_Func_Output_NumberOfLoops, SimulationStageIterationInfo_Func_Output_NormalizedLoopIndex, Context);
float SaturateFloat_Particle_Func_Output_ClampedValue;
SaturateFloat_Particle_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Relaxation, SaturateFloat_Particle_Func_Output_ClampedValue, Context);
float4 CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_back;
CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_right, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_left, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_up, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_down, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_front, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_back);
float CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_right;
float CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_left;
float CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_up;
float CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_down;
float CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_front;
float CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_back;
CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_right, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_left, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_up, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_down, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_front, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_back, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_right, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_left, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_up, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_down, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_front, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_back);
float CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence, SimulationStageIterationInfo_Func_Output_IterationIndex, SaturateFloat_Particle_Func_Output_ClampedValue, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_right, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_left, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_up, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_down, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_front, CustomHlsl6C0FCE6270C0B604E6C0D5C354061BCD9CEF836AEmitter_FaceGrid_Func_Output_F_back, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_right, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_left, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_up, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_down, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_front, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_back, CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure = Context.MapSimStage9_SolvePressure.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure;
GetGridValue_Emitter_PressureGrid(In_IndexX+1, In_IndexY, In_IndexZ, In_ScalarIndex, S_right);
GetGridValue_Emitter_PressureGrid(In_IndexX-1, In_IndexY, In_IndexZ, In_ScalarIndex, S_left);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY+1, In_IndexZ, In_ScalarIndex, S_up);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY-1, In_IndexZ, In_ScalarIndex, S_down);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY, In_IndexZ+1, In_ScalarIndex, S_front);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY, In_IndexZ-1, In_ScalarIndex, S_back);
Out_Grad = float3(S_right - S_left, S_up - S_down, S_front - S_back) / (2.0 * In_dx);
Out_Grad = float3(0.0, 0.0, 0.0);
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ);
float3 CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_PressureGrid_Func_Output_Grad;
CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_PressureGrid_Func_(Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex, CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_PressureGrid_Func_Output_Grad);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_PressureGrid_Func_Output_Grad;
Out_VelocityOut = In_Velocity;
Out_VelocityOut.x = lerp(Out_VelocityOut.x, In_B_left.x, In_F_left);
Out_VelocityOut.x = lerp(Out_VelocityOut.x, In_B_right.x, In_F_right);
int CellType_up  = round(In_B_up.w);
int CellType_down  = round(In_B_down.w);
Out_VelocityOut.y = lerp(Out_VelocityOut.y, In_B_down.y, In_F_down);
Out_VelocityOut.y = lerp(Out_VelocityOut.y, In_B_up.y, In_F_up);
int CellType_front  = round(In_B_front.w);
int CellType_back  = round(In_B_back.w);
Out_VelocityOut.z = lerp(Out_VelocityOut.z, In_B_front.z, In_F_front);
Out_VelocityOut.z = lerp(Out_VelocityOut.z, In_B_back.z, In_F_back);
    Out_VelocityOut = B_center.xyz;
//SetConstantByStaticVariable "/Grid 3D Project Pressure/Map Get/Map Get->Module.Use High Precision Collisions"
int Constant100 = 1;
float3 Result61 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient * Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt;
float3 Result62 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity - Result61;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5);
float4 CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_back;
CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_back);
float CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_right;
float CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_left;
float CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_up;
float CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_down;
float CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_front;
float CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_back;
CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_back, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_right, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_left, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_up, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_down, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_front, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_back);
float3 CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_Output_VelocityOut;
CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_(Result62, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_right, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_left, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_up, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_down, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_front, CustomHlslA969ABA94EC2DF5F54E25D82E29BE4EBA46BFB3CEmitter_FaceGrid_Func_Output_F_back, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_back, CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_Output_VelocityOut);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_Output_VelocityOut;
Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage10_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample To Another Grid"
int Constant101 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant102 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Logic OR (Static)/Logic OR (Static)->Result"
int Constant103 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Resample = Constant103;
float3 Constant104 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Unit = Constant104;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX6;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY6;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ6;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ6);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ6, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2);
float3 Output113;
Output113.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.x;
Output113.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.y;
Output113.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.z;
float Output114;
Output114 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.w;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity = Output113;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary = Output114;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.SolidVelocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample To Another Grid"
int Constant105 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant106 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Logic OR (Static)/Logic OR (Static)->Result"
int Constant107 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Resample = Constant107;
float3 Constant108 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Unit = Constant108;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity;
Out_OutVelocity = In_Velocity;
            GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);
            Out_OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7);
int Constant110 = 1;
int GetNumCells_Emitter_SimGridOutput_NumCellsX2;
int GetNumCells_Emitter_SimGridOutput_NumCellsY2;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ2;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX2, GetNumCells_Emitter_SimGridOutput_NumCellsY2, GetNumCells_Emitter_SimGridOutput_NumCellsZ2);
float3 CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7, Constant110, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX2, GetNumCells_Emitter_SimGridOutput_NumCellsY2, GetNumCells_Emitter_SimGridOutput_NumCellsZ2, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
int Constant116 = 0;
bool Result63 = NiagaraAll(In_SourceSpace == Constant116);
int Constant117 = 0;
bool Result64 = NiagaraAll(In_DestinationSpace == Constant117);
bool Result65 = Result63 && Result64;
int Constant118 = 1;
bool Result66 = NiagaraAll(In_SourceSpace == Constant118);
int Constant119 = 1;
bool Result67 = NiagaraAll(In_DestinationSpace == Constant119);
bool Result68 = Result66 && Result67;
bool Result69 = Result65 || Result68;
int Constant120 = 2;
bool Result70 = NiagaraAll(In_SourceSpace == Constant120);
int Constant121 = 2;
bool Result71 = NiagaraAll(In_DestinationSpace == Constant121);
bool Result72 = Result70 && Result71;
bool Result73 = Result69 || Result72;
bool Result74 = Result63 && Result71;
bool Result75 = Result70 && Result64;
bool Result76 = Result74 || Result75;
bool Result77 = In_bLocalSpace && Result76;
bool Result78 = Result73 || Result77;
bool Result79 = !In_bLocalSpace;
bool Result80 = Result63 && Result67;
bool Result81 = Result66 && Result64;
bool Result82 = Result80 || Result81;
bool Result83 = Result79 && Result82;
bool Result84 = Result78 || Result83;
bool Result85 = In_bLocalSpace && Result80;
bool Result86 = Result70 && Result67;
bool Result87 = Result85 || Result86;
bool Result88 = Result79 && Result75;
bool Result89 = Result87 || Result88;
float4x4 Matrix_IfResult4;
Matrix_IfResult4 = In_LocalToWorldTransform;
Matrix_IfResult4 = In_WorldToLocalTransform;
Out_bUseOriginal = Result84;
Out_OutTransform = Matrix_IfResult4;
Out_LocalToWorld = Result89;
bool Constant115 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal2;
float4x4 TransformBase_Func_Output_OutTransform2;
bool TransformBase_Func_Output_LocalToWorld2;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant115, TransformBase_Func_Output_bUseOriginal2, TransformBase_Func_Output_OutTransform2, TransformBase_Func_Output_LocalToWorld2, Context);
float3 Result90 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InPosition;
Vector_IfResult2 = Result90;
Out_OutPosition = Vector_IfResult2;
Out_IsInside = round(In_Mask) ==2;
  In_UnitPos.z >= 0 && In_UnitPos.x <= 1 && 
In_UnitPos.y <= 1 && In_UnitPos.z <= 1;
Out_IsInside = In_Mask > 1e-7;
Out_IsInside = round(In_Mask) == 1;
bool Constant126 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult3;
Matrix_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal3;
float4x4 TransformBase_Func_Output_OutTransform3;
bool TransformBase_Func_Output_LocalToWorld3;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult3, Constant126, TransformBase_Func_Output_bUseOriginal3, TransformBase_Func_Output_OutTransform3, TransformBase_Func_Output_LocalToWorld3, Context);
float3 Result101 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InPosition;
Vector_IfResult3 = Result101;
Out_OutPosition = Vector_IfResult3;
bool Constant130 = false;
float4x4 Matrix_IfResult6;
float4x4 Matrix001_IfResult4;
Matrix_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal4;
float4x4 TransformBase_Func_Output_OutTransform4;
bool TransformBase_Func_Output_LocalToWorld4;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult4, Constant130, TransformBase_Func_Output_bUseOriginal4, TransformBase_Func_Output_OutTransform4, TransformBase_Func_Output_LocalToWorld4, Context);
float3 Result104 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InVector;
Vector_IfResult4 = Result104;
Out_OutVector = Vector_IfResult4;
bool Constant134 = false;
float4x4 Matrix_IfResult7;
float4x4 Matrix001_IfResult5;
Matrix_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal5;
float4x4 TransformBase_Func_Output_OutTransform5;
bool TransformBase_Func_Output_LocalToWorld5;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult7, Matrix001_IfResult5, Constant134, TransformBase_Func_Output_bUseOriginal5, TransformBase_Func_Output_OutTransform5, TransformBase_Func_Output_LocalToWorld5, Context);
float3 Result107 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InVector;
Vector_IfResult5 = Result107;
Out_OutVector = Vector_IfResult5;
int Constant112 = 0;
int Constant113 = 1;
bool Constant114 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Position, Constant112, Constant113, Constant114, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Output115;
Output115.x = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.x;
Output115.y = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.y;
Output115.z = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.z;
float3 Result91 = mul(float4(((float3)Output115),1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TransientGridOutput_Index;
UnitToFloatIndex_Emitter_TransientGrid(Result91, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result92 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float X5;
float Y5;
float Z5;
X5 = Result92.x;
Y5 = Result92.y;
Z5 = Result92.z;
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value3;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(X5, Y5, Z5, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value3);
float X6;
float Y6;
float Z6;
float W;
X6 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value3.x;
Y6 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value3.y;
Z6 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value3.z;
W = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value3.w;
bool CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_Output_IsInside;
CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_(W, CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_Output_IsInside);
float3 Result93 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_Output_ret;
CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_(Result93, CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_Output_ret);
bool CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside;
CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_(CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_Output_ret, CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside);
bool Result94 = !CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside;
bool Result95 = CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_Output_IsInside || Result94;
float3 Result96 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result97 = Context.MapSimStage12_FLIP_PICforce.Particles.Position + Result96;
bool CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_Output_IsInside;
CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_(W, CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_Output_IsInside);
float3 Constant122 = float3(0,0,0);
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(Result93, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result98 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result99 = Result98 * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result100 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result99;
int Constant123 = 1;
int Constant124 = 0;
bool Constant125 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result100, Constant123, Constant124, Constant125, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
float3 SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(Result93, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result102 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result103 = Result98 - Result102;
int Constant127 = 0;
int Constant128 = 1;
bool Constant129 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Velocity, Constant127, Constant128, Constant129, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result105 = Result103 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result106 = lerp(Result98,Result105,Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant131 = 1;
int Constant132 = 0;
bool Constant133 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result106, Constant131, Constant132, Constant133, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Constant135 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult4 = Constant135;
float3 Constant136 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult4 = Constant136;
Position_SelectResult4 = Context.MapSimStage12_FLIP_PICforce.Particles.Position;
Velocity_SelectResult4 = Constant122;
Position_SelectResult4 = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Velocity_SelectResult4 = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
float3 Constant137 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult5 = Constant137;
float3 Constant138 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult5 = Constant138;
Position_SelectResult5 = Result97;
Velocity_SelectResult5 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity;
Position_SelectResult5 = Position_SelectResult4;
Velocity_SelectResult5 = Velocity_SelectResult4;
Context.MapSimStage12_FLIP_PICforce.Particles.Position = Position_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity = Velocity_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_Output_IsInside;
bool Constant140 = false;
bool bool_IfResult1;
bool_IfResult1 = Constant140;
bool_IfResult1 = Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = bool_IfResult1;
int Constant154 = 0;
bool Result109 = NiagaraAll(In_SourceSpace == Constant154);
int Constant155 = 0;
bool Result110 = NiagaraAll(In_DestinationSpace == Constant155);
bool Result111 = Result109 && Result110;
int Constant156 = 1;
bool Result112 = NiagaraAll(In_SourceSpace == Constant156);
int Constant157 = 1;
bool Result113 = NiagaraAll(In_DestinationSpace == Constant157);
bool Result114 = Result112 && Result113;
bool Result115 = Result111 || Result114;
int Constant158 = 2;
bool Result116 = NiagaraAll(In_SourceSpace == Constant158);
int Constant159 = 2;
bool Result117 = NiagaraAll(In_DestinationSpace == Constant159);
bool Result118 = Result116 && Result117;
bool Result119 = Result115 || Result118;
bool Result120 = Result109 && Result117;
bool Result121 = Result116 && Result110;
bool Result122 = Result120 || Result121;
bool Result123 = In_bLocalSpace && Result122;
bool Result124 = Result119 || Result123;
bool Result125 = !In_bLocalSpace;
bool Result126 = Result109 && Result113;
bool Result127 = Result112 && Result110;
bool Result128 = Result126 || Result127;
bool Result129 = Result125 && Result128;
bool Result130 = Result124 || Result129;
bool Result131 = In_bLocalSpace && Result126;
bool Result132 = Result116 && Result113;
bool Result133 = Result131 || Result132;
bool Result134 = Result125 && Result121;
bool Result135 = Result133 || Result134;
float4x4 Matrix_IfResult8;
Matrix_IfResult8 = In_LocalToWorldTransform;
Matrix_IfResult8 = In_WorldToLocalTransform;
Out_bUseOriginal = Result130;
Out_OutTransform = Matrix_IfResult8;
Out_LocalToWorld = Result135;
float4x4 Constant151 = (float4x4)0;
float4x4 LocalToWorld_SelectResult6 = Constant151;
float4x4 Constant152 = (float4x4)0;
float4x4 WorldToLocal_SelectResult6 = Constant152;
LocalToWorld_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant153 = false;
bool TransformBase_Func_Output_bUseOriginal6;
float4x4 TransformBase_Func_Output_OutTransform6;
bool TransformBase_Func_Output_LocalToWorld6;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult6, WorldToLocal_SelectResult6, Constant153, TransformBase_Func_Output_bUseOriginal6, TransformBase_Func_Output_OutTransform6, TransformBase_Func_Output_LocalToWorld6, Context);
float3 Result136 = mul(float4(In_Position,1.0),TransformBase_Func_Output_OutTransform6).xyz;
float3 Constant160 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult7 = Constant160;
NiagaraPosition_SelectResult7 = In_Position;
NiagaraPosition_SelectResult7 = Result136;
Out_Position = NiagaraPosition_SelectResult7;
int IGNORE;
// we never want a radius smaller than half of the cell size otherwise
// we can't rasterize an sdf
float Radius = max(In_SpriteSize.x * .5 * In_RadiusMult, In_dx * .5);
float IndexRadius = Radius / In_dx;
int size = ceil(IndexRadius) + In_HalfBandwidth;
int IndexX = round(In_Index.x);
int IndexY = round(In_Index.y);
int IndexZ = round(In_Index.z);
for (int xx = -size; xx <= size; ++xx) {
for (int yy = -size;  yy <= size; ++yy) {
for (int zz = -size; zz <= size; ++zz) {
    int3 CurrIndex = int3(IndexX+xx,IndexY+yy,IndexZ+zz);
    float IndexDist = length(In_Index - CurrIndex) - IndexRadius;
   if (abs(IndexDist) <= In_HalfBandwidth &&
        CurrIndex.x >= 0 && CurrIndex.x < In_NumCellsX &&
        CurrIndex.y >= 0 && CurrIndex.y < In_NumCellsY &&
        CurrIndex.z >= 0 && CurrIndex.z < In_NumCellsZ)
        InterlockedMinFloatGridValue_Emitter_RasterizationGrid(CurrIndex.x, CurrIndex.y, CurrIndex.z, 0, IndexDist * In_dx, IGNORE);
//SetConstantByStaticVariable "/Rasterization Grid Particle Source/Map Get/Map Get->Module.UseNDC"
int Constant142 = 0;
int Result108 = ExecIndex();
bool GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(Result108, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
int Constant143 = 2;
int Constant144 = 1;
bool Constant145 = false;
float4x4 Constant146 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant147 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant148 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant149 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant150 = false;
float3 TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position;
TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant143, Constant144, Constant145, Constant146, Constant147, Constant148, Constant149, TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant161 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult8 = Constant161;
NiagaraPosition_SelectResult8 = TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult8 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
float3 Result137 = mul(float4(NiagaraPosition_SelectResult8,1.0),Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
float3 Output116;
Output116.x = Result137.x;
Output116.y = Result137.y;
Output116.z = Result137.z;
bool GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid;
float2 GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(Result108, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 UnitToFloatIndex_Emitter_RasterizationGridOutput_Index;
UnitToFloatIndex_Emitter_RasterizationGrid(Output116, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlsl1F121CE02C1427DEA34B35005FC46D826DAEF815Emitter_RasterizationGrid_Func_(Output116, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
Out_ConvolvedValue = 0;
int3 CurrCell = int3(In_IndexX, In_IndexY, In_IndexZ);
int3 MaxCells = int3(In_NumCellsX, In_NumCellsY, In_NumCellsZ)  - 1;
for (int uu = -In_Radius; uu <= In_Radius; ++uu) {
  int3 SampleVec = uu * In_ConvAxis;
  int3 CurrIndex = clamp(CurrCell + SampleVec, int3(0,0,0), MaxCells);
  GetFloatGridValue_Emitter_RasterizationGrid(CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
  float KernelValue;
  GetPreviousFloatValue_Emitter_KernelGrid_Attributek(abs(uu), 0, KernelValue);
  Out_ConvolvedValue += Sample * KernelValue;
int Constant163 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 001/Map Get/Map Get->Module.Axis"
int Constant164 = 0;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX, GetNumCells_Emitter_KernelGridOutput_NumCellsY);
int Constant165 = 1;
int Result138 = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant165;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1);
float3 Constant166 = float3(1,0,0);
float CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_(Result138, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1, Constant166, Constant163, CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage14_SmoothinX.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
#if ((SimulationStageIndex == 15) || (SimulationStageIndex == 16)) // Multiple stages
  GetPreviousFloatValueAtIndex_Emitter_SDFGrid(CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
int Constant168 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis/Map Get/Map Get->Module.Axis"
int Constant169 = 1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY1;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX1, GetNumCells_Emitter_KernelGridOutput_NumCellsY1);
int Constant170 = 1;
int Result139 = GetNumCells_Emitter_KernelGridOutput_NumCellsX1 - Constant170;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant171 = float3(0,1,0);
float CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_(Result139, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant171, Constant168, CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage15_SmoothinY.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
int Constant173 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 002/Map Get/Map Get->Module.Axis"
int Constant174 = 2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY2;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX2, GetNumCells_Emitter_KernelGridOutput_NumCellsY2);
int Constant175 = 1;
int Result140 = GetNumCells_Emitter_KernelGridOutput_NumCellsX2 - Constant175;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ1;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1);
float3 Constant176 = float3(0,0,1);
float CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_(Result140, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1, GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1, Constant176, Constant173, CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1);
Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_FaceGrid(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ1);
float3 GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ1, GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value);
float Result141 = length(GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value);
float Constant177 = 0;
bool Result142 = NiagaraAll(Result141 > Constant177);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value4;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ1, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value4);
float X7;
float Y7;
float Z7;
float W1;
X7 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value4.x;
Y7 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value4.y;
Z7 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value4.z;
W1 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value4.w;
float Result143 = round(W1);
int Constant178 = 0;
bool Result144 = NiagaraAll(((int)Result143) == Constant178);
bool Result145 = Result142 && Result144;
float Output117;
Output117 = Result145;
Context.MapSimStage16_SmoothinZandOutput.Transient.Len = Output117;
Context.MapSimStage16_SmoothinZandOutput.Emitter.SDFGrid.SDF = Context.MapSimStage16_SmoothinZandOutput.SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2.Emitter.SDFGrid.SDF;
float Constant182 = 0;
float Constant183 = 0;
float Constant184 = 0;
float4 Output118;
Output118.r = Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red;
Output118.g = Constant182;
Output118.b = Constant183;
Output118.a = Constant184;
Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value = Output118;
bool Constant185 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int Constant186 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant185, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value);
GetGridValue_Emitter_SDFGrid(In_IndexX+1, In_IndexY, In_IndexZ, In_ScalarIndex, S_right);
GetGridValue_Emitter_SDFGrid(In_IndexX-1, In_IndexY, In_IndexZ, In_ScalarIndex, S_left);
GetGridValue_Emitter_SDFGrid(In_IndexX, In_IndexY+1, In_IndexZ, In_ScalarIndex, S_up);
GetGridValue_Emitter_SDFGrid(In_IndexX, In_IndexY-1, In_IndexZ, In_ScalarIndex, S_down);
GetGridValue_Emitter_SDFGrid(In_IndexX, In_IndexY, In_IndexZ+1, In_ScalarIndex, S_front);
GetGridValue_Emitter_SDFGrid(In_IndexX, In_IndexY, In_IndexZ-1, In_ScalarIndex, S_back);
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ2);
int Constant188 = 0;
float3 CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_Output_Grad;
CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_(Context.MapSimStage17_Output.Grid3D_ComputeGradient001.dx, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ2, Constant188, CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_Output_Grad);
Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad = CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_Output_Grad;
float X8;
float Y8;
float Z8;
X8 = In_VECTOR_VAR.x;
Y8 = In_VECTOR_VAR.y;
Z8 = In_VECTOR_VAR.z;
float Constant192 = (0.0);
float NiagaraFloat_SelectResult9 = Constant192;
NiagaraFloat_SelectResult9 = X8;
NiagaraFloat_SelectResult9 = Y8;
NiagaraFloat_SelectResult9 = Z8;
Out_Float = NiagaraFloat_SelectResult9;
float SelectV3Channel_Particle_Func_Output_Float;
SelectV3Channel_Particle_Func_(Context.MapSimStage17_Output.MakeFloatFromVector.VECTOR_VAR, Context.MapSimStage17_Output.MakeFloatFromVector.Channel, SelectV3Channel_Particle_Func_Output_Float, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float;
float SelectV3Channel_Particle_Func_Output_Float1;
SelectV3Channel_Particle_Func_(Context.MapSimStage17_Output.MakeFloatFromVector001.VECTOR_VAR, Context.MapSimStage17_Output.MakeFloatFromVector001.Channel, SelectV3Channel_Particle_Func_Output_Float1, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float1;
float SelectV3Channel_Particle_Func_Output_Float2;
SelectV3Channel_Particle_Func_(Context.MapSimStage17_Output.MakeFloatFromVector002.VECTOR_VAR, Context.MapSimStage17_Output.MakeFloatFromVector002.Channel, SelectV3Channel_Particle_Func_Output_Float2, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float2;
float4 Output119;
Output119.r = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Red;
Output119.g = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Green;
Output119.b = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Blue;
Output119.a = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Alpha;
Context.MapSimStage17_Output.Local.Grid3D_SetRTValues001.Value = Output119;
bool Constant193 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues 001/Map Get/Map Get->Module.UseIterationGrid"
int Constant194 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX1;
int ExecToIndex_Emitter_SimRTOutput_IndexY1;
int ExecToIndex_Emitter_SimRTOutput_IndexZ1;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX1, ExecToIndex_Emitter_SimRTOutput_IndexY1, ExecToIndex_Emitter_SimRTOutput_IndexZ1);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant193, ExecToIndex_Emitter_SimRTOutput_IndexX1, ExecToIndex_Emitter_SimRTOutput_IndexY1, ExecToIndex_Emitter_SimRTOutput_IndexZ1, Context.MapSimStage17_Output.Local.Grid3D_SetRTValues001.Value);
    uint3(0,0,1),
    uint3(1,0,1),
    uint3(1,0,0),
    uint3(0,0,0),
    uint3(0,1,1),
    uint3(1,1,1),
    uint3(1,1,0),
    uint3(0,1,0),
const uint3 CubeIndex = GDispatchThreadId;
bool bSuccess;
float CornerWeights[8];
float3 CornerPositions[8];
int CubeType = 0;
int i = 0;
bool AllInside = true;
for (i = 0; i < 8; ++i)
    uint3 CornerIndex = CubeIndex + CornerOffsets[i];
    CornerIndex = clamp(CornerIndex, uint3(0,0,0), uint3(In_NumVerticesX-1, In_NumVerticesY-1, In_NumVerticesZ-1));
float4 Weight;
GetRenderTargetValue_Emitter_SimRT(CornerIndex.x, CornerIndex.y, CornerIndex.z, Weight);
CornerWeights[i] = Weight.x;
    CornerPositions[i] = (float3(CornerIndex) + .5) / float3(In_NumVerticesX, In_NumVerticesY, In_NumVerticesZ);
    CornerPositions[i] = mul(float4(CornerPositions[i], 1.0), In_UnitToWorld).xyz;
    CubeType |= CornerWeights[i] < In_IsoValue ? 1l << i : 0l;
for (i = 0; TriToEdges[CubeType][i] != -1; i += 3)
const int2 Edge0 = Edges[TriToEdges[CubeType][i + 0]];
const int2 Edge1 = Edges[TriToEdges[CubeType][i + 1]];
const int2 Edge2 = Edges[TriToEdges[CubeType][i + 2]];
float3 TriangleVerts[3];
TriangleVerts[0] = LERP_EDGE(CornerPositions[Edge0.x], CornerWeights[Edge0.x], CornerPositions[Edge0.y], CornerWeights[Edge0.y]);
TriangleVerts[1] = LERP_EDGE(CornerPositions[Edge1.x], CornerWeights[Edge1.x], CornerPositions[Edge1.y], CornerWeights[Edge1.y]);
TriangleVerts[2] = LERP_EDGE(CornerPositions[Edge2.x], CornerWeights[Edge2.x], CornerPositions[Edge2.y], CornerWeights[Edge2.y]);
float3 TangentX, TangentY, TangentZ;
    float4 TmpV;
    float3 TriCenter = (1./3) * (TriangleVerts[0] + TriangleVerts[1] + TriangleVerts[2]);
    float3 TriCenterUnit = mul(float4(TriCenter, 1.0), In_WorldToUnit).xyz;
    SampleRenderTargetValue_Emitter_SimRT(TriCenterUnit, 0, TmpV);
    TangentZ = normalize(TmpV.yzw);
float3 UnitDx = 1./float3(In_NumVerticesX,In_NumVerticesY,In_NumVerticesZ);
SampleRenderTargetValue_Emitter_SimRT(TriCenterUnit + float3(1,0,0) * UnitDx, 0, TmpV);
float S_right = TmpV.x;
SampleRenderTargetValue_Emitter_SimRT(TriCenterUnit - float3(1,0,0) * UnitDx, 0, TmpV);
float S_left = TmpV.x;
SampleRenderTargetValue_Emitter_SimRT(TriCenterUnit + float3(0,1,0) * UnitDx, 0, TmpV);
float S_up = TmpV.x;
SampleRenderTargetValue_Emitter_SimRT(TriCenterUnit - float3(0,1,0) * UnitDx, 0, TmpV);
float S_down = TmpV.x;
SampleRenderTargetValue_Emitter_SimRT(TriCenterUnit + float3(0,0,1) * UnitDx, 0, TmpV);
float S_front = TmpV.x;
SampleRenderTargetValue_Emitter_SimRT(TriCenterUnit - float3(0,0,1) * UnitDx, 0, TmpV);
float S_back = TmpV.x;
//TangentZ = normalize(float3(S_right - S_left, S_up - S_down, S_front - S_back));
TangentX = normalize(TriangleVerts[2] - TriangleVerts[0]);
TangentY = normalize(TriangleVerts[1] - TriangleVerts[0]);
//TangentZ = cross(TangentX, TangentY);
TangentY = cross(TangentZ, TangentX);
    float3 Tri0Unit = mul(float4(TriangleVerts[0], 1.0), In_WorldToUnit).xyz;
    SampleRenderTargetValue_Emitter_SimRT(Tri0Unit, 0, TmpV);
    float3 TangentZ0 = normalize(TmpV.yzw);
    float3 TangentX0 = cross(TangentZ0, TangentX);
    float3 TangentY0 = cross(TangentZ0, TangentX0);
    float3 Tri1Unit = mul(float4(TriangleVerts[1], 1.0), In_WorldToUnit).xyz;
    SampleRenderTargetValue_Emitter_SimRT(Tri1Unit, 0, TmpV);
    float3 TangentZ1 = normalize(TmpV.yzw);
    float3 TangentX1 = cross(TangentZ1, TangentX);
    float3 TangentY1 = cross(TangentZ1, TangentX1);
    float3 Tri2Unit = mul(float4(TriangleVerts[2], 1.0), In_WorldToUnit).xyz;
    SampleRenderTargetValue_Emitter_SimRT(Tri2Unit, 0, TmpV);
    float3 TangentZ2 = normalize(TmpV.yzw);
    float3 TangentX2 = cross(TangentZ2, TangentX);
    float3 TangentY2 = cross(TangentZ2, TangentX2);
int TriangleIndex;
#endif //GPU_SIMULATION
float Constant196 = 0.001;
int GetRenderTargetSize_Emitter_SimRTOutput_Width;
int GetRenderTargetSize_Emitter_SimRTOutput_Height;
int GetRenderTargetSize_Emitter_SimRTOutput_Depth;
GetRenderTargetSize_Emitter_SimRT(GetRenderTargetSize_Emitter_SimRTOutput_Width, GetRenderTargetSize_Emitter_SimRTOutput_Height, GetRenderTargetSize_Emitter_SimRTOutput_Depth);
CustomHlslD01B102F45DBB09196AE4A4C3EC9E430AF7674E0Emitter_GeneratedMeshEmitter_SimRT_Func_(Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.CellSize, Context.MapSimStage18_GenerateMesh.Engine.Owner.Position, Constant196, GetRenderTargetSize_Emitter_SimRTOutput_Width, GetRenderTargetSize_Emitter_SimRTOutput_Height, GetRenderTargetSize_Emitter_SimRTOutput_Depth, Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.UnitToWorld, Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.WorldToUnit, Context);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
//Begin Spawn Script!
//Begin Initialize Parameter Map Defaults
float2 Constant = float2(50,50);
Context.MapSpawn.Particles.SpriteSize = Constant;
float3 Constant1 = float3(0,0,0);
Context.MapSpawn.Particles.Velocity = Constant1;
//End Initialize Parameter Map Defaults
Context.MapSpawn.Grid3D_Flip_GridParticles.dx = Context.MapSpawn.Emitter.dx;
Context.MapSpawn.Grid3D_Flip_GridParticles.UnitToWorld = Context.MapSpawn.Emitter.UnitToWorld;
Context.MapSpawn.Grid3D_Flip_GridParticles.SpawnedThisFrame = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame;
Context.MapSpawn.Grid3D_Flip_GridParticles.ParticlesPerCell = Context.MapSpawn.Emitter.OVERRIDE.ParticlesPerCell;
Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex;
Context.MapSpawn.Grid3D_Flip_GridParticles.TotalEmissionCells = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells;
float Constant2 = 1;
float3 Constant3 = float3(0,0,0);
Context.MapSpawn.Particles.Position = Constant3;
bool Constant4 = false;
Context.MapSpawn.Transient.Kill = Constant4;
float Constant5 = 1;
EnterStatScope(1 /**Grid3D_Flip_GridParticles_Emitter_Func_*/);
Grid3D_Flip_GridParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Flip_GridParticles_Emitter_Func_*/);
Context.MapSpawn.KillParticles001.KillParticles = Context.MapSpawn.Transient.Kill;
bool Constant26 = true;
Context.MapSpawn.DataInstance.Alive = Constant26;
EnterStatScope(2 /**KillParticles001_Emitter_Func_*/);
KillParticles001_Emitter_Func_(Context);
ExitStatScope(/**KillParticles001_Emitter_Func_*/);
//End Spawn Script!
//Handle resetting previous values at the end of spawn so that they match outputs! (Needed for motion blur/etc)
HandlePreviousValuesForSpawn(Context);
// Begin HandleMissingDefaultValues
// End HandleMissingDefaultValues
//Begin Update Script!
RandomCounterDeterministic = 0;
Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt = Context.MapUpdate.Emitter.DeltaTime;
float3 Constant28 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant28;
float3 Constant29 = float3(0,0,-980);
EnterStatScope(3 /**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
//End Update Script!
//Begin Stage Script: MapSimStage1_BuildKernelArray!
Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius = Context.MapSimStage1_BuildKernelArray.Emitter.Grid3D_InitializeConvolutionKernel.Radius;
EnterStatScope(4 /**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
Grid3D_CreateConvolutionKernel_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage1_BuildKernelArray
//Begin Stage Script: MapSimStage2_InitTemporaryGrid!
float Constant32 = 0;
EnterStatScope(5 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage2_InitTemporaryGrid
//Begin Stage Script: MapSimStage3_InitializeStartVelocityGrid!
float3 Constant34 = float3(0,0,0);
EnterStatScope(6 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage3_InitializeStartVelocityGrid
//Begin Stage Script: MapSimStage4_RasterizeParticles!
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToUnit;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToLocal;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_SimFloatIndex;
bool Constant36 = false;
EnterStatScope(7 /**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Grid3D_FLIP_RasterizeParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage4_RasterizeParticles
//Begin Stage Script: MapSimStage5_ComputeBoundary!
EnterStatScope(8 /**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Grid3D_GetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.SimFloat;
EnterStatScope(9 /**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use High Precision Collisions"
int Constant55 = 1;
Context.MapSimStage5_ComputeBoundary.ScratchDynamicInput_01.UseHighPrecision = Constant55;
float3 ScratchDynamicInput_01_Emitter_Func_Output_Output;
ScratchDynamicInput_01_Emitter_Func_(ScratchDynamicInput_01_Emitter_Func_Output_Output, Context);
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld = Context.MapSimStage5_ComputeBoundary.Emitter.UnitToWorld;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.dt = Context.MapSimStage5_ComputeBoundary.Emitter.DeltaTime;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.WorldToLocal = Context.MapSimStage5_ComputeBoundary.Emitter.WorldToLocal;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.CollisionVelocityMult;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OffsetSamplePosition = ScratchDynamicInput_01_Emitter_Func_Output_Output;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
EnterStatScope(10 /**Grid3D_ComputeBoundary_Emitter_Func_*/);
Grid3D_ComputeBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeBoundary_Emitter_Func_*/);
EnterStatScope(11 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Grid3D_SetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
EnterStatScope(12 /**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
Grid3D_SetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage5_ComputeBoundary
//Begin Stage Script: MapSimStage6_ComputeBoundaryHighPrecision2!
EnterStatScope(13 /**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Grid3D_GetFluidAttribute006_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
EnterStatScope(14 /**Grid3D_GetFluidAttribute007_Emitter_Func_*/);
Grid3D_GetFluidAttribute007_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute007_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.UnitToWorld;
float Constant74 = 0;
float Constant75 = 0.1;
EnterStatScope(15 /**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.Boundary = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity;
EnterStatScope(16 /**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Grid3D_SetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.ScratchModule_02.FaceVals = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction;
EnterStatScope(17 /**ScratchModule_02_Emitter_Func_*/);
ScratchModule_02_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_02_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage6_ComputeBoundaryHighPrecision2
//Begin Stage Script: MapSimStage7_ExtrapolateVelocity!
EnterStatScope(18 /**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Grid3D_GetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
EnterStatScope(19 /**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex = Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_SimFloatIndex;
int Constant87 = 1;
EnterStatScope(20 /**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(21 /**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_SetFluidAttribute001.StartVelocity = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(22 /**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
Grid3D_SetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage7_ExtrapolateVelocity
//Begin Stage Script: MapSimStage8_ComputeDivergence!
Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.dx = Context.MapSimStage8_ComputeDivergence.Emitter.dx;
Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex = Context.MapSimStage8_ComputeDivergence.Emitter.SimGrid_VelocityIndex;
EnterStatScope(23 /**Grid3D_ComputeDivergence_Emitter_Func_*/);
Grid3D_ComputeDivergence_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeDivergence_Emitter_Func_*/);
float Constant89 = 0;
EnterStatScope(24 /**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
Context.MapSimStage8_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat = Context.MapSimStage8_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div;
EnterStatScope(25 /**Grid3D_SetFluidAttribute_Emitter_Func_*/);
Grid3D_SetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage8_ComputeDivergence
//Begin Stage Script: MapSimStage9_SolvePressure!
EnterStatScope(26 /**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
Grid3D_GetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(27 /**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Grid3D_GetFluidAttribute005_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx = Context.MapSimStage9_SolvePressure.Emitter.dx;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt = Context.MapSimStage9_SolvePressure.Emitter.DeltaTime;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure = Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Relaxation = Context.MapSimStage9_SolvePressure.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation;
EnterStatScope(28 /**Grid3D_PressureIteration_Emitter_Func_*/);
Grid3D_PressureIteration_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_PressureIteration_Emitter_Func_*/);
Context.MapSimStage9_SolvePressure.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure;
EnterStatScope(29 /**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage9_SolvePressure
//Begin Stage Script: MapSimStage10_ProjectPressure!
Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.dx = Context.MapSimStage10_ProjectPressure.Emitter.dx;
Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex = Context.MapSimStage10_ProjectPressure.Emitter.SimGrid_PressureIndex;
EnterStatScope(30 /**Grid3D_ComputeGradient_Emitter_Func_*/);
Grid3D_ComputeGradient_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeGradient_Emitter_Func_*/);
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient = Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt = Context.MapSimStage10_ProjectPressure.Emitter.DeltaTime;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity = Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity;
EnterStatScope(31 /**Grid3D_ProjectPressure_Emitter_Func_*/);
Grid3D_ProjectPressure_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ProjectPressure_Emitter_Func_*/);
Context.MapSimStage10_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity = Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity;
EnterStatScope(32 /**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage10_ProjectPressure
//Begin Stage Script: MapSimStage11_ExtrapolateVelocitiesAgain!
EnterStatScope(33 /**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
Grid3D_GetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
EnterStatScope(34 /**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Grid3D_GetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
EnterStatScope(35 /**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
EnterStatScope(36 /**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Grid3D_Visualize_VectorField_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_BoundaryIndex;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_VelocityIndex;
int Constant109 = 1;
EnterStatScope(37 /**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity;
EnterStatScope(38 /**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage11_ExtrapolateVelocitiesAgain
//Begin Stage Script: MapSimStage12_FLIP_PICforce!
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.MapSimStage12_FLIP_PICforce.Emitter.LocalToWorld;
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.MapSimStage12_FLIP_PICforce.Emitter.WorldToUnit;
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip = Context.MapSimStage12_FLIP_PICforce.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio;
bool Constant111 = false;
EnterStatScope(39 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.MapSimStage12_FLIP_PICforce.KillParticles.KillParticles = Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant139 = true;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = Constant139;
EnterStatScope(40 /**KillParticles_Emitter_Func_*/);
KillParticles_Emitter_Func_(Context);
ExitStatScope(/**KillParticles_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage12_FLIP_PICforce
//Begin Stage Script: MapSimStage13_FillRasterizationGrid!
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.dx;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit = Context.MapSimStage13_FillRasterizationGrid.Emitter.WorldToUnit;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult = Context.MapSimStage13_FillRasterizationGrid.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult;
bool Constant141 = false;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant141;
EnterStatScope(41 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
RasterizationGrid_ParticleSource_Emitter_Func_(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_FillRasterizationGrid
//Begin Stage Script: MapSimStage14_SmoothinX!
int Constant162 = 0;
EnterStatScope(42 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Grid3D_ConvolveAxis001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(43 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_SmoothinX
//Begin Stage Script: MapSimStage15_SmoothinY!
int Constant167 = 0;
EnterStatScope(44 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Grid3D_ConvolveAxis_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(45 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage15_SmoothinY
//Begin Stage Script: MapSimStage16_SmoothinZandOutput!
int Constant172 = 0;
EnterStatScope(46 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Grid3D_ConvolveAxis002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func_*/);
EnterStatScope(47 /**ScratchModule_03_Emitter_Func_*/);
ScratchModule_03_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_03_Emitter_Func_*/);
Context.MapSimStage16_SmoothinZandOutput.SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2.Emitter.SDFGrid.SDF = Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
EnterStatScope(48 /**SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_Func_*/);
SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_Func_*/);
Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red = Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
float Constant179 = 0;
float Constant180 = 0;
float Constant181 = 0;
EnterStatScope(49 /**Grid3D_SetRTValues_Emitter_Func_*/);
Grid3D_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage16_SmoothinZandOutput
//Begin Stage Script: MapSimStage17_Output!
Context.MapSimStage17_Output.Grid3D_ComputeGradient001.dx = Context.MapSimStage17_Output.Emitter.SDF_dx;
int Constant187 = 0;
EnterStatScope(50 /**Grid3D_ComputeGradient001_Emitter_Func_*/);
Grid3D_ComputeGradient001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeGradient001_Emitter_Func_*/);
int Constant189 = 1;
int Constant190 = 2;
Context.MapSimStage17_Output.MakeFloatFromVector001.Channel = Constant189;
Context.MapSimStage17_Output.MakeFloatFromVector002.Channel = Constant190;
Context.MapSimStage17_Output.MakeFloatFromVector.VECTOR_VAR = Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad;
Context.MapSimStage17_Output.MakeFloatFromVector001.VECTOR_VAR = Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad;
Context.MapSimStage17_Output.MakeFloatFromVector002.VECTOR_VAR = Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad;
int Constant191 = 0;
Context.MapSimStage17_Output.MakeFloatFromVector.Channel = Constant191;
float MakeFloatFromVector_Emitter_Func_Output_Float;
MakeFloatFromVector_Emitter_Func_(MakeFloatFromVector_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector001_Emitter_Func_Output_Float;
MakeFloatFromVector001_Emitter_Func_(MakeFloatFromVector001_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector002_Emitter_Func_Output_Float;
MakeFloatFromVector002_Emitter_Func_(MakeFloatFromVector002_Emitter_Func_Output_Float, Context);
Context.MapSimStage17_Output.Grid3D_SetRTValues001.Red = Context.MapSimStage17_Output.Emitter.SDFGrid.SDF;
Context.MapSimStage17_Output.Grid3D_SetRTValues001.Green = MakeFloatFromVector_Emitter_Func_Output_Float;
Context.MapSimStage17_Output.Grid3D_SetRTValues001.Blue = MakeFloatFromVector001_Emitter_Func_Output_Float;
Context.MapSimStage17_Output.Grid3D_SetRTValues001.Alpha = MakeFloatFromVector002_Emitter_Func_Output_Float;
EnterStatScope(51 /**Grid3D_SetRTValues001_Emitter_Func_*/);
Grid3D_SetRTValues001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage17_Output
//Begin Stage Script: MapSimStage18_GenerateMesh!
Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.CellSize = Context.MapSimStage18_GenerateMesh.Emitter.SDF_dx;
Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.UnitToWorld = Context.MapSimStage18_GenerateMesh.Emitter.UnitToWorld;
Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.WorldToUnit = Context.MapSimStage18_GenerateMesh.Emitter.WorldToUnit;
float Constant195 = 0.001;
EnterStatScope(52 /**Grid3D_GenerateMeshFromDistanceField_Emitter_Func_*/);
Grid3D_GenerateMeshFromDistanceField_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GenerateMeshFromDistanceField_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage18_GenerateMesh
int3 Emitter_SimGrid_NumCells;
float3 Emitter_SimGrid_UnitToUV;
float3 Emitter_SimGrid_CellSize;
float3 Emitter_SimGrid_WorldBBoxSize;
Texture3D<float3> Emitter_SimGrid_Grid;
RWTexture3D<float3> Emitter_SimGrid_OutputGrid;
int3 Emitter_SimGrid_NumTiles;
float3 Emitter_SimGrid_OneOverNumTiles;
float3 Emitter_SimGrid_UnitClampMin;
float3 Emitter_SimGrid_UnitClampMax;
SamplerState Emitter_SimGrid_GridSampler;
int4 Emitter_SimGrid_AttributeIndices[2];
Buffer<float4> Emitter_SimGrid_PerAttributeData;
int Emitter_SimGrid_NumAttributes;
int Emitter_SimGrid_NumNamedAttributes;
// Copyright Epic Games, Inc. All Rights Reserved.
int3 TotalDim = Emitter_SimGrid_NumCells * Emitter_SimGrid_NumTiles;
float3 GridPos = float3(TotalDim[0] * UVW[0] - 0.5,  TotalDim[1] * UVW[1] - 0.5, TotalDim[2] * UVW[2] - 0.5f);
int3 GridCell = floor(GridPos);
float3 delta = float3( GridPos[0] - GridCell[0], GridPos[1] - GridCell[1], GridPos[2] - GridCell[2]);
// local values
float4 F; 
// bottom face
F[0] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
// bottom value
float BV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// top face
F[0] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
// top value
float TV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// interp between bottom and top
return TV * delta.z + BV * (1.-delta.z);
// identify the lower-left-hand corner of the cell
int3 LocalCell = GridCell % Emitter_SimGrid_NumCells;
const int3 MaxCell = Emitter_SimGrid_NumCells - int3(2,2,2);
// revert to trilinear hardware sampling at the boundary cells.
return Emitter_SimGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
// sample point offset from lower left
float t = 1. + delta.x;
float u = 1. + delta.y;
float v = 1. + delta.z;
float4x3 DataInZ;
float3 minv = 3.402823466e+38;
float3 maxv = -3.402823466e+38;
for (int zk = 0; zk < 4; zk++)
int plane = GridCell[2] + zk -1;
float4x3  DataInY;
for (int yj = 0; yj < 4; yj++)
float4x3 DataInX;
int row = GridCell[1] + yj - 1;
for(int xi = 0; xi < 4; xi++)
int col = GridCell[0] + xi - 1;
DataInX[xi] = Emitter_SimGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
minv = min(DataInX[xi], minv);
maxv = max(DataInX[xi], maxv);
// coefficients
float3 Cx0 =   6.f * DataInX[0];
float3 Cx1 = -11.f * DataInX[0] + 18.f * DataInX[1] - 9.f * DataInX[2] + 2.f * DataInX[3];
float3 Cx2 =   6.f * DataInX[0] - 15.f * DataInX[1] +12.f * DataInX[2] - 3.f * DataInX[3];
float3 Cx3 =        -DataInX[0] +  3.f * DataInX[1] - 3.f * DataInX[2] +       DataInX[3];
DataInY[yj] = (1.f/6.f) * (Cx0 + t * ( Cx1 +  t * ( Cx2 + t * Cx3 ) ));
float3 Cy0 =   6.f * DataInY[0];
float3 Cy1 = -11.f * DataInY[0] + 18.f * DataInY[1] - 9.f * DataInY[2] + 2.f * DataInY[3];
float3 Cy2 =   6.f * DataInY[0] - 15.f * DataInY[1] +12.f * DataInY[2] - 3.f * DataInY[3];
float3 Cy3 =        -DataInY[0] +  3.f * DataInY[1] - 3.f * DataInY[2] +       DataInY[3];
DataInZ[zk] = (1.f/6.f) * (Cy0 + u * ( Cy1 +  u * ( Cy2 + u * Cy3 ) ));
float3 Cz0 =   6.f * DataInZ[0];
float3 Cz1 = -11.f * DataInZ[0] + 18.f * DataInZ[1] - 9.f * DataInZ[2] + 2.f * DataInZ[3];
float3 Cz2 =   6.f * DataInZ[0] - 15.f * DataInZ[1] +12.f * DataInZ[2] - 3.f * DataInZ[3];
float3 Cz3 =        -DataInZ[0] +  3.f * DataInZ[1] - 3.f * DataInZ[2] +       DataInZ[3];
float3 TriCubicValue = (1.f/6.f) * (Cz0 + v * ( Cz1 +  v * ( Cz2 + v * Cz3 ) ));
// for the fluid sims, a nice look can be achieved with BlendAmount = 0.25f;
// float BlendAmount = 0.0f;
// return lerp(TriCubicValue, TriLinearValue, BlendAmount);
return  min(max(TriCubicValue, minv), maxv);
int2 Emitter_KernelGrid_NumCells;
float2 Emitter_KernelGrid_UnitToUV;
float2 Emitter_KernelGrid_CellSize;
float2 Emitter_KernelGrid_WorldBBoxSize;
Texture2DArray<float> Emitter_KernelGrid_Grid;
RWTexture2DArray<float> Emitter_KernelGrid_OutputGrid;
SamplerState Emitter_KernelGrid_GridSampler;
int4 Emitter_KernelGrid_AttributeIndices[1];
int Emitter_KernelGrid_NumAttributes;
// cubic interpolation between values.
// note f0 = function at t=0
//      f1 = function at t=1
float d0 = .5 * (f1 - fm1);
float d1 = .5 * (f2 - f0);
float delta0 = f1 - f0;
d0 = 0;
d1 = 0;
float a0 = f0;
float a1 = d0;
float a2 = 3.0f*delta0 - 2.0f * d0 - d1;
float a3 = d0 + d1 - 2 * delta0;
return a3 * t*t*t + a2 * t*t + a1 * t + a0;
return f0;
float a1 = -1./3 * fm1 - 1./2* f0 + f1 - 1./6 * f2;
float a2 = 1./2 * fm1 - f0 + 1./2 * f1;
float a3 = -1./6 * fm1 + 1./2 * f0 - 1./2 * f1 + 1./6 * f2;
const int AttributeIndex = round(UVW[2]);
const float2 GridPos = UVW.xy * Emitter_KernelGrid_NumCells.xy - .5;
const int2 GridCell = floor(GridPos);
const int2 MaxCell = Emitter_KernelGrid_NumCells - int2(3,3);
// revert to bilinear hardware sampling at the boundary cells.
return Emitter_KernelGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float2 t = frac(GridPos);
float4 GridVals;
float minv = 3.402823466e+38;
float maxv = -3.402823466e+38;
float4 InterpInX;
for (int j = 0; j < 4; ++j)
for (int i = 0; i < 4; ++i)
const float CurrValue = Emitter_KernelGrid_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
GridVals[i] = CurrValue;
minv = min(CurrValue, minv);
maxv = max(CurrValue, maxv);
InterpInX[j] = Basic1DCubic_Emitter_KernelGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_KernelGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return BiCubicValue;
const int2 MaxCell = Emitter_KernelGrid_NumCells - int2(2,2);
const float2 t = GridPos - GridCell;
InterpInX[j] = Monotonic1DCubic_Emitter_KernelGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Monotonic1DCubic_Emitter_KernelGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return Basic2DCubic_Emitter_KernelGrid(Sampler, UVW, MipLevel);
int3 Emitter_TemporaryGrid_NumCells;
float3 Emitter_TemporaryGrid_UnitToUV;
float3 Emitter_TemporaryGrid_CellSize;
float3 Emitter_TemporaryGrid_WorldBBoxSize;
Texture3D<float> Emitter_TemporaryGrid_Grid;
RWTexture3D<float> Emitter_TemporaryGrid_OutputGrid;
int3 Emitter_TemporaryGrid_NumTiles;
float3 Emitter_TemporaryGrid_OneOverNumTiles;
float3 Emitter_TemporaryGrid_UnitClampMin;
float3 Emitter_TemporaryGrid_UnitClampMax;
SamplerState Emitter_TemporaryGrid_GridSampler;
int4 Emitter_TemporaryGrid_AttributeIndices[2];
Buffer<float4> Emitter_TemporaryGrid_PerAttributeData;
int Emitter_TemporaryGrid_NumAttributes;
int Emitter_TemporaryGrid_NumNamedAttributes;
int3 TotalDim = Emitter_TemporaryGrid_NumCells * Emitter_TemporaryGrid_NumTiles;
F[0] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_TemporaryGrid_NumCells;
const int3 MaxCell = Emitter_TemporaryGrid_NumCells - int3(2,2,2);
return Emitter_TemporaryGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
float4x1 DataInZ;
float1 minv = 3.402823466e+38;
float1 maxv = -3.402823466e+38;
float4x1  DataInY;
float4x1 DataInX;
DataInX[xi] = Emitter_TemporaryGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
float1 Cx0 =   6.f * DataInX[0];
float1 Cx1 = -11.f * DataInX[0] + 18.f * DataInX[1] - 9.f * DataInX[2] + 2.f * DataInX[3];
float1 Cx2 =   6.f * DataInX[0] - 15.f * DataInX[1] +12.f * DataInX[2] - 3.f * DataInX[3];
float1 Cx3 =        -DataInX[0] +  3.f * DataInX[1] - 3.f * DataInX[2] +       DataInX[3];
float1 Cy0 =   6.f * DataInY[0];
float1 Cy1 = -11.f * DataInY[0] + 18.f * DataInY[1] - 9.f * DataInY[2] + 2.f * DataInY[3];
float1 Cy2 =   6.f * DataInY[0] - 15.f * DataInY[1] +12.f * DataInY[2] - 3.f * DataInY[3];
float1 Cy3 =        -DataInY[0] +  3.f * DataInY[1] - 3.f * DataInY[2] +       DataInY[3];
float1 Cz0 =   6.f * DataInZ[0];
float1 Cz1 = -11.f * DataInZ[0] + 18.f * DataInZ[1] - 9.f * DataInZ[2] + 2.f * DataInZ[3];
float1 Cz2 =   6.f * DataInZ[0] - 15.f * DataInZ[1] +12.f * DataInZ[2] - 3.f * DataInZ[3];
float1 Cz3 =        -DataInZ[0] +  3.f * DataInZ[1] - 3.f * DataInZ[2] +       DataInZ[3];
float1 TriCubicValue = (1.f/6.f) * (Cz0 + v * ( Cz1 +  v * ( Cz2 + v * Cz3 ) ));
int3 Emitter_StartVelocityGrid_NumCells;
float3 Emitter_StartVelocityGrid_UnitToUV;
float3 Emitter_StartVelocityGrid_CellSize;
float3 Emitter_StartVelocityGrid_WorldBBoxSize;
Texture3D<float3> Emitter_StartVelocityGrid_Grid;
RWTexture3D<float3> Emitter_StartVelocityGrid_OutputGrid;
int3 Emitter_StartVelocityGrid_NumTiles;
float3 Emitter_StartVelocityGrid_OneOverNumTiles;
float3 Emitter_StartVelocityGrid_UnitClampMin;
float3 Emitter_StartVelocityGrid_UnitClampMax;
SamplerState Emitter_StartVelocityGrid_GridSampler;
int4 Emitter_StartVelocityGrid_AttributeIndices[1];
Buffer<float4> Emitter_StartVelocityGrid_PerAttributeData;
int Emitter_StartVelocityGrid_NumAttributes;
int Emitter_StartVelocityGrid_NumNamedAttributes;
int3 TotalDim = Emitter_StartVelocityGrid_NumCells * Emitter_StartVelocityGrid_NumTiles;
F[0] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_StartVelocityGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_StartVelocityGrid_NumCells;
const int3 MaxCell = Emitter_StartVelocityGrid_NumCells - int3(2,2,2);
return Emitter_StartVelocityGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_StartVelocityGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
int3 Emitter_RasterizationGrid_velocity_NumCells;
float3 Emitter_RasterizationGrid_velocity_UnitToUV;
float3 Emitter_RasterizationGrid_velocity_CellSize;
float3 Emitter_RasterizationGrid_velocity_WorldBBoxSize;
Texture3D<int> Emitter_RasterizationGrid_velocity_IntGrid;
RWTexture3D<int> Emitter_RasterizationGrid_velocity_OutputIntGrid;
float Emitter_RasterizationGrid_velocity_Precision;
Buffer<float4> Emitter_RasterizationGrid_velocity_PerAttributeData;
int Emitter_RasterizationGrid_velocity_NumAttributes;
return float(IntValue) / Emitter_RasterizationGrid_velocity_Precision;
return FloatValue * Emitter_RasterizationGrid_velocity_Precision;
User_Collide_Meshes_MaxTransforms;
User_Collide_Meshes_CurrentOffset;
User_Collide_Meshes_PreviousOffset;
User_Collide_Meshes_ElementOffsets;
User_Collide_Meshes_WorldTransformBuffer;
User_Collide_Meshes_InverseTransformBuffer;
User_Collide_Meshes_MeshScaleBuffer;
User_Collide_Meshes_ElementExtentBuffer;
User_Collide_Meshes_PhysicsTypeBuffer;
User_Collide_Meshes_DFIndexBuffer;
User_Collide_Meshes_CombinedBBoxWorldMin;
User_Collide_Meshes_CombinedBBoxWorldMax;
OutNumBoxes = User_Collide_Meshes_ElementOffsets[BOX_INDEX+1] - User_Collide_Meshes_ElementOffsets[BOX_INDEX];
OutNumSpheres = User_Collide_Meshes_ElementOffsets[SPHERE_INDEX+1] - User_Collide_Meshes_ElementOffsets[SPHERE_INDEX];
OutNumCapsules = User_Collide_Meshes_ElementOffsets[CAPSULE_INDEX+1] - User_Collide_Meshes_ElementOffsets[CAPSULE_INDEX];
OutNumElements = User_Collide_Meshes_ElementOffsets[NUM_ELEMENTS_INDEX];
OutStartIndex = User_Collide_Meshes_ElementOffsets[BOX_INDEX];
OutStartIndex = User_Collide_Meshes_ElementOffsets[SPHERE_INDEX];
OutStartIndex = User_Collide_Meshes_ElementOffsets[CAPSULE_INDEX];
OutRadius = User_Collide_Meshes_ElementExtentBuffer[ElementIndex].x;
OutSize = User_Collide_Meshes_ElementExtentBuffer[ElementIndex].xy;
OutSize = User_Collide_Meshes_ElementExtentBuffer[ElementIndex].xyz;
const int BufferOffset = 3 * ElementIndex + User_Collide_Meshes_CurrentOffset;
    return float3x4(User_Collide_Meshes_WorldTransformBuffer[BufferOffset], User_Collide_Meshes_WorldTransformBuffer[BufferOffset+1], User_Collide_Meshes_WorldTransformBuffer[BufferOffset+2]);
    return float3x4(User_Collide_Meshes_InverseTransformBuffer[BufferOffset], User_Collide_Meshes_InverseTransformBuffer[BufferOffset+1], User_Collide_Meshes_InverseTransformBuffer[BufferOffset+2]);
const int BufferOffset = 3 * ElementIndex + User_Collide_Meshes_PreviousOffset;
return User_Collide_Meshes_MeshScaleBuffer[ElementIndex].xyz;
const FDFVector3 LWCWorldPosition = DFFromTileOffset_Hack(MakeLWCVector3(GetEngineOwnerLWCTile(), WorldPosition));
WorldPosition.z <= User_Collide_Meshes_CombinedBBoxWorldMax.z;
// Given a world space position (WorldPosition) compute the sphere closest point (position,normal,velocity)
const float3 DeltaPosition = LocalPosition - SphereCenter;
const float DeltaLength = length(DeltaPosition);
const float SphereDistance = DeltaLength - SphereRadius;
OutMinDistance = SphereDistance;
OutElementIndex = SphereIndex;
OutClosestNormal = (DeltaLength > SMALL_NUMBER) ? DeltaPosition / DeltaLength : float3(0,0,0);
OutClosestPosition = LocalPosition - OutClosestNormal*SphereDistance;
return SphereDistance;
const float HalfLength = 0.5 * CapsuleSize.y;
const float3 SphereCenter = float3(0,0,clamp(LocalPosition.z, -HalfLength, HalfLength));
OutClosestPosition,OutClosestNormal,OutElementIndex,OutMinDistance);
const float3 HalfExtent = 0.5 * BoxExtent;
const float3 DeltaPosition = abs(LocalPosition) - HalfExtent;
const int ClosestAxis = ((DeltaPosition.x > DeltaPosition.y) && (DeltaPosition.x > DeltaPosition.z)) ? 0 : ( DeltaPosition.y > DeltaPosition.z) ? 1 : 2;
const float OutsideDistance = length(max(DeltaPosition,0.0));
const float BoxDistance = OutsideDistance + min(DeltaPosition[ClosestAxis],0.0);
OutMinDistance = BoxDistance;
OutElementIndex = BoxIndex;
const bool NegativeSide = LocalPosition[ClosestAxis] < 0.0;
OutClosestPosition = LocalPosition;
OutClosestNormal = float3(0,0,0);
OutClosestPosition.x = NegativeSide ? -HalfExtent.x : HalfExtent.x;
OutClosestNormal.x = NegativeSide ? -1.0 : 1.0;
OutClosestPosition.y = NegativeSide ? -HalfExtent.y : HalfExtent.y;
OutClosestNormal.y = NegativeSide ? -1.0 : 1.0;
OutClosestPosition.z = NegativeSide ? -HalfExtent.z : HalfExtent.z;
OutClosestNormal.z = NegativeSide ? -1.0 : 1.0;
OutClosestPosition = clamp(LocalPosition,-HalfExtent,HalfExtent);
OutClosestNormal = (LocalPosition - OutClosestPosition) / OutsideDistance;
return BoxDistance;
const float3 CurrentLocal = mul(GetInverseTransform_User_Collide_Meshes(ElementIndex), float4(WorldPosition,1.0)).xyz;
const float3 PreviousLocal = mul(GetPreviousInverse_User_Collide_Meshes(ElementIndex), float4(WorldPosition,1.0)).xyz;
return PreviousLocal + TimeFraction * (CurrentLocal-PreviousLocal);
return mul(GetInverseTransform_User_Collide_Meshes(ElementIndex), float4(WorldPosition,1.0)).xyz;
float MinDistance = MAX_DISTANCE;
int ElementIndex = -1;
float3 CollisionPosition = float3(0,0,0);
float3 CollisionNormal = float3(0,0,0);
const int SpheresBegin = User_Collide_Meshes_ElementOffsets[SPHERE_INDEX];
const int SpheresEnd = User_Collide_Meshes_ElementOffsets[SPHERE_INDEX+1];
for (int SphereIndex = SpheresBegin; SphereIndex < SpheresEnd; ++SphereIndex)
const float3 LocalPosition = GetLocalPosition_User_Collide_Meshes(WorldPosition,SphereIndex,TimeFraction);
CollisionPosition, CollisionNormal, ElementIndex, MinDistance);
const int CapsulesBegin = User_Collide_Meshes_ElementOffsets[CAPSULE_INDEX];
const int CapsulesEnd = User_Collide_Meshes_ElementOffsets[CAPSULE_INDEX+1];
for (int CapsuleIndex = CapsulesBegin; CapsuleIndex < CapsulesEnd; ++CapsuleIndex)
const float3 LocalPosition = GetLocalPosition_User_Collide_Meshes(WorldPosition,CapsuleIndex,TimeFraction);
const int BoxesBegin = User_Collide_Meshes_ElementOffsets[BOX_INDEX];
const int BoxesEnd = User_Collide_Meshes_ElementOffsets[BOX_INDEX+1];
for (int BoxIndex = BoxesBegin; BoxIndex < BoxesEnd; ++BoxIndex)
const float3 LocalPosition = GetLocalPosition_User_Collide_Meshes(WorldPosition,BoxIndex,TimeFraction);
OutClosestPosition = CollisionPosition;
OutClosestNormal = CollisionNormal;
OutMinDistance = MinDistance;
return ElementIndex;
const float3 LocalPosition = GetCurrentLocalPosition_User_Collide_Meshes(WorldPosition,SphereIndex);
const float3 LocalPosition = GetCurrentLocalPosition_User_Collide_Meshes(WorldPosition,CapsuleIndex);
const float3 LocalPosition = GetCurrentLocalPosition_User_Collide_Meshes(WorldPosition,BoxIndex);
// Given a world space position (WorldPosition) and an element index compute the static mesh closest point (position,normal,velocity)
OutClosestPosition = float3(0,0,0);
OutClosestVelocity = float3(0,0,0);
const uint ElementIndexUint = uint(ElementIndex);
const float3 LocalPosition = GetLocalPosition_User_Collide_Meshes(WorldPosition,ElementIndex,TimeFraction);
int OutputIndex = -1;
CollisionPosition, CollisionNormal, OutputIndex, MinDistance);
const float3 PreviousPosition = mul(GetPreviousTransform_User_Collide_Meshes(ElementIndex), float4(CollisionPosition,1.0)).xyz;
const float3 CurrentPosition = mul(GetCurrentTransform_User_Collide_Meshes(ElementIndex), float4(CollisionPosition,1.0)).xyz;
const float3 PreviousNormal = mul(GetPreviousTransform_User_Collide_Meshes(ElementIndex), float4(CollisionNormal,0.0)).xyz;
const float3 CurrentNormal = mul(GetCurrentTransform_User_Collide_Meshes(ElementIndex), float4(CollisionNormal,0.0)).xyz;
OutClosestPosition = PreviousPosition + TimeFraction * (CurrentPosition-PreviousPosition);
OutClosestNormal = normalize(PreviousNormal + TimeFraction * (CurrentNormal-PreviousNormal));
OutClosestVelocity = ( CurrentPosition - PreviousPosition ) / DeltaTime;
// Given a world space position (WorldPosition) and an element index compute the static mesh closest point using distance fields (position,velocity)
OutClosestDistance = MAX_DISTANCE;
CollisionPosition, CollisionNormal, OutputIndex, OutClosestDistance);
uint DFIndex = User_Collide_Meshes_DFIndexBuffer[ElementIndex];
MaxDistance = max(.001, MaxDistance);
OutClosestDistance = DistanceToNearestSurfaceForObject(DFIndex, LWCWorldPosition, MaxDistance);
// Given a world space position (WorldPosition) and an element index compute the static mesh closest distance
OutClosestDistance = 0.0;
OutClosestDistance = (User_Collide_Meshes_PhysicsTypeBuffer[ElementIndex] == 1) ? MinDistance : 0;
 // Given a world space position (WorldPosition) compute the static mesh closest element
float MinDistance = 0.0;
OutElementIndex = GetClosestElement_User_Collide_Meshes(WorldPosition,CollisionPosition,CollisionNormal,MinDistance,TimeFraction);
// Given a world space position (WorldPosition) compute the static mesh closest point (position,normal,velocity)
const int ElementIndex = GetClosestElement_User_Collide_Meshes(WorldPosition,CollisionPosition,CollisionNormal,OutClosestDistance,TimeFraction);
const int ElementIndex = GetClosestElementSimple_User_Collide_Meshes(WorldPosition,CollisionPosition,OutClosestDistance);
// Given a world space position (WorldPosition) compute the static mesh closest distance
const int ElementIndex = GetClosestElement_User_Collide_Meshes(WorldPosition,CollisionPosition,CollisionNormal,MinDistance,TimeFraction);
const float3 LocalPosition = mul(GetInverseTransform_User_Collide_Meshes(ElementIndex), float4(WorldPosition,1.0)).xyz;
const float3 PreviousPosition = mul(GetPreviousTransform_User_Collide_Meshes(ElementIndex), float4(LocalPosition,1.0)).xyz;
const float3 CurrentPosition = mul(GetCurrentTransform_User_Collide_Meshes(ElementIndex), float4(LocalPosition,1.0)).xyz;
OutVelocity = ( CurrentPosition - PreviousPosition ) / DeltaTime;
OutPosition = PreviousPosition + TimeFraction * (CurrentPosition-PreviousPosition);
MaxEncodedDistance = 0;
NormalIsValid = false;
float OutClosestDistanceTmp;
const int ElementIndex = GetClosestElement_User_Collide_Meshes(WorldPosition,CollisionPosition,CollisionNormal,OutClosestDistanceTmp,TimeFraction);
MaxDistance = max(0.001f, MaxDistance);
OutClosestDistance = GetDistanceToMeshDistanceField(DFIndex, LWCWorldPosition, MaxDistance);
float3 SampledWorldPosition;
ComputeClosestPointMeshDistanceField(DFIndex, LWCWorldPosition, OutClosestDistance, SampledWorldPosition, OutClosestNormal, MaxEncodedDistance, NormalIsValid);
EvaluateWorldPositionOnElement_User_Collide_Meshes(ElementIndex, SampledWorldPosition, DeltaTime, TimeFraction, OutClosestPosition, OutClosestVelocity);
OutClosestDistance = length(WorldPosition - SampledWorldPosition) * sign(OutClosestDistanceTmp);
// Given a world space position (WorldPosition) compute the static mesh closest point (position,normal,velocity) by querying all overlapping mesh distance fields
for (int ElementIndex = 0; ElementIndex < User_Collide_Meshes_ElementOffsets[NUM_ELEMENTS_INDEX]; ++ElementIndex)
// #todo(dmp): this does a dynamic branch based on intersecting the bbox.  Maybe we can factor that out due to the broadphase here?
// #todo(dmp): Check the distance from the physics asset for a speedup?
float OutClosestDistanceTmp = GetDistanceToMeshDistanceField(DFIndex, LWCWorldPosition, MaxDistance);
OutClosestDistance = OutClosestDistanceTmp;
FDFObjectData DFObjectData = LoadDFObjectData(DFIndex);
uint NumMips = LoadDFAssetData(DFObjectData.AssetIndex, 0).NumMips;
FDFAssetData DFAssetData = LoadDFAssetData(DFObjectData.AssetIndex, NumMips - 1);
MaxEncodedDistance = (DFAssetData.DistanceFieldToVolumeScaleBias.x + DFAssetData.DistanceFieldToVolumeScaleBias.y) * DFObjectData.VolumeScale;
Emitter_Grid3D_ComputeBoundary_ParticleReader_IsLocalSpace;int
Emitter_Grid3D_ComputeBoundary_ParticleReader_NumSpawnedParticles;int
Emitter_Grid3D_ComputeBoundary_ParticleReader_SpawnedParticlesAcquireTag;uint
Emitter_Grid3D_ComputeBoundary_ParticleReader_InstanceCountOffset;uint
Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideFloat;uint
Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideInt;uint
Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideHalf;int
Emitter_Grid3D_ComputeBoundary_ParticleReader_AcquireTagRegisterIndex;Buffer<int>
Emitter_Grid3D_ComputeBoundary_ParticleReader_SpawnedIDsBuffer;Buffer<int>
Emitter_Grid3D_ComputeBoundary_ParticleReader_IDToIndexTable;Buffer<float>
Emitter_Grid3D_ComputeBoundary_ParticleReader_InputFloatBuffer;Buffer<int>
Emitter_Grid3D_ComputeBoundary_ParticleReader_InputIntBuffer;Buffer<half>
Emitter_Grid3D_ComputeBoundary_ParticleReader_InputHalfBuffer;int4
Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeIndices[2];int4
Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeCompressed[2];
int3 Emitter_TransientGrid_NumCells;
float3 Emitter_TransientGrid_UnitToUV;
float3 Emitter_TransientGrid_CellSize;
float3 Emitter_TransientGrid_WorldBBoxSize;
Texture3D<float4> Emitter_TransientGrid_Grid;
RWTexture3D<float4> Emitter_TransientGrid_OutputGrid;
int3 Emitter_TransientGrid_NumTiles;
float3 Emitter_TransientGrid_OneOverNumTiles;
float3 Emitter_TransientGrid_UnitClampMin;
float3 Emitter_TransientGrid_UnitClampMax;
SamplerState Emitter_TransientGrid_GridSampler;
int4 Emitter_TransientGrid_AttributeIndices[2];
Buffer<float4> Emitter_TransientGrid_PerAttributeData;
int Emitter_TransientGrid_NumAttributes;
int Emitter_TransientGrid_NumNamedAttributes;
int3 TotalDim = Emitter_TransientGrid_NumCells * Emitter_TransientGrid_NumTiles;
F[0] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_TransientGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_TransientGrid_NumCells;
const int3 MaxCell = Emitter_TransientGrid_NumCells - int3(2,2,2);
return Emitter_TransientGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
float4x4 DataInZ;
float4 minv = 3.402823466e+38;
float4 maxv = -3.402823466e+38;
float4x4  DataInY;
float4x4 DataInX;
DataInX[xi] = Emitter_TransientGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
float4 Cx0 =   6.f * DataInX[0];
float4 Cx1 = -11.f * DataInX[0] + 18.f * DataInX[1] - 9.f * DataInX[2] + 2.f * DataInX[3];
float4 Cx2 =   6.f * DataInX[0] - 15.f * DataInX[1] +12.f * DataInX[2] - 3.f * DataInX[3];
float4 Cx3 =        -DataInX[0] +  3.f * DataInX[1] - 3.f * DataInX[2] +       DataInX[3];
float4 Cy0 =   6.f * DataInY[0];
float4 Cy1 = -11.f * DataInY[0] + 18.f * DataInY[1] - 9.f * DataInY[2] + 2.f * DataInY[3];
float4 Cy2 =   6.f * DataInY[0] - 15.f * DataInY[1] +12.f * DataInY[2] - 3.f * DataInY[3];
float4 Cy3 =        -DataInY[0] +  3.f * DataInY[1] - 3.f * DataInY[2] +       DataInY[3];
float4 Cz0 =   6.f * DataInZ[0];
float4 Cz1 = -11.f * DataInZ[0] + 18.f * DataInZ[1] - 9.f * DataInZ[2] + 2.f * DataInZ[3];
float4 Cz2 =   6.f * DataInZ[0] - 15.f * DataInZ[1] +12.f * DataInZ[2] - 3.f * DataInZ[3];
float4 Cz3 =        -DataInZ[0] +  3.f * DataInZ[1] - 3.f * DataInZ[2] +       DataInZ[3];
float4 TriCubicValue = (1.f/6.f) * (Cz0 + v * ( Cz1 +  v * ( Cz2 + v * Cz3 ) ));
int3 Emitter_FaceGrid_NumCells;
float3 Emitter_FaceGrid_UnitToUV;
float3 Emitter_FaceGrid_CellSize;
float3 Emitter_FaceGrid_WorldBBoxSize;
Texture3D<float3> Emitter_FaceGrid_Grid;
RWTexture3D<float3> Emitter_FaceGrid_OutputGrid;
int3 Emitter_FaceGrid_NumTiles;
float3 Emitter_FaceGrid_OneOverNumTiles;
float3 Emitter_FaceGrid_UnitClampMin;
float3 Emitter_FaceGrid_UnitClampMax;
SamplerState Emitter_FaceGrid_GridSampler;
int4 Emitter_FaceGrid_AttributeIndices[1];
Buffer<float4> Emitter_FaceGrid_PerAttributeData;
int Emitter_FaceGrid_NumAttributes;
int Emitter_FaceGrid_NumNamedAttributes;
int3 TotalDim = Emitter_FaceGrid_NumCells * Emitter_FaceGrid_NumTiles;
F[0] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_FaceGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_FaceGrid_NumCells;
const int3 MaxCell = Emitter_FaceGrid_NumCells - int3(2,2,2);
return Emitter_FaceGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_FaceGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
int3 Emitter_PressureGrid_NumCells;
float3 Emitter_PressureGrid_UnitToUV;
float3 Emitter_PressureGrid_CellSize;
float3 Emitter_PressureGrid_WorldBBoxSize;
Texture3D<float> Emitter_PressureGrid_Grid;
RWTexture3D<float> Emitter_PressureGrid_OutputGrid;
int3 Emitter_PressureGrid_NumTiles;
float3 Emitter_PressureGrid_OneOverNumTiles;
float3 Emitter_PressureGrid_UnitClampMin;
float3 Emitter_PressureGrid_UnitClampMax;
SamplerState Emitter_PressureGrid_GridSampler;
int4 Emitter_PressureGrid_AttributeIndices[1];
Buffer<float4> Emitter_PressureGrid_PerAttributeData;
int Emitter_PressureGrid_NumAttributes;
int Emitter_PressureGrid_NumNamedAttributes;
int3 TotalDim = Emitter_PressureGrid_NumCells * Emitter_PressureGrid_NumTiles;
F[0] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_PressureGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_PressureGrid_NumCells;
const int3 MaxCell = Emitter_PressureGrid_NumCells - int3(2,2,2);
return Emitter_PressureGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_PressureGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
int3 Emitter_RasterizationGrid_NumCells;
float3 Emitter_RasterizationGrid_UnitToUV;
float3 Emitter_RasterizationGrid_CellSize;
float3 Emitter_RasterizationGrid_WorldBBoxSize;
Texture3D<int> Emitter_RasterizationGrid_IntGrid;
RWTexture3D<int> Emitter_RasterizationGrid_OutputIntGrid;
float Emitter_RasterizationGrid_Precision;
Buffer<float4> Emitter_RasterizationGrid_PerAttributeData;
int Emitter_RasterizationGrid_NumAttributes;
return float(IntValue) / Emitter_RasterizationGrid_Precision;
return FloatValue * Emitter_RasterizationGrid_Precision;
Emitter_RasterizationGrid_ParticleSource_Reader_IsLocalSpace;int
Emitter_RasterizationGrid_ParticleSource_Reader_NumSpawnedParticles;int
Emitter_RasterizationGrid_ParticleSource_Reader_SpawnedParticlesAcquireTag;uint
Emitter_RasterizationGrid_ParticleSource_Reader_InstanceCountOffset;uint
Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideFloat;uint
Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideInt;uint
Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideHalf;int
Emitter_RasterizationGrid_ParticleSource_Reader_AcquireTagRegisterIndex;Buffer<int>
Emitter_RasterizationGrid_ParticleSource_Reader_SpawnedIDsBuffer;Buffer<int>
Emitter_RasterizationGrid_ParticleSource_Reader_IDToIndexTable;Buffer<float>
Emitter_RasterizationGrid_ParticleSource_Reader_InputFloatBuffer;Buffer<int>
Emitter_RasterizationGrid_ParticleSource_Reader_InputIntBuffer;Buffer<half>
Emitter_RasterizationGrid_ParticleSource_Reader_InputHalfBuffer;int4
Emitter_RasterizationGrid_ParticleSource_Reader_AttributeIndices[1];int4
Emitter_RasterizationGrid_ParticleSource_Reader_AttributeCompressed[1];
int3 Emitter_SDFGrid_NumCells;
float3 Emitter_SDFGrid_UnitToUV;
float3 Emitter_SDFGrid_CellSize;
float3 Emitter_SDFGrid_WorldBBoxSize;
Texture3D<float> Emitter_SDFGrid_Grid;
RWTexture3D<float> Emitter_SDFGrid_OutputGrid;
int3 Emitter_SDFGrid_NumTiles;
float3 Emitter_SDFGrid_OneOverNumTiles;
float3 Emitter_SDFGrid_UnitClampMin;
float3 Emitter_SDFGrid_UnitClampMax;
SamplerState Emitter_SDFGrid_GridSampler;
int4 Emitter_SDFGrid_AttributeIndices[2];
Buffer<float4> Emitter_SDFGrid_PerAttributeData;
int Emitter_SDFGrid_NumAttributes;
int Emitter_SDFGrid_NumNamedAttributes;
int3 TotalDim = Emitter_SDFGrid_NumCells * Emitter_SDFGrid_NumTiles;
F[0] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_SDFGrid_NumCells;
const int3 MaxCell = Emitter_SDFGrid_NumCells - int3(2,2,2);
return Emitter_SDFGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_SDFGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
Emitter_SimRT_TextureSize;
Emitter_SimRT_MipLevels;
Emitter_SimRT_RWTexture;
Emitter_SimRT_Texture;
Emitter_SimRT_TextureSampler;
Emitter_SimRT_RWTexture[int3(IndexX, IndexY, IndexZ)] = Value;
Value = Emitter_SimRT_Texture.Load(int4(IndexX, IndexY, IndexZ, 0));
Value = Emitter_SimRT_Texture.Load(int4(IndexX, IndexY, IndexZ, MipLevel));
Value = Emitter_SimRT_Texture.SampleLevel(Emitter_SimRT_TextureSampler, UVW, MipLevel);
Width = Emitter_SimRT_TextureSize.x;
Height = Emitter_SimRT_TextureSize.y;
Slices = Emitter_SimRT_TextureSize.z;
OutMipLevels = Emitter_SimRT_MipLevels;
IndexX = Linear % Emitter_SimRT_TextureSize.x;
IndexY = (Linear / Emitter_SimRT_TextureSize.x) % Emitter_SimRT_TextureSize.y;
IndexZ = Linear / (Emitter_SimRT_TextureSize.x * Emitter_SimRT_TextureSize.y);
LinearToIndex_Emitter_SimRT(ExecIndex(), IndexX, IndexY, IndexZ);
int3 Texel;
ExecToIndex_Emitter_SimRT(Texel.x, Texel.y, Texel.z);
Unit.x = (float(Texel.x) + 0.5f) / float(Emitter_SimRT_TextureSize.x);
Unit.y = (float(Texel.y) + 0.5f) / float(Emitter_SimRT_TextureSize.y);
Unit.z = (float(Texel.z) + 0.5f) / float(Emitter_SimRT_TextureSize.z);
Emitter_GeneratedMesh_NumSections;
Emitter_GeneratedMesh_NumTriangles;
Emitter_GeneratedMesh_NumVertices;
Emitter_GeneratedMesh_NumTexCoords;
Emitter_GeneratedMesh_PositionOffset;
Emitter_GeneratedMesh_TangentBasisOffset;
Emitter_GeneratedMesh_TexCoordOffset;
Emitter_GeneratedMesh_ColorOffset;
Emitter_GeneratedMesh_SectionBuffer;
Emitter_GeneratedMesh_IndexBuffer;
Emitter_GeneratedMesh_VertexBuffer;
////////////////////////////////////////////////////////
// Helper functions
{ return (Vertex * 3) + Emitter_GeneratedMesh_PositionOffset; }
{ return (Vertex * 2) + Emitter_GeneratedMesh_TangentBasisOffset; }
{ return (Vertex * 2) + (TexCoord * 2) + Emitter_GeneratedMesh_TexCoordOffset; }
{ return Vertex + Emitter_GeneratedMesh_ColorOffset;}
return (Emitter_GeneratedMesh_PositionOffset != -1) && (Vertex >= 0) && (Vertex < Emitter_GeneratedMesh_NumVertices) ? Emitter_GeneratedMesh_GetPositionOffsetUnsafe(Vertex) : -1;
return (Emitter_GeneratedMesh_TangentBasisOffset != -1) && (Vertex >= 0) && (Vertex < Emitter_GeneratedMesh_NumVertices) ? Emitter_GeneratedMesh_GetTangentBasisOffsetUnsafe(Vertex) : -1;
return (Emitter_GeneratedMesh_TexCoordOffset != -1) && (Vertex >= 0) && (Vertex < Emitter_GeneratedMesh_NumVertices) && (TexCoord >= 0) && (TexCoord <= Emitter_GeneratedMesh_NumTexCoords) ? Emitter_GeneratedMesh_GetTexCoordOffsetUnsafe(Vertex, TexCoord) : -1;
return (Emitter_GeneratedMesh_ColorOffset != -1) && (Vertex >= 0) && (Vertex < Emitter_GeneratedMesh_NumVertices) ? Emitter_GeneratedMesh_GetColorOffsetUnsafe(Vertex) : -1;
float4 Unpacked;
Unpacked.x = (Packed >> 0) & 0xff;
Unpacked.y = (Packed >> 8) & 0xff;
Unpacked.z = (Packed >> 16) & 0xff;
Unpacked.w = (Packed >> 24) & 0xff;
return Unpacked / 127.5f - 1;
uint Packed;
Packed  = (int(Tangent.x * 127.499f) & 0xff) << 0;
Packed |= (int(Tangent.y * 127.499f) & 0xff) << 8;
Packed |= (int(Tangent.z * 127.499f) & 0xff) << 16;
Packed |= TangentSign << 24;
return Packed;
Unpacked = Unpacked FMANUALFETCH_COLOR_COMPONENT_SWIZZLE;
return Unpacked / 255.0f;
Color = Color FMANUALFETCH_COLOR_COMPONENT_SWIZZLE;
Color = clamp((Color * 255.0f) + 0.5f, 0.0f, 255.0f);
Packed  = uint(Color.x) << 0;
Packed |= uint(Color.y) << 8;
Packed |= uint(Color.z) << 16;
Packed |= uint(Color.w) << 24;
uint Offset = Emitter_GeneratedMesh_GetPositionOffsetUnsafe(Vertex);
Emitter_GeneratedMesh_VertexBuffer[Offset + 0] = asuint(Position.x);
Emitter_GeneratedMesh_VertexBuffer[Offset + 1] = asuint(Position.y);
Emitter_GeneratedMesh_VertexBuffer[Offset + 2] = asuint(Position.z);
uint Offset = Emitter_GeneratedMesh_GetTangentBasisOffsetUnsafe(Vertex);
uint TangentSign = dot(cross(TangentX, TangentZ), TangentY) < 0 ? 0x80 : 0x7f;
Emitter_GeneratedMesh_VertexBuffer[Offset + 0] = Emitter_GeneratedMesh_PackTangent(TangentX, TangentSign);
Emitter_GeneratedMesh_VertexBuffer[Offset + 1] = Emitter_GeneratedMesh_PackTangent(TangentZ, TangentSign);
uint Offset = Emitter_GeneratedMesh_GetTexCoordOffsetUnsafe(Vertex, TexCoordIndex);
Emitter_GeneratedMesh_VertexBuffer[Offset + 0] = asuint(TexCoord.x);
Emitter_GeneratedMesh_VertexBuffer[Offset + 1] = asuint(TexCoord.y);
uint Offset = Emitter_GeneratedMesh_GetColorOffsetUnsafe(Vertex);
Emitter_GeneratedMesh_VertexBuffer[Offset] = Emitter_GeneratedMesh_PackColor(Color);
// Mutable Functions
TriangleIndex = -1;
NumAllocated = 0;
int MaxTriangles = Emitter_GeneratedMesh_SectionBuffer[SectionIndex * 2 + 0];
InterlockedAdd(Emitter_GeneratedMesh_SectionBuffer[SectionIndex * 2 + 1], NumTriangles, TriangleIndex);
NumAllocated = min(MaxTriangles - TriangleIndex, NumTriangles);
int Correction = min(NumTriangles - NumAllocated, NumTriangles);
InterlockedAdd(Emitter_GeneratedMesh_SectionBuffer[SectionIndex * 2 + 1], -Correction);
//bSuccess = true;
Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 0] = (uint)Index0;
Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 1] = (uint)Index1;
Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 2] = (uint)Index2;
//bSuccess = false;
uint Offset = Emitter_GeneratedMesh_GetPositionOffset(Vertex);
uint Offset = Emitter_GeneratedMesh_GetTangentBasisOffset(Vertex);
uint Offset = Emitter_GeneratedMesh_GetTexCoordOffset(Vertex, TexCoordIndex);
uint Offset = Emitter_GeneratedMesh_GetColorOffset(Vertex);
//bool bDummy;
SetVertexPosition_Emitter_GeneratedMesh_UEImpureCall(true, Vertex, Position);//, bDummy);
SetVertexTangentBasis_Emitter_GeneratedMesh_UEImpureCall(true, Vertex, TangentX, TangentY, TangentZ);//, bDummy);
SetVertexTexCoord_Emitter_GeneratedMesh_UEImpureCall(true, Vertex, 0, TexCoord);//, bDummy);
SetVertexColor_Emitter_GeneratedMesh_UEImpureCall(true, Vertex, Color);//, bDummy);
InterlockedAdd(Emitter_GeneratedMesh_SectionBuffer[SectionIndex * 2 + 1], 1, TriangleIndex);
InterlockedAdd(Emitter_GeneratedMesh_SectionBuffer[SectionIndex * 2 + 1], -1);
Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 0] = (uint)TriangleIndex * 3 + 0;
Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 1] = (uint)TriangleIndex * 3 + 1;
Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 2] = (uint)TriangleIndex * 3 + 2;
Emitter_GeneratedMesh_SetVertexPositionUnsafe(TriangleIndex * 3 + 0, Position0);
Emitter_GeneratedMesh_SetVertexPositionUnsafe(TriangleIndex * 3 + 1, Position1);
Emitter_GeneratedMesh_SetVertexPositionUnsafe(TriangleIndex * 3 + 2, Position2);
Emitter_GeneratedMesh_SetVertexTangentBasisUnsafe(TriangleIndex * 3 + 0, TangentX0, TangentY0, TangentZ0);
Emitter_GeneratedMesh_SetVertexTangentBasisUnsafe(TriangleIndex * 3 + 1, TangentX1, TangentY1, TangentZ1);
Emitter_GeneratedMesh_SetVertexTangentBasisUnsafe(TriangleIndex * 3 + 2, TangentX2, TangentY2, TangentZ2);
Emitter_GeneratedMesh_SetVertexTexCoordUnsafe(TriangleIndex * 3 + 0, TexCoord0, 0);
Emitter_GeneratedMesh_SetVertexTexCoordUnsafe(TriangleIndex * 3 + 1, TexCoord1, 0);
Emitter_GeneratedMesh_SetVertexTexCoordUnsafe(TriangleIndex * 3 + 2, TexCoord2, 0);
Emitter_GeneratedMesh_SetVertexColorUnsafe(TriangleIndex * 3 + 0, Color0);
Emitter_GeneratedMesh_SetVertexColorUnsafe(TriangleIndex * 3 + 1, Color1);
Emitter_GeneratedMesh_SetVertexColorUnsafe(TriangleIndex * 3 + 2, Color2);
// Imutable Functions
bValid = true;
Index0 = (int)Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 0];
Index1 = (int)Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 1];
Index2 = (int)Emitter_GeneratedMesh_IndexBuffer[TriangleIndex * 3 + 2];
bValid = false;
Index0 = 0;
Index1 = 0;
Index2 = 0;
Position.x = asfloat(Emitter_GeneratedMesh_VertexBuffer[Offset + 0]);
Position.y = asfloat(Emitter_GeneratedMesh_VertexBuffer[Offset + 1]);
Position.z = asfloat(Emitter_GeneratedMesh_VertexBuffer[Offset + 2]);
Position = 0;
float4 TangentX = Emitter_GeneratedMesh_UnpackTangent(Emitter_GeneratedMesh_VertexBuffer[Offset + 0]);
float4 TangentZ = Emitter_GeneratedMesh_UnpackTangent(Emitter_GeneratedMesh_VertexBuffer[Offset + 1]);
float3 TangentY = cross(TangentZ.xyz, TangentX.xyz) * TangentZ.w;
OutTangentX = cross(TangentY, TangentZ.xyz) * TangentZ.w;
OutTangentY = TangentY;
OutTangentZ = TangentZ.xyz;
OutTangentX = float3(1,0,0);
OutTangentY = float3(0,1,0);
OutTangentZ = float3(0,0,1);
TexCoord.x = asfloat(Emitter_GeneratedMesh_VertexBuffer[Offset + 0]);
TexCoord.y = asfloat(Emitter_GeneratedMesh_VertexBuffer[Offset + 1]);
TexCoord = 0;
Color = Emitter_GeneratedMesh_UnpackColor(Emitter_GeneratedMesh_VertexBuffer[Offset]);
Color = float4(0,0,0,1);
bool bDummy;
GetVertexPosition_Emitter_GeneratedMesh(Vertex, bDummy, Position);
GetVertexTangentBasis_Emitter_GeneratedMesh(Vertex, bDummy, TangentX, TangentY, TangentZ);
GetVertexTexCoord_Emitter_GeneratedMesh(Vertex, 0, bDummy, TexCoord);
GetVertexColor_Emitter_GeneratedMesh(Vertex, bDummy, Color);
Out_NumCellsX = Emitter_SimGrid_NumCells.x;
Out_NumCellsY = Emitter_SimGrid_NumCells.y;
Out_NumCellsZ = Emitter_SimGrid_NumCells.z;
Out_IndexX = In_Linear % Emitter_SimGrid_NumCells.x;
Out_IndexY = (In_Linear / Emitter_SimGrid_NumCells.x) % Emitter_SimGrid_NumCells.y;
Out_IndexZ = In_Linear / (Emitter_SimGrid_NumCells.x * Emitter_SimGrid_NumCells.y);
Out_Unit = (float3(In_IndexX, In_IndexY, In_IndexZ) + .5) * Emitter_SimGrid_UnitToUV;
Out_IndexX = GDispatchThreadId.x;
Out_IndexY = GDispatchThreadId.y;
Out_IndexZ = GDispatchThreadId.z;
const uint Linear = GLinearThreadId;
Out_IndexX = Linear % Emitter_SimGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_SimGrid_NumCells.x) % Emitter_SimGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_SimGrid_NumCells.x * Emitter_SimGrid_NumCells.y);
Emitter_SimGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].rgb = Value;
    Out_Val = 0;
    const float3 TmpVal = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_IndexZ, 0));
    if (In_AttributeIndex == 0)
        Out_Val = TmpVal.r;
    else if (In_AttributeIndex == 1)
        Out_Val = TmpVal.g;
    else if (In_AttributeIndex == 2)
        Out_Val = TmpVal.b;
Value = Emitter_SimGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgb;
Value = Emitter_SimGrid_Grid.SampleLevel(Emitter_SimGrid_GridSampler, Unit, 0).rgb;
int In_AttributeIndex = 0;
Emitter_KernelGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Out_NumCellsX = Emitter_KernelGrid_NumCells.x;
Out_NumCellsY = Emitter_KernelGrid_NumCells.y;
Out_Val = Emitter_KernelGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
Out_IndexX = Linear % Emitter_TemporaryGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_TemporaryGrid_NumCells.x) % Emitter_TemporaryGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_TemporaryGrid_NumCells.x * Emitter_TemporaryGrid_NumCells.y);
Emitter_TemporaryGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].r = Value;
Out_Index = In_Unit * Emitter_TemporaryGrid_NumCells - .5;
    val = 0;
   float TmpVal = Emitter_TemporaryGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_IndexZ)];
        TmpVal.r = In_Value;
        Emitter_TemporaryGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_IndexZ)] = TmpVal;
Value = Emitter_TemporaryGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).r;
Out_IndexX = Linear % Emitter_StartVelocityGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_StartVelocityGrid_NumCells.x) % Emitter_StartVelocityGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_StartVelocityGrid_NumCells.x * Emitter_StartVelocityGrid_NumCells.y);
Emitter_StartVelocityGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].rgb = Value;
Value = Emitter_StartVelocityGrid_Grid.SampleLevel(Emitter_StartVelocityGrid_GridSampler, Unit, 0).rgb;
val = 1;
int OriginalValue;
int IntValue = Emitter_RasterizationGrid_velocityFloatToInt(In_Value);
int3 TileOffset = Emitter_RasterizationGrid_velocity_PerAttributeData[In_AttributeIndex].xyz;
int3 Index = int3(In_IndexX + TileOffset.x, In_IndexY + TileOffset.y, In_IndexZ + TileOffset.z);
InterlockedAdd(Emitter_RasterizationGrid_velocity_OutputIntGrid[Index], IntValue, OriginalValue);
int StoredValue = IntValue + OriginalValue;
// make sure to store max/min float value in the grid if we've over/underflowed
val = 0;
int NewValue = IntValue > 0 ? 2147483647 : -2147483648;
Emitter_RasterizationGrid_velocity_OutputIntGrid[Index] = In_Value;
InterlockedAdd(Emitter_RasterizationGrid_velocity_OutputIntGrid[int3(In_IndexX + TileOffset.x, In_IndexY + TileOffset.y, In_IndexZ + TileOffset.z)], Emitter_RasterizationGrid_velocityFloatToInt(In_Value), val);
Original_Value = 0.0;
int OriginalIntValue;
InterlockedAdd(Emitter_RasterizationGrid_velocity_OutputIntGrid[int3(In_IndexX + TileOffset.x, In_IndexY + TileOffset.y, In_IndexZ + TileOffset.z)], Emitter_RasterizationGrid_velocityFloatToInt(In_Value), OriginalIntValue);
Original_Value = Emitter_RasterizationGrid_velocityIntToFloat(OriginalIntValue);
Out_IndexX = Linear % Emitter_RasterizationGrid_velocity_NumCells.x;
Out_IndexY = (Linear / Emitter_RasterizationGrid_velocity_NumCells.x) % Emitter_RasterizationGrid_velocity_NumCells.y;
Out_IndexZ = Linear / (Emitter_RasterizationGrid_velocity_NumCells.x * Emitter_RasterizationGrid_velocity_NumCells.y);
Out_NumCellsX = Emitter_RasterizationGrid_velocity_NumCells.x;
Out_NumCellsY = Emitter_RasterizationGrid_velocity_NumCells.y;
Out_NumCellsZ = Emitter_RasterizationGrid_velocity_NumCells.z;
Out_Val = 0;
Out_Val =  Emitter_RasterizationGrid_velocityIntToFloat(Emitter_RasterizationGrid_velocity_IntGrid.Load(int4(In_IndexX + TileOffset.x, In_IndexY + TileOffset.y, In_IndexZ + TileOffset.z, 0)));
    if(Emitter_Grid3D_ComputeBoundary_ParticleReader_InstanceCountOffset != 0xffffffff)
        Out_NumParticles = RWInstanceCounts[Emitter_Grid3D_ComputeBoundary_ParticleReader_InstanceCountOffset];
    else
        Out_NumParticles = 0;
    int RegisterIndex = Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeIndices[0].y;
    int NumParticles = Emitter_Grid3D_ComputeBoundary_ParticleReader_InstanceCountOffset != 0xffffffff ? RWInstanceCounts[Emitter_Grid3D_ComputeBoundary_ParticleReader_InstanceCountOffset] : 0;
    if(RegisterIndex != -1 && ParticleIndex >= 0 && ParticleIndex < NumParticles)
        Out_Valid = true;
        BRANCH
        if (Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeCompressed[0].y)
                Out_Value.x = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputHalfBuffer[(RegisterIndex + 0)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.y = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputHalfBuffer[(RegisterIndex + 1)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.z = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputHalfBuffer[(RegisterIndex + 2)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideHalf + ParticleIndex]);
#endif //NIAGARA_COMPRESSED_ATTRIBUTES_ENABLED
                Out_Value.x = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputFloatBuffer[(RegisterIndex + 0)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideFloat + ParticleIndex]);
                Out_Value.y = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputFloatBuffer[(RegisterIndex + 1)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideFloat + ParticleIndex]);
                Out_Value.z = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputFloatBuffer[(RegisterIndex + 2)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideFloat + ParticleIndex]);
        Out_Valid = false;
        Out_Value = (float3)0;
    int RegisterIndex = Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeIndices[0].z;
        if (Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeCompressed[0].z)
    int RegisterIndex = Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeIndices[0].w;
        if (Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeCompressed[0].w)
                Out_Value.w = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputHalfBuffer[(RegisterIndex + 3)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.w = float(Emitter_Grid3D_ComputeBoundary_ParticleReader_InputFloatBuffer[(RegisterIndex + 3)*Emitter_Grid3D_ComputeBoundary_ParticleReader_ParticleStrideFloat + ParticleIndex]);
        Out_Value = (float4)0;
    int RegisterIndex = Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeIndices[1].x;
        if (Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeCompressed[1].x)
    int RegisterIndex = Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeIndices[1].y;
        if (Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeCompressed[1].y)
    int RegisterIndex = Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeIndices[1].z;
        if (Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeCompressed[1].z)
Out_IndexX = Linear % Emitter_TransientGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_TransientGrid_NumCells.x) % Emitter_TransientGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_TransientGrid_NumCells.x * Emitter_TransientGrid_NumCells.y);
Emitter_TransientGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].rgba = Value;
Value = Emitter_TransientGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgba;
Out_Unit = (float3(GDispatchThreadId.x, GDispatchThreadId.y, GDispatchThreadId.z) + .5) / Emitter_TransientGrid_NumCells;
const uint IndexX = Linear % Emitter_TransientGrid_NumCells.x;
const uint IndexY = (Linear / Emitter_TransientGrid_NumCells.x) % Emitter_TransientGrid_NumCells.y;
const uint IndexZ = Linear / (Emitter_TransientGrid_NumCells.x * Emitter_TransientGrid_NumCells.y);
Out_Unit = (float3(IndexX, IndexY, IndexZ) + .5) / Emitter_TransientGrid_NumCells;
Out_NumCellsX = Emitter_TransientGrid_NumCells.x;
Out_NumCellsY = Emitter_TransientGrid_NumCells.y;
Out_NumCellsZ = Emitter_TransientGrid_NumCells.z;
Out_Index = In_Unit * Emitter_TransientGrid_NumCells - .5;
Out_IndexX = Linear % Emitter_FaceGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_FaceGrid_NumCells.x) % Emitter_FaceGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_FaceGrid_NumCells.x * Emitter_FaceGrid_NumCells.y);
Emitter_FaceGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].rgb = Value;
Value = Emitter_FaceGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgb;
Out_IndexX = Linear % Emitter_PressureGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_PressureGrid_NumCells.x) % Emitter_PressureGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_PressureGrid_NumCells.x * Emitter_PressureGrid_NumCells.y);
Emitter_PressureGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].r = Value;
Value = Emitter_PressureGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).r;
    const float TmpVal = Emitter_PressureGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_IndexZ, 0));
Out_Index = In_Unit * Emitter_RasterizationGrid_NumCells - .5;
Out_NumCellsX = Emitter_RasterizationGrid_NumCells.x;
Out_NumCellsY = Emitter_RasterizationGrid_NumCells.y;
Out_NumCellsZ = Emitter_RasterizationGrid_NumCells.z;
int3 TileOffset = Emitter_RasterizationGrid_PerAttributeData[In_AttributeIndex].xyz;
InterlockedMin(Emitter_RasterizationGrid_OutputIntGrid[int3(In_IndexX + TileOffset.x, In_IndexY + TileOffset.y, In_IndexZ + TileOffset.z)], Emitter_RasterizationGridFloatToInt(In_Value), val);
InterlockedMin(Emitter_RasterizationGrid_OutputIntGrid[int3(In_IndexX + TileOffset.x, In_IndexY + TileOffset.y, In_IndexZ + TileOffset.z)], Emitter_RasterizationGridFloatToInt(In_Value), OriginalIntValue);
Original_Value = Emitter_RasterizationGridIntToFloat(OriginalIntValue);
Out_IndexX = Linear % Emitter_RasterizationGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_RasterizationGrid_NumCells.x) % Emitter_RasterizationGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_RasterizationGrid_NumCells.x * Emitter_RasterizationGrid_NumCells.y);
Out_Val =  Emitter_RasterizationGridIntToFloat(Emitter_RasterizationGrid_IntGrid.Load(int4(In_IndexX + TileOffset.x, In_IndexY + TileOffset.y, In_IndexZ + TileOffset.z, 0)));
    int RegisterIndex = Emitter_RasterizationGrid_ParticleSource_Reader_AttributeIndices[0].x;
    int NumParticles = Emitter_RasterizationGrid_ParticleSource_Reader_InstanceCountOffset != 0xffffffff ? RWInstanceCounts[Emitter_RasterizationGrid_ParticleSource_Reader_InstanceCountOffset] : 0;
        if (Emitter_RasterizationGrid_ParticleSource_Reader_AttributeCompressed[0].x)
                Out_Value.x = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputHalfBuffer[(RegisterIndex + 0)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.y = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputHalfBuffer[(RegisterIndex + 1)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.z = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputHalfBuffer[(RegisterIndex + 2)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.x = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputFloatBuffer[(RegisterIndex + 0)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideFloat + ParticleIndex]);
                Out_Value.y = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputFloatBuffer[(RegisterIndex + 1)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideFloat + ParticleIndex]);
                Out_Value.z = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputFloatBuffer[(RegisterIndex + 2)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideFloat + ParticleIndex]);
    int RegisterIndex = Emitter_RasterizationGrid_ParticleSource_Reader_AttributeIndices[0].y;
        if (Emitter_RasterizationGrid_ParticleSource_Reader_AttributeCompressed[0].y)
        Out_Value = (float2)0;
Out_IndexX = Linear % Emitter_SDFGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_SDFGrid_NumCells.x) % Emitter_SDFGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_SDFGrid_NumCells.x * Emitter_SDFGrid_NumCells.y);
Emitter_SDFGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].r = Value;
Out_NumCellsX = Emitter_SDFGrid_NumCells.x;
Out_NumCellsY = Emitter_SDFGrid_NumCells.y;
Out_NumCellsZ = Emitter_SDFGrid_NumCells.z;
Value = Emitter_SDFGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).r;
    const float TmpVal = Emitter_SDFGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_IndexZ, 0));
//Generated by UNiagaraDataInterfaceGrid2DCollection::GenerateSetupHLSL
// Argument Name "Map" Type "NiagaraParameterMap"
// Argument Name "TargetDataInterface" Type "NiagaraDataInterfaceGrid2DCollection"
SetupFromIterationSource_MapSimStage1_BuildKernelArray_GeneratedSetup_Func_(Context);
//Generated by UNiagaraDataInterfaceGrid2DCollection::GenerateTeardownHLSL
TeardownFromIterationSource_MapSimStage1_BuildKernelArray_GeneratedTeardown_Func_(Context);
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateSetupHLSL
// Argument Name "TargetDataInterface" Type "NiagaraDataInterfaceGrid3DCollection"
SetupFromIterationSource_MapSimStage2_InitTemporaryGrid_GeneratedSetup_Func_(Context);
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateTeardownHLSL
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateIterationSourceNamespaceWriteAttributesHLSL
int CurrAttributeIndex;
int X, Y, Z;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(X, Y, Z);
// Name "Emitter.TemporaryGrid.SimFloat" Type "NiagaraFloat" Var "Map.Emitter.TemporaryGrid.SimFloat"
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(X, Y, Z,  Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat);
TeardownFromIterationSource_MapSimStage2_InitTemporaryGrid_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage2_InitTemporaryGrid_GeneratedWriteAttributesEmitter_TemporaryGrid_Func_(Context);
SetupFromIterationSource_MapSimStage3_InitializeStartVelocityGrid_GeneratedSetup_Func_(Context);
ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(X, Y, Z);
// Name "Emitter.StartVelocityGrid.StartVelocity" Type "Vector3f" Var "Map.Emitter.StartVelocityGrid.StartVelocity"
SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(X, Y, Z,  Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity);
TeardownFromIterationSource_MapSimStage3_InitializeStartVelocityGrid_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage3_InitializeStartVelocityGrid_GeneratedWriteAttributesEmitter_StartVelocityGrid_Func_(Context);
SetupFromIterationSource_MapSimStage5_ComputeBoundary_GeneratedSetup_Func_(Context);
TeardownFromIterationSource_MapSimStage5_ComputeBoundary_GeneratedTeardown_Func_(Context);
SetupFromIterationSource_MapSimStage6_ComputeBoundaryHighPrecision2_GeneratedSetup_Func_(Context);
TeardownFromIterationSource_MapSimStage6_ComputeBoundaryHighPrecision2_GeneratedTeardown_Func_(Context);
SetupFromIterationSource_MapSimStage7_ExtrapolateVelocity_GeneratedSetup_Func_(Context);
ExecutionIndexToGridIndex_Emitter_SimGrid(X, Y, Z);
// Name "Emitter.SimGrid.Velocity" Type "Vector3f" Var "Map.Emitter.SimGrid.Velocity"
SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Z,  Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid.Velocity);
TeardownFromIterationSource_MapSimStage7_ExtrapolateVelocity_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage7_ExtrapolateVelocity_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
SetupFromIterationSource_MapSimStage8_ComputeDivergence_GeneratedSetup_Func_(Context);
ExecutionIndexToGridIndex_Emitter_PressureGrid(X, Y, Z);
// Name "Emitter.PressureGrid.Pressure" Type "NiagaraFloat" Var "Map.Emitter.PressureGrid.Pressure"
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(X, Y, Z,  Context.MapSimStage8_ComputeDivergence.Emitter.PressureGrid.Pressure);
TeardownFromIterationSource_MapSimStage8_ComputeDivergence_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage8_ComputeDivergence_GeneratedWriteAttributesEmitter_PressureGrid_Func_(Context);
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateIterationSourceNamespaceReadAttributesHLSL
// Variable Name "Emitter.PressureGrid.Pressure" Type "NiagaraFloat" Var "Map.Emitter.PressureGrid.Pressure"
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(X, Y, Z, Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure);
SetupFromIterationSource_MapSimStage9_SolvePressure_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage9_SolvePressure_GeneratedReadAttributesEmitter_PressureGrid_Func_(Context);
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(X, Y, Z,  Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure);
TeardownFromIterationSource_MapSimStage9_SolvePressure_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage9_SolvePressure_GeneratedWriteAttributesEmitter_PressureGrid_Func_(Context);
// Variable Name "Emitter.SimGrid.Velocity" Type "Vector3f" Var "Map.Emitter.SimGrid.Velocity"
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(X, Y, Z, Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity);
SetupFromIterationSource_MapSimStage10_ProjectPressure_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage10_ProjectPressure_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Z,  Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity);
TeardownFromIterationSource_MapSimStage10_ProjectPressure_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage10_ProjectPressure_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(X, Y, Z, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity);
SetupFromIterationSource_MapSimStage11_ExtrapolateVelocitiesAgain_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage11_ExtrapolateVelocitiesAgain_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Z,  Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity);
TeardownFromIterationSource_MapSimStage11_ExtrapolateVelocitiesAgain_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage11_ExtrapolateVelocitiesAgain_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
SetupFromIterationSource_MapSimStage14_SmoothinX_GeneratedSetup_Func_(Context);
ExecutionIndexToGridIndex_Emitter_SDFGrid(X, Y, Z);
// Name "Emitter.SDFGrid.SDF" Type "NiagaraFloat" Var "Map.Emitter.SDFGrid.SDF"
SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(X, Y, Z,  Context.MapSimStage14_SmoothinX.Emitter.SDFGrid.SDF);
TeardownFromIterationSource_MapSimStage14_SmoothinX_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage14_SmoothinX_GeneratedWriteAttributesEmitter_SDFGrid_Func_(Context);
SetupFromIterationSource_MapSimStage15_SmoothinY_GeneratedSetup_Func_(Context);
SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(X, Y, Z,  Context.MapSimStage15_SmoothinY.Emitter.SDFGrid.SDF);
TeardownFromIterationSource_MapSimStage15_SmoothinY_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage15_SmoothinY_GeneratedWriteAttributesEmitter_SDFGrid_Func_(Context);
SetupFromIterationSource_MapSimStage16_SmoothinZandOutput_GeneratedSetup_Func_(Context);
SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(X, Y, Z,  Context.MapSimStage16_SmoothinZandOutput.Emitter.SDFGrid.SDF);
TeardownFromIterationSource_MapSimStage16_SmoothinZandOutput_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage16_SmoothinZandOutput_GeneratedWriteAttributesEmitter_SDFGrid_Func_(Context);
// Variable Name "Emitter.SDFGrid.SDF" Type "NiagaraFloat" Var "Map.Emitter.SDFGrid.SDF"
GetPreviousFloatValue_Emitter_SDFGrid_AttributeSDF(X, Y, Z, Context.MapSimStage17_Output.Emitter.SDFGrid.SDF);
SetupFromIterationSource_MapSimStage17_Output_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage17_Output_GeneratedReadAttributesEmitter_SDFGrid_Func_(Context);
SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(X, Y, Z,  Context.MapSimStage17_Output.Emitter.SDFGrid.SDF);
TeardownFromIterationSource_MapSimStage17_Output_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage17_Output_GeneratedWriteAttributesEmitter_SDFGrid_Func_(Context);
Context.MapSpawn.Emitter.dx = Emitter_dx;
Context.MapSpawn.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame = Emitter_Grid3D_FLIP_Tank_Spawn_HasSpawnedThisFrame;
Context.MapSpawn.Emitter.OVERRIDE.ParticlesPerCell = Emitter_OVERRIDE_ParticlesPerCell;
Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex = Emitter_Grid3D_FLIP_Tank_Spawn_WaterHeightZIndex;
Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells = Emitter_Grid3D_FLIP_Tank_Spawn_TotalEmissionCells;
Context.MapUpdate.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage1_BuildKernelArray.Emitter.Grid3D_InitializeConvolutionKernel.Radius = Emitter_Grid3D_InitializeConvolutionKernel_Radius;
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Emitter_TemporaryGrid_SimFloat;
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Emitter_StartVelocityGrid_StartVelocity;
Context.MapSimStage4_RasterizeParticles.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapSimStage4_RasterizeParticles.Emitter.WorldToLocal = Emitter_WorldToLocal;
Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSimStage5_ComputeBoundary.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.MapSimStage5_ComputeBoundary.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage5_ComputeBoundary.Emitter.WorldToLocal = Emitter_WorldToLocal;
Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.CollisionVelocityMult = Emitter_Grid3D_FLIP_FLUID_CONTROLS_CollisionVelocityMult;
Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryUp;
Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryLeft;
Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryRight;
Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryDown;
Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryFront;
Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryBack;
Context.MapSimStage5_ComputeBoundary.Engine.WorldDeltaTime = Engine_WorldDeltaTime;
Context.MapSimStage5_ComputeBoundary.Engine.System.TimeStepFraction = Engine_System_TimeStepFraction;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryUp;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryDown;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryRight;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryLeft;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryFront;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryBack;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.MapSimStage8_ComputeDivergence.Emitter.dx = Emitter_dx;
Context.MapSimStage8_ComputeDivergence.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage8_ComputeDivergence.Emitter.PressureGrid.Pressure = Emitter_PressureGrid_Pressure;
Context.MapSimStage9_SolvePressure.Emitter.dx = Emitter_dx;
Context.MapSimStage9_SolvePressure.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure = Emitter_PressureGrid_Pressure;
Context.MapSimStage9_SolvePressure.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation = Emitter_Grid3D_FLIP_FLUID_CONTROLS_PressureRelaxation;
Context.MapSimStage10_ProjectPressure.Emitter.dx = Emitter_dx;
Context.MapSimStage10_ProjectPressure.Emitter.SimGrid_PressureIndex = Emitter_SimGrid_PressureIndex;
Context.MapSimStage10_ProjectPressure.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_BoundaryIndex = Emitter_SimGrid_BoundaryIndex;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage12_FLIP_PICforce.Emitter.LocalToWorld = Emitter_LocalToWorld;
Context.MapSimStage12_FLIP_PICforce.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapSimStage12_FLIP_PICforce.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio = Emitter_Grid3D_FLIP_FLUID_CONTROLS_PICFLIPRatio;
Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime = Engine_DeltaTime;
Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.dx = Emitter_RasterizationGrid3D_Initialize_dx;
Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth = Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
Context.MapSimStage13_FillRasterizationGrid.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapSimStage13_FillRasterizationGrid.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult = Emitter_Grid3D_FLIP_FLUID_CONTROLS_SDFParticleSizeMult;
Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSimStage14_SmoothinX.Emitter.SDFGrid.SDF = Emitter_SDFGrid_SDF;
Context.MapSimStage15_SmoothinY.Emitter.SDFGrid.SDF = Emitter_SDFGrid_SDF;
Context.MapSimStage16_SmoothinZandOutput.Emitter.SDFGrid.SDF = Emitter_SDFGrid_SDF;
Context.MapSimStage17_Output.Emitter.SDF_dx = Emitter_SDF_dx;
Context.MapSimStage17_Output.Emitter.SDFGrid.SDF = Emitter_SDFGrid_SDF;
Context.MapSimStage18_GenerateMesh.Emitter.SDF_dx = Emitter_SDF_dx;
Context.MapSimStage18_GenerateMesh.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.MapSimStage18_GenerateMesh.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapSimStage18_GenerateMesh.Engine.Owner.Position = Engine_Owner_Position;
Context.MapSimStage18_GenerateMesh.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapSimStage18_GenerateMesh.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSimStage18_GenerateMesh.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapSimStage18_GenerateMesh.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.MapSpawn.Particles.Position.x = 0.0f;
Context.MapSpawn.Particles.Position.y = 0.0f;
Context.MapSpawn.Particles.Position.z = 0.0f;
Context.MapSpawn.Particles.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.UniqueID = 0;
Context.MapSpawn.Particles.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Velocity.z = 0.0f;
Context.MapSpawn.DataInstance.Alive=true;
Context.MapSpawn.Engine.Emitter.ID.ID = 0;
Context.MapUpdate.Array.Position = 0;
Context.MapUpdate.Particles.Position.x = InputDataFloat(0, 0, InstanceIdx);
Context.MapUpdate.Particles.Position.y = InputDataFloat(0, 1, InstanceIdx);
Context.MapUpdate.Particles.Position.z = InputDataFloat(0, 2, InstanceIdx);
Context.MapUpdate.Array.SpriteSize = 3;
Context.MapUpdate.Particles.SpriteSize.x = InputDataFloat(0, 3, InstanceIdx);
Context.MapUpdate.Particles.SpriteSize.y = InputDataFloat(0, 4, InstanceIdx);
Context.MapUpdate.Array.UniqueID = 0;
Context.MapUpdate.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapUpdate.Array.Velocity = 5;
Context.MapUpdate.Particles.Velocity.x = InputDataFloat(0, 5, InstanceIdx);
Context.MapUpdate.Particles.Velocity.y = InputDataFloat(0, 6, InstanceIdx);
Context.MapUpdate.Particles.Velocity.z = InputDataFloat(0, 7, InstanceIdx);
Context.MapUpdate.DataInstance.Alive=true;
Context.MapUpdate.Engine.Emitter.ID.ID = 0;
#elif ((SimulationStageIndex == 1)) // MapSimStage1_BuildKernelArray
SetupFromIterationSource_MapSimStage1_BuildKernelArray(Context);
#elif ((SimulationStageIndex == 2)) // MapSimStage2_InitTemporaryGrid
SetupFromIterationSource_MapSimStage2_InitTemporaryGrid(Context);
#elif ((SimulationStageIndex == 3)) // MapSimStage3_InitializeStartVelocityGrid
SetupFromIterationSource_MapSimStage3_InitializeStartVelocityGrid(Context);
#elif ((SimulationStageIndex == 4)) // MapSimStage4_RasterizeParticles
Context.MapSimStage4_RasterizeParticles.Array.Position = 0;
Context.MapSimStage4_RasterizeParticles.Particles.Position.x = InputDataFloat(0, 0, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Particles.Position.y = InputDataFloat(0, 1, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Particles.Position.z = InputDataFloat(0, 2, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Array.SpriteSize = 3;
Context.MapSimStage4_RasterizeParticles.Particles.SpriteSize.x = InputDataFloat(0, 3, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Particles.SpriteSize.y = InputDataFloat(0, 4, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Array.UniqueID = 0;
Context.MapSimStage4_RasterizeParticles.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Array.Velocity = 5;
Context.MapSimStage4_RasterizeParticles.Particles.Velocity.x = InputDataFloat(0, 5, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Particles.Velocity.y = InputDataFloat(0, 6, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.Particles.Velocity.z = InputDataFloat(0, 7, InstanceIdx);
Context.MapSimStage4_RasterizeParticles.DataInstance.Alive=true;
Context.MapSimStage4_RasterizeParticles.Engine.Emitter.ID.ID = 0;
#elif ((SimulationStageIndex == 5)) // MapSimStage5_ComputeBoundary
SetupFromIterationSource_MapSimStage5_ComputeBoundary(Context);
#elif ((SimulationStageIndex == 6)) // MapSimStage6_ComputeBoundaryHighPrecision2
SetupFromIterationSource_MapSimStage6_ComputeBoundaryHighPrecision2(Context);
#elif ((SimulationStageIndex == 7)) // MapSimStage7_ExtrapolateVelocity
SetupFromIterationSource_MapSimStage7_ExtrapolateVelocity(Context);
#elif ((SimulationStageIndex == 8)) // MapSimStage8_ComputeDivergence
SetupFromIterationSource_MapSimStage8_ComputeDivergence(Context);
#elif ((SimulationStageIndex == 9)) // MapSimStage9_SolvePressure
SetupFromIterationSource_MapSimStage9_SolvePressure(Context);
#elif ((SimulationStageIndex == 10)) // MapSimStage10_ProjectPressure
SetupFromIterationSource_MapSimStage10_ProjectPressure(Context);
#elif ((SimulationStageIndex == 11)) // MapSimStage11_ExtrapolateVelocitiesAgain
SetupFromIterationSource_MapSimStage11_ExtrapolateVelocitiesAgain(Context);
#elif ((SimulationStageIndex == 12)) // MapSimStage12_FLIP_PICforce
Context.MapSimStage12_FLIP_PICforce.Array.Position = 0;
Context.MapSimStage12_FLIP_PICforce.Particles.Position.x = InputDataFloat(0, 0, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Particles.Position.y = InputDataFloat(0, 1, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Particles.Position.z = InputDataFloat(0, 2, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Array.SpriteSize = 3;
Context.MapSimStage12_FLIP_PICforce.Particles.SpriteSize.x = InputDataFloat(0, 3, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Particles.SpriteSize.y = InputDataFloat(0, 4, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Array.UniqueID = 0;
Context.MapSimStage12_FLIP_PICforce.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Array.Velocity = 5;
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity.x = InputDataFloat(0, 5, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity.y = InputDataFloat(0, 6, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity.z = InputDataFloat(0, 7, InstanceIdx);
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive=true;
Context.MapSimStage12_FLIP_PICforce.Engine.Emitter.ID.ID = 0;
#elif ((SimulationStageIndex == 13)) // MapSimStage13_FillRasterizationGrid
Context.MapSimStage13_FillRasterizationGrid.Array.Position = 0;
Context.MapSimStage13_FillRasterizationGrid.Particles.Position.x = InputDataFloat(0, 0, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Particles.Position.y = InputDataFloat(0, 1, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Particles.Position.z = InputDataFloat(0, 2, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Array.SpriteSize = 3;
Context.MapSimStage13_FillRasterizationGrid.Particles.SpriteSize.x = InputDataFloat(0, 3, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Particles.SpriteSize.y = InputDataFloat(0, 4, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Array.UniqueID = 0;
Context.MapSimStage13_FillRasterizationGrid.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Array.Velocity = 5;
Context.MapSimStage13_FillRasterizationGrid.Particles.Velocity.x = InputDataFloat(0, 5, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Particles.Velocity.y = InputDataFloat(0, 6, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.Particles.Velocity.z = InputDataFloat(0, 7, InstanceIdx);
Context.MapSimStage13_FillRasterizationGrid.DataInstance.Alive=true;
Context.MapSimStage13_FillRasterizationGrid.Engine.Emitter.ID.ID = 0;
#elif ((SimulationStageIndex == 14)) // MapSimStage14_SmoothinX
SetupFromIterationSource_MapSimStage14_SmoothinX(Context);
#elif ((SimulationStageIndex == 15)) // MapSimStage15_SmoothinY
SetupFromIterationSource_MapSimStage15_SmoothinY(Context);
#elif ((SimulationStageIndex == 16)) // MapSimStage16_SmoothinZandOutput
SetupFromIterationSource_MapSimStage16_SmoothinZandOutput(Context);
#elif ((SimulationStageIndex == 17)) // MapSimStage17_Output
SetupFromIterationSource_MapSimStage17_Output(Context);
Context.MapUpdate.Particles = Context.MapSpawn.Particles;
Context.MapUpdate.DataInstance = Context.MapSpawn.DataInstance;
#elif ((SimulationStageIndex == 18)) // MapSimStage18_GenerateMesh
const bool bValid = bIsValidInstance && Context.MapUpdate.DataInstance.Alive;
const int WriteIndex = OutputIndex(0, true, bValid);
OutputDataFloat(0, 0, WriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 1, WriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 2, WriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 3, WriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 4, WriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataInt(0, 0, WriteIndex, Context.MapUpdate.Particles.UniqueID);
OutputDataFloat(0, 5, WriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 6, WriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 7, WriteIndex, Context.MapUpdate.Particles.Velocity.z);
TeardownFromIterationSource_MapSimStage1_BuildKernelArray(Context);
TeardownFromIterationSource_MapSimStage2_InitTemporaryGrid(Context);
TeardownFromIterationSource_MapSimStage3_InitializeStartVelocityGrid(Context);
TeardownFromIterationSource_MapSimStage5_ComputeBoundary(Context);
TeardownFromIterationSource_MapSimStage6_ComputeBoundaryHighPrecision2(Context);
TeardownFromIterationSource_MapSimStage7_ExtrapolateVelocity(Context);
TeardownFromIterationSource_MapSimStage8_ComputeDivergence(Context);
TeardownFromIterationSource_MapSimStage9_SolvePressure(Context);
TeardownFromIterationSource_MapSimStage10_ProjectPressure(Context);
TeardownFromIterationSource_MapSimStage11_ExtrapolateVelocitiesAgain(Context);
const bool bValid = bIsValidInstance && Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive;
OutputDataFloat(0, 0, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.Position.x);
OutputDataFloat(0, 1, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.Position.y);
OutputDataFloat(0, 2, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.Position.z);
OutputDataFloat(0, 3, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.SpriteSize.x);
OutputDataFloat(0, 4, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.SpriteSize.y);
OutputDataInt(0, 0, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.UniqueID);
OutputDataFloat(0, 5, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.Velocity.x);
OutputDataFloat(0, 6, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.Velocity.y);
OutputDataFloat(0, 7, WriteIndex, Context.MapSimStage12_FLIP_PICforce.Particles.Velocity.z);
TeardownFromIterationSource_MapSimStage14_SmoothinX(Context);
TeardownFromIterationSource_MapSimStage15_SmoothinY(Context);
TeardownFromIterationSource_MapSimStage16_SmoothinZandOutput(Context);
TeardownFromIterationSource_MapSimStage17_Output(Context);
// TODO!
CS wrapper for our generated code; calls spawn and update functions on the corresponding instances in the buffer
= InDispatchThreadId;
= InGroupId;
= InGroupThreadId;
= InGroupIndex;
GEmitterTickCounter = EmitterTickCounter;
GRandomSeedOffset = 0;
#if SimulationStageIndex == 0 // MapUpdate
DispatchThreadIdBounds = IndirectDispatchArgs[IndirectDispatchArgsOffset].xyz;
GLinearThreadId = GDispatchThreadId.x;
GLinearThreadId += GDispatchThreadId.y * DispatchThreadIdBounds.x;
GLinearThreadId += GDispatchThreadId.z * DispatchThreadIdBounds.x * DispatchThreadIdBounds.y;
#else //NIAGARA_DISPATCH_INDIRECT
= GDispatchThreadId.x + (GDispatchThreadId.y * DispatchThreadIdToLinear.y);
GLinearThreadId += GDispatchThreadId.z * DispatchThreadIdToLinear.z;
#endif //NIAGARA_DISPATCH_INDIRECT
bool bRunSpawnUpdateLogic = true;
GSpawnStartInstance = 0;
GSpawnStartInstance = RWInstanceCounts[ReadInstanceCountOffset];
const uint MaxInstances = GSpawnStartInstance + NumSpawnedInstances;
const bool bRunUpdateLogic = bRunSpawnUpdateLogic && GLinearThreadId < GSpawnStartInstance && GLinearThreadId < MaxInstances;
const bool bRunSpawnLogic = bRunSpawnUpdateLogic && GLinearThreadId >= GSpawnStartInstance && GLinearThreadId < MaxInstances;
const float RandomSeedInitialisation = NiagaraInternalNoise(GLinearThreadId * 16384, 0 * 8196, (bRunUpdateLogic ? 4096 : 0) + EmitterTickCounter);
// initialise the random state seed
FSimulationContext Context = (FSimulationContext)0;
SetupExecIndexForGPU();
InitConstants(Context);
LoadUpdateVariables(Context, GLinearThreadId);
ReadDataSets(Context);
SimulateMapUpdate(Context);
WriteDataSets(Context);
SetupExecIndexAndSpawnInfoForGPU();
InitSpawnVariables(Context);
Context.MapSpawn.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + GLinearThreadId - GSpawnStartInstance;
ConditionalInterpolateParameters(Context);
SimulateMapSpawn(Context);
TransferAttributes(Context);
StoreUpdateVariables(Context, bRunUpdateLogic || bRunSpawnLogic);
#elif SimulationStageIndex == 1 // MapSimStage1_BuildKernelArray
const uint MaxInstances = SimulationStage_GetInstanceCount();
GLinearThreadId = all(GDispatchThreadId < DispatchThreadIdBounds) ? GLinearThreadId : MaxInstances;
GSpawnStartInstance = MaxInstances;
const bool bRunUpdateLogic = (GLinearThreadId < GSpawnStartInstance) && (SimStart != 1);
const bool bRunSpawnLogic = (GLinearThreadId < GSpawnStartInstance) && (SimStart == 1);
SimulateMapSimStage1_BuildKernelArray(Context);
#elif SimulationStageIndex == 2 // MapSimStage2_InitTemporaryGrid
SimulateMapSimStage2_InitTemporaryGrid(Context);
#elif SimulationStageIndex == 3 // MapSimStage3_InitializeStartVelocityGrid
SimulateMapSimStage3_InitializeStartVelocityGrid(Context);
#elif SimulationStageIndex == 4 // MapSimStage4_RasterizeParticles
const bool bRunUpdateLogic = bRunSpawnUpdateLogic && GLinearThreadId < GSpawnStartInstance;
const bool bRunSpawnLogic = false;
SimulateMapSimStage4_RasterizeParticles(Context);
#elif SimulationStageIndex == 5 // MapSimStage5_ComputeBoundary
SimulateMapSimStage5_ComputeBoundary(Context);
#elif SimulationStageIndex == 6 // MapSimStage6_ComputeBoundaryHighPrecision2
SimulateMapSimStage6_ComputeBoundaryHighPrecision2(Context);
#elif SimulationStageIndex == 7 // MapSimStage7_ExtrapolateVelocity
SimulateMapSimStage7_ExtrapolateVelocity(Context);
#elif SimulationStageIndex == 8 // MapSimStage8_ComputeDivergence
SimulateMapSimStage8_ComputeDivergence(Context);
#elif SimulationStageIndex == 9 // MapSimStage9_SolvePressure
SimulateMapSimStage9_SolvePressure(Context);
#elif SimulationStageIndex == 10 // MapSimStage10_ProjectPressure
SimulateMapSimStage10_ProjectPressure(Context);
#elif SimulationStageIndex == 11 // MapSimStage11_ExtrapolateVelocitiesAgain
SimulateMapSimStage11_ExtrapolateVelocitiesAgain(Context);
#elif SimulationStageIndex == 12 // MapSimStage12_FLIP_PICforce
SimulateMapSimStage12_FLIP_PICforce(Context);
#elif SimulationStageIndex == 13 // MapSimStage13_FillRasterizationGrid
SimulateMapSimStage13_FillRasterizationGrid(Context);
#elif SimulationStageIndex == 14 // MapSimStage14_SmoothinX
SimulateMapSimStage14_SmoothinX(Context);
#elif SimulationStageIndex == 15 // MapSimStage15_SmoothinY
SimulateMapSimStage15_SmoothinY(Context);
#elif SimulationStageIndex == 16 // MapSimStage16_SmoothinZandOutput
SimulateMapSimStage16_SmoothinZandOutput(Context);
#elif SimulationStageIndex == 17 // MapSimStage17_Output
SimulateMapSimStage17_Output(Context);
#elif SimulationStageIndex == 18 // MapSimStage18_GenerateMesh
SimulateMapSimStage18_GenerateMesh(Context);
æ;¡l,{3K¸V]ù˚
%∞2Çø;
ˇ†LœZ;Ár
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(U
_\õ=õ):;l˙<
>·-ˇ^;zÂ_
 RÜîÊ%Z
ñ6sôRsHüeß;ÄÃSáZ
T5`;BºÎ8
ád˘Ôn;…G¶ﬁ=m˙ÄD(6
ád˘Ôn;…G¶ﬁ=m˙ÄD(Ø
‰S∫Ì=M9O†<ù.Ü;mî¨
;%ûEÆVπÁ\>≠@U
 K6D»E6U
 &u;ÙU
ß≤≠˚KΩ{∏Or<;]Z
0m4P≈ﬁA;•K¶ó_Î˛
// Compile Tags: 
// Compile Tags Editor Only: 
float PREV_Engine_WorldDeltaTime;
float PREV_Engine_DeltaTime;
float PREV_Engine_InverseDeltaTime;
float PREV_Engine_Time;
float PREV_Engine_RealTime;
int PREV_Engine_QualityLevel;
int PREV_Engine_PaddingInt32_0;
int PREV_Engine_PaddingInt32_1;
float PREV_Engine_Owner_TimeSinceRendered;
float PREV_Engine_Owner_LODDistance;
float PREV_Engine_Owner_LODDistanceFraction;
float PREV_Engine_System_Age;
int PREV_Engine_Owner_ExecutionState;
int PREV_Engine_System_TickCount;
int PREV_Engine_System_NumEmitters;
int PREV_Engine_System_NumEmittersAlive;
int PREV_Engine_System_SignificanceIndex;
int PREV_Engine_System_RandomSeed;
int PREV_Engine_System_CurrentTimeStep;
int PREV_Engine_System_NumTimeSteps;
float PREV_Engine_System_TimeStepFraction;
int PREV_Engine_System_NumParticles;
int PREV_Engine_System_PaddingInt32_0;
int PREV_Engine_System_PaddingInt32_1;
float4x4 PREV_Engine_Owner_SystemLocalToWorld;
float4x4 PREV_Engine_Owner_SystemWorldToLocal;
float4x4 PREV_Engine_Owner_SystemLocalToWorldTransposed;
float4x4 PREV_Engine_Owner_SystemWorldToLocalTransposed;
float4x4 PREV_Engine_Owner_SystemLocalToWorldNoScale;
float4x4 PREV_Engine_Owner_SystemWorldToLocalNoScale;
float4 PREV_Engine_Owner_Rotation;
float3 PREV_Engine_Owner_Position;
int PREV_Engine_Owner_PaddingInt32_0;
float3 PREV_Engine_Owner_Velocity;
int PREV_Engine_Owner_PaddingInt32_1;
float3 PREV_Engine_Owner_SystemXAxis;
int PREV_Engine_Owner_PaddingInt32_2;
float3 PREV_Engine_Owner_SystemYAxis;
int PREV_Engine_Owner_PaddingInt32_3;
float3 PREV_Engine_Owner_SystemZAxis;
int PREV_Engine_Owner_PaddingInt32_4;
float3 PREV_Engine_Owner_Scale;
int PREV_Engine_Owner_PaddingInt32_5;
float4 PREV_Engine_Owner_LWCTile;
int PREV_Engine_Emitter_NumParticles;
int PREV_Engine_Emitter_TotalSpawnedParticles;
float PREV_Engine_Emitter_SpawnCountScale;
float PREV_Emitter_Age;
int PREV_Emitter_RandomSeed;
int PREV_Engine_Emitter_InstanceSeed;
int PREV_Engine_Emitter_PaddingInt32_0;
int PREV_Engine_Emitter_PaddingInt32_1;
float4x4 System_Grid3D_CreateUnitToWorldTransform_UnitToWorld;
float4x4 System_Grid3D_CreateUnitToWorldTransform_WorldToUnit;
int Emitter_ExecutionState;
int System_ExecutionState;
int Emitter_NumCellsX;
int Emitter_NumCellsY;
int Emitter_NumCellsZ;
float Emitter_SpawnRate;
float4x4 PREV_System_Grid3D_CreateUnitToWorldTransform_UnitToWorld;
float4x4 PREV_System_Grid3D_CreateUnitToWorldTransform_WorldToUnit;
int PREV_Emitter_ExecutionState;
int PREV_System_ExecutionState;
float PREV_Emitter_dx;
int PREV_Emitter_NumCellsX;
int PREV_Emitter_NumCellsY;
int PREV_Emitter_NumCellsZ;
float PREV_Emitter_SpawnRate;
float3 AdvectionVelocity;
float Collision_ParticleInverseMassReplacement;
float Collision_ParticleMassReplacement;
float3 Collision_ParticlePhysicsForceReplacement;
float3 Collision_ParticlePositionReplacement;
float3 Collision_ParticleVelocityReplacement;
float3 Collision_PredictedParticlePositionForSimStages;
float CollisionDistanceToCollision;
float CollisionFriction;
bool CollisionIsResting;
float3 CollisionNormal;
float3 CollisionParticleRelativeCollisionLocation;
float3 CollisionParticleWorldPosition;
float CollisionRestitution;
float CollisionSize;
bool CollisionValid;
float3 CollisionVelocity;
float3 CollisionWorldPosition;
bool DragIgnoreMass;
bool FirstFrame;
float PhysicsDeltaTime;
float PhysicsDrag;
float PhysicsRotationalDrag;
float3 PhysicsRotationalForce;
bool RotationalVelocityEnabled;
FParamMap0_System_Grid3D_CreateUnitToWorldTransform Grid3D_CreateUnitToWorldTransform;
float3 Force;
float Mass;
bool WritetoIntrinsicProperties;
float4 PrevMeshOrientation;
float3 PrevPosition;
FParamMap0_SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Particles Particles;
float4 MeshOrientation;
FParamMap0_SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Particles Particles;
bool LetInfinitelyLivedParticlesDieWhenEmitterDeactivates;
float Lifetime;
bool LoopParticlesLifetime;
int CollisionID;
FParamMap0_Particles_Collision_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Particles_Collision_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
float3 SafeCombinedCollisionNormal;
FParamMap0_Particles_Collision Collision;
float Diameter;
float DistanceTraveled;
bool HasCollided;
float3 MomentOfInertia;
float NormalizedAge;
int NumberOfCollisions;
FParamMap0_Particles_Presolve Presolve;
FParamMap0_Particles_Previous Previous;
float Radius;
float RestCounter;
float RotationalInertia;
float3 RotationalVelocity;
float Volume;
float IncomingPhysicsDrag;
float3 IncomingPhysicsForce;
float CollisionPenetrationDistance;
bool ModuleDepthBasedCollisionParticleOccluded;
bool ParticleOnScreen;
bool PhysicsCollidesThisFrame;
FParamMap0_OUTPUT_VAR_Collision_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_OUTPUT_VAR_Collision_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
float3 CombinedCollisionNormal;
float3 IncomingCollisionVelocity;
float3 ModuleCollision1Normal;
bool ModuleCollision1Valid;
float3 ModuleCollision2Normal;
bool ModuleCollision2Valid;
float3 ModuleCombinedCollisionNormal;
FParamMap0_OUTPUT_VAR_Collision Collision;
FParamMap0_OUTPUT_VAR_ParticleState ParticleState;
FParamMap0_OUTPUT_VAR_SolveForcesAndVelocity001 SolveForcesAndVelocity001;
bool NormalizeAxis;
float3 DragVelocity;
float InverseMass;
float3 ModuleAttemptedMovementThisUpdate;
float3 ModuleForceContribution;
float3 ModuleFrictionForceVectorInNewtons;
float3 ModuleFrictionForceVelocityVector;
bool ModuleInitialDataInstanceAlive;
float3 ModuleInitialForceDividedByMass;
float ModuleNormalForceInNewtons;
float ModulePercentageOfTickDedicatedToUpdatingPosition;
float ModulePhysicsDeltaTime;
float3 ModulePlaneNormal;
float3 ModulePlanePivotPoint;
float3 ModuleReflectedVelocity;
float3 ModuleReflectedVelocityWithFrictionApplied;
bool ModuleRemoveRestitution;
float3 ModuleReturnedCollisionNormal;
bool ModuleReturnedCollisionValidBool;
float3 ModuleReturnedCollisionWorldPosition;
float ModuleReturnedFriction;
float ModuleReturnedRestitution;
float ModuleTickDeltaForThisCollisionUpdate;
float3 ModuleTraceDirection;
float3 ModuleTraceOrigin;
float3 ModuleTraceVector;
float3 ModuleTraceWorldEnd;
float3 ModuleTraceWorldStart;
FParamMap0_Local_Collision_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Local_Collision_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
bool DebugCollided1;
bool DebugCollided2;
float3 DebugCollisionNormal1;
float3 DebugCollisionNormal2;
float3 DebugCollisionPosition1;
float3 DebugCollisionPosition2;
float3 InputForcePassthrough_NeededForSimStageExecution;
float3 InputPositionPassthrough_NeededForSimStageExecution;
float3 InputVelocityPassthrough_NeededForSimStageExecution;
int KillOnCollision;
bool ManuallyEnterRest;
float ModuleParticleRadius;
float3 ModuleTraceWorldEnd1;
float3 ModuleTraceWorldEnd2;
float3 ModuleTraceWorldStart1;
float3 ModuleTraceWorldStart2;
bool UpdateMeshRotation;
FParamMap0_Local_Collision Collision;
FParamMap0_Local_SolveForcesAndVelocity001 SolveForcesAndVelocity001;
float Emitter_InterpSpawnStartDt;
int Emitter_SpawnGroup;
float Emitter_SpawnInterval;
int InterpSpawn_Index;
float InterpSpawn_InvSpawnTime;
float InterpSpawn_InvUpdateTime;
float InterpSpawn_SpawnTime;
float InterpSpawn_UpdateTime;
float SpawnInterp;
int ExecutionCount;
int NumCellsX;
int NumCellsY;
int NumCellsZ;
float SpawnRate;
bool IgnoreMass;
float BounceCollisionFriction;
bool CollisionEnabled;
float CollisionNormalRandomizationPercentage;
int CPUFrictionMergeType;
float DynamicFrictionCoefficient;
bool KillParticlesLodgedWithinMeshes;
float MaxIntersectionCorrectionDistance;
float MaxTraceLength;
float ParticleRadius;
float ParticleRestitutionCoeffiecient;
bool RandomizeCollisionNormal;
float StaticFrictionCoefficient;
float StaticFrictionEngagementSpeed;
float TraceVectorLengthMultiplier;
bool UpdateRotationalVelocity;
float AdvancedAgingRate;
FParamMap0_Collision_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Collision_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
bool ControlRestStateViaSurfaceNormal;
bool EnableMaxCollisionCount;
bool EnableRestState;
float ParticleMass;
bool RandomizeCollisionNormalVector;
int MeshOrientation;
int Scale;
int PhysicsForce;
FParamMap0_Array_Collision_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Array_Collision_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
int SafeCombinedCollisionNormal;
int Age;
FParamMap0_Array_Collision Collision;
int Diameter;
int DistanceTraveled;
int HasCollided;
int Lifetime;
int Mass;
int MomentOfInertia;
int NormalizedAge;
FParamMap0_Array_Presolve Presolve;
FParamMap0_Array_Previous Previous;
int PrevMeshOrientation;
int PrevPosition;
int RestCounter;
int RotationalInertia;
int RotationalVelocity;
int Volume;
FParamMap0_Collision Collision;
FParamMap0_Drag Drag;
FParamMap0_Grid3D_ExternalObjectBuoyancyForce Grid3D_ExternalObjectBuoyancyForce;
FParamMap0_Interpolation Interpolation;
FParamMap0_MakeQuatFromAxisAngle MakeQuatFromAxisAngle;
FParamMap0_ParticleState ParticleState;
FParamMap0_ScratchModule ScratchModule;
FParamMap0_SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC;
FParamMap0_SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3 SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3;
FParamMap0_SolveForcesAndVelocity001 SolveForcesAndVelocity001;
FParamMap0_System System;
void CustomHlsl30D1D41C0BAAFD5353359984B55E02C8D439790A_Func_(float3 In_Rad, out float Out_Vol);
void CustomHlsl1A76195D095F1BE5FDA31F1E3DC3F3AA97BB8949_Func_(float3 In_r, float In_m, out float3 Out_MomentOfInertia);
void CustomHlsl50E8A787DE7782AB5B5AAF15F1625BDD20BCDFAF_Func_(float3 In_Radius, out float2 Out_SpriteSize);
void ScratchModule_04_Emitter_Func_(inout FSimulationContext Context);
void AxisAngleToQuaternion_Func_(float4 In_AxisAngle, bool In_NormalizeAxis, out float4 Out_Quaternion, inout FSimulationContext Context);
void MakeQuatFromAxisAngle_Emitter_Func_(out float4 Out_Quaternion, inout FSimulationContext Context);
void SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_(inout FSimulationContext Context);
void ParticleState_Emitter_Func_(inout FSimulationContext Context);
void GravityForce_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void GetPreviousFloatValue_Emitter_PressureReader_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void GetPreviousVector4Value_Emitter_BoundaryReader_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_(float3 In_Unit, float In_dx, float In_ParticleIndexRadius, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float4x4 In_UnitToWorld, float3 In_WorldParticleCenter, float In_Mass, bool In_Debug, out float3 Out_BuoyancyForce, out float3 Out_RotationalForce);
void Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_(inout FSimulationContext Context);
void Collision_TransformPosition007_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void Collision_TransformVector009_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision_TransformVector010_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_(float2 In_SpriteSize, out float Out_Radius, inout FSimulationContext Context);
void DragVelocity_Particle_Func_(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_0_Particle_Func_(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_Query(float3 In_FieldSamplePosWorld, out float Out_DistanceToNearestSurface, out float3 Out_FieldGradient, out bool Out_IsDistanceFieldValid);
void Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_(float3 In_Position, float3 In_StartTrace, float3 In_EndTrace, out bool Out_Collides, out float3 Out_ImpactPosition, out float3 Out_ImpactNormal, out bool Out_Insideamesh, out bool Out_DistanceFieldIsValid, out float Out_DistanceToSurface, inout FSimulationContext Context);
void PlaneSphereCollisionDetection_Func_(float3 In_PlaneNormal, float3 In_PlanePivotPoint, float3 In_InitialSphereLocation, float3 In_SpherePositionDelta, float In_CollisionRadius, float In_PhysicsDeltaTime, float In_MaxCorrectiondistance, out bool Out_Collides, out float3 Out_IntersectionLocation, out float3 Out_PreASC45IntersectionSphereCenterLocation, out float3 Out_InitialPositionRelativeCollisionLocation, out float Out_TimeElapsedToCollision, out float Out_RemainingTimePostCollision, out float Out_PercentageofTimeUsedToPerformCollision, out float Out_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, out float Out_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, inout FSimulationContext Context);
void GetRandomInfo_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float2 In_Min, float2 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float2 Out_Result, inout FSimulationContext Context);
void CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_(float3 In_From, float3 In_To, out float4 Out_Result);
void FindQuatBetween_v1_0_Func_(float3 In_From, float3 In_To, out float4 Out_NewOutput, inout FSimulationContext Context);
void MultiplyVectorWithQuaternion_Func_(float3 In_VECTOR_VAR, float4 In_Quaternion, out float3 Out_Vector, inout FSimulationContext Context);
void RandomizeCollisionNormals_Func_(float3 In_ConeAxis, float In_Scale, float In_Spread, out float3 Out_Ouput, inout FSimulationContext Context);
void ReflectVector_Func_(float3 In_InVector, float3 In_Normal, out float3 Out_Reflected, inout FSimulationContext Context);
void CentimeterMeterConversion_Func_(float3 In_INPUT_VAR, out float3 Out_CentimeterstoMeters, out float3 Out_MeterstoCentimeters, inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_1_Particle_Func_(float3 In_VECTOR_VAR, float3 In_FallbackVector, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void ProjectVectorOnPlane_Particle_Func_(float3 In_VECTOR_VAR, float3 In_Normal, bool In_NormalizeNormal, out float3 Out_Ouput, inout FSimulationContext Context);
void Collision_CollisionQueryAndResponse_Emitter_Func_(out float3 Out_ModuleTraceWorldStart, out float3 Out_ModuleTraceWorldEnd, out float3 Out_CollisionPosition, out float3 Out_CollisionNormal, out bool Out_Collided, inout FSimulationContext Context);
void QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_Query(float3 In_FieldSamplePosWorld, out float Out_DistanceToNearestSurface, out float3 Out_FieldGradient, out bool Out_IsDistanceFieldValid);
void Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_(float3 In_Position, float3 In_StartTrace, float3 In_EndTrace, out bool Out_Collides, out float3 Out_ImpactPosition, out float3 Out_ImpactNormal, out bool Out_Insideamesh, out bool Out_DistanceFieldIsValid, out float Out_DistanceToSurface, inout FSimulationContext Context);
void Collision_CollisionQueryAndResponse001_Emitter_Func_(out float3 Out_ModuleTraceWorldStart, out float3 Out_ModuleTraceWorldEnd, out float3 Out_CollisionPosition, out float3 Out_CollisionNormal, out bool Out_Collided, inout FSimulationContext Context);
void Collision_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision_TransformPosition001_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void Collision_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_(inout FSimulationContext Context);
void Drag_Emitter_Func_(inout FSimulationContext Context);
void SolveForcesAndVelocity001_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl0013C38042754EB4CDC38BF90DCA5470E6AF8085104_Func_(float4 In_Quat1, float4 In_Quat2, out float4 Out_Result);
void MultiplyQuaternion_Func_(float4 In_QuaternionA, float4 In_QuaternionB, out float4 Out_Quaternion, inout FSimulationContext Context);
void ApplyRotationVector_NormalizeRotations_false_Func_(float3 In_RotationalVelocityVector, float In_DeltaTime, float4 In_ExistingOrientationQuat, out float4 Out_NewOrientationQuat, inout FSimulationContext Context);
void ScratchModule_Emitter_Func_(inout FSimulationContext Context);
Out_Vol = 4./3 * 3.1415926 * In_Rad.x * In_Rad.y * In_Rad.z;
Out_MomentOfInertia.x = In_r.y * In_r.y + In_r.z * In_r.z;
Out_MomentOfInertia.y = In_r.z * In_r.z + In_r.x * In_r.x;
Out_MomentOfInertia.z = In_r.y * In_r.y + In_r.x * In_r.x;
Out_MomentOfInertia *= In_m / 5.;
Out_SpriteSize = 2.0 * max(max(In_Radius.x, In_Radius.y), In_Radius.z);
float Constant30 = 0.5;
float3 Constant31 = float3(40,20,20);
float CustomHlsl30D1D41C0BAAFD5353359984B55E02C8D439790A_Func_Output_Vol;
CustomHlsl30D1D41C0BAAFD5353359984B55E02C8D439790A_Func_(Constant31, CustomHlsl30D1D41C0BAAFD5353359984B55E02C8D439790A_Func_Output_Vol);
float Result = CustomHlsl30D1D41C0BAAFD5353359984B55E02C8D439790A_Func_Output_Vol * Constant30;
float Constant32 = 2;
float3 Result1 = Constant31 * Constant32;
float Constant33 = 100;
float3 Result2 = Result1 / Constant33;
float Result3 = length(Constant31);
float Result4 = Result3 * Result;
float3 CustomHlsl1A76195D095F1BE5FDA31F1E3DC3F3AA97BB8949_Func_Output_MomentOfInertia;
CustomHlsl1A76195D095F1BE5FDA31F1E3DC3F3AA97BB8949_Func_(Constant31, Result, CustomHlsl1A76195D095F1BE5FDA31F1E3DC3F3AA97BB8949_Func_Output_MomentOfInertia);
Context.MapSpawn.Particles.Volume = CustomHlsl30D1D41C0BAAFD5353359984B55E02C8D439790A_Func_Output_Vol;
Context.MapSpawn.Particles.Mass = Result;
Context.MapSpawn.Particles.Scale = Result2;
Context.MapSpawn.Particles.RotationalInertia = Result4;
Context.MapSpawn.Particles.MomentOfInertia = CustomHlsl1A76195D095F1BE5FDA31F1E3DC3F3AA97BB8949_Func_Output_MomentOfInertia;
float Constant34 = 2;
float Result5 = Result3 * Constant34;
float2 CustomHlsl50E8A787DE7782AB5B5AAF15F1625BDD20BCDFAF_Func_Output_SpriteSize;
CustomHlsl50E8A787DE7782AB5B5AAF15F1625BDD20BCDFAF_Func_(Constant31, CustomHlsl50E8A787DE7782AB5B5AAF15F1625BDD20BCDFAF_Func_Output_SpriteSize);
Context.MapSpawn.Particles.Diameter = Result5;
Context.MapSpawn.Particles.SpriteSize = CustomHlsl50E8A787DE7782AB5B5AAF15F1625BDD20BCDFAF_Func_Output_SpriteSize;
Context.MapSpawn.Particles.Radius = Result3;
#if ((SimulationStageIndex == 0) || (SimulationStageIndex == 0)) // Multiple stages
float NiagaraFloat;
VECTOR_VAR.x = In_AxisAngle.x;
VECTOR_VAR.y = In_AxisAngle.y;
VECTOR_VAR.z = In_AxisAngle.z;
NiagaraFloat = In_AxisAngle.w;
float3 Result7 = normalize(VECTOR_VAR);
Vector_IfResult = Result7;
Vector_IfResult = VECTOR_VAR;
float Constant41 = 2;
float Result8 = NiagaraFloat / Constant41;
float Result9 = sin(Result8);
float3 Result10 = Vector_IfResult * Result9;
float Result11 = cos(Result8);
float4 Output3;
Output3.x = Result10.x;
Output3.y = Result10.y;
Output3.z = Result10.z;
Output3.w = Result11;
Out_Quaternion = Output3;
float3 Constant39 = float3(0,1,0);
float Constant40 = 45;
float Result6 = (PI/180.0f)*(Constant40);
float4 Output1;
Output1.x = Constant39.x;
Output1.y = Constant39.y;
Output1.z = Constant39.z;
Output1.w = Result6;
float4 AxisAngleToQuaternion_Func_Output_Quaternion;
AxisAngleToQuaternion_Func_(Output1, Context.MapSpawn.MakeQuatFromAxisAngle.NormalizeAxis, AxisAngleToQuaternion_Func_Output_Quaternion, Context);
Out_Quaternion = AxisAngleToQuaternion_Func_Output_Quaternion;
float3 Constant45 = float3(0,0,0);
float3 Constant46 = float3(0,0,0);
float4 Constant47 = float4(0,0,0,1);
Context.MapSpawn.Particles.Position = Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.Position;
Context.MapSpawn.Particles.RotationalVelocity = Constant45;
Context.MapSpawn.Particles.Velocity = Constant46;
Context.MapSpawn.Particles.MeshOrientation = Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.MeshOrientation;
Context.MapSpawn.Particles.PrevMeshOrientation = Constant47;
bool Result12 = NiagaraAll(Context.MapUpdate.Particles.Age <= Context.MapUpdate.Engine.DeltaTime);
Context.MapUpdate.OUTPUT_VAR.ParticleState.FirstFrame = Result12;
Context.MapUpdate.Transient.FirstFrame = Result12;
bool Result13 = NiagaraAny(Context.MapUpdate.Emitter.ExecutionState != Constant51);
bool Result14 = NiagaraAny(Context.MapUpdate.System.ExecutionState != Constant52);
bool Result15 = Result13 || Result14;
bool Result16 = Context.MapUpdate.ParticleState.LetInfinitelyLivedParticlesDieWhenEmitterDeactivates && Result15;
bool Result17 = !Result16;
bool Result18 = Context.MapUpdate.ParticleState.LoopParticlesLifetime && Result17;
float Result19 = Context.MapUpdate.Particles.Age + Context.MapUpdate.ParticleState.DeltaTime;
float Constant53 = 1e-05;
float Result20 = max(Context.MapUpdate.ParticleState.Lifetime, Constant53);
float Result21 = ModuloPrecise(Result19, Result20);
float Age_IfResult;
Age_IfResult = Result21;
Age_IfResult = Result19;
float Constant54 = 0.0001;
float Result22 = Result20 - Constant54;
bool Result23 = NiagaraAll(Age_IfResult > Result22);
bool Result24 = Result23 && Result16;
bool Constant55 = false;
bool_IfResult = Constant55;
bool_IfResult = Context.MapUpdate.DataInstance.Alive;
float Result25 = Age_IfResult / Result20;
Context.MapUpdate.DataInstance.Alive = bool_IfResult;
Context.MapUpdate.Particles.Age = Age_IfResult;
Context.MapUpdate.Particles.NormalizedAge = Result25;
bool Constant56 = true;
float3 Constant59 = float3(0,0,-980);
float3 Result26 = Constant59 * Context.MapUpdate.Particles.Mass;
float3 Result27 = Context.MapUpdate.Transient.PhysicsForce + Result26;
Context.MapUpdate.Transient.PhysicsForce = Result27;
float3 IndexF = In_Unit * float3(In_NumCellsX, In_NumCellsY, In_NumCellsZ) - .5;
const int IntParticleRadius = ceil(In_ParticleIndexRadius)+2;
float FaceArea = In_dx*In_dx;
Out_BuoyancyForce = float3(0,0,0);
Out_RotationalForce = float3(0,0,0);
        CurrIntIndex.x >= 0 && CurrIntIndex.x < In_NumCellsX && 
        CurrIntIndex.y >= 0 && CurrIntIndex.y < In_NumCellsY &&
        CurrIntIndex.z >= 0 && CurrIntIndex.z < In_NumCellsZ) 
        GetPreviousVector4Value_Emitter_BoundaryReader_AttributeSolidVelocity_Boundary(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
            GetPreviousFloatValue_Emitter_PressureReader_AttributePressure(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
            F_right = TmpFraction.x;
            F_up = TmpFraction.y;
            F_front = TmpFraction.z;
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
            F_left = TmpFraction.x;
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
            F_down = TmpFraction.y;
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
            F_back = TmpFraction.z;
            Out_BuoyancyForce += Pressure * FractionIntegral * FaceArea;
            float3 CurrUnitPos = (.5 + CurrIntIndex) / float3(In_NumCellsX, In_NumCellsY, In_NumCellsZ);
            float3 CurrWorldPos = mul(float4(CurrUnitPos, 1), In_UnitToWorld);
            float3 ForceDir = CurrWorldPos - In_WorldParticleCenter;
            //TmpForce = ForceDir  * Pressure * FractionIntegral * FaceArea;
            Out_RotationalForce += -TmpForce;
            debug a cell
            float ForceLength = length(Out_BuoyancyForce);
float3 Result28 = mul(float4(Context.MapUpdate.Particles.Position,1.0),Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.WorldToUnit).xyz;
Output11.x = Result28.x;
Output11.y = Result28.y;
Output11.z = Result28.z;
X = Context.MapUpdate.Particles.SpriteSize.x;
Y = Context.MapUpdate.Particles.SpriteSize.y;
float Constant61 = 0.5;
float Result29 = X * Constant61;
float Result30 = Result29 / Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx;
Output12.x = Context.MapUpdate.Particles.Position.x;
Output12.y = Context.MapUpdate.Particles.Position.y;
Output12.z = Context.MapUpdate.Particles.Position.z;
bool Constant62 = false;
float3 CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce;
float3 CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce;
CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_(Output11, Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx, Result30, Context.MapUpdate.Emitter.NumCellsX, Context.MapUpdate.Emitter.NumCellsY, Context.MapUpdate.Emitter.NumCellsZ, Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld, Output12, Context.MapUpdate.Particles.Mass, Constant62, CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce, CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce);
float3 Result31 = Context.MapUpdate.Transient.PhysicsForce + CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce;
float3 Result32 = Context.MapUpdate.Transient.PhysicsRotationalForce + CustomHlsl428C1BFE71BEAE7118FE90DF531A65BAA180EB30Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce;
bool Constant63 = true;
Context.MapUpdate.Transient.PhysicsForce = Result31;
Context.MapUpdate.Transient.PhysicsRotationalForce = Result32;
Context.MapUpdate.Transient.RotationalVelocityEnabled = Constant63;
int Constant100 = 0;
bool Result38 = NiagaraAll(In_SourceSpace == Constant100);
bool Result39 = NiagaraAll(In_DestinationSpace == Constant101);
bool Result40 = Result38 && Result39;
int Constant102 = 1;
bool Result41 = NiagaraAll(In_SourceSpace == Constant102);
int Constant103 = 1;
bool Result42 = NiagaraAll(In_DestinationSpace == Constant103);
bool Result43 = Result41 && Result42;
bool Result44 = Result40 || Result43;
int Constant104 = 2;
bool Result45 = NiagaraAll(In_SourceSpace == Constant104);
int Constant105 = 2;
bool Result46 = NiagaraAll(In_DestinationSpace == Constant105);
bool Result47 = Result45 && Result46;
bool Result48 = Result44 || Result47;
bool Result49 = Result38 && Result46;
bool Result50 = Result45 && Result39;
bool Result51 = Result49 || Result50;
bool Result52 = In_bLocalSpace && Result51;
bool Result53 = Result48 || Result52;
bool Result54 = !In_bLocalSpace;
bool Result55 = Result38 && Result42;
bool Result56 = Result41 && Result39;
bool Result57 = Result55 || Result56;
bool Result58 = Result54 && Result57;
bool Result59 = Result53 || Result58;
bool Result60 = In_bLocalSpace && Result55;
bool Result61 = Result45 && Result42;
bool Result62 = Result60 || Result61;
bool Result63 = Result54 && Result50;
bool Result64 = Result62 || Result63;
Out_bUseOriginal = Result59;
Out_LocalToWorld = Result64;
bool Constant99 = false;
Matrix_IfResult = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant99, TransformBase_Func_Output_bUseOriginal, TransformBase_Func_Output_OutTransform, TransformBase_Func_Output_LocalToWorld, Context);
float3 Result65 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform).xyz;
Vector_IfResult1 = In_InPosition;
Vector_IfResult1 = Result65;
Out_OutPosition = Vector_IfResult1;
bool Constant109 = false;
Matrix_IfResult2 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant109, TransformBase_Func_Output_bUseOriginal1, TransformBase_Func_Output_OutTransform1, TransformBase_Func_Output_LocalToWorld1, Context);
float3 Result66 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform1).xyz;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result66;
Out_OutVector = Vector_IfResult2;
bool Constant113 = false;
Matrix_IfResult3 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant113, TransformBase_Func_Output_bUseOriginal2, TransformBase_Func_Output_OutTransform2, TransformBase_Func_Output_LocalToWorld2, Context);
float3 Result67 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform2).xyz;
Vector_IfResult3 = In_InVector;
Vector_IfResult3 = Result67;
Out_OutVector = Vector_IfResult3;
float Result68 = length(In_SpriteSize);
float Constant115 = 0.5;
float Result69 = Result68 * Constant115;
Out_Radius = Result69;
float3 Result76 = In_Velocity - In_AdvectionVelocity;
float Result77 = In_Drag * In_InverseMass;
float Constant127 = (0.0);
float NiagaraFloat_SelectResult = Constant127;
NiagaraFloat_SelectResult = In_Drag;
NiagaraFloat_SelectResult = Result77;
float Constant128 = 0;
float Result78 = max(NiagaraFloat_SelectResult, Constant128);
float Result79 = Result78 * In_DeltaTime;
float Constant129 = 1;
float Result80 = Result79 + Constant129;
float3 Result81 = Result76 / Result80;
float3 Result82 = Result81 + In_AdvectionVelocity;
Out_Output = Result82;
float Result84 = dot(In_V,In_V);
float Result85 = In_Threshold * In_Threshold;
bool Result86 = NiagaraAll(Result84 < Result85);
float Result87 = length(In_Fallback);
float Result88 = rsqrt(Result84);
float3 Result89 = In_V * Result88;
float Result90 = Reciprocal(Result88);
float3 Constant132 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult1 = Constant132;
float Constant133 = (0.0);
float Length_SelectResult1 = Constant133;
Direction_SelectResult1 = In_Fallback;
Length_SelectResult1 = Result87;
Direction_SelectResult1 = Result89;
Length_SelectResult1 = Result90;
Out_Direction = Direction_SelectResult1;
Out_Length = Length_SelectResult1;
Out_BelowThreshold = Result86;
float QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface;
float3 QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient;
bool QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid;
QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_Query(In_Position, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid);
float3 Result96 = In_StartTrace - In_EndTrace;
float Result97 = length(Result96);
bool Result98 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface < Result97);
float Constant137 = 0;
bool Result99 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface < Constant137);
bool Result100 = !Result99;
bool Result101 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid && Result98 && Result100;
float3 Constant138 = float3(0,0,1);
float Constant139 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2;
DirectionAndLengthSafe_v1_0_Particle_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient, Constant138, Constant139, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2, Context);
float3 Result102 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface * DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2;
float3 Result103 = In_Position - Result102;
Out_Collides = Result101;
Out_ImpactPosition = Result103;
Out_ImpactNormal = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2;
Out_Insideamesh = Result99;
Out_DistanceFieldIsValid = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid;
Out_DistanceToSurface = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface;
float3 Result107 = -(In_PlaneNormal);
float3 Result108 = In_PlanePivotPoint - In_InitialSphereLocation;
float Result109 = dot(Result107,Result108);
float Result110 = Result109 - In_CollisionRadius;
float Constant145 = 0;
bool Result111 = NiagaraAll(Result110 < Constant145);
bool Constant146 = true;
float3 Result112 = Result107 * Result109;
float3 Result113 = Result112 + In_InitialSphereLocation;
float Result114 = max(In_MaxCorrectiondistance, Result110);
float3 Result115 = Result114 * Result107;
float3 Result116 = Result115 + In_InitialSphereLocation;
float Constant147 = 0;
float Constant148 = 0;
float3 Result117 = In_InitialSphereLocation + In_SpherePositionDelta;
float3 Result118 = In_PlanePivotPoint - Result117;
float Result119 = dot(Result107,Result118);
float Result120 = Result119 - In_CollisionRadius;
float Constant149 = 0;
bool Result121 = NiagaraAll(Result120 <= Constant149);
float Result122 = abs(Result120);
float Result123 = Result110 - Result120;
float Result124 = abs(Result123);
float Constant150 = 1e-06;
float Result125 = max(Result124, Constant150);
float Result126 = Result122 / Result125;
float Constant151 = 0;
bool Result127 = NiagaraAll(Result126 == Constant151);
bool Result128 = Result111 || Result127;
float Constant152 = 1;
float float_IfResult;
float_IfResult = Constant152;
float_IfResult = Result126;
float Result129 = 1 - float_IfResult;
float3 Result130 = Result129 * In_SpherePositionDelta;
float3 Result131 = In_InitialSphereLocation + Result130;
float3 Result132 = Result107 * In_CollisionRadius;
float3 Result133 = Result131 + Result132;
float3 Result134 = Result133 - Result131;
float Result135 = In_PhysicsDeltaTime * Result129;
float Result136 = In_PhysicsDeltaTime * float_IfResult;
bool Collides_IfResult;
float3 IntersectionLocation_IfResult;
float3 PreASC45IntersectionSphereCenterLocation_IfResult;
float3 InitialPositionRelativeCollisionLocation_IfResult;
float TimeElapsedToCollision_IfResult;
float RemainingTimePostCollision_IfResult;
float PercentageofTimeUsedToPerformCollision_IfResult;
float InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision_IfResult;
float UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane_IfResult;
Collides_IfResult = Constant146;
IntersectionLocation_IfResult = Result113;
PreASC45IntersectionSphereCenterLocation_IfResult = Result116;
InitialPositionRelativeCollisionLocation_IfResult = Result112;
TimeElapsedToCollision_IfResult = Constant147;
RemainingTimePostCollision_IfResult = In_PhysicsDeltaTime;
PercentageofTimeUsedToPerformCollision_IfResult = Constant148;
InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision_IfResult = Result110;
UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane_IfResult = Result120;
Collides_IfResult = Result121;
IntersectionLocation_IfResult = Result133;
PreASC45IntersectionSphereCenterLocation_IfResult = Result131;
InitialPositionRelativeCollisionLocation_IfResult = Result134;
TimeElapsedToCollision_IfResult = Result135;
RemainingTimePostCollision_IfResult = Result136;
PercentageofTimeUsedToPerformCollision_IfResult = Result129;
Out_Collides = Collides_IfResult;
Out_IntersectionLocation = IntersectionLocation_IfResult;
Out_PreASC45IntersectionSphereCenterLocation = PreASC45IntersectionSphereCenterLocation_IfResult;
Out_InitialPositionRelativeCollisionLocation = InitialPositionRelativeCollisionLocation_IfResult;
Out_TimeElapsedToCollision = TimeElapsedToCollision_IfResult;
Out_RemainingTimePostCollision = RemainingTimePostCollision_IfResult;
Out_PercentageofTimeUsedToPerformCollision = PercentageofTimeUsedToPerformCollision_IfResult;
Out_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision = InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision_IfResult;
Out_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane = UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane_IfResult;
bool Constant168 = false;
int Constant169 = 0;
bool Result152 = NiagaraAll(In_RandomnessMode == Constant169);
bool Result153 = Constant168 && Result152;
bool Result154 = NiagaraAll(In_RandomnessMode == Constant170);
bool Result155 = Result153 || Result154;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapUpdate.Emitter.RandomSeed;
int Constant171 = 0;
int Seed1_IfResult;
int Seed2_IfResult;
int Seed3_IfResult;
Seed1_IfResult = Seed_IfResult;
Seed2_IfResult = Constant171;
Seed3_IfResult = Constant172;
Seed1_IfResult = Context.MapUpdate.Particles.UniqueID;
Seed2_IfResult = Context.MapUpdate.Engine.System.TickCount;
Seed3_IfResult = Seed_IfResult;
int Constant173 = -1;
int Constant174 = -1;
int Constant175 = -1;
int Seed1_IfResult1;
int Seed2_IfResult1;
int Seed3_IfResult1;
Seed1_IfResult1 = Seed1_IfResult;
Seed2_IfResult1 = Seed2_IfResult;
Seed3_IfResult1 = Seed3_IfResult;
Seed1_IfResult1 = Constant173;
Seed2_IfResult1 = Constant174;
Seed3_IfResult1 = Constant175;
NiagaraRandInfo Output15;
Output15.Seed1 = Seed1_IfResult1;
Output15.Seed2 = Seed2_IfResult1;
Output15.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output15;
Out_UseDeterministicRandoms = Result155;
int Constant163 = (0);
bool Constant164 = false;
int Constant165 = 0;
int Constant166 = (0);
bool Constant167 = false;
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant163, In_OverrideSeed, Constant165, Constant166, Constant167, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float2 Result156 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed1;
Seed2 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed2;
Seed3 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed3;
float2 Result157 = rand_float(Result156, Seed1, Seed2, Seed3);
float2 Result158 = rand_float(Result156);
float2 Random_IfResult;
Random_IfResult = Result157;
Random_IfResult = Result158;
float2 Result159 = In_Min + Random_IfResult;
Out_Result = Result159;
// From UE::Math::FindBetween_Helper()
const float NormAB = sqrt(dot(In_From, In_From) * dot(In_To, In_To));
float W = NormAB + dot(In_From, In_To);
float4 ValidResult = float4(cross(In_From, In_To), W);
float4 FallbackX = float4(-In_From.z, 0.0f, In_From.x, 0.0f);
float4 FallbackY = float4(0.0f, -In_From.z, In_From.y, 0.0f);
float4 Identity = float4(0.0f, 0.0f, 0.0f, 1.0f);
const float Epsilon = 1e-6f;
    Out_Result = FallbackX;
    Out_Result = FallbackY;
    Out_Result = ValidResult;
    Out_Result = Identity;
    // normalize the quat before returning
    Out_Result = normalize(Out_Result);
float3 Constant182 = float3(1,0,0);
float Constant183 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction4;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length4;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold4;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_From, Constant182, Constant183, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction4, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length4, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold4, Context);
float3 Constant184 = float3(1,0,0);
float Constant185 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction5;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length5;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold5;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_To, Constant184, Constant185, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction5, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length5, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold5, Context);
float4 CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction4, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction5, CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result);
Out_NewOutput = CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
float3 Output0;
Output0.x = In_Quaternion.x;
Output0.y = In_Quaternion.y;
Output0.z = In_Quaternion.z;
Output16 = In_Quaternion.w;
float Result171 = dot(Output0,In_VECTOR_VAR);
float Constant186 = 2;
float Result172 = Result171 * Constant186;
float3 Result173 = Output0 * Result172;
float Result174 = Output16 * Output16;
float Result175 = dot(Output0,Output0);
float Result176 = Result174 - Result175;
float3 Result177 = Result176 * In_VECTOR_VAR;
float3 Result178 = Result173 + Result177;
float3 Result179 = cross(Output0,In_VECTOR_VAR);
float Constant187 = 2;
float Result180 = Output16 * Constant187;
float3 Result181 = Result179 * Result180;
float3 Result182 = Result178 + Result181;
Out_Vector = Result182;
float Constant157 = 0;
float Constant158 = 1;
float Result150 = clamp(In_Spread,Constant157,Constant158);
float Constant159 = -1;
float Result151 = Result150 * Constant159;
float2 Output13;
Output13.x = Result151;
Output13.y = Result151;
float2 Output14;
Output14.x = Result150;
Output14.y = Result150;
int Constant160 = -1;
int Constant161 = 0;
bool Constant162 = false;
float2 RandomRangeFloat_Func_Output_Result;
RandomRangeFloat_Func_(Output13, Output14, Constant160, Constant161, Constant162, RandomRangeFloat_Func_Output_Result, Context);
X1 = RandomRangeFloat_Func_Output_Result.x;
Y1 = RandomRangeFloat_Func_Output_Result.y;
float3 Constant176 = float3(1,0,0);
float3 Result160 = X1 * Constant176;
float3 Constant177 = float3(0,1,0);
float3 Result161 = Y1 * Constant177;
float3 Result162 = Result160 + Result161;
float Result163 = abs(X1);
float Result164 = abs(Y1);
float Result165 = max(Result163, Result164);
float Result166 = 1 - Result165;
float3 Constant178 = float3(0,0,1);
float3 Result167 = Result166 * Constant178;
float3 Result168 = Result162 + Result167;
float3 Result169 = normalize(Result168);
float3 Result170 = Result169 * In_Scale;
float3 Constant179 = float3(0,0,1);
float3 Constant180 = float3(0,0,1);
float Constant181 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction3;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length3;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold3;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_ConeAxis, Constant180, Constant181, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction3, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length3, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold3, Context);
float4 FindQuatBetween_v1_0_Func_Output_NewOutput;
FindQuatBetween_v1_0_Func_(Constant179, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction3, FindQuatBetween_v1_0_Func_Output_NewOutput, Context);
float3 MultiplyVectorWithQuaternion_Func_Output_Vector;
MultiplyVectorWithQuaternion_Func_(Result170, FindQuatBetween_v1_0_Func_Output_NewOutput, MultiplyVectorWithQuaternion_Func_Output_Vector, Context);
Out_Ouput = MultiplyVectorWithQuaternion_Func_Output_Vector;
float Result183 = dot(In_InVector,In_Normal);
float Result184 = Result183 + Result183;
float3 Result185 = Result184 * In_Normal;
float3 Result186 = In_InVector - Result185;
Out_Reflected = Result186;
float Constant188 = 0.01;
float3 Result187 = In_INPUT_VAR * Constant188;
float Constant189 = 100;
float3 Result188 = In_INPUT_VAR * Constant189;
Out_CentimeterstoMeters = Result187;
Out_MeterstoCentimeters = Result188;
float Result193 = dot(In_VECTOR_VAR,In_VECTOR_VAR);
float Result194 = In_Threshold * In_Threshold;
bool Result195 = NiagaraAll(Result193 < Result194);
float Result196 = length(In_FallbackVector);
float Result197 = rsqrt(Result193);
float3 Result198 = In_VECTOR_VAR * Result197;
float Result199 = Reciprocal(Result197);
float3 Constant194 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult2 = Constant194;
float Constant195 = (0.0);
float Length_SelectResult2 = Constant195;
Direction_SelectResult2 = In_FallbackVector;
Length_SelectResult2 = Result196;
Direction_SelectResult2 = Result198;
Length_SelectResult2 = Result199;
Out_Direction = Direction_SelectResult2;
Out_Length = Length_SelectResult2;
Out_BelowThreshold = Result195;
float Result192 = dot(In_VECTOR_VAR,In_Normal);
float3 Constant192 = float3(0,0,0);
float Constant193 = 1e-05;
float3 DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction;
float DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length;
bool DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold;
DirectionAndLengthSafe_v1_1_Particle_Func_(In_Normal, Constant192, Constant193, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold, Context);
float3 Constant196 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult3 = Constant196;
Vector3f_SelectResult3 = DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction;
Vector3f_SelectResult3 = In_Normal;
float3 Result200 = Result192 * Vector3f_SelectResult3;
float3 Result201 = In_VECTOR_VAR - Result200;
Out_Ouput = Result201;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleInitialDataInstanceAlive = Context.MapUpdate.DataInstance.Alive;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_PredictedParticlePositionForSimStages = Context.MapUpdate.Transient.Collision_PredictedParticlePositionForSimStages;
Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime = Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float Result72 = Reciprocal(Context.MapUpdate.Transient.Collision_ParticleMassReplacement);
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement;
Context.MapUpdate.Transient.Collision_ParticleMassReplacement = Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement = Result72;
float3 Result73 = Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 Result74 = Result73 * Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float3 Result75 = Result74 + Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
float3 DragVelocity_Particle_Func_Output_Output;
DragVelocity_Particle_Func_(Result75, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, DragVelocity_Particle_Func_Output_Output, Context);
float3 Result83 = DragVelocity_Particle_Func_Output_Output * Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleInitialForceDividedByMass = Result73;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution = Result74;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate = Result83;
float3 Constant130 = float3(0,0,-1);
float Constant131 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution, Constant130, Constant131, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceVector = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceDirection = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float3 Result91 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction * Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius;
float3 Result92 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin - Result91;
float3 Result93 = Result91 + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
float3 Constant134 = float3(0,0,-1);
float Constant135 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result93, Constant134, Constant135, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1, Context);
float3 Result94 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1 * DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1;
float3 Result95 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin + Result94;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart = Result92;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd = Result95;
int Constant136 = 0;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
float3 Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
float3 Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid;
float Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface;
Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_(Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface, Context);
float Constant140 = 0;
bool Result104 = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh && Context.MapUpdate.Collision.CollisionQueryAndResponse.KillParticlesLodgedWithinMeshes && Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionEnabled;
bool Result105 = !Result104;
bool Result106 = Context.MapUpdate.DataInstance.Alive && Result105;
bool Constant142 = true;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse.CollisionID = Constant136;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedFriction = Constant140;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedRestitution = Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient;
Context.MapUpdate.DataInstance.Alive = Result106;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.ModuleDepthBasedCollisionParticleOccluded = Constant141;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.ParticleOnScreen = Constant142;
float3 Constant143 = float3(0,0,1);
float3 Constant144 = float3(0,0,-1e+16);
float3 PlaneNormal_IfResult;
float3 PlanePivotPoint_IfResult;
PlaneNormal_IfResult = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult = Constant143;
PlanePivotPoint_IfResult = Constant144;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal = PlaneNormal_IfResult;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlanePivotPoint = PlanePivotPoint_IfResult;
bool PlaneSphereCollisionDetection_Func_Output_Collides;
float3 PlaneSphereCollisionDetection_Func_Output_IntersectionLocation;
float3 PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation;
float3 PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation;
float PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision;
float PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision;
float PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision;
float PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
float PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
PlaneSphereCollisionDetection_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius, Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Collision.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance, PlaneSphereCollisionDetection_Func_Output_Collides, PlaneSphereCollisionDetection_Func_Output_IntersectionLocation, PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation, PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation, PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision, PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision, PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision, PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = PlaneSphereCollisionDetection_Func_Output_IntersectionLocation;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTickDeltaForThisCollisionUpdate = PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePhysicsDeltaTime = PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePercentageOfTickDedicatedToUpdatingPosition = PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance = PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
Context.MapUpdate.Transient.CollisionDistanceToCollision = PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
float Constant153 = 0;
bool Result137 = NiagaraAll(Context.MapUpdate.Transient.CollisionDistanceToCollision <= Constant153);
bool Result138 = Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionEnabled && Result137;
bool Result139 = Result138 || Context.MapUpdate.Particles.HasCollided;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.PhysicsCollidesThisFrame = Result138;
Context.MapUpdate.Particles.HasCollided = Result139;
float3 Result140 = -(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal);
float Result141 = dot(Result140,Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate);
float Result142 = Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime * Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float3 Result143 = Result142 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleInitialForceDividedByMass;
float Result144 = dot(Result140,Result143);
float Result145 = Result141 - Result144;
float Constant154 = 0.1;
bool Result146 = NiagaraAll(Result145 < Constant154);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleRemoveRestitution = Result146;
float3 Result147 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate / Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float float_IfResult1;
float_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePhysicsDeltaTime;
float_IfResult1 = Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float Constant155 = 0;
float float_IfResult2;
float_IfResult2 = Constant155;
float_IfResult2 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedRestitution;
Context.MapUpdate.Transient.CollisionValid = Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.PhysicsCollidesThisFrame;
Context.MapUpdate.Transient.CollisionSize = Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius;
Context.MapUpdate.Transient.CollisionNormal = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal;
Context.MapUpdate.Transient.CollisionVelocity = Result147;
Context.MapUpdate.Transient.CollisionFriction = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedFriction;
Context.MapUpdate.Transient.PhysicsDeltaTime = float_IfResult1;
Context.MapUpdate.Transient.CollisionRestitution = float_IfResult2;
bool Result148 = !Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleRemoveRestitution;
bool Result149 = Result148 && Context.MapUpdate.Collision.CollisionQueryAndResponse.RandomizeCollisionNormal;
float Constant156 = 1;
float3 RandomizeCollisionNormals_Func_Output_Ouput;
RandomizeCollisionNormals_Func_(Context.MapUpdate.Transient.CollisionNormal, Constant156, Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage, RandomizeCollisionNormals_Func_Output_Ouput, Context);
Vector_IfResult4 = RandomizeCollisionNormals_Func_Output_Ouput;
Vector_IfResult4 = Context.MapUpdate.Transient.CollisionNormal;
float3 ReflectVector_Func_Output_Reflected;
ReflectVector_Func_(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult4, ReflectVector_Func_Output_Reflected, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity = ReflectVector_Func_Output_Reflected;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters;
CentimeterMeterConversion_Func_(Context.MapUpdate.Transient.CollisionVelocity, CentimeterMeterConversion_Func_Output_CentimeterstoMeters, CentimeterMeterConversion_Func_Output_MeterstoCentimeters, Context);
float3 Result189 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * CentimeterMeterConversion_Func_Output_CentimeterstoMeters;
float Constant190 = -1;
float3 Result190 = Result189 * Constant190;
float Result191 = dot(Result190,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons = Result191;
bool Constant191 = false;
float3 ProjectVectorOnPlane_Particle_Func_Output_Ouput;
ProjectVectorOnPlane_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant191, ProjectVectorOnPlane_Particle_Func_Output_Ouput, Context);
float3 Constant197 = float3(0,0,0);
float Constant198 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length6;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold6;
DirectionAndLengthSafe_v1_0_Particle_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput, Constant197, Constant198, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length6, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold6, Context);
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters1;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters1;
CentimeterMeterConversion_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput, CentimeterMeterConversion_Func_Output_CentimeterstoMeters1, CentimeterMeterConversion_Func_Output_MeterstoCentimeters1, Context);
float3 Result202 = CentimeterMeterConversion_Func_Output_CentimeterstoMeters1 * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float Constant199 = 0;
float float_IfResult3;
float_IfResult3 = Constant199;
float_IfResult3 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length6;
bool Result203 = NiagaraAll(float_IfResult3 > Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionEngagementSpeed);
float float_IfResult4;
float_IfResult4 = Context.MapUpdate.Collision.CollisionQueryAndResponse.DynamicFrictionCoefficient;
float_IfResult4 = Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionCoefficient;
float float_IfResult5;
float_IfResult5 = float_IfResult4;
float_IfResult5 = Context.MapUpdate.Collision.CollisionQueryAndResponse.BounceCollisionFriction;
float3 Result204 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6 * float_IfResult5 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons;
float3 Result205 = Result202 - Result204;
float3 Constant200 = float3(0,0,0);
float Constant201 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction7;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length7;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold7;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result205, Constant200, Constant201, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction7, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length7, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold7, Context);
float Result206 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6,DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction7);
float Constant202 = 0;
bool Result207 = NiagaraAll(Result206 <= Constant202);
Vector_IfResult5 = Result202;
Vector_IfResult5 = Result204;
float Constant203 = -1;
float3 Result208 = Vector_IfResult5 * Constant203;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons = Result208;
float3 Result209 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters2;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters2;
CentimeterMeterConversion_Func_(Result209, CentimeterMeterConversion_Func_Output_CentimeterstoMeters2, CentimeterMeterConversion_Func_Output_MeterstoCentimeters2, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector = CentimeterMeterConversion_Func_Output_MeterstoCentimeters2;
float3 Result210 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector;
float Result211 = dot(Context.MapUpdate.Transient.CollisionNormal,Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity);
float3 Result212 = Context.MapUpdate.Transient.CollisionNormal * Result211;
float Result213 = 1 - Context.MapUpdate.Transient.CollisionRestitution;
float3 Result214 = Result212 * Result213;
float3 Result215 = Result210 - Result214;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocityWithFrictionApplied = Result215;
float3 Particleposition_IfResult;
Particleposition_IfResult = Context.MapUpdate.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult;
float3 Constant204 = float3(0,0,1);
float Constant205 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction8;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length8;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold8;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant204, Constant205, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction8, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length8, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold8, Context);
float Result216 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction8,Context.MapUpdate.Transient.CollisionNormal);
float Constant206 = 0;
bool Result217 = NiagaraAll(Result216 < Constant206);
bool Result218 = Result217 && Context.MapUpdate.Transient.CollisionValid;
float3 Constant207 = float3(0,0,0);
float3 physicsforce_IfResult;
float3 Velocity_IfResult;
physicsforce_IfResult = Constant207;
Velocity_IfResult = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocityWithFrictionApplied;
physicsforce_IfResult = Context.MapUpdate.Transient.PhysicsForce;
Velocity_IfResult = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Velocity_IfResult;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = physicsforce_IfResult;
Out_ModuleTraceWorldStart = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart;
Out_ModuleTraceWorldEnd = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd;
Out_CollisionPosition = Context.MapUpdate.Transient.CollisionWorldPosition;
Out_CollisionNormal = Context.MapUpdate.Transient.CollisionNormal;
Out_Collided = Context.MapUpdate.Transient.CollisionValid;
float QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface;
float3 QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient;
bool QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid;
QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_Query(In_Position, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid);
float3 Result229 = In_StartTrace - In_EndTrace;
float Result230 = length(Result229);
bool Result231 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface < Result230);
float Constant216 = 0;
bool Result232 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface < Constant216);
bool Result233 = !Result232;
bool Result234 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid && Result231 && Result233;
float3 Constant217 = float3(0,0,1);
float Constant218 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length11;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold11;
DirectionAndLengthSafe_v1_0_Particle_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient, Constant217, Constant218, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length11, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold11, Context);
float3 Result235 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface * DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11;
float3 Result236 = In_Position - Result235;
Out_Collides = Result234;
Out_ImpactPosition = Result236;
Out_ImpactNormal = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11;
Out_Insideamesh = Result232;
Out_DistanceFieldIsValid = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid;
Out_DistanceToSurface = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleInitialDataInstanceAlive = Context.MapUpdate.DataInstance.Alive;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float Result219 = Reciprocal(Context.MapUpdate.Transient.Collision_ParticleMassReplacement);
Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement = Result219;
float3 Result220 = Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 Result221 = Result220 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float3 Result222 = Result221 + Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
float3 DragVelocity_Particle_Func_Output_Output1;
DragVelocity_Particle_Func_(Result222, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, DragVelocity_Particle_Func_Output_Output1, Context);
float3 Result223 = DragVelocity_Particle_Func_Output_Output1 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass = Result220;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleForceContribution = Result221;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate = Result223;
float3 Constant211 = float3(0,0,-1);
float Constant212 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length9;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold9;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Constant211, Constant212, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length9, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold9, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceVector = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceDirection = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9;
float3 Result224 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius;
float3 Result225 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin - Result224;
float3 Result226 = Result224 + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
float3 Constant213 = float3(0,0,-1);
float Constant214 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction10;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length10;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold10;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result226, Constant213, Constant214, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction10, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length10, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold10, Context);
float3 Result227 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction10 * DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length10;
float3 Result228 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin + Result227;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart = Result225;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd = Result228;
int Constant215 = 0;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
float3 Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
float3 Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid;
float Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface;
Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_(Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface, Context);
float Constant219 = 0;
bool Result237 = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh && Context.MapUpdate.Collision.CollisionQueryAndResponse001.KillParticlesLodgedWithinMeshes && Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionEnabled;
bool Result238 = !Result237;
bool Result239 = Context.MapUpdate.DataInstance.Alive && Result238;
bool Constant220 = false;
bool Constant221 = true;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse001.CollisionID = Constant215;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedFriction = Constant219;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedRestitution = Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient;
Context.MapUpdate.DataInstance.Alive = Result239;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.ModuleDepthBasedCollisionParticleOccluded = Constant220;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.ParticleOnScreen = Constant221;
float3 Constant222 = float3(0,0,1);
float3 Constant223 = float3(0,0,-1e+16);
float3 PlaneNormal_IfResult1;
float3 PlanePivotPoint_IfResult1;
PlaneNormal_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult1 = Constant222;
PlanePivotPoint_IfResult1 = Constant223;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal = PlaneNormal_IfResult1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlanePivotPoint = PlanePivotPoint_IfResult1;
bool PlaneSphereCollisionDetection_Func_Output_Collides1;
float3 PlaneSphereCollisionDetection_Func_Output_IntersectionLocation1;
float3 PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation1;
float3 PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation1;
float PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision1;
float PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision1;
float PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision1;
float PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
float PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
PlaneSphereCollisionDetection_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius, Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance, PlaneSphereCollisionDetection_Func_Output_Collides1, PlaneSphereCollisionDetection_Func_Output_IntersectionLocation1, PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation1, PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation1, PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision1, PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision1, PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision1, PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1, PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = PlaneSphereCollisionDetection_Func_Output_IntersectionLocation1;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation1;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTickDeltaForThisCollisionUpdate = PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePhysicsDeltaTime = PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePercentageOfTickDedicatedToUpdatingPosition = PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision1;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance = PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
Context.MapUpdate.Transient.CollisionDistanceToCollision = PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
float Constant224 = 0;
bool Result240 = NiagaraAll(Context.MapUpdate.Transient.CollisionDistanceToCollision <= Constant224);
bool Result241 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionEnabled && Result240;
bool Result242 = Result241 || Context.MapUpdate.Particles.HasCollided;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.PhysicsCollidesThisFrame = Result241;
Context.MapUpdate.Particles.HasCollided = Result242;
float3 Result243 = -(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal);
float Result244 = dot(Result243,Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate);
float Result245 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float3 Result246 = Result245 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass;
float Result247 = dot(Result243,Result246);
float Result248 = Result244 - Result247;
float Constant225 = 0.1;
bool Result249 = NiagaraAll(Result248 < Constant225);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleRemoveRestitution = Result249;
float3 Result250 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate / Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float float_IfResult6;
float_IfResult6 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePhysicsDeltaTime;
float_IfResult6 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float Constant226 = 0;
float float_IfResult7;
float_IfResult7 = Constant226;
float_IfResult7 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedRestitution;
Context.MapUpdate.Transient.CollisionValid = Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.PhysicsCollidesThisFrame;
Context.MapUpdate.Transient.CollisionSize = Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius;
Context.MapUpdate.Transient.CollisionNormal = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal;
Context.MapUpdate.Transient.CollisionVelocity = Result250;
Context.MapUpdate.Transient.CollisionFriction = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedFriction;
Context.MapUpdate.Transient.PhysicsDeltaTime = float_IfResult6;
Context.MapUpdate.Transient.CollisionRestitution = float_IfResult7;
bool Result251 = !Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleRemoveRestitution;
bool Result252 = Result251 && Context.MapUpdate.Collision.CollisionQueryAndResponse001.RandomizeCollisionNormal;
float Constant227 = 1;
float3 RandomizeCollisionNormals_Func_Output_Ouput1;
RandomizeCollisionNormals_Func_(Context.MapUpdate.Transient.CollisionNormal, Constant227, Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage, RandomizeCollisionNormals_Func_Output_Ouput1, Context);
float3 Vector_IfResult6;
Vector_IfResult6 = RandomizeCollisionNormals_Func_Output_Ouput1;
Vector_IfResult6 = Context.MapUpdate.Transient.CollisionNormal;
float3 ReflectVector_Func_Output_Reflected1;
ReflectVector_Func_(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult6, ReflectVector_Func_Output_Reflected1, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity = ReflectVector_Func_Output_Reflected1;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters3;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters3;
CentimeterMeterConversion_Func_(Context.MapUpdate.Transient.CollisionVelocity, CentimeterMeterConversion_Func_Output_CentimeterstoMeters3, CentimeterMeterConversion_Func_Output_MeterstoCentimeters3, Context);
float3 Result253 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * CentimeterMeterConversion_Func_Output_CentimeterstoMeters3;
float Constant228 = -1;
float3 Result254 = Result253 * Constant228;
float Result255 = dot(Result254,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons = Result255;
bool Constant229 = false;
float3 ProjectVectorOnPlane_Particle_Func_Output_Ouput1;
ProjectVectorOnPlane_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant229, ProjectVectorOnPlane_Particle_Func_Output_Ouput1, Context);
float3 Constant230 = float3(0,0,0);
float Constant231 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction12;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length12;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold12;
DirectionAndLengthSafe_v1_0_Particle_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput1, Constant230, Constant231, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction12, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length12, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold12, Context);
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters4;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters4;
CentimeterMeterConversion_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput1, CentimeterMeterConversion_Func_Output_CentimeterstoMeters4, CentimeterMeterConversion_Func_Output_MeterstoCentimeters4, Context);
float3 Result256 = CentimeterMeterConversion_Func_Output_CentimeterstoMeters4 * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float Constant232 = 0;
float float_IfResult8;
float_IfResult8 = Constant232;
float_IfResult8 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length12;
bool Result257 = NiagaraAll(float_IfResult8 > Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed);
float float_IfResult9;
float_IfResult9 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DynamicFrictionCoefficient;
float_IfResult9 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionCoefficient;
float float_IfResult10;
float_IfResult10 = float_IfResult9;
float_IfResult10 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.BounceCollisionFriction;
float3 Result258 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction12 * float_IfResult10 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons;
float3 Result259 = Result256 - Result258;
float3 Constant233 = float3(0,0,0);
float Constant234 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction13;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length13;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold13;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result259, Constant233, Constant234, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction13, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length13, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold13, Context);
float Result260 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction12,DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction13);
float Constant235 = 0;
bool Result261 = NiagaraAll(Result260 <= Constant235);
float3 Vector_IfResult7;
Vector_IfResult7 = Result256;
Vector_IfResult7 = Result258;
float Constant236 = -1;
float3 Result262 = Vector_IfResult7 * Constant236;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons = Result262;
float3 Result263 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters5;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters5;
CentimeterMeterConversion_Func_(Result263, CentimeterMeterConversion_Func_Output_CentimeterstoMeters5, CentimeterMeterConversion_Func_Output_MeterstoCentimeters5, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector = CentimeterMeterConversion_Func_Output_MeterstoCentimeters5;
float3 Result264 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector;
float Result265 = dot(Context.MapUpdate.Transient.CollisionNormal,Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity);
float3 Result266 = Context.MapUpdate.Transient.CollisionNormal * Result265;
float Result267 = 1 - Context.MapUpdate.Transient.CollisionRestitution;
float3 Result268 = Result266 * Result267;
float3 Result269 = Result264 - Result268;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied = Result269;
float3 Particleposition_IfResult1;
Particleposition_IfResult1 = Context.MapUpdate.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult1 = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult1;
float3 Constant237 = float3(0,0,1);
float Constant238 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction14;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length14;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold14;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant237, Constant238, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction14, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length14, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold14, Context);
float Result270 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction14,Context.MapUpdate.Transient.CollisionNormal);
float Constant239 = 0;
bool Result271 = NiagaraAll(Result270 < Constant239);
bool Result272 = Result271 && Context.MapUpdate.Transient.CollisionValid;
float3 Constant240 = float3(0,0,0);
float3 physicsforce_IfResult1;
float3 Velocity_IfResult1;
physicsforce_IfResult1 = Constant240;
Velocity_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied;
physicsforce_IfResult1 = Context.MapUpdate.Transient.PhysicsForce;
Velocity_IfResult1 = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Velocity_IfResult1;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = physicsforce_IfResult1;
Out_ModuleTraceWorldStart = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart;
Out_ModuleTraceWorldEnd = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd;
bool Constant272 = false;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant272, TransformBase_Func_Output_bUseOriginal3, TransformBase_Func_Output_OutTransform3, TransformBase_Func_Output_LocalToWorld3, Context);
float3 Result300 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult10;
Vector_IfResult10 = In_InVector;
Vector_IfResult10 = Result300;
Out_OutVector = Vector_IfResult10;
bool Constant277 = false;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult4, Constant277, TransformBase_Func_Output_bUseOriginal4, TransformBase_Func_Output_OutTransform4, TransformBase_Func_Output_LocalToWorld4, Context);
float3 Result303 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult11;
Vector_IfResult11 = In_InPosition;
Vector_IfResult11 = Result303;
Out_OutPosition = Vector_IfResult11;
bool Constant281 = false;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult5, Constant281, TransformBase_Func_Output_bUseOriginal5, TransformBase_Func_Output_OutTransform5, TransformBase_Func_Output_LocalToWorld5, Context);
float3 Result304 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult12;
Vector_IfResult12 = In_InVector;
Vector_IfResult12 = Result304;
Out_OutVector = Vector_IfResult12;
int Constant93 = 1;
int Constant94 = 1;
int Result33 = max(Constant93, Constant94);
bool Result34 = NiagaraAll(Context.MapUpdate.Particles.NumberOfCollisions >= Result33);
bool Result35 = Result34 && Context.MapUpdate.Collision.EnableRestState && Context.MapUpdate.Collision.EnableMaxCollisionCount;
bool Result36 = Result35 || Context.MapUpdate.Transient.CollisionIsResting || Context.MapUpdate.Collision.ManuallyEnterRest;
Context.MapUpdate.Local.Collision.ManuallyEnterRest = Result36;
float Constant95 = 0.001;
float Result37 = max(Context.MapUpdate.Collision.ParticleMass, Constant95);
Context.MapUpdate.Transient.Collision_ParticleMassReplacement = Result37;
Context.MapUpdate.OUTPUT_VAR.Collision.IncomingCollisionVelocity = Context.MapUpdate.Particles.Velocity;
int Constant97 = 1;
bool Constant98 = false;
float3 Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Collision_TransformPosition007_Emitter_Func_(Context.MapUpdate.Particles.Position, Constant96, Constant97, Constant98, Collision_TransformPosition007_Emitter_Func_Output_OutPosition, Context);
int Constant107 = 1;
bool Constant108 = false;
float3 Collision_TransformVector009_Emitter_Func_Output_OutVector;
Collision_TransformVector009_Emitter_Func_(Context.MapUpdate.Particles.Velocity, Constant106, Constant107, Constant108, Collision_TransformVector009_Emitter_Func_Output_OutVector, Context);
int Constant110 = 0;
int Constant111 = 1;
bool Constant112 = false;
float3 Collision_TransformVector010_Emitter_Func_Output_OutVector;
Collision_TransformVector010_Emitter_Func_(Context.MapUpdate.Collision.PhysicsForce, Constant110, Constant111, Constant112, Collision_TransformVector010_Emitter_Func_Output_OutVector, Context);
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Local.Collision.InputPositionPassthrough_NeededForSimStageExecution = Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector009_Emitter_Func_Output_OutVector;
Context.MapUpdate.Local.Collision.InputVelocityPassthrough_NeededForSimStageExecution = Collision_TransformVector009_Emitter_Func_Output_OutVector;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = Collision_TransformVector010_Emitter_Func_Output_OutVector;
Context.MapUpdate.Local.Collision.InputForcePassthrough_NeededForSimStageExecution = Collision_TransformVector010_Emitter_Func_Output_OutVector;
float Constant114 = 1;
float CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_Output_Radius;
CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_(Context.MapUpdate.Particles.SpriteSize, CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_Output_Radius, Context);
float Result70 = Constant114 * CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_Output_Radius;
float Constant116 = 1e-06;
float Result71 = max(Result70, Constant116);
Context.MapUpdate.Local.Collision.ModuleParticleRadius = Result71;
float Constant117 = 0;
float Constant118 = 0;
float Constant119 = 0;
float Constant120 = 0;
float Constant121 = 0.1;
float Constant122 = 0;
float Constant123 = -999999;
Context.MapUpdate.Collision.CollisionQueryAndResponse.DynamicFrictionCoefficient = Constant117;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.DynamicFrictionCoefficient = Constant117;
Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionCoefficient = Constant118;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionCoefficient = Constant118;
Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionEngagementSpeed = Constant119;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed = Constant119;
Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius = Context.MapUpdate.Local.Collision.ModuleParticleRadius;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius = Context.MapUpdate.Local.Collision.ModuleParticleRadius;
Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient = Constant120;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient = Constant120;
Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage = Constant121;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage = Constant121;
Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionEnabled = Context.MapUpdate.Collision.CollisionEnabled;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionEnabled = Context.MapUpdate.Collision.CollisionEnabled;
Context.MapUpdate.Collision.CollisionQueryAndResponse.RandomizeCollisionNormal = Context.MapUpdate.Collision.RandomizeCollisionNormalVector;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.RandomizeCollisionNormal = Context.MapUpdate.Collision.RandomizeCollisionNormalVector;
Context.MapUpdate.Collision.CollisionQueryAndResponse.UpdateRotationalVelocity = Context.MapUpdate.Local.Collision.UpdateMeshRotation;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.UpdateRotationalVelocity = Context.MapUpdate.Local.Collision.UpdateMeshRotation;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.BounceCollisionFriction = Constant122;
Context.MapUpdate.Collision.CollisionQueryAndResponse.BounceCollisionFriction = Constant122;
Context.MapUpdate.Collision.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance = Constant123;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance = Constant123;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.KillParticlesLodgedWithinMeshes = Context.MapUpdate.Collision.KillParticlesLodgedWithinMeshes;
Context.MapUpdate.Collision.CollisionQueryAndResponse.KillParticlesLodgedWithinMeshes = Context.MapUpdate.Collision.KillParticlesLodgedWithinMeshes;
Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float Constant124 = 1;
Context.MapUpdate.Collision.CollisionQueryAndResponse.TraceVectorLengthMultiplier = Constant124;
float Constant125 = 1e+10;
Context.MapUpdate.Collision.CollisionQueryAndResponse.MaxTraceLength = Constant125;
int Constant126 = 0;
Context.MapUpdate.Collision.CollisionQueryAndResponse.CPUFrictionMergeType = Constant126;
float3 Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldStart;
float3 Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldEnd;
float3 Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionPosition;
float3 Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionNormal;
bool Collision_CollisionQueryAndResponse_Emitter_Func_Output_Collided;
Collision_CollisionQueryAndResponse_Emitter_Func_(Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldStart, Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionPosition, Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionNormal, Collision_CollisionQueryAndResponse_Emitter_Func_Output_Collided, Context);
Context.MapUpdate.Local.Collision.ModuleTraceWorldStart1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldStart;
Context.MapUpdate.Local.Collision.ModuleTraceWorldEnd1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldEnd;
Context.MapUpdate.Local.Collision.DebugCollisionPosition1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionPosition;
Context.MapUpdate.Local.Collision.DebugCollisionNormal1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionNormal;
Context.MapUpdate.Local.Collision.DebugCollided1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_Collided;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Valid = Context.MapUpdate.Transient.CollisionValid;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Normal = Context.MapUpdate.Transient.CollisionNormal;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float Constant208 = 1;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.TraceVectorLengthMultiplier = Constant208;
float Constant209 = 1e+10;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxTraceLength = Constant209;
int Constant210 = 0;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.CPUFrictionMergeType = Constant210;
float3 Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldStart;
float3 Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldEnd;
float3 Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionPosition;
float3 Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionNormal;
bool Collision_CollisionQueryAndResponse001_Emitter_Func_Output_Collided;
Collision_CollisionQueryAndResponse001_Emitter_Func_(Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldStart, Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionPosition, Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionNormal, Collision_CollisionQueryAndResponse001_Emitter_Func_Output_Collided, Context);
Context.MapUpdate.Local.Collision.ModuleTraceWorldStart2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldStart;
Context.MapUpdate.Local.Collision.ModuleTraceWorldEnd2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldEnd;
Context.MapUpdate.Local.Collision.DebugCollisionPosition2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionPosition;
Context.MapUpdate.Local.Collision.DebugCollisionNormal2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionNormal;
Context.MapUpdate.Local.Collision.DebugCollided2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_Collided;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision2Valid = Context.MapUpdate.Transient.CollisionValid;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision2Normal = Context.MapUpdate.Transient.CollisionNormal;
bool Result273 = Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Valid || Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision2Valid;
int Constant241 = 1;
int Result274 = Context.MapUpdate.Particles.NumberOfCollisions + Constant241;
int int32_IfResult;
int32_IfResult = Result274;
int32_IfResult = Context.MapUpdate.Particles.NumberOfCollisions;
Context.MapUpdate.Transient.CollisionValid = Result273;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionValid = Result273;
Context.MapUpdate.Particles.NumberOfCollisions = int32_IfResult;
float Constant242 = 1;
float Constant243 = 0.5;
float Constant244 = 0.5;
float3 Constant245 = float3(0,0,1);
float Constant246 = 0.5;
float Constant247 = 0;
bool Result275 = NiagaraAll(Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance < Constant247);
float Constant248 = 0;
bool Result276 = NiagaraAll(Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance < Constant248);
bool Result277 = Result275 && Result276;
float Constant249 = 0.5;
float Constant250 = 0;
float Constant251 = (0.0);
float NiagaraFloat_SelectResult4 = Constant251;
NiagaraFloat_SelectResult4 = Constant249;
NiagaraFloat_SelectResult4 = Constant250;
float Constant252 = 0.5;
float Constant253 = 0;
float Constant254 = (0.0);
float NiagaraFloat_SelectResult5 = Constant254;
NiagaraFloat_SelectResult5 = Constant252;
NiagaraFloat_SelectResult5 = Constant253;
float Result278 = NiagaraFloat_SelectResult4 + NiagaraFloat_SelectResult5;
float Result279 = Context.MapUpdate.Engine.DeltaTime * Constant243;
float Result280 = lerp(Context.MapUpdate.Particles.RestCounter,Result278,Result279);
bool Result281 = NiagaraAll(Result280 > Constant242);
float Constant255 = -1;
float Result282 = Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance * Constant255;
bool Result283 = NiagaraAll(Result282 > Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance);
float Constant256 = -1;
float Result284 = Constant244 * Constant256;
bool Result285 = NiagaraAll(Result284 > Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance);
bool Result286 = Result283 || Result285;
bool Result287 = Result277 || Result281 || Result286;
float3 Constant257 = float3(0,0,0);
float3 Vector_IfResult8;
Vector_IfResult8 = Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Normal;
Vector_IfResult8 = Constant257;
float3 Constant258 = float3(0,0,0);
float3 Vector_IfResult9;
Vector_IfResult9 = Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision2Normal;
Vector_IfResult9 = Constant258;
float3 Result288 = Vector_IfResult8 + Vector_IfResult9;
float3 Constant259 = float3(0,0,1);
float Constant260 = 1e-05;
float3 DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1;
float DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length1;
bool DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold1;
DirectionAndLengthSafe_v1_1_Particle_Func_(Result288, Constant259, Constant260, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length1, DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold1, Context);
float Result289 = dot(DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1,Constant245);
float Constant261 = 0.5;
float Result290 = Constant246 - Constant261;
float Constant262 = 2;
float Result291 = Result290 * Constant262;
bool Result292 = NiagaraAll(Result289 > Result291);
bool Result293 = Result287 && Result292;
bool_IfResult1 = Result293;
bool_IfResult1 = Result287;
bool Result294 = Context.MapUpdate.Collision.EnableRestState && bool_IfResult1 && Context.MapUpdate.Collision.CollisionEnabled;
bool Result295 = Result294 || Context.MapUpdate.Local.Collision.ManuallyEnterRest;
float3 Constant263 = float3(0,0,0);
float3 Constant264 = float3(0,0,0);
float3 Constant265 = float3(0,0,0);
float Result296 = dot(Context.MapUpdate.Transient.AdvectionVelocity,DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1);
float Constant266 = 0;
bool Result297 = NiagaraAll(Result296 > Constant266);
float3 Result298 = DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1 * Result296;
float3 Result299 = Context.MapUpdate.Transient.AdvectionVelocity - Result298;
float3 Constant267 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult6 = Constant267;
Vector3f_SelectResult6 = Context.MapUpdate.Transient.AdvectionVelocity;
Vector3f_SelectResult6 = Result299;
float3 Position_IfResult;
float3 Velocity_IfResult2;
float3 Force_IfResult;
float deltatime_IfResult;
float3 AdvectionVelocity_IfResult;
Position_IfResult = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult2 = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Force_IfResult = Constant265;
deltatime_IfResult = Context.MapUpdate.Transient.PhysicsDeltaTime;
AdvectionVelocity_IfResult = Vector3f_SelectResult6;
Position_IfResult = Context.MapUpdate.Local.Collision.InputPositionPassthrough_NeededForSimStageExecution;
Velocity_IfResult2 = Context.MapUpdate.Local.Collision.InputVelocityPassthrough_NeededForSimStageExecution;
Force_IfResult = Context.MapUpdate.Local.Collision.InputForcePassthrough_NeededForSimStageExecution;
deltatime_IfResult = Context.MapUpdate.Engine.DeltaTime;
AdvectionVelocity_IfResult = Context.MapUpdate.Transient.AdvectionVelocity;
float3 Constant268 = float3(0,0,0);
float3 Position_IfResult1;
float3 Velocity_IfResult3;
float3 Force_IfResult1;
float deltatime_IfResult1;
float3 AdvectionVelocity_IfResult1;
Position_IfResult1 = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult3 = Constant263;
Force_IfResult1 = Constant264;
deltatime_IfResult1 = deltatime_IfResult;
AdvectionVelocity_IfResult1 = Constant268;
Position_IfResult1 = Position_IfResult;
Velocity_IfResult3 = Velocity_IfResult2;
Force_IfResult1 = Force_IfResult;
AdvectionVelocity_IfResult1 = AdvectionVelocity_IfResult;
int Constant269 = 1;
int Constant270 = 0;
bool Constant271 = false;
float3 Collision_TransformVector_Emitter_Func_Output_OutVector;
Collision_TransformVector_Emitter_Func_(Force_IfResult1, Constant269, Constant270, Constant271, Collision_TransformVector_Emitter_Func_Output_OutVector, Context);
bool Result301 = Result281 && Context.MapUpdate.Collision.CollisionEnabled;
bool Result302 = Context.MapUpdate.Local.Collision.ManuallyEnterRest || Result301;
float3 Constant273 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult7 = Constant273;
Vector3f_SelectResult7 = DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1;
Vector3f_SelectResult7 = Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal;
int Constant274 = 1;
int Constant275 = 0;
bool Constant276 = false;
float3 Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Collision_TransformPosition001_Emitter_Func_(Position_IfResult1, Constant274, Constant275, Constant276, Collision_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
int Constant278 = 1;
int Constant279 = 0;
bool Constant280 = false;
float3 Collision_TransformVector001_Emitter_Func_Output_OutVector;
Collision_TransformVector001_Emitter_Func_(Velocity_IfResult3, Constant278, Constant279, Constant280, Collision_TransformVector001_Emitter_Func_Output_OutVector, Context);
Context.MapUpdate.Transient.PhysicsForce = Collision_TransformVector_Emitter_Func_Output_OutVector;
Context.MapUpdate.Transient.PhysicsDeltaTime = deltatime_IfResult1;
Context.MapUpdate.Transient.CollisionIsResting = Result302;
Context.MapUpdate.Particles.RestCounter = Result280;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCombinedCollisionNormal = Vector3f_SelectResult7;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector001_Emitter_Func_Output_OutVector;
Context.MapUpdate.Particles.Velocity = Collision_TransformVector001_Emitter_Func_Output_OutVector;
Context.MapUpdate.Particles.Position = Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.MapUpdate.OUTPUT_VAR.Collision.CombinedCollisionNormal = Vector3f_SelectResult7;
Context.MapUpdate.Transient.AdvectionVelocity = AdvectionVelocity_IfResult1;
Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal = Vector3f_SelectResult7;
float Constant282 = 0;
Context.MapUpdate.Collision.AdvancedAgingRate = Constant282;
int Constant283 = 1;
Context.MapUpdate.Local.Collision.KillOnCollision = Constant283;
Context.MapUpdate.Particles.PrevPosition = Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevPosition;
Context.MapUpdate.Particles.PrevMeshOrientation = Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevMeshOrientation;
float Constant288 = 0.5;
float Result305 = Constant288 + Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsDrag = Result305;
float Constant289 = 0;
float Constant290 = 0.01;
float Result306 = Context.MapUpdate.Transient.PhysicsRotationalDrag * Constant290;
Context.MapUpdate.Transient.PhysicsRotationalDrag = Result306;
Context.MapUpdate.Transient.DragIgnoreMass = Context.MapUpdate.Drag.IgnoreMass;
Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime = Context.MapUpdate.SolveForcesAndVelocity001.DeltaTime;
float Constant295 = 1e-05;
float Result307 = max(Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime, Constant295);
float Result308 = Reciprocal(Result307);
Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseDeltaTime = Result308;
Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce = Context.MapUpdate.SolveForcesAndVelocity001.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsForce = Context.MapUpdate.SolveForcesAndVelocity001.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Context.MapUpdate.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.Local.SolveForcesAndVelocity001.Mass = Context.MapUpdate.SolveForcesAndVelocity001.Mass;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position = Context.MapUpdate.SolveForcesAndVelocity001.Position;
Context.MapUpdate.Particles.Presolve.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.Particles.Presolve.Position = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Context.MapUpdate.Particles.Presolve.PhysicsForce = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsForce;
float Constant296 = 1e-06;
float Result309 = max(Context.MapUpdate.Local.SolveForcesAndVelocity001.Mass, Constant296);
float Result310 = Reciprocal(Result309);
float3 Result311 = Result310 * Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce;
Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce = Result311;
Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseMass = Result310;
float3 Result312 = Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce * Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Result312;
Context.MapUpdate.Local.SolveForcesAndVelocity001.AdvectionVelocity = Context.MapUpdate.Transient.AdvectionVelocity;
Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Local.SolveForcesAndVelocity001.DragIgnoreMass = Context.MapUpdate.Transient.DragIgnoreMass;
float3 DragVelocity_Particle_Func_Output_Output2;
DragVelocity_Particle_Func_(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity001.DragIgnoreMass, DragVelocity_Particle_Func_Output_Output2, Context);
float3 Result313 = DragVelocity_Particle_Func_Output_Output2 - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = DragVelocity_Particle_Func_Output_Output2;
Context.MapUpdate.Local.SolveForcesAndVelocity001.DragVelocity = Result313;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsDrag = Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag;
float Constant297 = 1000;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
float3 Constant298 = float3(0,0,0);
float Constant299 = 9999;
float3 Result314 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity * Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime;
float3 Result315 = Result314 + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position = Result315;
float3 Position_IfResult2;
float3 Velocity_IfResult4;
Position_IfResult2 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Velocity_IfResult4 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Position_IfResult2 = Context.MapUpdate.Particles.Position;
Velocity_IfResult4 = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.Particles.Position = Position_IfResult2;
Context.MapUpdate.Particles.Velocity = Velocity_IfResult4;
float3 Constant300 = float3(0,0,0);
float Constant301 = 0;
float3 ForceVector_IfResult;
float Drag_IfResult;
ForceVector_IfResult = Constant300;
Drag_IfResult = Constant301;
ForceVector_IfResult = Context.MapUpdate.Transient.PhysicsForce;
Drag_IfResult = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsForce = ForceVector_IfResult;
Context.MapUpdate.Transient.PhysicsDrag = Drag_IfResult;
float3 Result316 = Context.MapUpdate.Particles.Position - Context.MapUpdate.Particles.Previous.Position;
float Result317 = length(Result316);
float Constant302 = 0.3333;
float Result318 = Result317 * Constant302;
float Constant303 = 1e+08;
float Result319 = Modulo(Context.MapUpdate.Particles.DistanceTraveled, Constant303);
float Result320 = Result318 + Result319;
Context.MapUpdate.Particles.DistanceTraveled = Result320;
float4 SIGN_MASK0 = float4( 1.f, -1.f, 1.f, -1.f );
float4 SIGN_MASK1 = float4( 1.f, 1.f, -1.f, -1.f );
float4 SIGN_MASK2 = float4( -1.f, 1.f, 1.f, -1.f );
Out_Result = (In_Quat1.wwww * In_Quat2);
Out_Result = ((In_Quat1.xxxx * In_Quat2.wzyx) * SIGN_MASK0) + Out_Result;
Out_Result = ((In_Quat1.yyyy * In_Quat2.zwxy)* SIGN_MASK1) + Out_Result;
Out_Result = ((In_Quat1.zzzz * In_Quat2.yxwz)* SIGN_MASK2) + Out_Result;
float4 CustomHlsl0013C38042754EB4CDC38BF90DCA5470E6AF8085104_Func_Output_Result;
CustomHlsl0013C38042754EB4CDC38BF90DCA5470E6AF8085104_Func_(In_QuaternionA, In_QuaternionB, CustomHlsl0013C38042754EB4CDC38BF90DCA5470E6AF8085104_Func_Output_Result);
Out_Quaternion = CustomHlsl0013C38042754EB4CDC38BF90DCA5470E6AF8085104_Func_Output_Result;
float3 Result328 = In_RotationalVelocityVector * In_DeltaTime;
float3 Constant308 = float3(0,0,0);
float Constant309 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction15;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length15;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold15;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result328, Constant308, Constant309, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction15, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length15, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold15, Context);
float4 Vector4;
Vector4.x = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction15.x;
Vector4.y = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction15.y;
Vector4.z = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction15.z;
Vector4.w = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length15;
bool Constant310 = true;
float4 AxisAngleToQuaternion_Func_Output_Quaternion1;
AxisAngleToQuaternion_Func_(Vector4, Constant310, AxisAngleToQuaternion_Func_Output_Quaternion1, Context);
float4 MultiplyQuaternion_Func_Output_Quaternion;
MultiplyQuaternion_Func_(AxisAngleToQuaternion_Func_Output_Quaternion1, In_ExistingOrientationQuat, MultiplyQuaternion_Func_Output_Quaternion, Context);
float4 Quat_IfResult;
Quat_IfResult = In_ExistingOrientationQuat;
Quat_IfResult = MultiplyQuaternion_Func_Output_Quaternion;
Out_NewOrientationQuat = Quat_IfResult;
float3 Result321 = Context.MapUpdate.Transient.PhysicsRotationalForce / Context.MapUpdate.Particles.MomentOfInertia;
float3 Result322 = Result321 * Context.MapUpdate.ScratchModule.DeltaTime;
float3 Result323 = Context.MapUpdate.Particles.RotationalVelocity + Result322;
Context.MapUpdate.Particles.RotationalVelocity = Result323;
float Constant305 = 0.5;
float Constant306 = 0;
float Result324 = max(Constant305, Constant306);
float Result325 = Result324 * Context.MapUpdate.ScratchModule.DeltaTime;
float Constant307 = 1;
float Result326 = Result325 + Constant307;
float3 Result327 = Context.MapUpdate.Particles.RotationalVelocity / Result326;
Context.MapUpdate.Particles.RotationalVelocity = Result327;
float4 ApplyRotationVector_NormalizeRotations_false_Func_Output_NewOrientationQuat;
ApplyRotationVector_NormalizeRotations_false_Func_(Context.MapUpdate.Particles.RotationalVelocity, Context.MapUpdate.ScratchModule.DeltaTime, Context.MapUpdate.Particles.MeshOrientation, ApplyRotationVector_NormalizeRotations_false_Func_Output_NewOrientationQuat, Context);
Context.MapUpdate.Particles.MeshOrientation = ApplyRotationVector_NormalizeRotations_false_Func_Output_NewOrientationQuat;
return HackSpawnInterp;
int InterpSpawn_Index = ExecIndex();
float InterpSpawn_SpawnTime = Emitter_InterpSpawnStartDt + (Emitter_SpawnInterval * InterpSpawn_Index);
float InterpSpawn_UpdateTime = Engine_DeltaTime - InterpSpawn_SpawnTime;
float InterpSpawn_InvSpawnTime = 1.0 / InterpSpawn_SpawnTime;
float InterpSpawn_InvUpdateTime = 1.0 / InterpSpawn_UpdateTime;
float SpawnInterp = InterpSpawn_SpawnTime * Engine_InverseDeltaTime ;
HackSpawnInterp = SpawnInterp;
Context.MapSpawn.Interpolation.InterpSpawn_Index = InterpSpawn_Index;
Context.MapSpawn.Interpolation.InterpSpawn_SpawnTime = InterpSpawn_SpawnTime;
Context.MapSpawn.Interpolation.InterpSpawn_UpdateTime = InterpSpawn_UpdateTime;
Context.MapSpawn.Interpolation.InterpSpawn_InvSpawnTime = InterpSpawn_InvSpawnTime;
Context.MapSpawn.Interpolation.InterpSpawn_InvUpdateTime = InterpSpawn_InvUpdateTime;
Context.MapSpawn.Interpolation.SpawnInterp = SpawnInterp;
Context.MapSpawn.Interpolation.Emitter_SpawnInterval = Emitter_SpawnInterval;
Context.MapSpawn.Interpolation.Emitter_InterpSpawnStartDt = Emitter_InterpSpawnStartDt;
Context.MapSpawn.Interpolation.Emitter_SpawnGroup = Emitter_SpawnGroup;
Context.MapSpawn.Engine.Time = lerp(PREV_Engine_Time, Engine_Time, SpawnInterp);
Context.MapSpawn.Engine.RealTime = lerp(PREV_Engine_RealTime, Engine_RealTime, SpawnInterp);
Context.MapSpawn.Engine.Owner.TimeSinceRendered = lerp(PREV_Engine_Owner_TimeSinceRendered, Engine_Owner_TimeSinceRendered, SpawnInterp);
Context.MapSpawn.Engine.Owner.LODDistance = lerp(PREV_Engine_Owner_LODDistance, Engine_Owner_LODDistance, SpawnInterp);
Context.MapSpawn.Engine.Owner.LODDistanceFraction = lerp(PREV_Engine_Owner_LODDistanceFraction, Engine_Owner_LODDistanceFraction, SpawnInterp);
Context.MapSpawn.Engine.System.Age = lerp(PREV_Engine_System_Age, Engine_System_Age, SpawnInterp);
Context.MapSpawn.Engine.Owner.Rotation = NiagaraQuatSLerp(PREV_Engine_Owner_Rotation, Engine_Owner_Rotation, SpawnInterp);
Context.MapSpawn.Engine.Owner.Position = lerp(PREV_Engine_Owner_Position, Engine_Owner_Position, SpawnInterp);
Context.MapSpawn.Engine.Owner.Velocity = lerp(PREV_Engine_Owner_Velocity, Engine_Owner_Velocity, SpawnInterp);
Context.MapSpawn.Engine.Owner.SystemXAxis = lerp(PREV_Engine_Owner_SystemXAxis, Engine_Owner_SystemXAxis, SpawnInterp);
Context.MapSpawn.Engine.Owner.SystemYAxis = lerp(PREV_Engine_Owner_SystemYAxis, Engine_Owner_SystemYAxis, SpawnInterp);
Context.MapSpawn.Engine.Owner.SystemZAxis = lerp(PREV_Engine_Owner_SystemZAxis, Engine_Owner_SystemZAxis, SpawnInterp);
Context.MapSpawn.Engine.Owner.Scale = lerp(PREV_Engine_Owner_Scale, Engine_Owner_Scale, SpawnInterp);
Context.MapSpawn.Engine.Owner.LWCTile = lerp(PREV_Engine_Owner_LWCTile, Engine_Owner_LWCTile, SpawnInterp);
Context.MapSpawn.Emitter.Age = lerp(PREV_Emitter_Age, Emitter_Age, SpawnInterp);
Context.MapSpawn.Emitter.dx = lerp(PREV_Emitter_dx, Emitter_dx, SpawnInterp);
Context.MapUpdate.Engine.DeltaTime = InterpSpawn_UpdateTime;
Context.MapUpdate.Engine.InverseDeltaTime = InterpSpawn_InvUpdateTime;
Context.MapSpawn.Particles.Previous.MeshOrientation = Context.MapSpawn.Particles.MeshOrientation;
Context.MapSpawn.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Previous.Scale = Context.MapSpawn.Particles.Scale;
Context.MapSpawn.Particles.Previous.SpriteSize = Context.MapSpawn.Particles.SpriteSize;
Context.MapSpawn.Particles.Previous.Velocity = Context.MapSpawn.Particles.Velocity;
//Begin Interpolated Spawn Script!
float Constant = (0.0);
Context.MapSpawn.Particles.Volume = Constant;
float Constant1 = (0.0);
Context.MapSpawn.Particles.Mass = Constant1;
float3 Constant2 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Scale = Constant2;
float Constant3 = (0.0);
Context.MapSpawn.Particles.RotationalInertia = Constant3;
float3 Constant4 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.MomentOfInertia = Constant4;
float Constant5 = (0.0);
Context.MapSpawn.Particles.Diameter = Constant5;
float2 Constant6 = float2(100,100);
Context.MapSpawn.Particles.SpriteSize = Constant6;
float Constant7 = (0.0);
Context.MapSpawn.Particles.Radius = Constant7;
float3 Constant8 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Position = Constant8;
float3 Constant9 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.RotationalVelocity = Constant9;
float3 Constant10 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Velocity = Constant10;
float4 Constant11 = float4(0.0, 0.0, 0.0, 1.0);
Context.MapSpawn.Particles.MeshOrientation = Constant11;
float4 Constant12 = float4(0.0, 0.0, 0.0, 1.0);
Context.MapSpawn.Particles.PrevMeshOrientation = Constant12;
float Constant13 = 0;
Context.MapSpawn.Particles.Age = Constant13;
float Constant14 = 0;
Context.MapSpawn.Particles.Lifetime = Constant14;
float Constant15 = (0.0);
Context.MapSpawn.Particles.NormalizedAge = Constant15;
int Constant16 = 0;
Context.MapSpawn.Particles.NumberOfCollisions = Constant16;
int Constant17 = 0;
Context.MapSpawn.Particles.Collision.CollisionQueryAndResponse.CollisionID = Constant17;
bool Constant18 = false;
Context.MapSpawn.Particles.HasCollided = Constant18;
int Constant19 = 0;
Context.MapSpawn.Particles.Collision.CollisionQueryAndResponse001.CollisionID = Constant19;
float Constant20 = 0;
Context.MapSpawn.Particles.RestCounter = Constant20;
Context.MapSpawn.Particles.Collision.SafeCombinedCollisionNormal = Constant21;
Context.MapSpawn.Particles.PrevPosition = Constant22;
float3 Constant23 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Velocity = Constant23;
float3 Constant24 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Position = Constant24;
Context.MapSpawn.Particles.Presolve.PhysicsForce = Constant25;
float3 Constant26 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Position = Constant26;
float Constant27 = 0;
Context.MapSpawn.Particles.DistanceTraveled = Constant27;
float Constant28 = 0.5;
float3 Constant29 = float3(40,20,20);
EnterStatScope(1 /**ScratchModule_04_Emitter_Func_*/);
ScratchModule_04_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_04_Emitter_Func_*/);
float3 Constant35 = float3(0,0,200);
float3 Constant36 = float3(0,1,0);
float Constant37 = 45;
bool Constant38 = false;
Context.MapSpawn.MakeQuatFromAxisAngle.NormalizeAxis = Constant38;
float4 MakeQuatFromAxisAngle_Emitter_Func_Output_Quaternion;
MakeQuatFromAxisAngle_Emitter_Func_(MakeQuatFromAxisAngle_Emitter_Func_Output_Quaternion, Context);
Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.Position = Constant35;
Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.MeshOrientation = MakeQuatFromAxisAngle_Emitter_Func_Output_Quaternion;
float3 Constant42 = float3(0,0,0);
float3 Constant43 = float3(0,0,0);
float4 Constant44 = float4(0,0,0,1);
EnterStatScope(2 /**SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_*/);
SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_*/);
bool Constant48 = true;
Context.MapUpdate.DataInstance.Alive = Constant48;
Context.MapUpdate.ParticleState.LoopParticlesLifetime = Constant49;
Context.MapUpdate.ParticleState.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
Context.MapUpdate.ParticleState.LetInfinitelyLivedParticlesDieWhenEmitterDeactivates = Constant50;
EnterStatScope(3 /**ParticleState_Emitter_Func_*/);
ParticleState_Emitter_Func_(Context);
ExitStatScope(/**ParticleState_Emitter_Func_*/);
Context.MapUpdate.Transient.PhysicsForce = Constant57;
float3 Constant58 = float3(0,0,-980);
EnterStatScope(4 /**GravityForce_Emitter_Func_*/);
GravityForce_Emitter_Func_(Context);
ExitStatScope(/**GravityForce_Emitter_Func_*/);
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx = Context.MapUpdate.Emitter.dx;
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld = Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.WorldToUnit = Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit;
float3 Constant60 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsRotationalForce = Constant60;
EnterStatScope(5 /**Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_*/);
Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_*/);
bool Constant65 = true;
Context.MapUpdate.Collision.EnableRestState = Constant65;
bool Constant66 = false;
Context.MapUpdate.Transient.CollisionIsResting = Constant66;
bool Constant67 = false;
Context.MapUpdate.Collision.ManuallyEnterRest = Constant67;
bool Constant68 = false;
Context.MapUpdate.Collision.EnableMaxCollisionCount = Constant68;
Context.MapUpdate.Collision.ParticleMass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.Collision.PhysicsForce = Context.MapUpdate.Transient.PhysicsForce;
bool Constant69 = false;
float Constant70 = 1;
float Constant71 = 0;
float Constant72 = 0;
float Constant73 = 0;
bool Constant76 = true;
Context.MapUpdate.Collision.CollisionEnabled = Constant76;
bool Constant77 = false;
Context.MapUpdate.Collision.RandomizeCollisionNormalVector = Constant77;
bool Constant78 = false;
Context.MapUpdate.Local.Collision.UpdateMeshRotation = Constant78;
float Constant79 = 0;
bool Constant80 = true;
Context.MapUpdate.Collision.KillParticlesLodgedWithinMeshes = Constant80;
float3 Constant81 = float3(0,0,0);
Context.MapUpdate.Transient.Collision_PredictedParticlePositionForSimStages = Constant81;
Context.MapUpdate.Transient.PhysicsDeltaTime = Context.MapUpdate.Engine.DeltaTime;
float3 Constant82 = float3(0,0,0);
Context.MapUpdate.Transient.AdvectionVelocity = Constant82;
float Constant83 = 0;
Context.MapUpdate.Transient.PhysicsDrag = Constant83;
bool Constant84 = true;
Context.MapUpdate.Transient.DragIgnoreMass = Constant84;
float Constant85 = 1;
float Constant86 = 0.5;
float Constant87 = 0.5;
float3 Constant88 = float3(0,0,1);
bool Constant89 = false;
Context.MapUpdate.Collision.ControlRestStateViaSurfaceNormal = Constant89;
float Constant90 = 0.5;
float Constant91 = 0;
int Constant92 = 1;
EnterStatScope(6 /**Collision_Emitter_Func_*/);
Collision_Emitter_Func_(Context);
ExitStatScope(/**Collision_Emitter_Func_*/);
Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevMeshOrientation = Context.MapUpdate.Particles.MeshOrientation;
Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevPosition = Context.MapUpdate.Particles.Position;
EnterStatScope(7 /**SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_*/);
SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_*/);
float Constant284 = 0.5;
float Constant285 = 0;
float Constant286 = 0;
Context.MapUpdate.Transient.PhysicsRotationalDrag = Constant286;
bool Constant287 = true;
Context.MapUpdate.Drag.IgnoreMass = Constant287;
EnterStatScope(8 /**Drag_Emitter_Func_*/);
Drag_Emitter_Func_(Context);
ExitStatScope(/**Drag_Emitter_Func_*/);
Context.MapUpdate.SolveForcesAndVelocity001.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
Context.MapUpdate.SolveForcesAndVelocity001.Force = Context.MapUpdate.Transient.PhysicsForce;
Context.MapUpdate.SolveForcesAndVelocity001.Velocity = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.SolveForcesAndVelocity001.Mass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.SolveForcesAndVelocity001.Position = Context.MapUpdate.Particles.Position;
float Constant291 = 1000;
float3 Constant292 = float3(0,0,0);
float Constant293 = 9999;
bool Constant294 = true;
Context.MapUpdate.SolveForcesAndVelocity001.WritetoIntrinsicProperties = Constant294;
EnterStatScope(9 /**SolveForcesAndVelocity001_Emitter_Func_*/);
SolveForcesAndVelocity001_Emitter_Func_(Context);
ExitStatScope(/**SolveForcesAndVelocity001_Emitter_Func_*/);
Context.MapUpdate.ScratchModule.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
float Constant304 = 0.5;
EnterStatScope(10 /**ScratchModule_Emitter_Func_*/);
ScratchModule_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_Emitter_Func_*/);
int3 Emitter_BoundaryReader_NumCells;
float3 Emitter_BoundaryReader_UnitToUV;
float3 Emitter_BoundaryReader_CellSize;
float3 Emitter_BoundaryReader_WorldBBoxSize;
Texture3D<float4> Emitter_BoundaryReader_Grid;
RWTexture3D<float4> Emitter_BoundaryReader_OutputGrid;
int3 Emitter_BoundaryReader_NumTiles;
float3 Emitter_BoundaryReader_OneOverNumTiles;
float3 Emitter_BoundaryReader_UnitClampMin;
float3 Emitter_BoundaryReader_UnitClampMax;
SamplerState Emitter_BoundaryReader_GridSampler;
int4 Emitter_BoundaryReader_AttributeIndices[1];
Buffer<float4> Emitter_BoundaryReader_PerAttributeData;
int Emitter_BoundaryReader_NumAttributes;
int Emitter_BoundaryReader_NumNamedAttributes;
int3 TotalDim = Emitter_BoundaryReader_NumCells * Emitter_BoundaryReader_NumTiles;
F[0] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_BoundaryReader_NumCells;
const int3 MaxCell = Emitter_BoundaryReader_NumCells - int3(2,2,2);
return Emitter_BoundaryReader_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_BoundaryReader_Grid.Load(int4(col, row, plane, MipLevel)); 
NDIDebugDraw_Line(bExecute, LineStart, LineEnd, Color);
NDIDebugDraw_DrawRectangle(bExecute, Location, XAxis, YAxis, Extents, NumXSegments, NumYSegments, Color, bUnbounded);
NDIDebugDraw_Circle(bExecute, Location, XAxis, YAxis, Scale, Segments, Color);
NDIDebugDraw_DrawBox(bExecute, Location, Rotation, Extents, Color);
NDIDebugDraw_Sphere(bExecute, LineStart, Radius, Segments, Color);
NDIDebugDraw_Cylinder(bExecute, Location, Axis, Height, Radius, NumHeightSegments, NumRadiusSegments, Color);
NDIDebugDraw_Cone(bExecute, Location, Axis, Height, RadiusTop, RadiusBottom, NumHeightSegments, NumRadiusSegments, Color);
NDIDebugDraw_Torus(bExecute, Location, Axis, MajorRadius, MinorRadius, MajorRadiusSegments, MinorRadiusSegments, Color);
NDIDebugDraw_CoordinateSystem(bExecute, Location, Rotation, Scale);
NDIDebugDraw_Grid2D(bExecute, Center, Rotation, Extents, int2(NumCellsX, NumCellsY), Color);
NDIDebugDraw_Grid3D(bExecute, Center, Rotation, Extents, int3(NumCellsX, NumCellsY, NumCellsZ), Color);
int3 Emitter_FaceReader_NumCells;
float3 Emitter_FaceReader_UnitToUV;
float3 Emitter_FaceReader_CellSize;
float3 Emitter_FaceReader_WorldBBoxSize;
Texture3D<float3> Emitter_FaceReader_Grid;
RWTexture3D<float3> Emitter_FaceReader_OutputGrid;
int3 Emitter_FaceReader_NumTiles;
float3 Emitter_FaceReader_OneOverNumTiles;
float3 Emitter_FaceReader_UnitClampMin;
float3 Emitter_FaceReader_UnitClampMax;
SamplerState Emitter_FaceReader_GridSampler;
int4 Emitter_FaceReader_AttributeIndices[1];
Buffer<float4> Emitter_FaceReader_PerAttributeData;
int Emitter_FaceReader_NumAttributes;
int Emitter_FaceReader_NumNamedAttributes;
int3 TotalDim = Emitter_FaceReader_NumCells * Emitter_FaceReader_NumTiles;
F[0] = Emitter_FaceReader_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_FaceReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_FaceReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_FaceReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_FaceReader_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_FaceReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_FaceReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_FaceReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_FaceReader_NumCells;
const int3 MaxCell = Emitter_FaceReader_NumCells - int3(2,2,2);
return Emitter_FaceReader_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_FaceReader_Grid.Load(int4(col, row, plane, MipLevel)); 
int3 Emitter_PressureReader_NumCells;
float3 Emitter_PressureReader_UnitToUV;
float3 Emitter_PressureReader_CellSize;
float3 Emitter_PressureReader_WorldBBoxSize;
Texture3D<float> Emitter_PressureReader_Grid;
RWTexture3D<float> Emitter_PressureReader_OutputGrid;
int3 Emitter_PressureReader_NumTiles;
float3 Emitter_PressureReader_OneOverNumTiles;
float3 Emitter_PressureReader_UnitClampMin;
float3 Emitter_PressureReader_UnitClampMax;
SamplerState Emitter_PressureReader_GridSampler;
int4 Emitter_PressureReader_AttributeIndices[1];
Buffer<float4> Emitter_PressureReader_PerAttributeData;
int Emitter_PressureReader_NumAttributes;
int Emitter_PressureReader_NumNamedAttributes;
int3 TotalDim = Emitter_PressureReader_NumCells * Emitter_PressureReader_NumTiles;
F[0] = Emitter_PressureReader_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_PressureReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_PressureReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_PressureReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_PressureReader_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_PressureReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_PressureReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_PressureReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_PressureReader_NumCells;
const int3 MaxCell = Emitter_PressureReader_NumCells - int3(2,2,2);
return Emitter_PressureReader_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_PressureReader_Grid.Load(int4(col, row, plane, MipLevel)); 
NDICollisionQuery_QuerySceneDepthGPU(In_SamplePos, GetEngineOwnerLWCTile(), Out_SceneDepth, Out_CameraPosWorld, Out_IsInsideView, Out_WorldPos, Out_WorldNormal);
NDICollisionQuery_QueryScenePartialDepthGPU(In_SamplePos, GetEngineOwnerLWCTile(), Out_SceneDepth, Out_CameraPosWorld, Out_IsInsideView, Out_WorldPos, Out_WorldNormal);
NDICollisionQuery_QueryCustomDepthGPU(In_SamplePos, GetEngineOwnerLWCTile(), Out_SceneDepth, Out_CameraPosWorld, Out_IsInsideView, Out_WorldPos, Out_WorldNormal);
NDICollisionQuery_QueryMeshDistanceFieldGPU(In_SamplePos, GetEngineOwnerLWCTile(), Out_DistanceToNearestSurface, Out_FieldGradient, Out_IsDistanceFieldValid);
// DEPRECATE_BEGIN
Out_IsQueryValid = false;
Out_StartQueryID = -1;
Out_IndicesValid = false;
Out_QueryID = -1;
Out_CollisionDistance = 0.0f;
Out_CollisionPosWorld = float3(0.0f, 0.0f, 0.0f);
Out_CollisionNormal = float3(0.0f, 0.0f, 0.0f);
Out_CollisionValid = false;
// DEPRECATE_END
Value = Emitter_BoundaryReader_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgba;
Value = Emitter_FaceReader_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgb;
Value = Emitter_PressureReader_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).r;
Context.MapUpdate.Engine.DeltaTime = Engine_DeltaTime;
Context.MapUpdate.Emitter.ExecutionState = Emitter_ExecutionState;
Context.MapUpdate.System.ExecutionState = System_ExecutionState;
Context.MapUpdate.Emitter.dx = Emitter_dx;
Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.UnitToWorld = System_Grid3D_CreateUnitToWorldTransform_UnitToWorld;
Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit = System_Grid3D_CreateUnitToWorldTransform_WorldToUnit;
Context.MapUpdate.Engine.Owner.Position = Engine_Owner_Position;
Context.MapUpdate.Emitter.NumCellsX = Emitter_NumCellsX;
Context.MapUpdate.Emitter.NumCellsY = Emitter_NumCellsY;
Context.MapUpdate.Emitter.NumCellsZ = Emitter_NumCellsZ;
Context.MapUpdate.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapUpdate.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapUpdate.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapUpdate.Engine.System.TickCount = Engine_System_TickCount;
Context.MapUpdate.Engine.Time = Engine_Time;
Context.MapUpdate.Engine.WorldDeltaTime = Engine_WorldDeltaTime;
Context.MapUpdate.Engine.InverseDeltaTime = Engine_InverseDeltaTime;
Context.MapUpdate.Engine.ExecutionCount = Engine_ExecutionCount;
Context.MapUpdate.Emitter.SpawnRate = Emitter_SpawnRate;
Context.MapUpdate.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapUpdate.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapUpdate.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.MapSpawn.Particles.Age = 0.0f;
Context.MapSpawn.Particles.Collision.CollisionQueryAndResponse.CollisionID = 0;
Context.MapSpawn.Particles.Collision.CollisionQueryAndResponse001.CollisionID = 0;
Context.MapSpawn.Particles.Collision.SafeCombinedCollisionNormal.x = 0.0f;
Context.MapSpawn.Particles.Collision.SafeCombinedCollisionNormal.y = 0.0f;
Context.MapSpawn.Particles.Collision.SafeCombinedCollisionNormal.z = 0.0f;
Context.MapSpawn.Particles.Diameter = 0.0f;
Context.MapSpawn.Particles.DistanceTraveled = 0.0f;
Context.MapSpawn.Particles.HasCollided = false;
Context.MapSpawn.Particles.Lifetime = 0.0f;
Context.MapSpawn.Particles.Mass = 0.0f;
Context.MapSpawn.Particles.MeshOrientation.x = 0.0f;
Context.MapSpawn.Particles.MeshOrientation.y = 0.0f;
Context.MapSpawn.Particles.MeshOrientation.z = 0.0f;
Context.MapSpawn.Particles.MeshOrientation.w = 0.0f;
Context.MapSpawn.Particles.MomentOfInertia.x = 0.0f;
Context.MapSpawn.Particles.MomentOfInertia.y = 0.0f;
Context.MapSpawn.Particles.MomentOfInertia.z = 0.0f;
Context.MapSpawn.Particles.NormalizedAge = 0.0f;
Context.MapSpawn.Particles.NumberOfCollisions = 0;
Context.MapSpawn.Particles.Presolve.PhysicsForce.x = 0.0f;
Context.MapSpawn.Particles.Presolve.PhysicsForce.y = 0.0f;
Context.MapSpawn.Particles.Presolve.PhysicsForce.z = 0.0f;
Context.MapSpawn.Particles.Presolve.Position.x = 0.0f;
Context.MapSpawn.Particles.Presolve.Position.y = 0.0f;
Context.MapSpawn.Particles.Presolve.Position.z = 0.0f;
Context.MapSpawn.Particles.Presolve.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Presolve.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Presolve.Velocity.z = 0.0f;
Context.MapSpawn.Particles.Previous.MeshOrientation.x = 0.0f;
Context.MapSpawn.Particles.Previous.MeshOrientation.y = 0.0f;
Context.MapSpawn.Particles.Previous.MeshOrientation.z = 0.0f;
Context.MapSpawn.Particles.Previous.MeshOrientation.w = 0.0f;
Context.MapSpawn.Particles.Previous.Position.x = 0.0f;
Context.MapSpawn.Particles.Previous.Position.y = 0.0f;
Context.MapSpawn.Particles.Previous.Position.z = 0.0f;
Context.MapSpawn.Particles.Previous.Scale.x = 0.0f;
Context.MapSpawn.Particles.Previous.Scale.y = 0.0f;
Context.MapSpawn.Particles.Previous.Scale.z = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.z = 0.0f;
Context.MapSpawn.Particles.PrevMeshOrientation.x = 0.0f;
Context.MapSpawn.Particles.PrevMeshOrientation.y = 0.0f;
Context.MapSpawn.Particles.PrevMeshOrientation.z = 0.0f;
Context.MapSpawn.Particles.PrevMeshOrientation.w = 0.0f;
Context.MapSpawn.Particles.PrevPosition.x = 0.0f;
Context.MapSpawn.Particles.PrevPosition.y = 0.0f;
Context.MapSpawn.Particles.PrevPosition.z = 0.0f;
Context.MapSpawn.Particles.Radius = 0.0f;
Context.MapSpawn.Particles.RestCounter = 0.0f;
Context.MapSpawn.Particles.RotationalInertia = 0.0f;
Context.MapSpawn.Particles.RotationalVelocity.x = 0.0f;
Context.MapSpawn.Particles.RotationalVelocity.y = 0.0f;
Context.MapSpawn.Particles.RotationalVelocity.z = 0.0f;
Context.MapSpawn.Particles.Scale.x = 0.0f;
Context.MapSpawn.Particles.Scale.y = 0.0f;
Context.MapSpawn.Particles.Scale.z = 0.0f;
Context.MapSpawn.Particles.Volume = 0.0f;
Context.MapSpawn.Engine.Emitter.ID.ID = 1;
Context.MapUpdate.Array.Age = 0;
Context.MapUpdate.Particles.Age = InputDataFloat(0, 0, InstanceIdx);
Context.MapUpdate.Array.Collision.CollisionQueryAndResponse.CollisionID = 0;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse.CollisionID = InputDataInt(0, 0, InstanceIdx);
Context.MapUpdate.Array.Collision.CollisionQueryAndResponse001.CollisionID = 1;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse001.CollisionID = InputDataInt(0, 1, InstanceIdx);
Context.MapUpdate.Array.Collision.SafeCombinedCollisionNormal = 1;
Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.x = InputDataFloat(0, 1, InstanceIdx);
Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.y = InputDataFloat(0, 2, InstanceIdx);
Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.z = InputDataFloat(0, 3, InstanceIdx);
Context.MapUpdate.Array.Diameter = 4;
Context.MapUpdate.Particles.Diameter = InputDataFloat(0, 4, InstanceIdx);
Context.MapUpdate.Array.DistanceTraveled = 5;
Context.MapUpdate.Particles.DistanceTraveled = InputDataFloat(0, 5, InstanceIdx);
Context.MapUpdate.Array.HasCollided = 2;
Context.MapUpdate.Particles.HasCollided = InputDataBool(0, 2, InstanceIdx);
Context.MapUpdate.Array.Lifetime = 6;
Context.MapUpdate.Particles.Lifetime = InputDataFloat(0, 6, InstanceIdx);
Context.MapUpdate.Array.Mass = 7;
Context.MapUpdate.Particles.Mass = InputDataFloat(0, 7, InstanceIdx);
Context.MapUpdate.Array.MeshOrientation = 8;
Context.MapUpdate.Particles.MeshOrientation.x = InputDataFloat(0, 8, InstanceIdx);
Context.MapUpdate.Particles.MeshOrientation.y = InputDataFloat(0, 9, InstanceIdx);
Context.MapUpdate.Particles.MeshOrientation.z = InputDataFloat(0, 10, InstanceIdx);
Context.MapUpdate.Particles.MeshOrientation.w = InputDataFloat(0, 11, InstanceIdx);
Context.MapUpdate.Array.MomentOfInertia = 12;
Context.MapUpdate.Particles.MomentOfInertia.x = InputDataFloat(0, 12, InstanceIdx);
Context.MapUpdate.Particles.MomentOfInertia.y = InputDataFloat(0, 13, InstanceIdx);
Context.MapUpdate.Particles.MomentOfInertia.z = InputDataFloat(0, 14, InstanceIdx);
Context.MapUpdate.Array.NormalizedAge = 15;
Context.MapUpdate.Particles.NormalizedAge = InputDataFloat(0, 15, InstanceIdx);
Context.MapUpdate.Array.NumberOfCollisions = 3;
Context.MapUpdate.Particles.NumberOfCollisions = InputDataInt(0, 3, InstanceIdx);
Context.MapUpdate.Array.Position = 16;
Context.MapUpdate.Particles.Position.x = InputDataFloat(0, 16, InstanceIdx);
Context.MapUpdate.Particles.Position.y = InputDataFloat(0, 17, InstanceIdx);
Context.MapUpdate.Particles.Position.z = InputDataFloat(0, 18, InstanceIdx);
Context.MapUpdate.Array.Presolve.PhysicsForce = 19;
Context.MapUpdate.Particles.Presolve.PhysicsForce.x = InputDataFloat(0, 19, InstanceIdx);
Context.MapUpdate.Particles.Presolve.PhysicsForce.y = InputDataFloat(0, 20, InstanceIdx);
Context.MapUpdate.Particles.Presolve.PhysicsForce.z = InputDataFloat(0, 21, InstanceIdx);
Context.MapUpdate.Array.Presolve.Position = 22;
Context.MapUpdate.Particles.Presolve.Position.x = InputDataFloat(0, 22, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Position.y = InputDataFloat(0, 23, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Position.z = InputDataFloat(0, 24, InstanceIdx);
Context.MapUpdate.Array.Presolve.Velocity = 25;
Context.MapUpdate.Particles.Presolve.Velocity.x = InputDataFloat(0, 25, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Velocity.y = InputDataFloat(0, 26, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Velocity.z = InputDataFloat(0, 27, InstanceIdx);
Context.MapUpdate.Array.PrevMeshOrientation = 43;
Context.MapUpdate.Particles.PrevMeshOrientation.x = InputDataFloat(0, 43, InstanceIdx);
Context.MapUpdate.Particles.PrevMeshOrientation.y = InputDataFloat(0, 44, InstanceIdx);
Context.MapUpdate.Particles.PrevMeshOrientation.z = InputDataFloat(0, 45, InstanceIdx);
Context.MapUpdate.Particles.PrevMeshOrientation.w = InputDataFloat(0, 46, InstanceIdx);
Context.MapUpdate.Array.PrevPosition = 47;
Context.MapUpdate.Particles.PrevPosition.x = InputDataFloat(0, 47, InstanceIdx);
Context.MapUpdate.Particles.PrevPosition.y = InputDataFloat(0, 48, InstanceIdx);
Context.MapUpdate.Particles.PrevPosition.z = InputDataFloat(0, 49, InstanceIdx);
Context.MapUpdate.Array.Radius = 50;
Context.MapUpdate.Particles.Radius = InputDataFloat(0, 50, InstanceIdx);
Context.MapUpdate.Array.RestCounter = 51;
Context.MapUpdate.Particles.RestCounter = InputDataFloat(0, 51, InstanceIdx);
Context.MapUpdate.Array.RotationalInertia = 52;
Context.MapUpdate.Particles.RotationalInertia = InputDataFloat(0, 52, InstanceIdx);
Context.MapUpdate.Array.RotationalVelocity = 53;
Context.MapUpdate.Particles.RotationalVelocity.x = InputDataFloat(0, 53, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.y = InputDataFloat(0, 54, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.z = InputDataFloat(0, 55, InstanceIdx);
Context.MapUpdate.Array.Scale = 56;
Context.MapUpdate.Particles.Scale.x = InputDataFloat(0, 56, InstanceIdx);
Context.MapUpdate.Particles.Scale.y = InputDataFloat(0, 57, InstanceIdx);
Context.MapUpdate.Particles.Scale.z = InputDataFloat(0, 58, InstanceIdx);
Context.MapUpdate.Array.SpriteSize = 59;
Context.MapUpdate.Particles.SpriteSize.x = InputDataFloat(0, 59, InstanceIdx);
Context.MapUpdate.Particles.SpriteSize.y = InputDataFloat(0, 60, InstanceIdx);
Context.MapUpdate.Array.UniqueID = 4;
Context.MapUpdate.Particles.UniqueID = InputDataInt(0, 4, InstanceIdx);
Context.MapUpdate.Array.Velocity = 61;
Context.MapUpdate.Particles.Velocity.x = InputDataFloat(0, 61, InstanceIdx);
Context.MapUpdate.Particles.Velocity.y = InputDataFloat(0, 62, InstanceIdx);
Context.MapUpdate.Particles.Velocity.z = InputDataFloat(0, 63, InstanceIdx);
Context.MapUpdate.Array.Volume = 64;
Context.MapUpdate.Particles.Volume = InputDataFloat(0, 64, InstanceIdx);
Context.MapUpdate.Particles.MeshOrientation;
Context.MapUpdate.Particles.Position;
Context.MapUpdate.Particles.Scale;
Context.MapUpdate.Particles.SpriteSize;
Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.Engine.Emitter.ID.ID = 1;
InterpolateParameters(Context);
Context.MapUpdate.DataInstance.Alive = true;
Context.MapUpdate.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
OutputDataFloat(0, 0, WriteIndex, Context.MapUpdate.Particles.Age);
OutputDataInt(0, 0, WriteIndex, Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse.CollisionID);
OutputDataInt(0, 1, WriteIndex, Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse001.CollisionID);
OutputDataFloat(0, 1, WriteIndex, Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.x);
OutputDataFloat(0, 2, WriteIndex, Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.y);
OutputDataFloat(0, 3, WriteIndex, Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.z);
OutputDataFloat(0, 4, WriteIndex, Context.MapUpdate.Particles.Diameter);
OutputDataFloat(0, 5, WriteIndex, Context.MapUpdate.Particles.DistanceTraveled);
OutputDataBool(0, 2, WriteIndex, Context.MapUpdate.Particles.HasCollided);
OutputDataFloat(0, 6, WriteIndex, Context.MapUpdate.Particles.Lifetime);
OutputDataFloat(0, 7, WriteIndex, Context.MapUpdate.Particles.Mass);
OutputDataFloat(0, 8, WriteIndex, Context.MapUpdate.Particles.MeshOrientation.x);
OutputDataFloat(0, 9, WriteIndex, Context.MapUpdate.Particles.MeshOrientation.y);
OutputDataFloat(0, 10, WriteIndex, Context.MapUpdate.Particles.MeshOrientation.z);
OutputDataFloat(0, 11, WriteIndex, Context.MapUpdate.Particles.MeshOrientation.w);
OutputDataFloat(0, 12, WriteIndex, Context.MapUpdate.Particles.MomentOfInertia.x);
OutputDataFloat(0, 13, WriteIndex, Context.MapUpdate.Particles.MomentOfInertia.y);
OutputDataFloat(0, 14, WriteIndex, Context.MapUpdate.Particles.MomentOfInertia.z);
OutputDataFloat(0, 15, WriteIndex, Context.MapUpdate.Particles.NormalizedAge);
OutputDataInt(0, 3, WriteIndex, Context.MapUpdate.Particles.NumberOfCollisions);
OutputDataFloat(0, 16, WriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 17, WriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 18, WriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 19, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.x);
OutputDataFloat(0, 20, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.y);
OutputDataFloat(0, 21, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.z);
OutputDataFloat(0, 22, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.x);
OutputDataFloat(0, 23, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.y);
OutputDataFloat(0, 24, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.z);
OutputDataFloat(0, 25, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.x);
OutputDataFloat(0, 26, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.y);
OutputDataFloat(0, 27, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.z);
OutputDataFloat(0, 28, WriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.x);
OutputDataFloat(0, 29, WriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.y);
OutputDataFloat(0, 30, WriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.z);
OutputDataFloat(0, 31, WriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.w);
OutputDataFloat(0, 32, WriteIndex, Context.MapUpdate.Particles.Previous.Position.x);
OutputDataFloat(0, 33, WriteIndex, Context.MapUpdate.Particles.Previous.Position.y);
OutputDataFloat(0, 34, WriteIndex, Context.MapUpdate.Particles.Previous.Position.z);
OutputDataFloat(0, 35, WriteIndex, Context.MapUpdate.Particles.Previous.Scale.x);
OutputDataFloat(0, 36, WriteIndex, Context.MapUpdate.Particles.Previous.Scale.y);
OutputDataFloat(0, 37, WriteIndex, Context.MapUpdate.Particles.Previous.Scale.z);
OutputDataFloat(0, 38, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 39, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 40, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.x);
OutputDataFloat(0, 41, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.y);
OutputDataFloat(0, 42, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.z);
OutputDataFloat(0, 43, WriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.x);
OutputDataFloat(0, 44, WriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.y);
OutputDataFloat(0, 45, WriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.z);
OutputDataFloat(0, 46, WriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.w);
OutputDataFloat(0, 47, WriteIndex, Context.MapUpdate.Particles.PrevPosition.x);
OutputDataFloat(0, 48, WriteIndex, Context.MapUpdate.Particles.PrevPosition.y);
OutputDataFloat(0, 49, WriteIndex, Context.MapUpdate.Particles.PrevPosition.z);
OutputDataFloat(0, 50, WriteIndex, Context.MapUpdate.Particles.Radius);
OutputDataFloat(0, 51, WriteIndex, Context.MapUpdate.Particles.RestCounter);
OutputDataFloat(0, 52, WriteIndex, Context.MapUpdate.Particles.RotationalInertia);
OutputDataFloat(0, 53, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.x);
OutputDataFloat(0, 54, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.y);
OutputDataFloat(0, 55, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.z);
OutputDataFloat(0, 56, WriteIndex, Context.MapUpdate.Particles.Scale.x);
OutputDataFloat(0, 57, WriteIndex, Context.MapUpdate.Particles.Scale.y);
OutputDataFloat(0, 58, WriteIndex, Context.MapUpdate.Particles.Scale.z);
OutputDataFloat(0, 59, WriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 60, WriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataInt(0, 4, WriteIndex, Context.MapUpdate.Particles.UniqueID);
OutputDataFloat(0, 61, WriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 62, WriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 63, WriteIndex, Context.MapUpdate.Particles.Velocity.z);
OutputDataFloat(0, 64, WriteIndex, Context.MapUpdate.Particles.Volume);
;Ä?Ä@Äˇˇ
| enter_stat_scope();
| R[0] = inputdata_float();
| O[485] = inputdata_float();
| O[177] = inputdata_float();
| O[484] = inputdata_float();
| O[176] = inputdata_int32();
| O[483] = inputdata_int32();
| O[175] = inputdata_int32();
| O[37] = inputdata_int32();
| O[21] = inputdata_float();
| O[52] = inputdata_float();
| O[61] = inputdata_float();
| O[42] = inputdata_float();
| R[0] = acquireindex(C[7]);
| O[484] = mul(I[6], I[1]);
| O[177] = cmpeqi(C[0], C[1]);
| O[485] = b2i(O[177]);
| O[175] = cmpeqi_select(O[485], C[2], I[11], I[11]);
| O[61] = cmpeqi_select(O[485], C[2], C[3], C[3]);
| O[167] = cmpeqi_select(O[485], C[2], I[8], I[8]);
| O[485] = cmpeqi_select(O[485], C[2], I[9], I[10]);
| O[177] = b2i(O[177]);
| O[176] = cmpeqi_select(O[177], C[2], I[10], I[10]);
| exit_stat_scope();
| external_func_call(C[4], C[5], C[6], C[7]R[65535]);
| outputdata_int32(0, 44, R[0], O[485]);
| O[483] = mul(I[5], I[0]);
| O[177] = max(O[483], O[484]);
| O[485] = mul(I[7], I[2]);
| O[37] = max(O[485], O[177]);
| O[177] = maxi(O[167], C[6]);
| O[52] = i2f_div1(O[177], O[37]);
| O[177] = div(O[483], O[52]);
| O[177] = floor(O[177]);
| O[42] = f2i(O[177]);
| O[177] = div(O[484], O[52]);
| O[34] = f2i(O[177]);
| O[177] = div(O[485], O[52]);
| O[21] = f2i(O[177]);
| O[177] = i2f_mul(O[34], O[52]);
| O[177] = sub(O[177], O[484]);
| O[177] = abs(O[177]);
| O[37] = cmpgt(O[483], O[485]);
| O[37] = cmpgt_logic_and(O[483], O[484], O[37]);
| O[177] = cmpgt_logic_and(O[177], C[8], O[37]);
| O[37] = addi(O[34], C[6]);
| O[34] = select(O[177], O[37], O[34]);
| O[177] = i2f_mul(O[21], O[52]);
| O[177] = sub(O[177], O[485]);
| O[37] = addi(O[21], C[6]);
| O[21] = select(O[177], O[37], O[21]);
| O[177] = i2f_mul(O[42], O[52]);
| O[177] = sub(O[177], O[483]);
| O[37] = cmpgt(O[484], O[485]);
| O[37] = cmpgt_logic_and(O[484], O[483], O[37]);
| O[37] = addi(O[42], C[6]);
| O[42] = select(O[177], O[37], O[42]);
| O[177] = select(O[177], O[37], O[21]);
| O[37] = i2f_mul(O[42], O[52]);
| O[37] = sub(O[37], O[483]);
| O[37] = abs(O[37]);
| O[21] = cmpgt(O[485], O[484]);
| O[21] = cmpgt_logic_and(O[485], O[483], O[21]);
| O[37] = cmpgt_logic_and(O[37], C[8], O[21]);
| O[21] = addi(O[42], C[6]);
| O[37] = select(O[37], O[21], O[42]);
| O[21] = i2f_mul(O[34], O[52]);
| O[21] = sub(O[21], O[484]);
| O[21] = abs(O[21]);
| O[42] = cmpgt(O[485], O[484]);
| O[42] = cmpgt_logic_and(O[485], O[483], O[42]);
| O[21] = cmpgt_logic_and(O[21], C[8], O[42]);
| O[42] = addi(O[34], C[6]);
| O[21] = select(O[21], O[42], O[34]);
| O[42] = i2f_mul(O[37], O[52]);
| O[34] = i2f_mul(O[21], O[52]);
| O[67] = i2f_mul(O[177], O[52]);
| O[37] = i2f(O[37]);
| O[21] = i2f(O[21]);
| O[177] = i2f(O[177]);
| O[52] = f2i(O[37]);
| O[43] = f2i(O[21]);
| O[168] = f2i(O[177]);
| external_func_call(C[9], O[52], O[43], O[168]R[65535]);
| O[96] = div(O[42], O[37]);
| O[43] = div(O[34], O[21]);
| O[52] = div(O[67], O[177]);
| O[37] = f2i(O[37]);
| O[21] = f2i(O[21]);
| outputdata_int32(0, 1, R[0], C[2]);
| outputdata_int32(0, 2, R[0], C[2]);
| outputdata_int32(0, 12, R[0], C[2]);
| outputdata_int32(0, 13, R[0], C[2]);
| outputdata_int32(0, 14, R[0], C[2]);
| outputdata_int32(0, 15, R[0], C[2]);
| outputdata_int32(0, 22, R[0], O[21]);
| outputdata_int32(0, 42, R[0], C[2]);
| outputdata_int32(0, 61, R[0], C[2]);
| outputdata_int32(0, 62, R[0], C[2]);
| outputdata_int32(0, 63, R[0], C[2]);
| outputdata_int32(0, 64, R[0], C[2]);
| outputdata_int32(0, 65, R[0], C[2]);
| outputdata_int32(0, 66, R[0], C[2]);
| outputdata_int32(0, 67, R[0], C[2]);
| outputdata_int32(0, 68, R[0], C[2]);
| outputdata_int32(0, 70, R[0], C[2]);
| outputdata_int32(0, 71, R[0], C[2]);
| outputdata_int32(0, 72, R[0], C[2]);
| O[177] = f2i(O[177]);
| external_func_call(C[9]O[44], O[168], O[21]);
| O[44] = i2f(O[44]);
| O[168] = i2f(O[168]);
| O[19] = f2i(O[44]);
| O[40] = f2i(O[168]);
| O[94] = f2i(O[21]);
| external_func_call(C[10], O[19], O[40], O[94]R[65535]);
| O[19] = div(O[483], O[44]);
| outputdata_float(0, 0, R[0], C[21]);
| outputdata_float(0, 1, R[0], C[21]);
| outputdata_float(0, 2, R[0], C[21]);
| outputdata_float(0, 3, R[0], C[21]);
| outputdata_float(0, 4, R[0], C[21]);
| outputdata_float(0, 14, R[0], C[21]);
| outputdata_float(0, 15, R[0], C[21]);
| outputdata_float(0, 22, R[0], O[19]);
| outputdata_float(0, 58, R[0], C[21]);
| outputdata_float(0, 59, R[0], C[21]);
| outputdata_float(0, 60, R[0], C[21]);
| outputdata_float(0, 61, R[0], C[21]);
| outputdata_float(0, 62, R[0], C[21]);
| outputdata_float(0, 63, R[0], C[21]);
| outputdata_float(0, 65, R[0], C[21]);
| outputdata_float(0, 66, R[0], C[21]);
| outputdata_float(0, 67, R[0], C[21]);
| outputdata_float(0, 68, R[0], C[21]);
| outputdata_float(0, 69, R[0], C[21]);
| outputdata_float(0, 70, R[0], C[21]);
| outputdata_float(0, 71, R[0], C[21]);
| outputdata_float(0, 72, R[0], C[21]);
| outputdata_float(0, 73, R[0], C[21]);
| outputdata_float(0, 74, R[0], C[21]);
| outputdata_float(0, 75, R[0], C[21]);
| outputdata_float(0, 76, R[0], C[21]);
| outputdata_float(0, 77, R[0], C[21]);
| outputdata_float(0, 78, R[0], C[21]);
| outputdata_float(0, 79, R[0], C[21]);
| outputdata_float(0, 80, R[0], C[21]);
| outputdata_float(0, 81, R[0], C[21]);
| outputdata_float(0, 82, R[0], C[21]);
| outputdata_float(0, 83, R[0], C[21]);
| outputdata_float(0, 84, R[0], C[21]);
| outputdata_float(0, 85, R[0], C[21]);
| outputdata_float(0, 86, R[0], C[21]);
| outputdata_float(0, 87, R[0], C[21]);
| outputdata_float(0, 88, R[0], C[21]);
| outputdata_float(0, 89, R[0], C[21]);
| outputdata_float(0, 90, R[0], C[21]);
| outputdata_float(0, 91, R[0], C[21]);
| outputdata_float(0, 92, R[0], C[21]);
| outputdata_float(0, 93, R[0], C[21]);
| outputdata_float(0, 94, R[0], C[21]);
| outputdata_float(0, 95, R[0], C[21]);
| outputdata_float(0, 96, R[0], C[21]);
| outputdata_float(0, 97, R[0], C[21]);
| outputdata_float(0, 98, R[0], C[21]);
| outputdata_float(0, 99, R[0], C[21]);
| outputdata_float(0, 100, R[0], C[21]);
| outputdata_float(0, 101, R[0], C[21]);
| outputdata_float(0, 102, R[0], C[21]);
| outputdata_float(0, 104, R[0], C[21]);
| outputdata_float(0, 105, R[0], C[21]);
| outputdata_float(0, 106, R[0], C[21]);
| outputdata_float(0, 107, R[0], C[21]);
| outputdata_float(0, 108, R[0], C[21]);
| outputdata_float(0, 109, R[0], C[21]);
| outputdata_float(0, 110, R[0], C[21]);
| outputdata_float(0, 111, R[0], C[21]);
| outputdata_float(0, 112, R[0], C[21]);
| outputdata_float(0, 113, R[0], C[21]);
| outputdata_float(0, 128, R[0], C[21]);
| outputdata_float(0, 130, R[0], C[21]);
| outputdata_float(0, 131, R[0], C[21]);
| outputdata_float(0, 132, R[0], C[21]);
| outputdata_float(0, 133, R[0], C[21]);
| outputdata_float(0, 134, R[0], C[21]);
| outputdata_float(0, 135, R[0], C[21]);
| outputdata_float(0, 136, R[0], C[21]);
| outputdata_float(0, 137, R[0], C[21]);
| outputdata_float(0, 138, R[0], C[21]);
| outputdata_float(0, 139, R[0], C[21]);
| outputdata_float(0, 140, R[0], C[21]);
| outputdata_float(0, 141, R[0], C[21]);
| outputdata_float(0, 142, R[0], C[21]);
| outputdata_float(0, 143, R[0], C[21]);
| outputdata_float(0, 144, R[0], C[21]);
| outputdata_float(0, 145, R[0], C[21]);
| outputdata_float(0, 146, R[0], C[21]);
| outputdata_float(0, 150, R[0], C[21]);
| outputdata_float(0, 151, R[0], C[21]);
| outputdata_float(0, 152, R[0], C[21]);
| outputdata_float(0, 153, R[0], C[21]);
| outputdata_float(0, 154, R[0], C[21]);
| outputdata_float(0, 155, R[0], C[21]);
| outputdata_float(0, 156, R[0], C[21]);
| outputdata_float(0, 157, R[0], C[21]);
| outputdata_float(0, 158, R[0], C[21]);
| outputdata_float(0, 159, R[0], C[21]);
| outputdata_float(0, 160, R[0], C[21]);
| outputdata_float(0, 161, R[0], C[21]);
| outputdata_float(0, 162, R[0], C[21]);
| outputdata_float(0, 163, R[0], C[21]);
| outputdata_float(0, 164, R[0], C[21]);
| outputdata_float(0, 165, R[0], C[21]);
| outputdata_float(0, 166, R[0], C[21]);
| outputdata_float(0, 167, R[0], C[21]);
| outputdata_float(0, 168, R[0], C[21]);
| outputdata_float(0, 169, R[0], C[21]);
| outputdata_float(0, 170, R[0], C[21]);
| outputdata_float(0, 171, R[0], C[21]);
| outputdata_float(0, 172, R[0], C[21]);
| outputdata_float(0, 173, R[0], C[21]);
| outputdata_float(0, 174, R[0], C[21]);
| outputdata_float(0, 175, R[0], C[21]);
| outputdata_float(0, 176, R[0], C[21]);
| outputdata_float(0, 177, R[0], C[21]);
| outputdata_float(0, 178, R[0], C[21]);
| outputdata_float(0, 179, R[0], C[21]);
| outputdata_float(0, 180, R[0], C[21]);
| outputdata_float(0, 181, R[0], C[21]);
| outputdata_float(0, 182, R[0], C[21]);
| outputdata_float(0, 183, R[0], C[21]);
| outputdata_float(0, 184, R[0], C[21]);
| outputdata_float(0, 185, R[0], C[21]);
| outputdata_float(0, 186, R[0], C[21]);
| outputdata_float(0, 187, R[0], C[21]);
| outputdata_float(0, 188, R[0], C[21]);
| outputdata_float(0, 189, R[0], C[21]);
| outputdata_float(0, 190, R[0], C[21]);
| outputdata_float(0, 191, R[0], C[21]);
| outputdata_float(0, 192, R[0], C[21]);
| outputdata_float(0, 193, R[0], C[21]);
| outputdata_float(0, 194, R[0], C[21]);
| outputdata_float(0, 195, R[0], C[21]);
| outputdata_float(0, 196, R[0], C[21]);
| outputdata_float(0, 197, R[0], C[21]);
| outputdata_float(0, 198, R[0], C[21]);
| outputdata_float(0, 199, R[0], C[21]);
| outputdata_float(0, 200, R[0], C[21]);
| outputdata_float(0, 201, R[0], C[21]);
| outputdata_float(0, 202, R[0], C[21]);
| outputdata_float(0, 203, R[0], C[21]);
| outputdata_float(0, 205, R[0], C[21]);
| outputdata_float(0, 206, R[0], C[21]);
| outputdata_float(0, 207, R[0], C[21]);
| outputdata_float(0, 208, R[0], C[21]);
| outputdata_float(0, 209, R[0], C[21]);
| outputdata_float(0, 210, R[0], C[21]);
| outputdata_float(0, 211, R[0], C[21]);
| outputdata_float(0, 212, R[0], C[21]);
| outputdata_float(0, 213, R[0], C[21]);
| outputdata_float(0, 214, R[0], C[21]);
| outputdata_float(0, 215, R[0], C[21]);
| outputdata_float(0, 216, R[0], C[21]);
| outputdata_float(0, 217, R[0], C[21]);
| outputdata_float(0, 219, R[0], C[21]);
| outputdata_float(0, 220, R[0], C[21]);
| outputdata_float(0, 221, R[0], C[21]);
| outputdata_float(0, 222, R[0], C[21]);
| outputdata_float(0, 223, R[0], C[21]);
| outputdata_float(0, 224, R[0], C[21]);
| outputdata_float(0, 225, R[0], C[21]);
| outputdata_float(0, 226, R[0], C[21]);
| outputdata_float(0, 227, R[0], C[21]);
| outputdata_float(0, 228, R[0], C[21]);
| outputdata_float(0, 229, R[0], C[21]);
| outputdata_float(0, 230, R[0], C[21]);
| outputdata_float(0, 231, R[0], C[21]);
| outputdata_float(0, 232, R[0], C[21]);
| outputdata_float(0, 233, R[0], C[21]);
| outputdata_float(0, 234, R[0], C[21]);
| outputdata_float(0, 235, R[0], C[21]);
| outputdata_float(0, 236, R[0], C[21]);
| outputdata_float(0, 237, R[0], C[21]);
| outputdata_float(0, 239, R[0], C[21]);
| outputdata_float(0, 240, R[0], C[21]);
| outputdata_float(0, 241, R[0], C[21]);
| outputdata_float(0, 242, R[0], C[21]);
| outputdata_float(0, 244, R[0], C[21]);
| outputdata_float(0, 245, R[0], C[21]);
| outputdata_float(0, 246, R[0], C[21]);
| outputdata_float(0, 247, R[0], C[21]);
| outputdata_float(0, 249, R[0], C[21]);
| outputdata_float(0, 250, R[0], C[21]);
| outputdata_float(0, 251, R[0], C[21]);
| outputdata_float(0, 252, R[0], C[21]);
| outputdata_float(0, 254, R[0], C[21]);
| outputdata_float(0, 255, R[0], C[21]);
| outputdata_float(0, 256, R[0], C[21]);
| outputdata_float(0, 257, R[0], C[21]);
| outputdata_float(0, 258, R[0], C[21]);
| outputdata_float(0, 259, R[0], C[21]);
| outputdata_float(0, 260, R[0], C[21]);
| outputdata_float(0, 261, R[0], C[21]);
| outputdata_float(0, 262, R[0], C[21]);
| outputdata_float(0, 263, R[0], C[21]);
| outputdata_float(0, 264, R[0], C[21]);
| outputdata_float(0, 265, R[0], C[21]);
| outputdata_float(0, 266, R[0], C[21]);
| outputdata_float(0, 267, R[0], C[21]);
| outputdata_float(0, 268, R[0], C[21]);
| outputdata_float(0, 269, R[0], C[21]);
| outputdata_float(0, 270, R[0], C[21]);
| outputdata_float(0, 271, R[0], C[21]);
| outputdata_float(0, 272, R[0], C[21]);
| outputdata_float(0, 273, R[0], C[21]);
| outputdata_float(0, 274, R[0], C[21]);
| outputdata_float(0, 275, R[0], C[21]);
| outputdata_float(0, 276, R[0], C[21]);
| outputdata_float(0, 277, R[0], C[21]);
| outputdata_float(0, 278, R[0], C[21]);
| outputdata_float(0, 279, R[0], C[21]);
| outputdata_float(0, 280, R[0], C[21]);
| outputdata_float(0, 281, R[0], C[21]);
| outputdata_float(0, 282, R[0], C[21]);
| outputdata_float(0, 283, R[0], C[21]);
| outputdata_float(0, 284, R[0], C[21]);
| outputdata_float(0, 285, R[0], C[21]);
| outputdata_float(0, 287, R[0], C[21]);
| outputdata_float(0, 288, R[0], C[21]);
| outputdata_float(0, 289, R[0], C[21]);
| outputdata_float(0, 290, R[0], C[21]);
| outputdata_float(0, 292, R[0], C[21]);
| outputdata_float(0, 293, R[0], C[21]);
| outputdata_float(0, 294, R[0], C[21]);
| outputdata_float(0, 295, R[0], C[21]);
| outputdata_float(0, 297, R[0], C[21]);
| outputdata_float(0, 298, R[0], C[21]);
| outputdata_float(0, 299, R[0], C[21]);
| outputdata_float(0, 300, R[0], C[21]);
| outputdata_float(0, 303, R[0], C[21]);
| outputdata_float(0, 304, R[0], C[21]);
| outputdata_float(0, 305, R[0], C[21]);
| outputdata_float(0, 306, R[0], C[21]);
| outputdata_float(0, 308, R[0], C[21]);
| outputdata_float(0, 309, R[0], C[21]);
| outputdata_float(0, 310, R[0], C[21]);
| outputdata_float(0, 311, R[0], C[21]);
| outputdata_float(0, 313, R[0], C[21]);
| outputdata_float(0, 314, R[0], C[21]);
| outputdata_float(0, 315, R[0], C[21]);
| outputdata_float(0, 316, R[0], C[21]);
| outputdata_float(0, 318, R[0], C[21]);
| outputdata_float(0, 319, R[0], C[21]);
| outputdata_float(0, 320, R[0], C[21]);
| outputdata_float(0, 321, R[0], C[21]);
| outputdata_float(0, 322, R[0], C[21]);
| outputdata_float(0, 323, R[0], C[21]);
| outputdata_float(0, 324, R[0], C[21]);
| outputdata_float(0, 325, R[0], C[21]);
| outputdata_float(0, 326, R[0], C[21]);
| outputdata_float(0, 327, R[0], C[21]);
| outputdata_float(0, 328, R[0], C[21]);
| outputdata_float(0, 329, R[0], C[21]);
| outputdata_float(0, 330, R[0], C[21]);
| outputdata_float(0, 331, R[0], C[21]);
| outputdata_float(0, 332, R[0], C[21]);
| outputdata_float(0, 333, R[0], C[21]);
| outputdata_float(0, 335, R[0], C[21]);
| outputdata_float(0, 336, R[0], C[21]);
| outputdata_float(0, 337, R[0], C[21]);
| outputdata_float(0, 338, R[0], C[21]);
| outputdata_float(0, 340, R[0], C[21]);
| outputdata_float(0, 341, R[0], C[21]);
| outputdata_float(0, 342, R[0], C[21]);
| outputdata_float(0, 343, R[0], C[21]);
| outputdata_float(0, 345, R[0], C[21]);
| outputdata_float(0, 346, R[0], C[21]);
| outputdata_float(0, 347, R[0], C[21]);
| outputdata_float(0, 348, R[0], C[21]);
| outputdata_float(0, 350, R[0], C[21]);
| outputdata_float(0, 351, R[0], C[21]);
| outputdata_float(0, 352, R[0], C[21]);
| outputdata_float(0, 353, R[0], C[21]);
| outputdata_float(0, 354, R[0], C[21]);
| outputdata_float(0, 355, R[0], C[21]);
| outputdata_float(0, 357, R[0], C[21]);
| outputdata_float(0, 358, R[0], C[21]);
| outputdata_float(0, 359, R[0], C[21]);
| outputdata_float(0, 360, R[0], C[21]);
| outputdata_float(0, 361, R[0], C[21]);
| outputdata_float(0, 362, R[0], C[21]);
| outputdata_float(0, 363, R[0], C[21]);
| outputdata_float(0, 364, R[0], C[21]);
| outputdata_float(0, 365, R[0], C[21]);
| outputdata_float(0, 366, R[0], C[21]);
| outputdata_float(0, 367, R[0], C[21]);
| outputdata_float(0, 368, R[0], C[21]);
| outputdata_float(0, 369, R[0], C[21]);
| outputdata_float(0, 370, R[0], C[21]);
| outputdata_float(0, 371, R[0], C[21]);
| outputdata_float(0, 372, R[0], C[21]);
| outputdata_float(0, 373, R[0], C[21]);
| outputdata_float(0, 374, R[0], C[21]);
| outputdata_float(0, 375, R[0], C[21]);
| outputdata_float(0, 376, R[0], C[21]);
| outputdata_float(0, 377, R[0], C[21]);
| outputdata_float(0, 378, R[0], C[21]);
| outputdata_float(0, 379, R[0], C[21]);
| outputdata_float(0, 380, R[0], C[21]);
| outputdata_float(0, 381, R[0], C[21]);
| outputdata_float(0, 382, R[0], C[21]);
| outputdata_float(0, 383, R[0], C[21]);
| outputdata_float(0, 384, R[0], C[21]);
| outputdata_float(0, 385, R[0], C[21]);
| outputdata_float(0, 386, R[0], C[21]);
| outputdata_float(0, 387, R[0], C[21]);
| outputdata_float(0, 388, R[0], C[21]);
| outputdata_float(0, 389, R[0], C[21]);
| outputdata_float(0, 390, R[0], C[21]);
| outputdata_float(0, 391, R[0], C[21]);
| outputdata_float(0, 392, R[0], C[21]);
| outputdata_float(0, 393, R[0], C[21]);
| outputdata_float(0, 394, R[0], C[21]);
| outputdata_float(0, 395, R[0], C[21]);
| outputdata_float(0, 396, R[0], C[21]);
| outputdata_float(0, 397, R[0], C[21]);
| outputdata_float(0, 398, R[0], C[21]);
| outputdata_float(0, 399, R[0], C[21]);
| outputdata_float(0, 400, R[0], C[21]);
| outputdata_float(0, 401, R[0], C[21]);
| outputdata_float(0, 402, R[0], C[21]);
| outputdata_float(0, 403, R[0], C[21]);
| outputdata_float(0, 404, R[0], C[21]);
| outputdata_float(0, 405, R[0], C[21]);
| outputdata_float(0, 406, R[0], C[21]);
| outputdata_float(0, 407, R[0], C[21]);
| outputdata_float(0, 408, R[0], C[21]);
| outputdata_float(0, 409, R[0], C[21]);
| outputdata_float(0, 413, R[0], C[21]);
| outputdata_float(0, 414, R[0], C[21]);
| outputdata_float(0, 415, R[0], C[21]);
| outputdata_float(0, 416, R[0], C[21]);
| outputdata_float(0, 417, R[0], C[21]);
| outputdata_float(0, 418, R[0], C[21]);
| outputdata_float(0, 419, R[0], C[21]);
| outputdata_float(0, 420, R[0], C[21]);
| outputdata_float(0, 421, R[0], C[21]);
| outputdata_float(0, 422, R[0], C[21]);
| outputdata_float(0, 423, R[0], C[21]);
| outputdata_float(0, 424, R[0], C[21]);
| outputdata_float(0, 425, R[0], C[21]);
| outputdata_float(0, 426, R[0], C[21]);
| outputdata_float(0, 427, R[0], C[21]);
| outputdata_float(0, 428, R[0], C[21]);
| outputdata_float(0, 429, R[0], C[21]);
| outputdata_float(0, 430, R[0], C[21]);
| outputdata_float(0, 431, R[0], C[21]);
| outputdata_float(0, 432, R[0], C[21]);
| outputdata_float(0, 433, R[0], C[21]);
| outputdata_float(0, 434, R[0], C[21]);
| outputdata_float(0, 435, R[0], C[21]);
| outputdata_float(0, 436, R[0], C[21]);
| outputdata_float(0, 437, R[0], C[21]);
| outputdata_float(0, 438, R[0], C[21]);
| outputdata_float(0, 439, R[0], C[21]);
| outputdata_float(0, 440, R[0], C[21]);
| outputdata_float(0, 441, R[0], C[21]);
| outputdata_float(0, 442, R[0], C[21]);
| outputdata_float(0, 443, R[0], C[21]);
| outputdata_float(0, 444, R[0], C[21]);
| outputdata_float(0, 445, R[0], C[21]);
| outputdata_float(0, 446, R[0], C[21]);
| outputdata_float(0, 447, R[0], C[21]);
| outputdata_float(0, 448, R[0], C[21]);
| outputdata_float(0, 449, R[0], C[21]);
| outputdata_float(0, 450, R[0], C[21]);
| outputdata_float(0, 451, R[0], C[21]);
| outputdata_float(0, 452, R[0], C[21]);
| outputdata_float(0, 453, R[0], C[21]);
| outputdata_float(0, 454, R[0], C[21]);
| outputdata_float(0, 455, R[0], C[21]);
| outputdata_float(0, 456, R[0], C[21]);
| outputdata_float(0, 457, R[0], C[21]);
| outputdata_float(0, 458, R[0], C[21]);
| outputdata_float(0, 459, R[0], C[21]);
| outputdata_float(0, 460, R[0], C[21]);
| O[19] = div(O[484], O[168]);
| outputdata_float(0, 6, R[0], C[23]);
| outputdata_float(0, 9, R[0], C[23]);
| outputdata_float(0, 23, R[0], O[19]);
| outputdata_float(0, 64, R[0], C[23]);
| outputdata_float(0, 218, R[0], C[23]);
| outputdata_float(0, 238, R[0], C[23]);
| outputdata_float(0, 243, R[0], C[23]);
| outputdata_float(0, 248, R[0], C[23]);
| outputdata_float(0, 253, R[0], C[23]);
| outputdata_float(0, 286, R[0], C[23]);
| outputdata_float(0, 291, R[0], C[23]);
| outputdata_float(0, 296, R[0], C[23]);
| outputdata_float(0, 301, R[0], C[23]);
| outputdata_float(0, 302, R[0], C[23]);
| outputdata_float(0, 307, R[0], C[23]);
| outputdata_float(0, 312, R[0], C[23]);
| outputdata_float(0, 317, R[0], C[23]);
| outputdata_float(0, 334, R[0], C[23]);
| outputdata_float(0, 339, R[0], C[23]);
| outputdata_float(0, 344, R[0], C[23]);
| outputdata_float(0, 349, R[0], C[23]);
| outputdata_float(0, 356, R[0], C[23]);
| O[19] = div(O[485], O[21]);
| outputdata_float(0, 7, R[0], C[24]);
| outputdata_float(0, 24, R[0], O[19]);
| O[44] = f2i(O[44]);
| outputdata_float(0, 8, R[0], C[25]);
| outputdata_int32(0, 24, R[0], O[44]);
| O[168] = f2i(O[168]);
| outputdata_int32(0, 3, R[0], C[22]);
| outputdata_int32(0, 4, R[0], C[22]);
| outputdata_int32(0, 5, R[0], C[22]);
| outputdata_int32(0, 6, R[0], C[22]);
| outputdata_int32(0, 7, R[0], C[22]);
| outputdata_int32(0, 11, R[0], C[22]);
| outputdata_int32(0, 25, R[0], O[168]);
| O[168] = f2i(O[21]);
| external_func_call(C[9]O[19], O[44], O[21]);
| O[19] = i2f(O[19]);
| O[40] = f2i(O[19]);
| O[94] = f2i(O[44]);
| O[95] = f2i(O[21]);
| external_func_call(C[11], O[40], O[94], O[95]R[65535]);
| O[40] = div(O[483], O[19]);
| outputdata_float(0, 40, R[0], O[40]);
| O[40] = div(O[484], O[44]);
| outputdata_float(0, 41, R[0], O[40]);
| O[40] = div(O[485], O[21]);
| outputdata_float(0, 42, R[0], O[40]);
| O[19] = f2i(O[19]);
| outputdata_int32(0, 33, R[0], O[19]);
| outputdata_int32(0, 34, R[0], O[44]);
| outputdata_int32(0, 0, R[0], C[20]);
| outputdata_int32(0, 35, R[0], O[21]);
| external_func_call(C[1], O[40], O[94], O[95]R[65535]);
| outputdata_float(0, 28, R[0], O[40]);
| outputdata_float(0, 29, R[0], O[40]);
| outputdata_float(0, 30, R[0], O[40]);
| outputdata_int32(0, 27, R[0], O[19]);
| outputdata_int32(0, 28, R[0], O[44]);
| outputdata_float(0, 204, R[0], C[26]);
| outputdata_int32(0, 29, R[0], O[21]);
| external_func_call(C[12], O[40], O[94], O[95]R[65535]);
| outputdata_float(0, 46, R[0], O[40]);
| outputdata_float(0, 47, R[0], O[40]);
| outputdata_float(0, 48, R[0], O[40]);
| outputdata_int32(0, 36, R[0], O[19]);
| outputdata_int32(0, 37, R[0], O[44]);
| outputdata_int32(0, 38, R[0], O[21]);
| external_func_call(C[13], O[40], O[94], O[95]R[65535]);
| outputdata_float(0, 16, R[0], O[96]);
| O[96] = div(O[483], O[19]);
| outputdata_float(0, 52, R[0], O[96]);
| O[96] = div(O[484], O[44]);
| outputdata_float(0, 53, R[0], O[96]);
| O[96] = div(O[485], O[21]);
| outputdata_float(0, 54, R[0], O[96]);
| outputdata_int32(0, 39, R[0], O[19]);
| outputdata_int32(0, 40, R[0], O[44]);
| outputdata_int32(0, 41, R[0], O[21]);
| external_func_call(C[9]O[21]);
| outputdata_int32(0, 60, R[0], O[21]);
| external_func_call(C[14]O[21]);
| outputdata_int32(0, 55, R[0], O[21]);
| outputdata_int32(0, 26, R[0], O[168]);
| outputdata_int32(0, 59, R[0], O[21]);
| external_func_call(C[10]O[21]);
| outputdata_int32(0, 58, R[0], O[21]);
| outputdata_int32(0, 43, R[0], O[167]);
| outputdata_int32(0, 54, R[0], O[21]);
| external_func_call(C[1]O[21]);
| outputdata_int32(0, 56, R[0], O[21]);
| external_func_call(C[11]O[21]);
| outputdata_float(0, 21, R[0], O[67]);
| outputdata_int32(0, 57, R[0], O[21]);
| external_func_call(C[9]O[21], O[167], O[67]);
| outputdata_int32(0, 48, R[0], O[21]);
| O[21] = i2f_mul(O[21], O[61]);
| outputdata_int32(0, 49, R[0], O[167]);
| O[167] = i2f_mul(O[167], O[61]);
| outputdata_int32(0, 50, R[0], O[67]);
| O[67] = i2f_mul(O[67], O[61]);
| O[44] = f2i(O[167]);
| O[19] = f2i(O[67]);
| external_func_call(C[15], O[168], O[44], O[19]R[65535]);
| O[21] = div(O[483], O[21]);
| O[167] = div(O[484], O[167]);
| outputdata_float(0, 116, R[0], O[167]);
| O[67] = div(O[485], O[67]);
| outputdata_float(0, 117, R[0], O[67]);
| outputdata_float(0, 20, R[0], O[34]);
| outputdata_int32(0, 9, R[0], C[6]);
| outputdata_int32(0, 16, R[0], C[5]);
| outputdata_int32(0, 17, R[0], C[6]);
| outputdata_int32(0, 45, R[0], O[176]);
| outputdata_int32(0, 47, R[0], C[5]);
| O[176] = addi(C[5], C[6]);
| O[176] = i2f_mul(O[176], O[21]);
| outputdata_float(0, 114, R[0], O[21]);
| outputdata_float(0, 115, R[0], O[21]);
| outputdata_float(0, 129, R[0], O[21]);
| external_func_call(C[15], O[176]R[65535]);
| outputdata_int32(0, 23, R[0], O[177]);
| external_func_call(C[9]O[21], O[176], O[177]);
| O[34] = max(O[61], C[16]);
| outputdata_float(0, 17, R[0], O[43]);
| O[21] = i2f_mul(O[21], O[34]);
| O[176] = i2f_mul(O[176], O[34]);
| O[177] = i2f_mul(O[177], O[34]);
| O[34] = f2i(O[21]);
| O[43] = f2i(O[176]);
| O[67] = f2i(O[177]);
| external_func_call(C[17], O[34], O[43], O[67]R[65535]);
| outputdata_float(0, 19, R[0], O[42]);
| O[42] = div(O[483], O[21]);
| outputdata_float(0, 34, R[0], O[42]);
| O[42] = div(O[484], O[176]);
| outputdata_float(0, 35, R[0], O[42]);
| O[42] = div(O[485], O[177]);
| outputdata_float(0, 36, R[0], O[42]);
| outputdata_int32(0, 30, R[0], O[21]);
| O[176] = f2i(O[176]);
| outputdata_int32(0, 31, R[0], O[176]);
| outputdata_int32(0, 32, R[0], O[177]);
| O[176] = i2f_mul(O[176], O[61]);
| O[177] = i2f_mul(O[177], O[61]);
| outputdata_float(0, 103, R[0], O[61]);
| outputdata_float(0, 127, R[0], O[61]);
| outputdata_int32(0, 8, R[0], C[7]);
| outputdata_int32(0, 69, R[0], C[7]);
| O[61] = f2i(O[21]);
| O[42] = f2i(O[176]);
| external_func_call(C[18], O[61], O[42], O[34]R[65535]);
| outputdata_float(0, 18, R[0], O[52]);
| outputdata_int32(0, 18, R[0], O[21]);
| outputdata_int32(0, 19, R[0], O[176]);
| outputdata_int32(0, 20, R[0], O[177]);
| external_func_call(C[9]O[176], O[177], O[21]);
| outputdata_int32(0, 46, R[0], O[175]);
| O[175] = i2f(O[176]);
| outputdata_int32(0, 51, R[0], O[176]);
| O[176] = i2f(O[177]);
| outputdata_int32(0, 52, R[0], O[177]);
| O[177] = i2f(O[21]);
| outputdata_int32(0, 53, R[0], O[21]);
| O[21] = f2i(O[175]);
| O[52] = f2i(O[176]);
| O[61] = f2i(O[177]);
| external_func_call(C[19], O[21], O[52], O[61]R[65535]);
| outputdata_int32(0, 21, R[0], O[37]);
| O[175] = div(O[483], O[175]);
| outputdata_float(0, 11, R[0], O[483]);
| outputdata_float(0, 25, R[0], O[483]);
| outputdata_float(0, 31, R[0], O[483]);
| outputdata_float(0, 37, R[0], O[483]);
| outputdata_float(0, 43, R[0], O[483]);
| outputdata_float(0, 49, R[0], O[483]);
| outputdata_float(0, 55, R[0], O[483]);
| outputdata_float(0, 118, R[0], O[483]);
| outputdata_float(0, 121, R[0], O[175]);
| outputdata_float(0, 124, R[0], O[483]);
| outputdata_float(0, 147, R[0], O[483]);
| outputdata_float(0, 410, R[0], O[483]);
| O[176] = div(O[484], O[176]);
| outputdata_float(0, 12, R[0], O[484]);
| outputdata_float(0, 26, R[0], O[484]);
| outputdata_float(0, 32, R[0], O[484]);
| outputdata_float(0, 38, R[0], O[484]);
| outputdata_float(0, 44, R[0], O[484]);
| outputdata_float(0, 50, R[0], O[484]);
| outputdata_float(0, 56, R[0], O[484]);
| outputdata_float(0, 119, R[0], O[484]);
| outputdata_float(0, 122, R[0], O[176]);
| outputdata_float(0, 125, R[0], O[484]);
| outputdata_float(0, 148, R[0], O[484]);
| outputdata_float(0, 411, R[0], O[484]);
| O[177] = div(O[485], O[177]);
| outputdata_float(0, 13, R[0], O[485]);
| outputdata_float(0, 27, R[0], O[485]);
| outputdata_float(0, 33, R[0], O[485]);
| outputdata_float(0, 39, R[0], O[485]);
| outputdata_float(0, 45, R[0], O[485]);
| outputdata_float(0, 51, R[0], O[485]);
| outputdata_float(0, 57, R[0], O[485]);
| outputdata_float(0, 120, R[0], O[485]);
| outputdata_float(0, 123, R[0], O[177]);
| outputdata_float(0, 126, R[0], O[485]);
| outputdata_float(0, 149, R[0], O[485]);
| outputdata_float(0, 412, R[0], O[485]);
| outputdata_int32(0, 10, R[0], C[1]);
| outputdata_float(0, 5, R[0], I[3]);
| outputdata_float(0, 10, R[0], I[4]);
| done();
| O[6] = inputdata_float();
| O[428] = inputdata_float();
| O[427] = inputdata_int32();
| O[426] = inputdata_int32();
| O[425] = inputdata_float();
| O[424] = inputdata_int32();
| O[423] = inputdata_int32();
| O[422] = inputdata_int32();
| O[20] = inputdata_int32();
| O[207] = inputdata_int32();
| O[13] = inputdata_int32();
| O[280] = inputdata_float();
| O[22] = inputdata_float();
| O[147] = inputdata_float();
| O[532] = inputdata_int32();
| O[528] = inputdata_float();
| O[527] = inputdata_float();
| O[526] = inputdata_float();
| O[7] = inputdata_float();
| O[34] = inputdata_int32();
| O[36] = inputdata_int32();
| O[3] = inputdata_int32();
| O[4] = inputdata_int32();
| O[27] = inputdata_int32();
| O[479] = inputdata_int32();
| O[203] = inputdata_int32();
| O[473] = inputdata_int32();
| O[472] = inputdata_int32();
| O[471] = inputdata_float();
| O[150] = inputdata_float();
| O[191] = inputdata_float();
| O[358] = inputdata_float();
| O[467] = inputdata_float();
| O[483] = inputdata_float();
| O[265] = inputdata_int32();
| O[273] = inputdata_int32();
| O[510] = inputdata_int32();
| O[509] = inputdata_float();
| O[508] = inputdata_float();
| O[507] = inputdata_float();
| O[506] = inputdata_float();
| O[505] = inputdata_float();
| O[504] = inputdata_float();
| O[503] = inputdata_int32();
| O[502] = inputdata_int32();
| O[123] = inputdata_int32();
| O[338] = inputdata_float();
| O[122] = inputdata_float();
| O[138] = inputdata_float();
| O[331] = inputdata_float();
| O[330] = inputdata_float();
| O[523] = inputdata_float();
| O[522] = inputdata_int32();
| O[247] = inputdata_int32();
| O[521] = inputdata_int32();
| O[520] = inputdata_float();
| O[519] = inputdata_float();
| O[518] = inputdata_float();
| O[243] = inputdata_float();
| O[406] = inputdata_float();
| O[244] = inputdata_float();
| R[63] = inputdata_int32();
| R[64] = inputdata_int32();
| R[65] = inputdata_int32();
| R[66] = inputdata_float();
| R[67] = inputdata_float();
| R[68] = inputdata_float();
| R[69] = inputdata_float();
| R[70] = inputdata_float();
| R[71] = inputdata_float();
| R[72] = inputdata_int32();
| R[73] = inputdata_int32();
| R[74] = inputdata_int32();
| R[75] = inputdata_float();
| R[76] = inputdata_float();
| R[77] = inputdata_float();
| R[78] = inputdata_float();
| R[79] = inputdata_float();
| R[80] = inputdata_float();
| R[81] = inputdata_int32();
| R[82] = inputdata_int32();
| R[83] = inputdata_int32();
| R[84] = inputdata_float();
| R[85] = inputdata_float();
| R[86] = inputdata_float();
| R[87] = inputdata_float();
| R[88] = inputdata_float();
| R[89] = inputdata_float();
| R[90] = inputdata_float();
| R[91] = inputdata_float();
| R[92] = inputdata_float();
| R[93] = inputdata_float();
| R[94] = inputdata_float();
| R[95] = inputdata_float();
| R[96] = inputdata_float();
| R[97] = inputdata_float();
| R[98] = inputdata_int32();
| R[99] = inputdata_int32();
| R[100] = inputdata_int32();
| R[101] = inputdata_float();
| R[102] = inputdata_int32();
| R[103] = inputdata_float();
| R[104] = inputdata_int32();
| R[105] = inputdata_int32();
| R[106] = inputdata_int32();
| R[107] = inputdata_int32();
| R[108] = inputdata_float();
| R[109] = inputdata_float();
| R[110] = inputdata_float();
| R[111] = inputdata_float();
| R[112] = inputdata_float();
| R[113] = inputdata_float();
| R[114] = inputdata_int32();
| R[115] = inputdata_int32();
| R[116] = inputdata_int32();
| R[117] = inputdata_float();
| R[118] = inputdata_float();
| R[119] = inputdata_float();
| R[120] = inputdata_float();
| R[121] = inputdata_float();
| R[122] = inputdata_float();
| R[123] = inputdata_float();
| R[124] = inputdata_float();
| R[125] = inputdata_int32();
| R[126] = inputdata_int32();
| R[127] = inputdata_int32();
| R[128] = inputdata_int32();
| R[129] = inputdata_int32();
| R[130] = inputdata_int32();
| R[131] = inputdata_int32();
| R[132] = inputdata_float();
| R[133] = inputdata_float();
| R[134] = inputdata_float();
| R[135] = inputdata_float();
| R[136] = inputdata_float();
| R[137] = inputdata_float();
| R[138] = inputdata_int32();
| R[139] = inputdata_int32();
| R[140] = inputdata_float();
| R[141] = inputdata_float();
| R[142] = inputdata_float();
| R[143] = inputdata_int32();
| R[144] = inputdata_int32();
| R[145] = inputdata_int32();
| R[146] = inputdata_float();
| R[147] = inputdata_int32();
| R[148] = inputdata_int32();
| R[149] = inputdata_float();
| R[150] = inputdata_float();
| R[151] = inputdata_float();
| R[152] = inputdata_float();
| R[153] = inputdata_float();
| R[154] = inputdata_float();
| R[155] = inputdata_float();
| R[156] = inputdata_float();
| R[157] = inputdata_float();
| R[158] = inputdata_float();
| R[159] = inputdata_float();
| R[160] = inputdata_float();
| R[161] = inputdata_float();
| R[162] = inputdata_float();
| R[163] = inputdata_float();
| R[164] = inputdata_float();
| R[165] = inputdata_float();
| R[166] = inputdata_float();
| R[167] = inputdata_int32();
| R[168] = inputdata_float();
| R[169] = inputdata_float();
| R[170] = inputdata_float();
| R[171] = inputdata_float();
| R[0] = acquireindex(C[18]);
| O[427] = cmpeq_select(I[85], C[0], C[1], I[86]);
| O[428] = add(C[2], I[87]);
| O[6] = div_f2i(O[428], O[427]);
| O[6] = maxi(O[6], C[3]);
| O[426] = i2f_mul(O[6], O[427]);
| O[428] = sub(O[428], O[426]);
| O[426] = addi(O[6], I[146]);
| outputdata_int32(0, 72, R[0], O[426]);
| O[426] = add(I[85], C[2]);
| outputdata_float(0, 210, R[0], O[426]);
| O[6] = cmpgti(O[6], C[3]);
| O[427] = select(O[6], O[427], O[427]);
| O[428] = select(O[6], O[428], O[428]);
| O[6] = div(O[428], O[427]);
| outputdata_float(0, 211, R[0], O[427]);
| outputdata_float(0, 376, R[0], O[428]);
| outputdata_float(0, 377, R[0], O[6]);
| O[6] = cmplei(I[145], C[3]);
| O[427] = select(O[6], C[3], I[144]);
| O[428] = select(O[6], C[3], I[145]);
| O[6] = cmpneqi(I[170], C[3]);
| O[6] = cmplei_logic_and(O[428], C[4], O[6]);
| O[358] = select(O[6], I[170], O[427]);
| O[20] = select(O[6], C[4], O[428]);
| O[6] = add(I[155], I[155]);
| O[423] = add(I[156], I[156]);
| O[426] = add(I[157], I[157]);
| O[428] = mul(I[156], O[423]);
| O[427] = mul(I[156], O[426]);
| O[424] = mul(I[157], O[426]);
| O[425] = mul(I[158], O[423]);
| O[422] = mul(I[158], O[426]);
| O[502] = mad_sub1(I[156], O[423], O[424], C[5]);
| O[330] = mul_sub0(I[155], O[423], O[422]);
| O[338] = mad(I[155], O[426], O[425]);
| O[506] = mad(I[155], O[423], O[422]);
| O[122] = mad_sub1(I[155], O[6], O[424], C[5]);
| O[509] = mul_sub1(I[158], O[6], O[427]);
| O[510] = mul_sub0(I[155], O[426], O[425]);
| O[427] = mad(I[158], O[6], O[427]);
| O[6] = mul_add(I[155], O[6], O[428]);
| O[426] = sub(C[5], O[6]);
| O[6] = mul(I[168], I[161]);
| O[428] = mul(C[6], O[6]);
| O[483] = mul(I[166], I[159]);
| O[22] = mul_mad1(C[7], O[483], C[7], C[0]);
| O[4] = mul(I[167], I[160]);
| O[423] = mul_mad1(C[7], C[0], C[7], O[4]);
| O[424] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[425] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[425] = mad_add(C[7], C[0], O[425], C[5]);
| O[21] = mad_add(C[7], C[0], O[423], C[0]);
| O[422] = mad_add(C[7], O[6], O[424], C[0]);
| O[425] = add(O[425], C[0]);
| O[424] = mad(C[0], C[0], O[483]);
| O[280] = add_mad1(C[0], C[0], C[0], C[0]);
| O[27] = add_mad1(C[0], C[0], C[0], O[428]);
| O[207] = add_mad1(O[4], C[0], C[0], C[0]);
| O[526] = add_mad1(C[0], C[0], C[0], O[428]);
| O[423] = add_mad1(C[0], C[0], C[0], C[0]);
| O[13] = add_mad1(O[6], C[0], C[0], O[428]);
| O[203] = mad_mad0(C[7], C[0], O[22], O[425], C[0]);
| O[473] = add_mad1(O[21], C[0], O[425], C[0]);
| O[422] = add_mad1(O[422], C[0], O[425], O[428]);
| O[479] = mul_mad1(O[424], O[502], O[280], O[330]);
| O[3] = mul_mad1(O[424], O[506], O[280], O[122]);
| O[34] = mul_mad1(O[424], O[510], O[280], O[427]);
| O[424] = mul_mad1(O[424], C[0], O[280], C[0]);
| O[280] = mad(C[0], C[5], C[0]);
| O[36] = mad_add(O[27], C[0], O[424], O[280]);
| O[424] = mad(C[0], C[0], C[0]);
| O[7] = mul_mad1(O[424], O[502], O[207], O[330]);
| O[527] = mul_mad1(O[424], O[506], O[207], O[122]);
| O[528] = mul_mad1(O[424], O[510], O[207], O[427]);
| O[424] = mul_mad1(O[424], C[0], O[207], C[0]);
| O[207] = mad(C[0], C[5], C[0]);
| O[532] = mad_add(O[526], C[0], O[424], O[207]);
| O[147] = mul_mad1(O[424], O[502], O[423], O[330]);
| O[280] = mul_mad1(O[424], O[506], O[423], O[122]);
| O[21] = mul_mad1(O[424], O[510], O[423], O[427]);
| O[424] = mul_mad1(O[424], C[0], O[423], C[0]);
| O[423] = mad(C[0], C[5], C[0]);
| O[22] = mad_add(O[13], C[0], O[424], O[423]);
| O[207] = mul_mad1(O[203], O[502], O[473], O[330]);
| O[423] = mul_mad1(O[203], O[506], O[473], O[122]);
| O[424] = mul_mad1(O[203], O[510], O[473], O[427]);
| O[203] = mul_mad1(O[203], C[0], O[473], C[0]);
| O[203] = mad(O[422], C[0], O[203]);
| O[425] = mad_add(O[425], C[5], C[0], O[203]);
| O[3] = mad_add(O[27], O[509], O[3], C[0]);
| O[34] = mad_add(O[27], O[426], O[34], C[0]);
| O[138] = mad(I[148], I[151], I[152]);
| O[203] = mad_mad0(O[27], O[338], O[479], O[36], O[138]);
| O[123] = mad(I[149], I[151], I[153]);
| O[3] = mad(O[36], O[123], O[3]);
| O[467] = mad(I[150], I[151], I[154]);
| O[34] = mad(O[36], O[467], O[34]);
| O[27] = mad(O[36], C[5], C[0]);
| O[527] = mad_add(O[526], O[509], O[527], C[0]);
| O[528] = mad_add(O[526], O[426], O[528], C[0]);
| O[471] = mad_mad0(O[526], O[338], O[7], O[532], O[138]);
| O[472] = mad(O[532], O[123], O[527]);
| O[473] = mad(O[532], O[467], O[528]);
| O[150] = mad(O[532], C[5], C[0]);
| O[280] = mad_add(O[13], O[509], O[280], C[0]);
| O[21] = mad_add(O[13], O[426], O[21], C[0]);
| O[13] = mad_mad0(O[13], O[338], O[147], O[22], O[138]);
| O[280] = mad(O[22], O[123], O[280]);
| O[21] = mad(O[22], O[467], O[21]);
| O[191] = mad(O[22], C[5], C[0]);
| O[423] = mad_add(O[422], O[509], O[423], C[0]);
| O[424] = mad_add(O[422], O[426], O[424], C[0]);
| O[479] = mad_mad0(O[422], O[338], O[207], O[425], O[138]);
| O[36] = mad(O[425], O[123], O[423]);
| O[7] = mad(O[425], O[467], O[424]);
| O[425] = mad(O[425], C[5], C[0]);
| outputdata_float(0, 145, R[0], O[425]);
| outputdata_float(0, 301, R[0], O[425]);
| outputdata_float(0, 409, R[0], O[425]);
| O[425] = neg(O[138]);
| O[507] = neg(O[123]);
| O[207] = neg(O[467]);
| O[265] = rcp(O[483]);
| O[147] = rcp(O[4]);
| O[532] = rcp(O[6]);
| O[424] = neg(O[428]);
| O[423] = mul_mad1(O[425], O[502], O[507], O[506]);
| O[22] = mul_mad1(O[425], O[330], O[507], O[122]);
| O[422] = mul_mad1(O[425], O[338], O[507], O[509]);
| O[528] = mul_mad1(O[425], C[0], O[507], C[0]);
| O[505] = mad_add(O[207], C[0], O[528], C[5]);
| O[504] = mad_add(O[207], O[427], O[22], C[0]);
| O[22] = mad_add(O[207], O[426], O[422], C[0]);
| O[273] = neg(C[0]);
| O[423] = mad_mad0(O[207], O[510], O[423], O[505], O[273]);
| O[422] = neg(C[0]);
| O[527] = add_add(O[330], C[0], C[0]);
| O[518] = add_add(O[338], C[0], C[0]);
| O[528] = add_add(O[122], C[0], C[0]);
| O[522] = add_add(O[509], C[0], C[0]);
| O[508] = add_add(O[427], C[0], C[0]);
| O[526] = add_add(O[426], C[0], C[0]);
| O[244] = mad_add(O[505], O[422], O[504], C[0]);
| O[22] = mad_add(O[505], O[424], O[22], C[0]);
| O[406] = mad_add(O[505], C[5], C[0], C[0]);
| O[243] = mul_mad1(O[502], O[265], O[527], C[0]);
| O[519] = mul_mad1(O[502], C[0], O[527], O[147]);
| O[520] = mul_mad1(O[502], C[0], O[527], C[0]);
| O[527] = mul_mad1(O[502], C[0], O[527], C[0]);
| O[505] = add(C[0], C[0]);
| O[521] = mad_add(O[518], C[0], O[527], O[505]);
| O[247] = mul_mad1(O[506], O[265], O[528], C[0]);
| O[523] = mul_mad1(O[506], C[0], O[528], O[147]);
| O[331] = mul_mad1(O[506], C[0], O[528], C[0]);
| O[528] = mul_mad1(O[506], C[0], O[528], C[0]);
| O[527] = add(C[0], C[0]);
| O[503] = mad_add(O[522], C[0], O[528], O[527]);
| O[504] = mul_mad1(O[510], O[265], O[508], C[0]);
| O[527] = mul_mad1(O[510], C[0], O[508], O[147]);
| O[528] = mul_mad1(O[510], C[0], O[508], C[0]);
| O[508] = mul_mad1(O[510], C[0], O[508], C[0]);
| O[505] = mad_add(O[526], C[0], O[508], O[505]);
| O[265] = mul_mad1(O[423], O[265], O[244], C[0]);
| O[147] = mul_mad1(O[423], C[0], O[244], O[147]);
| O[508] = mul_mad1(O[423], C[0], O[244], C[0]);
| O[423] = mul_mad1(O[423], C[0], O[244], C[0]);
| O[423] = mad_add(O[22], C[0], O[423], O[406]);
| O[519] = mad_add(O[518], C[0], O[519], C[0]);
| O[520] = mad_add(O[518], O[532], O[520], C[0]);
| O[518] = mad_mad0(O[518], C[0], O[243], O[521], C[6]);
| outputdata_float(0, 182, R[0], O[518]);
| outputdata_float(0, 334, R[0], O[518]);
| outputdata_float(0, 445, R[0], O[518]);
| O[519] = mad(O[521], C[6], O[519]);
| outputdata_float(0, 183, R[0], O[519]);
| outputdata_float(0, 335, R[0], O[519]);
| outputdata_float(0, 446, R[0], O[519]);
| O[520] = mad(O[521], C[6], O[520]);
| outputdata_float(0, 184, R[0], O[520]);
| outputdata_float(0, 336, R[0], O[520]);
| outputdata_float(0, 447, R[0], O[520]);
| O[521] = add(O[521], C[0]);
| outputdata_float(0, 185, R[0], O[521]);
| outputdata_float(0, 337, R[0], O[521]);
| outputdata_float(0, 448, R[0], O[521]);
| O[523] = mad_add(O[522], C[0], O[523], C[0]);
| O[331] = mad_add(O[522], O[532], O[331], C[0]);
| O[522] = mad_mad0(O[522], C[0], O[247], O[503], C[6]);
| outputdata_float(0, 186, R[0], O[522]);
| outputdata_float(0, 338, R[0], O[522]);
| outputdata_float(0, 449, R[0], O[522]);
| O[523] = mad(O[503], C[6], O[523]);
| outputdata_float(0, 187, R[0], O[523]);
| outputdata_float(0, 339, R[0], O[523]);
| outputdata_float(0, 450, R[0], O[523]);
| O[331] = mad(O[503], C[6], O[331]);
| outputdata_float(0, 188, R[0], O[331]);
| outputdata_float(0, 340, R[0], O[331]);
| outputdata_float(0, 451, R[0], O[331]);
| O[503] = add(O[503], C[0]);
| outputdata_float(0, 189, R[0], O[503]);
| outputdata_float(0, 341, R[0], O[503]);
| outputdata_float(0, 452, R[0], O[503]);
| O[527] = mad_add(O[526], C[0], O[527], C[0]);
| O[528] = mad_add(O[526], O[532], O[528], C[0]);
| O[526] = mad_mad0(O[526], C[0], O[504], O[505], C[6]);
| O[527] = mad(O[505], C[6], O[527]);
| O[528] = mad(O[505], C[6], O[528]);
| O[505] = add(O[505], C[0]);
| outputdata_float(0, 193, R[0], O[505]);
| outputdata_float(0, 345, R[0], O[505]);
| outputdata_float(0, 456, R[0], O[505]);
| O[147] = mad_add(O[22], C[0], O[147], C[0]);
| O[532] = mad_add(O[22], O[532], O[508], C[0]);
| O[22] = mad_mad0(O[22], C[0], O[265], O[423], C[6]);
| O[147] = mad(O[423], C[6], O[147]);
| O[532] = mad(O[423], C[6], O[532]);
| O[423] = add(O[423], C[0]);
| outputdata_float(0, 197, R[0], O[423]);
| outputdata_float(0, 349, R[0], O[423]);
| outputdata_float(0, 460, R[0], O[423]);
| O[265] = mul_mad1(O[425], O[502], O[507], O[506]);
| O[508] = mul_mad1(O[425], O[330], O[507], O[122]);
| O[423] = mul_mad1(O[425], O[338], O[507], O[509]);
| O[425] = mul_mad1(O[425], C[0], O[507], C[0]);
| O[425] = mad_add(O[207], C[0], O[425], C[5]);
| O[505] = mad_add(O[207], O[427], O[508], C[0]);
| O[423] = mad_add(O[207], O[426], O[423], C[0]);
| O[207] = mad_mad0(O[207], O[510], O[265], O[425], O[273]);
| O[503] = add_add(O[330], C[0], C[0]);
| O[504] = add_add(O[338], C[0], C[0]);
| O[507] = add_add(O[122], C[0], C[0]);
| O[508] = add_add(O[509], C[0], C[0]);
| O[273] = add_add(O[427], C[0], C[0]);
| O[265] = add_add(O[426], C[0], C[0]);
| O[422] = mad_add(O[425], O[422], O[505], C[0]);
| O[423] = mad_add(O[425], O[424], O[423], C[0]);
| O[424] = mad_add(O[425], C[5], C[0], C[0]);
| O[505] = add(O[506], C[0]);
| O[425] = add(O[510], C[0]);
| O[331] = add(O[122], C[0]);
| O[427] = add(O[427], C[0]);
| O[509] = add(O[509], C[0]);
| O[426] = add(O[426], C[0]);
| outputdata_float(0, 69, R[0], O[505]);
| outputdata_float(0, 85, R[0], O[505]);
| outputdata_float(0, 239, R[0], O[505]);
| outputdata_float(0, 255, R[0], O[505]);
| outputdata_float(0, 70, R[0], O[425]);
| outputdata_float(0, 86, R[0], O[425]);
| outputdata_float(0, 240, R[0], O[425]);
| outputdata_float(0, 256, R[0], O[425]);
| O[122] = mul_mad1(C[0], O[502], C[0], O[330]);
| outputdata_float(0, 72, R[0], O[330]);
| outputdata_float(0, 88, R[0], O[330]);
| outputdata_float(0, 242, R[0], O[330]);
| outputdata_float(0, 258, R[0], O[330]);
| O[505] = mul_mad1(C[0], O[505], C[0], O[331]);
| outputdata_float(0, 73, R[0], O[331]);
| outputdata_float(0, 89, R[0], O[331]);
| outputdata_float(0, 243, R[0], O[331]);
| outputdata_float(0, 259, R[0], O[331]);
| O[425] = mul_mad1(C[0], O[425], C[0], O[427]);
| outputdata_float(0, 74, R[0], O[427]);
| outputdata_float(0, 90, R[0], O[427]);
| outputdata_float(0, 244, R[0], O[427]);
| outputdata_float(0, 260, R[0], O[427]);
| O[427] = mul_mad1(C[0], C[0], C[0], C[0]);
| outputdata_float(0, 76, R[0], O[338]);
| outputdata_float(0, 92, R[0], O[338]);
| outputdata_float(0, 246, R[0], O[338]);
| outputdata_float(0, 262, R[0], O[338]);
| outputdata_float(0, 77, R[0], O[509]);
| outputdata_float(0, 93, R[0], O[509]);
| outputdata_float(0, 247, R[0], O[509]);
| outputdata_float(0, 263, R[0], O[509]);
| outputdata_float(0, 78, R[0], O[426]);
| outputdata_float(0, 94, R[0], O[426]);
| outputdata_float(0, 248, R[0], O[426]);
| outputdata_float(0, 264, R[0], O[426]);
| O[338] = mad_add(O[428], O[338], O[122], O[138]);
| outputdata_float(0, 80, R[0], O[338]);
| outputdata_float(0, 96, R[0], O[338]);
| outputdata_float(0, 250, R[0], O[338]);
| outputdata_float(0, 266, R[0], O[338]);
| O[509] = mad_add(O[428], O[509], O[505], O[123]);
| outputdata_float(0, 81, R[0], O[509]);
| outputdata_float(0, 97, R[0], O[509]);
| outputdata_float(0, 251, R[0], O[509]);
| outputdata_float(0, 267, R[0], O[509]);
| O[426] = mad_add(O[428], O[426], O[425], O[467]);
| outputdata_float(0, 82, R[0], O[426]);
| outputdata_float(0, 98, R[0], O[426]);
| outputdata_float(0, 252, R[0], O[426]);
| outputdata_float(0, 268, R[0], O[426]);
| O[428] = mad_add(O[428], C[0], O[427], C[5]);
| outputdata_float(0, 83, R[0], O[428]);
| outputdata_float(0, 99, R[0], O[428]);
| outputdata_float(0, 253, R[0], O[428]);
| outputdata_float(0, 269, R[0], O[428]);
| O[425] = mul_mad1(C[7], O[483], C[7], C[0]);
| O[426] = mul_mad1(C[7], C[0], C[7], O[4]);
| O[427] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[428] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[425] = mad(C[7], C[0], O[425]);
| outputdata_float(0, 282, R[0], O[425]);
| outputdata_float(0, 390, R[0], O[425]);
| O[426] = mad(C[7], C[0], O[426]);
| outputdata_float(0, 283, R[0], O[426]);
| outputdata_float(0, 391, R[0], O[426]);
| O[427] = mad(C[7], O[6], O[427]);
| outputdata_float(0, 284, R[0], O[427]);
| outputdata_float(0, 392, R[0], O[427]);
| outputdata_int32(0, 3, R[0], I[90]);
| O[428] = mad_add(C[7], C[0], O[428], C[5]);
| outputdata_float(0, 285, R[0], O[428]);
| outputdata_float(0, 393, R[0], O[428]);
| O[428] = rcp(O[483]);
| outputdata_float(0, 222, R[0], O[428]);
| outputdata_float(0, 360, R[0], O[428]);
| O[428] = rcp(O[4]);
| outputdata_float(0, 227, R[0], O[428]);
| outputdata_float(0, 365, R[0], O[428]);
| O[428] = rcp(O[6]);
| outputdata_float(0, 232, R[0], O[428]);
| outputdata_float(0, 370, R[0], O[428]);
| O[509] = add(C[0], C[0]);
| O[467] = add(C[0], C[0]);
| external_func_call(O[502], O[503], O[504], O[505], O[506], O[507], O[508], O[509], O[510], O[273], O[265], O[467], O[207], O[422], O[423], O[424]O[425], O[426], O[427], O[428]);
| outputdata_float(0, 68, R[0], O[502]);
| outputdata_float(0, 84, R[0], O[502]);
| outputdata_float(0, 150, R[0], O[502]);
| outputdata_float(0, 151, R[0], O[503]);
| outputdata_float(0, 152, R[0], O[504]);
| outputdata_float(0, 153, R[0], O[505]);
| outputdata_float(0, 154, R[0], O[506]);
| outputdata_float(0, 155, R[0], O[507]);
| outputdata_float(0, 156, R[0], O[508]);
| outputdata_float(0, 157, R[0], O[509]);
| outputdata_float(0, 158, R[0], O[510]);
| outputdata_float(0, 159, R[0], O[273]);
| outputdata_float(0, 160, R[0], O[265]);
| outputdata_float(0, 161, R[0], O[467]);
| outputdata_float(0, 162, R[0], O[207]);
| outputdata_float(0, 163, R[0], O[422]);
| outputdata_float(0, 164, R[0], O[423]);
| outputdata_float(0, 165, R[0], O[424]);
| outputdata_float(0, 166, R[0], O[502]);
| outputdata_float(0, 167, R[0], O[503]);
| outputdata_float(0, 168, R[0], O[504]);
| outputdata_float(0, 169, R[0], O[505]);
| outputdata_float(0, 170, R[0], O[506]);
| outputdata_float(0, 171, R[0], O[507]);
| outputdata_float(0, 172, R[0], O[508]);
| outputdata_float(0, 173, R[0], O[509]);
| outputdata_float(0, 174, R[0], O[510]);
| outputdata_float(0, 175, R[0], O[273]);
| outputdata_float(0, 176, R[0], O[265]);
| outputdata_float(0, 177, R[0], O[467]);
| outputdata_float(0, 178, R[0], O[207]);
| outputdata_float(0, 179, R[0], O[422]);
| outputdata_float(0, 180, R[0], O[423]);
| outputdata_float(0, 181, R[0], O[424]);
| outputdata_float(0, 238, R[0], O[502]);
| outputdata_float(0, 254, R[0], O[502]);
| outputdata_float(0, 302, R[0], O[502]);
| outputdata_float(0, 303, R[0], O[503]);
| outputdata_float(0, 304, R[0], O[504]);
| outputdata_float(0, 305, R[0], O[505]);
| outputdata_float(0, 306, R[0], O[506]);
| outputdata_float(0, 307, R[0], O[507]);
| outputdata_float(0, 308, R[0], O[508]);
| outputdata_float(0, 309, R[0], O[509]);
| outputdata_float(0, 310, R[0], O[510]);
| outputdata_float(0, 311, R[0], O[273]);
| outputdata_float(0, 312, R[0], O[265]);
| outputdata_float(0, 313, R[0], O[467]);
| outputdata_float(0, 314, R[0], O[207]);
| outputdata_float(0, 315, R[0], O[422]);
| outputdata_float(0, 316, R[0], O[423]);
| outputdata_float(0, 317, R[0], O[424]);
| outputdata_float(0, 318, R[0], O[502]);
| outputdata_float(0, 319, R[0], O[503]);
| outputdata_float(0, 320, R[0], O[504]);
| outputdata_float(0, 321, R[0], O[505]);
| outputdata_float(0, 322, R[0], O[506]);
| outputdata_float(0, 323, R[0], O[507]);
| outputdata_float(0, 324, R[0], O[508]);
| outputdata_float(0, 325, R[0], O[509]);
| outputdata_float(0, 326, R[0], O[510]);
| outputdata_float(0, 327, R[0], O[273]);
| outputdata_float(0, 328, R[0], O[265]);
| outputdata_float(0, 329, R[0], O[467]);
| outputdata_float(0, 330, R[0], O[207]);
| outputdata_float(0, 331, R[0], O[422]);
| outputdata_float(0, 332, R[0], O[423]);
| outputdata_float(0, 333, R[0], O[424]);
| outputdata_float(0, 413, R[0], O[502]);
| outputdata_float(0, 414, R[0], O[503]);
| outputdata_float(0, 415, R[0], O[504]);
| outputdata_float(0, 416, R[0], O[505]);
| outputdata_float(0, 417, R[0], O[506]);
| outputdata_float(0, 418, R[0], O[507]);
| outputdata_float(0, 419, R[0], O[508]);
| outputdata_float(0, 420, R[0], O[509]);
| outputdata_float(0, 421, R[0], O[510]);
| outputdata_float(0, 422, R[0], O[273]);
| outputdata_float(0, 423, R[0], O[265]);
| outputdata_float(0, 424, R[0], O[467]);
| outputdata_float(0, 425, R[0], O[207]);
| outputdata_float(0, 426, R[0], O[422]);
| outputdata_float(0, 427, R[0], O[423]);
| outputdata_float(0, 428, R[0], O[424]);
| outputdata_float(0, 429, R[0], O[502]);
| outputdata_float(0, 430, R[0], O[503]);
| outputdata_float(0, 431, R[0], O[504]);
| outputdata_float(0, 432, R[0], O[505]);
| outputdata_float(0, 433, R[0], O[506]);
| outputdata_float(0, 434, R[0], O[507]);
| outputdata_float(0, 435, R[0], O[508]);
| outputdata_float(0, 436, R[0], O[509]);
| outputdata_float(0, 437, R[0], O[510]);
| outputdata_float(0, 438, R[0], O[273]);
| outputdata_float(0, 439, R[0], O[265]);
| outputdata_float(0, 440, R[0], O[467]);
| outputdata_float(0, 441, R[0], O[207]);
| outputdata_float(0, 442, R[0], O[422]);
| outputdata_float(0, 443, R[0], O[423]);
| outputdata_float(0, 444, R[0], O[424]);
| O[422] = mul_mad1(O[203], C[6], O[471], C[6]);
| O[423] = mul_mad1(O[3], C[6], O[472], C[6]);
| O[424] = mul_mad1(O[34], C[6], O[473], C[6]);
| O[422] = mad_add(O[13], C[6], O[422], O[479]);
| O[423] = mad_add(O[280], C[6], O[423], O[36]);
| O[424] = mad_add(O[21], C[6], O[424], O[7]);
| O[428] = mul(O[428], C[8]);
| O[422] = mad(I[148], I[151], O[422]);
| O[423] = mad(I[149], I[151], O[423]);
| O[424] = mad(I[150], I[151], O[424]);
| O[207] = cmpeq_select(I[81], C[0], C[9], I[82]);
| outputdata_float(0, 202, R[0], O[207]);
| O[207] = add(I[81], C[2]);
| outputdata_float(0, 198, R[0], O[207]);
| O[207] = clamp(I[147], C[0], C[10]);
| outputdata_float(0, 207, R[0], O[207]);
| O[207] = cmpneqi(I[142], C[11]);
| O[207] = cmpnei_logic_and(I[142], C[12], O[207]);
| O[207] = cmpeqi_logic_and(O[20], C[3], O[207]);
| O[207] = cmplei_logic_and(I[143], O[20], O[207]);
| O[467] = cmpeqi(I[142], C[13]);
| O[467] = cmpeqi_logic_or(I[142], C[4], O[467]);
| O[467] = cmpeqi_logic_and(O[358], C[4], O[467]);
| O[467] = b2i(O[467]);
| O[467] = cmpeqi_select(O[467], C[3], O[358], C[13]);
| O[265] = select(O[207], O[467], I[142]);
| O[467] = select(O[207], O[20], I[143]);
| O[207] = cmpeqi(O[20], C[4]);
| O[207] = cmpnei_logic_and(O[358], C[3], O[207]);
| O[273] = cmpneqi(O[265], C[12]);
| O[273] = cmpnei_logic_and(O[265], C[11], O[273]);
| O[207] = logic_and(O[207], O[273]);
| O[207] = cmplei_logic_and(O[467], C[13], O[207]);
| O[265] = select(O[207], C[13], O[265]);
| O[467] = select(O[207], C[13], O[467]);
| O[207] = cmpneqi(O[467], C[3]);
| O[207] = cmpnei_logic_and(O[265], C[3], O[207]);
| O[207] = cmpeqi_logic_and(I[171], C[3], O[207]);
| O[207] = cmplei_logic_and(O[467], C[11], O[207]);
| O[265] = select(O[207], C[11], O[265]);
| outputdata_int32(0, 61, R[0], O[265]);
| O[207] = select(O[207], C[11], O[467]);
| outputdata_int32(0, 62, R[0], O[207]);
| O[207] = mul(I[163], C[2]);
| O[467] = mul(I[162], C[2]);
| O[467] = mul_mad1(O[207], O[207], O[467], O[467]);
| O[207] = mul(I[164], C[2]);
| O[207] = mad_sqrt(O[207], O[207], O[467]);
| O[207] = fmod_add(I[83], C[14], O[207]);
| outputdata_float(0, 203, R[0], O[207]);
| O[467] = add(C[2], I[84]);
| O[207] = sub_neg(O[467], C[2]);
| outputdata_float(0, 208, R[0], O[207]);
| outputdata_float(0, 205, R[0], O[467]);
| O[467] = neg_cmplt(O[467], C[0]);
| O[207] = cmpge_logic_and(O[207], C[0], O[467]);
| O[467] = f2i_maxi(I[165], C[13]);
| O[207] = b2i(O[207]);
| O[207] = cmpeqi_select(O[207], C[3], C[3], O[467]);
| outputdata_int32(0, 67, R[0], O[207]);
| external_func_call(C[3]O[467], O[207], O[273]);
| O[265] = i2f(O[467]);
| outputdata_int32(0, 64, R[0], O[467]);
| O[467] = i2f(O[207]);
| outputdata_int32(0, 65, R[0], O[207]);
| O[207] = i2f(O[273]);
| outputdata_int32(0, 66, R[0], O[273]);
| O[265] = max(O[265], C[5]);
| O[467] = max(O[467], C[5]);
| O[207] = max(O[207], C[5]);
| O[265] = div(O[483], O[265]);
| outputdata_float(0, 199, R[0], O[265]);
| outputdata_float(0, 204, R[0], O[265]);
| outputdata_float(0, 270, R[0], O[483]);
| outputdata_float(0, 378, R[0], O[483]);
| O[467] = div(O[4], O[467]);
| outputdata_float(0, 200, R[0], O[467]);
| outputdata_float(0, 275, R[0], O[4]);
| outputdata_float(0, 383, R[0], O[4]);
| outputdata_float(0, 411, R[0], O[4]);
| O[207] = div(O[6], O[207]);
| outputdata_float(0, 201, R[0], O[207]);
| outputdata_float(0, 280, R[0], O[6]);
| outputdata_float(0, 388, R[0], O[6]);
| outputdata_float(0, 412, R[0], O[6]);
| O[6] = cmpeq_select(I[0], C[0], C[9], I[1]);
| outputdata_float(0, 1, R[0], O[6]);
| outputdata_int32(0, 5, R[0], I[92]);
| O[6] = add(I[0], C[2]);
| outputdata_float(0, 0, R[0], O[6]);
| outputdata_int32(0, 6, R[0], I[93]);
| O[6] = cmpneqi(I[88], C[11]);
| O[6] = cmpnei_logic_and(I[88], C[12], O[6]);
| O[6] = cmpeqi_logic_and(O[20], C[3], O[6]);
| O[207] = cmplei_logic_and(I[89], O[20], O[6]);
| O[6] = cmpeqi(I[88], C[13]);
| O[6] = cmpeqi_logic_or(I[88], C[4], O[6]);
| O[6] = cmpeqi_logic_and(O[358], C[4], O[6]);
| O[6] = b2i(O[6]);
| O[6] = cmpeqi_select(O[6], C[3], O[358], C[13]);
| O[6] = select(O[207], O[6], I[88]);
| O[207] = select(O[207], O[20], I[89]);
| O[4] = cmpneqi(O[358], C[3]);
| outputdata_int32(0, 70, R[0], O[358]);
| outputdata_int32(0, 71, R[0], O[20]);
| O[20] = cmpeqi_logic_and(O[20], C[4], O[4]);
| O[4] = cmpneqi(O[6], C[12]);
| O[4] = cmpnei_logic_and(O[6], C[11], O[4]);
| O[20] = logic_and(O[20], O[4]);
| O[20] = cmplei_logic_and(O[207], C[13], O[20]);
| O[6] = select(O[20], C[13], O[6]);
| O[207] = select(O[20], C[13], O[207]);
| O[20] = cmpneqi(O[6], C[3]);
| O[20] = cmpnei_logic_and(O[207], C[3], O[20]);
| O[20] = cmpeqi_logic_and(I[169], C[3], O[20]);
| O[20] = cmplei_logic_and(O[207], C[11], O[20]);
| O[6] = select(O[20], C[11], O[6]);
| O[207] = select(O[20], C[11], O[207]);
| O[20] = mul(I[163], C[2]);
| O[4] = mul(I[162], C[2]);
| O[4] = mul_mad1(O[20], O[20], O[4], O[4]);
| O[20] = mul(I[164], C[2]);
| O[20] = mad_sqrt(O[20], O[20], O[4]);
| outputdata_float(0, 7, R[0], I[5]);
| O[20] = fmod_add(I[2], C[14], O[20]);
| external_func_call(C[13]O[4], R[65535], R[65535]);
| O[4] = i2f_div1(O[4], I[78]);
| outputdata_float(0, 4, R[0], O[4]);
| outputdata_float(0, 111, R[0], I[78]);
| outputdata_float(0, 147, R[0], I[78]);
| O[4] = mul_mad1(O[3], O[3], O[203], O[203]);
| O[4] = mad_mad0(O[34], O[34], O[4], O[27], O[27]);
| outputdata_float(0, 133, R[0], O[27]);
| outputdata_float(0, 289, R[0], O[27]);
| outputdata_float(0, 397, R[0], O[27]);
| O[4] = sqrt(O[4]);
| O[27] = mul_mad1(O[472], O[472], O[471], O[471]);
| O[27] = mad_mad0(O[473], O[473], O[27], O[150], O[150]);
| outputdata_float(0, 137, R[0], O[150]);
| outputdata_float(0, 293, R[0], O[150]);
| outputdata_float(0, 401, R[0], O[150]);
| O[150] = sqrt(O[27]);
| O[27] = mul_mad1(O[280], O[280], O[13], O[13]);
| O[27] = mad_mad0(O[21], O[21], O[27], O[191], O[191]);
| outputdata_float(0, 141, R[0], O[191]);
| outputdata_float(0, 297, R[0], O[191]);
| outputdata_float(0, 405, R[0], O[191]);
| O[27] = sqrt(O[27]);
| O[4] = mul(O[4], C[6]);
| O[467] = mul(O[150], C[6]);
| O[27] = mul(O[27], C[6]);
| O[150] = mul_mad1(O[203], C[6], O[471], C[6]);
| O[191] = mul_mad1(O[3], C[6], O[472], C[6]);
| O[358] = mul_mad1(O[34], C[6], O[473], C[6]);
| O[150] = mad_add(O[13], C[6], O[150], O[479]);
| O[191] = mad_add(O[280], C[6], O[191], O[36]);
| O[358] = mad_add(O[21], C[6], O[358], O[7]);
| external_func_call(C[4], I[127], O[150], O[191], O[358], I[155], I[156], I[157], I[158], O[4], O[467], O[27], C[5], C[0], C[0], C[5]);
| outputdata_int32(0, 46, R[0], I[127]);
| outputdata_float(0, 130, R[0], O[203]);
| outputdata_float(0, 286, R[0], O[203]);
| outputdata_float(0, 394, R[0], O[203]);
| outputdata_float(0, 131, R[0], O[3]);
| outputdata_float(0, 287, R[0], O[3]);
| outputdata_float(0, 395, R[0], O[3]);
| outputdata_float(0, 132, R[0], O[34]);
| outputdata_float(0, 288, R[0], O[34]);
| outputdata_float(0, 396, R[0], O[34]);
| O[203] = mul_mad1(O[203], C[6], O[471], C[6]);
| outputdata_float(0, 134, R[0], O[471]);
| outputdata_float(0, 290, R[0], O[471]);
| outputdata_float(0, 398, R[0], O[471]);
| O[3] = mul_mad1(O[3], C[6], O[472], C[6]);
| outputdata_float(0, 135, R[0], O[472]);
| outputdata_float(0, 291, R[0], O[472]);
| outputdata_float(0, 399, R[0], O[472]);
| O[34] = mul_mad1(O[34], C[6], O[473], C[6]);
| outputdata_float(0, 136, R[0], O[473]);
| outputdata_float(0, 292, R[0], O[473]);
| outputdata_float(0, 400, R[0], O[473]);
| outputdata_float(0, 138, R[0], O[13]);
| outputdata_float(0, 294, R[0], O[13]);
| outputdata_float(0, 402, R[0], O[13]);
| outputdata_float(0, 139, R[0], O[280]);
| outputdata_float(0, 295, R[0], O[280]);
| outputdata_float(0, 403, R[0], O[280]);
| outputdata_float(0, 140, R[0], O[21]);
| outputdata_float(0, 296, R[0], O[21]);
| outputdata_float(0, 404, R[0], O[21]);
| O[13] = mad_add(O[13], C[6], O[203], O[479]);
| outputdata_float(0, 142, R[0], O[479]);
| outputdata_float(0, 298, R[0], O[479]);
| outputdata_float(0, 406, R[0], O[479]);
| O[280] = mad_add(O[280], C[6], O[3], O[36]);
| outputdata_float(0, 143, R[0], O[36]);
| outputdata_float(0, 299, R[0], O[36]);
| outputdata_float(0, 407, R[0], O[36]);
| O[21] = mad_add(O[21], C[6], O[34], O[7]);
| outputdata_float(0, 8, R[0], I[6]);
| outputdata_float(0, 9, R[0], I[7]);
| outputdata_float(0, 144, R[0], O[7]);
| outputdata_float(0, 300, R[0], O[7]);
| outputdata_float(0, 408, R[0], O[7]);
| O[7] = mul(I[155], C[16]);
| O[7] = mul_add(I[158], C[15], O[7]);
| O[34] = mul(I[155], C[15]);
| O[3] = mul_mad1(I[158], C[16], O[34], C[8]);
| O[34] = mul(I[156], C[16]);
| O[34] = mad_add(C[0], C[8], C[0], O[34]);
| O[36] = mul(I[156], C[15]);
| O[36] = add_mad1(C[0], C[0], O[36], C[8]);
| O[7] = add_mad1(C[0], O[7], C[0], C[8]);
| O[34] = mul_add(I[157], C[15], O[34]);
| O[36] = mul_add(I[157], C[16], O[36]);
| O[3] = mad_mad0(C[0], C[8], O[3], C[0], C[8]);
| outputdata_int32(0, 4, R[0], I[91]);
| external_func_call(C[4], C[17], O[13], O[280], O[21], O[7], O[34], O[36], O[3], O[4], O[27], I[100], I[102], C[6], C[0], C[0], C[5]);
| outputdata_int32(0, 2, R[0], O[207]);
| outputdata_int32(0, 18, R[0], I[100]);
| outputdata_int32(0, 20, R[0], I[102]);
| O[207] = add(C[2], I[61]);
| outputdata_float(0, 2, R[0], C[2]);
| outputdata_float(0, 3, R[0], O[20]);
| O[20] = sub_neg(O[207], C[2]);
| outputdata_float(0, 14, R[0], O[20]);
| outputdata_float(0, 100, R[0], O[207]);
| O[207] = neg_cmplt(O[207], C[0]);
| O[280] = cmpge_logic_and(O[20], C[0], O[207]);
| external_func_call(C[13]O[207], O[13], O[21]);
| O[20] = mad(O[526], I[8], O[22]);
| outputdata_float(0, 190, R[0], O[526]);
| outputdata_float(0, 194, R[0], O[22]);
| outputdata_float(0, 342, R[0], O[526]);
| outputdata_float(0, 346, R[0], O[22]);
| outputdata_float(0, 453, R[0], O[526]);
| outputdata_float(0, 457, R[0], O[22]);
| O[22] = mad(O[527], I[8], O[147]);
| outputdata_float(0, 191, R[0], O[527]);
| outputdata_float(0, 195, R[0], O[147]);
| outputdata_float(0, 343, R[0], O[527]);
| outputdata_float(0, 347, R[0], O[147]);
| outputdata_float(0, 454, R[0], O[527]);
| outputdata_float(0, 458, R[0], O[147]);
| O[147] = mad(O[528], I[8], O[532]);
| outputdata_float(0, 192, R[0], O[528]);
| outputdata_float(0, 196, R[0], O[532]);
| outputdata_float(0, 344, R[0], O[528]);
| outputdata_float(0, 348, R[0], O[532]);
| outputdata_float(0, 455, R[0], O[528]);
| outputdata_float(0, 459, R[0], O[532]);
| external_func_call(C[13], O[20], O[22], O[147]R[65535], R[65535], O[20]);
| O[20] = ceil(O[20]);
| O[20] = f2i(O[20]);
| O[20] = clampi(O[20], C[3], O[21]);
| O[21] = muli(O[207], O[13]);
| O[21] = muli(O[21], O[20]);
| O[21] = muli(O[21], I[125]);
| outputdata_int32(0, 44, R[0], I[125]);
| O[21] = i2f_mul(O[21], I[4]);
| outputdata_float(0, 6, R[0], I[4]);
| O[22] = max(O[21], C[5]);
| outputdata_float(0, 237, R[0], C[5]);
| outputdata_float(0, 375, R[0], C[5]);
| O[21] = cmpeq_select(O[21], C[0], C[0], O[22]);
| O[280] = f2i_select1(O[280], O[21], C[3]);
| O[21] = cmpgti(O[280], C[3]);
| outputdata_int32(0, 11, R[0], O[21]);
| outputdata_int32(0, 12, R[0], O[280]);
| O[207] = muli(O[207], O[13]);
| O[207] = muli(O[207], O[20]);
| outputdata_int32(0, 14, R[0], O[207]);
| outputdata_int32(0, 15, R[0], O[20]);
| O[13] = neg(C[6]);
| O[20] = mad(I[166], O[13], C[0]);
| O[207] = mad(I[167], O[13], C[0]);
| O[280] = mul(I[168], C[6]);
| O[13] = mad(I[168], O[13], O[280]);
| O[21] = mad(I[167], C[6], C[0]);
| outputdata_float(0, 15, R[0], C[0]);
| outputdata_float(0, 65, R[0], C[0]);
| outputdata_float(0, 66, R[0], C[0]);
| outputdata_float(0, 71, R[0], C[0]);
| outputdata_float(0, 75, R[0], C[0]);
| outputdata_float(0, 79, R[0], C[0]);
| outputdata_float(0, 87, R[0], C[0]);
| outputdata_float(0, 91, R[0], C[0]);
| outputdata_float(0, 95, R[0], C[0]);
| outputdata_float(0, 101, R[0], C[0]);
| O[22] = clamp(I[147], C[0], C[10]);
| outputdata_float(0, 128, R[0], O[22]);
| outputdata_float(0, 206, R[0], C[0]);
| outputdata_float(0, 209, R[0], C[0]);
| outputdata_float(0, 219, R[0], C[0]);
| outputdata_float(0, 220, R[0], C[0]);
| outputdata_float(0, 223, R[0], C[0]);
| outputdata_float(0, 224, R[0], C[0]);
| outputdata_float(0, 225, R[0], C[0]);
| outputdata_float(0, 226, R[0], C[0]);
| outputdata_float(0, 228, R[0], C[0]);
| outputdata_float(0, 229, R[0], C[0]);
| outputdata_float(0, 230, R[0], C[0]);
| outputdata_float(0, 231, R[0], C[0]);
| outputdata_float(0, 233, R[0], C[0]);
| outputdata_float(0, 241, R[0], C[0]);
| outputdata_float(0, 245, R[0], C[0]);
| outputdata_float(0, 249, R[0], C[0]);
| outputdata_float(0, 257, R[0], C[0]);
| outputdata_float(0, 261, R[0], C[0]);
| outputdata_float(0, 265, R[0], C[0]);
| outputdata_float(0, 271, R[0], C[0]);
| outputdata_float(0, 272, R[0], C[0]);
| outputdata_float(0, 273, R[0], C[0]);
| outputdata_float(0, 274, R[0], C[0]);
| outputdata_float(0, 276, R[0], C[0]);
| outputdata_float(0, 277, R[0], C[0]);
| outputdata_float(0, 278, R[0], C[0]);
| outputdata_float(0, 279, R[0], C[0]);
| outputdata_float(0, 281, R[0], C[0]);
| outputdata_float(0, 357, R[0], C[0]);
| outputdata_float(0, 358, R[0], C[0]);
| outputdata_float(0, 361, R[0], C[0]);
| outputdata_float(0, 362, R[0], C[0]);
| outputdata_float(0, 363, R[0], C[0]);
| outputdata_float(0, 364, R[0], C[0]);
| outputdata_float(0, 366, R[0], C[0]);
| outputdata_float(0, 367, R[0], C[0]);
| outputdata_float(0, 368, R[0], C[0]);
| outputdata_float(0, 369, R[0], C[0]);
| outputdata_float(0, 371, R[0], C[0]);
| outputdata_float(0, 379, R[0], C[0]);
| outputdata_float(0, 380, R[0], C[0]);
| outputdata_float(0, 381, R[0], C[0]);
| outputdata_float(0, 382, R[0], C[0]);
| outputdata_float(0, 384, R[0], C[0]);
| outputdata_float(0, 385, R[0], C[0]);
| outputdata_float(0, 386, R[0], C[0]);
| outputdata_float(0, 387, R[0], C[0]);
| outputdata_float(0, 389, R[0], C[0]);
| O[22] = mad(I[168], C[6], O[280]);
| outputdata_float(0, 67, R[0], C[6]);
| outputdata_float(0, 221, R[0], C[6]);
| outputdata_float(0, 234, R[0], C[6]);
| outputdata_float(0, 235, R[0], C[6]);
| outputdata_float(0, 236, R[0], C[6]);
| outputdata_float(0, 359, R[0], C[6]);
| outputdata_float(0, 372, R[0], C[6]);
| outputdata_float(0, 373, R[0], C[6]);
| outputdata_float(0, 374, R[0], C[6]);
| O[280] = mad(I[166], C[6], C[0]);
| external_func_call(C[11], C[18], C[18], O[20], O[207], O[13], O[280], O[21], O[22]);
| outputdata_float(0, 10, R[0], I[8]);
| outputdata_float(0, 146, R[0], I[8]);
| outputdata_int32(0, 7, R[0], I[94]);
| outputdata_int32(0, 69, R[0], C[18]);
| external_func_call(C[12], O[422], O[423], O[424], O[425], O[426], O[427], O[428], I[9], I[10], I[11], C[3], C[17]R[65535]);
| outputdata_float(0, 11, R[0], I[9]);
| outputdata_float(0, 12, R[0], I[10]);
| outputdata_float(0, 13, R[0], I[11]);
| outputdata_float(0, 58, R[0], O[422]);
| outputdata_float(0, 59, R[0], O[423]);
| outputdata_float(0, 60, R[0], O[424]);
| outputdata_float(0, 61, R[0], O[425]);
| outputdata_float(0, 62, R[0], O[426]);
| outputdata_float(0, 63, R[0], O[427]);
| outputdata_float(0, 64, R[0], O[428]);
| outputdata_float(0, 102, R[0], C[20]);
| outputdata_float(0, 212, R[0], O[422]);
| outputdata_float(0, 213, R[0], O[423]);
| outputdata_float(0, 214, R[0], O[424]);
| outputdata_float(0, 215, R[0], O[425]);
| outputdata_float(0, 216, R[0], O[426]);
| outputdata_float(0, 217, R[0], O[427]);
| outputdata_float(0, 218, R[0], O[428]);
| outputdata_float(0, 350, R[0], O[422]);
| outputdata_float(0, 351, R[0], O[423]);
| outputdata_float(0, 352, R[0], O[424]);
| outputdata_float(0, 353, R[0], O[425]);
| outputdata_float(0, 354, R[0], O[426]);
| outputdata_float(0, 355, R[0], O[427]);
| outputdata_float(0, 356, R[0], O[428]);
| outputdata_int32(0, 0, R[0], C[19]);
| outputdata_int32(0, 1, R[0], O[6]);
| outputdata_int32(0, 8, R[0], I[95]);
| outputdata_int32(0, 9, R[0], I[96]);
| outputdata_int32(0, 13, R[0], C[3]);
| outputdata_int32(0, 42, R[0], C[3]);
| outputdata_int32(0, 63, R[0], C[3]);
| outputdata_int32(0, 68, R[0], C[3]);
| outputdata_float(0, 16, R[0], I[12]);
| outputdata_float(0, 17, R[0], I[13]);
| outputdata_float(0, 18, R[0], I[14]);
| outputdata_float(0, 19, R[0], I[15]);
| outputdata_float(0, 20, R[0], I[16]);
| outputdata_float(0, 21, R[0], I[17]);
| outputdata_float(0, 22, R[0], I[18]);
| outputdata_float(0, 23, R[0], I[19]);
| outputdata_float(0, 24, R[0], I[20]);
| outputdata_float(0, 25, R[0], I[21]);
| outputdata_float(0, 26, R[0], I[22]);
| outputdata_float(0, 27, R[0], I[23]);
| outputdata_float(0, 28, R[0], I[24]);
| outputdata_float(0, 29, R[0], I[25]);
| outputdata_float(0, 30, R[0], I[26]);
| outputdata_float(0, 31, R[0], I[27]);
| outputdata_float(0, 32, R[0], I[28]);
| outputdata_float(0, 33, R[0], I[29]);
| outputdata_float(0, 34, R[0], I[30]);
| outputdata_float(0, 35, R[0], I[31]);
| outputdata_float(0, 36, R[0], I[32]);
| outputdata_float(0, 37, R[0], I[33]);
| outputdata_float(0, 38, R[0], I[34]);
| outputdata_float(0, 39, R[0], I[35]);
| outputdata_float(0, 40, R[0], I[36]);
| outputdata_float(0, 41, R[0], I[37]);
| outputdata_float(0, 42, R[0], I[38]);
| outputdata_float(0, 43, R[0], I[39]);
| outputdata_float(0, 44, R[0], I[40]);
| outputdata_float(0, 45, R[0], I[41]);
| outputdata_float(0, 46, R[0], I[42]);
| outputdata_float(0, 47, R[0], I[43]);
| outputdata_float(0, 48, R[0], I[44]);
| outputdata_float(0, 49, R[0], I[45]);
| outputdata_float(0, 50, R[0], I[46]);
| outputdata_float(0, 51, R[0], I[47]);
| outputdata_float(0, 52, R[0], I[48]);
| outputdata_float(0, 53, R[0], I[49]);
| outputdata_float(0, 54, R[0], I[50]);
| outputdata_float(0, 55, R[0], I[51]);
| outputdata_float(0, 56, R[0], I[52]);
| outputdata_float(0, 57, R[0], I[53]);
| outputdata_float(0, 103, R[0], I[62]);
| outputdata_float(0, 104, R[0], I[54]);
| outputdata_float(0, 105, R[0], I[55]);
| outputdata_float(0, 106, R[0], I[56]);
| outputdata_float(0, 107, R[0], I[57]);
| outputdata_float(0, 108, R[0], I[58]);
| outputdata_float(0, 109, R[0], I[59]);
| outputdata_float(0, 110, R[0], I[60]);
| outputdata_float(0, 112, R[0], I[79]);
| outputdata_float(0, 113, R[0], I[80]);
| outputdata_float(0, 114, R[0], I[63]);
| outputdata_float(0, 115, R[0], I[64]);
| outputdata_float(0, 116, R[0], I[65]);
| outputdata_float(0, 117, R[0], I[66]);
| outputdata_float(0, 118, R[0], I[67]);
| outputdata_float(0, 119, R[0], I[68]);
| outputdata_float(0, 120, R[0], I[69]);
| outputdata_float(0, 121, R[0], I[70]);
| outputdata_float(0, 122, R[0], I[71]);
| outputdata_float(0, 123, R[0], I[72]);
| outputdata_float(0, 124, R[0], I[73]);
| outputdata_float(0, 125, R[0], I[74]);
| outputdata_float(0, 126, R[0], I[75]);
| outputdata_float(0, 127, R[0], I[76]);
| outputdata_float(0, 129, R[0], I[77]);
| outputdata_float(0, 148, R[0], I[79]);
| outputdata_float(0, 149, R[0], I[80]);
| outputdata_int32(0, 10, R[0], I[97]);
| outputdata_int32(0, 16, R[0], I[98]);
| outputdata_int32(0, 17, R[0], I[99]);
| outputdata_int32(0, 19, R[0], I[101]);
| outputdata_int32(0, 21, R[0], I[103]);
| outputdata_int32(0, 22, R[0], I[104]);
| outputdata_int32(0, 23, R[0], I[105]);
| outputdata_int32(0, 24, R[0], I[106]);
| outputdata_int32(0, 25, R[0], I[107]);
| outputdata_int32(0, 26, R[0], I[108]);
| outputdata_int32(0, 27, R[0], I[109]);
| outputdata_int32(0, 28, R[0], I[110]);
| outputdata_int32(0, 29, R[0], I[111]);
| outputdata_int32(0, 30, R[0], I[112]);
| outputdata_int32(0, 31, R[0], I[113]);
| outputdata_int32(0, 32, R[0], I[114]);
| outputdata_int32(0, 33, R[0], I[115]);
| outputdata_int32(0, 34, R[0], I[116]);
| outputdata_int32(0, 35, R[0], I[117]);
| outputdata_int32(0, 36, R[0], I[118]);
| outputdata_int32(0, 37, R[0], I[119]);
| outputdata_int32(0, 38, R[0], I[120]);
| outputdata_int32(0, 39, R[0], I[121]);
| outputdata_int32(0, 40, R[0], I[122]);
| outputdata_int32(0, 41, R[0], I[123]);
| outputdata_int32(0, 43, R[0], I[124]);
| outputdata_int32(0, 45, R[0], I[126]);
| outputdata_int32(0, 47, R[0], I[128]);
| outputdata_int32(0, 48, R[0], I[129]);
| outputdata_int32(0, 49, R[0], I[130]);
| outputdata_int32(0, 50, R[0], I[131]);
| outputdata_int32(0, 51, R[0], I[132]);
| outputdata_int32(0, 52, R[0], I[133]);
| outputdata_int32(0, 53, R[0], I[134]);
| outputdata_int32(0, 54, R[0], I[135]);
| outputdata_int32(0, 55, R[0], I[136]);
| outputdata_int32(0, 56, R[0], I[137]);
| outputdata_int32(0, 57, R[0], I[138]);
| outputdata_int32(0, 58, R[0], I[139]);
| outputdata_int32(0, 59, R[0], I[140]);
| outputdata_int32(0, 60, R[0], I[141]);
I¬‰ëgx“Jà;\
@å;w¡@Yá
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„EU
xì;ö©\?Nñ∫/hÑ
PD‹;é„üHåÊ»5÷·˝˛U
ı≥Ûü¸;%Eº<=]˜›≤U
bÔ«Ÿzó…I§T•ï;
õ;4”$6
‰§C∆;ºªHáU·Ñ‹‹
„“4Ç˝ußK£;å
MO;#ÂÌ≠œ
¡É*ûóˆ•Ä.;ƒ—


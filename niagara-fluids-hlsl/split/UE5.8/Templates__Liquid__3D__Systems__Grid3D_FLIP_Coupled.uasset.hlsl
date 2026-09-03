¥Ø›UÑ;&Îó/q∑˛“ÿj‹
vŒ–;¬‹
N‘CØ≠%£Bó;Lo0~‚ _
N‘CØ≠%£Bó;Lo0~‚ f
¬;µO¬˛˙
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
¡˙i|«`@ç´‡;øœ*ø
q Hh]í:¸Q∫µoL:;
˘I7/˜;
å6Á∆;h
…Ï};tS}XıY
 T¶KÅä
ØyLîªı>;9
~Ûáˆ8;â¯
Ã;í—Yﬂ{Eà
zICò7–^ˆv;u
5CánHi.Ú#;%
!;/{€˙¸
D◊9>;ı#
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
g'∞˜ÄîHa;≈_
\)ê;˚ÔÜ‚3”Zo
åãdNT;
K«81%;
¶;ÑAçX]§éùı
emÊ„ˇ8IØ˛†°>ìíG;
ùæ`7·$Ë∂XËôÊ;9c°¶FÑ∏‹
;“≈Tz:ßL©M!N
⁄*tD<;úEì&É
fπ∏NêX´;M°˛Ω‹
ÿ>ëk*I¨;ç¨}Ü
\é`);|„Hê
N‘CØ≠%£Bó;Lo0~‚ ƒ
ÿd¡4C∂°H£=;ø
~3;G‹¸ÿ
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊
·Ä;2Kx+J≤Bè§]â‹#)
s;Mi”DÅéÄµó«RË)
öc,„( ÒCí;˙™gÊN1)
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
o;û<≠G∞C)#ù7õÑÿ
¯AÅÜùµ√;M;ç
¯AÅÜùµ√;M;,
FøGÔ;@Ø
Ù;HgI©“7
cMäI#í;…Ï£
—Xd°JeG∏;(
FEó;·"§Ø
¯AÅÜùµ√;M;™
;ÊLìô+:¬bœj∂
;ÊLìô+:¬bœjG
;ÊLìô+:¬bœjª
ﬁJΩu&ÑkU„;}
ﬁJΩu&ÑkU„;Ö
—Ì7;GΩ
ﬁJΩu&ÑkU„;æ
‡gYßÖ¯Hê");rÆ◊\G
‡gYßÖ¯Hê");rÆ◊\Ö
‡gYßÖ¯Hê");rÆ◊\ø
‡gYßÖ¯Hê");rÆ◊\D
Ÿ˙œ‹¿Ñ;AòEiËΩË»Kƒ
Ÿ˙œ‹¿Ñ;AòEiËΩË»K
;O∫´>àéMöÖâ$≠„ö
ÒÛIûãmR¸º;h
Ÿ˙œ‹¿Ñ;AòEiËΩË»K∆
Ÿ˙œ‹¿Ñ;AòEiËΩË»K«
Ÿ˙œ‹¿Ñ;AòEiËΩË»K»
ﬁJΩu&ÑkU„;…
‡gYßÖ¯Hê");rÆ◊\ 
Ÿ˙œ‹¿Ñ;AòEiËΩË»Kœ
Ÿ˙œ‹¿Ñ;AòEiËΩË»K—
Ÿ˙œ‹¿Ñ;AòEiËΩË»K“
Ÿ˙œ‹¿Ñ;AòEiËΩË»K”
C;Ní®ã|« !¿
int IGNORE = 0;
Grid.SetGridValue(IndexX, IndexY, IndexZ, AttributeIndex, Value.x, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, AttributeIndex+1, Value.y, IGNORE);
Grid.SetGridValue(IndexX, IndexY, IndexZ, AttributeIndex+2, Value.z, IGNORE);
"BÇNñAáÀz ;
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
ÍSÇ~à$EÖËl±;2∞Ò‹
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
Ëí˜@ÒK;D∏ ø]jY›…¯
Ëí˜@ÒK;D∏ ø]jY›…
//  https://math.stackexchange.com/questions/1778627/ellipsoid-moment-of-inertia-matrix
MomentOfInertia.x = r.y * r.y + r.z * r.z;
MomentOfInertia.y = r.z * r.z + r.x * r.x;
MomentOfInertia.z = r.y * r.y + r.x * r.x;
MomentOfInertia *= m / 5.;
SpriteSize = 2.0 * max(max(Radius.x, Radius.y), Radius.z);
øJ;ÜPLÇk°
Ëí˜@ÒK;D∏ ø]jY›…¸
?%:ùWC JâCÛ;I\7ï
?%:ùWC JâCÛ;I\7ï,
£;n4‰EfC∞Ì
±qú©#N7O™ª;eﬂ
W`Äd˘å°B≥t¥÷;ƒk|ÿ
‡gYßÖ¯Hê");rÆ◊\
nÂ¢q“qMâ;}tk
;W/Ë¿]Ë
!˝@âj‰;
¸ò∫q;
Â√˙»S;ÅD†ò
ièÇ\Ë;
¨òΩ∞ÅJ∏ÙÄfrc7r;
è;ÿ˙ú†qBï*tÎˇ
÷‡y|;NÄuÀ^‰îÍﬁ
÷‡y|;NÄuÀ^‰îÍﬁ(
÷‡y|;NÄuÀ^‰îÍﬁ/
GÑcõÉm¬^‡;
b;~G¿ôGJµ≠YÏÅ{hµ-
b;~G¿ôGJµ≠YÏÅ{hµ•
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3z
ãsL≥L©j;Ö®¨¶ºo
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿o
>Â;N™Õ)vãh.Zo
b\^ÇPÛEü;±
”5oU;Já±±@†®%9q
x™Má4i=;
n;¨`gFïC∑Yc
;"#É⁄5
;"#É⁄O
;gG°Ä3ÒsFHÜ
É≤ù|I|JG´øßŸˇß^-;
oµÙ(∫;ŒHºé9ôgÚU™i
K˜ZC ö;Mòïs
;Iò£+1
9û;$N˝E£IËÔ†=ˆ&ä
Ñq;dœDÿJë`†à]ÀÁÆj
~c⁄\õ%¥N™; Û:5
TA±;ãÒ¢!ÁyA
TA±;ãÒ¢!ÁyG
87ô5¶3Në;
8KbUkí≠LîªıΩãë®;
Ñq;dœDÿJë`†à]ÀÁÆÕ
¸ëØNµ‹P%Náw;˚
EÉ©N}í.;œ
ãß;ÂR@ø©àm¯êúJë
÷ÎÜ˚õAé;¿Ùc.ó∑X
Ò≈;ªO≠lÜ••˙C≥o
Æ;IN:ˆ
˝í;ÎÈX
;≠ã£πÏ™G•'∆5
*J;œ’$ÓI¥ÒƒƒÚo‘~´
Oö;P2π¸Æ*ê
!;ÌBÔΩ«@†À<Ç*
†6i ;´
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^™
mk†;$û•O´ÜáVóIø¥ë
OÆÎi;^¡òŸ‹
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;ë
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.È)
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í )
†HæÂ˛†’H-;
;Ô“].º©
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Û
Y{3;FçûRô®<NCê
 DÄ÷bûYPc7©
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Ó
xH;A˘qê
˜cKª‰´˛;‡Úˇt
 iÈJÜ-g$ûZH⁄
7uù¬‘RçKô'î£lÅ;kê
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿Ç
:Ã;3ËBqM£<Y)ôfH$t
AÉ%F;XOÖ6x‡jæÊ\‹
xùù⁄€HH≠cç;[*Y>Q
xùù⁄€HH≠cç;[*Y>G
Ñq;dœDÿJë`†à]ÀÁÆ—
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
;|ã´Îø
™áåEñ1I∞è$Bø;Pe
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>mo
Dó0¿¯;ÑOæo
 l;æNÉÒÌ‡~ 4=q
ÑÒ`@ºèS;<»Zöq
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
∂z;FÚÿ
(s±;î`ÏCö6⁄V`6X3B
Ñ◊Aâ3;!–w>ë
eºî˙F®ÉSÇì;-≤
˛AqˇQ@–I±õ5;
Ñq;dœDÿJë`†à]ÀÁÆŸ
L˘;KCb
{;≤;ÆÆEÆ˘'¶„ö⁄
!ÿq;'-
;LôÕÂ≠ı©*3ÿ
jÚLî;5}†ÌyÑ|
jÚLî;5}†ÌyÑG
úÄˆﬂ&O¢Pÿ¡æƒ;7‹
ÛLV‚µc}I≠º;∂c
Ñq;dœDÿJë`†à]ÀÁÆ‡
†Âo¬)?Fæ;y|µ ˇ¯É
†Âo¬)?Fæ;y|µ ˇ¯
\∏Aä;!ô-¬€¡‹
;+¯OOûû7>
E≥¬;7ë1I
lZ;E§P±ˆ˘C π
1Â˙!9;≈A∞Ü
å†;ıæµ"Jì"∑∞ö
å†;ıæµ"Jì"∑∞öÛ∞ôG
b;~G¿ôGJµ≠YÏÅ{hµ™
;W/Ë¿]π
÷‡y|;NÄuÀ^‰îÍﬁ∆
;"#É⁄Œ
TA±;ãÒ¢!Áy⁄
xùù⁄€HH≠cç;[*Y>Í
;V°ìO¨îö
jÚLî;5}†ÌyÑ
å†;ıæµ"Jì"∑∞öÛ∞ô3
Qäh;≤IUE§⁄
yÜﬂÂ;wXGç`b.e®ëG
ùsÒÃ;Ò,Cò«⁄
I'Gï»;$¢eœG:
I'Gï»;$¢eœG
A∏Õ|+v8º%;
îMæ[JéÊœ;cÿ
`Gß‰;úé
‚=;ıEJ±
)—Kï;˘â`O
¶pH;Ï{Bí£o}·T G‹
fk$DÖÑ;l˛åwﬁ
∆N‡˚ú7—AçÂµ;Ωv·
∂ÙµO≥;3Yx‘(Çÿ
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†y
;aJΩzO ?∆+†C
Cãˇ"Q;CÚV
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;F÷
&;˜qQIT@Ü®R
öZóàîHÑ;w?~¯Vî
Ä~E;ﬁÂ
ñ≥fÏÄ»˘D≥àdÍÊ;L6
B≥%Îë;
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
¡AπG≠H;æi
Ü;‚{v¡!JéDY†a
∆M±\Oå;µxK
¨•;ª´Ê“Kß√t
Ö∏:“)¢ŒOò;æíÖ√„õÀ
Ö∏:“)¢ŒOò;æíÖ√„õC
AãÀL;^£Ü;
’‡˘rﬂPJMëo≥;œ-ﬁB
;S=ö±XàKäÑ
;aJΩzO ?∆+†
àﬂZJNKoLârä§úP{Á;
Ö∏:“)¢ŒOò;æíÖ√„õS
FØà^&∏;+
˚;YPaGî
ä{“D°;µMú-lí
ó‚‰z;XUIÄt7a!EÏ
Úó;˝3g.Dì
z;O∫kÉ^˝öËTÿ
≤´;à‘ÿ
“US?ˆºbE™;e›k˜¯
;óKàri‰59vì¬
;óKàri‰59vì>
C;Ní®ã|« !¿≈
îƒzM≤o;J
FIÄ~–//
;óKàri‰59vìÿ
C;Ní®ã|« !¿€
…r+;ñ±
ä,ªf;¥CH•–2ÈÓπ
)Ç-=ûéMí'i«9ﬂ;ñ‹
;óKàri‰59vìÁ
C;Ní®ã|« !¿Í
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;”÷
|ÜbD1;
;aªã3œŸKΩ9
N[áÆ;|]HøsìΩﬂ]¨ØŸ
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;ÿ
q‘ı;EûuCdﬁ&5›¿
q‘ı;EûuCdﬁ&5›‹
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
sVb∑I;|B™0
êÑ”7X;KªGûﬁV±ë˙
´;{Á9o€F≠ïÊ.ﬂ
;j∫pº∏$ßrE†8‰ÏE(
;{;uXÎÕ
;{;uXÎL
>Nô^Î;$Õ 0Õ
>Nô^Î;$Õ 0‹
Øc8\;‚Eí#˜iª⁄
b;~G¿ôGJµ≠YÏÅ{hµ
G®R›ﬂRU;æ”
G®R›ﬂRU;æ
£í;Cä˘G¥
@™ÛlØ,;
DºÅïïÏ;
ıÉ˛ÑooH´”ÎÙõ ;
[µ∞ÁJA´- ;:ﬁwH√2
∂qÍ;ΩúÒM¢±—
ıÉ˛ÑooH´”ÎÙõ ;Ÿ
ÍCø;{∑ÿO¥‰ø,
›PÔ&∫Î"Bèj;3©Sc†⁄
›PÔ&∫Î"Bèj;3©Sc†‹
H≥s;DædÓ
YKê;UÄïGù
[µ∞ÁJA´- ;:ﬁwH
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_·
É∆:JóÑƒ—;Tá_B
9á‚ s‘]MäSr;˚±µ`÷
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNıÍ
9;˛π$J»Añ{C8·åNı‹
ùY˝;BEî¢
hLAïî%á∏;3Ãˆ
hLAïî%á∏;3Ã
;~8^HìB}
öZóàîHÑ;w?~¯Vî˝
öZóàîHÑ;w?~¯VîB
¥’n^Õ;dIïYÒüS
~;Œ@:5Î@ΩsXCy
¶Ój7;*áMüÎ
 q\!™2îL∏1Wç
s™˛â;NôÜˆM›
8Há 4M+Y;ë
ÿ ;¯ÈUºMù{¶
µ¶8ÀÀ|&@ô//„Jπ€
Ω.BπYÎ;k7Î˜B
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Gò;ä∆…±
;Ì∂u2jMí3Càf∏∑8ÿ
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“A"
 ZSiBº´AéÓ—lÜ∆“A‹
N]˜ÏO¶;7
µ¶ú©®ƒ;Hß
‘!„Ñ;≈+
‘!„Ñ;≈y
 C®ØHŸ˜ÎRﬁ‹
––˙»H™;[á}zŒBÿ
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
ãc‡Næ∞®ÄÂ·∑Ÿ;
IVj;≈DE©
Ç‘‘}tè;
;ªÑê*%<
;ªÑê*%
N´†;zXã
wàB“Nç†;¸ˇ”Î
r;Âgi~b˜µgTHxFá
r;Âgi~
…;∂†uEÖ≤0õ
&≠,ÿ;´§Oª‚œ
;Aë-È∫4àΩ∞ÿ
s£DBÜ-íHòÀ:;∂L
∑D,∫ù}ˆDôe’!9;
®É?PK;À¡E∞ÙD
É?PK;À¡E∞ÙD
;Doâ)E†⁄Â{Äå
EñC‡w@¸k;‹
;Doâ)E†⁄Â{Äå 
;u¡Ñÿ\nO°
:OèÑœ]WUf;l
:OèÑœ]WUf;‹
Bº9≥”Ù"ë;
ok§P$K¨∂Ë2≤;Ó±ÿ
√œb©[;V@Ä
íe;íÎY-AÑÓ=.uZ∂
iyH≠T‘;0
AãÀL;^£Ü;w
AãÀL;^£Ü;B
5¶;^M©
˘';hPNû
o™åp§Ÿ‰EâN˜ø;ä +{
o™åp§Ÿ‰EâN˜ø;ä +‹
JÅ2$H;
IØ∫Ûø;'
Û≈C;9Á}
Û≈C;9Á‹
H;Îw‹_MKØ˚µ2Z‘Á‰~
H;Îw‹_MKØ˚µ2Z‘Á‰O
∆M±\Oå;µxKB
bπ∫;6TI≥hêuﬂı
0˘;Dú(¿∆
pï;ŒÈNæ·:
ö≈Û;•^á
ö≈Û;•^
∆ÀI;∫ä'L™
’uõôÆMòI4;
ØV;BØHG¯ÎA¢≥Æ
ØV;BØHG¯ÎA¢≥
;|HÄ9ÛNîfÿ9Æ
;|HÄ9ÛNîfÿ9
¯;·€J_UD®9&Ÿ
—;5é3p
L˘;KCb¶
L˘;KCbB
ù)g&g;k@çg
‘J1G≠Æ{ï¥ßi¡‘cÎ;ÄNQ@∫%ë
ö;öVH6†N¶JÁ2Ñûƒ)™
ö;öVH6†N¶JÁ2Ñûƒ)‹
‘cÎ;ÄNQ@∫%ë
˘5D;Ö¯-AÖUß„à]1§‹
õN;XÙÄ÷KªíR÷œHUy
ìlUm‹˚B¥];
∆=Bàx±8ëOW;Æ
∆=Bàx±8ëOW;
¯√ƒ∂4ÆG§A∂Í;A‰∞
¯√ƒ∂4ÆG§A∂Í;A‰B
@ÜÒô1%È;Ë
nxñb”z7M∂æ;z≥û
ø”HAl¶Díe6;˘§˚
úﬂÀv™∑3Nü•õ;˚√„c
wjIF;F´oÒ}
)Œ14);ìG∏ôµ’
\©;7±s–@áÕ8p2âi
|¿* I≤˘LöÎÄ;
Í∏u™j†ÖAó;ì·
;±8<Iâ√rïÄ‹
Q‚†CÚØlB∞;ÊYï
¯AÅÜùµ√;M;
!kGîñ;jF∏ù‰
î;˛‚ù≈wM¶^*Ÿ‡Ê\È«
î;˛‚ù≈wM¶^*Ÿ‡Ê\È‹
FzÕ«;Gõ@
;G´÷œ‘m¯~G
∏’◊NÑdÚò;€
˚;‹P±u’
˚;‹P±uB
æª‹=,B(F≥≥q;Ëds?÷
æª‹=,B(F≥≥q;Ëds?B
ÛEΩ»;?∑OázM…0ÛK·ÿ
B;˙2•=U}u
¿;œ«H™lÊÓ£
B;˙2•=
sé;+ ÿ¯E¢Zˆ-
>3#G©6“;´v>ÿÿ
+;K}êºÆJê∞ˆ_≈ˆ"
 A´1≥^qZ@ñÆ
 A´1≥^qZ@ñ
e;HµJc¥≈(éëÍ
e;HµJc¥≈(éë‹
8—d≤G©G¡`Q;◊Hÿ
Íi+;<’Nö±w
∞;óÎI´nùp?¸/$Û
∞;óÎI´nùp?¸/$‹
~!¢†s˜nBπ;
ŒO`öD!ÇM†é| ;
»;Kãmı˝ê9]?
^ﬁzEº∑uô·>;eÆ
^ﬁzEº∑uô·>;e
BàV;z+”ÙˇÆ
BàV;z+”Ùˇ
?¥÷Yò;Kô
)‚;~£=:C±
;Ñ∫Yµ7È@ìÖπ‰ıy
ññﬂˆ~O˛N¶‹E¸Ôæb;
fæ–ÚR?Mî>® D;ÒÊÿ
Û]¯;¨òïBá
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;Æ
B™Ö¯0b.\;
ı‰®I¶;
”Âwˆ—;
¨3êC?D´Ü∂v;“%1;
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆ>
ùΩ;Bêa¢óoÆóˆB
 A´KUTFöR!@
 A´KUTFöR!‹
DH;Eêé$,*H‹–E
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡G
GåÁÂé-;Ë‡/
;¥Fü/6æÂá2Jÿ
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;Æ
;YÂLË‹
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQb‹
©ÁI°Q-¸;_◊
;{;uXÎf
>Nô^Î;$Õ 0f
q‘ı;EûuCdﬁ&5›i
G®R›ﬂRU;æu
›PÔ&∫Î"Bèj;3©Sc†|
É∆:JóÑƒ—;Tá_É
9;˛π$J»Añ{C8·åNıå
hLAïî%á∏;3
öZóàîHÑ;w?~¯Vîü
Ω.BπYÎ;k7Î˜Æ
 ZSiBº´AéÓ—lÜ∆“Aø
‘!„Ñ;≈»
;ªÑê*%Ÿ
:OèÑœ]WUf;
o™åp§Ÿ‰EâN˜ø;ä +
Û≈C;9Á
H;Îw‹_MKØ˚µ2Z‘Á‰
ö≈Û;•^!
Ãq,CìÍô)b_8M;
L˘;KCb@
ö;öVH6†N¶JÁ2Ñûƒ)D
¯√ƒ∂4ÆG§A∂Í;A‰J
î;˛‚ù≈wM¶^*Ÿ‡Ê\È`
˚;‹P±un
æª‹=,B(F≥≥q;Ëds?o
e;HµJc¥≈(éëÉ
∞;óÎI´nùp?¸/$å
»;Kãmı˝ê9]?†
ññﬂˆ~O˛N¶‹E¸Ôæb;´
ùU;cIL¶aë{Ωµmv
J°_ycô‰;
∂;ΩR\‹
ioòE¨!"˙V(÷ ;Z˙LW
')—;jÿ
;Z˙LW
ˇı´€kî≤¨ƒ;ÆA∂é
kî≤¨ƒ;ÆA∂é
®+´c ı„A©W!∑;
Gπä®^;î
cn}&≤;™CÉ
ú0;Z03ΩOñ0◊ˆ‚≠8{¬
ú0;Z03ΩOñ0◊ˆ‚≠8{
OÄªØ;P 0t√
OÄªØ;P 0t‹
H^˛;D‹
ZÄùl>ﬁ;B¢(Õ¿p—
¨3êC?D´Ü∂v;“%1Ò
ùΩ;Bêa¢óoÆóˆÙ
 A´KUTFöR!ˆ
GåÁÂé-;Ë‡˙
jDÖa#˘;˚|?ÿ
˙∆FÄe;mUwË>
˙∆FÄe;mUwË>‹
INí^;©ı”ﬁﬂKÁˆ
INí^;©ı”ﬁﬂ
@;TÈ∞M∞I®TLô≥ß¥ﬁ
U™yE≤3a;§“œk
∞)‡XCnEOü ;
 MÚÆÉ~Oë‘
`Wúπû75O∞ØD;˘ùA‰
`Wúπû75O∞ØD;˘ùA‰‹
 l˛[>ÅEéÈ¨x}#6qL›
 l˛[>ÅEéÈ¨x}#6q
≤◊,‡ƒ;}¿ÛZ[´DØMV±
;}¿ÛZ[´DØMV±
hÖM©ªÈˆHàC;¥
sñ'Áª7;F´
$xø)˙k;M§nΩ\
°±5/∏èÍL∏˙ÔNˇ;%n‹
C>7™Jª}*eÛ;ﬁˆ}F
C>7™Jª}*eÛ;ﬁˆ
Ö√Ú";ú»AΩπ
u≠;ÂÔ™3Et€@¢Sµ≥r%˘˜Æ
+lÿ-;’ÒBûòæˇîû
Bä&˚Z;
 rœ¯•0
iKê; C
`Wúπû75O∞ØD;˘ùA‰7
˙∆FÄe;mUwË>:
ñ#…M∫å0=ÌÙ‚F;
ÙE´$.PµLG*;
ä{“D°;µMú-líE
ä{“D°;µMú-líB
◊*åä;jO∏˘øg
 rœ¯•Q
‰˜DÖ0;èU
7D{C°èÅG¢#pÓ[;7
ó‚‰z;XUIÄt7a!EÏa
ó‚‰z;XUIÄt7a!EÏB
;©†˚(ÊÂFêç
@Ô¥-;M©EåQ†
ÒÛIûãmR¸º;hk
ÒÛIûãmR¸º;hv
 —<;?h™Môç•ØZüòUm
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•‹
Cãˇ"Q;CÚVp
Cãˇ"Q;CÚVB
‰g;•†0MÜQ:âıπº^r
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
;∏maù⁄Cªl8•Mi+
ñ≥fÏÄ»˘D≥àdÍÊ;L6Ñ
ñ≥fÏÄ»˘D≥àdÍÊ;L6B
8Há 4M+Y;ëÜ
8Há 4M+Y;ëb
K;Óñ‰ﬁ
¢Òi;‡®AáG”÷
û`Nò≈4´0ã;]
"Cª\ÏÒè;ÏÈ
ìHàl@≥BKö^;'=
„£HΩ;®
æª‹=,B(F≥≥q;Ëds?
6#≈Ivn%Dëø;
å†;ıæµ"Jì"∑∞öÛ∞ô
Ωvÿ;7;Må´K
;gG°Ä3ÒsFHÜö
;gG°Ä3ÒsFHÜ|
Á˛O∂tÌVIáˆÊê.;òÆõ
Á˛O∂tÌVIáˆÊê.;òÆ
◊Wx‡;≥ÇI≤
&HÚ´;R
DÅ)¯P√}i;ü
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
Ö∏:“)¢ŒOò;æíÖ√„õ
£[h+%Ë.Aõl-j∏’;Eÿ
‘!„Ñ;≈
Èc∑æ…E;H©ËáË¥m
qi;;¥E∂o>2e
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯X®
;˙/¯XÃ
ıR9ÿ"D¨Úq;Ã
TA±;ãÒ¢!Áy
g‹I∏xü;Ü
%îh;˘Ä_G∑
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
GåÁÂé-;Ë‡
ìáï∆)K;Mà±≠/˜˜ùöÿ
;M¸è¿sK£ﬁ»u8q„e‹
xùù⁄€HH≠cç;[*Y>
˛´T“@õÜ;˘TÑq™¿
˛´T“@õÜ;˘TÑq™‰
\Ày`AçÇZ≥Ñ˙;±¡
\Ày`AçÇZ≥Ñ˙;±|
;\AŒ#Ú≤JêO<ê†Kue
kgÉÄ§DÅPŒrq1;Ô
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
&—√n‡]⁄KØ;û
˘aûª;D°Oá
 Cã˛¡î
8KbUkí≠LîªıΩãë®;⁄
8KbUkí≠LîªıΩãë®;B
P∂\;zP∂NÆ¡¢fhú©√
Æ◊míÖ;°Jñ~dõ/øÚÄÿ
™áåEñ1I∞è$Bø;Peﬁ
™áåEñ1I∞è$Bø;PeB
 M≤˝ˆ∏
´–Sïa;wL°≈¡œg™lª
$y>2Gä˚!«;ó
Ñ◊Aâ3;!–w>ë·
Ñ◊Aâ3;!–w>ë|
Bº9≥”Ù"ë;‚
Bº9≥”Ù"ë;4
Cæ¨∑*µ|cπ;
;âL$ªB¢ª–
eºî˙F®ÉSÇì;-≤‚
eºî˙F®ÉSÇì;-≤|
Iç≈a2¢¸i;
°;;¨√F†˛M
ä‘;=ıj
õN;XÙÄ÷KªíR÷œHUyÌ
õN;XÙÄ÷KªíR÷œHUyC
ù„zDæg4IûOr;
’‡˘rﬂPJMëo≥;œ-ﬁBÔ
@ÜÒô1%È;ËÔ
Cä1pE;¥º
¯√ƒ∂4ÆG§A∂Í;A‰
úﬂÀv™∑3Nü•õ;˚√„cÒ
úﬂÀv™∑3Nü•õ;˚√„cp
ı©£Dàz"û;A`†ÿ
æì}P;˚
;G´÷œ‘m¯~G˜
;G´÷œ‘m¯~G7
óTHÑ{_;R⁄Q&¯
óTHÑ{_;R⁄Q&
Ã*åË·;
lZ;E§P±ˆ˘C π˙
lZ;E§P±ˆ˘C πB
˚;‹P±u
˘a'¬Í∑Bø„]Açù;Û
8Há 4M+Y;ë!
K;Óñ‰ﬁ$
;gG°Ä3ÒsFHÜ5
Á˛O∂tÌVIáˆÊê.;òÆ6
ùU;cIL¶aë{Ωµmv7
ùU;cIL¶aë{Ωµmv 
Ω(;ìøNºI¢A«1.ä7
Ω(;ìøNºI¢A«1.ä
yÜﬂÂ;wXGç`b.e®ëG8
yÜﬂÂ;wXGç`b.e®ëG|
#çöuh;
'÷–nˆ;
DÅ)¯P√}i;>
;˙/¯XG
˛´T“@õÜ;˘TÑq™_
\Ày`AçÇZ≥Ñ˙;±`
8KbUkí≠LîªıΩãë®;y
™áåEñ1I∞è$Bø;Pe}
Ñ◊Aâ3;!–w>ëÄ
Bº9≥”Ù"ë;Å
eºî˙F®ÉSÇì;-≤Å
õN;XÙÄ÷KªíR÷œHUyå
’‡˘rﬂPJMëo≥;œ-ﬁBé
@ÜÒô1%È;Ëé
úﬂÀv™∑3Nü•õ;˚√„cê
;G´÷œ‘m¯~Gñ
óTHÑ{_;R⁄Q&ó
lZ;E§P±ˆ˘C πô
°€J;0ÛWCà
?Â;®q@L∑p<XıÍoÛ
GœVkNHÓ@®‡sÊˆ;qq´
GœVkNHÓ@®‡sÊˆ;qq
;ON≥=Úqv⁄ƒ
;ÊLìô+:¬bœj
:.>âDµË˛1[è…;¥
:.>âDµË˛1[è…;
JΩR⁄^;
:.>âDµË˛1[è…; 
;√nQm—
;√nQmÙ
;X^5@ü
êÑ”7X;KªGûﬁV±ë˙‰
êÑ”7X;KªGûﬁV±ë˙z
NæÆÄqæ∫;*{
ó±√;ÚM¢°
NæÆÄqæ∫;*
õ…;ÔÙ∞NíDK∫O6Ë¿Â
õ…;ÔÙ∞NíDK∫O6Ë¿
v†S]¶Æ"Kª;ò_YIto{
v†S]¶Æ"Kª;ò_YIto
L•;Òâ‹ku–‹
;{;uXÎ
õ…;ÔÙ∞NíDK∫O6Ë¿Î
êÑ”7X;KªGûﬁV±ë˙Û
——6¸'…;`
O;Å†ûÉ‹
ßOlG;\·vX
ÿˇR:˘≤zñy;Ÿ
k“`·¿9j;
O©;êˇ˛åõ˙‹
ÑËK1;≤‘‹
æ;¡l,{3K¸V]ù˚
%∞2Çø;
ˇ†LœZ;Ár
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(‹
_\õ=õ):;l˙<
>·-ˇ^;zÂ_
æDçŸ¯ÚòNá;*äm:T≈_
æDçŸ¯ÚòNá;*äm:T≈f
ñ6sôRsHüeß;ÄÃSá_
ñ6sôRsHüeß;ÄÃSáf
Z◊;∫Äc_
Z◊;∫Äcf
ád˘Ôn;…G¶ﬁ=m˙ÄD(
ád˘Ôn;…G¶ﬁ=m˙ÄD(—
‰S∫Ì=M9O†<ù.Ü;mîŒ
T5`;BºÎ8
‰ˇ;πxyVbL}ÆÊ
;%ûEÆVπÁ\>≠@
‰S∫Ì=M9O†<ù.Ü;mîÿ
ß≤≠˚KΩ{∏Or<;]_
ß≤≠˚KΩ{∏Or<;]f
0m4P≈ﬁA;•K¶ó_Î˛
// Shader generated by Niagara HLSL Translator
// SimStage[0] = ParticleSpawnUpdate
// Compile Tags: 
// Compile Tags Editor Only: 
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
float PREV_Engine_WorldDeltaTime;
float PREV_Engine_DeltaTime;
float PREV_Engine_InverseDeltaTime;
float PREV_Engine_Time;
float PREV_Engine_RealTime;
int PREV_Engine_QualityLevel;
int PREV_Engine_PaddingInt32_0;
int PREV_Engine_PaddingInt32_1;
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
int Engine_Emitter_NumParticles;
int Engine_Emitter_TotalSpawnedParticles;
float Engine_Emitter_SpawnCountScale;
float Emitter_Age;
int Emitter_RandomSeed;
int Engine_Emitter_InstanceSeed;
int Engine_Emitter_PaddingInt32_0;
int Engine_Emitter_PaddingInt32_1;
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
float Emitter_dx;
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
float3 PhysicsForce;
float PhysicsRotationalDrag;
float3 PhysicsRotationalForce;
bool RotationalVelocityEnabled;
float4x4 UnitToWorld;
float4x4 WorldToUnit;
int ExecutionState;
FParamMap0_System_Grid3D_CreateUnitToWorldTransform Grid3D_CreateUnitToWorldTransform;
float DeltaTime;
float3 Force;
float Mass;
float3 Position;
float3 Velocity;
bool WritetoIntrinsicProperties;
float4 PrevMeshOrientation;
float3 PrevPosition;
FParamMap0_SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Particles Particles;
float4 MeshOrientation;
FParamMap0_SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Particles Particles;
bool LetInfinitelyLivedParticlesDieWhenEmitterDeactivates;
float Lifetime;
bool LoopParticlesLifetime;
float3 Scale;
float2 SpriteSize;
int CollisionID;
FParamMap0_Particles_Collision_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Particles_Collision_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
float3 SafeCombinedCollisionNormal;
float Age;
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
int UniqueID;
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
float InverseDeltaTime;
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
float dx;
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
float LODDistance;
float LODDistanceFraction;
float4 LWCTile;
int PaddingInt32_2;
int PaddingInt32_3;
int PaddingInt32_4;
int PaddingInt32_5;
float4 Rotation;
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
FParamMap0_Engine_Emitter Emitter;
int ExecIndex;
int ExecutionCount;
FParamMap0_Engine_Owner Owner;
int QualityLevel;
float RealTime;
FParamMap0_Engine_System System;
float Time;
float WorldDeltaTime;
int NumCellsX;
int NumCellsY;
int NumCellsZ;
float SpawnRate;
bool IgnoreMass;
bool Alive;
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
int Position;
int Scale;
int SpriteSize;
int Velocity;
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
int Radius;
int RestCounter;
int RotationalInertia;
int RotationalVelocity;
int Volume;
FParamMap0_Array Array;
FParamMap0_Collision Collision;
FParamMap0_DataInstance DataInstance;
FParamMap0_Drag Drag;
FParamMap0_Emitter Emitter;
FParamMap0_Engine Engine;
FParamMap0_Grid3D_ExternalObjectBuoyancyForce Grid3D_ExternalObjectBuoyancyForce;
FParamMap0_Interpolation Interpolation;
FParamMap0_Local Local;
FParamMap0_MakeQuatFromAxisAngle MakeQuatFromAxisAngle;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_Particles Particles;
FParamMap0_ParticleState ParticleState;
FParamMap0_ScratchModule ScratchModule;
FParamMap0_SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC;
FParamMap0_SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3 SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3;
FParamMap0_SolveForcesAndVelocity001 SolveForcesAndVelocity001;
FParamMap0_System System;
FParamMap0_Transient Transient;
#if ((SimulationStageIndex == 0)) // MapSpawn
FParamMap0 MapSpawn;
#endif // MapSpawn
#if ((SimulationStageIndex == 0)) // MapUpdate
FParamMap0 MapUpdate;
#endif // MapUpdate
static float HackSpawnInterp = 1.0;
void CustomHlsl8D98F0862084C86FD7721E11248AC215BEFF669B_Func(float3 In_Rad, out float Out_Vol);
void CustomHlslA4F339F903B9700D0FCF65C2AF5DFE08DF54C5AA_Func(float3 In_r, float In_m, out float3 Out_MomentOfInertia);
void CustomHlslADECD7FB1F2D8E4DD92A565B10C57DF548F79863_Func(float3 In_Radius, out float2 Out_SpriteSize);
void ScratchModule_04_Emitter_Func(inout FSimulationContext Context);
void AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_Func(float4 In_AxisAngle, bool In_NormalizeAxis, out float4 Out_Quaternion, inout FSimulationContext Context);
void MakeQuatFromAxisAngle_Emitter_Func(out float4 Out_Quaternion, inout FSimulationContext Context);
void SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func(inout FSimulationContext Context);
void ParticleState_Emitter_Func(inout FSimulationContext Context);
void GravityForce_Emitter_Func(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void GetPreviousFloatValue_Emitter_PressureReader_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void GetPreviousVector4Value_Emitter_BoundaryReader_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func(float3 In_Unit, float In_dx, float In_ParticleIndexRadius, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float4x4 In_UnitToWorld, float3 In_WorldParticleCenter, float In_Mass, bool In_Debug, out float3 Out_BuoyancyForce, out float3 Out_RotationalForce);
void Grid3D_ExternalObjectBuoyancyForce_Emitter_Func(inout FSimulationContext Context);
void TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void Collision_TransformPosition007_Emitter_Func(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void Collision_TransformVector009_Emitter_Func(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision_TransformVector010_Emitter_Func(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void CalculateRadiusFromSpriteSize_0608YET3GID8QMCAC77JQSTMD_Func(float2 In_SpriteSize, out float Out_Radius, inout FSimulationContext Context);
void DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_Func(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_Query(float3 In_FieldSamplePosWorld, out float Out_DistanceToNearestSurface, out float3 Out_FieldGradient, out bool Out_IsDistanceFieldValid);
void Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func(float3 In_Position, float3 In_StartTrace, float3 In_EndTrace, out bool Out_Collides, out float3 Out_ImpactPosition, out float3 Out_ImpactNormal, out bool Out_Insideamesh, out bool Out_DistanceFieldIsValid, out float Out_DistanceToSurface, inout FSimulationContext Context);
void PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_Func(float3 In_PlaneNormal, float3 In_PlanePivotPoint, float3 In_InitialSphereLocation, float3 In_SpherePositionDelta, float In_CollisionRadius, float In_PhysicsDeltaTime, float In_MaxCorrectiondistance, out bool Out_Collides, out float3 Out_IntersectionLocation, out float3 Out_PreASC45IntersectionSphereCenterLocation, out float3 Out_InitialPositionRelativeCollisionLocation, out float Out_TimeElapsedToCollision, out float Out_RemainingTimePostCollision, out float Out_PercentageofTimeUsedToPerformCollision, out float Out_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, out float Out_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, inout FSimulationContext Context);
void GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_Func(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void RandomRangeFloat_6I7CU82I16NFYFN0SJFFWV4PN_Func(float2 In_Min, float2 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float2 Out_Result, inout FSimulationContext Context);
void CustomHlsl4683BCCA3BB905ACC657E8A9695A79FB686C1BCD_Func(float3 In_From, float3 In_To, out float4 Out_Result);
void FindQuatBetween_v1_0_3I2NFTKATV2RTCK1BTQ3Z7Y2H_Func(float3 In_From, float3 In_To, out float4 Out_NewOutput, inout FSimulationContext Context);
void MultiplyVectorWithQuaternion_92YKLDJ6733EIEJU08FE3S25U_Func(float3 In_VECTOR_VAR, float4 In_Quaternion, out float3 Out_Vector, inout FSimulationContext Context);
void RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_Func(float3 In_ConeAxis, float In_Scale, float In_Spread, out float3 Out_Ouput, inout FSimulationContext Context);
void ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_Func(float3 In_InVector, float3 In_Normal, out float3 Out_Reflected, inout FSimulationContext Context);
void CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_Func(float3 In_INPUT_VAR, out float3 Out_CentimeterstoMeters, out float3 Out_MeterstoCentimeters, inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_Func(float3 In_VECTOR_VAR, float3 In_FallbackVector, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_Func(float3 In_VECTOR_VAR, float3 In_Normal, bool In_NormalizeNormal, out float3 Out_Ouput, inout FSimulationContext Context);
void Collision_CollisionQueryAndResponse_Emitter_Func(out float3 Out_ModuleTraceWorldStart, out float3 Out_ModuleTraceWorldEnd, out float3 Out_CollisionPosition, out float3 Out_CollisionNormal, out bool Out_Collided, inout FSimulationContext Context);
void QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_Query(float3 In_FieldSamplePosWorld, out float Out_DistanceToNearestSurface, out float3 Out_FieldGradient, out bool Out_IsDistanceFieldValid);
void Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func(float3 In_Position, float3 In_StartTrace, float3 In_EndTrace, out bool Out_Collides, out float3 Out_ImpactPosition, out float3 Out_ImpactNormal, out bool Out_Insideamesh, out bool Out_DistanceFieldIsValid, out float Out_DistanceToSurface, inout FSimulationContext Context);
void Collision_CollisionQueryAndResponse001_Emitter_Func(out float3 Out_ModuleTraceWorldStart, out float3 Out_ModuleTraceWorldEnd, out float3 Out_CollisionPosition, out float3 Out_CollisionNormal, out bool Out_Collided, inout FSimulationContext Context);
void Collision_TransformVector_Emitter_Func(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision_TransformPosition001_Emitter_Func(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void Collision_TransformVector001_Emitter_Func(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision_Emitter_Func(inout FSimulationContext Context);
void SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func(inout FSimulationContext Context);
void Drag_Emitter_Func(inout FSimulationContext Context);
void SolveForcesAndVelocity001_Emitter_Func(inout FSimulationContext Context);
void CustomHlsl0019217923909C32A9B2D0574E874B80ECEC80BEF31_Func(float4 In_Quat1, float4 In_Quat2, out float4 Out_Result);
void MultiplyQuaternion_3C978IWFTOMAEHCYB0ZX08HRV_Func(float4 In_QuaternionA, float4 In_QuaternionB, out float4 Out_Quaternion, inout FSimulationContext Context);
void ApplyRotationVector_1Q1GU085JIHFU7CSSWW5WCF4C_Func(float3 In_RotationalVelocityVector, float In_DeltaTime, float4 In_ExistingOrientationQuat, out float4 Out_NewOrientationQuat, inout FSimulationContext Context);
void ScratchModule_Emitter_Func(inout FSimulationContext Context);
float GetSpawnInterpolation();
Out_Vol = 4./3 * 3.1415926 * In_Rad.x * In_Rad.y * In_Rad.z;
Out_MomentOfInertia.x = In_r.y * In_r.y + In_r.z * In_r.z;
Out_MomentOfInertia.y = In_r.z * In_r.z + In_r.x * In_r.x;
Out_MomentOfInertia.z = In_r.y * In_r.y + In_r.x * In_r.x;
Out_MomentOfInertia *= In_m / 5.;
Out_SpriteSize = 2.0 * max(max(In_Radius.x, In_Radius.y), In_Radius.z);
float Constant30 = 0.5;
float3 Constant31 = float3(40,20,20);
float CustomHlsl8D98F0862084C86FD7721E11248AC215BEFF669B_FuncOutput_Vol;
CustomHlsl8D98F0862084C86FD7721E11248AC215BEFF669B_Func(Constant31, CustomHlsl8D98F0862084C86FD7721E11248AC215BEFF669B_FuncOutput_Vol);
float Result = CustomHlsl8D98F0862084C86FD7721E11248AC215BEFF669B_FuncOutput_Vol * Constant30;
float Constant32 = 2;
float3 Result1 = Constant31 * Constant32;
float Constant33 = 100;
float3 Result2 = Result1 / Constant33;
float Result3 = length(Constant31);
float Result4 = Result3 * Result;
float3 CustomHlslA4F339F903B9700D0FCF65C2AF5DFE08DF54C5AA_FuncOutput_MomentOfInertia;
CustomHlslA4F339F903B9700D0FCF65C2AF5DFE08DF54C5AA_Func(Constant31, Result, CustomHlslA4F339F903B9700D0FCF65C2AF5DFE08DF54C5AA_FuncOutput_MomentOfInertia);
Context.MapSpawn.Particles.Volume = CustomHlsl8D98F0862084C86FD7721E11248AC215BEFF669B_FuncOutput_Vol;
Context.MapSpawn.Particles.Mass = Result;
Context.MapSpawn.Particles.Scale = Result2;
Context.MapSpawn.Particles.RotationalInertia = Result4;
Context.MapSpawn.Particles.MomentOfInertia = CustomHlslA4F339F903B9700D0FCF65C2AF5DFE08DF54C5AA_FuncOutput_MomentOfInertia;
float Constant34 = 2;
float Result5 = Result3 * Constant34;
float2 CustomHlslADECD7FB1F2D8E4DD92A565B10C57DF548F79863_FuncOutput_SpriteSize;
CustomHlslADECD7FB1F2D8E4DD92A565B10C57DF548F79863_Func(Constant31, CustomHlslADECD7FB1F2D8E4DD92A565B10C57DF548F79863_FuncOutput_SpriteSize);
Context.MapSpawn.Particles.Diameter = Result5;
Context.MapSpawn.Particles.SpriteSize = CustomHlslADECD7FB1F2D8E4DD92A565B10C57DF548F79863_FuncOutput_SpriteSize;
Context.MapSpawn.Particles.Radius = Result3;
#if ((SimulationStageIndex == 0) || (SimulationStageIndex == 0)) // Multiple stages
// AxisAngleToQuaternion
// Input - [Vector4f Axis Angle;NiagaraBool Normalize Axis;]
// Output - [Quat4f Quaternion;]
float3 VECTOR_VAR;
float NiagaraFloat;
VECTOR_VAR.x = In_AxisAngle.x;
VECTOR_VAR.y = In_AxisAngle.y;
VECTOR_VAR.z = In_AxisAngle.z;
NiagaraFloat = In_AxisAngle.w;
float3 Result7 = normalize(VECTOR_VAR);
float3 Vector_IfResult;
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
#endif // Multiple stages
float3 Constant39 = float3(0,1,0);
float Constant40 = 45;
float Result6 = (PI/180.0f)*(Constant40);
float4 Output1;
Output1.x = Constant39.x;
Output1.y = Constant39.y;
Output1.z = Constant39.z;
Output1.w = Result6;
float4 AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_FuncOutput_Quaternion;
AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_Func(Output1, Context.MapSpawn.MakeQuatFromAxisAngle.NormalizeAxis, AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_FuncOutput_Quaternion, Context);
Out_Quaternion = AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_FuncOutput_Quaternion;
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
int Constant51 = 0;
bool Result13 = NiagaraAny(Context.MapUpdate.Emitter.ExecutionState != Constant51);
int Constant52 = 0;
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
bool bool_IfResult;
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
float3 Output11;
Output11.x = Result28.x;
Output11.y = Result28.y;
Output11.z = Result28.z;
float X;
float Y;
X = Context.MapUpdate.Particles.SpriteSize.x;
Y = Context.MapUpdate.Particles.SpriteSize.y;
float Constant61 = 0.5;
float Result29 = X * Constant61;
float Result30 = Result29 / Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx;
float3 Output12;
Output12.x = Context.MapUpdate.Particles.Position.x;
Output12.y = Context.MapUpdate.Particles.Position.y;
Output12.z = Context.MapUpdate.Particles.Position.z;
bool Constant62 = false;
float3 CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_FuncOutput_BuoyancyForce;
float3 CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_FuncOutput_RotationalForce;
CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func(Output11, Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx, Result30, Context.MapUpdate.Emitter.NumCellsX, Context.MapUpdate.Emitter.NumCellsY, Context.MapUpdate.Emitter.NumCellsZ, Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld, Output12, Context.MapUpdate.Particles.Mass, Constant62, CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_FuncOutput_BuoyancyForce, CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_FuncOutput_RotationalForce);
float3 Result31 = Context.MapUpdate.Transient.PhysicsForce + CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_FuncOutput_BuoyancyForce;
float3 Result32 = Context.MapUpdate.Transient.PhysicsRotationalForce + CustomHlsl437732EC9056D8245ABC3A100BA0160E1BA7F2FCEmitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_FuncOutput_RotationalForce;
bool Constant63 = true;
Context.MapUpdate.Transient.PhysicsForce = Result31;
Context.MapUpdate.Transient.PhysicsRotationalForce = Result32;
Context.MapUpdate.Transient.RotationalVelocityEnabled = Constant63;
// TransformBase
// Input - [ENiagaraCoordinateSpace Source Space;ENiagaraCoordinateSpace Destination Space;NiagaraMatrix LocalToWorldTransform;NiagaraMatrix WorldToLocalTransform;NiagaraBool bLocalSpace;]
// Output - [NiagaraBool bUseOriginal;NiagaraMatrix OutTransform;NiagaraBool LocalToWorld;]
int Constant100 = 0;
bool Result38 = NiagaraAll(In_SourceSpace == Constant100);
int Constant101 = 0;
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
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result59;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result64;
bool Constant99 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant99, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld, Context);
float3 Result65 = mul(float4(In_InPosition,1.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InPosition;
Vector_IfResult1 = Result65;
Out_OutPosition = Vector_IfResult1;
bool Constant109 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal1;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform1;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld1;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant109, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal1, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform1, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld1, Context);
float3 Result66 = mul(float4(In_InVector,0.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform1).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result66;
Out_OutVector = Vector_IfResult2;
bool Constant113 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal2;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform2;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld2;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant113, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal2, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform2, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld2, Context);
float3 Result67 = mul(float4(In_InVector,0.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform2).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InVector;
Vector_IfResult3 = Result67;
Out_OutVector = Vector_IfResult3;
// CalculateRadiusFromSpriteSize
// Method=NewEnumerator0
// Input - [Vector2f Sprite Size;]
// Output - [NiagaraFloat Radius;]
float Result68 = length(In_SpriteSize);
float Constant115 = 0.5;
float Result69 = Result68 * Constant115;
Out_Radius = Result69;
// DragVelocity
// Usage=Particle
// Input - [Vector3f Velocity;Vector3f AdvectionVelocity;NiagaraFloat InverseMass;NiagaraFloat Drag;NiagaraFloat DeltaTime;NiagaraBool IgnoreMass;]
// Output - [Vector3f Output;]
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
// DirectionAndLengthSafe_v1_0
// Input - [Vector3f V;Vector3f Fallback;NiagaraFloat Threshold;]
// Output - [Vector3f Direction;NiagaraFloat Length;NiagaraBool Below Threshold;]
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
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction2;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length2;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold2;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient, Constant138, Constant139, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction2, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length2, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold2, Context);
float3 Result102 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface * DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction2;
float3 Result103 = In_Position - Result102;
Out_Collides = Result101;
Out_ImpactPosition = Result103;
Out_ImpactNormal = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction2;
Out_Insideamesh = Result99;
Out_DistanceFieldIsValid = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid;
Out_DistanceToSurface = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface;
// PlaneSphereCollisionDetection
// Input - [Vector3f Plane Normal;Vector3f Plane Pivot Point;Vector3f Initial Sphere Location;Vector3f Sphere Position Delta;NiagaraFloat Collision Radius;NiagaraFloat Physics Delta Time;NiagaraFloat Max Correction distance;]
// Output - [NiagaraBool Collides;Vector3f Intersection Location;Vector3f Pre-Intersection Sphere Center Location;Vector3f Initial Position Relative Collision Location;NiagaraFloat Time Elapsed To Collision;NiagaraFloat Remaining Time Post Collision;NiagaraFloat Percentage of Time Used To Perform Collision;NiagaraFloat Initial Distance Between The Sphere's Surface and the Collision ;NiagaraFloat Uninterrupted Animated Sphere's Distance to Collision Plane ;]
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
// GetRandomInfo
// Emitter.Determinism_false
// Input - [NiagaraInt32 Seed;NiagaraInt32 Engine.System.TickCount;NiagaraBool OverrideSeed;NiagaraInt32 Particles.UniqueID;NiagaraInt32 Emitter.RandomSeed;NiagaraBool Fixed Override Seed;ENiagaraRandomnessMode RandomnessMode;]
// Output - [NiagaraRandInfo RandomInfo;NiagaraBool Use Deterministic Randoms;]
bool Constant168 = false;
int Constant169 = 0;
bool Result152 = NiagaraAll(In_RandomnessMode == Constant169);
bool Result153 = Constant168 && Result152;
int Constant170 = 1;
bool Result154 = NiagaraAll(In_RandomnessMode == Constant170);
bool Result155 = Result153 || Result154;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapUpdate.Emitter.RandomSeed;
int Constant171 = 0;
int Constant172 = 0;
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
// RandomRangeFloat
// Input - [Vector2f Min;Vector2f Max;NiagaraInt32 Seed;ENiagaraRandomnessMode RandomnessMode;NiagaraBool OverrideSeed;]
// Output - [Vector2f Result;]
int Constant163 = (0);
bool Constant164 = false;
int Constant165 = 0;
int Constant166 = (0);
bool Constant167 = false;
NiagaraRandInfo GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo;
bool GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_UseDeterministicRandoms;
GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_Func(In_Seed, Constant163, In_OverrideSeed, Constant165, Constant166, Constant167, In_RandomnessMode, GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo, GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_UseDeterministicRandoms, Context);
float2 Result156 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo.Seed1;
Seed2 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo.Seed2;
Seed3 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo.Seed3;
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
// FindQuatBetween_v1_0
// Input - [Vector3f From;Vector3f To;]
// Output - [Quat4f NewOutput;]
float3 Constant182 = float3(1,0,0);
float Constant183 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction4;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length4;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold4;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(In_From, Constant182, Constant183, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction4, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length4, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold4, Context);
float3 Constant184 = float3(1,0,0);
float Constant185 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction5;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length5;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold5;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(In_To, Constant184, Constant185, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction5, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length5, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold5, Context);
float4 CustomHlsl4683BCCA3BB905ACC657E8A9695A79FB686C1BCD_FuncOutput_Result;
CustomHlsl4683BCCA3BB905ACC657E8A9695A79FB686C1BCD_Func(DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction4, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction5, CustomHlsl4683BCCA3BB905ACC657E8A9695A79FB686C1BCD_FuncOutput_Result);
Out_NewOutput = CustomHlsl4683BCCA3BB905ACC657E8A9695A79FB686C1BCD_FuncOutput_Result;
// MultiplyVectorWithQuaternion
// Input - [Vector3f Vector;Quat4f Quaternion;]
// Output - [Vector3f Vector;]
float3 Output0;
float Output16;
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
// RandomizeCollisionNormals
// Input - [Vector3f Cone Axis;NiagaraFloat Scale;NiagaraFloat Spread;]
// Output - [Vector3f Ouput;]
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
float2 RandomRangeFloat_6I7CU82I16NFYFN0SJFFWV4PN_FuncOutput_Result;
RandomRangeFloat_6I7CU82I16NFYFN0SJFFWV4PN_Func(Output13, Output14, Constant160, Constant161, Constant162, RandomRangeFloat_6I7CU82I16NFYFN0SJFFWV4PN_FuncOutput_Result, Context);
float X1;
float Y1;
X1 = RandomRangeFloat_6I7CU82I16NFYFN0SJFFWV4PN_FuncOutput_Result.x;
Y1 = RandomRangeFloat_6I7CU82I16NFYFN0SJFFWV4PN_FuncOutput_Result.y;
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
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction3;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length3;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold3;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(In_ConeAxis, Constant180, Constant181, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction3, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length3, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold3, Context);
float4 FindQuatBetween_v1_0_3I2NFTKATV2RTCK1BTQ3Z7Y2H_FuncOutput_NewOutput;
FindQuatBetween_v1_0_3I2NFTKATV2RTCK1BTQ3Z7Y2H_Func(Constant179, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction3, FindQuatBetween_v1_0_3I2NFTKATV2RTCK1BTQ3Z7Y2H_FuncOutput_NewOutput, Context);
float3 MultiplyVectorWithQuaternion_92YKLDJ6733EIEJU08FE3S25U_FuncOutput_Vector;
MultiplyVectorWithQuaternion_92YKLDJ6733EIEJU08FE3S25U_Func(Result170, FindQuatBetween_v1_0_3I2NFTKATV2RTCK1BTQ3Z7Y2H_FuncOutput_NewOutput, MultiplyVectorWithQuaternion_92YKLDJ6733EIEJU08FE3S25U_FuncOutput_Vector, Context);
Out_Ouput = MultiplyVectorWithQuaternion_92YKLDJ6733EIEJU08FE3S25U_FuncOutput_Vector;
// ReflectVector
// Input - [Vector3f InVector;Vector3f Normal;]
// Output - [Vector3f Reflected;]
float Result183 = dot(In_InVector,In_Normal);
float Result184 = Result183 + Result183;
float3 Result185 = Result184 * In_Normal;
float3 Result186 = In_InVector - Result185;
Out_Reflected = Result186;
// CentimeterMeterConversion
// Input - [Vector3f Input;]
// Output - [Vector3f Centimeters to Meters;Vector3f Meters to Centimeters;]
float Constant188 = 0.01;
float3 Result187 = In_INPUT_VAR * Constant188;
float Constant189 = 100;
float3 Result188 = In_INPUT_VAR * Constant189;
Out_CentimeterstoMeters = Result187;
Out_MeterstoCentimeters = Result188;
// DirectionAndLengthSafe_v1_1
// Input - [Vector3f Vector;Vector3f Fallback Vector;NiagaraFloat Threshold;]
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
// ProjectVectorOnPlane
// Input - [Vector3f Vector;Vector3f Normal;NiagaraBool Normalize Normal;]
float Result192 = dot(In_VECTOR_VAR,In_Normal);
float3 Constant192 = float3(0,0,0);
float Constant193 = 1e-05;
float3 DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction;
float DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Length;
bool DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_BelowThreshold;
DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_Func(In_Normal, Constant192, Constant193, DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction, DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Length, DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_BelowThreshold, Context);
float3 Constant196 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult3 = Constant196;
Vector3f_SelectResult3 = DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction;
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
float3 DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output;
DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_Func(Result75, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output, Context);
float3 Result83 = DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output * Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleInitialForceDividedByMass = Result73;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution = Result74;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate = Result83;
float3 Constant130 = float3(0,0,-1);
float Constant131 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution, Constant130, Constant131, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceVector = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceDirection = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction;
float3 Result91 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction * Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius;
float3 Result92 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin - Result91;
float3 Result93 = Result91 + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
float3 Constant134 = float3(0,0,-1);
float Constant135 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction1;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length1;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold1;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Result93, Constant134, Constant135, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction1, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length1, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold1, Context);
float3 Result94 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction1 * DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length1;
float3 Result95 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin + Result94;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart = Result92;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd = Result95;
int Constant136 = 0;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Collides;
float3 Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactPosition;
float3 Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactNormal;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Insideamesh;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceFieldIsValid;
float Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceToSurface;
Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func(Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Collides, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactPosition, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactNormal, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Insideamesh, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceFieldIsValid, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceToSurface, Context);
float Constant140 = 0;
bool Result104 = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Insideamesh && Context.MapUpdate.Collision.CollisionQueryAndResponse.KillParticlesLodgedWithinMeshes && Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionEnabled;
bool Result105 = !Result104;
bool Result106 = Context.MapUpdate.DataInstance.Alive && Result105;
bool Constant141 = false;
bool Constant142 = true;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse.CollisionID = Constant136;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Collides;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactPosition;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactNormal;
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
bool PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_Collides;
float3 PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_IntersectionLocation;
float3 PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PreASC45IntersectionSphereCenterLocation;
float3 PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialPositionRelativeCollisionLocation;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_TimeElapsedToCollision;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_RemainingTimePostCollision;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PercentageofTimeUsedToPerformCollision;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_Func(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius, Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Collision.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_Collides, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_IntersectionLocation, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PreASC45IntersectionSphereCenterLocation, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialPositionRelativeCollisionLocation, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_TimeElapsedToCollision, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_RemainingTimePostCollision, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PercentageofTimeUsedToPerformCollision, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_IntersectionLocation;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PreASC45IntersectionSphereCenterLocation;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialPositionRelativeCollisionLocation;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTickDeltaForThisCollisionUpdate = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_TimeElapsedToCollision;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePhysicsDeltaTime = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_RemainingTimePostCollision;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePercentageOfTickDedicatedToUpdatingPosition = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PercentageofTimeUsedToPerformCollision;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
Context.MapUpdate.Transient.CollisionDistanceToCollision = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
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
float3 RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_FuncOutput_Ouput;
RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_Func(Context.MapUpdate.Transient.CollisionNormal, Constant156, Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage, RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_FuncOutput_Ouput, Context);
float3 Vector_IfResult4;
Vector_IfResult4 = RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_FuncOutput_Ouput;
Vector_IfResult4 = Context.MapUpdate.Transient.CollisionNormal;
float3 ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_FuncOutput_Reflected;
ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_Func(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult4, ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_FuncOutput_Reflected, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity = ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_FuncOutput_Reflected;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters;
CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_Func(Context.MapUpdate.Transient.CollisionVelocity, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters, Context);
float3 Result189 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters;
float Constant190 = -1;
float3 Result190 = Result189 * Constant190;
float Result191 = dot(Result190,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons = Result191;
bool Constant191 = false;
float3 ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput;
ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_Func(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant191, ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput, Context);
float3 Constant197 = float3(0,0,0);
float Constant198 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction6;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length6;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold6;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput, Constant197, Constant198, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction6, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length6, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold6, Context);
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters1;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters1;
CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_Func(ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters1, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters1, Context);
float3 Result202 = CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters1 * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float Constant199 = 0;
float float_IfResult3;
float_IfResult3 = Constant199;
float_IfResult3 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length6;
bool Result203 = NiagaraAll(float_IfResult3 > Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionEngagementSpeed);
float float_IfResult4;
float_IfResult4 = Context.MapUpdate.Collision.CollisionQueryAndResponse.DynamicFrictionCoefficient;
float_IfResult4 = Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionCoefficient;
float float_IfResult5;
float_IfResult5 = float_IfResult4;
float_IfResult5 = Context.MapUpdate.Collision.CollisionQueryAndResponse.BounceCollisionFriction;
float3 Result204 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction6 * float_IfResult5 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons;
float3 Result205 = Result202 - Result204;
float3 Constant200 = float3(0,0,0);
float Constant201 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction7;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length7;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold7;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Result205, Constant200, Constant201, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction7, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length7, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold7, Context);
float Result206 = dot(DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction6,DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction7);
float Constant202 = 0;
bool Result207 = NiagaraAll(Result206 <= Constant202);
float3 Vector_IfResult5;
Vector_IfResult5 = Result202;
Vector_IfResult5 = Result204;
float Constant203 = -1;
float3 Result208 = Vector_IfResult5 * Constant203;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons = Result208;
float3 Result209 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters2;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters2;
CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_Func(Result209, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters2, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters2, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector = CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters2;
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
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction8;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length8;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold8;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Context.MapUpdate.Transient.CollisionVelocity, Constant204, Constant205, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction8, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length8, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold8, Context);
float Result216 = dot(DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction8,Context.MapUpdate.Transient.CollisionNormal);
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
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction11;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length11;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold11;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient, Constant217, Constant218, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction11, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length11, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold11, Context);
float3 Result235 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface * DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction11;
float3 Result236 = In_Position - Result235;
Out_Collides = Result234;
Out_ImpactPosition = Result236;
Out_ImpactNormal = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction11;
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
float3 DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output1;
DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_Func(Result222, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output1, Context);
float3 Result223 = DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output1 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass = Result220;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleForceContribution = Result221;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate = Result223;
float3 Constant211 = float3(0,0,-1);
float Constant212 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction9;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length9;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold9;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Constant211, Constant212, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction9, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length9, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold9, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceVector = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceDirection = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction9;
float3 Result224 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction9 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius;
float3 Result225 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin - Result224;
float3 Result226 = Result224 + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
float3 Constant213 = float3(0,0,-1);
float Constant214 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction10;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length10;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold10;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Result226, Constant213, Constant214, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction10, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length10, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold10, Context);
float3 Result227 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction10 * DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length10;
float3 Result228 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin + Result227;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart = Result225;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd = Result228;
int Constant215 = 0;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Collides;
float3 Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactPosition;
float3 Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactNormal;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Insideamesh;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceFieldIsValid;
float Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceToSurface;
Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func(Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Collides, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactPosition, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactNormal, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Insideamesh, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceFieldIsValid, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_DistanceToSurface, Context);
float Constant219 = 0;
bool Result237 = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Insideamesh && Context.MapUpdate.Collision.CollisionQueryAndResponse001.KillParticlesLodgedWithinMeshes && Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionEnabled;
bool Result238 = !Result237;
bool Result239 = Context.MapUpdate.DataInstance.Alive && Result238;
bool Constant220 = false;
bool Constant221 = true;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse001.CollisionID = Constant215;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_Collides;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactPosition;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_FuncOutput_ImpactNormal;
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
bool PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_Collides1;
float3 PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_IntersectionLocation1;
float3 PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PreASC45IntersectionSphereCenterLocation1;
float3 PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialPositionRelativeCollisionLocation1;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_TimeElapsedToCollision1;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_RemainingTimePostCollision1;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PercentageofTimeUsedToPerformCollision1;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
float PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_Func(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius, Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_Collides1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_IntersectionLocation1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PreASC45IntersectionSphereCenterLocation1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialPositionRelativeCollisionLocation1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_TimeElapsedToCollision1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_RemainingTimePostCollision1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PercentageofTimeUsedToPerformCollision1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1, PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_IntersectionLocation1;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PreASC45IntersectionSphereCenterLocation1;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialPositionRelativeCollisionLocation1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTickDeltaForThisCollisionUpdate = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_TimeElapsedToCollision1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePhysicsDeltaTime = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_RemainingTimePostCollision1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePercentageOfTickDedicatedToUpdatingPosition = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_PercentageofTimeUsedToPerformCollision1;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
Context.MapUpdate.Transient.CollisionDistanceToCollision = PlaneSphereCollisionDetection_8V6ZD16U2ORUHPIGUQ0T17JV4_FuncOutput_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
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
float3 RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_FuncOutput_Ouput1;
RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_Func(Context.MapUpdate.Transient.CollisionNormal, Constant227, Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage, RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_FuncOutput_Ouput1, Context);
float3 Vector_IfResult6;
Vector_IfResult6 = RandomizeCollisionNormals_EDT4JZRF66C6G13STJ0OLBXL1_FuncOutput_Ouput1;
Vector_IfResult6 = Context.MapUpdate.Transient.CollisionNormal;
float3 ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_FuncOutput_Reflected1;
ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_Func(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult6, ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_FuncOutput_Reflected1, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity = ReflectVector_9L7L2QJ1B4AH8XQB6T1FF9J0B_FuncOutput_Reflected1;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters3;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters3;
CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_Func(Context.MapUpdate.Transient.CollisionVelocity, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters3, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters3, Context);
float3 Result253 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters3;
float Constant228 = -1;
float3 Result254 = Result253 * Constant228;
float Result255 = dot(Result254,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons = Result255;
bool Constant229 = false;
float3 ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput1;
ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_Func(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant229, ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput1, Context);
float3 Constant230 = float3(0,0,0);
float Constant231 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction12;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length12;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold12;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput1, Constant230, Constant231, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction12, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length12, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold12, Context);
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters4;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters4;
CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_Func(ProjectVectorOnPlane_DLU68AL9VMGJJRB8M3K6HPG5B_FuncOutput_Ouput1, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters4, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters4, Context);
float3 Result256 = CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters4 * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float Constant232 = 0;
float float_IfResult8;
float_IfResult8 = Constant232;
float_IfResult8 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length12;
bool Result257 = NiagaraAll(float_IfResult8 > Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed);
float float_IfResult9;
float_IfResult9 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DynamicFrictionCoefficient;
float_IfResult9 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionCoefficient;
float float_IfResult10;
float_IfResult10 = float_IfResult9;
float_IfResult10 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.BounceCollisionFriction;
float3 Result258 = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction12 * float_IfResult10 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons;
float3 Result259 = Result256 - Result258;
float3 Constant233 = float3(0,0,0);
float Constant234 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction13;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length13;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold13;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Result259, Constant233, Constant234, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction13, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length13, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold13, Context);
float Result260 = dot(DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction12,DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction13);
float Constant235 = 0;
bool Result261 = NiagaraAll(Result260 <= Constant235);
float3 Vector_IfResult7;
Vector_IfResult7 = Result256;
Vector_IfResult7 = Result258;
float Constant236 = -1;
float3 Result262 = Vector_IfResult7 * Constant236;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons = Result262;
float3 Result263 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters5;
float3 CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters5;
CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_Func(Result263, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_CentimeterstoMeters5, CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters5, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector = CentimeterMeterConversion_A8TD2SZ0SN6PFH64BNI186LOI_FuncOutput_MeterstoCentimeters5;
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
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction14;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length14;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold14;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Context.MapUpdate.Transient.CollisionVelocity, Constant237, Constant238, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction14, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length14, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold14, Context);
float Result270 = dot(DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction14,Context.MapUpdate.Transient.CollisionNormal);
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
float4x4 Matrix_IfResult4;
float4x4 Matrix001_IfResult3;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal3;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform3;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld3;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant272, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal3, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform3, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld3, Context);
float3 Result300 = mul(float4(In_InVector,0.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform3).xyz;
float3 Vector_IfResult10;
Vector_IfResult10 = In_InVector;
Vector_IfResult10 = Result300;
Out_OutVector = Vector_IfResult10;
bool Constant277 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult4;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal4;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform4;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld4;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult4, Constant277, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal4, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform4, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld4, Context);
float3 Result303 = mul(float4(In_InPosition,1.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform4).xyz;
float3 Vector_IfResult11;
Vector_IfResult11 = In_InPosition;
Vector_IfResult11 = Result303;
Out_OutPosition = Vector_IfResult11;
bool Constant281 = false;
float4x4 Matrix_IfResult6;
float4x4 Matrix001_IfResult5;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal5;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform5;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld5;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult5, Constant281, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal5, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform5, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld5, Context);
float3 Result304 = mul(float4(In_InVector,0.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform5).xyz;
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
int Constant96 = 0;
int Constant97 = 1;
bool Constant98 = false;
float3 Collision_TransformPosition007_Emitter_FuncOutput_OutPosition;
Collision_TransformPosition007_Emitter_Func(Context.MapUpdate.Particles.Position, Constant96, Constant97, Constant98, Collision_TransformPosition007_Emitter_FuncOutput_OutPosition, Context);
int Constant106 = 0;
int Constant107 = 1;
bool Constant108 = false;
float3 Collision_TransformVector009_Emitter_FuncOutput_OutVector;
Collision_TransformVector009_Emitter_Func(Context.MapUpdate.Particles.Velocity, Constant106, Constant107, Constant108, Collision_TransformVector009_Emitter_FuncOutput_OutVector, Context);
int Constant110 = 0;
int Constant111 = 1;
bool Constant112 = false;
float3 Collision_TransformVector010_Emitter_FuncOutput_OutVector;
Collision_TransformVector010_Emitter_Func(Context.MapUpdate.Collision.PhysicsForce, Constant110, Constant111, Constant112, Collision_TransformVector010_Emitter_FuncOutput_OutVector, Context);
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition007_Emitter_FuncOutput_OutPosition;
Context.MapUpdate.Local.Collision.InputPositionPassthrough_NeededForSimStageExecution = Collision_TransformPosition007_Emitter_FuncOutput_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector009_Emitter_FuncOutput_OutVector;
Context.MapUpdate.Local.Collision.InputVelocityPassthrough_NeededForSimStageExecution = Collision_TransformVector009_Emitter_FuncOutput_OutVector;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = Collision_TransformVector010_Emitter_FuncOutput_OutVector;
Context.MapUpdate.Local.Collision.InputForcePassthrough_NeededForSimStageExecution = Collision_TransformVector010_Emitter_FuncOutput_OutVector;
float Constant114 = 1;
float CalculateRadiusFromSpriteSize_0608YET3GID8QMCAC77JQSTMD_FuncOutput_Radius;
CalculateRadiusFromSpriteSize_0608YET3GID8QMCAC77JQSTMD_Func(Context.MapUpdate.Particles.SpriteSize, CalculateRadiusFromSpriteSize_0608YET3GID8QMCAC77JQSTMD_FuncOutput_Radius, Context);
float Result70 = Constant114 * CalculateRadiusFromSpriteSize_0608YET3GID8QMCAC77JQSTMD_FuncOutput_Radius;
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
float3 Collision_CollisionQueryAndResponse_Emitter_FuncOutput_ModuleTraceWorldStart;
float3 Collision_CollisionQueryAndResponse_Emitter_FuncOutput_ModuleTraceWorldEnd;
float3 Collision_CollisionQueryAndResponse_Emitter_FuncOutput_CollisionPosition;
float3 Collision_CollisionQueryAndResponse_Emitter_FuncOutput_CollisionNormal;
bool Collision_CollisionQueryAndResponse_Emitter_FuncOutput_Collided;
Collision_CollisionQueryAndResponse_Emitter_Func(Collision_CollisionQueryAndResponse_Emitter_FuncOutput_ModuleTraceWorldStart, Collision_CollisionQueryAndResponse_Emitter_FuncOutput_ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse_Emitter_FuncOutput_CollisionPosition, Collision_CollisionQueryAndResponse_Emitter_FuncOutput_CollisionNormal, Collision_CollisionQueryAndResponse_Emitter_FuncOutput_Collided, Context);
Context.MapUpdate.Local.Collision.ModuleTraceWorldStart1 = Collision_CollisionQueryAndResponse_Emitter_FuncOutput_ModuleTraceWorldStart;
Context.MapUpdate.Local.Collision.ModuleTraceWorldEnd1 = Collision_CollisionQueryAndResponse_Emitter_FuncOutput_ModuleTraceWorldEnd;
Context.MapUpdate.Local.Collision.DebugCollisionPosition1 = Collision_CollisionQueryAndResponse_Emitter_FuncOutput_CollisionPosition;
Context.MapUpdate.Local.Collision.DebugCollisionNormal1 = Collision_CollisionQueryAndResponse_Emitter_FuncOutput_CollisionNormal;
Context.MapUpdate.Local.Collision.DebugCollided1 = Collision_CollisionQueryAndResponse_Emitter_FuncOutput_Collided;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Valid = Context.MapUpdate.Transient.CollisionValid;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Normal = Context.MapUpdate.Transient.CollisionNormal;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float Constant208 = 1;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.TraceVectorLengthMultiplier = Constant208;
float Constant209 = 1e+10;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxTraceLength = Constant209;
int Constant210 = 0;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.CPUFrictionMergeType = Constant210;
float3 Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_ModuleTraceWorldStart;
float3 Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_ModuleTraceWorldEnd;
float3 Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_CollisionPosition;
float3 Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_CollisionNormal;
bool Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_Collided;
Collision_CollisionQueryAndResponse001_Emitter_Func(Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_ModuleTraceWorldStart, Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_CollisionPosition, Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_CollisionNormal, Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_Collided, Context);
Context.MapUpdate.Local.Collision.ModuleTraceWorldStart2 = Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_ModuleTraceWorldStart;
Context.MapUpdate.Local.Collision.ModuleTraceWorldEnd2 = Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_ModuleTraceWorldEnd;
Context.MapUpdate.Local.Collision.DebugCollisionPosition2 = Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_CollisionPosition;
Context.MapUpdate.Local.Collision.DebugCollisionNormal2 = Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_CollisionNormal;
Context.MapUpdate.Local.Collision.DebugCollided2 = Collision_CollisionQueryAndResponse001_Emitter_FuncOutput_Collided;
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
float3 DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction1;
float DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Length1;
bool DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_BelowThreshold1;
DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_Func(Result288, Constant259, Constant260, DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction1, DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Length1, DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_BelowThreshold1, Context);
float Result289 = dot(DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction1,Constant245);
float Constant261 = 0.5;
float Result290 = Constant246 - Constant261;
float Constant262 = 2;
float Result291 = Result290 * Constant262;
bool Result292 = NiagaraAll(Result289 > Result291);
bool Result293 = Result287 && Result292;
bool bool_IfResult1;
bool_IfResult1 = Result293;
bool_IfResult1 = Result287;
bool Result294 = Context.MapUpdate.Collision.EnableRestState && bool_IfResult1 && Context.MapUpdate.Collision.CollisionEnabled;
bool Result295 = Result294 || Context.MapUpdate.Local.Collision.ManuallyEnterRest;
float3 Constant263 = float3(0,0,0);
float3 Constant264 = float3(0,0,0);
float3 Constant265 = float3(0,0,0);
float Result296 = dot(Context.MapUpdate.Transient.AdvectionVelocity,DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction1);
float Constant266 = 0;
bool Result297 = NiagaraAll(Result296 > Constant266);
float3 Result298 = DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction1 * Result296;
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
float3 Collision_TransformVector_Emitter_FuncOutput_OutVector;
Collision_TransformVector_Emitter_Func(Force_IfResult1, Constant269, Constant270, Constant271, Collision_TransformVector_Emitter_FuncOutput_OutVector, Context);
bool Result301 = Result281 && Context.MapUpdate.Collision.CollisionEnabled;
bool Result302 = Context.MapUpdate.Local.Collision.ManuallyEnterRest || Result301;
float3 Constant273 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult7 = Constant273;
Vector3f_SelectResult7 = DirectionAndLengthSafe_v1_1_AOU9XRUX0MRIM8OMCGCZRLMW3_FuncOutput_Direction1;
Vector3f_SelectResult7 = Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal;
int Constant274 = 1;
int Constant275 = 0;
bool Constant276 = false;
float3 Collision_TransformPosition001_Emitter_FuncOutput_OutPosition;
Collision_TransformPosition001_Emitter_Func(Position_IfResult1, Constant274, Constant275, Constant276, Collision_TransformPosition001_Emitter_FuncOutput_OutPosition, Context);
int Constant278 = 1;
int Constant279 = 0;
bool Constant280 = false;
float3 Collision_TransformVector001_Emitter_FuncOutput_OutVector;
Collision_TransformVector001_Emitter_Func(Velocity_IfResult3, Constant278, Constant279, Constant280, Collision_TransformVector001_Emitter_FuncOutput_OutVector, Context);
Context.MapUpdate.Transient.PhysicsForce = Collision_TransformVector_Emitter_FuncOutput_OutVector;
Context.MapUpdate.Transient.PhysicsDeltaTime = deltatime_IfResult1;
Context.MapUpdate.Transient.CollisionIsResting = Result302;
Context.MapUpdate.Particles.RestCounter = Result280;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCombinedCollisionNormal = Vector3f_SelectResult7;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition001_Emitter_FuncOutput_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector001_Emitter_FuncOutput_OutVector;
Context.MapUpdate.Particles.Velocity = Collision_TransformVector001_Emitter_FuncOutput_OutVector;
Context.MapUpdate.Particles.Position = Collision_TransformPosition001_Emitter_FuncOutput_OutPosition;
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
float3 DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output2;
DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_Func(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity001.DragIgnoreMass, DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output2, Context);
float3 Result313 = DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output2 - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = DragVelocity_3KZNIM4PLM17LJIHZ114YFNE9_FuncOutput_Output2;
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
// MultiplyQuaternion
// Input - [Quat4f Quaternion A;Quat4f Quaternion B;]
float4 CustomHlsl0019217923909C32A9B2D0574E874B80ECEC80BEF31_FuncOutput_Result;
CustomHlsl0019217923909C32A9B2D0574E874B80ECEC80BEF31_Func(In_QuaternionA, In_QuaternionB, CustomHlsl0019217923909C32A9B2D0574E874B80ECEC80BEF31_FuncOutput_Result);
Out_Quaternion = CustomHlsl0019217923909C32A9B2D0574E874B80ECEC80BEF31_FuncOutput_Result;
// ApplyRotationVector
// Normalize Rotations=false
// Input - [Vector3f Rotational Velocity Vector;NiagaraFloat DeltaTime;Quat4f Existing Orientation Quat;]
// Output - [Quat4f New Orientation Quat;]
float3 Result328 = In_RotationalVelocityVector * In_DeltaTime;
float3 Constant308 = float3(0,0,0);
float Constant309 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction15;
float DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length15;
bool DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold15;
DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_Func(Result328, Constant308, Constant309, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction15, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length15, DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_BelowThreshold15, Context);
float4 Vector4;
Vector4.x = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction15.x;
Vector4.y = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction15.y;
Vector4.z = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Direction15.z;
Vector4.w = DirectionAndLengthSafe_v1_0_063ZWJ3MS4MW9QA6NA2AYEG41_FuncOutput_Length15;
bool Constant310 = true;
float4 AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_FuncOutput_Quaternion1;
AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_Func(Vector4, Constant310, AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_FuncOutput_Quaternion1, Context);
float4 MultiplyQuaternion_3C978IWFTOMAEHCYB0ZX08HRV_FuncOutput_Quaternion;
MultiplyQuaternion_3C978IWFTOMAEHCYB0ZX08HRV_Func(AxisAngleToQuaternion_228F573VN2I9ZRUD0KGPAZ2SP_FuncOutput_Quaternion1, In_ExistingOrientationQuat, MultiplyQuaternion_3C978IWFTOMAEHCYB0ZX08HRV_FuncOutput_Quaternion, Context);
float4 Quat_IfResult;
Quat_IfResult = In_ExistingOrientationQuat;
Quat_IfResult = MultiplyQuaternion_3C978IWFTOMAEHCYB0ZX08HRV_FuncOutput_Quaternion;
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
float4 ApplyRotationVector_1Q1GU085JIHFU7CSSWW5WCF4C_FuncOutput_NewOrientationQuat;
ApplyRotationVector_1Q1GU085JIHFU7CSSWW5WCF4C_Func(Context.MapUpdate.Particles.RotationalVelocity, Context.MapUpdate.ScratchModule.DeltaTime, Context.MapUpdate.Particles.MeshOrientation, ApplyRotationVector_1Q1GU085JIHFU7CSSWW5WCF4C_FuncOutput_NewOrientationQuat, Context);
Context.MapUpdate.Particles.MeshOrientation = ApplyRotationVector_1Q1GU085JIHFU7CSSWW5WCF4C_FuncOutput_NewOrientationQuat;
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
#if (SimulationStageIndex == 0) // MapSpawn
Context.MapSpawn.Particles.Previous.MeshOrientation = Context.MapSpawn.Particles.MeshOrientation;
Context.MapSpawn.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Previous.Scale = Context.MapSpawn.Particles.Scale;
Context.MapSpawn.Particles.Previous.SpriteSize = Context.MapSpawn.Particles.SpriteSize;
Context.MapSpawn.Particles.Previous.Velocity = Context.MapSpawn.Particles.Velocity;
//Begin Interpolated Spawn Script!
//Begin Initialize Parameter Map Defaults
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
float3 Constant21 = float3(0,0,0);
Context.MapSpawn.Particles.Collision.SafeCombinedCollisionNormal = Constant21;
float3 Constant22 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.PrevPosition = Constant22;
float3 Constant23 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Velocity = Constant23;
float3 Constant24 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Position = Constant24;
float3 Constant25 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.PhysicsForce = Constant25;
float3 Constant26 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Position = Constant26;
float Constant27 = 0;
Context.MapSpawn.Particles.DistanceTraveled = Constant27;
//End Initialize Parameter Map Defaults
float Constant28 = 0.5;
float3 Constant29 = float3(40,20,20);
EnterStatScope(1 /**ScratchModule_04_Emitter_Func*/);
ScratchModule_04_Emitter_Func(Context);
ExitStatScope(/**ScratchModule_04_Emitter_Func*/);
float3 Constant35 = float3(0,0,200);
float3 Constant36 = float3(0,1,0);
float Constant37 = 45;
bool Constant38 = false;
Context.MapSpawn.MakeQuatFromAxisAngle.NormalizeAxis = Constant38;
float4 MakeQuatFromAxisAngle_Emitter_FuncOutput_Quaternion;
MakeQuatFromAxisAngle_Emitter_Func(MakeQuatFromAxisAngle_Emitter_FuncOutput_Quaternion, Context);
Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.Position = Constant35;
Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.MeshOrientation = MakeQuatFromAxisAngle_Emitter_FuncOutput_Quaternion;
float3 Constant42 = float3(0,0,0);
float3 Constant43 = float3(0,0,0);
float4 Constant44 = float4(0,0,0,1);
EnterStatScope(2 /**SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func*/);
SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func(Context);
ExitStatScope(/**SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func*/);
//End Spawn Script!
//Handle resetting previous values at the end of spawn so that they match outputs! (Needed for motion blur/etc)
HandlePreviousValuesForSpawn(Context);
// Begin HandleMissingDefaultValues
// End HandleMissingDefaultValues
//Begin Update Script!
RandomCounterDeterministic = 0;
bool Constant48 = true;
Context.MapUpdate.DataInstance.Alive = Constant48;
bool Constant49 = false;
Context.MapUpdate.ParticleState.LoopParticlesLifetime = Constant49;
Context.MapUpdate.ParticleState.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
bool Constant50 = false;
Context.MapUpdate.ParticleState.LetInfinitelyLivedParticlesDieWhenEmitterDeactivates = Constant50;
EnterStatScope(3 /**ParticleState_Emitter_Func*/);
ParticleState_Emitter_Func(Context);
ExitStatScope(/**ParticleState_Emitter_Func*/);
float3 Constant57 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant57;
float3 Constant58 = float3(0,0,-980);
EnterStatScope(4 /**GravityForce_Emitter_Func*/);
GravityForce_Emitter_Func(Context);
ExitStatScope(/**GravityForce_Emitter_Func*/);
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx = Context.MapUpdate.Emitter.dx;
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld = Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.WorldToUnit = Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit;
float3 Constant60 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsRotationalForce = Constant60;
EnterStatScope(5 /**Grid3D_ExternalObjectBuoyancyForce_Emitter_Func*/);
Grid3D_ExternalObjectBuoyancyForce_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ExternalObjectBuoyancyForce_Emitter_Func*/);
int Constant64 = 1;
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
float Constant74 = 0;
float Constant75 = 0.1;
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
EnterStatScope(6 /**Collision_Emitter_Func*/);
Collision_Emitter_Func(Context);
ExitStatScope(/**Collision_Emitter_Func*/);
Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevMeshOrientation = Context.MapUpdate.Particles.MeshOrientation;
Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevPosition = Context.MapUpdate.Particles.Position;
EnterStatScope(7 /**SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func*/);
SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func(Context);
ExitStatScope(/**SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func*/);
float Constant284 = 0.5;
float Constant285 = 0;
float Constant286 = 0;
Context.MapUpdate.Transient.PhysicsRotationalDrag = Constant286;
bool Constant287 = true;
Context.MapUpdate.Drag.IgnoreMass = Constant287;
EnterStatScope(8 /**Drag_Emitter_Func*/);
Drag_Emitter_Func(Context);
ExitStatScope(/**Drag_Emitter_Func*/);
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
EnterStatScope(9 /**SolveForcesAndVelocity001_Emitter_Func*/);
SolveForcesAndVelocity001_Emitter_Func(Context);
ExitStatScope(/**SolveForcesAndVelocity001_Emitter_Func*/);
Context.MapUpdate.ScratchModule.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
float Constant304 = 0.5;
EnterStatScope(10 /**ScratchModule_Emitter_Func*/);
ScratchModule_Emitter_Func(Context);
ExitStatScope(/**ScratchModule_Emitter_Func*/);
//End Update Script!
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
// Copyright Epic Games, Inc. All Rights Reserved.
int3 TotalDim = Emitter_BoundaryReader_NumCells * Emitter_BoundaryReader_NumTiles;
float3 GridPos = float3(TotalDim[0] * UVW[0] - 0.5,  TotalDim[1] * UVW[1] - 0.5, TotalDim[2] * UVW[2] - 0.5f);
int3 GridCell = floor(GridPos);
float3 delta = float3( GridPos[0] - GridCell[0], GridPos[1] - GridCell[1], GridPos[2] - GridCell[2]);
// local values
float4 F; 
// bottom face
F[0] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
// bottom value
float BV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// top face
F[0] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_BoundaryReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
// top value
float TV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// interp between bottom and top
return TV * delta.z + BV * (1.-delta.z);
// identify the lower-left-hand corner of the cell
int3 LocalCell = GridCell % Emitter_BoundaryReader_NumCells;
const int3 MaxCell = Emitter_BoundaryReader_NumCells - int3(2,2,2);
// revert to trilinear hardware sampling at the boundary cells.
return Emitter_BoundaryReader_Grid.SampleLevel(Sampler, UVW, MipLevel);
// sample point offset from lower left
float t = 1. + delta.x;
float u = 1. + delta.y;
float v = 1. + delta.z;
float4x4 DataInZ;
float4 minv = 3.402823466e+38;
float4 maxv = -3.402823466e+38;
for (int zk = 0; zk < 4; zk++)
int plane = GridCell[2] + zk -1;
float4x4  DataInY;
for (int yj = 0; yj < 4; yj++)
float4x4 DataInX;
int row = GridCell[1] + yj - 1;
for(int xi = 0; xi < 4; xi++)
int col = GridCell[0] + xi - 1;
DataInX[xi] = Emitter_BoundaryReader_Grid.Load(int4(col, row, plane, MipLevel)); 
minv = min(DataInX[xi], minv);
maxv = max(DataInX[xi], maxv);
// coefficients
float4 Cx0 =   6.f * DataInX[0];
float4 Cx1 = -11.f * DataInX[0] + 18.f * DataInX[1] - 9.f * DataInX[2] + 2.f * DataInX[3];
float4 Cx2 =   6.f * DataInX[0] - 15.f * DataInX[1] +12.f * DataInX[2] - 3.f * DataInX[3];
float4 Cx3 =        -DataInX[0] +  3.f * DataInX[1] - 3.f * DataInX[2] +       DataInX[3];
DataInY[yj] = (1.f/6.f) * (Cx0 + t * ( Cx1 +  t * ( Cx2 + t * Cx3 ) ));
float4 Cy0 =   6.f * DataInY[0];
float4 Cy1 = -11.f * DataInY[0] + 18.f * DataInY[1] - 9.f * DataInY[2] + 2.f * DataInY[3];
float4 Cy2 =   6.f * DataInY[0] - 15.f * DataInY[1] +12.f * DataInY[2] - 3.f * DataInY[3];
float4 Cy3 =        -DataInY[0] +  3.f * DataInY[1] - 3.f * DataInY[2] +       DataInY[3];
DataInZ[zk] = (1.f/6.f) * (Cy0 + u * ( Cy1 +  u * ( Cy2 + u * Cy3 ) ));
float4 Cz0 =   6.f * DataInZ[0];
float4 Cz1 = -11.f * DataInZ[0] + 18.f * DataInZ[1] - 9.f * DataInZ[2] + 2.f * DataInZ[3];
float4 Cz2 =   6.f * DataInZ[0] - 15.f * DataInZ[1] +12.f * DataInZ[2] - 3.f * DataInZ[3];
float4 Cz3 =        -DataInZ[0] +  3.f * DataInZ[1] - 3.f * DataInZ[2] +       DataInZ[3];
float4 TriCubicValue = (1.f/6.f) * (Cz0 + v * ( Cz1 +  v * ( Cz2 + v * Cz3 ) ));
// for the fluid sims, a nice look can be achieved with BlendAmount = 0.25f;
// float BlendAmount = 0.0f;
// return lerp(TriCubicValue, TriLinearValue, BlendAmount);
return  min(max(TriCubicValue, minv), maxv);
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
float4x3 DataInZ;
float3 minv = 3.402823466e+38;
float3 maxv = -3.402823466e+38;
float4x3  DataInY;
float4x3 DataInX;
DataInX[xi] = Emitter_FaceReader_Grid.Load(int4(col, row, plane, MipLevel)); 
float3 Cx0 =   6.f * DataInX[0];
float3 Cx1 = -11.f * DataInX[0] + 18.f * DataInX[1] - 9.f * DataInX[2] + 2.f * DataInX[3];
float3 Cx2 =   6.f * DataInX[0] - 15.f * DataInX[1] +12.f * DataInX[2] - 3.f * DataInX[3];
float3 Cx3 =        -DataInX[0] +  3.f * DataInX[1] - 3.f * DataInX[2] +       DataInX[3];
float3 Cy0 =   6.f * DataInY[0];
float3 Cy1 = -11.f * DataInY[0] + 18.f * DataInY[1] - 9.f * DataInY[2] + 2.f * DataInY[3];
float3 Cy2 =   6.f * DataInY[0] - 15.f * DataInY[1] +12.f * DataInY[2] - 3.f * DataInY[3];
float3 Cy3 =        -DataInY[0] +  3.f * DataInY[1] - 3.f * DataInY[2] +       DataInY[3];
float3 Cz0 =   6.f * DataInZ[0];
float3 Cz1 = -11.f * DataInZ[0] + 18.f * DataInZ[1] - 9.f * DataInZ[2] + 2.f * DataInZ[3];
float3 Cz2 =   6.f * DataInZ[0] - 15.f * DataInZ[1] +12.f * DataInZ[2] - 3.f * DataInZ[3];
float3 Cz3 =        -DataInZ[0] +  3.f * DataInZ[1] - 3.f * DataInZ[2] +       DataInZ[3];
float3 TriCubicValue = (1.f/6.f) * (Cz0 + v * ( Cz1 +  v * ( Cz2 + v * Cz3 ) ));
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
float4x1 DataInZ;
float1 minv = 3.402823466e+38;
float1 maxv = -3.402823466e+38;
float4x1  DataInY;
float4x1 DataInX;
DataInX[xi] = Emitter_PressureReader_Grid.Load(int4(col, row, plane, MipLevel)); 
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
Context.MapSpawn.Particles.Position.x = 0.0f;
Context.MapSpawn.Particles.Position.y = 0.0f;
Context.MapSpawn.Particles.Position.z = 0.0f;
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
Context.MapSpawn.Particles.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.UniqueID = 0;
Context.MapSpawn.Particles.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Velocity.z = 0.0f;
Context.MapSpawn.Particles.Volume = 0.0f;
Context.MapSpawn.DataInstance.Alive=true;
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
Context.MapUpdate.DataInstance.Alive=true;
Context.MapUpdate.Engine.Emitter.ID.ID = 1;
InterpolateParameters(Context);
Context.MapUpdate.Particles = Context.MapSpawn.Particles;
Context.MapUpdate.DataInstance.Alive = true;
Context.MapUpdate.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
const bool bValid = bIsValidInstance && Context.MapUpdate.DataInstance.Alive;
const int WriteIndex = OutputIndex(0, true, bValid);
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
SetupExecIndexAndSpawnInfoForGPU();
InitSpawnVariables(Context);
Context.MapSpawn.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + GLinearThreadId - GSpawnStartInstance;
ConditionalInterpolateParameters(Context);
SimulateMapSpawn(Context);
TransferAttributes(Context);
SimulateMapUpdate(Context);
WriteDataSets(Context);
StoreUpdateVariables(Context, bRunUpdateLogic || bRunSpawnLogic);
jG<û;#
ê∫ÓvJº¨'úW'Ë;ƒ>ù∫åN:‹
» òf;Ô
| enter_stat_scope();
| R[0] = inputdata_float();
| O[185] = inputdata_float();
| O[155] = inputdata_float();
| O[187] = inputdata_float();
| O[168] = inputdata_int32();
| O[327] = inputdata_int32();
| O[263] = inputdata_int32();
| O[15] = inputdata_int32();
| O[162] = inputdata_float();
| O[157] = inputdata_float();
| O[161] = inputdata_float();
| O[125] = inputdata_float();
| R[0] = acquireindex(C[7]);
| O[146] = mul(I[6], I[1]);
| O[155] = cmpeqi(C[0], C[1]);
| O[185] = b2i(O[155]);
| O[161] = cmpeqi_select(O[185], C[2], I[11], I[11]);
| O[327] = cmpeqi_select(O[185], C[2], C[3], C[3]);
| O[260] = cmpeqi_select(O[185], C[2], I[8], I[8]);
| O[185] = cmpeqi_select(O[185], C[2], I[9], I[10]);
| O[155] = b2i(O[155]);
| O[4] = cmpeqi_select(O[155], C[2], I[10], I[10]);
| exit_stat_scope();
| external_func_call(C[4], C[5], C[6], C[7]R[65535]);
| outputdata_int32(0, 48, R[0], O[185]);
| outputdata_int32(0, 73, R[0], C[4]);
| O[147] = mul(I[5], I[0]);
| O[185] = max(O[147], O[146]);
| O[145] = mul(I[7], I[2]);
| O[155] = max(O[145], O[185]);
| O[185] = maxi(O[260], C[6]);
| O[263] = i2f_div1(O[185], O[155]);
| O[185] = div(O[147], O[263]);
| O[185] = floor(O[185]);
| O[185] = cmple_select(O[263], C[8], C[9], O[185]);
| O[168] = f2i(O[185]);
| O[185] = div(O[146], O[263]);
| O[15] = f2i(O[185]);
| O[185] = div(O[145], O[263]);
| O[187] = f2i(O[185]);
| O[185] = i2f_mul(O[15], O[263]);
| O[185] = sub(O[185], O[146]);
| O[185] = abs(O[185]);
| O[155] = cmpgt(O[147], O[145]);
| O[155] = cmpgt_logic_and(O[147], O[146], O[155]);
| O[185] = cmpgt_logic_and(O[185], C[8], O[155]);
| O[155] = addi(O[15], C[6]);
| O[15] = select(O[185], O[155], O[15]);
| O[185] = i2f_mul(O[187], O[263]);
| O[185] = sub(O[185], O[145]);
| O[155] = addi(O[187], C[6]);
| O[187] = select(O[185], O[155], O[187]);
| O[185] = i2f_mul(O[168], O[263]);
| O[185] = sub(O[185], O[147]);
| O[155] = cmpgt(O[146], O[145]);
| O[155] = cmpgt_logic_and(O[146], O[147], O[155]);
| O[155] = addi(O[168], C[6]);
| O[168] = select(O[185], O[155], O[168]);
| O[185] = select(O[185], O[155], O[187]);
| O[155] = i2f_mul(O[168], O[263]);
| O[155] = sub(O[155], O[147]);
| O[155] = abs(O[155]);
| O[187] = cmpgt(O[145], O[146]);
| O[187] = cmpgt_logic_and(O[145], O[147], O[187]);
| O[155] = cmpgt_logic_and(O[155], C[8], O[187]);
| O[187] = addi(O[168], C[6]);
| O[168] = select(O[155], O[187], O[168]);
| O[155] = i2f_mul(O[15], O[263]);
| O[155] = sub(O[155], O[146]);
| O[187] = addi(O[15], C[6]);
| O[187] = select(O[155], O[187], O[15]);
| O[132] = i2f_mul(O[168], O[263]);
| O[155] = i2f_mul(O[187], O[263]);
| O[153] = i2f_mul(O[185], O[263]);
| O[168] = i2f(O[168]);
| O[187] = i2f(O[187]);
| O[185] = i2f(O[185]);
| O[263] = f2i(O[168]);
| O[15] = f2i(O[187]);
| O[162] = f2i(O[185]);
| external_func_call(C[10], O[263], O[15], O[162]R[65535]);
| O[159] = div(O[132], O[168]);
| O[125] = div(O[155], O[187]);
| O[178] = div(O[153], O[185]);
| O[148] = f2i(O[168]);
| O[187] = f2i(O[187]);
| outputdata_int32(0, 2, R[0], C[2]);
| outputdata_int32(0, 3, R[0], C[2]);
| outputdata_int32(0, 16, R[0], C[2]);
| outputdata_int32(0, 17, R[0], C[2]);
| outputdata_int32(0, 18, R[0], C[2]);
| outputdata_int32(0, 19, R[0], C[2]);
| outputdata_int32(0, 26, R[0], O[187]);
| outputdata_int32(0, 46, R[0], C[2]);
| outputdata_int32(0, 53, R[0], C[2]);
| outputdata_int32(0, 54, R[0], C[2]);
| outputdata_int32(0, 71, R[0], C[2]);
| outputdata_int32(0, 72, R[0], C[2]);
| outputdata_int32(0, 81, R[0], C[2]);
| outputdata_int32(0, 82, R[0], C[2]);
| outputdata_int32(0, 83, R[0], C[2]);
| outputdata_int32(0, 84, R[0], C[2]);
| outputdata_int32(0, 85, R[0], C[2]);
| outputdata_int32(0, 86, R[0], C[2]);
| outputdata_int32(0, 87, R[0], C[2]);
| outputdata_int32(0, 88, R[0], C[2]);
| outputdata_int32(0, 90, R[0], C[2]);
| outputdata_int32(0, 91, R[0], C[2]);
| outputdata_int32(0, 92, R[0], C[2]);
| O[163] = f2i(O[185]);
| external_func_call(C[10]O[168], O[187], O[185]);
| external_func_call(C[11], O[263], O[15], O[162]R[65535]);
| O[160] = div(O[147], O[168]);
| O[15] = div(O[146], O[187]);
| O[162] = div(O[145], O[185]);
| O[158] = f2i(O[187]);
| O[292] = f2i(O[185]);
| external_func_call(C[10]O[168], O[185], O[187]);
| O[157] = i2f(O[168]);
| O[168] = i2f(O[187]);
| O[187] = f2i(O[157]);
| O[53] = f2i(O[185]);
| O[288] = f2i(O[168]);
| external_func_call(C[12], O[187], O[53], O[288]R[65535]);
| O[187] = div(O[147], O[157]);
| O[53] = div(O[146], O[185]);
| outputdata_float(0, 148, R[0], O[53]);
| outputdata_int32(0, 0, R[0], C[29]);
| O[53] = div(O[145], O[168]);
| outputdata_float(0, 0, R[0], C[30]);
| outputdata_float(0, 1, R[0], C[30]);
| outputdata_float(0, 2, R[0], C[30]);
| outputdata_float(0, 4, R[0], C[30]);
| outputdata_float(0, 5, R[0], C[30]);
| outputdata_float(0, 6, R[0], C[30]);
| outputdata_float(0, 7, R[0], C[30]);
| outputdata_float(0, 8, R[0], C[30]);
| outputdata_float(0, 9, R[0], C[30]);
| outputdata_float(0, 10, R[0], C[30]);
| outputdata_float(0, 11, R[0], C[30]);
| outputdata_float(0, 12, R[0], C[30]);
| outputdata_float(0, 13, R[0], C[30]);
| outputdata_float(0, 14, R[0], C[30]);
| outputdata_float(0, 15, R[0], C[30]);
| outputdata_float(0, 16, R[0], C[30]);
| outputdata_float(0, 17, R[0], C[30]);
| outputdata_float(0, 18, R[0], C[30]);
| outputdata_float(0, 19, R[0], C[30]);
| outputdata_float(0, 20, R[0], C[30]);
| outputdata_float(0, 21, R[0], C[30]);
| outputdata_float(0, 22, R[0], C[30]);
| outputdata_float(0, 23, R[0], C[30]);
| outputdata_float(0, 24, R[0], C[30]);
| outputdata_float(0, 25, R[0], C[30]);
| outputdata_float(0, 26, R[0], C[30]);
| outputdata_float(0, 27, R[0], C[30]);
| outputdata_float(0, 28, R[0], C[30]);
| outputdata_float(0, 29, R[0], C[30]);
| outputdata_float(0, 30, R[0], C[30]);
| outputdata_float(0, 31, R[0], C[30]);
| outputdata_float(0, 32, R[0], C[30]);
| outputdata_float(0, 33, R[0], C[30]);
| outputdata_float(0, 34, R[0], C[30]);
| outputdata_float(0, 35, R[0], C[30]);
| outputdata_float(0, 36, R[0], C[30]);
| outputdata_float(0, 37, R[0], C[30]);
| outputdata_float(0, 38, R[0], C[30]);
| outputdata_float(0, 39, R[0], C[30]);
| outputdata_float(0, 40, R[0], C[30]);
| outputdata_float(0, 41, R[0], C[30]);
| outputdata_float(0, 42, R[0], C[30]);
| outputdata_float(0, 43, R[0], C[30]);
| outputdata_float(0, 44, R[0], C[30]);
| outputdata_float(0, 45, R[0], C[30]);
| outputdata_float(0, 46, R[0], C[30]);
| outputdata_float(0, 47, R[0], C[30]);
| outputdata_float(0, 49, R[0], C[30]);
| outputdata_float(0, 50, R[0], C[30]);
| outputdata_float(0, 51, R[0], C[30]);
| outputdata_float(0, 52, R[0], C[30]);
| outputdata_float(0, 53, R[0], C[30]);
| outputdata_float(0, 54, R[0], C[30]);
| outputdata_float(0, 55, R[0], C[30]);
| outputdata_float(0, 56, R[0], C[30]);
| outputdata_float(0, 57, R[0], C[30]);
| outputdata_float(0, 58, R[0], C[30]);
| outputdata_float(0, 59, R[0], C[30]);
| outputdata_float(0, 60, R[0], C[30]);
| outputdata_float(0, 61, R[0], C[30]);
| outputdata_float(0, 62, R[0], C[30]);
| outputdata_float(0, 63, R[0], C[30]);
| outputdata_float(0, 64, R[0], C[30]);
| outputdata_float(0, 65, R[0], C[30]);
| outputdata_float(0, 66, R[0], C[30]);
| outputdata_float(0, 67, R[0], C[30]);
| outputdata_float(0, 68, R[0], C[30]);
| outputdata_float(0, 69, R[0], C[30]);
| outputdata_float(0, 70, R[0], C[30]);
| outputdata_float(0, 71, R[0], C[30]);
| outputdata_float(0, 72, R[0], C[30]);
| outputdata_float(0, 73, R[0], C[30]);
| outputdata_float(0, 74, R[0], C[30]);
| outputdata_float(0, 75, R[0], C[30]);
| outputdata_float(0, 76, R[0], C[30]);
| outputdata_float(0, 77, R[0], C[30]);
| outputdata_float(0, 78, R[0], C[30]);
| outputdata_float(0, 79, R[0], C[30]);
| outputdata_float(0, 80, R[0], C[30]);
| outputdata_float(0, 81, R[0], C[30]);
| outputdata_float(0, 82, R[0], C[30]);
| outputdata_float(0, 83, R[0], C[30]);
| outputdata_float(0, 84, R[0], C[30]);
| outputdata_float(0, 85, R[0], C[30]);
| outputdata_float(0, 86, R[0], C[30]);
| outputdata_float(0, 87, R[0], C[30]);
| outputdata_float(0, 88, R[0], C[30]);
| outputdata_float(0, 89, R[0], C[30]);
| outputdata_float(0, 90, R[0], C[30]);
| outputdata_float(0, 91, R[0], C[30]);
| outputdata_float(0, 92, R[0], C[30]);
| outputdata_float(0, 93, R[0], C[30]);
| outputdata_float(0, 94, R[0], C[30]);
| outputdata_float(0, 95, R[0], C[30]);
| outputdata_float(0, 96, R[0], C[30]);
| outputdata_float(0, 97, R[0], C[30]);
| outputdata_float(0, 98, R[0], C[30]);
| outputdata_float(0, 99, R[0], C[30]);
| outputdata_float(0, 100, R[0], C[30]);
| outputdata_float(0, 101, R[0], C[30]);
| outputdata_float(0, 102, R[0], C[30]);
| outputdata_float(0, 103, R[0], C[30]);
| outputdata_float(0, 104, R[0], C[30]);
| outputdata_float(0, 105, R[0], C[30]);
| outputdata_float(0, 106, R[0], C[30]);
| outputdata_float(0, 107, R[0], C[30]);
| outputdata_float(0, 121, R[0], C[30]);
| outputdata_float(0, 122, R[0], C[30]);
| outputdata_float(0, 149, R[0], O[53]);
| outputdata_float(0, 165, R[0], C[30]);
| outputdata_float(0, 166, R[0], C[30]);
| outputdata_float(0, 167, R[0], C[30]);
| outputdata_float(0, 168, R[0], C[30]);
| outputdata_float(0, 169, R[0], C[30]);
| outputdata_float(0, 170, R[0], C[30]);
| outputdata_float(0, 171, R[0], C[30]);
| outputdata_float(0, 172, R[0], C[30]);
| outputdata_float(0, 173, R[0], C[30]);
| outputdata_float(0, 175, R[0], C[30]);
| outputdata_float(0, 176, R[0], C[30]);
| outputdata_float(0, 177, R[0], C[30]);
| outputdata_float(0, 178, R[0], C[30]);
| outputdata_float(0, 179, R[0], C[30]);
| outputdata_float(0, 180, R[0], C[30]);
| outputdata_float(0, 181, R[0], C[30]);
| outputdata_float(0, 182, R[0], C[30]);
| outputdata_float(0, 183, R[0], C[30]);
| outputdata_float(0, 184, R[0], C[30]);
| outputdata_float(0, 185, R[0], C[30]);
| outputdata_float(0, 186, R[0], C[30]);
| outputdata_float(0, 187, R[0], C[30]);
| outputdata_float(0, 188, R[0], C[30]);
| outputdata_float(0, 189, R[0], C[30]);
| outputdata_float(0, 190, R[0], C[30]);
| outputdata_float(0, 191, R[0], C[30]);
| outputdata_float(0, 192, R[0], C[30]);
| outputdata_float(0, 193, R[0], C[30]);
| outputdata_float(0, 194, R[0], C[30]);
| outputdata_float(0, 195, R[0], C[30]);
| outputdata_float(0, 196, R[0], C[30]);
| outputdata_float(0, 197, R[0], C[30]);
| outputdata_float(0, 198, R[0], C[30]);
| outputdata_float(0, 199, R[0], C[30]);
| outputdata_float(0, 200, R[0], C[30]);
| outputdata_float(0, 201, R[0], C[30]);
| outputdata_float(0, 202, R[0], C[30]);
| outputdata_float(0, 203, R[0], C[30]);
| outputdata_float(0, 204, R[0], C[30]);
| outputdata_float(0, 205, R[0], C[30]);
| outputdata_float(0, 206, R[0], C[30]);
| outputdata_float(0, 207, R[0], C[30]);
| outputdata_float(0, 208, R[0], C[30]);
| outputdata_float(0, 209, R[0], C[30]);
| outputdata_float(0, 210, R[0], C[30]);
| outputdata_float(0, 211, R[0], C[30]);
| outputdata_float(0, 212, R[0], C[30]);
| outputdata_float(0, 214, R[0], C[30]);
| outputdata_float(0, 215, R[0], C[30]);
| outputdata_float(0, 216, R[0], C[30]);
| outputdata_float(0, 217, R[0], C[30]);
| outputdata_float(0, 218, R[0], C[30]);
| outputdata_float(0, 219, R[0], C[30]);
| outputdata_float(0, 220, R[0], C[30]);
| outputdata_float(0, 221, R[0], C[30]);
| outputdata_float(0, 222, R[0], C[30]);
| outputdata_float(0, 223, R[0], C[30]);
| outputdata_float(0, 224, R[0], C[30]);
| outputdata_float(0, 225, R[0], C[30]);
| outputdata_float(0, 226, R[0], C[30]);
| outputdata_float(0, 227, R[0], C[30]);
| outputdata_float(0, 255, R[0], C[30]);
| outputdata_float(0, 256, R[0], C[30]);
| outputdata_float(0, 257, R[0], C[30]);
| outputdata_float(0, 258, R[0], C[30]);
| outputdata_float(0, 259, R[0], C[30]);
| outputdata_float(0, 261, R[0], C[30]);
| outputdata_float(0, 262, R[0], C[30]);
| outputdata_float(0, 263, R[0], C[30]);
| outputdata_float(0, 264, R[0], C[30]);
| outputdata_float(0, 265, R[0], C[30]);
| outputdata_float(0, 266, R[0], C[30]);
| outputdata_float(0, 267, R[0], C[30]);
| outputdata_float(0, 268, R[0], C[30]);
| outputdata_float(0, 269, R[0], C[30]);
| outputdata_float(0, 270, R[0], C[30]);
| outputdata_float(0, 271, R[0], C[30]);
| outputdata_float(0, 272, R[0], C[30]);
| outputdata_float(0, 273, R[0], C[30]);
| outputdata_float(0, 274, R[0], C[30]);
| outputdata_float(0, 275, R[0], C[30]);
| outputdata_float(0, 276, R[0], C[30]);
| outputdata_float(0, 277, R[0], C[30]);
| outputdata_float(0, 278, R[0], C[30]);
| outputdata_float(0, 279, R[0], C[30]);
| outputdata_float(0, 280, R[0], C[30]);
| outputdata_float(0, 281, R[0], C[30]);
| outputdata_float(0, 282, R[0], C[30]);
| outputdata_float(0, 283, R[0], C[30]);
| outputdata_float(0, 284, R[0], C[30]);
| outputdata_float(0, 285, R[0], C[30]);
| outputdata_float(0, 286, R[0], C[30]);
| outputdata_float(0, 287, R[0], C[30]);
| outputdata_float(0, 288, R[0], C[30]);
| outputdata_float(0, 289, R[0], C[30]);
| outputdata_float(0, 290, R[0], C[30]);
| outputdata_float(0, 291, R[0], C[30]);
| outputdata_float(0, 292, R[0], C[30]);
| outputdata_float(0, 293, R[0], C[30]);
| outputdata_float(0, 294, R[0], C[30]);
| outputdata_float(0, 295, R[0], C[30]);
| outputdata_float(0, 296, R[0], C[30]);
| outputdata_float(0, 297, R[0], C[30]);
| outputdata_float(0, 298, R[0], C[30]);
| outputdata_float(0, 299, R[0], C[30]);
| outputdata_float(0, 300, R[0], C[30]);
| outputdata_float(0, 304, R[0], C[30]);
| outputdata_float(0, 305, R[0], C[30]);
| outputdata_float(0, 306, R[0], C[30]);
| outputdata_float(0, 307, R[0], C[30]);
| outputdata_float(0, 308, R[0], C[30]);
| outputdata_float(0, 309, R[0], C[30]);
| outputdata_float(0, 310, R[0], C[30]);
| outputdata_float(0, 311, R[0], C[30]);
| outputdata_float(0, 312, R[0], C[30]);
| outputdata_float(0, 313, R[0], C[30]);
| outputdata_float(0, 314, R[0], C[30]);
| outputdata_float(0, 315, R[0], C[30]);
| outputdata_float(0, 316, R[0], C[30]);
| outputdata_float(0, 317, R[0], C[30]);
| outputdata_float(0, 318, R[0], C[30]);
| outputdata_float(0, 319, R[0], C[30]);
| outputdata_float(0, 320, R[0], C[30]);
| outputdata_float(0, 321, R[0], C[30]);
| outputdata_float(0, 322, R[0], C[30]);
| outputdata_float(0, 323, R[0], C[30]);
| outputdata_float(0, 324, R[0], C[30]);
| outputdata_float(0, 325, R[0], C[30]);
| outputdata_float(0, 326, R[0], C[30]);
| outputdata_float(0, 327, R[0], C[30]);
| outputdata_float(0, 328, R[0], C[30]);
| outputdata_float(0, 329, R[0], C[30]);
| outputdata_float(0, 330, R[0], C[30]);
| outputdata_float(0, 331, R[0], C[30]);
| outputdata_float(0, 332, R[0], C[30]);
| outputdata_float(0, 333, R[0], C[30]);
| outputdata_float(0, 334, R[0], C[30]);
| outputdata_float(0, 335, R[0], C[30]);
| outputdata_float(0, 336, R[0], C[30]);
| outputdata_float(0, 337, R[0], C[30]);
| outputdata_float(0, 338, R[0], C[30]);
| outputdata_float(0, 339, R[0], C[30]);
| outputdata_float(0, 340, R[0], C[30]);
| outputdata_float(0, 341, R[0], C[30]);
| outputdata_float(0, 342, R[0], C[30]);
| outputdata_float(0, 343, R[0], C[30]);
| outputdata_float(0, 344, R[0], C[30]);
| outputdata_float(0, 345, R[0], C[30]);
| outputdata_float(0, 346, R[0], C[30]);
| outputdata_float(0, 347, R[0], C[30]);
| outputdata_float(0, 348, R[0], C[30]);
| outputdata_float(0, 349, R[0], C[30]);
| outputdata_float(0, 350, R[0], C[30]);
| outputdata_float(0, 351, R[0], C[30]);
| outputdata_float(0, 352, R[0], C[30]);
| outputdata_float(0, 353, R[0], C[30]);
| outputdata_float(0, 354, R[0], C[30]);
| outputdata_float(0, 355, R[0], C[30]);
| outputdata_float(0, 356, R[0], C[30]);
| outputdata_float(0, 357, R[0], C[30]);
| outputdata_float(0, 359, R[0], C[30]);
| outputdata_float(0, 360, R[0], C[30]);
| outputdata_float(0, 361, R[0], C[30]);
| outputdata_float(0, 362, R[0], C[30]);
| outputdata_float(0, 363, R[0], C[30]);
| outputdata_float(0, 364, R[0], C[30]);
| outputdata_float(0, 365, R[0], C[30]);
| outputdata_float(0, 366, R[0], C[30]);
| outputdata_float(0, 367, R[0], C[30]);
| outputdata_float(0, 368, R[0], C[30]);
| outputdata_float(0, 369, R[0], C[30]);
| outputdata_float(0, 370, R[0], C[30]);
| outputdata_float(0, 371, R[0], C[30]);
| outputdata_float(0, 372, R[0], C[30]);
| outputdata_float(0, 373, R[0], C[30]);
| outputdata_float(0, 374, R[0], C[30]);
| outputdata_float(0, 376, R[0], C[30]);
| outputdata_float(0, 377, R[0], C[30]);
| outputdata_float(0, 378, R[0], C[30]);
| outputdata_float(0, 379, R[0], C[30]);
| outputdata_float(0, 380, R[0], C[30]);
| outputdata_float(0, 381, R[0], C[30]);
| outputdata_float(0, 382, R[0], C[30]);
| outputdata_float(0, 383, R[0], C[30]);
| outputdata_float(0, 384, R[0], C[30]);
| outputdata_float(0, 385, R[0], C[30]);
| outputdata_float(0, 386, R[0], C[30]);
| outputdata_float(0, 387, R[0], C[30]);
| outputdata_float(0, 388, R[0], C[30]);
| outputdata_float(0, 389, R[0], C[30]);
| outputdata_float(0, 390, R[0], C[30]);
| outputdata_float(0, 391, R[0], C[30]);
| outputdata_float(0, 392, R[0], C[30]);
| outputdata_float(0, 393, R[0], C[30]);
| outputdata_float(0, 394, R[0], C[30]);
| outputdata_float(0, 396, R[0], C[30]);
| outputdata_float(0, 397, R[0], C[30]);
| outputdata_float(0, 398, R[0], C[30]);
| outputdata_float(0, 399, R[0], C[30]);
| outputdata_float(0, 401, R[0], C[30]);
| outputdata_float(0, 402, R[0], C[30]);
| outputdata_float(0, 403, R[0], C[30]);
| outputdata_float(0, 404, R[0], C[30]);
| outputdata_float(0, 406, R[0], C[30]);
| outputdata_float(0, 407, R[0], C[30]);
| outputdata_float(0, 408, R[0], C[30]);
| outputdata_float(0, 409, R[0], C[30]);
| outputdata_float(0, 411, R[0], C[30]);
| outputdata_float(0, 412, R[0], C[30]);
| outputdata_float(0, 413, R[0], C[30]);
| outputdata_float(0, 414, R[0], C[30]);
| outputdata_float(0, 415, R[0], C[30]);
| outputdata_float(0, 416, R[0], C[30]);
| outputdata_float(0, 417, R[0], C[30]);
| outputdata_float(0, 418, R[0], C[30]);
| outputdata_float(0, 419, R[0], C[30]);
| outputdata_float(0, 420, R[0], C[30]);
| outputdata_float(0, 421, R[0], C[30]);
| outputdata_float(0, 422, R[0], C[30]);
| outputdata_float(0, 423, R[0], C[30]);
| outputdata_float(0, 424, R[0], C[30]);
| outputdata_float(0, 425, R[0], C[30]);
| outputdata_float(0, 426, R[0], C[30]);
| outputdata_float(0, 427, R[0], C[30]);
| outputdata_float(0, 428, R[0], C[30]);
| outputdata_float(0, 429, R[0], C[30]);
| outputdata_float(0, 430, R[0], C[30]);
| outputdata_float(0, 431, R[0], C[30]);
| outputdata_float(0, 432, R[0], C[30]);
| outputdata_float(0, 433, R[0], C[30]);
| outputdata_float(0, 434, R[0], C[30]);
| outputdata_float(0, 435, R[0], C[30]);
| outputdata_float(0, 436, R[0], C[30]);
| outputdata_float(0, 437, R[0], C[30]);
| outputdata_float(0, 438, R[0], C[30]);
| outputdata_float(0, 439, R[0], C[30]);
| outputdata_float(0, 440, R[0], C[30]);
| outputdata_float(0, 441, R[0], C[30]);
| outputdata_float(0, 442, R[0], C[30]);
| outputdata_float(0, 444, R[0], C[30]);
| outputdata_float(0, 445, R[0], C[30]);
| outputdata_float(0, 446, R[0], C[30]);
| outputdata_float(0, 447, R[0], C[30]);
| outputdata_float(0, 449, R[0], C[30]);
| outputdata_float(0, 450, R[0], C[30]);
| outputdata_float(0, 451, R[0], C[30]);
| outputdata_float(0, 452, R[0], C[30]);
| outputdata_float(0, 454, R[0], C[30]);
| outputdata_float(0, 455, R[0], C[30]);
| outputdata_float(0, 456, R[0], C[30]);
| outputdata_float(0, 457, R[0], C[30]);
| outputdata_float(0, 460, R[0], C[30]);
| outputdata_float(0, 461, R[0], C[30]);
| outputdata_float(0, 462, R[0], C[30]);
| outputdata_float(0, 463, R[0], C[30]);
| outputdata_float(0, 465, R[0], C[30]);
| outputdata_float(0, 466, R[0], C[30]);
| outputdata_float(0, 467, R[0], C[30]);
| outputdata_float(0, 468, R[0], C[30]);
| outputdata_float(0, 470, R[0], C[30]);
| outputdata_float(0, 471, R[0], C[30]);
| outputdata_float(0, 472, R[0], C[30]);
| outputdata_float(0, 473, R[0], C[30]);
| outputdata_float(0, 475, R[0], C[30]);
| outputdata_float(0, 476, R[0], C[30]);
| outputdata_float(0, 477, R[0], C[30]);
| outputdata_float(0, 478, R[0], C[30]);
| outputdata_float(0, 479, R[0], C[30]);
| outputdata_float(0, 480, R[0], C[30]);
| outputdata_float(0, 481, R[0], C[30]);
| outputdata_float(0, 482, R[0], C[30]);
| outputdata_float(0, 483, R[0], C[30]);
| outputdata_float(0, 484, R[0], C[30]);
| outputdata_float(0, 485, R[0], C[30]);
| outputdata_float(0, 486, R[0], C[30]);
| outputdata_float(0, 487, R[0], C[30]);
| outputdata_float(0, 488, R[0], C[30]);
| outputdata_float(0, 489, R[0], C[30]);
| outputdata_float(0, 490, R[0], C[30]);
| outputdata_float(0, 492, R[0], C[30]);
| outputdata_float(0, 493, R[0], C[30]);
| outputdata_float(0, 494, R[0], C[30]);
| outputdata_float(0, 495, R[0], C[30]);
| outputdata_float(0, 497, R[0], C[30]);
| outputdata_float(0, 498, R[0], C[30]);
| outputdata_float(0, 499, R[0], C[30]);
| outputdata_float(0, 500, R[0], C[30]);
| outputdata_float(0, 502, R[0], C[30]);
| outputdata_float(0, 503, R[0], C[30]);
| outputdata_float(0, 504, R[0], C[30]);
| outputdata_float(0, 505, R[0], C[30]);
| outputdata_float(0, 507, R[0], C[30]);
| outputdata_float(0, 508, R[0], C[30]);
| outputdata_float(0, 509, R[0], C[30]);
| outputdata_float(0, 510, R[0], C[30]);
| outputdata_float(0, 511, R[0], C[30]);
| outputdata_float(0, 512, R[0], C[30]);
| outputdata_float(0, 513, R[0], C[30]);
| outputdata_float(0, 514, R[0], C[30]);
| outputdata_float(0, 515, R[0], C[30]);
| outputdata_float(0, 517, R[0], C[30]);
| outputdata_float(0, 518, R[0], C[30]);
| outputdata_float(0, 519, R[0], C[30]);
| outputdata_float(0, 520, R[0], C[30]);
| outputdata_float(0, 521, R[0], C[30]);
| outputdata_float(0, 522, R[0], C[30]);
| outputdata_float(0, 523, R[0], C[30]);
| outputdata_float(0, 524, R[0], C[30]);
| outputdata_float(0, 525, R[0], C[30]);
| outputdata_float(0, 526, R[0], C[30]);
| outputdata_float(0, 527, R[0], C[30]);
| outputdata_float(0, 528, R[0], C[30]);
| outputdata_float(0, 529, R[0], C[30]);
| outputdata_float(0, 530, R[0], C[30]);
| outputdata_float(0, 531, R[0], C[30]);
| outputdata_float(0, 532, R[0], C[30]);
| outputdata_float(0, 533, R[0], C[30]);
| outputdata_float(0, 534, R[0], C[30]);
| outputdata_float(0, 535, R[0], C[30]);
| outputdata_float(0, 536, R[0], C[30]);
| outputdata_float(0, 537, R[0], C[30]);
| outputdata_float(0, 538, R[0], C[30]);
| outputdata_float(0, 539, R[0], C[30]);
| outputdata_float(0, 540, R[0], C[30]);
| outputdata_float(0, 541, R[0], C[30]);
| outputdata_float(0, 542, R[0], C[30]);
| outputdata_float(0, 543, R[0], C[30]);
| outputdata_float(0, 544, R[0], C[30]);
| outputdata_float(0, 545, R[0], C[30]);
| outputdata_float(0, 546, R[0], C[30]);
| outputdata_float(0, 547, R[0], C[30]);
| outputdata_float(0, 548, R[0], C[30]);
| outputdata_float(0, 549, R[0], C[30]);
| outputdata_float(0, 550, R[0], C[30]);
| outputdata_float(0, 551, R[0], C[30]);
| outputdata_float(0, 552, R[0], C[30]);
| outputdata_float(0, 553, R[0], C[30]);
| outputdata_float(0, 554, R[0], C[30]);
| outputdata_float(0, 555, R[0], C[30]);
| outputdata_float(0, 556, R[0], C[30]);
| outputdata_float(0, 557, R[0], C[30]);
| outputdata_float(0, 558, R[0], C[30]);
| outputdata_float(0, 559, R[0], C[30]);
| outputdata_float(0, 560, R[0], C[30]);
| outputdata_float(0, 561, R[0], C[30]);
| outputdata_float(0, 562, R[0], C[30]);
| outputdata_float(0, 563, R[0], C[30]);
| outputdata_float(0, 564, R[0], C[30]);
| outputdata_float(0, 565, R[0], C[30]);
| outputdata_float(0, 566, R[0], C[30]);
| outputdata_float(0, 567, R[0], C[30]);
| outputdata_float(0, 568, R[0], C[30]);
| outputdata_float(0, 569, R[0], C[30]);
| outputdata_float(0, 573, R[0], C[30]);
| outputdata_float(0, 574, R[0], C[30]);
| outputdata_float(0, 575, R[0], C[30]);
| outputdata_float(0, 576, R[0], C[30]);
| outputdata_float(0, 577, R[0], C[30]);
| outputdata_float(0, 578, R[0], C[30]);
| outputdata_float(0, 579, R[0], C[30]);
| outputdata_float(0, 580, R[0], C[30]);
| outputdata_float(0, 581, R[0], C[30]);
| outputdata_float(0, 582, R[0], C[30]);
| outputdata_float(0, 583, R[0], C[30]);
| outputdata_float(0, 584, R[0], C[30]);
| outputdata_float(0, 585, R[0], C[30]);
| outputdata_float(0, 586, R[0], C[30]);
| outputdata_float(0, 587, R[0], C[30]);
| outputdata_float(0, 588, R[0], C[30]);
| outputdata_float(0, 589, R[0], C[30]);
| outputdata_float(0, 590, R[0], C[30]);
| outputdata_float(0, 591, R[0], C[30]);
| outputdata_float(0, 592, R[0], C[30]);
| outputdata_float(0, 593, R[0], C[30]);
| outputdata_float(0, 594, R[0], C[30]);
| outputdata_float(0, 595, R[0], C[30]);
| outputdata_float(0, 596, R[0], C[30]);
| outputdata_float(0, 597, R[0], C[30]);
| outputdata_float(0, 598, R[0], C[30]);
| outputdata_float(0, 599, R[0], C[30]);
| outputdata_float(0, 600, R[0], C[30]);
| outputdata_float(0, 601, R[0], C[30]);
| outputdata_float(0, 602, R[0], C[30]);
| outputdata_float(0, 603, R[0], C[30]);
| outputdata_float(0, 604, R[0], C[30]);
| outputdata_float(0, 605, R[0], C[30]);
| outputdata_float(0, 606, R[0], C[30]);
| outputdata_float(0, 607, R[0], C[30]);
| outputdata_float(0, 608, R[0], C[30]);
| outputdata_float(0, 609, R[0], C[30]);
| outputdata_float(0, 610, R[0], C[30]);
| outputdata_float(0, 611, R[0], C[30]);
| outputdata_float(0, 612, R[0], C[30]);
| outputdata_float(0, 613, R[0], C[30]);
| outputdata_float(0, 614, R[0], C[30]);
| outputdata_float(0, 615, R[0], C[30]);
| outputdata_float(0, 616, R[0], C[30]);
| outputdata_float(0, 617, R[0], C[30]);
| outputdata_float(0, 618, R[0], C[30]);
| outputdata_float(0, 619, R[0], C[30]);
| outputdata_float(0, 620, R[0], C[30]);
| O[157] = f2i(O[157]);
| outputdata_int32(0, 1, R[0], C[31]);
| outputdata_int32(0, 7, R[0], C[31]);
| outputdata_int32(0, 8, R[0], C[31]);
| outputdata_int32(0, 9, R[0], C[31]);
| outputdata_int32(0, 10, R[0], C[31]);
| outputdata_int32(0, 11, R[0], C[31]);
| outputdata_int32(0, 15, R[0], C[31]);
| outputdata_int32(0, 37, R[0], O[157]);
| O[185] = f2i(O[185]);
| O[157] = f2i(O[168]);
| external_func_call(C[10]O[288], O[53], O[168]);
| O[288] = i2f(O[288]);
| O[53] = i2f(O[53]);
| O[293] = f2i(O[288]);
| O[205] = f2i(O[53]);
| O[206] = f2i(O[168]);
| external_func_call(C[1], O[293], O[205], O[206]R[65535]);
| O[293] = div(O[147], O[288]);
| outputdata_float(0, 114, R[0], C[33]);
| outputdata_float(0, 135, R[0], O[293]);
| O[293] = div(O[146], O[53]);
| outputdata_float(0, 136, R[0], O[293]);
| outputdata_int32(0, 51, R[0], C[35]);
| outputdata_int32(0, 52, R[0], C[35]);
| O[293] = div(O[145], O[168]);
| outputdata_float(0, 137, R[0], O[293]);
| outputdata_float(0, 358, R[0], C[36]);
| O[288] = f2i(O[288]);
| outputdata_int32(0, 31, R[0], O[288]);
| O[53] = f2i(O[53]);
| outputdata_float(0, 115, R[0], C[34]);
| outputdata_int32(0, 32, R[0], O[53]);
| O[168] = f2i(O[168]);
| external_func_call(C[10]O[293], O[288], O[53]);
| O[293] = i2f(O[293]);
| O[205] = f2i(O[293]);
| O[206] = f2i(O[288]);
| O[151] = f2i(O[53]);
| external_func_call(C[13], O[205], O[206], O[151]R[65535]);
| outputdata_float(0, 123, R[0], O[159]);
| O[159] = div(O[147], O[293]);
| outputdata_float(0, 153, R[0], O[159]);
| O[159] = div(O[146], O[288]);
| outputdata_float(0, 154, R[0], O[159]);
| O[159] = div(O[145], O[53]);
| outputdata_float(0, 155, R[0], O[159]);
| O[293] = f2i(O[293]);
| outputdata_int32(0, 40, R[0], O[293]);
| outputdata_int32(0, 41, R[0], O[288]);
| outputdata_float(0, 108, R[0], C[32]);
| outputdata_float(0, 109, R[0], C[32]);
| outputdata_float(0, 110, R[0], C[32]);
| outputdata_float(0, 111, R[0], C[32]);
| outputdata_int32(0, 42, R[0], O[53]);
| O[159] = f2i(O[293]);
| O[205] = f2i(O[288]);
| O[206] = f2i(O[53]);
| external_func_call(C[14], O[159], O[205], O[206]R[65535]);
| outputdata_int32(0, 30, R[0], O[292]);
| O[292] = div(O[147], O[293]);
| outputdata_float(0, 159, R[0], O[292]);
| O[292] = div(O[146], O[288]);
| outputdata_float(0, 160, R[0], O[292]);
| O[292] = div(O[145], O[53]);
| outputdata_float(0, 161, R[0], O[292]);
| outputdata_int32(0, 43, R[0], O[293]);
| outputdata_int32(0, 44, R[0], O[288]);
| outputdata_int32(0, 45, R[0], O[53]);
| external_func_call(C[10]O[53]);
| outputdata_int32(0, 80, R[0], O[53]);
| external_func_call(C[15]O[53]);
| outputdata_int32(0, 75, R[0], O[53]);
| outputdata_int32(0, 27, R[0], O[163]);
| outputdata_int32(0, 79, R[0], O[53]);
| external_func_call(C[11]O[53]);
| outputdata_int32(0, 78, R[0], O[53]);
| outputdata_float(0, 128, R[0], O[153]);
| outputdata_int32(0, 74, R[0], O[53]);
| external_func_call(C[1]O[53]);
| outputdata_int32(0, 76, R[0], O[53]);
| external_func_call(C[12]O[53]);
| outputdata_int32(0, 77, R[0], O[53]);
| external_func_call(C[10]O[163], O[153], O[53]);
| O[163] = i2f_mul(O[163], O[327]);
| O[288] = max(O[163], C[9]);
| O[153] = i2f_mul(O[153], O[327]);
| O[163] = max(O[153], C[9]);
| O[53] = i2f_mul(O[53], O[327]);
| O[153] = max(O[53], C[9]);
| O[53] = f2i(O[288]);
| O[293] = f2i(O[163]);
| O[292] = f2i(O[153]);
| external_func_call(C[16], O[53], O[293], O[292]R[65535]);
| O[53] = div(O[147], O[288]);
| O[293] = div(O[146], O[163]);
| outputdata_float(0, 230, R[0], O[293]);
| O[293] = div(O[145], O[153]);
| outputdata_float(0, 231, R[0], O[293]);
| outputdata_int32(0, 59, R[0], O[288]);
| O[163] = f2i(O[163]);
| outputdata_int32(0, 60, R[0], O[163]);
| O[153] = f2i(O[153]);
| outputdata_int32(0, 61, R[0], O[153]);
| outputdata_int32(0, 20, R[0], C[5]);
| outputdata_int32(0, 49, R[0], O[4]);
| outputdata_int32(0, 58, R[0], C[5]);
| O[4] = addi(C[5], C[6]);
| O[4] = i2f_mul(O[4], O[53]);
| outputdata_float(0, 228, R[0], O[53]);
| outputdata_float(0, 229, R[0], O[53]);
| outputdata_float(0, 260, R[0], O[53]);
| external_func_call(C[16], O[4]R[65535]);
| outputdata_float(0, 124, R[0], O[125]);
| external_func_call(C[10]O[53], O[4], O[125]);
| O[153] = max(O[327], C[17]);
| outputdata_float(0, 126, R[0], O[132]);
| O[53] = i2f_mul(O[53], O[153]);
| O[4] = i2f_mul(O[4], O[153]);
| O[125] = i2f_mul(O[125], O[153]);
| O[153] = f2i(O[53]);
| O[132] = f2i(O[4]);
| O[163] = f2i(O[125]);
| external_func_call(C[18], O[153], O[132], O[163]R[65535]);
| outputdata_float(0, 125, R[0], O[178]);
| O[178] = div(O[147], O[53]);
| outputdata_float(0, 118, R[0], O[147]);
| outputdata_float(0, 132, R[0], O[147]);
| outputdata_float(0, 138, R[0], O[147]);
| outputdata_float(0, 141, R[0], O[178]);
| outputdata_float(0, 144, R[0], O[147]);
| outputdata_float(0, 150, R[0], O[147]);
| outputdata_float(0, 156, R[0], O[147]);
| outputdata_float(0, 162, R[0], O[147]);
| outputdata_float(0, 232, R[0], O[147]);
| outputdata_float(0, 235, R[0], O[147]);
| outputdata_float(0, 238, R[0], O[147]);
| outputdata_float(0, 301, R[0], O[147]);
| outputdata_float(0, 570, R[0], O[147]);
| O[147] = div(O[146], O[4]);
| outputdata_float(0, 119, R[0], O[146]);
| outputdata_float(0, 133, R[0], O[146]);
| outputdata_float(0, 139, R[0], O[146]);
| outputdata_float(0, 142, R[0], O[147]);
| outputdata_float(0, 145, R[0], O[146]);
| outputdata_float(0, 151, R[0], O[146]);
| outputdata_float(0, 157, R[0], O[146]);
| outputdata_float(0, 163, R[0], O[146]);
| outputdata_float(0, 233, R[0], O[146]);
| outputdata_float(0, 236, R[0], O[146]);
| outputdata_float(0, 239, R[0], O[146]);
| outputdata_float(0, 302, R[0], O[146]);
| outputdata_float(0, 571, R[0], O[146]);
| O[146] = div(O[145], O[125]);
| outputdata_float(0, 120, R[0], O[145]);
| outputdata_float(0, 134, R[0], O[145]);
| outputdata_float(0, 140, R[0], O[145]);
| outputdata_float(0, 143, R[0], O[146]);
| outputdata_float(0, 146, R[0], O[145]);
| outputdata_float(0, 152, R[0], O[145]);
| outputdata_float(0, 158, R[0], O[145]);
| outputdata_float(0, 164, R[0], O[145]);
| outputdata_float(0, 234, R[0], O[145]);
| outputdata_float(0, 237, R[0], O[145]);
| outputdata_float(0, 240, R[0], O[145]);
| outputdata_float(0, 303, R[0], O[145]);
| outputdata_float(0, 572, R[0], O[145]);
| outputdata_int32(0, 14, R[0], C[1]);
| outputdata_int32(0, 34, R[0], O[53]);
| O[4] = f2i(O[4]);
| outputdata_int32(0, 35, R[0], O[4]);
| O[125] = f2i(O[125]);
| outputdata_int32(0, 36, R[0], O[125]);
| O[4] = i2f_mul(O[4], O[327]);
| O[125] = i2f_mul(O[125], O[327]);
| O[145] = f2i(O[53]);
| O[146] = f2i(O[4]);
| O[147] = f2i(O[125]);
| external_func_call(C[19], O[145], O[146], O[147]R[65535]);
| outputdata_int32(0, 25, R[0], O[148]);
| outputdata_int32(0, 22, R[0], O[53]);
| outputdata_int32(0, 23, R[0], O[4]);
| outputdata_int32(0, 24, R[0], O[125]);
| external_func_call(C[20], C[6], C[6], C[6]R[65535]);
| outputdata_int32(0, 39, R[0], O[157]);
| external_func_call(C[10]O[157], O[4], O[53]);
| O[125] = i2f_div1(O[157], C[21]);
| O[125] = cos(O[125]);
| outputdata_int32(0, 56, R[0], O[4]);
| O[4] = i2f_div1(O[4], C[21]);
| O[4] = cos(O[4]);
| outputdata_int32(0, 57, R[0], O[53]);
| O[53] = i2f_div1(O[53], C[21]);
| outputdata_float(0, 129, R[0], O[160]);
| O[53] = cos(O[53]);
| O[125] = add_add(O[125], O[4], O[53]);
| O[125] = div(O[125], C[22]);
| outputdata_int32(0, 29, R[0], O[158]);
| O[125] = mul_sub1(O[125], O[125], C[9]);
| O[125] = sqrt(O[125]);
| O[125] = add(C[9], O[125]);
| O[125] = div(C[3], O[125]);
| O[125] = sub(O[125], C[9]);
| outputdata_float(0, 3, R[0], C[9]);
| outputdata_float(0, 48, R[0], C[9]);
| outputdata_float(0, 113, R[0], C[9]);
| outputdata_float(0, 116, R[0], C[9]);
| outputdata_float(0, 174, R[0], C[9]);
| outputdata_float(0, 241, R[0], C[9]);
| outputdata_float(0, 242, R[0], C[9]);
| outputdata_float(0, 243, R[0], C[9]);
| outputdata_float(0, 244, R[0], C[9]);
| outputdata_float(0, 245, R[0], C[9]);
| outputdata_float(0, 246, R[0], C[9]);
| outputdata_float(0, 247, R[0], C[9]);
| outputdata_float(0, 248, R[0], C[9]);
| outputdata_float(0, 249, R[0], C[9]);
| outputdata_float(0, 250, R[0], C[9]);
| outputdata_float(0, 251, R[0], C[9]);
| outputdata_float(0, 252, R[0], C[9]);
| outputdata_float(0, 253, R[0], O[125]);
| outputdata_float(0, 375, R[0], C[9]);
| outputdata_float(0, 395, R[0], C[9]);
| outputdata_float(0, 400, R[0], C[9]);
| outputdata_float(0, 405, R[0], C[9]);
| outputdata_float(0, 410, R[0], C[9]);
| outputdata_float(0, 443, R[0], C[9]);
| outputdata_float(0, 448, R[0], C[9]);
| outputdata_float(0, 453, R[0], C[9]);
| outputdata_float(0, 458, R[0], C[9]);
| outputdata_float(0, 459, R[0], C[9]);
| outputdata_float(0, 464, R[0], C[9]);
| outputdata_float(0, 469, R[0], C[9]);
| outputdata_float(0, 474, R[0], C[9]);
| outputdata_float(0, 491, R[0], C[9]);
| outputdata_float(0, 496, R[0], C[9]);
| outputdata_float(0, 501, R[0], C[9]);
| outputdata_float(0, 506, R[0], C[9]);
| outputdata_float(0, 516, R[0], C[9]);
| outputdata_int32(0, 50, R[0], O[161]);
| O[157] = i2f_div0(O[157], C[3]);
| O[157] = ceil(O[157]);
| outputdata_int32(0, 55, R[0], O[157]);
| external_func_call(C[10]O[157], O[161], O[125]);
| outputdata_int32(0, 47, R[0], O[260]);
| O[157] = i2f(O[157]);
| O[161] = i2f(O[161]);
| O[161] = f2i(O[161]);
| O[125] = i2f(O[125]);
| external_func_call(C[23], O[157], O[161], O[125], C[6]R[65535]);
| outputdata_float(0, 130, R[0], O[15]);
| external_func_call(C[24], C[6], C[6], C[7]R[65535]);
| external_func_call(C[24]O[15], O[157]);
| external_func_call(C[25], O[15], O[157], C[7]R[65535]);
| outputdata_int32(0, 28, R[0], O[263]);
| external_func_call(C[24]O[263], O[15]);
| outputdata_float(0, 131, R[0], O[162]);
| external_func_call(C[26], O[263], O[15], C[7]R[65535]);
| outputdata_float(0, 213, R[0], O[327]);
| outputdata_float(0, 254, R[0], O[327]);
| outputdata_int32(0, 4, R[0], C[7]);
| outputdata_int32(0, 12, R[0], C[7]);
| outputdata_int32(0, 33, R[0], O[168]);
| outputdata_int32(0, 89, R[0], C[7]);
| external_func_call(C[27], C[6], C[6], C[6]R[65535]);
| outputdata_float(0, 147, R[0], O[187]);
| external_func_call(C[28], C[6], C[6], C[6]R[65535]);
| outputdata_float(0, 127, R[0], O[155]);
| outputdata_int32(0, 5, R[0], C[6]);
| outputdata_int32(0, 6, R[0], C[6]);
| outputdata_int32(0, 13, R[0], C[6]);
| outputdata_int32(0, 21, R[0], C[6]);
| outputdata_int32(0, 38, R[0], O[185]);
| outputdata_int32(0, 62, R[0], C[6]);
| outputdata_int32(0, 63, R[0], C[6]);
| outputdata_int32(0, 64, R[0], C[6]);
| outputdata_int32(0, 65, R[0], C[6]);
| outputdata_int32(0, 66, R[0], C[6]);
| outputdata_int32(0, 67, R[0], C[6]);
| outputdata_int32(0, 68, R[0], C[6]);
| outputdata_int32(0, 69, R[0], C[6]);
| outputdata_int32(0, 70, R[0], C[6]);
| outputdata_float(0, 112, R[0], I[3]);
| outputdata_float(0, 117, R[0], I[4]);
| done();
| O[328] = inputdata_float();
| O[36] = inputdata_float();
| O[35] = inputdata_float();
| O[34] = inputdata_float();
| O[61] = inputdata_float();
| O[60] = inputdata_float();
| O[59] = inputdata_float();
| O[58] = inputdata_int32();
| O[57] = inputdata_float();
| O[53] = inputdata_int32();
| O[52] = inputdata_int32();
| O[51] = inputdata_int32();
| O[50] = inputdata_int32();
| O[8] = inputdata_float();
| O[24] = inputdata_float();
| O[25] = inputdata_float();
| O[23] = inputdata_float();
| O[30] = inputdata_float();
| O[22] = inputdata_int32();
| O[54] = inputdata_int32();
| O[21] = inputdata_int32();
| O[351] = inputdata_int32();
| O[350] = inputdata_int32();
| O[349] = inputdata_int32();
| O[348] = inputdata_float();
| O[347] = inputdata_float();
| O[346] = inputdata_float();
| O[345] = inputdata_float();
| O[344] = inputdata_int32();
| O[343] = inputdata_float();
| O[342] = inputdata_float();
| O[97] = inputdata_float();
| O[98] = inputdata_float();
| O[99] = inputdata_int32();
| O[269] = inputdata_int32();
| O[379] = inputdata_int32();
| O[121] = inputdata_int32();
| O[122] = inputdata_int32();
| O[270] = inputdata_int32();
| O[380] = inputdata_int32();
| O[113] = inputdata_int32();
| O[125] = inputdata_int32();
| O[373] = inputdata_float();
| O[547] = inputdata_float();
| O[659] = inputdata_float();
| O[374] = inputdata_float();
| O[548] = inputdata_float();
| O[508] = inputdata_float();
| O[507] = inputdata_int32();
| O[703] = inputdata_int32();
| O[702] = inputdata_int32();
| O[421] = inputdata_float();
| O[701] = inputdata_float();
| O[700] = inputdata_float();
| O[699] = inputdata_float();
| O[698] = inputdata_float();
| O[417] = inputdata_float();
| O[583] = inputdata_int32();
| O[418] = inputdata_int32();
| R[60] = inputdata_int32();
| R[61] = inputdata_float();
| R[62] = inputdata_float();
| R[63] = inputdata_float();
| R[64] = inputdata_float();
| R[65] = inputdata_float();
| R[66] = inputdata_float();
| R[67] = inputdata_int32();
| R[68] = inputdata_int32();
| R[69] = inputdata_int32();
| R[70] = inputdata_float();
| R[71] = inputdata_float();
| R[72] = inputdata_float();
| R[73] = inputdata_float();
| R[74] = inputdata_float();
| R[75] = inputdata_float();
| R[76] = inputdata_int32();
| R[77] = inputdata_int32();
| R[78] = inputdata_int32();
| R[79] = inputdata_float();
| R[80] = inputdata_float();
| R[81] = inputdata_float();
| R[82] = inputdata_float();
| R[83] = inputdata_float();
| R[84] = inputdata_float();
| R[85] = inputdata_int32();
| R[86] = inputdata_int32();
| R[87] = inputdata_int32();
| R[88] = inputdata_float();
| R[89] = inputdata_float();
| R[90] = inputdata_float();
| R[91] = inputdata_float();
| R[92] = inputdata_float();
| R[93] = inputdata_float();
| R[94] = inputdata_int32();
| R[95] = inputdata_int32();
| R[96] = inputdata_int32();
| R[97] = inputdata_float();
| R[98] = inputdata_float();
| R[99] = inputdata_float();
| R[100] = inputdata_float();
| R[101] = inputdata_float();
| R[102] = inputdata_float();
| R[103] = inputdata_float();
| R[104] = inputdata_float();
| R[105] = inputdata_float();
| R[106] = inputdata_float();
| R[107] = inputdata_float();
| R[108] = inputdata_float();
| R[109] = inputdata_float();
| R[110] = inputdata_float();
| R[111] = inputdata_int32();
| R[112] = inputdata_int32();
| R[113] = inputdata_int32();
| R[114] = inputdata_float();
| R[115] = inputdata_int32();
| R[116] = inputdata_int32();
| R[117] = inputdata_int32();
| R[118] = inputdata_int32();
| R[119] = inputdata_int32();
| R[120] = inputdata_int32();
| R[121] = inputdata_float();
| R[122] = inputdata_int32();
| R[123] = inputdata_int32();
| R[124] = inputdata_int32();
| R[125] = inputdata_int32();
| R[126] = inputdata_float();
| R[127] = inputdata_float();
| R[128] = inputdata_float();
| R[129] = inputdata_float();
| R[130] = inputdata_float();
| R[131] = inputdata_float();
| R[132] = inputdata_int32();
| R[133] = inputdata_int32();
| R[134] = inputdata_int32();
| R[135] = inputdata_float();
| R[136] = inputdata_float();
| R[137] = inputdata_float();
| R[138] = inputdata_float();
| R[139] = inputdata_float();
| R[140] = inputdata_float();
| R[141] = inputdata_int32();
| R[142] = inputdata_int32();
| R[143] = inputdata_int32();
| R[144] = inputdata_float();
| R[145] = inputdata_float();
| R[146] = inputdata_float();
| R[147] = inputdata_float();
| R[148] = inputdata_float();
| R[149] = inputdata_float();
| R[150] = inputdata_int32();
| R[151] = inputdata_int32();
| R[152] = inputdata_int32();
| R[153] = inputdata_float();
| R[154] = inputdata_float();
| R[155] = inputdata_float();
| R[156] = inputdata_float();
| R[157] = inputdata_float();
| R[158] = inputdata_float();
| R[159] = inputdata_float();
| R[160] = inputdata_float();
| R[161] = inputdata_int32();
| R[162] = inputdata_float();
| R[163] = inputdata_int32();
| R[164] = inputdata_int32();
| R[165] = inputdata_int32();
| R[166] = inputdata_int32();
| R[167] = inputdata_int32();
| R[168] = inputdata_int32();
| R[169] = inputdata_int32();
| R[170] = inputdata_float();
| R[171] = inputdata_float();
| R[172] = inputdata_float();
| R[173] = inputdata_float();
| R[174] = inputdata_float();
| R[175] = inputdata_float();
| R[176] = inputdata_int32();
| R[177] = inputdata_int32();
| R[178] = inputdata_float();
| R[179] = inputdata_float();
| R[180] = inputdata_float();
| R[181] = inputdata_int32();
| R[182] = inputdata_int32();
| R[183] = inputdata_int32();
| R[184] = inputdata_float();
| R[185] = inputdata_int32();
| R[186] = inputdata_int32();
| R[187] = inputdata_float();
| R[188] = inputdata_float();
| R[189] = inputdata_float();
| R[190] = inputdata_float();
| R[191] = inputdata_float();
| R[192] = inputdata_float();
| R[193] = inputdata_float();
| R[194] = inputdata_float();
| R[195] = inputdata_float();
| R[196] = inputdata_float();
| R[197] = inputdata_float();
| R[198] = inputdata_float();
| R[199] = inputdata_float();
| R[200] = inputdata_float();
| R[201] = inputdata_int32();
| R[202] = inputdata_float();
| R[203] = inputdata_float();
| R[204] = inputdata_float();
| R[205] = inputdata_float();
| R[0] = acquireindex(C[18]);
| O[35] = cmpeq_select(I[108], C[0], C[1], I[109]);
| O[36] = add(C[2], I[110]);
| O[328] = div_f2i(O[36], O[35]);
| O[328] = maxi(O[328], C[3]);
| O[34] = i2f_mul(O[328], O[35]);
| O[36] = sub(O[36], O[34]);
| O[34] = addi(O[328], I[184]);
| outputdata_int32(0, 92, R[0], O[34]);
| O[34] = add(I[108], C[2]);
| outputdata_float(0, 364, R[0], O[34]);
| O[328] = cmpgti(O[328], C[3]);
| O[35] = select(O[328], O[35], O[35]);
| O[36] = select(O[328], O[36], O[36]);
| O[328] = div(O[36], O[35]);
| outputdata_float(0, 365, R[0], O[35]);
| outputdata_float(0, 536, R[0], O[36]);
| outputdata_float(0, 537, R[0], O[328]);
| O[328] = cmplei(I[183], C[3]);
| O[35] = select(O[328], C[3], I[182]);
| O[36] = select(O[328], C[3], I[183]);
| O[328] = cmpneqi(I[204], C[3]);
| O[328] = cmplei_logic_and(O[36], C[4], O[328]);
| O[53] = select(O[328], I[204], O[35]);
| O[98] = select(O[328], C[4], O[36]);
| O[328] = add(I[189], I[189]);
| O[59] = add(I[190], I[190]);
| O[34] = add(I[191], I[191]);
| O[36] = mul(I[190], O[59]);
| O[35] = mul(I[190], O[34]);
| O[60] = mul(I[191], O[34]);
| O[61] = mul(I[192], O[59]);
| O[58] = mul(I[192], O[34]);
| O[374] = mad_sub1(I[190], O[59], O[60], C[5]);
| O[507] = mul_sub0(I[189], O[59], O[58]);
| O[373] = mad(I[189], O[34], O[61]);
| O[125] = mad(I[189], O[59], O[58]);
| O[548] = mad_sub1(I[189], O[328], O[60], C[5]);
| O[99] = mul_sub1(I[192], O[328], O[35]);
| O[122] = mul_sub0(I[189], O[34], O[61]);
| O[35] = mad(I[192], O[328], O[35]);
| O[328] = mul_add(I[189], O[328], O[36]);
| O[61] = sub(C[5], O[328]);
| O[52] = mul(I[202], I[195]);
| O[36] = mul(C[6], O[52]);
| O[269] = mul(I[200], I[193]);
| O[8] = mul_mad1(C[7], O[269], C[7], C[0]);
| O[97] = mul(I[201], I[194]);
| O[60] = mul_mad1(C[7], C[0], C[7], O[97]);
| O[34] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[328] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[328] = mad_add(C[7], C[0], O[328], C[5]);
| O[50] = mad_add(C[7], C[0], O[60], C[0]);
| O[57] = mad_add(C[7], O[52], O[34], C[0]);
| O[60] = add(O[328], C[0]);
| O[328] = mad(C[0], C[0], O[269]);
| O[51] = add_mad1(C[0], C[0], C[0], C[0]);
| O[349] = add_mad1(C[0], C[0], C[0], O[36]);
| O[59] = add_mad1(O[97], C[0], C[0], C[0]);
| O[24] = add_mad1(C[0], C[0], C[0], O[36]);
| O[58] = add_mad1(C[0], C[0], C[0], C[0]);
| O[34] = add_mad1(O[52], C[0], C[0], O[36]);
| O[347] = mad_mad0(C[7], C[0], O[8], O[60], C[0]);
| O[346] = add_mad1(O[50], C[0], O[60], C[0]);
| O[57] = add_mad1(O[57], C[0], O[60], O[36]);
| O[348] = mul_mad1(O[328], O[374], O[51], O[507]);
| O[351] = mul_mad1(O[328], O[125], O[51], O[548]);
| O[350] = mul_mad1(O[328], O[122], O[51], O[35]);
| O[328] = mul_mad1(O[328], C[0], O[51], C[0]);
| O[51] = mad(C[0], C[5], C[0]);
| O[25] = mad_add(O[349], C[0], O[328], O[51]);
| O[328] = mad(C[0], C[0], C[0]);
| O[21] = mul_mad1(O[328], O[374], O[59], O[507]);
| O[50] = mul_mad1(O[328], O[125], O[59], O[548]);
| O[54] = mul_mad1(O[328], O[122], O[59], O[35]);
| O[328] = mul_mad1(O[328], C[0], O[59], C[0]);
| O[59] = mad(C[0], C[5], C[0]);
| O[51] = mad_add(O[24], C[0], O[328], O[59]);
| O[59] = mad(C[0], C[0], C[0]);
| O[22] = mul_mad1(O[59], O[374], O[58], O[507]);
| O[328] = mul_mad1(O[59], O[125], O[58], O[548]);
| O[8] = mul_mad1(O[59], O[122], O[58], O[35]);
| O[59] = mul_mad1(O[59], C[0], O[58], C[0]);
| O[58] = mad(C[0], C[5], C[0]);
| O[23] = mad_add(O[34], C[0], O[59], O[58]);
| O[30] = mul_mad1(O[347], O[374], O[346], O[507]);
| O[58] = mul_mad1(O[347], O[125], O[346], O[548]);
| O[59] = mul_mad1(O[347], O[122], O[346], O[35]);
| O[347] = mul_mad1(O[347], C[0], O[346], C[0]);
| O[347] = mad(O[57], C[0], O[347]);
| O[60] = mad_add(O[60], C[5], C[0], O[347]);
| O[351] = mad_add(O[349], O[99], O[351], C[0]);
| O[350] = mad_add(O[349], O[61], O[350], C[0]);
| O[345] = mad_mad0(O[349], O[373], O[348], O[25], I[186]);
| O[351] = mad(O[25], I[187], O[351]);
| O[343] = mad(O[25], I[188], O[350]);
| O[25] = mad(O[25], C[5], C[0]);
| O[50] = mad_add(O[24], O[99], O[50], C[0]);
| O[54] = mad_add(O[24], O[61], O[54], C[0]);
| O[24] = mad_mad0(O[24], O[373], O[21], O[51], I[186]);
| O[50] = mad(O[51], I[187], O[50]);
| O[346] = mad(O[51], I[188], O[54]);
| O[51] = mad(O[51], C[5], C[0]);
| O[328] = mad_add(O[34], O[99], O[328], C[0]);
| O[8] = mad_add(O[34], O[61], O[8], C[0]);
| O[34] = mad_mad0(O[34], O[373], O[22], O[23], I[186]);
| O[328] = mad(O[23], I[187], O[328]);
| O[8] = mad(O[23], I[188], O[8]);
| O[23] = mad(O[23], C[5], C[0]);
| O[58] = mad_add(O[57], O[99], O[58], C[0]);
| O[59] = mad_add(O[57], O[61], O[59], C[0]);
| O[348] = mad_mad0(O[57], O[373], O[30], O[60], I[186]);
| O[349] = mad(O[60], I[187], O[58]);
| O[350] = mad(O[60], I[188], O[59]);
| O[60] = mad(O[60], C[5], C[0]);
| outputdata_float(0, 295, R[0], O[60]);
| outputdata_float(0, 458, R[0], O[60]);
| outputdata_float(0, 569, R[0], O[60]);
| O[379] = rcp(O[269]);
| O[54] = rcp(O[97]);
| O[21] = rcp(O[52]);
| O[59] = neg(O[36]);
| O[60] = neg(I[186]);
| O[380] = neg(I[187]);
| O[58] = mul_mad1(O[60], O[374], O[380], O[125]);
| O[22] = mul_mad1(O[60], O[507], O[380], O[548]);
| O[57] = mul_mad1(O[60], O[373], O[380], O[99]);
| O[347] = mul_mad1(O[60], C[0], O[380], C[0]);
| O[30] = neg(I[188]);
| O[113] = mad_add(O[30], C[0], O[347], C[5]);
| O[547] = mad_add(O[30], O[35], O[22], C[0]);
| O[22] = mad_add(O[30], O[61], O[57], C[0]);
| O[121] = neg(C[0]);
| O[58] = mad_mad0(O[30], O[122], O[58], O[113], O[121]);
| O[57] = neg(C[0]);
| O[344] = add_add(O[507], C[0], C[0]);
| O[698] = add_add(O[373], C[0], C[0]);
| O[347] = add_add(O[548], C[0], C[0]);
| O[702] = add_add(O[99], C[0], C[0]);
| O[270] = add_add(O[35], C[0], C[0]);
| O[342] = add_add(O[61], C[0], C[0]);
| O[418] = mad_add(O[113], O[57], O[547], C[0]);
| O[22] = mad_add(O[113], O[59], O[22], C[0]);
| O[583] = mad_add(O[113], C[5], C[0], C[0]);
| O[417] = mul_mad1(O[374], O[379], O[344], C[0]);
| O[699] = mul_mad1(O[374], C[0], O[344], O[54]);
| O[700] = mul_mad1(O[374], C[0], O[344], C[0]);
| O[344] = mul_mad1(O[374], C[0], O[344], C[0]);
| O[113] = add(C[0], C[0]);
| O[701] = mad_add(O[698], C[0], O[344], O[113]);
| O[421] = mul_mad1(O[125], O[379], O[347], C[0]);
| O[703] = mul_mad1(O[125], C[0], O[347], O[54]);
| O[508] = mul_mad1(O[125], C[0], O[347], C[0]);
| O[347] = mul_mad1(O[125], C[0], O[347], C[0]);
| O[344] = add(C[0], C[0]);
| O[659] = mad_add(O[702], C[0], O[347], O[344]);
| O[547] = mul_mad1(O[122], O[379], O[270], C[0]);
| O[344] = mul_mad1(O[122], C[0], O[270], O[54]);
| O[347] = mul_mad1(O[122], C[0], O[270], C[0]);
| O[270] = mul_mad1(O[122], C[0], O[270], C[0]);
| O[113] = mad_add(O[342], C[0], O[270], O[113]);
| O[379] = mul_mad1(O[58], O[379], O[418], C[0]);
| O[54] = mul_mad1(O[58], C[0], O[418], O[54]);
| O[270] = mul_mad1(O[58], C[0], O[418], C[0]);
| O[58] = mul_mad1(O[58], C[0], O[418], C[0]);
| O[58] = mad_add(O[22], C[0], O[58], O[583]);
| O[699] = mad_add(O[698], C[0], O[699], C[0]);
| O[700] = mad_add(O[698], O[21], O[700], C[0]);
| O[698] = mad_mad0(O[698], C[0], O[417], O[701], C[6]);
| outputdata_float(0, 336, R[0], O[698]);
| outputdata_float(0, 491, R[0], O[698]);
| outputdata_float(0, 605, R[0], O[698]);
| O[699] = mad(O[701], C[6], O[699]);
| outputdata_float(0, 337, R[0], O[699]);
| outputdata_float(0, 492, R[0], O[699]);
| outputdata_float(0, 606, R[0], O[699]);
| O[700] = mad(O[701], C[6], O[700]);
| outputdata_float(0, 338, R[0], O[700]);
| outputdata_float(0, 493, R[0], O[700]);
| outputdata_float(0, 607, R[0], O[700]);
| O[701] = add(O[701], C[0]);
| outputdata_float(0, 339, R[0], O[701]);
| outputdata_float(0, 494, R[0], O[701]);
| outputdata_float(0, 608, R[0], O[701]);
| O[703] = mad_add(O[702], C[0], O[703], C[0]);
| O[508] = mad_add(O[702], O[21], O[508], C[0]);
| O[702] = mad_mad0(O[702], C[0], O[421], O[659], C[6]);
| outputdata_float(0, 340, R[0], O[702]);
| outputdata_float(0, 495, R[0], O[702]);
| outputdata_float(0, 609, R[0], O[702]);
| O[703] = mad(O[659], C[6], O[703]);
| outputdata_float(0, 341, R[0], O[703]);
| outputdata_float(0, 496, R[0], O[703]);
| outputdata_float(0, 610, R[0], O[703]);
| O[508] = mad(O[659], C[6], O[508]);
| outputdata_float(0, 342, R[0], O[508]);
| outputdata_float(0, 497, R[0], O[508]);
| outputdata_float(0, 611, R[0], O[508]);
| O[659] = add(O[659], C[0]);
| outputdata_float(0, 343, R[0], O[659]);
| outputdata_float(0, 498, R[0], O[659]);
| outputdata_float(0, 612, R[0], O[659]);
| O[344] = mad_add(O[342], C[0], O[344], C[0]);
| O[347] = mad_add(O[342], O[21], O[347], C[0]);
| O[342] = mad_mad0(O[342], C[0], O[547], O[113], C[6]);
| O[344] = mad(O[113], C[6], O[344]);
| O[347] = mad(O[113], C[6], O[347]);
| O[113] = add(O[113], C[0]);
| outputdata_float(0, 347, R[0], O[113]);
| outputdata_float(0, 502, R[0], O[113]);
| outputdata_float(0, 616, R[0], O[113]);
| O[54] = mad_add(O[22], C[0], O[54], C[0]);
| O[21] = mad_add(O[22], O[21], O[270], C[0]);
| O[22] = mad_mad0(O[22], C[0], O[379], O[58], C[6]);
| O[54] = mad(O[58], C[6], O[54]);
| O[21] = mad(O[58], C[6], O[21]);
| O[58] = add(O[58], C[0]);
| outputdata_float(0, 351, R[0], O[58]);
| outputdata_float(0, 506, R[0], O[58]);
| outputdata_float(0, 620, R[0], O[58]);
| O[379] = mul_mad1(O[60], O[374], O[380], O[125]);
| O[270] = mul_mad1(O[60], O[507], O[380], O[548]);
| O[58] = mul_mad1(O[60], O[373], O[380], O[99]);
| O[60] = mul_mad1(O[60], C[0], O[380], C[0]);
| O[60] = mad_add(O[30], C[0], O[60], C[5]);
| O[270] = mad_add(O[30], O[35], O[270], C[0]);
| O[58] = mad_add(O[30], O[61], O[58], C[0]);
| O[30] = mad_mad0(O[30], O[122], O[379], O[60], O[121]);
| O[659] = add_add(O[507], C[0], C[0]);
| O[547] = add_add(O[373], C[0], C[0]);
| O[113] = add_add(O[548], C[0], C[0]);
| O[380] = add_add(O[99], C[0], C[0]);
| O[121] = add_add(O[35], C[0], C[0]);
| O[379] = add_add(O[61], C[0], C[0]);
| O[57] = mad_add(O[60], O[57], O[270], C[0]);
| O[58] = mad_add(O[60], O[59], O[58], C[0]);
| O[59] = mad_add(O[60], C[5], C[0], C[0]);
| O[270] = add(O[125], C[0]);
| O[60] = add(O[122], C[0]);
| O[508] = add(O[548], C[0]);
| O[35] = add(O[35], C[0]);
| O[99] = add(O[99], C[0]);
| O[61] = add(O[61], C[0]);
| outputdata_float(0, 179, R[0], O[270]);
| outputdata_float(0, 195, R[0], O[270]);
| outputdata_float(0, 396, R[0], O[270]);
| outputdata_float(0, 412, R[0], O[270]);
| outputdata_float(0, 180, R[0], O[60]);
| outputdata_float(0, 196, R[0], O[60]);
| outputdata_float(0, 397, R[0], O[60]);
| outputdata_float(0, 413, R[0], O[60]);
| O[548] = mul_mad1(C[0], O[374], C[0], O[507]);
| outputdata_float(0, 182, R[0], O[507]);
| outputdata_float(0, 198, R[0], O[507]);
| outputdata_float(0, 399, R[0], O[507]);
| outputdata_float(0, 415, R[0], O[507]);
| O[270] = mul_mad1(C[0], O[270], C[0], O[508]);
| outputdata_float(0, 183, R[0], O[508]);
| outputdata_float(0, 199, R[0], O[508]);
| outputdata_float(0, 400, R[0], O[508]);
| outputdata_float(0, 416, R[0], O[508]);
| O[60] = mul_mad1(C[0], O[60], C[0], O[35]);
| outputdata_float(0, 184, R[0], O[35]);
| outputdata_float(0, 200, R[0], O[35]);
| outputdata_float(0, 401, R[0], O[35]);
| outputdata_float(0, 417, R[0], O[35]);
| O[35] = mul_mad1(C[0], C[0], C[0], C[0]);
| outputdata_float(0, 186, R[0], O[373]);
| outputdata_float(0, 202, R[0], O[373]);
| outputdata_float(0, 403, R[0], O[373]);
| outputdata_float(0, 419, R[0], O[373]);
| outputdata_float(0, 187, R[0], O[99]);
| outputdata_float(0, 203, R[0], O[99]);
| outputdata_float(0, 404, R[0], O[99]);
| outputdata_float(0, 420, R[0], O[99]);
| outputdata_float(0, 188, R[0], O[61]);
| outputdata_float(0, 204, R[0], O[61]);
| outputdata_float(0, 405, R[0], O[61]);
| outputdata_float(0, 421, R[0], O[61]);
| O[373] = mad_add(O[36], O[373], O[548], I[186]);
| outputdata_float(0, 190, R[0], O[373]);
| outputdata_float(0, 206, R[0], O[373]);
| outputdata_float(0, 407, R[0], O[373]);
| outputdata_float(0, 423, R[0], O[373]);
| O[99] = mad_add(O[36], O[99], O[270], I[187]);
| outputdata_float(0, 191, R[0], O[99]);
| outputdata_float(0, 207, R[0], O[99]);
| outputdata_float(0, 408, R[0], O[99]);
| outputdata_float(0, 424, R[0], O[99]);
| O[61] = mad_add(O[36], O[61], O[60], I[188]);
| outputdata_float(0, 192, R[0], O[61]);
| outputdata_float(0, 208, R[0], O[61]);
| outputdata_float(0, 409, R[0], O[61]);
| outputdata_float(0, 425, R[0], O[61]);
| O[36] = mad_add(O[36], C[0], O[35], C[5]);
| outputdata_float(0, 193, R[0], O[36]);
| outputdata_float(0, 209, R[0], O[36]);
| outputdata_float(0, 410, R[0], O[36]);
| outputdata_float(0, 426, R[0], O[36]);
| O[60] = mul_mad1(C[7], O[269], C[7], C[0]);
| O[61] = mul_mad1(C[7], C[0], C[7], O[97]);
| O[35] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[36] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[60] = mad(C[7], C[0], O[60]);
| outputdata_float(0, 439, R[0], O[60]);
| outputdata_float(0, 550, R[0], O[60]);
| O[61] = mad(C[7], C[0], O[61]);
| outputdata_float(0, 440, R[0], O[61]);
| outputdata_float(0, 551, R[0], O[61]);
| O[35] = mad(C[7], O[52], O[35]);
| outputdata_float(0, 441, R[0], O[35]);
| outputdata_float(0, 552, R[0], O[35]);
| O[36] = mad_add(C[7], C[0], O[36], C[5]);
| outputdata_float(0, 442, R[0], O[36]);
| outputdata_float(0, 553, R[0], O[36]);
| O[36] = rcp(O[269]);
| outputdata_float(0, 379, R[0], O[36]);
| outputdata_float(0, 520, R[0], O[36]);
| O[36] = rcp(O[97]);
| outputdata_float(0, 384, R[0], O[36]);
| outputdata_float(0, 525, R[0], O[36]);
| O[36] = rcp(O[52]);
| outputdata_float(0, 389, R[0], O[36]);
| outputdata_float(0, 530, R[0], O[36]);
| O[270] = add(C[0], C[0]);
| O[373] = add(C[0], C[0]);
| O[99] = add(C[0], C[0]);
| external_func_call(O[374], O[659], O[547], O[373], O[125], O[113], O[380], O[270], O[122], O[121], O[379], O[99], O[30], O[57], O[58], O[59]O[60], O[61], O[35], O[36]);
| outputdata_float(0, 178, R[0], O[374]);
| outputdata_float(0, 194, R[0], O[374]);
| outputdata_float(0, 304, R[0], O[374]);
| outputdata_float(0, 305, R[0], O[659]);
| outputdata_float(0, 306, R[0], O[547]);
| outputdata_float(0, 307, R[0], O[373]);
| outputdata_float(0, 308, R[0], O[125]);
| outputdata_float(0, 309, R[0], O[113]);
| outputdata_float(0, 310, R[0], O[380]);
| outputdata_float(0, 311, R[0], O[270]);
| outputdata_float(0, 312, R[0], O[122]);
| outputdata_float(0, 313, R[0], O[121]);
| outputdata_float(0, 314, R[0], O[379]);
| outputdata_float(0, 315, R[0], O[99]);
| outputdata_float(0, 316, R[0], O[30]);
| outputdata_float(0, 317, R[0], O[57]);
| outputdata_float(0, 318, R[0], O[58]);
| outputdata_float(0, 319, R[0], O[59]);
| outputdata_float(0, 320, R[0], O[374]);
| outputdata_float(0, 321, R[0], O[659]);
| outputdata_float(0, 322, R[0], O[547]);
| outputdata_float(0, 323, R[0], O[373]);
| outputdata_float(0, 324, R[0], O[125]);
| outputdata_float(0, 325, R[0], O[113]);
| outputdata_float(0, 326, R[0], O[380]);
| outputdata_float(0, 327, R[0], O[270]);
| outputdata_float(0, 328, R[0], O[122]);
| outputdata_float(0, 329, R[0], O[121]);
| outputdata_float(0, 330, R[0], O[379]);
| outputdata_float(0, 331, R[0], O[99]);
| outputdata_float(0, 332, R[0], O[30]);
| outputdata_float(0, 333, R[0], O[57]);
| outputdata_float(0, 334, R[0], O[58]);
| outputdata_float(0, 335, R[0], O[59]);
| outputdata_float(0, 395, R[0], O[374]);
| outputdata_float(0, 411, R[0], O[374]);
| outputdata_float(0, 459, R[0], O[374]);
| outputdata_float(0, 460, R[0], O[659]);
| outputdata_float(0, 461, R[0], O[547]);
| outputdata_float(0, 462, R[0], O[373]);
| outputdata_float(0, 463, R[0], O[125]);
| outputdata_float(0, 464, R[0], O[113]);
| outputdata_float(0, 465, R[0], O[380]);
| outputdata_float(0, 466, R[0], O[270]);
| outputdata_float(0, 467, R[0], O[122]);
| outputdata_float(0, 468, R[0], O[121]);
| outputdata_float(0, 469, R[0], O[379]);
| outputdata_float(0, 470, R[0], O[99]);
| outputdata_float(0, 471, R[0], O[30]);
| outputdata_float(0, 472, R[0], O[57]);
| outputdata_float(0, 473, R[0], O[58]);
| outputdata_float(0, 474, R[0], O[59]);
| outputdata_float(0, 475, R[0], O[374]);
| outputdata_float(0, 476, R[0], O[659]);
| outputdata_float(0, 477, R[0], O[547]);
| outputdata_float(0, 478, R[0], O[373]);
| outputdata_float(0, 479, R[0], O[125]);
| outputdata_float(0, 480, R[0], O[113]);
| outputdata_float(0, 481, R[0], O[380]);
| outputdata_float(0, 482, R[0], O[270]);
| outputdata_float(0, 483, R[0], O[122]);
| outputdata_float(0, 484, R[0], O[121]);
| outputdata_float(0, 485, R[0], O[379]);
| outputdata_float(0, 486, R[0], O[99]);
| outputdata_float(0, 487, R[0], O[30]);
| outputdata_float(0, 488, R[0], O[57]);
| outputdata_float(0, 489, R[0], O[58]);
| outputdata_float(0, 490, R[0], O[59]);
| outputdata_float(0, 573, R[0], O[374]);
| outputdata_float(0, 574, R[0], O[659]);
| outputdata_float(0, 575, R[0], O[547]);
| outputdata_float(0, 576, R[0], O[373]);
| outputdata_float(0, 577, R[0], O[125]);
| outputdata_float(0, 578, R[0], O[113]);
| outputdata_float(0, 579, R[0], O[380]);
| outputdata_float(0, 580, R[0], O[270]);
| outputdata_float(0, 581, R[0], O[122]);
| outputdata_float(0, 582, R[0], O[121]);
| outputdata_float(0, 583, R[0], O[379]);
| outputdata_float(0, 584, R[0], O[99]);
| outputdata_float(0, 585, R[0], O[30]);
| outputdata_float(0, 586, R[0], O[57]);
| outputdata_float(0, 587, R[0], O[58]);
| outputdata_float(0, 588, R[0], O[59]);
| outputdata_float(0, 589, R[0], O[374]);
| outputdata_float(0, 590, R[0], O[659]);
| outputdata_float(0, 591, R[0], O[547]);
| outputdata_float(0, 592, R[0], O[373]);
| outputdata_float(0, 593, R[0], O[125]);
| outputdata_float(0, 594, R[0], O[113]);
| outputdata_float(0, 595, R[0], O[380]);
| outputdata_float(0, 596, R[0], O[270]);
| outputdata_float(0, 597, R[0], O[122]);
| outputdata_float(0, 598, R[0], O[121]);
| outputdata_float(0, 599, R[0], O[379]);
| outputdata_float(0, 600, R[0], O[99]);
| outputdata_float(0, 601, R[0], O[30]);
| outputdata_float(0, 602, R[0], O[57]);
| outputdata_float(0, 603, R[0], O[58]);
| outputdata_float(0, 604, R[0], O[59]);
| O[57] = mul_mad1(O[345], C[6], O[24], C[6]);
| O[58] = mul_mad1(O[351], C[6], O[50], C[6]);
| O[59] = mul_mad1(O[343], C[6], O[346], C[6]);
| O[57] = mad_add(O[34], C[6], O[57], O[348]);
| O[58] = mad_add(O[328], C[6], O[58], O[349]);
| O[59] = mad_add(O[8], C[6], O[59], O[350]);
| O[36] = mul(O[36], C[8]);
| O[30] = cmpeq_select(I[104], C[0], C[9], I[105]);
| outputdata_float(0, 356, R[0], O[30]);
| O[30] = add(I[104], C[2]);
| outputdata_float(0, 352, R[0], O[30]);
| O[30] = clamp(I[185], C[0], C[10]);
| outputdata_float(0, 361, R[0], O[30]);
| O[30] = cmpneqi(I[180], C[11]);
| O[30] = cmpnei_logic_and(I[180], C[12], O[30]);
| O[30] = cmpeqi_logic_and(O[98], C[3], O[30]);
| O[30] = cmplei_logic_and(I[181], O[98], O[30]);
| O[99] = cmpeqi(I[180], C[13]);
| O[99] = cmpeqi_logic_or(I[180], C[4], O[99]);
| O[99] = cmpeqi_logic_and(O[53], C[4], O[99]);
| O[99] = b2i(O[99]);
| O[99] = cmpeqi_select(O[99], C[3], O[53], C[13]);
| O[379] = select(O[30], O[99], I[180]);
| O[99] = select(O[30], O[98], I[181]);
| O[30] = cmpeqi(O[98], C[4]);
| O[30] = cmpnei_logic_and(O[53], C[3], O[30]);
| O[121] = cmpneqi(O[379], C[12]);
| O[121] = cmpnei_logic_and(O[379], C[11], O[121]);
| O[30] = logic_and(O[30], O[121]);
| O[30] = cmplei_logic_and(O[99], C[13], O[30]);
| O[379] = select(O[30], C[13], O[379]);
| O[99] = select(O[30], C[13], O[99]);
| O[30] = cmpneqi(O[99], C[3]);
| O[30] = cmpnei_logic_and(O[379], C[3], O[30]);
| O[30] = cmpeqi_logic_and(I[205], C[3], O[30]);
| O[30] = cmplei_logic_and(O[99], C[11], O[30]);
| O[379] = select(O[30], C[11], O[379]);
| outputdata_int32(0, 81, R[0], O[379]);
| O[30] = select(O[30], C[11], O[99]);
| outputdata_int32(0, 82, R[0], O[30]);
| O[30] = mul(I[197], C[2]);
| O[99] = mul(I[196], C[2]);
| O[99] = mul_mad1(O[30], O[30], O[99], O[99]);
| O[30] = mul(I[198], C[2]);
| O[30] = mad_sqrt(O[30], O[30], O[99]);
| O[30] = fmod_add(I[106], C[14], O[30]);
| outputdata_float(0, 357, R[0], O[30]);
| O[99] = add(C[2], I[107]);
| O[30] = sub_neg(O[99], C[2]);
| outputdata_float(0, 362, R[0], O[30]);
| outputdata_float(0, 359, R[0], O[99]);
| O[99] = neg_cmplt(O[99], C[0]);
| O[30] = cmpge_logic_and(O[30], C[0], O[99]);
| O[99] = f2i_maxi(I[199], C[13]);
| O[30] = b2i(O[30]);
| O[30] = cmpeqi_select(O[30], C[3], C[3], O[99]);
| outputdata_int32(0, 87, R[0], O[30]);
| external_func_call(C[3]O[99], O[30], O[121]);
| O[379] = i2f(O[99]);
| outputdata_int32(0, 84, R[0], O[99]);
| O[99] = i2f(O[30]);
| outputdata_int32(0, 85, R[0], O[30]);
| O[30] = i2f(O[121]);
| outputdata_int32(0, 86, R[0], O[121]);
| O[379] = max(O[379], C[5]);
| O[99] = max(O[99], C[5]);
| O[30] = max(O[30], C[5]);
| O[379] = div(O[269], O[379]);
| outputdata_float(0, 353, R[0], O[379]);
| outputdata_float(0, 358, R[0], O[379]);
| outputdata_float(0, 427, R[0], O[269]);
| outputdata_float(0, 538, R[0], O[269]);
| outputdata_float(0, 570, R[0], O[269]);
| O[99] = div(O[97], O[99]);
| outputdata_float(0, 354, R[0], O[99]);
| outputdata_float(0, 432, R[0], O[97]);
| outputdata_float(0, 543, R[0], O[97]);
| outputdata_float(0, 571, R[0], O[97]);
| O[30] = div(O[52], O[30]);
| outputdata_float(0, 355, R[0], O[30]);
| outputdata_float(0, 437, R[0], O[52]);
| outputdata_float(0, 548, R[0], O[52]);
| outputdata_float(0, 572, R[0], O[52]);
| O[52] = cmpeq_select(I[0], C[0], C[9], I[1]);
| outputdata_float(0, 1, R[0], O[52]);
| outputdata_int32(0, 1, R[0], I[111]);
| O[52] = add(I[0], C[2]);
| outputdata_float(0, 0, R[0], O[52]);
| O[52] = cmpneqi(I[112], C[11]);
| O[52] = cmpnei_logic_and(I[112], C[12], O[52]);
| O[52] = cmpeqi_logic_and(O[98], C[3], O[52]);
| O[52] = cmplei_logic_and(I[113], O[98], O[52]);
| O[30] = cmpeqi(I[112], C[13]);
| O[30] = cmpeqi_logic_or(I[112], C[4], O[30]);
| O[30] = cmpeqi_logic_and(O[53], C[4], O[30]);
| O[30] = cmpeqi_select(O[30], C[3], O[53], C[13]);
| O[30] = select(O[52], O[30], I[112]);
| O[52] = select(O[52], O[98], I[113]);
| outputdata_int32(0, 90, R[0], O[53]);
| O[97] = cmpeqi(O[98], C[4]);
| outputdata_int32(0, 91, R[0], O[98]);
| O[53] = cmpnei_logic_and(O[53], C[3], O[97]);
| O[97] = cmpneqi(O[30], C[12]);
| O[97] = cmpnei_logic_and(O[30], C[11], O[97]);
| O[53] = logic_and(O[53], O[97]);
| O[53] = cmplei_logic_and(O[52], C[13], O[53]);
| O[30] = select(O[53], C[13], O[30]);
| O[52] = select(O[53], C[13], O[52]);
| O[53] = cmpneqi(O[52], C[3]);
| O[53] = cmpnei_logic_and(O[30], C[3], O[53]);
| O[53] = cmpeqi_logic_and(I[203], C[3], O[53]);
| O[53] = cmplei_logic_and(O[52], C[11], O[53]);
| O[30] = select(O[53], C[11], O[30]);
| outputdata_int32(0, 2, R[0], O[30]);
| O[53] = select(O[53], C[11], O[52]);
| O[52] = mul(I[197], C[2]);
| O[30] = mul(I[196], C[2]);
| O[30] = mul_mad1(O[52], O[52], O[30], O[30]);
| O[52] = mul(I[198], C[2]);
| O[52] = mad_sqrt(O[52], O[52], O[30]);
| outputdata_int32(0, 6, R[0], I[115]);
| O[52] = fmod_add(I[8], C[14], O[52]);
| outputdata_float(0, 9, R[0], O[52]);
| external_func_call(C[13]O[52], R[65535], R[65535]);
| O[52] = i2f_div1(O[52], I[101]);
| outputdata_float(0, 10, R[0], O[52]);
| outputdata_float(0, 225, R[0], I[101]);
| outputdata_float(0, 301, R[0], I[101]);
| O[52] = mul_mad1(O[351], O[351], O[345], O[345]);
| O[52] = mad_mad0(O[343], O[343], O[52], O[25], O[25]);
| outputdata_float(0, 283, R[0], O[25]);
| outputdata_float(0, 446, R[0], O[25]);
| outputdata_float(0, 557, R[0], O[25]);
| O[25] = sqrt(O[52]);
| O[52] = mul_mad1(O[50], O[50], O[24], O[24]);
| O[52] = mad_mad0(O[346], O[346], O[52], O[51], O[51]);
| outputdata_float(0, 287, R[0], O[51]);
| outputdata_float(0, 450, R[0], O[51]);
| outputdata_float(0, 561, R[0], O[51]);
| O[51] = sqrt(O[52]);
| O[52] = mul_mad1(O[328], O[328], O[34], O[34]);
| O[52] = mad_mad0(O[8], O[8], O[52], O[23], O[23]);
| outputdata_float(0, 291, R[0], O[23]);
| outputdata_float(0, 454, R[0], O[23]);
| outputdata_float(0, 565, R[0], O[23]);
| O[52] = sqrt(O[52]);
| O[99] = mul(O[25], C[6]);
| O[23] = mul(O[51], C[6]);
| O[269] = mul(O[52], C[6]);
| O[52] = mul_mad1(O[345], C[6], O[24], C[6]);
| O[51] = mul_mad1(O[351], C[6], O[50], C[6]);
| O[25] = mul_mad1(O[343], C[6], O[346], C[6]);
| O[52] = mad_add(O[34], C[6], O[52], O[348]);
| O[51] = mad_add(O[328], C[6], O[51], O[349]);
| O[25] = mad_add(O[8], C[6], O[25], O[350]);
| external_func_call(C[4], I[153], O[52], O[51], O[25], I[189], I[190], I[191], I[192], O[99], O[23], O[269], C[5], C[0], C[0], C[5]);
| outputdata_int32(0, 50, R[0], I[153]);
| outputdata_float(0, 108, R[0], I[9]);
| outputdata_float(0, 109, R[0], I[10]);
| O[23] = mul(I[189], C[16]);
| O[23] = mul_add(I[192], C[15], O[23]);
| O[30] = mul(I[189], C[15]);
| O[98] = mul_mad1(I[192], C[16], O[30], C[8]);
| O[30] = mul(I[190], C[16]);
| O[30] = mad_add(C[0], C[8], C[0], O[30]);
| O[97] = mul(I[190], C[15]);
| O[97] = add_mad1(C[0], C[0], O[97], C[8]);
| O[23] = add_mad1(C[0], O[23], C[0], C[8]);
| O[30] = mul_add(I[191], C[15], O[30]);
| O[97] = mul_add(I[191], C[16], O[97]);
| O[98] = mad_mad0(C[0], C[8], O[98], C[0], C[8]);
| external_func_call(C[4], C[17], O[52], O[51], O[25], O[23], O[30], O[97], O[98], O[99], O[269], I[126], I[128], C[6], C[0], C[0], C[5]);
| outputdata_float(0, 3, R[0], I[3]);
| outputdata_int32(0, 22, R[0], I[126]);
| outputdata_int32(0, 24, R[0], I[128]);
| O[51] = add(C[2], I[71]);
| outputdata_float(0, 8, R[0], C[2]);
| O[52] = sub_neg(O[51], C[2]);
| outputdata_float(0, 121, R[0], O[52]);
| outputdata_float(0, 210, R[0], O[51]);
| O[51] = neg_cmplt(O[51], C[0]);
| O[23] = cmpge_logic_and(O[52], C[0], O[51]);
| external_func_call(C[13]O[51], O[25], O[30]);
| O[52] = mad(O[342], I[18], O[22]);
| outputdata_float(0, 344, R[0], O[342]);
| outputdata_float(0, 348, R[0], O[22]);
| outputdata_float(0, 499, R[0], O[342]);
| outputdata_float(0, 503, R[0], O[22]);
| outputdata_float(0, 613, R[0], O[342]);
| outputdata_float(0, 617, R[0], O[22]);
| O[22] = mad(O[344], I[18], O[54]);
| outputdata_float(0, 345, R[0], O[344]);
| outputdata_float(0, 349, R[0], O[54]);
| outputdata_float(0, 500, R[0], O[344]);
| outputdata_float(0, 504, R[0], O[54]);
| outputdata_float(0, 614, R[0], O[344]);
| outputdata_float(0, 618, R[0], O[54]);
| O[54] = mad(O[347], I[18], O[21]);
| outputdata_float(0, 117, R[0], I[18]);
| outputdata_float(0, 300, R[0], I[18]);
| outputdata_float(0, 346, R[0], O[347]);
| outputdata_float(0, 350, R[0], O[21]);
| outputdata_float(0, 501, R[0], O[347]);
| outputdata_float(0, 505, R[0], O[21]);
| outputdata_float(0, 615, R[0], O[347]);
| outputdata_float(0, 619, R[0], O[21]);
| external_func_call(C[13], O[52], O[22], O[54]R[65535], R[65535], O[52]);
| O[52] = ceil(O[52]);
| O[52] = f2i(O[52]);
| O[52] = clampi(O[52], C[3], O[30]);
| O[30] = muli(O[51], O[25]);
| O[30] = muli(O[30], O[52]);
| O[30] = muli(O[30], I[151]);
| outputdata_int32(0, 48, R[0], I[151]);
| O[30] = i2f_mul(O[30], I[14]);
| O[22] = max(O[30], C[5]);
| O[30] = cmpeq_select(O[30], C[0], C[0], O[22]);
| O[23] = f2i_select1(O[23], O[30], C[3]);
| O[30] = cmpgti(O[23], C[3]);
| outputdata_int32(0, 15, R[0], O[30]);
| outputdata_int32(0, 16, R[0], O[23]);
| O[51] = muli(O[51], O[25]);
| O[51] = muli(O[51], O[52]);
| outputdata_int32(0, 18, R[0], O[51]);
| outputdata_int32(0, 19, R[0], O[52]);
| O[25] = neg(C[6]);
| O[52] = mad(I[200], O[25], C[0]);
| O[51] = mad(I[201], O[25], C[0]);
| O[23] = mul(I[202], C[6]);
| O[25] = mad(I[202], O[25], O[23]);
| O[30] = mad(I[201], C[6], C[0]);
| O[22] = mad(I[202], C[6], O[23]);
| O[23] = mad(I[200], C[6], C[0]);
| external_func_call(C[11], C[18], C[18], O[52], O[51], O[25], O[23], O[30], O[22]);
| outputdata_float(0, 111, R[0], I[12]);
| outputdata_int32(0, 3, R[0], O[53]);
| outputdata_int32(0, 4, R[0], C[18]);
| outputdata_int32(0, 89, R[0], C[18]);
| external_func_call(C[12], O[57], O[58], O[59], O[60], O[61], O[35], O[36], I[19], I[20], I[21], C[3], C[17]R[65535]);
| outputdata_float(0, 2, R[0], I[2]);
| outputdata_float(0, 110, R[0], I[11]);
| outputdata_float(0, 118, R[0], I[19]);
| outputdata_float(0, 119, R[0], I[20]);
| outputdata_float(0, 120, R[0], I[21]);
| outputdata_float(0, 165, R[0], O[57]);
| outputdata_float(0, 166, R[0], O[58]);
| outputdata_float(0, 167, R[0], O[59]);
| outputdata_float(0, 168, R[0], O[57]);
| outputdata_float(0, 169, R[0], O[58]);
| outputdata_float(0, 170, R[0], O[59]);
| outputdata_float(0, 171, R[0], O[60]);
| outputdata_float(0, 172, R[0], O[61]);
| outputdata_float(0, 173, R[0], O[35]);
| outputdata_float(0, 174, R[0], O[36]);
| outputdata_float(0, 366, R[0], O[57]);
| outputdata_float(0, 367, R[0], O[58]);
| outputdata_float(0, 368, R[0], O[59]);
| outputdata_float(0, 369, R[0], O[57]);
| outputdata_float(0, 370, R[0], O[58]);
| outputdata_float(0, 371, R[0], O[59]);
| outputdata_float(0, 372, R[0], O[60]);
| outputdata_float(0, 373, R[0], O[61]);
| outputdata_float(0, 374, R[0], O[35]);
| outputdata_float(0, 375, R[0], O[36]);
| outputdata_float(0, 507, R[0], O[57]);
| outputdata_float(0, 508, R[0], O[58]);
| outputdata_float(0, 509, R[0], O[59]);
| outputdata_float(0, 510, R[0], O[57]);
| outputdata_float(0, 511, R[0], O[58]);
| outputdata_float(0, 512, R[0], O[59]);
| outputdata_float(0, 513, R[0], O[60]);
| outputdata_float(0, 514, R[0], O[61]);
| outputdata_float(0, 515, R[0], O[35]);
| outputdata_float(0, 516, R[0], O[36]);
| outputdata_int32(0, 17, R[0], C[3]);
| outputdata_int32(0, 46, R[0], C[3]);
| outputdata_int32(0, 83, R[0], C[3]);
| outputdata_int32(0, 88, R[0], C[3]);
| external_func_call(C[19]O[30], O[25], O[52], O[57], O[59], O[61], O[58], O[60], O[35], O[22], O[23], O[51], O[347], O[36], O[53]);
| external_func_call(C[19]O[54]);
| O[54] = mul(C[20], O[54]);
| outputdata_int32(0, 7, R[0], I[116]);
| O[21] = tan(O[54]);
| O[54] = div(O[347], O[36]);
| O[344] = mul(O[21], O[54]);
| O[379] = rcp(O[344]);
| O[98] = rcp(O[21]);
| O[344] = add(O[348], O[345]);
| outputdata_float(0, 280, R[0], O[345]);
| outputdata_float(0, 443, R[0], O[345]);
| outputdata_float(0, 554, R[0], O[345]);
| O[345] = add(O[349], O[351]);
| outputdata_float(0, 281, R[0], O[351]);
| outputdata_float(0, 444, R[0], O[351]);
| outputdata_float(0, 555, R[0], O[351]);
| O[351] = add(O[350], O[343]);
| outputdata_float(0, 282, R[0], O[343]);
| outputdata_float(0, 445, R[0], O[343]);
| outputdata_float(0, 556, R[0], O[343]);
| O[113] = sub(O[344], O[348]);
| O[270] = sub(O[345], O[349]);
| O[121] = sub(O[351], O[350]);
| O[351] = add(O[348], O[24]);
| outputdata_float(0, 284, R[0], O[24]);
| outputdata_float(0, 447, R[0], O[24]);
| outputdata_float(0, 558, R[0], O[24]);
| O[24] = add(O[349], O[50]);
| outputdata_float(0, 285, R[0], O[50]);
| outputdata_float(0, 448, R[0], O[50]);
| outputdata_float(0, 559, R[0], O[50]);
| O[50] = add(O[350], O[346]);
| outputdata_float(0, 286, R[0], O[346]);
| outputdata_float(0, 449, R[0], O[346]);
| outputdata_float(0, 560, R[0], O[346]);
| O[125] = sub(O[351], O[348]);
| O[380] = sub(O[24], O[349]);
| O[122] = sub(O[50], O[350]);
| O[50] = add(O[348], O[34]);
| outputdata_float(0, 288, R[0], O[34]);
| outputdata_float(0, 451, R[0], O[34]);
| outputdata_float(0, 562, R[0], O[34]);
| O[34] = add(O[349], O[328]);
| outputdata_float(0, 289, R[0], O[328]);
| outputdata_float(0, 452, R[0], O[328]);
| outputdata_float(0, 563, R[0], O[328]);
| O[328] = add(O[350], O[8]);
| outputdata_float(0, 290, R[0], O[8]);
| outputdata_float(0, 453, R[0], O[8]);
| outputdata_float(0, 564, R[0], O[8]);
| O[269] = sub(O[50], O[348]);
| O[99] = sub(O[34], O[349]);
| O[346] = sub(O[328], O[350]);
| O[351] = sub(O[348], O[30]);
| O[8] = sub(O[349], O[25]);
| O[328] = sub(O[350], O[52]);
| O[34] = mul_mad1(O[8], O[59], O[351], O[57]);
| O[34] = mad(O[328], O[61], O[34]);
| O[50] = max(O[34], C[21]);
| O[24] = step(C[22], O[34]);
| O[34] = mul_mad1(O[8], O[23], O[351], O[22]);
| O[34] = mad(O[328], O[51], O[34]);
| O[34] = div_mul(O[34], O[50], O[379]);
| O[34] = mad(O[34], C[6], C[6]);
| O[8] = mul_mad1(O[8], O[60], O[351], O[58]);
| O[328] = mad(O[328], O[35], O[8]);
| O[328] = div_mul(O[328], O[50], O[98]);
| O[328] = mad(O[328], C[7], C[6]);
| O[50] = lerp(C[23], O[34], O[24]);
| O[50] = min(C[23], O[50]);
| O[34] = lerp(C[24], O[34], O[24]);
| O[8] = max(C[24], O[34]);
| O[34] = lerp(C[23], O[328], O[24]);
| O[34] = min(C[23], O[34]);
| O[328] = lerp(C[24], O[328], O[24]);
| O[328] = max(C[24], O[328]);
| outputdata_int32(0, 11, R[0], I[120]);
| O[344] = add(O[348], O[113]);
| O[345] = add(O[349], O[270]);
| O[351] = add(O[350], O[121]);
| O[97] = sub(O[344], O[30]);
| O[343] = sub(O[345], O[25]);
| O[351] = sub(O[351], O[52]);
| O[345] = mul_mad1(O[343], O[59], O[97], O[57]);
| O[345] = mad(O[351], O[61], O[345]);
| O[344] = max(O[345], C[21]);
| O[342] = step(C[22], O[345]);
| O[345] = mul_mad1(O[343], O[23], O[97], O[22]);
| O[345] = mad(O[351], O[51], O[345]);
| O[345] = div_mul(O[345], O[344], O[379]);
| O[345] = mad(O[345], C[6], C[6]);
| O[343] = mul_mad1(O[343], O[60], O[97], O[58]);
| O[351] = mad(O[351], O[35], O[343]);
| O[351] = div_mul(O[351], O[344], O[98]);
| O[351] = mad(O[351], C[7], C[6]);
| O[344] = lerp(O[50], O[345], O[342]);
| O[50] = min(O[50], O[344]);
| O[345] = lerp(O[8], O[345], O[342]);
| O[8] = max(O[8], O[345]);
| O[345] = lerp(O[34], O[351], O[342]);
| O[34] = min(O[34], O[345]);
| O[351] = lerp(O[328], O[351], O[342]);
| O[328] = max(O[328], O[351]);
| O[344] = add(O[348], O[125]);
| O[345] = add(O[349], O[380]);
| O[351] = add(O[350], O[122]);
| O[373] = sub(O[344], O[30]);
| O[345] = mul_mad1(O[343], O[59], O[373], O[57]);
| O[97] = step(C[22], O[345]);
| O[345] = mul_mad1(O[343], O[23], O[373], O[22]);
| O[343] = mul_mad1(O[343], O[60], O[373], O[58]);
| O[344] = lerp(O[50], O[345], O[97]);
| O[345] = lerp(O[8], O[345], O[97]);
| O[345] = lerp(O[34], O[351], O[97]);
| O[351] = lerp(O[328], O[351], O[97]);
| O[344] = add_add(O[348], O[113], O[125]);
| O[345] = add_add(O[349], O[270], O[380]);
| O[351] = add_add(O[350], O[121], O[122]);
| O[547] = sub(O[344], O[30]);
| O[373] = sub(O[345], O[25]);
| O[345] = mul_mad1(O[373], O[59], O[547], O[57]);
| O[343] = max(O[345], C[21]);
| O[344] = step(C[22], O[345]);
| O[345] = mul_mad1(O[373], O[23], O[547], O[22]);
| O[345] = div_mul(O[345], O[343], O[379]);
| O[373] = mul_mad1(O[373], O[60], O[547], O[58]);
| O[351] = mad(O[351], O[35], O[373]);
| O[351] = div_mul(O[351], O[343], O[98]);
| O[343] = lerp(O[50], O[345], O[344]);
| O[50] = min(O[50], O[343]);
| O[345] = lerp(O[8], O[345], O[344]);
| O[345] = lerp(O[34], O[351], O[344]);
| O[351] = lerp(O[328], O[351], O[344]);
| O[343] = add(O[348], O[269]);
| O[345] = add(O[349], O[99]);
| O[351] = add(O[350], O[346]);
| O[659] = sub(O[343], O[30]);
| O[547] = sub(O[345], O[25]);
| O[345] = mul_mad1(O[547], O[59], O[659], O[57]);
| O[373] = max(O[345], C[21]);
| O[343] = step(C[22], O[345]);
| O[345] = mul_mad1(O[547], O[23], O[659], O[22]);
| O[345] = div_mul(O[345], O[373], O[379]);
| O[547] = mul_mad1(O[547], O[60], O[659], O[58]);
| O[351] = mad(O[351], O[35], O[547]);
| O[351] = div_mul(O[351], O[373], O[98]);
| O[373] = lerp(O[50], O[345], O[343]);
| O[50] = min(O[50], O[373]);
| O[345] = lerp(O[8], O[345], O[343]);
| O[345] = lerp(O[34], O[351], O[343]);
| O[351] = lerp(O[328], O[351], O[343]);
| O[373] = add_add(O[348], O[113], O[269]);
| O[345] = add_add(O[349], O[270], O[99]);
| O[351] = add_add(O[350], O[121], O[346]);
| O[374] = sub(O[373], O[30]);
| O[659] = sub(O[345], O[25]);
| O[345] = sub(O[351], O[52]);
| O[351] = mul_mad1(O[659], O[59], O[374], O[57]);
| O[351] = mad(O[345], O[61], O[351]);
| O[547] = max(O[351], C[21]);
| O[351] = step(C[22], O[351]);
| O[373] = mul_mad1(O[659], O[23], O[374], O[22]);
| O[373] = mad(O[345], O[51], O[373]);
| O[373] = div_mul(O[373], O[547], O[379]);
| O[373] = mad(O[373], C[6], C[6]);
| O[659] = mul_mad1(O[659], O[60], O[374], O[58]);
| O[345] = mad(O[345], O[35], O[659]);
| O[345] = div_mul(O[345], O[547], O[98]);
| O[345] = mad(O[345], C[7], C[6]);
| O[547] = lerp(O[50], O[373], O[351]);
| O[50] = min(O[50], O[547]);
| O[373] = lerp(O[8], O[373], O[351]);
| O[8] = max(O[8], O[373]);
| O[373] = lerp(O[34], O[345], O[351]);
| O[34] = min(O[34], O[373]);
| O[345] = lerp(O[328], O[345], O[351]);
| O[328] = max(O[328], O[345]);
| O[547] = add_add(O[348], O[125], O[269]);
| O[373] = add_add(O[349], O[380], O[99]);
| O[345] = add_add(O[350], O[122], O[346]);
| O[548] = sub(O[547], O[30]);
| O[374] = sub(O[373], O[25]);
| O[373] = sub(O[345], O[52]);
| O[345] = mul_mad1(O[374], O[59], O[548], O[57]);
| O[345] = mad(O[373], O[61], O[345]);
| O[659] = max(O[345], C[21]);
| O[345] = step(C[22], O[345]);
| O[547] = mul_mad1(O[374], O[23], O[548], O[22]);
| O[547] = mad(O[373], O[51], O[547]);
| O[547] = div_mul(O[547], O[659], O[379]);
| O[547] = mad(O[547], C[6], C[6]);
| O[374] = mul_mad1(O[374], O[60], O[548], O[58]);
| O[373] = mad(O[373], O[35], O[374]);
| O[373] = div_mul(O[373], O[659], O[98]);
| O[373] = mad(O[373], C[7], C[6]);
| O[659] = lerp(O[50], O[547], O[345]);
| O[50] = min(O[50], O[659]);
| O[547] = lerp(O[8], O[547], O[345]);
| O[8] = max(O[8], O[547]);
| O[547] = lerp(O[34], O[373], O[345]);
| O[34] = min(O[34], O[547]);
| O[373] = lerp(O[328], O[373], O[345]);
| O[328] = max(O[328], O[373]);
| outputdata_float(0, 292, R[0], O[348]);
| outputdata_float(0, 455, R[0], O[348]);
| outputdata_float(0, 566, R[0], O[348]);
| outputdata_float(0, 293, R[0], O[349]);
| outputdata_float(0, 456, R[0], O[349]);
| outputdata_float(0, 567, R[0], O[349]);
| outputdata_float(0, 294, R[0], O[350]);
| outputdata_float(0, 457, R[0], O[350]);
| outputdata_float(0, 568, R[0], O[350]);
| O[348] = add_add(O[348], O[113], O[125]);
| O[349] = add_add(O[349], O[270], O[380]);
| O[350] = add_add(O[350], O[121], O[122]);
| O[348] = add(O[348], O[269]);
| O[349] = add(O[349], O[99]);
| O[350] = add(O[350], O[346]);
| O[269] = sub(O[348], O[30]);
| O[99] = sub(O[349], O[25]);
| O[349] = sub(O[350], O[52]);
| O[350] = mul_mad1(O[99], O[59], O[269], O[57]);
| O[350] = mad(O[349], O[61], O[350]);
| O[348] = max(O[350], C[21]);
| outputdata_int32(0, 8, R[0], I[117]);
| O[346] = step(C[22], O[350]);
| outputdata_int32(0, 9, R[0], I[118]);
| O[350] = mul_mad1(O[99], O[23], O[269], O[22]);
| O[350] = mad(O[349], O[51], O[350]);
| O[350] = div_mul(O[350], O[348], O[379]);
| O[350] = mad(O[350], C[6], C[6]);
| O[99] = mul_mad1(O[99], O[60], O[269], O[58]);
| O[349] = mad(O[349], O[35], O[99]);
| O[349] = div_mul(O[349], O[348], O[98]);
| O[348] = mad(O[349], C[7], C[6]);
| O[349] = sub(C[5], O[24]);
| O[98] = sub(C[5], O[342]);
| O[99] = sub(C[5], O[97]);
| O[349] = add_add(O[349], O[98], O[99]);
| O[98] = sub(C[5], O[344]);
| O[99] = sub(C[5], O[343]);
| O[98] = sub(C[5], O[351]);
| O[99] = sub(C[5], O[345]);
| O[98] = sub(C[5], O[346]);
| O[349] = add(O[349], O[98]);
| O[349] = step(C[6], O[349]);
| O[24] = add_add(O[24], O[342], O[97]);
| O[24] = add_add(O[24], O[344], O[343]);
| O[24] = add_add(O[24], O[351], O[345]);
| O[24] = add(O[24], O[346]);
| O[351] = step(C[6], O[24]);
| O[24] = lerp(O[50], O[350], O[346]);
| O[50] = min(O[50], O[24]);
| O[50] = lerp(O[50], C[0], O[349]);
| O[50] = clamp(O[50], C[0], C[5]);
| O[24] = mul(O[50], O[351]);
| O[350] = lerp(O[8], O[350], O[346]);
| O[8] = max(O[8], O[350]);
| O[8] = lerp(O[8], C[5], O[349]);
| O[8] = clamp(O[8], C[0], C[5]);
| O[350] = mul(O[8], O[351]);
| O[8] = lerp(O[34], O[348], O[346]);
| O[34] = min(O[34], O[8]);
| O[34] = lerp(O[34], C[0], O[349]);
| O[34] = clamp(O[34], C[0], C[5]);
| O[8] = mul(O[34], O[351]);
| O[348] = lerp(O[328], O[348], O[346]);
| O[328] = max(O[328], O[348]);
| O[328] = lerp(O[328], C[5], O[349]);
| O[328] = clamp(O[328], C[0], C[5]);
| O[349] = mul(O[328], O[351]);
| O[346] = sub(O[350], O[24]);
| O[348] = sub(O[349], O[8]);
| O[328] = mul(O[346], O[347]);
| outputdata_float(0, 216, R[0], O[346]);
| outputdata_float(0, 298, R[0], O[347]);
| O[346] = f2i(O[328]);
| O[328] = mul(O[348], O[36]);
| outputdata_float(0, 217, R[0], O[348]);
| outputdata_float(0, 299, R[0], O[36]);
| O[347] = f2i(O[328]);
| O[328] = i2f(O[346]);
| O[328] = max(O[328], C[5]);
| O[328] = i2f_div0(I[154], O[328]);
| O[36] = i2f(O[347]);
| O[36] = max(O[36], C[5]);
| O[36] = i2f_div0(I[155], O[36]);
| O[328] = min(O[328], O[36]);
| O[328] = min(O[328], C[5]);
| O[328] = mul(O[328], C[23]);
| O[36] = i2f_mul(O[346], O[328]);
| O[36] = max(O[36], C[0]);
| O[36] = ceil(O[36]);
| O[36] = f2i(O[36]);
| O[36] = clampi(O[36], C[13], I[154]);
| O[328] = i2f_mul(O[347], O[328]);
| O[328] = max(O[328], C[0]);
| O[328] = ceil(O[328]);
| O[328] = f2i(O[328]);
| O[328] = clampi(O[328], C[13], I[155]);
| outputdata_int32(0, 5, R[0], I[114]);
| O[345] = maxi(O[36], O[328]);
| O[348] = i2f(O[345]);
| O[348] = max(O[348], C[5]);
| O[348] = div(C[25], O[348]);
| O[345] = i2f(O[345]);
| O[345] = add(O[345], C[6]);
| O[345] = step(O[345], C[25]);
| outputdata_int32(0, 12, R[0], I[121]);
| O[348] = lerp(C[5], O[348], O[345]);
| O[36] = i2f_mul(O[36], O[348]);
| O[36] = mini(O[36], I[154]);
| O[328] = i2f_mul(O[328], O[348]);
| O[328] = mini(O[328], I[155]);
| O[53] = mul(O[53], C[26]);
| outputdata_float(0, 113, R[0], I[14]);
| O[348] = i2f(O[346]);
| outputdata_int32(0, 72, R[0], O[346]);
| O[348] = i2f_div0(O[36], O[348]);
| outputdata_float(0, 258, R[0], O[348]);
| O[348] = i2f(O[347]);
| outputdata_int32(0, 71, R[0], O[347]);
| O[348] = i2f_div0(O[328], O[348]);
| outputdata_float(0, 259, R[0], O[348]);
| outputdata_float(0, 214, R[0], O[24]);
| O[348] = mul_mul(O[53], O[21], O[54]);
| O[348] = mul(O[348], C[23]);
| O[24] = sub_mul(O[350], O[24], O[348]);
| outputdata_float(0, 215, R[0], O[8]);
| O[348] = mul_mul(O[53], O[21], C[23]);
| O[8] = sub_mul(O[349], O[8], O[348]);
| O[34] = mad_mul(O[34], O[351], O[349], C[6]);
| O[34] = neg(O[34]);
| outputdata_int32(0, 10, R[0], I[119]);
| O[34] = mad_mul(O[34], C[23], C[5], O[53]);
| O[34] = mul(O[34], O[21]);
| O[50] = mad_sub0(O[50], O[351], O[350], C[5]);
| O[50] = mul_mul(O[50], O[53], O[21]);
| O[50] = mul(O[50], O[54]);
| O[57] = mad_mad0(O[57], O[53], O[30], O[22], O[50]);
| O[59] = mad_mad0(O[59], O[53], O[25], O[23], O[50]);
| O[61] = mad_mad0(O[61], O[53], O[52], O[51], O[50]);
| O[51] = mad(O[58], O[34], O[57]);
| O[52] = mad(O[60], O[34], O[59]);
| O[53] = mad(O[35], O[34], O[61]);
| outputdata_int32(0, 51, R[0], I[154]);
| outputdata_int32(0, 52, R[0], I[155]);
| outputdata_int32(0, 53, R[0], O[36]);
| outputdata_int32(0, 54, R[0], O[328]);
| O[35] = i2f(I[154]);
| O[36] = i2f_div0(O[36], O[35]);
| outputdata_float(0, 296, R[0], O[36]);
| O[36] = i2f(I[155]);
| O[328] = i2f_div0(O[328], O[36]);
| outputdata_float(0, 297, R[0], O[328]);
| external_func_call(C[19]R[65535], R[65535], R[65535], R[65535], R[65535], R[65535], O[60], O[61], O[328], O[34], O[35], O[36], R[65535], R[65535], R[65535]);
| outputdata_float(0, 112, R[0], I[13]);
| O[59] = mul_mad1(O[35], O[35], O[34], O[34]);
| O[59] = mad(O[36], O[36], O[59]);
| O[59] = rsq(O[59]);
| O[34] = mul(O[34], O[59]);
| O[35] = mul(O[35], O[59]);
| O[36] = mul(O[36], O[59]);
| O[59] = neg(O[60]);
| O[60] = neg(O[61]);
| O[328] = neg(O[328]);
| O[61] = mul_mad1(O[60], O[60], O[59], O[59]);
| O[61] = mad(O[328], O[328], O[61]);
| O[61] = rsq(O[61]);
| O[57] = mul(O[59], O[61]);
| O[58] = mul(O[60], O[61]);
| O[59] = mul(O[328], O[61]);
| O[328] = mul(O[36], O[58]);
| O[60] = mul_sub0(O[35], O[59], O[328]);
| O[328] = mul(O[34], O[59]);
| O[61] = mul_sub0(O[36], O[57], O[328]);
| O[328] = mul(O[35], O[57]);
| O[328] = mul_sub0(O[34], O[58], O[328]);
| O[50] = mul_mad1(O[61], O[61], O[60], O[60]);
| O[50] = mad(O[328], O[328], O[50]);
| O[50] = rsq(O[50]);
| O[60] = mul(O[60], O[50]);
| O[61] = mul(O[61], O[50]);
| O[328] = mul(O[328], O[50]);
| O[22] = mul_mad1(C[7], O[24], C[7], C[0]);
| O[21] = mul_mad1(C[7], C[0], C[7], O[8]);
| O[50] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[30] = mul_mad1(C[7], C[0], C[7], C[0]);
| outputdata_float(0, 6, R[0], I[6]);
| O[23] = mul(O[24], C[8]);
| O[351] = mul(O[24], C[27]);
| O[25] = mul(O[8], C[28]);
| O[54] = mul(O[8], C[8]);
| O[346] = mul_mad1(O[22], C[8], O[21], C[28]);
| O[344] = mul_mad1(O[22], C[27], O[21], C[8]);
| O[50] = add_add(C[7], O[50], C[0]);
| O[345] = add_add(C[5], O[30], C[0]);
| O[21] = mul_mad1(O[23], O[34], O[351], O[57]);
| O[22] = mul_mad1(O[23], O[35], O[351], O[58]);
| O[30] = mul_mad1(O[23], O[36], O[351], O[59]);
| O[23] = mul_mad1(O[23], C[0], O[351], C[0]);
| O[347] = mad_mad0(C[0], O[60], O[21], C[0], C[0]);
| O[348] = mad_mad0(C[0], O[61], O[22], C[0], C[0]);
| O[349] = mad_mad0(C[0], O[328], O[30], C[0], C[0]);
| O[350] = mad_mad0(C[0], C[0], O[23], C[0], C[5]);
| O[22] = mul_mad1(O[25], O[34], O[54], O[57]);
| O[30] = mul_mad1(O[25], O[35], O[54], O[58]);
| O[23] = mul_mad1(O[25], O[36], O[54], O[59]);
| O[25] = mul_mad1(O[25], C[0], O[54], C[0]);
| O[351] = mad_mad0(C[0], O[60], O[22], C[0], C[0]);
| O[21] = mad_mad0(C[0], O[61], O[30], C[0], C[0]);
| O[54] = mad_mad0(C[0], O[328], O[23], C[0], C[0]);
| O[22] = mad_mad0(C[0], C[0], O[25], C[0], C[5]);
| O[30] = mul_mad1(O[346], O[34], O[344], O[57]);
| O[23] = mul_mad1(O[346], O[35], O[344], O[58]);
| O[25] = mul_mad1(O[346], O[36], O[344], O[59]);
| O[346] = mul_mad1(O[346], C[0], O[344], C[0]);
| O[30] = mad_mad0(O[50], O[60], O[30], O[345], C[0]);
| O[23] = mad_mad0(O[50], O[61], O[23], O[345], C[0]);
| O[25] = mad_mad0(O[50], O[328], O[25], O[345], C[0]);
| O[50] = mad_mad0(O[50], C[0], O[346], O[345], C[5]);
| O[347] = mad(O[350], O[51], O[347]);
| outputdata_float(0, 60, R[0], O[347]);
| O[348] = add_mad1(O[348], C[0], O[350], O[52]);
| outputdata_float(0, 61, R[0], O[348]);
| O[349] = add_mad1(O[349], C[0], O[350], O[53]);
| outputdata_float(0, 62, R[0], O[349]);
| O[350] = mad(O[350], C[5], C[0]);
| outputdata_float(0, 63, R[0], O[350]);
| O[351] = mad(O[22], O[51], O[351]);
| outputdata_float(0, 64, R[0], O[351]);
| O[21] = add_mad1(O[21], C[0], O[22], O[52]);
| outputdata_float(0, 65, R[0], O[21]);
| O[54] = add_mad1(O[54], C[0], O[22], O[53]);
| outputdata_float(0, 66, R[0], O[54]);
| O[22] = mad(O[22], C[5], C[0]);
| outputdata_float(0, 67, R[0], O[22]);
| O[22] = mad(C[0], O[51], O[60]);
| outputdata_float(0, 68, R[0], O[22]);
| O[22] = add_mad1(O[61], C[0], C[0], O[52]);
| outputdata_float(0, 69, R[0], O[22]);
| O[22] = add_mad1(O[328], C[0], C[0], O[53]);
| outputdata_float(0, 70, R[0], O[22]);
| O[22] = mad(C[0], C[5], C[0]);
| outputdata_float(0, 71, R[0], O[22]);
| O[30] = mad(O[50], O[51], O[30]);
| outputdata_float(0, 72, R[0], O[30]);
| O[23] = add_mad1(O[23], C[0], O[50], O[52]);
| outputdata_float(0, 73, R[0], O[23]);
| O[25] = add_mad1(O[25], C[0], O[50], O[53]);
| outputdata_float(0, 74, R[0], O[25]);
| O[50] = mad(O[50], C[5], C[0]);
| outputdata_float(0, 75, R[0], O[50]);
| O[23] = neg(O[51]);
| O[30] = neg(O[52]);
| O[50] = neg(O[53]);
| O[22] = rcp(O[24]);
| outputdata_float(0, 58, R[0], O[24]);
| outputdata_float(0, 256, R[0], O[24]);
| O[25] = rcp(O[8]);
| outputdata_float(0, 59, R[0], O[8]);
| outputdata_float(0, 257, R[0], O[8]);
| O[21] = mul_mad1(O[23], O[34], O[30], O[35]);
| O[54] = mul_mad1(O[23], O[57], O[30], O[58]);
| O[24] = mul_mad1(O[23], O[60], O[30], O[61]);
| O[8] = mul_mad1(O[23], C[0], O[30], C[0]);
| O[349] = mad_add(O[50], O[36], O[21], C[0]);
| O[347] = mad_add(O[50], O[59], O[54], C[0]);
| O[24] = mad_add(O[50], O[328], O[24], C[0]);
| O[8] = mad_add(O[50], C[0], O[8], C[5]);
| O[351] = mul_mad1(O[34], C[8], O[57], C[27]);
| O[348] = mul_mad1(O[34], C[28], O[57], C[8]);
| O[21] = mul_mad1(O[35], C[8], O[58], C[27]);
| O[350] = mul_mad1(O[35], C[28], O[58], C[8]);
| O[54] = mul_mad1(O[36], C[8], O[59], C[27]);
| O[98] = mul_mad1(O[36], C[28], O[59], C[8]);
| O[97] = mul_mad1(O[349], C[8], O[347], C[27]);
| O[99] = mul_mad1(O[349], C[28], O[347], C[8]);
| O[342] = mul_mad1(O[351], O[22], O[348], C[0]);
| O[343] = mul_mad1(O[351], C[0], O[348], O[25]);
| O[349] = mul_mad1(O[351], C[0], O[348], C[0]);
| O[351] = mul_mad1(O[351], C[0], O[348], C[0]);
| O[344] = add_add(O[60], C[0], O[349]);
| O[345] = add_add(C[0], C[0], O[351]);
| O[346] = mul_mad1(O[21], O[22], O[350], C[0]);
| O[347] = mul_mad1(O[21], C[0], O[350], O[25]);
| O[351] = mul_mad1(O[21], C[0], O[350], C[0]);
| O[21] = mul_mad1(O[21], C[0], O[350], C[0]);
| O[348] = add_add(O[61], C[0], O[351]);
| O[349] = add_add(C[0], C[0], O[21]);
| O[350] = mul_mad1(O[54], O[22], O[98], C[0]);
| O[351] = mul_mad1(O[54], C[0], O[98], O[25]);
| O[21] = mul_mad1(O[54], C[0], O[98], C[0]);
| O[54] = mul_mad1(O[54], C[0], O[98], C[0]);
| O[21] = add_add(O[328], C[0], O[21]);
| O[54] = add_add(C[0], C[0], O[54]);
| O[22] = mul_mad1(O[97], O[22], O[99], C[0]);
| O[25] = mul_mad1(O[97], C[0], O[99], O[25]);
| O[98] = mul_mad1(O[97], C[0], O[99], C[0]);
| O[97] = mul_mad1(O[97], C[0], O[99], C[0]);
| O[24] = add_add(O[24], C[0], O[98]);
| O[8] = add_add(O[8], C[0], O[97]);
| O[342] = mad(O[345], C[6], O[342]);
| outputdata_float(0, 92, R[0], O[342]);
| outputdata_float(0, 261, R[0], O[342]);
| O[343] = add_mad1(O[343], C[0], O[345], C[6]);
| outputdata_float(0, 93, R[0], O[343]);
| outputdata_float(0, 262, R[0], O[343]);
| O[344] = add_mad1(O[344], C[0], O[345], C[6]);
| outputdata_float(0, 94, R[0], O[344]);
| outputdata_float(0, 263, R[0], O[344]);
| O[345] = add(O[345], C[0]);
| outputdata_float(0, 95, R[0], O[345]);
| outputdata_float(0, 264, R[0], O[345]);
| O[346] = mad(O[349], C[6], O[346]);
| outputdata_float(0, 96, R[0], O[346]);
| outputdata_float(0, 265, R[0], O[346]);
| O[347] = add_mad1(O[347], C[0], O[349], C[6]);
| outputdata_float(0, 97, R[0], O[347]);
| outputdata_float(0, 266, R[0], O[347]);
| O[348] = add_mad1(O[348], C[0], O[349], C[6]);
| outputdata_float(0, 98, R[0], O[348]);
| outputdata_float(0, 267, R[0], O[348]);
| O[349] = add(O[349], C[0]);
| outputdata_float(0, 99, R[0], O[349]);
| outputdata_float(0, 268, R[0], O[349]);
| O[350] = mad(O[54], C[6], O[350]);
| outputdata_float(0, 100, R[0], O[350]);
| outputdata_float(0, 269, R[0], O[350]);
| O[351] = add_mad1(O[351], C[0], O[54], C[6]);
| outputdata_float(0, 101, R[0], O[351]);
| outputdata_float(0, 270, R[0], O[351]);
| O[21] = add_mad1(O[21], C[0], O[54], C[6]);
| outputdata_float(0, 102, R[0], O[21]);
| outputdata_float(0, 271, R[0], O[21]);
| O[54] = add(O[54], C[0]);
| outputdata_float(0, 103, R[0], O[54]);
| outputdata_float(0, 272, R[0], O[54]);
| O[22] = mad(O[8], C[6], O[22]);
| outputdata_float(0, 104, R[0], O[22]);
| outputdata_float(0, 273, R[0], O[22]);
| O[25] = add_mad1(O[25], C[0], O[8], C[6]);
| outputdata_float(0, 105, R[0], O[25]);
| outputdata_float(0, 274, R[0], O[25]);
| O[24] = add_mad1(O[24], C[0], O[8], C[6]);
| outputdata_float(0, 5, R[0], I[5]);
| outputdata_float(0, 11, R[0], C[6]);
| outputdata_float(0, 12, R[0], C[6]);
| outputdata_float(0, 106, R[0], O[24]);
| outputdata_float(0, 177, R[0], C[6]);
| outputdata_float(0, 275, R[0], O[24]);
| outputdata_float(0, 378, R[0], C[6]);
| outputdata_float(0, 391, R[0], C[6]);
| outputdata_float(0, 392, R[0], C[6]);
| outputdata_float(0, 393, R[0], C[6]);
| outputdata_float(0, 519, R[0], C[6]);
| outputdata_float(0, 532, R[0], C[6]);
| outputdata_float(0, 533, R[0], C[6]);
| outputdata_float(0, 534, R[0], C[6]);
| O[8] = add(O[8], C[0]);
| outputdata_float(0, 107, R[0], O[8]);
| outputdata_float(0, 276, R[0], O[8]);
| O[24] = mul_mad1(O[23], O[34], O[30], O[35]);
| O[25] = mul_mad1(O[23], O[57], O[30], O[58]);
| O[8] = mul_mad1(O[23], O[60], O[30], O[61]);
| O[23] = mul_mad1(O[23], C[0], O[30], C[0]);
| O[24] = mad_add(O[50], O[36], O[24], C[0]);
| O[25] = mad_add(O[50], O[59], O[25], C[0]);
| O[8] = mad_add(O[50], O[328], O[8], C[0]);
| O[50] = mad_add(O[50], C[0], O[23], C[5]);
| O[23] = mul_mad1(O[34], C[8], O[57], C[27]);
| outputdata_float(0, 76, R[0], O[23]);
| O[23] = mul_mad1(O[34], C[28], O[57], C[8]);
| outputdata_float(0, 77, R[0], O[23]);
| O[23] = add(O[60], C[0]);
| outputdata_float(0, 78, R[0], O[23]);
| O[23] = add(C[0], C[0]);
| outputdata_float(0, 79, R[0], O[23]);
| O[23] = mul_mad1(O[35], C[8], O[58], C[27]);
| outputdata_float(0, 80, R[0], O[23]);
| O[23] = mul_mad1(O[35], C[28], O[58], C[8]);
| outputdata_float(0, 81, R[0], O[23]);
| O[23] = add(O[61], C[0]);
| outputdata_float(0, 82, R[0], O[23]);
| outputdata_float(0, 83, R[0], O[23]);
| O[23] = mul_mad1(O[36], C[8], O[59], C[27]);
| outputdata_float(0, 84, R[0], O[23]);
| O[23] = mul_mad1(O[36], C[28], O[59], C[8]);
| outputdata_float(0, 85, R[0], O[23]);
| O[23] = add(O[328], C[0]);
| outputdata_float(0, 86, R[0], O[23]);
| outputdata_float(0, 87, R[0], O[23]);
| O[23] = mul_mad1(O[24], C[8], O[25], C[27]);
| outputdata_float(0, 88, R[0], O[23]);
| O[24] = mul_mad1(O[24], C[28], O[25], C[8]);
| outputdata_float(0, 89, R[0], O[24]);
| outputdata_float(0, 90, R[0], O[8]);
| O[50] = add(O[50], C[0]);
| outputdata_float(0, 91, R[0], O[50]);
| O[22] = mad(C[0], O[51], O[34]);
| O[23] = add_mad1(O[35], C[0], C[0], O[52]);
| O[24] = add_mad1(O[36], C[0], C[0], O[53]);
| O[54] = mad(C[0], O[51], O[57]);
| O[30] = add_mad1(O[58], C[0], C[0], O[52]);
| O[25] = add_mad1(O[59], C[0], C[0], O[53]);
| O[50] = mad(C[0], O[51], O[60]);
| outputdata_float(0, 21, R[0], O[50]);
| O[50] = add_mad1(O[61], C[0], C[0], O[52]);
| outputdata_float(0, 22, R[0], O[50]);
| O[50] = add_mad1(O[328], C[0], C[0], O[53]);
| outputdata_float(0, 23, R[0], O[50]);
| O[50] = mad(C[0], C[5], C[0]);
| outputdata_float(0, 24, R[0], O[50]);
| O[8] = mul_mad1(C[8], O[22], C[27], O[54]);
| outputdata_float(0, 13, R[0], O[8]);
| O[8] = mul_mad1(C[8], O[23], C[27], O[30]);
| outputdata_float(0, 14, R[0], O[8]);
| O[8] = mul_mad1(C[8], O[24], C[27], O[25]);
| outputdata_float(0, 15, R[0], O[8]);
| O[8] = mad(C[0], C[5], C[0]);
| O[21] = mul_mad1(C[8], O[50], C[27], O[8]);
| outputdata_float(0, 16, R[0], O[21]);
| outputdata_float(0, 114, R[0], I[15]);
| outputdata_float(0, 115, R[0], I[16]);
| O[22] = mul_mad1(C[28], O[22], C[8], O[54]);
| outputdata_float(0, 17, R[0], O[22]);
| O[23] = mul_mad1(C[28], O[23], C[8], O[30]);
| outputdata_float(0, 18, R[0], O[23]);
| O[24] = mul_mad1(C[28], O[24], C[8], O[25]);
| outputdata_float(0, 19, R[0], O[24]);
| O[50] = mul_mad1(C[28], O[50], C[8], O[8]);
| outputdata_float(0, 7, R[0], I[7]);
| outputdata_float(0, 20, R[0], O[50]);
| O[50] = mad(C[5], O[51], C[0]);
| outputdata_float(0, 25, R[0], O[50]);
| outputdata_float(0, 49, R[0], O[51]);
| outputdata_float(0, 277, R[0], O[51]);
| O[51] = add_mad1(C[0], C[0], C[5], O[52]);
| outputdata_float(0, 26, R[0], O[51]);
| outputdata_float(0, 50, R[0], O[52]);
| outputdata_float(0, 278, R[0], O[52]);
| O[52] = add_mad1(C[0], C[0], C[5], O[53]);
| outputdata_float(0, 27, R[0], O[52]);
| outputdata_float(0, 51, R[0], O[53]);
| outputdata_float(0, 279, R[0], O[53]);
| O[53] = mad(C[5], C[5], C[0]);
| outputdata_float(0, 28, R[0], O[53]);
| external_func_call(O[34], O[35], O[36], C[0], O[57], O[58], O[59], C[0], O[60], O[61], O[328], C[0], C[0], C[0], C[0], C[5]O[50], O[51], O[52], O[53]);
| outputdata_float(0, 32, R[0], C[0]);
| outputdata_float(0, 33, R[0], O[57]);
| outputdata_float(0, 34, R[0], O[58]);
| outputdata_float(0, 35, R[0], O[59]);
| outputdata_float(0, 36, R[0], C[0]);
| outputdata_float(0, 37, R[0], O[60]);
| outputdata_float(0, 38, R[0], O[61]);
| outputdata_float(0, 39, R[0], O[328]);
| outputdata_float(0, 40, R[0], C[0]);
| outputdata_float(0, 41, R[0], C[0]);
| outputdata_float(0, 42, R[0], C[0]);
| outputdata_float(0, 43, R[0], C[0]);
| outputdata_float(0, 45, R[0], O[50]);
| outputdata_float(0, 46, R[0], O[51]);
| outputdata_float(0, 47, R[0], O[52]);
| outputdata_float(0, 48, R[0], O[53]);
| outputdata_float(0, 52, R[0], O[57]);
| outputdata_float(0, 53, R[0], O[58]);
| outputdata_float(0, 54, R[0], O[59]);
| outputdata_float(0, 55, R[0], O[60]);
| outputdata_float(0, 56, R[0], O[61]);
| outputdata_float(0, 57, R[0], O[328]);
| outputdata_float(0, 122, R[0], C[0]);
| outputdata_float(0, 175, R[0], C[0]);
| outputdata_float(0, 176, R[0], C[0]);
| outputdata_float(0, 181, R[0], C[0]);
| outputdata_float(0, 185, R[0], C[0]);
| outputdata_float(0, 189, R[0], C[0]);
| outputdata_float(0, 197, R[0], C[0]);
| outputdata_float(0, 201, R[0], C[0]);
| outputdata_float(0, 205, R[0], C[0]);
| outputdata_float(0, 211, R[0], C[0]);
| O[328] = clamp(I[185], C[0], C[10]);
| outputdata_float(0, 4, R[0], I[4]);
| outputdata_float(0, 29, R[0], O[34]);
| outputdata_float(0, 30, R[0], O[35]);
| outputdata_float(0, 31, R[0], O[36]);
| outputdata_float(0, 44, R[0], C[5]);
| outputdata_float(0, 255, R[0], O[328]);
| outputdata_float(0, 360, R[0], C[0]);
| outputdata_float(0, 363, R[0], C[0]);
| outputdata_float(0, 376, R[0], C[0]);
| outputdata_float(0, 377, R[0], C[0]);
| outputdata_float(0, 380, R[0], C[0]);
| outputdata_float(0, 381, R[0], C[0]);
| outputdata_float(0, 382, R[0], C[0]);
| outputdata_float(0, 383, R[0], C[0]);
| outputdata_float(0, 385, R[0], C[0]);
| outputdata_float(0, 386, R[0], C[0]);
| outputdata_float(0, 387, R[0], C[0]);
| outputdata_float(0, 388, R[0], C[0]);
| outputdata_float(0, 390, R[0], C[0]);
| outputdata_float(0, 394, R[0], C[5]);
| outputdata_float(0, 398, R[0], C[0]);
| outputdata_float(0, 402, R[0], C[0]);
| outputdata_float(0, 406, R[0], C[0]);
| outputdata_float(0, 414, R[0], C[0]);
| outputdata_float(0, 418, R[0], C[0]);
| outputdata_float(0, 422, R[0], C[0]);
| outputdata_float(0, 428, R[0], C[0]);
| outputdata_float(0, 429, R[0], C[0]);
| outputdata_float(0, 430, R[0], C[0]);
| outputdata_float(0, 431, R[0], C[0]);
| outputdata_float(0, 433, R[0], C[0]);
| outputdata_float(0, 434, R[0], C[0]);
| outputdata_float(0, 435, R[0], C[0]);
| outputdata_float(0, 436, R[0], C[0]);
| outputdata_float(0, 438, R[0], C[0]);
| outputdata_float(0, 517, R[0], C[0]);
| outputdata_float(0, 518, R[0], C[0]);
| outputdata_float(0, 521, R[0], C[0]);
| outputdata_float(0, 522, R[0], C[0]);
| outputdata_float(0, 523, R[0], C[0]);
| outputdata_float(0, 524, R[0], C[0]);
| outputdata_float(0, 526, R[0], C[0]);
| outputdata_float(0, 527, R[0], C[0]);
| outputdata_float(0, 528, R[0], C[0]);
| outputdata_float(0, 529, R[0], C[0]);
| outputdata_float(0, 531, R[0], C[0]);
| outputdata_float(0, 535, R[0], C[5]);
| outputdata_float(0, 539, R[0], C[0]);
| outputdata_float(0, 540, R[0], C[0]);
| outputdata_float(0, 541, R[0], C[0]);
| outputdata_float(0, 542, R[0], C[0]);
| outputdata_float(0, 544, R[0], C[0]);
| outputdata_float(0, 545, R[0], C[0]);
| outputdata_float(0, 546, R[0], C[0]);
| outputdata_float(0, 547, R[0], C[0]);
| outputdata_float(0, 549, R[0], C[0]);
| outputdata_float(0, 116, R[0], I[17]);
| outputdata_float(0, 123, R[0], I[22]);
| outputdata_float(0, 124, R[0], I[23]);
| outputdata_float(0, 125, R[0], I[24]);
| outputdata_float(0, 126, R[0], I[25]);
| outputdata_float(0, 127, R[0], I[26]);
| outputdata_float(0, 128, R[0], I[27]);
| outputdata_float(0, 129, R[0], I[28]);
| outputdata_float(0, 130, R[0], I[29]);
| outputdata_float(0, 131, R[0], I[30]);
| outputdata_float(0, 132, R[0], I[31]);
| outputdata_float(0, 133, R[0], I[32]);
| outputdata_float(0, 134, R[0], I[33]);
| outputdata_float(0, 135, R[0], I[34]);
| outputdata_float(0, 136, R[0], I[35]);
| outputdata_float(0, 137, R[0], I[36]);
| outputdata_float(0, 138, R[0], I[37]);
| outputdata_float(0, 139, R[0], I[38]);
| outputdata_float(0, 140, R[0], I[39]);
| outputdata_float(0, 141, R[0], I[40]);
| outputdata_float(0, 142, R[0], I[41]);
| outputdata_float(0, 143, R[0], I[42]);
| outputdata_float(0, 144, R[0], I[43]);
| outputdata_float(0, 145, R[0], I[44]);
| outputdata_float(0, 146, R[0], I[45]);
| outputdata_float(0, 147, R[0], I[46]);
| outputdata_float(0, 148, R[0], I[47]);
| outputdata_float(0, 149, R[0], I[48]);
| outputdata_float(0, 150, R[0], I[49]);
| outputdata_float(0, 151, R[0], I[50]);
| outputdata_float(0, 152, R[0], I[51]);
| outputdata_float(0, 153, R[0], I[52]);
| outputdata_float(0, 154, R[0], I[53]);
| outputdata_float(0, 155, R[0], I[54]);
| outputdata_float(0, 156, R[0], I[55]);
| outputdata_float(0, 157, R[0], I[56]);
| outputdata_float(0, 158, R[0], I[57]);
| outputdata_float(0, 159, R[0], I[58]);
| outputdata_float(0, 160, R[0], I[59]);
| outputdata_float(0, 161, R[0], I[60]);
| outputdata_float(0, 162, R[0], I[61]);
| outputdata_float(0, 163, R[0], I[62]);
| outputdata_float(0, 164, R[0], I[63]);
| outputdata_float(0, 213, R[0], I[72]);
| outputdata_float(0, 218, R[0], I[64]);
| outputdata_float(0, 219, R[0], I[65]);
| outputdata_float(0, 220, R[0], I[66]);
| outputdata_float(0, 221, R[0], I[67]);
| outputdata_float(0, 222, R[0], I[68]);
| outputdata_float(0, 223, R[0], I[69]);
| outputdata_float(0, 224, R[0], I[70]);
| outputdata_float(0, 226, R[0], I[102]);
| outputdata_float(0, 227, R[0], I[103]);
| outputdata_float(0, 228, R[0], I[73]);
| outputdata_float(0, 229, R[0], I[74]);
| outputdata_float(0, 230, R[0], I[75]);
| outputdata_float(0, 231, R[0], I[76]);
| outputdata_float(0, 232, R[0], I[77]);
| outputdata_float(0, 233, R[0], I[78]);
| outputdata_float(0, 234, R[0], I[79]);
| outputdata_float(0, 235, R[0], I[80]);
| outputdata_float(0, 236, R[0], I[81]);
| outputdata_float(0, 237, R[0], I[82]);
| outputdata_float(0, 238, R[0], I[83]);
| outputdata_float(0, 239, R[0], I[84]);
| outputdata_float(0, 240, R[0], I[85]);
| outputdata_float(0, 241, R[0], I[86]);
| outputdata_float(0, 242, R[0], I[87]);
| outputdata_float(0, 243, R[0], I[88]);
| outputdata_float(0, 244, R[0], I[89]);
| outputdata_float(0, 245, R[0], I[90]);
| outputdata_float(0, 246, R[0], I[91]);
| outputdata_float(0, 247, R[0], I[92]);
| outputdata_float(0, 248, R[0], I[93]);
| outputdata_float(0, 249, R[0], I[94]);
| outputdata_float(0, 250, R[0], I[95]);
| outputdata_float(0, 251, R[0], I[96]);
| outputdata_float(0, 252, R[0], I[97]);
| outputdata_float(0, 253, R[0], I[98]);
| outputdata_float(0, 254, R[0], I[99]);
| outputdata_float(0, 260, R[0], I[100]);
| outputdata_float(0, 302, R[0], I[102]);
| outputdata_float(0, 303, R[0], I[103]);
| outputdata_int32(0, 13, R[0], I[122]);
| outputdata_int32(0, 14, R[0], I[123]);
| outputdata_int32(0, 20, R[0], I[124]);
| outputdata_int32(0, 21, R[0], I[125]);
| outputdata_int32(0, 23, R[0], I[127]);
| outputdata_int32(0, 25, R[0], I[129]);
| outputdata_int32(0, 26, R[0], I[130]);
| outputdata_int32(0, 27, R[0], I[131]);
| outputdata_int32(0, 28, R[0], I[132]);
| outputdata_int32(0, 29, R[0], I[133]);
| outputdata_int32(0, 30, R[0], I[134]);
| outputdata_int32(0, 31, R[0], I[135]);
| outputdata_int32(0, 32, R[0], I[136]);
| outputdata_int32(0, 33, R[0], I[137]);
| outputdata_int32(0, 34, R[0], I[138]);
| outputdata_int32(0, 35, R[0], I[139]);
| outputdata_int32(0, 36, R[0], I[140]);
| outputdata_int32(0, 37, R[0], I[141]);
| outputdata_int32(0, 38, R[0], I[142]);
| outputdata_int32(0, 39, R[0], I[143]);
| outputdata_int32(0, 40, R[0], I[144]);
| outputdata_int32(0, 41, R[0], I[145]);
| outputdata_int32(0, 42, R[0], I[146]);
| outputdata_int32(0, 43, R[0], I[147]);
| outputdata_int32(0, 44, R[0], I[148]);
| outputdata_int32(0, 45, R[0], I[149]);
| outputdata_int32(0, 47, R[0], I[150]);
| outputdata_int32(0, 49, R[0], I[152]);
| outputdata_int32(0, 55, R[0], I[156]);
| outputdata_int32(0, 56, R[0], I[157]);
| outputdata_int32(0, 57, R[0], I[158]);
| outputdata_int32(0, 58, R[0], I[159]);
| outputdata_int32(0, 59, R[0], I[160]);
| outputdata_int32(0, 60, R[0], I[161]);
| outputdata_int32(0, 61, R[0], I[162]);
| outputdata_int32(0, 62, R[0], I[163]);
| outputdata_int32(0, 63, R[0], I[164]);
| outputdata_int32(0, 64, R[0], I[165]);
| outputdata_int32(0, 65, R[0], I[166]);
| outputdata_int32(0, 66, R[0], I[167]);
| outputdata_int32(0, 67, R[0], I[168]);
| outputdata_int32(0, 68, R[0], I[169]);
| outputdata_int32(0, 69, R[0], I[170]);
| outputdata_int32(0, 70, R[0], I[171]);
| outputdata_int32(0, 73, R[0], I[172]);
| outputdata_int32(0, 74, R[0], I[173]);
| outputdata_int32(0, 75, R[0], I[174]);
| outputdata_int32(0, 76, R[0], I[175]);
| outputdata_int32(0, 77, R[0], I[176]);
| outputdata_int32(0, 78, R[0], I[177]);
| outputdata_int32(0, 79, R[0], I[178]);
| outputdata_int32(0, 80, R[0], I[179]);
mzxΩ¶O|Hì•èö;ã
Y*;∂∞Ó$K•∞ú>Ò
I¬‰ëgx“Jà;\
@å;w¡@Yá
E’)Q;‹
&oÇ;¨1EKµ
;Ø‹6‘ˇE∞ÔÎo±÷I»‹
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„E‹
åEì]∏;>Tõﬁ‹
M•kóÏ;Kêã
hπ÷);‹
;@/—)DºúIvÄpjÏ‹
xì;ö©\?Nñ∫/hÑ
|OΩ;/ãÉ·Â÷‹
;HÙg]≈
Ò´j¸‡KÄ;ﬁ’
Ø;_}D£B
RB∞öSÌÿOåÉ;ç@8U]‹
ı≥Ûü¸;%Eº<=]˜›≤‹
bÔ«Ÿzó…I§T•ï;
õ;4”$6
‰§C∆;ºªHáU·Ñ‹‹
„“4Ç˝ußK£;å
MO;#ÂÌ≠œ
¡É*ûóˆ•Ä.;ƒ—


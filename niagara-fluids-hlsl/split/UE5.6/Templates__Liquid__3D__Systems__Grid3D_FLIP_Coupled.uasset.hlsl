·;´Dµ„ÉH∞¥
’+8≤÷B≥7;Ω´
l;8›EìÜN£¬œ*∞‚„–
ı•¶˚u´;FäqDﬁR∆^™
›Eó;LkªS-õ
Hep:FIûe;EœÁ€!
p;!2*N´Hó7
N‘CØ≠%£Bó;Lo0~‚ Î
N‘CØ≠%£Bó;Lo0~‚ ]
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
ô4ËIÅm{cÏS;ÈÇ
ô4ËIÅm{cÏS;ÈÊ
∞J‰0µjXZnµ;0
K®˛Ú‚(;Gâ±≥iƒ
˝Üp;Æ∑
mx±;gWªJêR
ôÎE∂ê$]ﬂ;sT¯í˘I
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
-° 4È}è;∞
;®Âl‰˚D¨è\•—Yß€/a<eE
\)ê;˚ÔÜ‚3”Zo
åãdNT;
;0fÂi±æüq_¸
¶;ÑAçX]§éùı
ùæ`7·$Ë∂XËôÊ;9c°¶FÑ∏
;“≈Tz:ßL©M!N
⁄*tD<;úEì&É
fπ∏NêX´;M°˛Ω
ÿ>ëk*I¨;ç¨}Ü
\é`);|„Hê
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:
·Ä;2Kx+J≤Bè§]â‹#K
s;Mi”DÅéÄµó«RËK
öc,„( ÒCí;˙™gÊN1K
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
cMäI#í;…Ï£8
—Xd°JeG∏;(
;ÊLìô+:¬bœj!
;ÊLìô+:¬bœjº
;ÊLìô+:¬bœj&
ﬁJΩu&ÑkU„;#
ﬁJΩu&ÑkU„;¢
—Ì7;GΩ
ﬁJΩu&ÑkU„;)
ﬁJΩu&ÑkU„;
‡gYßÖ¯Hê");rÆ◊\˙
‡gYßÖ¯Hê");rÆ◊\¢
‡gYßÖ¯Hê");rÆ◊\*
‡gYßÖ¯Hê");rÆ◊\π
ﬁJΩu&ÑkU„;/
‡gYßÖ¯Hê");rÆ◊\0
C;Ní®ã|« !¿
}d+Âd|;
Iûô9‡$ï£ ;
π·nû®I;
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
ÍSÇ~à$EÖËl±;2∞Ò
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
Ëí˜@ÒK;D∏ ø]jY›…W
Ëí˜@ÒK;D∏ ø]jY›…
//  https://math.stackexchange.com/questions/1778627/ellipsoid-moment-of-inertia-matrix
MomentOfInertia.x = r.y * r.y + r.z * r.z;
MomentOfInertia.y = r.z * r.z + r.x * r.x;
MomentOfInertia.z = r.y * r.y + r.x * r.x;
MomentOfInertia *= m / 5.;
SpriteSize = 2.0 * max(max(Radius.x, Radius.y), Radius.z);
øJ;ÜPLÇk°
Ëí˜@ÒK;D∏ ø]jY›…[
?%:ùWC JâCÛ;I\7ï
?%:ùWC JâCÛ;I\7ï`
?%:ùWC JâCÛ;I\7ïN
£;n4‰EfC∞Ì
±qú©#N7O™ª;eﬂ
W`Äd˘å°B≥t¥÷;ƒk|ˇ
‡gYßÖ¯Hê");rÆ◊\
nÂ¢q“qMâ;}tk
;W/Ë¿]|
Â√˙»S;ÅD†ò
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3
ãsL≥L©j;Ö®¨¶º´
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿´
>Â;N™Õ)vãh.Z´
b\^ÇPÛEü;±
”5oU;Já±±@†®%9˙
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™€
K˜ZC ö;Mòïs
;Iò£+1
TA±;ãÒ¢!Áyê
TA±;ãÒ¢!Áyº
87ô5¶3Në;
Ñq;dœDÿJë`†à]ÀÁÆ›
¸ëØNµ‹P%Náw;Ò
EÉ©N}í.;
ãß;ÂR@ø©àm¯êúJ4
÷ÎÜ˚õAé;¿Ùc.ó∑‰
Ò≈;ªO≠lÜ••˙C≥´
Æ;IN:ˆ
˝í;ÎÈ‰
;≠ã£πÏ™G•'∆5
ˇÚEì;Ú"∑
*J;œ’$ÓI¥ÒƒƒÚo‘~ª
Oö;P2π¸Æ*3
!;ÌBÔΩ«@†À<Ç*
†6i ;ª
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^∫
mk†;$û•O´ÜáVóIø¥4
OÆÎi;^¡òŸ
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;4
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.È$
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í $
†HæÂ˛†’H-;î
;Ô“].ºπ
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Ûî
Y{3;FçûRô®<NC3
 DÄ÷bûYPc7π
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Ó9
xH;A˘q3
˜cKª‰´˛;‡Úˇj
 iÈJÜ-g$ûZH
7uù¬‘RçKô'î£lÅ;k3
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿ÇŸ
:Ã;3ËBqM£<Y)ôfH$j
AÉ%F;XOÖ6x‡jæÊ\
xùù⁄€HH≠cç;[*Y>†
xùù⁄€HH≠cç;[*Y>º
Ñq;dœDÿJë`†à]ÀÁÆ·
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
ØÜHòh∞'Ãﬁ;å®
ØÜHòh∞'Ãﬁ;å5
;|ã´Îø
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>m´
Dó0¿¯;ÑOæ´
 l;æNÉÒÌ‡~ 4=˙
ÑÒ`@ºèS;<»Zö˙
%wäJÄ‚+“;Eh–ˇ
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜1
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
I ;qÚKí
z;›˜™O†lÏwêäNVˇ
\∏Aä;!ô-¬€¡
;+¯OOûû7>
;W/Ë¿]‡
TA±;ãÒ¢!ÁyÙ
z’€2í«lAíè´%Å(i;ˇ
xùù⁄€HH≠cç;[*Y>
°–+à2K_Gï»,9„;r¥
ØÜHòh∞'Ãﬁ;å
Qäh;≤IUE§⁄
I'Gï»;$¢eœG/
I'Gï»;$¢eœG∞
I'Gï»;$¢eœG
îMæ[JéÊœ;cˇ
›ƒ¿è¶óÃ@£c≤¯rˆ≤∆;
µG∫#}x¢8ÎD;
`Gß‰;úé
‚=;ıEJ±
)—Kï;˘â`O
¶pH;Ï{Bí£o}·T G
fk$DÖÑ;l˛åwﬁ
∆N‡˚ú7—AçÂµ;Ωv·
∂ÙµO≥;3Yx‘(Çˇ
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†f
;aJΩzO ?∆+†∏
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;F˝
Ä~E;ﬁÂ
B≥%Îë;
;?%¶f\
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
Ü;‚{v¡!JéDY†a
∆M±\Oå;µxK
¨•;ª´Ê“Kß√t
Ö∏:“)¢ŒOò;æíÖ√
{tïuQ2PD∏≥ô∫∂%;Õ
;aJΩzO ?∆+†Õ
Ö∏:“)¢ŒOò;æíÖ√„õ
FØà^&∏;+
˚;YPaGî
ä{“D°;µMú-lí
ó‚‰z;XUIÄt7a!EÏ
Úó;˝3g.Dì
z;O∫kÉ^˝öËTˇ
≤´;à‘ÿ
;óKàri‰59vìi
;óKàri‰59vì5
C;Ní®ã|« !¿l
îƒzM≤o;J
FIÄ~–//
;óKàri‰59vì
C;Ní®ã|« !¿Ç
…r+;ñ±
ä,ªf;¥CH•–2ÈÓπ
)Ç-=ûéMí'i«9ﬂ;ñ
;óKàri‰59vìé
C;Ní®ã|« !¿ë
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;”˝
Lø;z˛rLWO
XûEøEø;bÒ1°∆
XûEøEø;bÒ1°N
XûEøEø;bÒ1°
;aªã3œŸKΩ9
N[áÆ;|]HøsìΩﬂ]¨Ø
¶®*l–l;
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;ˇ
q‘ı;EûuCdﬁ&5›F
q‘ı;EûuCdﬁ&5›
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
£í;Cä˘G¥
@™ÛlØ,;
;aJΩzO ?∆+†
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]S
Aì;˝ˇ\∑Ç]B
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_Z
É∆:JóÑƒ—;Tá_ı
9á‚ s‘]MäSr;˚±µ`˝
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNıc
9;˛π$J»Añ{C8·åNı
ùY˝;BEî¢
Ò¢;•BˆCî
‚¢;®Âíu
‚¢;®Âí
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€
Ω.BπYÎ;k7Î˜{
Ω.BπYÎ;k7Î˜ı
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Gò;ä∆…±
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“Aë
 ZSiBº´AéÓ—lÜ∆“A
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
Q;öÎ™X
 C®ØHŸ˜ÎRﬁ
––˙»H™;[á}zŒBˇ
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
;ªÑê*%´
;ªÑê*%
N´†;zXã
;8K¨VA`O¶rKü†J
j°Dîv;
‹ÒW¡¬9G®T©·˚[É;±
‹ÒW¡¬9G®T©·˚[É;
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
EñC‡w@¸k;
&≠,ÿ;´§Oª‚œ
¯∂7…›”¡Aü‹–;(ˇ
◊#¯IâDb;Ùﬁ‚ûˇ
>bÉ/y;<@éÎ
Ìó!;mJÅá˝#À/~/·
Ìó!;mJÅá˝#À/~/
iyH≠T‘;0
πhM∫Ù-;Ö¥≠Iù
˘';hPNû
;2Zñ5bmE∞\|ÿ
 r±'ÂL´¢
πhM∫Ù-;Ö¥≠I
sÔ◊;ü€
ﬂJÁÊﬁ‹;O∞ºπ
 OöLke˙Ãˇ!€
 OöLke˙Ãˇ!º
;g∆<ksÕIß:«œ[ $tˇ
∆ÀI;∫ä'L™
ë∏û/ï%MAµ#ƒZ7t;Ÿ
≠¥pÊ1Eê;á˝Ô
Dú#˛;bã⁄
H;Îw‹_MKØ˚µ2Z‘Á‰Ì
H;Îw‹_MKØ˚µ2Z‘Á‰Ø
∆M±\Oå;µxKÓ
∆M±\Oå;µxKı
∞L˙>{Ò¿@¥d8Á;
{tïuQ2PD∏≥ô∫∂%;ÕÙ
{tïuQ2PD∏≥ô∫∂%;Õı
¯;·€J_UD®9&Ÿ
@ø™ﬁEôF»;
Q;û:ƒÓGA≤î
îê∫âã!’O∑˙ª æ;˙Ù
\;ÖI•*ÊÑ
˘5D;Ö¯-AÖUß„à]1§
8—d≤G©G¡`Q;◊Hˇ
Íi+;<’Nö±w
Û]¯;¨òïBá
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9!
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;ù
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
ı‰®I¶;
¨3êC?D´Ü∂v;“%15
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆ8
ùΩ;Bêa¢óoÆóˆı
 A´KUTFöR!:
 A´KUTFöR!
Eö$bµä qŒ;
[⁄fg§œ;
DH;Eêé$,*H‹–?
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡A
GåÁÂé-;Ë‡û
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;ù
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQb
©ÁI°Q-¸;_◊
¿PBÄ}å;¯›zÊˇ
q‘ı;EûuCdﬁ&5›^
Aì;˝ˇ\∑Ç]n
É∆:JóÑƒ—;Tá_u
9;˛π$J»Añ{C8·åNı~
Ω.BπYÎ;k7Î˜ñ
 ZSiBº´AéÓ—lÜ∆“Aß
;ªÑê*%¡
‹ÒW¡¬9G®T©·˚[É;«
 OöLke˙Ãˇ!Ô
H;Îw‹_MKØ˚µ2Z‘Á‰
∂ﬁ;`"-‡M¥∂Y
≤πÄãÈ»}Jò;‘`
J°_ycô‰;
°íCìúl=Mâ±a;8
t;˜‰aÙ@ív∫{eµ]#
t;˜‰aÙ@ív∫{eµ][
®+´c ı„A©W!∑;
; 4´Dª2B∞}Dv3Yöˆq¶Á
; 4´Dª2B∞}Dv3Yöˆ
H¿—F¶o[;4|¸3,
H¿—F¶o[;4|¸3X
®Cßß;±ä˛˝Eˇ
MõÎ˘`Z÷6Ÿ;
óMñ7˜˚B¥◊Ú;
"t¢7ÓDFFî¥êKò¿"â;
oi∑;_Aå¢õÜ‘ÃÈ9P
¨3êC?D´Ü∂v;“%1d
ùΩ;Bêa¢óoÆóˆg
 A´KUTFöR!i
GåÁÂé-;Ë‡m
jDÖa#˘;˚|?ˇ
˙∆FÄe;mUwË>Ñ
˙∆FÄe;mUwË>
º ´C¸—GOñ[∑fØ4O˛;
INí^;©ı”ﬁﬂKÁˆ
INí^;©ı”ﬁﬂ
@;TÈ∞M∞I®TLô≥ß¥ﬁ
U™yE≤3a;§“œk
∞)‡XCnEOü ;
 MÚÆÉ~Oë‘
`Wúπû75O∞ØD;˘ùA‰å
`Wúπû75O∞ØD;˘ùA‰
˙∆FÄe;mUwË>è
 l˛[>ÅEéÈ¨x}#6qL›
 l˛[>ÅEéÈ¨x}#6q
≤◊,‡ƒ;}¿ÛZ[´DØMV±
;}¿ÛZ[´DØMV±
hÖM©ªÈˆHàC;¥
sñ'Áª7;F´
$xø)˙k;M§nΩ\
°±5/∏èÍL∏˙ÔNˇ;%n
C>7™Jª}*eÛ;ﬁˆ}F
C>7™Jª}*eÛ;ﬁˆ
Ö√Ú";ú»AΩπ
u≠;ÂÔ™3Et€@¢Sµ≥r%˘˜ù
+lÿ-;’ÒBûòæˇîû
Bä&˚Z;
 rœ¯•£
iKê; C
`Wúπû75O∞ØD;˘ùA‰™
˙∆FÄe;mUwË>≠
ä{“D°;µMú-lí∏
ä{“D°;µMú-líı
◊*åä;jO∏˘øg
 rœ¯•ƒ
‰˜DÖ0;èU
7D{C°èÅG¢#pÓ[;7
ó‚‰z;XUIÄt7a!EÏ‘
ó‚‰z;XUIÄt7a!EÏı
;©†˚(ÊÂFêç
 —<;?h™Môç•ØZüòU‹
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•
Aì;˝ˇ\∑Ç]
x´;Bé§í‡Òä`Êﬂ
x´;Bé§í‡Òä`Êä
‰g;•†0MÜQ:âıπº^·
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
4´;Éù˝
zC∏ª;D◊Û2o
K;Óñ‰ﬁÛ
K;Óñ‰ﬁ
&HÚ´;R
DÅ)¯P√}i;˘
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
g;MåÌ\£RÒB“
Úh;|}}
qi;;¥E∂o>2e
:ı„ÂÒ“;F¢Gâ0=√2A
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯X‹
ıR9ÿ"D¨Úq;Ã
TA±;ãÒ¢!Áy
g‹I∏xü;Ü
%îh;˘Ä_G∑
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
GåÁÂé-;Ë‡
ìáï∆)K;Mà±≠/˜˜ùöˇ
;M¸è¿sK£ﬁ»u8q„e
ì◊rÒ®ETEá¥éM;∂
 OöLke˙Ãˇ!
˛´T“@õÜ;˘TÑq™d
\Ày`AçÇZ≥Ñ˙;±"
;\AŒ#Ú≤JêO<ê†Kue
kgÉÄ§DÅPŒrq1;Ô
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
&—√n‡]⁄KØ;û
∞*º:˚A;DÇµ
SHπ–F;{
˘aûª;D°Oá
 Cã˛¡î
;M}g≥oiD•Â6¬ˆE
t{#3ë; Iµ
…˜;çLØ
¢åE∂∞;LÄ¯ÅƒyÔq;
î;‚_ã
;√Ë’@®$+*u˘˝Œ
baDæ€∆~œ«’^;
å·;ˆ÷hÆNóıÓŸƒq±∞?
å·;ˆ÷hÆNóıÓŸƒq±∞
 —<;?h™Môç•ØZüòUG
x´;Bé§í‡Òä`ÊJ
‰g;•†0MÜQ:âıπº^L
K;Óñ‰ﬁ^
DÅ)¯P√}i;d
;˙/¯Xm
t;˜‰aÙ@ív∫{eµ]
H¿—F¶o[;4|¸3
˛´T“@õÜ;˘TÑq™Ö
\Ày`AçÇZ≥Ñ˙;±Ü
å·;ˆ÷hÆNóıÓŸƒq±∞≠
°–+à2K_Gï»,9„;r¥Æ
°–+à2K_Gï»,9„;r¥ı
°€J;0ÛWCà
?Â;®q@L∑p<XıÍoÛ
GœVkNHÓ@®‡sÊˆ;qqæ
GœVkNHÓ@®‡sÊˆ;qq
;ON≥=Úqv⁄ƒ
;ÊLìô+:¬bœj
:.>âDµË˛1[è…;«
:.>âDµË˛1[è…;
JΩR⁄^;
:.>âDµË˛1[è…;›
;√nQm‰
;√nQmÍ
NæÆÄqæ∫;*P
ó±√;ÚM¢°
NæÆÄqæ∫;*
õ…;ÔÙ∞NíDK∫O6Ë¿Ò
õ…;ÔÙ∞NíDK∫O6Ë¿
v†S]¶Æ"Kª;ò_YItoP
v†S]¶Æ"Kª;ò_YIto
õ…;ÔÙ∞NíDK∫O6Ë¿ˆ
ÿˇR:˘≤zñy;Ÿ
p˙∫‹[üE”;˘Öéä°*
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
float Emitter_SDFGrid_SDF;
float3 Emitter_StartVelocityGrid_StartVelocity;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_SDFParticleSizeMult;
float Emitter_dx;
bool Emitter_Grid3D_FLIP_Tank_Spawn_HasSpawnedThisFrame;
int Emitter_OVERRIDE_ParticlesPerCell;
int Emitter_Grid3D_FLIP_Tank_Spawn_WaterHeightZIndex;
int Emitter_Grid3D_FLIP_Tank_Spawn_TotalEmissionCells;
float Emitter_DeltaTime;
int Emitter_Grid3D_InitializeConvolutionKernel_Radius;
float Emitter_TemporaryGrid_SimFloat;
int Emitter_SimGrid_VelocityIndex;
int Emitter_SimGrid_SimFloatIndex;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_CollisionVelocityMult;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryUp;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryLeft;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryRight;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryDown;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryFront;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryBack;
float Emitter_dt;
float Emitter_PressureGrid_Pressure;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_PressureRelaxation;
int Emitter_SimGrid_PressureIndex;
int Emitter_SimGrid_BoundaryIndex;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_PICFLIPRatio;
float Emitter_RasterizationGrid3D_Initialize_dx;
int Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
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
bool Drawable;
int IndexX;
int IndexY;
int IndexZ;
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
FParamMap0_Local_Grid3D_Visualize_VectorField Grid3D_Visualize_VectorField;
bool KillParticles;
float4x4 UnitToWorld;
float3 VectorValue;
float Red;
bool Enable;
float3 StartVelocity;
float dt;
float3 PressureGradient;
bool UseHighPrecisionCollisions;
float Divergence;
float Relaxation;
int BoundaryIndex;
bool UseRasterizationGrid;
int VelocityIndex;
float4x4 WorldToLocal;
float4x4 LocalToWorld;
float PicOrFlip;
int ParticlesPerCell;
bool SpawnedThisFrame;
int TotalEmissionCells;
bool UseLandscape;
int WaterHeightZIndex;
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
bool UseLandscapeCollisions;
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
FParamMap0_Grid3D_ComputeHighPrecisionBoundary Grid3D_ComputeHighPrecisionBoundary;
FParamMap0_Grid3D_CreateConvolutionKernel Grid3D_CreateConvolutionKernel;
FParamMap0_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_Grid3D_Flip_GridParticles Grid3D_Flip_GridParticles;
FParamMap0_Grid3D_FLIP_IntegrateParticleVelocity Grid3D_FLIP_IntegrateParticleVelocity;
FParamMap0_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
FParamMap0_Grid3D_FLIP_RasterizeParticles Grid3D_FLIP_RasterizeParticles;
FParamMap0_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_Grid3D_SetFluidAttribute Grid3D_SetFluidAttribute;
FParamMap0_Grid3D_SetFluidAttribute001 Grid3D_SetFluidAttribute001;
FParamMap0_Grid3D_SetFluidAttribute002 Grid3D_SetFluidAttribute002;
FParamMap0_Grid3D_SetFluidAttribute003 Grid3D_SetFluidAttribute003;
FParamMap0_Grid3D_SetFluidAttribute004 Grid3D_SetFluidAttribute004;
FParamMap0_Grid3D_SetRTValues Grid3D_SetRTValues;
FParamMap0_Grid3D_Visualize_VectorField Grid3D_Visualize_VectorField;
FParamMap0_KillParticles KillParticles;
FParamMap0_KillParticles001 KillParticles001;
FParamMap0_Local Local;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_Particles Particles;
FParamMap0_RasterizationGrid_ParticleSource RasterizationGrid_ParticleSource;
FParamMap0_ScratchDynamicInput_01 ScratchDynamicInput_01;
FParamMap0_ScratchModule_02 ScratchModule_02;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B SetVariables_196415D64713B26D008A18AD62DEAC4B;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7 SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7;
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
static float HackSpawnInterp = 1.0;
void NiagaraScript_848_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void LinearToIndex_Emitter_SimGrid(int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void CustomHlslC048C848489B38264EF049DE1B85F67EA0050C08_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, out bool Out_ret);
void Grid3D_Flip_GridParticles_Emitter_Func_(inout FSimulationContext Context);
void KillParticles001_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_IndexX, int In_IndexY, float In_Value);
void CustomHlslBBE0E8969C2067B677A00323B63A8F9C891645C8Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
void Grid3D_CreateConvolutionKernel_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void NiagaraScript_853_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TemporaryGrid(float3 In_Unit, out float3 Out_Index);
void Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SetGridValue_Emitter_TemporaryGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl27B9BB65BCB3D14D240998C5C0E8BD174A8EF3ECEmitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_01_Emitter_Func_(out float3 Out_Output, inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void GetClosestPoint_User_Collide_Meshes(float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestNormal, out float3 Out_ClosestVelocity);
void GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReader(out int Out_NumParticles);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeScale(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeMeshOrientation(int In_ParticleIndex, out bool Out_Valid, out float4 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeVelocity(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevMeshOrientation(int In_ParticleIndex, out bool Out_Valid, out float4 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevPosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_(float3 In_CellPos, float In_VelocityMult, int In_NumParticles, float4x4 In_WorldToLocal, float In_dt, out float Out_BoundaryOut, out float3 Out_VelocityOut, out float Out_SignedDistance);
void CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute006_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void Grid3D_GetFluidAttribute007_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_TransientGrid(out float3 Out_Unit);
void CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float In_dt, out float Out_theta_ppp, out float Out_theta_ppn, out float Out_theta_pnn, out float Out_theta_pnp, out float Out_theta_nnp, out float Out_theta_npp, out float Out_theta_npn, out float Out_theta_nnn, out float3 Out_AverageSolidVelocity);
void CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl170C332F55B9B706AF00D7FFD2CAA6E28B0AF2F8_Func_(float3 In_theta, out float Out_AreaFraction);
void NiagaraScript_882_Func_(float3 In_INPUT_VAR, out float Out_AreaFraction, inout FSimulationContext Context);
void CustomHlslFF03F817137D9F288F8DAF1B9D734F0AA9A4F278_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl0348AE273B478844CEB31A0A3338B1A7003705B0_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlslB90662E35BB60107E5D5EB7683948ADAE395D82D_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void NiagaraScript_881_Func_(float In_ppp, float In_ppn, float In_pnn, float In_pnp, float In_nnp, float In_npp, float In_npn, out float3 Out_FaceFractions, inout FSimulationContext Context);
void CustomHlsl001FF341B90BB15A9ABE5310564EC4BCDFB662C98F7_Func_(float In_theta_ppp, float In_theta_ppn, float In_theta_pnn, float In_theta_pnp, float In_theta_nnp, float In_theta_npp, float In_theta_npn, float In_theta_nnn, out bool Out_IsFullyInsideBoundary);
void Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(float In_dt, out float Out_XFace, out float Out_YFace, out float Out_ZFace, out bool Out_IsFullyInsideBoundary, out float3 Out_SolidVelocity, inout FSimulationContext Context);
void CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_(float3 In_Face, float In_MinFaceFraction, out float3 Out_FaceFraction);
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
void CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
void SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
void Grid3D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void Grid3D_GetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void Grid3D_GetFluidAttribute005_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void NiagaraScript_858_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl5F6F47F5108B9C6F6B4E3706DB5966105A5493D2_Func_(float In_InFloat, out float Out_OutFloat);
void NiagaraScript_859_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
void Grid3D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
void Grid3D_ProjectPressure_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_PlaneOffset, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_Plane, int In_PlaneMax, out bool Out_Execute);
void Grid3D_Visualize_VectorField_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TransientGrid(float3 In_Unit, out float3 Out_Index);
void CustomHlslA479C658154E00798922BB290711A93B51C117C2_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl1781695C29BCB52ED96F4BB5C815FF141DC50C6F_Func_(float3 In_UnitPos, out float Out_ret);
void CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlslD931918DCB45B5476DCC3563A717057531B4B84B_Func_(float In_Mask, out bool Out_IsInside);
void SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_Emitter_Func_(inout FSimulationContext Context);
void KillParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void NiagaraScript_873_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(int In_ParticleIndex, out bool Out_Valid, out float2 Out_Value);
void UnitToFloatIndex_Emitter_RasterizationGrid(float3 In_Unit, out float3 Out_Index);
void GetNumCells_Emitter_RasterizationGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void InterlockedMinFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl9D0FD15FAA926ECB08302705292F9C8D2C0E6115Emitter_RasterizationGrid_Func_(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
void RasterizationGrid_ParticleSource_Emitter_Func_(inout FSimulationContext Context);
void GetNumCells_Emitter_KernelGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void GetPreviousFloatValue_Emitter_KernelGrid_Attributek(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SDFGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void GetNumCells_Emitter_SDFGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_ConvolveAxis002_Emitter_Func_(inout FSimulationContext Context);
void ScratchModule_03_Emitter_Func_(inout FSimulationContext Context);
void ExecToIndex_Emitter_SimRT(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
float GetSpawnInterpolation();
bool Constant17 = false;
float3 Result = In_RangeMax - In_RangeMin;
float3 Result1 = rand(Result);
float3 Result2 = In_RangeMin + Result1;
Out_RandomValue = Result2;
Out_IsDeterministic = Constant17;
In_IndexX >= In_NumCellsX - 2 || In_IndexY >= In_NumCellsY - 2 || In_IndexZ >= In_NumCellsZ - 2;
float Constant7 = 1;
float Constant8 = 1;
int Constant9 = (0);
float3 Constant10 = float3(-0.5,-0.5,-0.5);
float3 Constant11 = float3(0.5,0.5,0.5);
int Constant12 = -1;
int Constant13 = (0);
int Constant14 = 0;
int Constant15 = (0);
int Constant16 = (0);
float3 NiagaraScript_848_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue;
bool NiagaraScript_848_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_848_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant9, Constant10, Constant11, Constant12, Constant13, Constant14, Constant15, Constant16, NiagaraScript_848_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue, NiagaraScript_848_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
int Result3 = ExecIndex();
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
int Result4 = GetNumCells_Emitter_SimGridOutput_NumCellsX * GetNumCells_Emitter_SimGridOutput_NumCellsY * Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex;
bool Result5 = NiagaraAll(Result3 >= Result4);
float Constant18 = 1;
float3 Result6 = NiagaraScript_848_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue * Constant8 * Result5 * Constant18;
int Result7 = ModuloPrecise(Result3, Result4);
int LinearToIndex_Emitter_SimGridOutput_IndexX;
int LinearToIndex_Emitter_SimGridOutput_IndexY;
int LinearToIndex_Emitter_SimGridOutput_IndexZ;
LinearToIndex_Emitter_SimGrid(Result7, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, LinearToIndex_Emitter_SimGridOutput_IndexZ);
int Result8 = Context.MapSpawn.Grid3D_Flip_GridParticles.ParticlesPerCell * Context.MapSpawn.Grid3D_Flip_GridParticles.TotalEmissionCells;
bool Result9 = NiagaraAll(Result3 > Result8);
int Constant19 = 1;
int Result10 = Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex - Constant19;
int Constant20 = (0);
int IndexZ_SelectResult = Constant20;
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
//SetConstantByStaticVariable "/Grid 3D Flip Grid Particles/Map Get/Map Get->Module.Use Landscape"
int Constant21 = 0;
float3 Constant22 = float3(0,0,0);
float Constant23 = 0;
bool Result13 = NiagaraAll(IndexZ_SelectResult >= Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex);
bool CustomHlslC048C848489B38264EF049DE1B85F67EA0050C08_Func_Output_ret;
CustomHlslC048C848489B38264EF049DE1B85F67EA0050C08_Func_(LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, IndexZ_SelectResult, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, CustomHlslC048C848489B38264EF049DE1B85F67EA0050C08_Func_Output_ret);
bool Result14 = Result13 || CustomHlslC048C848489B38264EF049DE1B85F67EA0050C08_Func_Output_ret;
float Result15 = Context.MapSpawn.Grid3D_Flip_GridParticles.dx * Constant7;
float3 Constant24 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult1 = Constant24;
bool Constant25 = (false);
bool NiagaraBool_SelectResult1 = Constant25;
float2 Constant26 = float2(0.0, 0.0);
float2 Vector2D_SelectResult1 = Constant26;
float3 Constant27 = float3(0.0, 0.0, 0.0);
float3 Vector3f001_SelectResult1 = Constant27;
Vector3f_SelectResult1 = Result12;
NiagaraBool_SelectResult1 = Result14;
Vector2D_SelectResult1 = Result15;
Vector3f001_SelectResult1 = Constant22;
Vector3f_SelectResult1 = Context.MapSpawn.Particles.Position;
NiagaraBool_SelectResult1 = Context.MapSpawn.Transient.Kill;
Vector2D_SelectResult1 = Context.MapSpawn.Particles.SpriteSize;
Vector3f001_SelectResult1 = Context.MapSpawn.Particles.Velocity;
Context.MapSpawn.Particles.Position = Vector3f_SelectResult1;
Context.MapSpawn.Transient.Kill = NiagaraBool_SelectResult1;
Context.MapSpawn.Particles.SpriteSize = Vector2D_SelectResult1;
Context.MapSpawn.Particles.Velocity = Vector3f001_SelectResult1;
bool Constant29 = false;
bool bool_IfResult;
bool_IfResult = Constant29;
bool_IfResult = Context.MapSpawn.DataInstance.Alive;
Context.MapSpawn.DataInstance.Alive = bool_IfResult;
float3 Constant32 = float3(0,0,-980);
float3 Result16 = Context.MapUpdate.Transient.PhysicsForce + Constant32;
float3 Result17 = Result16 * Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result18 = Context.MapUpdate.Particles.Velocity + Result17;
Context.MapUpdate.Particles.Velocity = Result18;
   SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0,0,1);
    float Sigma = In_Radius;
    float TwoSigmaSquared = 2. * Sigma * Sigma;
    float Coeff = 1./sqrt(3.141569 * TwoSigmaSquared);
    float Total = 0.0;
    for (int i = 0; i <= In_Radius; ++i)
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared));
        Total +=  Val;
        // add negative side to total
        if (i > 0)
            Total += Val;
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared)); 
        SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(i, 0, Val/Total);
//SetConstantByStaticVariable "/Grid 3D Create Convolution Kernel/Map Get/Map Get->Module.Smoothing Kernel"
int Constant33 = 0;
CustomHlslBBE0E8969C2067B677A00323B63A8F9C891645C8Emitter_KernelGrid_Func_(Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius, Context);
float Constant35 = 0;
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Constant35;
float3 Constant37 = float3(0,0,0);
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Constant37;
int Constant45 = 0;
bool Result19 = NiagaraAll(In_SourceSpace == Constant45);
int Constant46 = 0;
bool Result20 = NiagaraAll(In_DestinationSpace == Constant46);
bool Result21 = Result19 && Result20;
int Constant47 = 1;
bool Result22 = NiagaraAll(In_SourceSpace == Constant47);
int Constant48 = 1;
bool Result23 = NiagaraAll(In_DestinationSpace == Constant48);
bool Result24 = Result22 && Result23;
bool Result25 = Result21 || Result24;
int Constant49 = 2;
bool Result26 = NiagaraAll(In_SourceSpace == Constant49);
int Constant50 = 2;
bool Result27 = NiagaraAll(In_DestinationSpace == Constant50);
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
bool Constant44 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_853_Func_Output_bUseOriginal;
float4x4 NiagaraScript_853_Func_Output_OutTransform;
bool NiagaraScript_853_Func_Output_LocalToWorld;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant44, NiagaraScript_853_Func_Output_bUseOriginal, NiagaraScript_853_Func_Output_OutTransform, NiagaraScript_853_Func_Output_LocalToWorld, Context);
float3 Result46 = mul(float4(In_InPosition,1.0),NiagaraScript_853_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InPosition;
Vector_IfResult = Result46;
Out_OutPosition = Vector_IfResult;
bool Constant54 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_853_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_853_Func_Output_OutTransform1;
bool NiagaraScript_853_Func_Output_LocalToWorld1;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant54, NiagaraScript_853_Func_Output_bUseOriginal1, NiagaraScript_853_Func_Output_OutTransform1, NiagaraScript_853_Func_Output_LocalToWorld1, Context);
float3 Result48 = mul(float4(In_InVector,0.0),NiagaraScript_853_Func_Output_OutTransform1).xyz;
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
//SetConstantByStaticVariable "/Grid 3D FLIP Rasterize Particles/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant40 = 1;
int Constant41 = 0;
int Constant42 = 1;
bool Constant43 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Position, Constant41, Constant42, Constant43, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result47 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(Result47, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant51 = 0;
int Constant52 = 1;
bool Constant53 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Velocity, Constant51, Constant52, Constant53, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result49 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlsl27B9BB65BCB3D14D240998C5C0E8BD174A8EF3ECEmitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result49, Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Enable"
int Constant55 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
int Constant56 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant57 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
int Constant58 = 0;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Resample = Constant58;
int Constant59 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Local.Module.Resample"
int Constant60 = 0;
float3 Constant61 = float3(0,0,0);
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Unit = Constant61;
int Constant62 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant63 = 3;
int Constant64 = 0;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Write To Transient"
int Constant65 = 1;
Context.MapSimStage5_ComputeBoundary.Transient.SimFloat = Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
//SetConstantByStaticVariable "/Scratch Dynamic Input 01/Map Get/Map Get->Module.Use High Precision"
int Constant68 = 1;
float3 Constant69 = float3(0.5,0.5,0.5);
Out_Output = Constant69;
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
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Landscape Collisions"
int Constant70 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Particle Collisions"
int Constant71 = 1;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Geometry Collection Collisions"
int Constant72 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Collisions"
int Constant73 = 1;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Distance Fields"
int Constant74 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Depth Map Collisions"
int Constant75 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Global Distance Field Collisions"
int Constant76 = 0;
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
float3 Constant77 = float3(0,0,0);
float3 Output12;
Output12.x = IndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output12.y = IndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output12.z = IndexToUnit_Emitter_SimGridOutput_Unit1.z;
float3 Result51 = mul(float4(Output12,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit1;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Constant77;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos = Result51;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
int Constant78 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX1;
int GetNumCells_Emitter_SimGridOutput_NumCellsY1;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ1;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary;
CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant78, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary);
float Constant79 = 1e+17;
float GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance;
float3 GetClosestPoint_User_Collide_MeshesOutput_ClosestPosition;
float3 GetClosestPoint_User_Collide_MeshesOutput_ClosestNormal;
float3 GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity;
GetClosestPoint_User_Collide_Meshes(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, Context.MapSimStage5_ComputeBoundary.Engine.WorldDeltaTime, Context.MapSimStage5_ComputeBoundary.Engine.System.TimeStepFraction, GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance, GetClosestPoint_User_Collide_MeshesOutput_ClosestPosition, GetClosestPoint_User_Collide_MeshesOutput_ClosestNormal, GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity);
float Constant80 = 0;
bool Result52 = NiagaraAll(GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance <= Constant80);
float Constant81 = 1;
float3 Result53 = GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity * Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale;
float3 Result54 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity + Result53;
float Constant82 = (0.0);
float NiagaraFloat_SelectResult2 = Constant82;
float3 Constant83 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult2 = Constant83;
NiagaraFloat_SelectResult2 = Constant81;
Vector3f_SelectResult2 = Result54;
NiagaraFloat_SelectResult2 = CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary;
Vector3f_SelectResult2 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Vector3f_SelectResult2;
float Result55 = min(GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance, Constant79);
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Local Space Particles"
int Constant84 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Size"
int Constant85 = 1;
float3 Result56 = mul(float4(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.WorldToLocal).xyz;
float3 Output13;
Output13.x = Result56.x;
Output13.y = Result56.y;
Output13.z = Result56.z;
int GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles;
GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReader(GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles);
float CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut;
float3 CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut;
float CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance;
CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_(Output13, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale, GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.WorldToLocal, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.dt, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance);
float Result57 = max(NiagaraFloat_SelectResult2, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut);
float3 Result58 = CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut + Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Result58;
float Result59 = min(CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance, Result55);
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Free Surface"
int Constant86 = 1;
float CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary;
CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_(Result57, Context.MapSimStage5_ComputeBoundary.Transient.Boundary, CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary);
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary;
Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance = Result59;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Enable"
int Constant88 = 0;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 003/Map Get/Map Get->Module.Enable"
int Constant90 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 003/Map Get/Map Get->Module.Attribute"
int Constant91 = 7;
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
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Enable"
int Constant92 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample To Another Grid"
int Constant93 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant94 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Logic OR (Static)/Logic OR (Static)->Result"
int Constant95 = 0;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Resample = Constant95;
int Constant96 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Local.Module.Resample"
int Constant97 = 0;
float3 Constant98 = float3(0,0,0);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Unit = Constant98;
int Constant99 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Attribute"
int Constant100 = 3;
int Constant101 = 0;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Write To Transient"
int Constant102 = 1;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat = Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Module.Enable"
int Constant103 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Module.Resample To Another Grid"
int Constant104 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant105 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Logic OR (Static)/Logic OR (Static)->Result"
int Constant106 = 0;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute007.Resample = Constant106;
int Constant107 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Local.Module.Resample"
int Constant108 = 0;
float3 Constant109 = float3(0,0,0);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute007.Unit = Constant109;
int Constant110 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Module.Attribute"
int Constant111 = 7;
int Constant112 = 0;
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
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 007/Map Get/Map Get->Module.Write To Transient"
int Constant113 = 1;
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
float CustomHlsl170C332F55B9B706AF00D7FFD2CAA6E28B0AF2F8_Func_Output_AreaFraction;
CustomHlsl170C332F55B9B706AF00D7FFD2CAA6E28B0AF2F8_Func_(In_INPUT_VAR, CustomHlsl170C332F55B9B706AF00D7FFD2CAA6E28B0AF2F8_Func_Output_AreaFraction);
Out_AreaFraction = CustomHlsl170C332F55B9B706AF00D7FFD2CAA6E28B0AF2F8_Func_Output_AreaFraction;
Out_Avg = .25 * (In_A+In_B+In_C+In_D);
float3 CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri0;
float3 CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri1;
float3 CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri2;
float3 CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri3;
CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_(In_ppp, In_ppn, In_pnn, In_pnp, CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri0, CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri1, CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri2, CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri3);
float NiagaraScript_882_Func_Output_AreaFraction;
NiagaraScript_882_Func_(CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri0, NiagaraScript_882_Func_Output_AreaFraction, Context);
float NiagaraScript_882_Func_Output_AreaFraction1;
NiagaraScript_882_Func_(CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri1, NiagaraScript_882_Func_Output_AreaFraction1, Context);
float NiagaraScript_882_Func_Output_AreaFraction2;
NiagaraScript_882_Func_(CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri2, NiagaraScript_882_Func_Output_AreaFraction2, Context);
float NiagaraScript_882_Func_Output_AreaFraction3;
NiagaraScript_882_Func_(CustomHlsl9F80E9C395BC219BE2AC8873E73D03FAC4918AB4_Func_Output_Tri3, NiagaraScript_882_Func_Output_AreaFraction3, Context);
float CustomHlslFF03F817137D9F288F8DAF1B9D734F0AA9A4F278_Func_Output_Avg;
CustomHlslFF03F817137D9F288F8DAF1B9D734F0AA9A4F278_Func_(NiagaraScript_882_Func_Output_AreaFraction, NiagaraScript_882_Func_Output_AreaFraction1, NiagaraScript_882_Func_Output_AreaFraction2, NiagaraScript_882_Func_Output_AreaFraction3, CustomHlslFF03F817137D9F288F8DAF1B9D734F0AA9A4F278_Func_Output_Avg);
float3 CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri0;
float3 CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri1;
float3 CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri2;
float3 CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri3;
CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_(In_ppp, In_ppn, In_npp, In_npn, CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri0, CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri1, CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri2, CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri3);
float NiagaraScript_882_Func_Output_AreaFraction4;
NiagaraScript_882_Func_(CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri0, NiagaraScript_882_Func_Output_AreaFraction4, Context);
float NiagaraScript_882_Func_Output_AreaFraction5;
NiagaraScript_882_Func_(CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri1, NiagaraScript_882_Func_Output_AreaFraction5, Context);
float NiagaraScript_882_Func_Output_AreaFraction6;
NiagaraScript_882_Func_(CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri2, NiagaraScript_882_Func_Output_AreaFraction6, Context);
float NiagaraScript_882_Func_Output_AreaFraction7;
NiagaraScript_882_Func_(CustomHlslB2E72A15136CD70DEC1CA0B3B7AA7D855EBED73A_Func_Output_Tri3, NiagaraScript_882_Func_Output_AreaFraction7, Context);
float CustomHlsl0348AE273B478844CEB31A0A3338B1A7003705B0_Func_Output_Avg;
CustomHlsl0348AE273B478844CEB31A0A3338B1A7003705B0_Func_(NiagaraScript_882_Func_Output_AreaFraction4, NiagaraScript_882_Func_Output_AreaFraction5, NiagaraScript_882_Func_Output_AreaFraction6, NiagaraScript_882_Func_Output_AreaFraction7, CustomHlsl0348AE273B478844CEB31A0A3338B1A7003705B0_Func_Output_Avg);
float3 CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri0;
float3 CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri1;
float3 CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri2;
float3 CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri3;
CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_(In_ppp, In_pnp, In_nnp, In_npp, CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri0, CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri1, CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri2, CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri3);
float NiagaraScript_882_Func_Output_AreaFraction8;
NiagaraScript_882_Func_(CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri0, NiagaraScript_882_Func_Output_AreaFraction8, Context);
float NiagaraScript_882_Func_Output_AreaFraction9;
NiagaraScript_882_Func_(CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri1, NiagaraScript_882_Func_Output_AreaFraction9, Context);
float NiagaraScript_882_Func_Output_AreaFraction10;
NiagaraScript_882_Func_(CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri2, NiagaraScript_882_Func_Output_AreaFraction10, Context);
float NiagaraScript_882_Func_Output_AreaFraction11;
NiagaraScript_882_Func_(CustomHlsl0B6F42B9CAC5485CBA7A9D3F6AA6D09304874ADE_Func_Output_Tri3, NiagaraScript_882_Func_Output_AreaFraction11, Context);
float CustomHlslB90662E35BB60107E5D5EB7683948ADAE395D82D_Func_Output_Avg;
CustomHlslB90662E35BB60107E5D5EB7683948ADAE395D82D_Func_(NiagaraScript_882_Func_Output_AreaFraction8, NiagaraScript_882_Func_Output_AreaFraction9, NiagaraScript_882_Func_Output_AreaFraction10, NiagaraScript_882_Func_Output_AreaFraction11, CustomHlslB90662E35BB60107E5D5EB7683948ADAE395D82D_Func_Output_Avg);
float3 Output18;
Output18.x = CustomHlslFF03F817137D9F288F8DAF1B9D734F0AA9A4F278_Func_Output_Avg;
Output18.y = CustomHlsl0348AE273B478844CEB31A0A3338B1A7003705B0_Func_Output_Avg;
Output18.z = CustomHlslB90662E35BB60107E5D5EB7683948ADAE395D82D_Func_Output_Avg;
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
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppp;
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppn;
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnn;
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnp;
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnp;
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npp;
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npn;
float CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnn;
float3 CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, In_dt, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_AverageSolidVelocity);
float3 NiagaraScript_881_Func_Output_FaceFractions;
NiagaraScript_881_Func_(CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npn, NiagaraScript_881_Func_Output_FaceFractions, Context);
float X3;
float Y3;
float Z3;
X3 = NiagaraScript_881_Func_Output_FaceFractions.x;
Y3 = NiagaraScript_881_Func_Output_FaceFractions.y;
Z3 = NiagaraScript_881_Func_Output_FaceFractions.z;
bool CustomHlsl001FF341B90BB15A9ABE5310564EC4BCDFB662C98F7_Func_Output_IsFullyInsideBoundary;
CustomHlsl001FF341B90BB15A9ABE5310564EC4BCDFB662C98F7_Func_(CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl001FF341B90BB15A9ABE5310564EC4BCDFB662C98F7_Func_Output_IsFullyInsideBoundary);
Out_XFace = X3;
Out_YFace = Y3;
Out_ZFace = Z3;
Out_IsFullyInsideBoundary = CustomHlsl001FF341B90BB15A9ABE5310564EC4BCDFB662C98F7_Func_Output_IsFullyInsideBoundary;
Out_SolidVelocity = CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
Out_FaceFraction.x = In_Face.x > 1e-20 ? max(In_Face.x, In_MinFaceFraction) : 0;
Out_FaceFraction.y = In_Face.y > 1e-20 ? max(In_Face.y, In_MinFaceFraction) : 0;
Out_FaceFraction.z = In_Face.z > 1e-20 ? max(In_Face.z, In_MinFaceFraction) : 0;
Out_FaceFraction = saturate(Out_FaceFraction);
float3 ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
ExecutionIndexToUnit_Emitter_TransientGrid(ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit);
float3 Constant115 = float3(0,0,0);
float3 Output17;
Output17.x = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.x;
Output17.y = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.y;
Output17.z = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.z;
float3 Result60 = mul(float4(Output17,1.0),Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld).xyz;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.UnitPosition = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Constant115;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.WorldPos = Result60;
float Constant116 = 0.1;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
bool Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary;
float3 Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.dt, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity, Context);
float3 Output19;
Output19.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output19.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output19.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
float3 CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_Output_FaceFraction;
CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_(Output19, Constant116, CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_Output_FaceFraction);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction = CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_Output_FaceFraction;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
//SetConstantByStaticVariable "/Grid 3D Compute High Precision Boundary/Map Get/Map Get->Module.Use Free Surface"
int Constant117 = 1;
float Constant118 = 1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3);
int Constant119 = 2;
int GetNumCells_Emitter_TransientGridOutput_NumCellsX;
int GetNumCells_Emitter_TransientGridOutput_NumCellsY;
int GetNumCells_Emitter_TransientGridOutput_NumCellsZ;
GetNumCells_Emitter_TransientGrid(GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ);
float CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary1;
CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3, Constant119, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary1);
float Constant120 = (0.0);
float NiagaraFloat_SelectResult3 = Constant120;
NiagaraFloat_SelectResult3 = Constant118;
NiagaraFloat_SelectResult3 = CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary1;
float CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary1;
CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_(NiagaraFloat_SelectResult3, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat, CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary = CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 002/Map Get/Map Get->Module.Enable"
int Constant121 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 002/Map Get/Map Get->Module.Attribute"
int Constant122 = 7;
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
//SetConstantByStaticVariable "/Scratch Module 02/Map Get/Map Get->Module.Use High Precision Collisions"
int Constant123 = 1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_FaceGrid(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ);
SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.ScratchModule_02.FaceVals);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Enable"
int Constant124 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample To Another Grid"
int Constant125 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant126 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Logic OR (Static)/Logic OR (Static)->Result"
int Constant127 = 0;
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Resample = Constant127;
int Constant128 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Local.Module.Resample"
int Constant129 = 0;
float3 Constant130 = float3(0,0,0);
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Unit = Constant130;
int Constant131 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Attribute"
int Constant132 = 7;
int Constant133 = 0;
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
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Write To Transient"
int Constant134 = 1;
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
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant137 = 1;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ);
int Constant138 = 1;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant138, Context.MapSimStage7_ExtrapolateVelocity.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid.Velocity = Context.MapSimStage7_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Enable"
int Constant139 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Attribute"
int Constant140 = 9;
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
float CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_Output_Div;
CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_(Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_Output_Div);
Context.MapSimStage8_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_Output_Div;
float Constant142 = 0;
Context.MapSimStage8_ComputeDivergence.Emitter.PressureGrid.Pressure = Constant142;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Enable"
int Constant143 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant144 = 3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Enable"
int Constant145 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample To Another Grid"
int Constant146 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant147 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Logic OR (Static)/Logic OR (Static)->Result"
int Constant148 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Resample = Constant148;
int Constant149 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Local.Module.Resample"
int Constant150 = 0;
float3 Constant151 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Unit = Constant151;
int Constant152 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Attribute"
int Constant153 = 3;
int Constant154 = 0;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Write To Transient"
int Constant155 = 1;
Context.MapSimStage9_SolvePressure.Transient.SimFloat = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Enable"
int Constant156 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample To Another Grid"
int Constant157 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant158 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Logic OR (Static)/Logic OR (Static)->Result"
int Constant159 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Resample = Constant159;
int Constant160 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Local.Module.Resample"
int Constant161 = 0;
float3 Constant162 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Unit = Constant162;
int Constant163 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Attribute"
int Constant164 = 4;
int Constant165 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Write To Transient"
int Constant166 = 1;
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
int CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_IterationIndex;
int CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_MaxIterations;
float CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NormalizedIterationIndex;
int CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_LoopIndex;
int CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NumberOfLoops;
float CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NormalizedLoopIndex;
CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_(CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_IterationIndex, CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_MaxIterations, CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NormalizedIterationIndex, CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_LoopIndex, CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NumberOfLoops, CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NormalizedLoopIndex);
Out_IterationIndex = CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_IterationIndex;
Out_MaxIterations = CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_MaxIterations;
Out_NormalizedIterationIndex = CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NormalizedIterationIndex;
Out_LoopIndex = CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_LoopIndex;
Out_NumberOfLoops = CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlslBCB216EB78B8390AFF795C83372D5A1DDA4046E7_Func_Output_NormalizedLoopIndex;
Out_OutFloat = saturate (In_InFloat);
float CustomHlsl5F6F47F5108B9C6F6B4E3706DB5966105A5493D2_Func_Output_OutFloat;
CustomHlsl5F6F47F5108B9C6F6B4E3706DB5966105A5493D2_Func_(In_Value, CustomHlsl5F6F47F5108B9C6F6B4E3706DB5966105A5493D2_Func_Output_OutFloat);
Out_ClampedValue = CustomHlsl5F6F47F5108B9C6F6B4E3706DB5966105A5493D2_Func_Output_OutFloat;
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
int Constant168 = 1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4);
int NiagaraScript_858_Func_Output_IterationIndex;
int NiagaraScript_858_Func_Output_MaxIterations;
float NiagaraScript_858_Func_Output_NormalizedIterationIndex;
int NiagaraScript_858_Func_Output_LoopIndex;
int NiagaraScript_858_Func_Output_NumberOfLoops;
float NiagaraScript_858_Func_Output_NormalizedLoopIndex;
NiagaraScript_858_Func_(NiagaraScript_858_Func_Output_IterationIndex, NiagaraScript_858_Func_Output_MaxIterations, NiagaraScript_858_Func_Output_NormalizedIterationIndex, NiagaraScript_858_Func_Output_LoopIndex, NiagaraScript_858_Func_Output_NumberOfLoops, NiagaraScript_858_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_859_Particle_Func_Output_ClampedValue;
NiagaraScript_859_Particle_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Relaxation, NiagaraScript_859_Particle_Func_Output_ClampedValue, Context);
float4 CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_back;
CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_right, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_left, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_up, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_down, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_front, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_back);
float CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_right;
float CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_left;
float CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_up;
float CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_down;
float CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_front;
float CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_back;
CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_right, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_left, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_up, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_down, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_front, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_back, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_right, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_left, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_up, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_down, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_front, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_back);
float CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence, NiagaraScript_858_Func_Output_IterationIndex, NiagaraScript_859_Particle_Func_Output_ClampedValue, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_right, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_left, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_up, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_down, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_front, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_back, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_right, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_left, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_up, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_down, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_front, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_back, CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
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
float3 CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_Output_Grad;
CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_(Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex, CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_Output_Grad);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_Output_Grad;
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
int Constant170 = 1;
float3 Result61 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient * Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt;
float3 Result62 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity - Result61;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5);
float4 CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_back;
CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_right, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_left, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_up, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_down, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_front, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_back);
float CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_right;
float CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_left;
float CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_up;
float CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_down;
float CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_front;
float CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_back;
CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_right, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_left, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_up, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_down, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_front, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_back, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_right, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_left, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_up, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_down, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_front, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_back);
float3 CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_Output_VelocityOut;
CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_(Result62, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_right, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_left, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_up, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_down, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_front, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_back, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_right, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_left, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_up, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_down, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_front, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_back, CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_Output_VelocityOut);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_Output_VelocityOut;
Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage10_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Enable"
int Constant171 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample To Another Grid"
int Constant172 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant173 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Logic OR (Static)/Logic OR (Static)->Result"
int Constant174 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Resample = Constant174;
int Constant175 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Local.Module.Resample"
int Constant176 = 0;
float3 Constant177 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Unit = Constant177;
int Constant178 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Attribute"
int Constant179 = 7;
int Constant180 = 0;
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
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Write To Transient"
int Constant181 = 1;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.SolidVelocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Enable"
int Constant182 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample To Another Grid"
int Constant183 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant184 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Logic OR (Static)/Logic OR (Static)->Result"
int Constant185 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Resample = Constant185;
int Constant186 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Local.Module.Resample"
int Constant187 = 0;
float3 Constant188 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Unit = Constant188;
int Constant189 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Attribute"
int Constant190 = 4;
int Constant191 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Write To Transient"
int Constant192 = 1;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity;
Out_Execute = In_Plane == clamp(In_PlaneMax / 2 + In_PlaneOffset, 0, In_PlaneMax - 1);
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexX = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexY = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexZ = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7;
int Constant194 = 0;
int GetNumCells_Emitter_SimGridOutput_NumCellsX2;
int GetNumCells_Emitter_SimGridOutput_NumCellsY2;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ2;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX2, GetNumCells_Emitter_SimGridOutput_NumCellsY2, GetNumCells_Emitter_SimGridOutput_NumCellsZ2);
bool CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_Output_Execute;
CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_(Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexX, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexY, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexZ, Constant194, GetNumCells_Emitter_SimGridOutput_NumCellsX2, GetNumCells_Emitter_SimGridOutput_NumCellsY2, GetNumCells_Emitter_SimGridOutput_NumCellsZ2, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexX, GetNumCells_Emitter_SimGridOutput_NumCellsX2, CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_Output_Execute);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.Drawable = CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_Output_Execute;
//SetConstantByStaticVariable "/Grid 3D Visualize Vector Field/Map Get/Map Get->Module.Draw Visualizer"
int Constant195 = 0;
Out_OutVelocity = In_Velocity;
            GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);
            Out_OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity 001/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant197 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX8;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY8;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ8;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ8);
int Constant198 = 1;
int GetNumCells_Emitter_SimGridOutput_NumCellsX3;
int GetNumCells_Emitter_SimGridOutput_NumCellsY3;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ3;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX3, GetNumCells_Emitter_SimGridOutput_NumCellsY3, GetNumCells_Emitter_SimGridOutput_NumCellsZ3);
float3 CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ8, Constant198, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX3, GetNumCells_Emitter_SimGridOutput_NumCellsY3, GetNumCells_Emitter_SimGridOutput_NumCellsZ3, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
int Constant204 = 0;
bool Result63 = NiagaraAll(In_SourceSpace == Constant204);
int Constant205 = 0;
bool Result64 = NiagaraAll(In_DestinationSpace == Constant205);
bool Result65 = Result63 && Result64;
int Constant206 = 1;
bool Result66 = NiagaraAll(In_SourceSpace == Constant206);
int Constant207 = 1;
bool Result67 = NiagaraAll(In_DestinationSpace == Constant207);
bool Result68 = Result66 && Result67;
bool Result69 = Result65 || Result68;
int Constant208 = 2;
bool Result70 = NiagaraAll(In_SourceSpace == Constant208);
int Constant209 = 2;
bool Result71 = NiagaraAll(In_DestinationSpace == Constant209);
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
bool Constant203 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_853_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_853_Func_Output_OutTransform2;
bool NiagaraScript_853_Func_Output_LocalToWorld2;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant203, NiagaraScript_853_Func_Output_bUseOriginal2, NiagaraScript_853_Func_Output_OutTransform2, NiagaraScript_853_Func_Output_LocalToWorld2, Context);
float3 Result90 = mul(float4(In_InPosition,1.0),NiagaraScript_853_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InPosition;
Vector_IfResult2 = Result90;
Out_OutPosition = Vector_IfResult2;
Out_IsInside = round(In_Mask) ==2;
  In_UnitPos.z >= 0 && In_UnitPos.x <= 1 && 
In_UnitPos.y <= 1 && In_UnitPos.z <= 1;
Out_IsInside = In_Mask > 1e-7;
Out_IsInside = round(In_Mask) == 1;
bool Constant214 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult3;
Matrix_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_853_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_853_Func_Output_OutTransform3;
bool NiagaraScript_853_Func_Output_LocalToWorld3;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult3, Constant214, NiagaraScript_853_Func_Output_bUseOriginal3, NiagaraScript_853_Func_Output_OutTransform3, NiagaraScript_853_Func_Output_LocalToWorld3, Context);
float3 Result101 = mul(float4(In_InPosition,1.0),NiagaraScript_853_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InPosition;
Vector_IfResult3 = Result101;
Out_OutPosition = Vector_IfResult3;
bool Constant218 = false;
float4x4 Matrix_IfResult6;
float4x4 Matrix001_IfResult4;
Matrix_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_853_Func_Output_bUseOriginal4;
float4x4 NiagaraScript_853_Func_Output_OutTransform4;
bool NiagaraScript_853_Func_Output_LocalToWorld4;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult4, Constant218, NiagaraScript_853_Func_Output_bUseOriginal4, NiagaraScript_853_Func_Output_OutTransform4, NiagaraScript_853_Func_Output_LocalToWorld4, Context);
float3 Result104 = mul(float4(In_InVector,0.0),NiagaraScript_853_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InVector;
Vector_IfResult4 = Result104;
Out_OutVector = Vector_IfResult4;
bool Constant222 = false;
float4x4 Matrix_IfResult7;
float4x4 Matrix001_IfResult5;
Matrix_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_853_Func_Output_bUseOriginal5;
float4x4 NiagaraScript_853_Func_Output_OutTransform5;
bool NiagaraScript_853_Func_Output_LocalToWorld5;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult7, Matrix001_IfResult5, Constant222, NiagaraScript_853_Func_Output_bUseOriginal5, NiagaraScript_853_Func_Output_OutTransform5, NiagaraScript_853_Func_Output_LocalToWorld5, Context);
float3 Result107 = mul(float4(In_InVector,0.0),NiagaraScript_853_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InVector;
Vector_IfResult5 = Result107;
Out_OutVector = Vector_IfResult5;
int Constant200 = 0;
int Constant201 = 1;
bool Constant202 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Position, Constant200, Constant201, Constant202, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
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
bool CustomHlslA479C658154E00798922BB290711A93B51C117C2_Func_Output_IsInside;
CustomHlslA479C658154E00798922BB290711A93B51C117C2_Func_(W, CustomHlslA479C658154E00798922BB290711A93B51C117C2_Func_Output_IsInside);
float3 Result93 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlsl1781695C29BCB52ED96F4BB5C815FF141DC50C6F_Func_Output_ret;
CustomHlsl1781695C29BCB52ED96F4BB5C815FF141DC50C6F_Func_(Result93, CustomHlsl1781695C29BCB52ED96F4BB5C815FF141DC50C6F_Func_Output_ret);
bool CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_Output_IsInside;
CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_(CustomHlsl1781695C29BCB52ED96F4BB5C815FF141DC50C6F_Func_Output_ret, CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_Output_IsInside);
bool Result94 = !CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_Output_IsInside;
bool Result95 = CustomHlslA479C658154E00798922BB290711A93B51C117C2_Func_Output_IsInside || Result94;
float3 Result96 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result97 = Context.MapSimStage12_FLIP_PICforce.Particles.Position + Result96;
bool CustomHlslD931918DCB45B5476DCC3563A717057531B4B84B_Func_Output_IsInside;
CustomHlslD931918DCB45B5476DCC3563A717057531B4B84B_Func_(W, CustomHlslD931918DCB45B5476DCC3563A717057531B4B84B_Func_Output_IsInside);
float3 Constant210 = float3(0,0,0);
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(Result93, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result98 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result99 = Result98 * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result100 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result99;
int Constant211 = 1;
int Constant212 = 0;
bool Constant213 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result100, Constant211, Constant212, Constant213, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
float3 SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(Result93, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result102 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result103 = Result98 - Result102;
int Constant215 = 0;
int Constant216 = 1;
bool Constant217 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Velocity, Constant215, Constant216, Constant217, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result105 = Result103 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result106 = lerp(Result98,Result105,Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant219 = 1;
int Constant220 = 0;
bool Constant221 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result106, Constant219, Constant220, Constant221, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Constant223 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult4 = Constant223;
float3 Constant224 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult4 = Constant224;
Position_SelectResult4 = Context.MapSimStage12_FLIP_PICforce.Particles.Position;
Velocity_SelectResult4 = Constant210;
Position_SelectResult4 = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Velocity_SelectResult4 = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
float3 Constant225 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult5 = Constant225;
float3 Constant226 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult5 = Constant226;
Position_SelectResult5 = Result97;
Velocity_SelectResult5 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity;
Position_SelectResult5 = Position_SelectResult4;
Velocity_SelectResult5 = Velocity_SelectResult4;
Context.MapSimStage12_FLIP_PICforce.Particles.Position = Position_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity = Velocity_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_Output_IsInside;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlslD931918DCB45B5476DCC3563A717057531B4B84B_Func_Output_IsInside;
bool Constant228 = false;
bool bool_IfResult1;
bool_IfResult1 = Constant228;
bool_IfResult1 = Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = bool_IfResult1;
int Constant242 = 0;
bool Result109 = NiagaraAll(In_SourceSpace == Constant242);
int Constant243 = 0;
bool Result110 = NiagaraAll(In_DestinationSpace == Constant243);
bool Result111 = Result109 && Result110;
int Constant244 = 1;
bool Result112 = NiagaraAll(In_SourceSpace == Constant244);
int Constant245 = 1;
bool Result113 = NiagaraAll(In_DestinationSpace == Constant245);
bool Result114 = Result112 && Result113;
bool Result115 = Result111 || Result114;
int Constant246 = 2;
bool Result116 = NiagaraAll(In_SourceSpace == Constant246);
int Constant247 = 2;
bool Result117 = NiagaraAll(In_DestinationSpace == Constant247);
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
float4x4 Constant239 = (float4x4)0;
float4x4 LocalToWorld_SelectResult6 = Constant239;
float4x4 Constant240 = (float4x4)0;
float4x4 WorldToLocal_SelectResult6 = Constant240;
LocalToWorld_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant241 = false;
bool NiagaraScript_853_Func_Output_bUseOriginal6;
float4x4 NiagaraScript_853_Func_Output_OutTransform6;
bool NiagaraScript_853_Func_Output_LocalToWorld6;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult6, WorldToLocal_SelectResult6, Constant241, NiagaraScript_853_Func_Output_bUseOriginal6, NiagaraScript_853_Func_Output_OutTransform6, NiagaraScript_853_Func_Output_LocalToWorld6, Context);
float3 Result136 = mul(float4(In_Position,1.0),NiagaraScript_853_Func_Output_OutTransform6).xyz;
float3 Constant248 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult7 = Constant248;
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
int Constant230 = 0;
int Result108 = ExecIndex();
bool GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(Result108, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
int Constant231 = 2;
int Constant232 = 1;
bool Constant233 = false;
float4x4 Constant234 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant235 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant236 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant237 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant238 = false;
float3 NiagaraScript_873_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_873_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant231, Constant232, Constant233, Constant234, Constant235, Constant236, Constant237, NiagaraScript_873_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant249 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult8 = Constant249;
NiagaraPosition_SelectResult8 = NiagaraScript_873_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult8 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
bool GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid;
float2 GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(Result108, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 Result137 = mul(float4(NiagaraPosition_SelectResult8,1.0),Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
float3 Output116;
Output116.x = Result137.x;
Output116.y = Result137.y;
Output116.z = Result137.z;
float3 UnitToFloatIndex_Emitter_RasterizationGridOutput_Index;
UnitToFloatIndex_Emitter_RasterizationGrid(Output116, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlsl9D0FD15FAA926ECB08302705292F9C8D2C0E6115Emitter_RasterizationGrid_Func_(Output116, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
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
int Constant251 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 001/Map Get/Map Get->Module.Axis"
int Constant252 = 0;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX, GetNumCells_Emitter_KernelGridOutput_NumCellsY);
int Constant253 = 1;
int Result138 = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant253;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1);
float3 Constant254 = float3(1,0,0);
float CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_(Result138, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1, Constant254, Constant251, CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage14_SmoothinX.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
#if ((SimulationStageIndex == 15) || (SimulationStageIndex == 16)) // Multiple stages
  GetPreviousFloatValueAtIndex_Emitter_SDFGrid(CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
int Constant256 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis/Map Get/Map Get->Module.Axis"
int Constant257 = 1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY1;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX1, GetNumCells_Emitter_KernelGridOutput_NumCellsY1);
int Constant258 = 1;
int Result139 = GetNumCells_Emitter_KernelGridOutput_NumCellsX1 - Constant258;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant259 = float3(0,1,0);
float CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_(Result139, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant259, Constant256, CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage15_SmoothinY.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
int Constant261 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 002/Map Get/Map Get->Module.Axis"
int Constant262 = 2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY2;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX2, GetNumCells_Emitter_KernelGridOutput_NumCellsY2);
int Constant263 = 1;
int Result140 = GetNumCells_Emitter_KernelGridOutput_NumCellsX2 - Constant263;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ1;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1);
float3 Constant264 = float3(0,0,1);
float CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_(Result140, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1, GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1, Constant264, Constant261, CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1);
Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_FaceGrid(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ1);
float3 GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ1, GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value);
float Result141 = length(GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value);
float Constant265 = 0;
bool Result142 = NiagaraAll(Result141 > Constant265);
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
int Constant266 = 0;
bool Result144 = NiagaraAll(((int)Result143) == Constant266);
bool Result145 = Result142 && Result144;
float Output117;
Output117 = Result145;
Context.MapSimStage16_SmoothinZandOutput.Transient.Len = Output117;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.Enable"
int Constant270 = 1;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.SetFromVector"
int Constant271 = 0;
float Constant272 = 0;
float Constant273 = 0;
float Constant274 = 0;
float4 Output118;
Output118.r = Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red;
Output118.g = Constant272;
Output118.b = Constant273;
Output118.a = Constant274;
Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value = Output118;
bool Constant275 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int Constant276 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant275, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
//Begin Spawn Script!
//Begin Initialize Parameter Map Defaults
float2 Constant = float2(50,50);
Context.MapSpawn.Particles.SpriteSize = Constant;
float3 Constant1 = float3(0,0,0);
Context.MapSpawn.Particles.Velocity = Constant1;
//End Initialize Parameter Map Defaults
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use Landscape Collisions"
int Constant2 = 0;
Context.MapSpawn.Grid3D_Flip_GridParticles.dx = Context.MapSpawn.Emitter.dx;
Context.MapSpawn.Grid3D_Flip_GridParticles.UnitToWorld = Context.MapSpawn.Emitter.UnitToWorld;
Context.MapSpawn.Grid3D_Flip_GridParticles.WorldToUnit = Context.MapSpawn.Emitter.WorldToUnit;
Context.MapSpawn.Grid3D_Flip_GridParticles.SpawnedThisFrame = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame;
Context.MapSpawn.Grid3D_Flip_GridParticles.UseLandscape = Constant2;
Context.MapSpawn.Grid3D_Flip_GridParticles.ParticlesPerCell = Context.MapSpawn.Emitter.OVERRIDE.ParticlesPerCell;
Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex;
Context.MapSpawn.Grid3D_Flip_GridParticles.TotalEmissionCells = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells;
float Constant3 = 1;
float3 Constant4 = float3(0,0,0);
Context.MapSpawn.Particles.Position = Constant4;
bool Constant5 = false;
Context.MapSpawn.Transient.Kill = Constant5;
float Constant6 = 1;
EnterStatScope(1 /**Grid3D_Flip_GridParticles_Emitter_Func_*/);
Grid3D_Flip_GridParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Flip_GridParticles_Emitter_Func_*/);
Context.MapSpawn.KillParticles001.KillParticles = Context.MapSpawn.Transient.Kill;
bool Constant28 = true;
Context.MapSpawn.DataInstance.Alive = Constant28;
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
float3 Constant30 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant30;
float3 Constant31 = float3(0,0,-980);
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
float Constant34 = 0;
EnterStatScope(5 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage2_InitTemporaryGrid
//Begin Stage Script: MapSimStage3_InitializeStartVelocityGrid!
float3 Constant36 = float3(0,0,0);
EnterStatScope(6 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage3_InitializeStartVelocityGrid
//Begin Stage Script: MapSimStage4_RasterizeParticles!
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use Rasterization Grid For P2G"
int Constant38 = 1;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.VelocityIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToUnit;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToLocal;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_SimFloatIndex;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.UseRasterizationGrid = Constant38;
bool Constant39 = false;
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
int Constant66 = 1;
Context.MapSimStage5_ComputeBoundary.ScratchDynamicInput_01.UseHighPrecision = Constant66;
int Constant67 = 0;
float3 ScratchDynamicInput_01_Emitter_Func_Output_Output;
ScratchDynamicInput_01_Emitter_Func_(ScratchDynamicInput_01_Emitter_Func_Output_Output, Context);
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld = Context.MapSimStage5_ComputeBoundary.Emitter.UnitToWorld;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.dt = Context.MapSimStage5_ComputeBoundary.Emitter.DeltaTime;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.WorldToLocal = Context.MapSimStage5_ComputeBoundary.Emitter.WorldToLocal;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.CollisionVelocityMult;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UseLandscapeCollisions = Constant67;
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
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Not Use High Precision Collisions"
int Constant87 = 0;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.Boundary;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Enable = Constant87;
EnterStatScope(11 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Grid3D_SetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
int Constant89 = 1;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.Enable = Constant89;
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
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.dt = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.dt;
float Constant114 = 0.1;
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
int Constant135 = 1;
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.VelocityIndex = Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex = Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_SimFloatIndex;
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.UseRasterizationGrid = Constant135;
int Constant136 = 1;
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
float Constant141 = 0;
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
int Constant167 = 1;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx = Context.MapSimStage9_SolvePressure.Emitter.dx;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt = Context.MapSimStage9_SolvePressure.Emitter.DeltaTime;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure = Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.UseHighPrecisionCollisions = Constant167;
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
int Constant169 = 1;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient = Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt = Context.MapSimStage10_ProjectPressure.Emitter.DeltaTime;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity = Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.UseHighPrecisionCollisions = Constant169;
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
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_Visualize_VectorField.UnitToWorld = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.UnitToWorld;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_Visualize_VectorField.VectorValue = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity;
int Constant193 = 0;
EnterStatScope(36 /**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Grid3D_Visualize_VectorField_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_BoundaryIndex;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_VelocityIndex;
int Constant196 = 1;
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
bool Constant199 = false;
EnterStatScope(39 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.MapSimStage12_FLIP_PICforce.KillParticles.KillParticles = Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant227 = true;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = Constant227;
EnterStatScope(40 /**KillParticles_Emitter_Func_*/);
KillParticles_Emitter_Func_(Context);
ExitStatScope(/**KillParticles_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage12_FLIP_PICforce
//Begin Stage Script: MapSimStage13_FillRasterizationGrid!
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.dx;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit = Context.MapSimStage13_FillRasterizationGrid.Emitter.WorldToUnit;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult = Context.MapSimStage13_FillRasterizationGrid.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult;
bool Constant229 = false;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant229;
EnterStatScope(41 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
RasterizationGrid_ParticleSource_Emitter_Func_(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_FillRasterizationGrid
//Begin Stage Script: MapSimStage14_SmoothinX!
int Constant250 = 0;
EnterStatScope(42 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Grid3D_ConvolveAxis001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(43 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_SmoothinX
//Begin Stage Script: MapSimStage15_SmoothinY!
int Constant255 = 0;
EnterStatScope(44 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Grid3D_ConvolveAxis_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(45 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage15_SmoothinY
//Begin Stage Script: MapSimStage16_SmoothinZandOutput!
int Constant260 = 0;
EnterStatScope(46 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Grid3D_ConvolveAxis002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func_*/);
EnterStatScope(47 /**ScratchModule_03_Emitter_Func_*/);
ScratchModule_03_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_03_Emitter_Func_*/);
Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red = Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
float Constant267 = 0;
float Constant268 = 0;
float Constant269 = 0;
EnterStatScope(48 /**Grid3D_SetRTValues_Emitter_Func_*/);
Grid3D_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage16_SmoothinZandOutput
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
// Mirrored from FNiagaraDataInterfaceParametersCS_Landscape
User_LandscapeCollisions_BaseColorVirtualTexture;
User_LandscapeCollisions_BaseColorVirtualTexturePageTable;
User_LandscapeCollisions_BaseColorVirtualTextureSampler;
User_LandscapeCollisions_BaseColorVirtualTextureLWCTile;
User_LandscapeCollisions_BaseColorVirtualTextureWorldToUvTransform;
User_LandscapeCollisions_BaseColorVirtualTextureUnpackSRGB;
User_LandscapeCollisions_BaseColorVirtualTextureUnpackYCoCg;
User_LandscapeCollisions_BaseColorVirtualTextureEnabled;
User_LandscapeCollisions_BaseColorVirtualTexturePackedUniform0;
User_LandscapeCollisions_BaseColorVirtualTexturePackedUniform1;
User_LandscapeCollisions_BaseColorVirtualTextureUniforms;
User_LandscapeCollisions_HeightVirtualTexture;
User_LandscapeCollisions_HeightVirtualTexturePageTable;
User_LandscapeCollisions_HeightVirtualTextureSampler;
User_LandscapeCollisions_HeightVirtualTextureLWCTile;
User_LandscapeCollisions_HeightVirtualTextureWorldToUvTransform;
User_LandscapeCollisions_HeightVirtualTextureEnabled;
User_LandscapeCollisions_HeightVirtualTexturePackedUniform0;
User_LandscapeCollisions_HeightVirtualTexturePackedUniform1;
User_LandscapeCollisions_HeightVirtualTextureUniforms;
User_LandscapeCollisions_NormalVirtualTexture0;
User_LandscapeCollisions_NormalVirtualTexture1;
User_LandscapeCollisions_NormalVirtualTexturePageTable;
User_LandscapeCollisions_NormalVirtualTexture0Sampler;
User_LandscapeCollisions_NormalVirtualTexture1Sampler;
User_LandscapeCollisions_NormalVirtualTextureLWCTile;
User_LandscapeCollisions_NormalVirtualTextureWorldToUvTransform;
User_LandscapeCollisions_NormalVirtualTexturePackedUniform0;
User_LandscapeCollisions_NormalVirtualTexturePackedUniform1;
User_LandscapeCollisions_NormalVirtualTextureUniforms0;
User_LandscapeCollisions_NormalVirtualTextureUniforms1;
User_LandscapeCollisions_NormalVirtualTextureUnpackMode;
User_LandscapeCollisions_NormalVirtualTextureEnabled;
User_LandscapeCollisions_CachedHeightTexture;
User_LandscapeCollisions_CachedHeightTextureSampler;
User_LandscapeCollisions_CachedHeightTextureEnabled;
User_LandscapeCollisions_CachedHeightTextureLWCTile;
User_LandscapeCollisions_CachedHeightTextureWorldToUvTransform;
User_LandscapeCollisions_CachedHeightTextureUvToWorldTransform;
User_LandscapeCollisions_CachedHeightTextureUvScaleBias;
User_LandscapeCollisions_CachedHeightTextureWorldGridSize;
User_LandscapeCollisions_CachedHeightTextureDimension;
User_LandscapeCollisions_PointClampedSampler;
User_LandscapeCollisions_CachedPhysMatTexture;
User_LandscapeCollisions_CachedPhysMatTextureDimension;
FLWCVector4 LwcWorldPos = MakeLWCVector4(GetEngineOwnerLWCTile(), float4(InWorldPos, 1.0f));
FLWCInverseMatrix LwcWorldToUv = MakeLWCInverseMatrix(User_LandscapeCollisions_CachedHeightTextureLWCTile, User_LandscapeCollisions_CachedHeightTextureWorldToUvTransform);
float2 Uv = LWCMultiply(LwcWorldPos, LwcWorldToUv).xy;
Uv = Uv * User_LandscapeCollisions_CachedHeightTextureUvScaleBias.xy + User_LandscapeCollisions_CachedHeightTextureUvScaleBias.zw;
return Uv;
float3 UnpackBaseColorOrigin = User_LandscapeCollisions_BaseColorVirtualTextureWorldToUvTransform[0].xyz;
float3 UnpackBaseColorU = User_LandscapeCollisions_BaseColorVirtualTextureWorldToUvTransform[1].xyz;
float3 UnpackBaseColorV = User_LandscapeCollisions_BaseColorVirtualTextureWorldToUvTransform[2].xyz;
FDFVector3 LwcWorldPos = DFFromTileOffset_Hack(MakeLWCVector3(GetEngineOwnerLWCTile(), InWorldPos));
FDFVector3 LwcBaseColorOrigin = DFFromTileOffset_Hack(MakeLWCVector3(User_LandscapeCollisions_BaseColorVirtualTextureLWCTile, UnpackBaseColorOrigin));
float2 SampleUv = VirtualTextureWorldToUV(LwcWorldPos, LwcBaseColorOrigin, UnpackBaseColorU, UnpackBaseColorV);
0.0f);
VTUniform_Unpack(User_LandscapeCollisions_BaseColorVirtualTextureUniforms));
OutBaseColor = VirtualTextureUnpackBaseColorSRGB(PackedValue);
OutBaseColor = VirtualTextureUnpackBaseColorYCoCg(PackedValue);
OutBaseColor = PackedValue.rgb;
OutIsValid = true;
OutBaseColor = 0.0f;
OutIsValid = false;
float3 UnpackHeightOrigin = User_LandscapeCollisions_HeightVirtualTextureWorldToUvTransform[0].xyz;
float3 UnpackHeightU = User_LandscapeCollisions_HeightVirtualTextureWorldToUvTransform[1].xyz;
float3 UnpackHeightV = User_LandscapeCollisions_HeightVirtualTextureWorldToUvTransform[2].xyz;
float2 UnpackHeightScaleBias = User_LandscapeCollisions_HeightVirtualTextureWorldToUvTransform[3].xy;
FDFVector3 LwcHeightOrigin = DFFromTileOffset_Hack(MakeLWCVector3(User_LandscapeCollisions_HeightVirtualTextureLWCTile, UnpackHeightOrigin));
float2 SampleUv = VirtualTextureWorldToUV(LwcWorldPos, LwcHeightOrigin, UnpackHeightU, UnpackHeightV);
VTUniform_Unpack(User_LandscapeCollisions_HeightVirtualTextureUniforms));
OutHeight = VirtualTextureUnpackHeight(PackedValue, UnpackHeightScaleBias);
float2 Uv = GetCachedHeightTextureUv_User_LandscapeCollisions(InWorldPos);
OutHeight = User_LandscapeCollisions_CachedHeightTexture.SampleLevel(User_LandscapeCollisions_CachedHeightTextureSampler, Uv, 0).x;
OutHeight = InWorldPos.z;
float3 UnpackNormalOrigin = User_LandscapeCollisions_NormalVirtualTextureWorldToUvTransform[0].xyz;
float3 UnpackNormalU = User_LandscapeCollisions_NormalVirtualTextureWorldToUvTransform[1].xyz;
float3 UnpackNormalV = User_LandscapeCollisions_NormalVirtualTextureWorldToUvTransform[2].xyz;
FDFVector3 LwcNormalOrigin = DFFromTileOffset_Hack(MakeLWCVector3(User_LandscapeCollisions_NormalVirtualTextureLWCTile, UnpackNormalOrigin));
float2 SampleUv = VirtualTextureWorldToUV(LwcWorldPos, LwcNormalOrigin, UnpackNormalU, UnpackNormalV);
VTUniform_Unpack(User_LandscapeCollisions_NormalVirtualTextureUniforms0));
VTUniform_Unpack(User_LandscapeCollisions_NormalVirtualTextureUniforms1));
OutNormal = VirtualTextureUnpackNormalBC3BC3(PackedValue0, PackedValue1);
OutNormal = VirtualTextureUnpackNormalBC5BC1(PackedValue0, PackedValue1);
OutNormal = float3(0.0f, 0.0f, 1.0f);
return;
float2 InTextureCoordinates = GetCachedHeightTextureUv_User_LandscapeCollisions(InWorldPos);
float2 TextureSize = User_LandscapeCollisions_CachedHeightTextureDimension.xy;
// taken from LandscapeLayersPS.usf -> CalculateNormalsFromHeights()
float2 TexelSize = 1.0 / TextureSize;
float MaskMinBorderX = (InTextureCoordinates.x <= TexelSize.x) ? 0.0f : 1.0f;
// first pixel X
float MaskMinBorderY = (InTextureCoordinates.y <= TexelSize.y) ? 0.0f : 1.0f;
// first pixel Y
float MaskMaxBorderX = (InTextureCoordinates.x >= 1.0f - TexelSize.x) ? 0.0f : 1.0f;
// last pixel X
float MaskMaxBorderY = (InTextureCoordinates.y >= 1.0f - TexelSize.y) ? 0.0f : 1.0f;
// last pixel Y
// The triangle topology is the following (where C = center, T = top, B = bottom, L = left, R = right and Nx the normals we need to interpolate):
// TL ------ TT
// | \       | \
// |  \      |  \
// |   \     |   \
// | N0 \ N1 | N3 \
// |     \   |     \
// |      \  |      \
// |       \ |       \
// LL ------ CC ------ RR
//   \       | \       |
//    \      |  \      |
//     \     |   \     |
//      \ N2 | N4 \ N5 |
//       \   |     \   |
//        \  |      \  |
//         \ |       \ |
//           BB ------ BR
// So we can retrieve all 7 samples using 4 gathers : 
// Make sure we gather the 4 pixels in the bottom right direction by sampling at (0.75, 0.75) of the pixel (gather retrieves the 4 samples that would be used for bilinear interpolation):
float2 GatherLocation = InTextureCoordinates + 0.25f * TexelSize; 
float4 Red0 = User_LandscapeCollisions_CachedHeightTexture.GatherRed(User_LandscapeCollisions_CachedHeightTextureSampler, GatherLocation - TexelSize);
float4 Red1 = User_LandscapeCollisions_CachedHeightTexture.GatherRed(User_LandscapeCollisions_CachedHeightTextureSampler, GatherLocation);
// [x,y,z] = World Position [w] = valid mask
float4 TL = float4(float2(-1, -1) * User_LandscapeCollisions_CachedHeightTextureWorldGridSize, Red0.w, 1.0f);
float4 TT = float4(float2(+0, -1) * User_LandscapeCollisions_CachedHeightTextureWorldGridSize, Red0.z, 1.0f);
float4 CC = float4(float2(+0, +0) * User_LandscapeCollisions_CachedHeightTextureWorldGridSize, Red0.y, 1.0f);
float4 LL = float4(float2(-1, +0) * User_LandscapeCollisions_CachedHeightTextureWorldGridSize, Red0.x, 1.0f);
float4 RR = float4(float2(+1, +0) * User_LandscapeCollisions_CachedHeightTextureWorldGridSize, Red1.z, 1.0f);
float4 BR = float4(float2(+1, +1) * User_LandscapeCollisions_CachedHeightTextureWorldGridSize, Red1.y, 1.0f);
float4 BB = float4(float2(+0, +1) * User_LandscapeCollisions_CachedHeightTextureWorldGridSize, Red1.x, 1.0f);
// mask out samples that are off the edge of the texture
TL.w *= MaskMinBorderX * MaskMinBorderY;
TT.w *=                  MaskMinBorderY;
// CC should never be off the edge
LL.w *= MaskMinBorderX;
RR.w *= MaskMaxBorderX;
BR.w *= MaskMaxBorderX * MaskMaxBorderY;
BB.w *=                  MaskMaxBorderY;
float3 N0 = ComputeNullableTriangleNormal(CC, LL, TL);
float3 N1 = ComputeNullableTriangleNormal(TL, TT, CC);
float3 N2 = ComputeNullableTriangleNormal(LL, CC, BB);
float3 N3 = ComputeNullableTriangleNormal(RR, CC, TT);
float3 N4 = ComputeNullableTriangleNormal(BR, BB, CC);
float3 N5 = ComputeNullableTriangleNormal(CC, RR, BR);
// average the normals
float3 FinalNormal = normalize(N0 + N1 + N2 + N3 + N4 + N5);
OutNormal = normalize(mul(float4(FinalNormal, 0.0f), User_LandscapeCollisions_CachedHeightTextureUvToWorldTransform).xyz);
int3 SampleIndex = int3(Uv * User_LandscapeCollisions_CachedPhysMatTextureDimension, 0);
OutIndex = (int)User_LandscapeCollisions_CachedPhysMatTexture.Load(SampleIndex).x;
OutIndex = -1;
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
User_GeometryCollectionCollisions_BoundsMin;
User_GeometryCollectionCollisions_BoundsMax;
User_GeometryCollectionCollisions_NumPieces;
User_GeometryCollectionCollisions_RootTransform_Translation;
User_GeometryCollectionCollisions_RootTransform_Rotation;
User_GeometryCollectionCollisions_RootTransform_Scale;
User_GeometryCollectionCollisions_WorldTransformBuffer;
User_GeometryCollectionCollisions_PrevWorldTransformBuffer;
User_GeometryCollectionCollisions_WorldInverseTransformBuffer;
User_GeometryCollectionCollisions_PrevWorldInverseTransformBuffer;
User_GeometryCollectionCollisions_BoundsBuffer;
ByteAddressBuffer  User_GeometryCollectionCollisions_ElementTransforms;
const int BufferOffset = 3 * ElementIndex;
    return float3x4(User_GeometryCollectionCollisions_WorldTransformBuffer[BufferOffset], User_GeometryCollectionCollisions_WorldTransformBuffer[BufferOffset+1], User_GeometryCollectionCollisions_WorldTransformBuffer[BufferOffset+2]);
    return float3x4(User_GeometryCollectionCollisions_WorldInverseTransformBuffer[BufferOffset], User_GeometryCollectionCollisions_WorldInverseTransformBuffer[BufferOffset+1], User_GeometryCollectionCollisions_WorldInverseTransformBuffer[BufferOffset+2]);
    return float3x4(User_GeometryCollectionCollisions_PrevWorldTransformBuffer[BufferOffset], User_GeometryCollectionCollisions_PrevWorldTransformBuffer[BufferOffset+1], User_GeometryCollectionCollisions_PrevWorldTransformBuffer[BufferOffset+2]);
    return float3x4(User_GeometryCollectionCollisions_PrevWorldInverseTransformBuffer[BufferOffset], User_GeometryCollectionCollisions_PrevWorldInverseTransformBuffer[BufferOffset+1], User_GeometryCollectionCollisions_PrevWorldInverseTransformBuffer[BufferOffset+2]);
// Given a world space position (WorldPosition) compute the sphere closest point (position,normal,velocity)
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
OutCount = User_GeometryCollectionCollisions_NumPieces;
OutPosition = User_GeometryCollectionCollisions_RootTransform_Translation;
OutRotation = User_GeometryCollectionCollisions_RootTransform_Rotation;
OutScale = User_GeometryCollectionCollisions_RootTransform_Scale;
OutTranslation = 0;
OutRotation = 0;
OutScale = 0;
uint TransformIndex = InElementIndex * 10 * 4;
FNiagaraTransform ElementTransform = LoadTransform(User_GeometryCollectionCollisions_ElementTransforms, TransformIndex);
OutTranslation = ElementTransform.Translation;
OutRotation = ElementTransform.Rotation;
OutScale = ElementTransform.Scale;
OutCenter = ElementTransform.Translation;
OutBoundingBox = User_GeometryCollectionCollisions_BoundsBuffer[InElementIndex].xyz;
OutCenter = 0;
OutBoundingBox = 0;
const float3 CurrentLocal = mul(DIGeometryCollection_GetInverseTransform_User_GeometryCollectionCollisions(ElementIndex), float4(WorldPosition,1.0)).xyz;
const float3 PreviousLocal = mul(DIGeometryCollection_GetPreviousInverse_User_GeometryCollectionCollisions(ElementIndex), float4(WorldPosition,1.0)).xyz;
return PreviousLocal + TimeFraction * (CurrentLocal-PreviousLocal);
// Given a world space position (WorldPosition) compute the static mesh closest point (position,normal,velocity)
float3 CollisionPosition = float3(0,0,0);
float3 CollisionNormal = float3(0,0,0);
OutClosestDistance = MAX_DISTANCE;
OutClosestPosition = float3(0,0,0);
OutClosestVelocity = float3(0,0,0);
ElementIndex = -1;
int ClosestTransform = -1;
for (int CurrTransform = 0; CurrTransform < User_GeometryCollectionCollisions_NumPieces; ++CurrTransform)
float3 LocalPosition = DIGeometryCollection_GetLocalPosition_User_GeometryCollectionCollisions(WorldPosition,CurrTransform,TimeFraction);
CollisionPosition, CollisionNormal, ClosestTransform, OutClosestDistance);
const float3 PreviousPosition = mul(DIGeometryCollection_GetPreviousTransform_User_GeometryCollectionCollisions(ClosestTransform), float4(CollisionPosition,1.0)).xyz;
const float3 CurrentPosition = mul(DIGeometryCollection_GetCurrentTransform_User_GeometryCollectionCollisions(ClosestTransform), float4(CollisionPosition,1.0)).xyz;
OutClosestVelocity = ( CurrentPosition - PreviousPosition ) / DeltaTime;
OutClosestPosition = PreviousPosition + TimeFraction * (CurrentPosition-PreviousPosition);
ElementIndex = ClosestTransform;
DIGeometryCollection_GetClosestPointNoNormal_User_GeometryCollectionCollisions(WorldPosition,DeltaTime, TimeFraction, ClosestDistance, OutClosestPosition, OutClosestVelocity, ElementIndex);
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
const int BufferOffset = 3 * ElementIndex + User_Collide_Meshes_CurrentOffset;
    return float3x4(User_Collide_Meshes_WorldTransformBuffer[BufferOffset], User_Collide_Meshes_WorldTransformBuffer[BufferOffset+1], User_Collide_Meshes_WorldTransformBuffer[BufferOffset+2]);
    return float3x4(User_Collide_Meshes_InverseTransformBuffer[BufferOffset], User_Collide_Meshes_InverseTransformBuffer[BufferOffset+1], User_Collide_Meshes_InverseTransformBuffer[BufferOffset+2]);
const int BufferOffset = 3 * ElementIndex + User_Collide_Meshes_PreviousOffset;
return User_Collide_Meshes_MeshScaleBuffer[ElementIndex].xyz;
const FDFVector3 LWCWorldPosition = DFFromTileOffset_Hack(MakeLWCVector3(GetEngineOwnerLWCTile(), WorldPosition));
WorldPosition.z <= User_Collide_Meshes_CombinedBBoxWorldMax.z;
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
const float3 CurrentLocal = mul(GetInverseTransform_User_Collide_Meshes(ElementIndex), float4(WorldPosition,1.0)).xyz;
const float3 PreviousLocal = mul(GetPreviousInverse_User_Collide_Meshes(ElementIndex), float4(WorldPosition,1.0)).xyz;
return mul(GetInverseTransform_User_Collide_Meshes(ElementIndex), float4(WorldPosition,1.0)).xyz;
float MinDistance = MAX_DISTANCE;
int ElementIndex = -1;
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
const uint ElementIndexUint = uint(ElementIndex);
const float3 LocalPosition = GetLocalPosition_User_Collide_Meshes(WorldPosition,ElementIndex,TimeFraction);
int OutputIndex = -1;
CollisionPosition, CollisionNormal, OutputIndex, MinDistance);
const float3 PreviousPosition = mul(GetPreviousTransform_User_Collide_Meshes(ElementIndex), float4(CollisionPosition,1.0)).xyz;
const float3 CurrentPosition = mul(GetCurrentTransform_User_Collide_Meshes(ElementIndex), float4(CollisionPosition,1.0)).xyz;
const float3 PreviousNormal = mul(GetPreviousTransform_User_Collide_Meshes(ElementIndex), float4(CollisionNormal,0.0)).xyz;
const float3 CurrentNormal = mul(GetCurrentTransform_User_Collide_Meshes(ElementIndex), float4(CollisionNormal,0.0)).xyz;
OutClosestNormal = normalize(PreviousNormal + TimeFraction * (CurrentNormal-PreviousNormal));
// Given a world space position (WorldPosition) and an element index compute the static mesh closest point using distance fields (position,velocity)
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
int4 Emitter_SDFGrid_AttributeIndices[1];
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
Context.MapSpawn.Emitter.dx = Emitter_dx;
Context.MapSpawn.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.MapSpawn.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame = Emitter_Grid3D_FLIP_Tank_Spawn_HasSpawnedThisFrame;
Context.MapSpawn.Emitter.OVERRIDE.ParticlesPerCell = Emitter_OVERRIDE_ParticlesPerCell;
Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex = Emitter_Grid3D_FLIP_Tank_Spawn_WaterHeightZIndex;
Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells = Emitter_Grid3D_FLIP_Tank_Spawn_TotalEmissionCells;
Context.MapUpdate.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage1_BuildKernelArray.Emitter.Grid3D_InitializeConvolutionKernel.Radius = Emitter_Grid3D_InitializeConvolutionKernel_Radius;
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Emitter_TemporaryGrid_SimFloat;
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Emitter_StartVelocityGrid_StartVelocity;
Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
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
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.dt = Emitter_dt;
Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
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
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
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
Context.MapSimStage16_SmoothinZandOutput.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapSimStage16_SmoothinZandOutput.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSimStage16_SmoothinZandOutput.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapSimStage16_SmoothinZandOutput.Engine.System.RandomSeed = Engine_System_RandomSeed;
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
Context.MapUpdate.Particles = Context.MapSpawn.Particles;
Context.MapUpdate.DataInstance = Context.MapSpawn.DataInstance;
#elif ((SimulationStageIndex == 16)) // MapSimStage16_SmoothinZandOutput
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
>·-ˇ^;zÂ_
ˇ†LœZ;Ár
æ;¡l,{3K¸V]ù˚
%∞2Çø;
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(
_\õ=õ):;l˙<
;©spŸ4◊≈QìX&Î
;©spŸ4◊≈QìX&]
ñ6sôRsHüeß;ÄÃSáÎ
ñ6sôRsHüeß;ÄÃSá]
FParamMap0 Map;
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void CustomHlsl07FCE32A670B6737C5DAB2A3B1D59DE47BE79D94Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
   SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0, 0,0,1);
        SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0, i, 0, Val/Total);
int Constant = 0;
CustomHlsl07FCE32A670B6737C5DAB2A3B1D59DE47BE79D94Emitter_KernelGrid_Func_(Context.Map.Grid3D_CreateConvolutionKernel.Radius, Context);
EnterStatScope(0 /**SimulationStage_2_0*/);
Context.Map.Grid3D_CreateConvolutionKernel.Radius = Context.Map.Emitter.Grid3D_InitializeConvolutionKernel.Radius;
EnterStatScope(1 /**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
ExitStatScope(/**SimulationStage_2_0*/);
EnterStatScope(2 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.Grid3D_InitializeConvolutionKernel.Radius = Emitter_Grid3D_InitializeConvolutionKernel_Radius;
Context.Map.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.Map.Emitter.RandomSeed = Emitter_RandomSeed;
Context.Map.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.Map.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.Map.Engine.ExecIndex = ExecIndex();
Context.Map.Engine.Emitter.ID.ID = 0;
EnterStatScope(3 /**SimulationStage_2_0_MapMain*/);
Simulate(Context);
ExitStatScope(/**SimulationStage_2_0_MapMain*/);
int TmpWriteIndex = OutputIndex(0, false, true);
OutputDataFloat(0, 0, TmpWriteIndex, Context.Map.Particles.Position.x);
OutputDataFloat(0, 1, TmpWriteIndex, Context.Map.Particles.Position.y);
OutputDataFloat(0, 2, TmpWriteIndex, Context.Map.Particles.Position.z);
OutputDataFloat(0, 3, TmpWriteIndex, Context.Map.Particles.SpriteSize.x);
OutputDataFloat(0, 4, TmpWriteIndex, Context.Map.Particles.SpriteSize.y);
OutputDataInt(0, 0, TmpWriteIndex, Context.Map.Particles.UniqueID);
OutputDataFloat(0, 5, TmpWriteIndex, Context.Map.Particles.Velocity.x);
OutputDataFloat(0, 6, TmpWriteIndex, Context.Map.Particles.Velocity.y);
OutputDataFloat(0, 7, TmpWriteIndex, Context.Map.Particles.Velocity.z);
ExitStatScope(/**SimulationStage_2_0_Main*/);
float Constant1 = 0;
Context.Map.Emitter.TemporaryGrid.SimFloat = Constant1;
float Constant = 0;
EnterStatScope(1 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetGridValue_Emitter_PressureGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void ExecutionIndexToGridIndex_Emitter_SimGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlsl264C2E5E15FCCC94CC70092FC88AB71B1660E52EEmitter_TransientGrid_Func_(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
GetGridValue_Emitter_PressureGrid(0, In_IndexX+1, In_IndexY, In_IndexZ, In_ScalarIndex, S_right);
GetGridValue_Emitter_PressureGrid(0, In_IndexX-1, In_IndexY, In_IndexZ, In_ScalarIndex, S_left);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY+1, In_IndexZ, In_ScalarIndex, S_up);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY-1, In_IndexZ, In_ScalarIndex, S_down);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY, In_IndexZ+1, In_ScalarIndex, S_front);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY, In_IndexZ-1, In_ScalarIndex, S_back);
ExecutionIndexToGridIndex_Emitter_PressureGrid(0, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ);
float3 CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_Output_Grad;
CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_(Context.Map.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.Map.Grid3D_ComputeGradient.ScalarIndex, CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_Output_Grad);
Context.Map.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_Output_Grad;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
Out_F_right = round(In_B_right.w) == SOLID_CELL ? 1 : 0;
Out_F_left = round(In_B_left.w) == SOLID_CELL ? 1 : 0;
Out_F_up = round(In_B_up.w) == SOLID_CELL ? 1 : 0;
Out_F_down = round(In_B_down.w) == SOLID_CELL ? 1 : 0;
Out_F_front = round(In_B_front.w) == SOLID_CELL ? 1 : 0;
Out_F_back = round(In_B_back.w) == SOLID_CELL ? 1 : 0;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ, B_center);
int Constant1 = 0;
float3 Result = Context.Map.Grid3D_ProjectPressure.PressureGradient * Context.Map.Grid3D_ProjectPressure.dt;
float3 Result1 = Context.Map.Grid3D_ProjectPressure.Velocity - Result;
ExecutionIndexToGridIndex_Emitter_SimGrid(2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float4 CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_right;
float4 CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_left;
float4 CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_up;
float4 CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_down;
float4 CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_front;
float4 CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_back;
CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_right, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_left, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_up, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_down, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_front, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_back);
float CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_right;
float CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_left;
float CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_up;
float CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_down;
float CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_front;
float CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_back;
CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_(CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_right, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_left, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_up, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_down, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_front, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_back, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_right, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_left, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_up, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_down, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_front, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_back);
float3 CustomHlsl264C2E5E15FCCC94CC70092FC88AB71B1660E52EEmitter_TransientGrid_Func_Output_VelocityOut;
CustomHlsl264C2E5E15FCCC94CC70092FC88AB71B1660E52EEmitter_TransientGrid_Func_(Result1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_right, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_left, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_up, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_down, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_front, CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_Output_F_back, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_right, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_left, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_up, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_down, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_front, CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_Output_B_back, CustomHlsl264C2E5E15FCCC94CC70092FC88AB71B1660E52EEmitter_TransientGrid_Func_Output_VelocityOut);
Context.Map.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlsl264C2E5E15FCCC94CC70092FC88AB71B1660E52EEmitter_TransientGrid_Func_Output_VelocityOut;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity;
Context.Map.Grid3D_ComputeGradient.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_ComputeGradient.ScalarIndex = Context.Map.Emitter.SimGrid_PressureIndex;
EnterStatScope(1 /**Grid3D_ComputeGradient_Emitter_Func_*/);
Context.Map.Grid3D_ProjectPressure.PressureGradient = Context.Map.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.Map.Grid3D_ProjectPressure.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Grid3D_ProjectPressure.Velocity = Context.Map.Emitter.SimGrid.Velocity;
Context.Map.Grid3D_ProjectPressure.UseHighPrecisionCollisions = Constant;
EnterStatScope(2 /**Grid3D_ProjectPressure_Emitter_Func_*/);
Context.Map.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity;
EnterStatScope(3 /**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
EnterStatScope(4 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.dx = Emitter_dx;
Context.Map.Emitter.SimGrid_PressureIndex = Emitter_SimGrid_PressureIndex;
Context.Map.Emitter.DeltaTime = Emitter_DeltaTime;
Context.Map.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
EnterStatScope(5 /**SimulationStage_2_0_MapMain*/);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void GetNumCells_Emitter_SimGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_PlaneOffset, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_Plane, int In_PlaneMax, out bool Out_Execute);
void CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
int Constant = 1;
int Constant3 = 0;
Context.Map.Local.Grid3D_GetFluidAttribute002.Resample = Constant3;
int Constant4 = 0;
int Constant5 = 0;
float3 Constant6 = float3(0,0,0);
Context.Map.Local.Grid3D_GetFluidAttribute002.Unit = Constant6;
int Constant7 = 0;
int Constant8 = 7;
int Constant9 = 0;
ExecutionIndexToGridIndex_Emitter_TransientGrid(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
Output1.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Output1.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Output1.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Output11;
Output11 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity = Output1;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary = Output11;
int Constant10 = 1;
Context.Map.Transient.SolidVelocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.Map.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
int Constant11 = 1;
int Constant12 = 0;
int Constant13 = 0;
Context.Map.Local.Grid3D_GetFluidAttribute003.Resample = Constant14;
int Constant15 = 0;
int Constant16 = 0;
float3 Constant17 = float3(0,0,0);
Context.Map.Local.Grid3D_GetFluidAttribute003.Unit = Constant17;
int Constant18 = 0;
int Constant19 = 4;
int Constant20 = 0;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
int Constant21 = 1;
Context.Map.Transient.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
Context.Map.Transient.Boundary = Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary;
Context.Map.Transient.Velocity = Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
Context.Map.Local.Grid3D_Visualize_VectorField.IndexX = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
Context.Map.Local.Grid3D_Visualize_VectorField.IndexY = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
Context.Map.Local.Grid3D_Visualize_VectorField.IndexZ = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
int Constant23 = 0;
GetNumCells_Emitter_SimGrid(1, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
bool CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_Output_Execute;
CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_(Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, Context.Map.Local.Grid3D_Visualize_VectorField.IndexY, Context.Map.Local.Grid3D_Visualize_VectorField.IndexZ, Constant23, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, GetNumCells_Emitter_SimGridOutput_NumCellsX, CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_Output_Execute);
Context.Map.Local.Grid3D_Visualize_VectorField.Drawable = CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_Output_Execute;
int Constant24 = 0;
        GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(0, TmpIndexX, TmpIndexY, TmpIndexZ, TmpV);
            GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(1, TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);
int Constant26 = 0;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2);
int Constant27 = 1;
GetNumCells_Emitter_SimGrid(1, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float3 CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Constant27, Context.Map.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.Map.Transient.Velocity, Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
EnterStatScope(1 /**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
EnterStatScope(2 /**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
EnterStatScope(3 /**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
Context.Map.Grid3D_Visualize_VectorField.UnitToWorld = Context.Map.Emitter.UnitToWorld;
Context.Map.Grid3D_Visualize_VectorField.VectorValue = Context.Map.Emitter.SimGrid.Velocity;
int Constant22 = 0;
EnterStatScope(4 /**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.Map.Emitter.SimGrid_BoundaryIndex;
Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
int Constant25 = 1;
EnterStatScope(5 /**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Context.Map.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity;
EnterStatScope(6 /**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
EnterStatScope(7 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.Map.Emitter.SimGrid_BoundaryIndex = Emitter_SimGrid_BoundaryIndex;
Context.Map.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
EnterStatScope(8 /**SimulationStage_2_0_MapMain*/);
void NiagaraScript_785_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TransientGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void CustomHlsl7D4A0578E3963D141C37C58BC87F117D793284B5_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlslCE07342C0072B2EE0412A0F9F923174B8C520878_Func_(float3 In_UnitPos, out float Out_ret);
void CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_(float In_Mask, out bool Out_IsInside);
void SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, float3 In_Unit, out float3 Out_Value);
void SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(int In_InstanceData, float3 In_Unit, out float3 Out_Value);
bool Result = NiagaraAll(In_SourceSpace == Constant5);
int Constant6 = 0;
bool Result1 = NiagaraAll(In_DestinationSpace == Constant6);
bool Result2 = Result && Result1;
int Constant7 = 1;
bool Result3 = NiagaraAll(In_SourceSpace == Constant7);
int Constant8 = 1;
bool Result4 = NiagaraAll(In_DestinationSpace == Constant8);
bool Result5 = Result3 && Result4;
bool Result6 = Result2 || Result5;
int Constant9 = 2;
bool Result7 = NiagaraAll(In_SourceSpace == Constant9);
int Constant10 = 2;
bool Result8 = NiagaraAll(In_DestinationSpace == Constant10);
bool Result9 = Result7 && Result8;
bool Result10 = Result6 || Result9;
bool Result11 = Result && Result8;
bool Result12 = Result7 && Result1;
bool Result13 = Result11 || Result12;
bool Result14 = In_bLocalSpace && Result13;
bool Result15 = Result10 || Result14;
bool Result16 = !In_bLocalSpace;
bool Result17 = Result && Result4;
bool Result18 = Result3 && Result1;
bool Result19 = Result17 || Result18;
bool Result20 = Result16 && Result19;
bool Result21 = Result15 || Result20;
bool Result22 = In_bLocalSpace && Result17;
bool Result23 = Result7 && Result4;
bool Result24 = Result22 || Result23;
bool Result25 = Result16 && Result12;
bool Result26 = Result24 || Result25;
Out_bUseOriginal = Result21;
Out_LocalToWorld = Result26;
bool Constant4 = false;
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_785_Func_Output_bUseOriginal;
float4x4 NiagaraScript_785_Func_Output_OutTransform;
bool NiagaraScript_785_Func_Output_LocalToWorld;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant4, NiagaraScript_785_Func_Output_bUseOriginal, NiagaraScript_785_Func_Output_OutTransform, NiagaraScript_785_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_785_Func_Output_OutTransform).xyz;
Vector_IfResult = Result27;
bool Constant15 = false;
Matrix_IfResult2 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_785_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_785_Func_Output_OutTransform1;
bool NiagaraScript_785_Func_Output_LocalToWorld1;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant15, NiagaraScript_785_Func_Output_bUseOriginal1, NiagaraScript_785_Func_Output_OutTransform1, NiagaraScript_785_Func_Output_LocalToWorld1, Context);
float3 Result38 = mul(float4(In_InPosition,1.0),NiagaraScript_785_Func_Output_OutTransform1).xyz;
Vector_IfResult1 = In_InPosition;
Vector_IfResult1 = Result38;
Out_OutPosition = Vector_IfResult1;
bool Constant19 = false;
Matrix_IfResult3 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_785_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_785_Func_Output_OutTransform2;
bool NiagaraScript_785_Func_Output_LocalToWorld2;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant19, NiagaraScript_785_Func_Output_bUseOriginal2, NiagaraScript_785_Func_Output_OutTransform2, NiagaraScript_785_Func_Output_LocalToWorld2, Context);
float3 Result41 = mul(float4(In_InVector,0.0),NiagaraScript_785_Func_Output_OutTransform2).xyz;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result41;
Out_OutVector = Vector_IfResult2;
bool Constant23 = false;
Matrix_IfResult4 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_785_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_785_Func_Output_OutTransform3;
bool NiagaraScript_785_Func_Output_LocalToWorld3;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant23, NiagaraScript_785_Func_Output_bUseOriginal3, NiagaraScript_785_Func_Output_OutTransform3, NiagaraScript_785_Func_Output_LocalToWorld3, Context);
float3 Result44 = mul(float4(In_InVector,0.0),NiagaraScript_785_Func_Output_OutTransform3).xyz;
Vector_IfResult3 = In_InVector;
Vector_IfResult3 = Result44;
Out_OutVector = Vector_IfResult3;
int Constant2 = 1;
bool Constant3 = false;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.Map.Particles.Position, Constant1, Constant2, Constant3, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
Output1.x = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.x;
Output1.y = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.y;
Output1.z = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.z;
float3 Result28 = mul(float4(((float3)Output1),1.0),Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
UnitToFloatIndex_Emitter_TransientGrid(1, Result28, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result29 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
X = Result29.x;
Y = Result29.y;
Z = Result29.z;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, X, Y, Z, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
X1 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Y1 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Z1 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
W = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
bool CustomHlsl7D4A0578E3963D141C37C58BC87F117D793284B5_Func_Output_IsInside;
CustomHlsl7D4A0578E3963D141C37C58BC87F117D793284B5_Func_(W, CustomHlsl7D4A0578E3963D141C37C58BC87F117D793284B5_Func_Output_IsInside);
float3 Result30 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlslCE07342C0072B2EE0412A0F9F923174B8C520878_Func_Output_ret;
CustomHlslCE07342C0072B2EE0412A0F9F923174B8C520878_Func_(Result30, CustomHlslCE07342C0072B2EE0412A0F9F923174B8C520878_Func_Output_ret);
bool CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_Output_IsInside;
CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_(CustomHlslCE07342C0072B2EE0412A0F9F923174B8C520878_Func_Output_ret, CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_Output_IsInside);
bool Result31 = !CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_Output_IsInside;
bool Result32 = CustomHlsl7D4A0578E3963D141C37C58BC87F117D793284B5_Func_Output_IsInside || Result31;
float3 Result33 = Context.Map.Particles.Velocity * Context.Map.Engine.DeltaTime;
float3 Result34 = Context.Map.Particles.Position + Result33;
bool CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_Output_IsInside;
CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_(W, CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_Output_IsInside);
float3 Constant11 = float3(0,0,0);
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(0, Result30, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result35 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result36 = Result35 * Context.Map.Engine.DeltaTime;
float3 Result37 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result36;
int Constant12 = 1;
bool Constant14 = false;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result37, Constant12, Constant13, Constant14, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(2, Result30, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result39 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result40 = Result35 - Result39;
int Constant17 = 1;
bool Constant18 = false;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.Map.Particles.Velocity, Constant16, Constant17, Constant18, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result42 = Result40 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result43 = lerp(Result35,Result42,Context.Map.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant20 = 1;
bool Constant22 = false;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result43, Constant20, Constant21, Constant22, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Position_SelectResult = Constant24;
float3 Constant25 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult = Constant25;
Position_SelectResult = Context.Map.Particles.Position;
Velocity_SelectResult = Constant11;
Position_SelectResult = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Velocity_SelectResult = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
float3 Constant26 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult1 = Constant26;
float3 Velocity_SelectResult1 = Constant27;
Position_SelectResult1 = Result34;
Velocity_SelectResult1 = Context.Map.Particles.Velocity;
Position_SelectResult1 = Position_SelectResult;
Velocity_SelectResult1 = Velocity_SelectResult;
Context.Map.Particles.Position = Position_SelectResult1;
Context.Map.Particles.Velocity = Velocity_SelectResult1;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_Output_IsInside;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_Output_IsInside;
bool_IfResult = Context.Map.DataInstance.Alive;
Context.Map.DataInstance.Alive = bool_IfResult;
Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.Map.Emitter.LocalToWorld;
Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_FLIP_ParticleUpdate.PicOrFlip = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio;
bool Constant = false;
EnterStatScope(1 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.Map.KillParticles.KillParticles = Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
Context.Map.DataInstance.Alive = Constant28;
EnterStatScope(2 /**KillParticles_Emitter_Func_*/);
EnterStatScope(3 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.LocalToWorld = Emitter_LocalToWorld;
Context.Map.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio = Emitter_Grid3D_FLIP_FLUID_CONTROLS_PICFLIPRatio;
Context.Map.Engine.DeltaTime = Engine_DeltaTime;
Context.Map.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.Map.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.Map.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.Map.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
EnterStatScope(4 /**SimulationStage_2_0_MapMain*/);
void GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void NiagaraScript_805_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float2 Out_Value);
void UnitToFloatIndex_Emitter_RasterizationGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void GetNumCells_Emitter_RasterizationGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void InterlockedMinFloatGridValue_Emitter_RasterizationGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslB544A9E538432FF18AEF98B568B5655BE5F20F30Emitter_RasterizationGrid_Func_(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
bool Result1 = NiagaraAll(In_SourceSpace == Constant13);
bool Result2 = NiagaraAll(In_DestinationSpace == Constant14);
bool Result3 = Result1 && Result2;
int Constant15 = 1;
bool Result4 = NiagaraAll(In_SourceSpace == Constant15);
int Constant16 = 1;
bool Result5 = NiagaraAll(In_DestinationSpace == Constant16);
bool Result6 = Result4 && Result5;
bool Result7 = Result3 || Result6;
int Constant17 = 2;
bool Result8 = NiagaraAll(In_SourceSpace == Constant17);
int Constant18 = 2;
bool Result9 = NiagaraAll(In_DestinationSpace == Constant18);
bool Result10 = Result8 && Result9;
bool Result11 = Result7 || Result10;
bool Result12 = Result1 && Result9;
bool Result13 = Result8 && Result2;
bool Result14 = Result12 || Result13;
bool Result15 = In_bLocalSpace && Result14;
bool Result16 = Result11 || Result15;
bool Result17 = !In_bLocalSpace;
bool Result18 = Result1 && Result5;
bool Result19 = Result4 && Result2;
bool Result20 = Result18 || Result19;
bool Result21 = Result17 && Result20;
bool Result22 = Result16 || Result21;
bool Result23 = In_bLocalSpace && Result18;
bool Result24 = Result8 && Result5;
bool Result25 = Result23 || Result24;
bool Result26 = Result17 && Result13;
bool Result27 = Result25 || Result26;
Matrix_IfResult = In_LocalToWorldTransform;
Matrix_IfResult = In_WorldToLocalTransform;
Out_bUseOriginal = Result22;
Out_OutTransform = Matrix_IfResult;
Out_LocalToWorld = Result27;
float4x4 Constant10 = (float4x4)0;
float4x4 LocalToWorld_SelectResult = Constant10;
float4x4 Constant11 = (float4x4)0;
float4x4 WorldToLocal_SelectResult = Constant11;
LocalToWorld_SelectResult = Context.Map.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult = Context.Map.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant12 = false;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant12, NiagaraScript_785_Func_Output_bUseOriginal, NiagaraScript_785_Func_Output_OutTransform, NiagaraScript_785_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_785_Func_Output_OutTransform).xyz;
float3 Constant19 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult1 = Constant19;
NiagaraPosition_SelectResult1 = In_Position;
NiagaraPosition_SelectResult1 = Result28;
Out_Position = NiagaraPosition_SelectResult1;
        InterlockedMinFloatGridValue_Emitter_RasterizationGrid(0, CurrIndex.x, CurrIndex.y, CurrIndex.z, 0, IndexDist * In_dx, IGNORE);
int Result = ExecIndex();
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(1, Result, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
int Constant2 = 2;
int Constant3 = 1;
float4x4 Constant5 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant6 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant7 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant8 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant9 = false;
float3 NiagaraScript_805_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_805_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant2, Constant3, Constant4, Constant5, Constant6, Constant7, Constant8, NiagaraScript_805_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant20 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult2 = Constant20;
NiagaraPosition_SelectResult2 = NiagaraScript_805_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult2 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(1, Result, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 Result29 = mul(float4(NiagaraPosition_SelectResult2,1.0),Context.Map.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
Output1.x = Result29.x;
Output1.y = Result29.y;
Output1.z = Result29.z;
UnitToFloatIndex_Emitter_RasterizationGrid(0, Output1, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
GetNumCells_Emitter_RasterizationGrid(0, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlslB544A9E538432FF18AEF98B568B5655BE5F20F30Emitter_RasterizationGrid_Func_(Output1, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.Map.RasterizationGrid_ParticleSource.dx, Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth, Context.Map.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
Context.Map.RasterizationGrid_ParticleSource.dx = Context.Map.Emitter.RasterizationGrid3D_Initialize.dx;
Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth = Context.Map.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.Map.RasterizationGrid_ParticleSource.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.RasterizationGrid_ParticleSource.RadiusMult = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult;
Context.Map.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant;
EnterStatScope(1 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
Context.Map.Emitter.RasterizationGrid3D_Initialize.dx = Emitter_RasterizationGrid3D_Initialize_dx;
Context.Map.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth = Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult = Emitter_Grid3D_FLIP_FLUID_CONTROLS_SDFParticleSizeMult;
ád˘Ôn;…G¶ﬁ=m˙ÄD(
void GetNumCells_Emitter_KernelGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetFloatGridValue_Emitter_RasterizationGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void GetPreviousFloatValue_Emitter_KernelGrid_Attributek(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
  GetFloatGridValue_Emitter_RasterizationGrid(0, CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
  GetPreviousFloatValue_Emitter_KernelGrid_Attributek(1, abs(uu), 0, KernelValue);
GetNumCells_Emitter_KernelGrid(1, GetNumCells_Emitter_KernelGridOutput_NumCellsX, GetNumCells_Emitter_KernelGridOutput_NumCellsY);
int Result = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant3;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(0, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
float3 Constant4 = float3(1,0,0);
float CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Constant4, Constant1, CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.Map.Emitter.SDFGrid.SDF = Context.Map.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
EnterStatScope(1 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.Map.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(2 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
void ExecutionIndexToGridIndex_Emitter_SDFGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_SDFGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
  GetPreviousFloatValueAtIndex_Emitter_SDFGrid(0, CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
ExecutionIndexToGridIndex_Emitter_SDFGrid(0, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
GetNumCells_Emitter_SDFGrid(0, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant4 = float3(0,1,0);
float CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant4, Constant1, CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.Map.Emitter.SDFGrid.SDF = Context.Map.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
EnterStatScope(1 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.Map.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(2 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
2£;íy–¬
ád˘Ôn;…G¶ﬁ=m˙ÄD(¢
‰S∫Ì=M9O†<ù.Ü;mî†
void ExecToIndex_Emitter_SimRT(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(int In_InstanceData, bool In_Enabled, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
float3 Constant4 = float3(0,0,1);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
float Constant10 = 0;
float Constant11 = 0;
float Constant12 = 0;
float4 Output1;
Output1.r = Context.Map.Grid3D_SetRTValues.Red;
Output1.g = Constant10;
Output1.b = Constant11;
Output1.a = Constant12;
Context.Map.Local.Grid3D_SetRTValues.Value = Output1;
bool Constant13 = true;
ExecToIndex_Emitter_SimRT(2, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(2, Constant13, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.Map.Local.Grid3D_SetRTValues.Value);
EnterStatScope(1 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Context.Map.Grid3D_SetRTValues.Red = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
float Constant5 = 0;
float Constant6 = 0;
float Constant7 = 0;
EnterStatScope(2 /**Grid3D_SetRTValues_Emitter_Func_*/);
Context.Map.Emitter.StartVelocityGrid.StartVelocity = Constant1;
float3 Constant = float3(0,0,0);
EnterStatScope(1 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
void UnitToFloatIndex_Emitter_TemporaryGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void SetGridValue_Emitter_TemporaryGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslB7AFD42C69DDE685BF5C57E72A28C76C3C0EF335Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
bool Result = NiagaraAll(In_SourceSpace == Constant7);
int Constant8 = 0;
bool Result1 = NiagaraAll(In_DestinationSpace == Constant8);
int Constant9 = 1;
bool Result3 = NiagaraAll(In_SourceSpace == Constant9);
bool Result4 = NiagaraAll(In_DestinationSpace == Constant10);
int Constant11 = 2;
bool Result7 = NiagaraAll(In_SourceSpace == Constant11);
int Constant12 = 2;
bool Result8 = NiagaraAll(In_DestinationSpace == Constant12);
bool Constant6 = false;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant6, NiagaraScript_785_Func_Output_bUseOriginal, NiagaraScript_785_Func_Output_OutTransform, NiagaraScript_785_Func_Output_LocalToWorld, Context);
bool Constant16 = false;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant16, NiagaraScript_785_Func_Output_bUseOriginal1, NiagaraScript_785_Func_Output_OutTransform1, NiagaraScript_785_Func_Output_LocalToWorld1, Context);
float3 Result29 = mul(float4(In_InVector,0.0),NiagaraScript_785_Func_Output_OutTransform1).xyz;
Vector_IfResult1 = Result29;
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 0, GridWeightXYZ*In_Velocity.x, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 1, GridWeightXYZ*In_Velocity.y, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 2, GridWeightXYZ*In_Velocity.z, IGNORE);
                InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 3, GridWeightXYZ, IGNORE);
                SetGridValue_Emitter_TemporaryGrid(2, XIndexInt+x, YIndexInt+y, ZIndexInt+z, In_BoundaryIndex, 3, IGNORE);
int Constant4 = 1;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.Map.Particles.Position, Constant3, Constant4, Constant5, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result28 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
UnitToFloatIndex_Emitter_TemporaryGrid(2, Result28, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant14 = 1;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.Map.Particles.Velocity, Constant13, Constant14, Constant15, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result30 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlslB7AFD42C69DDE685BF5C57E72A28C76C3C0EF335Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result30, Context.Map.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
Context.Map.Grid3D_FLIP_RasterizeParticles.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.Map.Emitter.WorldToLocal;
Context.Map.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.Map.Emitter.SimGrid_SimFloatIndex;
Context.Map.Grid3D_FLIP_RasterizeParticles.UseRasterizationGrid = Constant;
bool Constant1 = false;
EnterStatScope(1 /**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Context.Map.Emitter.WorldToLocal = Emitter_WorldToLocal;
Context.Map.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
T5`;BºÎ8
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void IndexToUnit_Emitter_SimGrid(int In_InstanceData, float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(int In_InstanceData, float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, float In_MaxDistance, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestVelocity);
void GetHeight_User_LandscapeCollisions(int In_InstanceData, float3 In_WorldPos, out float Out_Value, out bool Out_IsValid);
void CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
Context.Map.Local.Grid3D_GetFluidAttribute.Resample = Constant3;
Context.Map.Local.Grid3D_GetFluidAttribute.Unit = Constant6;
int Constant8 = 3;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
Context.Map.Transient.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.Map.Transient.Boundary = Context.Map.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
float3 Constant14 = float3(0,0,0);
Out_Output = Constant14;
int Constant17 = 0;
int Constant18 = 1;
Output1.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output1.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output1.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result = Output1 + Context.Map.Grid3D_ComputeBoundary.OffsetSamplePosition;
X = Result.x;
Y = Result.y;
Z = Result.z;
IndexToUnit_Emitter_SimGrid(1, X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
Output11.x = IndexToUnit_Emitter_SimGridOutput_Unit.x;
Output11.y = IndexToUnit_Emitter_SimGridOutput_Unit.y;
Output11.z = IndexToUnit_Emitter_SimGridOutput_Unit.z;
float3 Result1 = mul(float4(Output11,1.0),Context.Map.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.Map.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit;
Context.Map.Transient.SolidVelocity = Constant22;
Context.Map.Local.Grid3D_ComputeBoundary.WorldPos = Result1;
int Constant23 = 2;
float CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_Output_Boundary;
CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant23, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_Output_Boundary);
float Constant24 = 1e+17;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Accurate SDF Iteration"
int Constant25 = 0;
float Constant26 = 0.001;
float GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity;
GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(3, Context.Map.Local.Grid3D_ComputeBoundary.WorldPos, Context.Map.Engine.WorldDeltaTime, Context.Map.Engine.System.TimeStepFraction, Constant26, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity);
float Constant27 = 0;
bool Result2 = NiagaraAll(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance <= Constant27);
float Constant28 = 1;
float3 Result3 = GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity * Context.Map.Grid3D_ComputeBoundary.VelocityScale;
float3 Result4 = Context.Map.Transient.SolidVelocity + Result3;
float Constant29 = (0.0);
float NiagaraFloat_SelectResult = Constant29;
float3 Constant30 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult = Constant30;
NiagaraFloat_SelectResult = Constant28;
Vector3f_SelectResult = Result4;
NiagaraFloat_SelectResult = CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_Output_Boundary;
Vector3f_SelectResult = Context.Map.Transient.SolidVelocity;
Context.Map.Transient.SolidVelocity = Vector3f_SelectResult;
float Result5 = min(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, Constant24);
Output12.x = Context.Map.Local.Grid3D_ComputeBoundary.WorldPos.x;
Output12.y = Context.Map.Local.Grid3D_ComputeBoundary.WorldPos.y;
Output12.z = Context.Map.Local.Grid3D_ComputeBoundary.WorldPos.z;
X1 = Output12.x;
Y1 = Output12.y;
Z1 = Output12.z;
float GetHeight_User_LandscapeCollisionsOutput_Value;
bool GetHeight_User_LandscapeCollisionsOutput_IsValid;
GetHeight_User_LandscapeCollisions(4, Context.Map.Local.Grid3D_ComputeBoundary.WorldPos, GetHeight_User_LandscapeCollisionsOutput_Value, GetHeight_User_LandscapeCollisionsOutput_IsValid);
bool Result6 = NiagaraAll(Z1 < GetHeight_User_LandscapeCollisionsOutput_Value);
float Constant31 = 1;
float Result7 = Z1 - GetHeight_User_LandscapeCollisionsOutput_Value;
float Result8 = min(Result7, Result5);
float Constant32 = (0.0);
float NiagaraFloat_SelectResult1 = Constant32;
float Constant33 = (0.0);
float NiagaraFloat001_SelectResult1 = Constant33;
NiagaraFloat_SelectResult1 = Constant31;
NiagaraFloat001_SelectResult1 = Result8;
NiagaraFloat_SelectResult1 = NiagaraFloat_SelectResult;
NiagaraFloat001_SelectResult1 = Result5;
int Constant34 = 1;
float CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary;
CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_(NiagaraFloat_SelectResult1, Context.Map.Transient.Boundary, CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary);
Context.Map.Transient.Boundary = CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary;
Context.Map.Transient.BoundarySignedDistance = NiagaraFloat001_SelectResult1;
int Constant36 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Attribute"
int Constant37 = 7;
ExecutionIndexToGridIndex_Emitter_TransientGrid(5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
X2 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.x;
Y2 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.y;
Z2 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.z;
float4 Output13;
Output13.x = X2;
Output13.y = Y2;
Output13.z = Z2;
Output13.w = Context.Map.Grid3D_SetFluidAttribute004.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output13);
int Constant39 = 0;
EnterStatScope(1 /**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Context.Map.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary = Context.Map.Transient.SimFloat;
EnterStatScope(2 /**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
int Constant11 = 0;
Context.Map.ScratchDynamicInput_01.UseHighPrecision = Constant11;
Context.Map.Grid3D_ComputeBoundary.UnitToWorld = Context.Map.Emitter.UnitToWorld;
Context.Map.Grid3D_ComputeBoundary.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Grid3D_ComputeBoundary.WorldToLocal = Context.Map.Emitter.WorldToLocal;
Context.Map.Grid3D_ComputeBoundary.VelocityScale = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.CollisionVelocityMult;
Context.Map.Grid3D_ComputeBoundary.UseLandscapeCollisions = Constant12;
Context.Map.Grid3D_ComputeBoundary.OffsetSamplePosition = ScratchDynamicInput_01_Emitter_Func_Output_Output;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Z = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45X = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43X = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Z = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Y = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Y = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
EnterStatScope(3 /**Grid3D_ComputeBoundary_Emitter_Func_*/);
int Constant35 = 1;
Context.Map.Grid3D_SetFluidAttribute004.Boundary = Context.Map.Transient.Boundary;
Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity = Context.Map.Transient.SolidVelocity;
Context.Map.Grid3D_SetFluidAttribute004.Enable = Constant35;
EnterStatScope(4 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
int Constant38 = 0;
Context.Map.Grid3D_SetFluidAttribute003.Boundary = Context.Map.Transient.BoundarySignedDistance;
Context.Map.Grid3D_SetFluidAttribute003.SolidVelocity = Context.Map.Transient.SolidVelocity;
Context.Map.Grid3D_SetFluidAttribute003.Enable = Constant38;
EnterStatScope(5 /**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
EnterStatScope(6 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.CollisionVelocityMult = Emitter_Grid3D_FLIP_FLUID_CONTROLS_CollisionVelocityMult;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryUp;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryLeft;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryRight;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryDown;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryFront;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack = Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryBack;
Context.Map.Engine.WorldDeltaTime = Engine_WorldDeltaTime;
Context.Map.Engine.System.TimeStepFraction = Engine_System_TimeStepFraction;
EnterStatScope(7 /**SimulationStage_2_0_MapMain*/);
void ExecutionIndexToUnit_Emitter_TransientGrid(int In_InstanceData, out float3 Out_Unit);
void CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float In_dt, out float Out_theta_ppp, out float Out_theta_ppn, out float Out_theta_pnn, out float Out_theta_pnp, out float Out_theta_nnp, out float Out_theta_npp, out float Out_theta_npn, out float Out_theta_nnn, out float3 Out_AverageSolidVelocity);
void CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_(float3 In_theta, out float Out_AreaFraction);
void NiagaraScript_813_Func_(float3 In_INPUT_VAR, out float Out_AreaFraction, inout FSimulationContext Context);
void CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void NiagaraScript_812_Func_(float In_ppp, float In_ppn, float In_pnn, float In_pnp, float In_nnp, float In_npp, float In_npn, out float3 Out_FaceFractions, inout FSimulationContext Context);
void CustomHlsl0017216087B0E5D48622728598E9900CEC42174EFED_Func_(float In_theta_ppp, float In_theta_ppn, float In_theta_pnn, float In_theta_pnp, float In_theta_nnp, float In_theta_npp, float In_theta_npn, float In_theta_nnn, out bool Out_IsFullyInsideBoundary);
void CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_(float3 In_Face, float In_MinFaceFraction, out float3 Out_FaceFraction);
void GetNumCells_Emitter_TransientGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void ExecutionIndexToGridIndex_Emitter_FaceGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
Context.Map.Local.Grid3D_GetFluidAttribute006.Resample = Constant3;
Context.Map.Local.Grid3D_GetFluidAttribute006.Unit = Constant6;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
Context.Map.Transient.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ, TmpSolidVelocity_Boundary);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ-1, TmpSolidVelocity_Boundary);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY-1, In_IndexZ-1, TmpSolidVelocity_Boundary);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY-1, In_IndexZ, TmpSolidVelocity_Boundary);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY-1, In_IndexZ, TmpSolidVelocity_Boundary);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY, In_IndexZ, TmpSolidVelocity_Boundary);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY, In_IndexZ-1, TmpSolidVelocity_Boundary);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY-1, In_IndexZ-1, TmpSolidVelocity_Boundary);
float CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_Output_AreaFraction;
CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_(In_INPUT_VAR, CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_Output_AreaFraction);
Out_AreaFraction = CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_Output_AreaFraction;
float3 CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri0;
float3 CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri1;
float3 CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri2;
float3 CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri3;
CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_(In_ppp, In_ppn, In_pnn, In_pnp, CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri0, CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri1, CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri2, CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri3);
float NiagaraScript_813_Func_Output_AreaFraction;
NiagaraScript_813_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri0, NiagaraScript_813_Func_Output_AreaFraction, Context);
float NiagaraScript_813_Func_Output_AreaFraction1;
NiagaraScript_813_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri1, NiagaraScript_813_Func_Output_AreaFraction1, Context);
float NiagaraScript_813_Func_Output_AreaFraction2;
NiagaraScript_813_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri2, NiagaraScript_813_Func_Output_AreaFraction2, Context);
float NiagaraScript_813_Func_Output_AreaFraction3;
NiagaraScript_813_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri3, NiagaraScript_813_Func_Output_AreaFraction3, Context);
float CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_Output_Avg;
CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_(NiagaraScript_813_Func_Output_AreaFraction, NiagaraScript_813_Func_Output_AreaFraction1, NiagaraScript_813_Func_Output_AreaFraction2, NiagaraScript_813_Func_Output_AreaFraction3, CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_Output_Avg);
float3 CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri0;
float3 CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri1;
float3 CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri2;
float3 CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri3;
CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_(In_ppp, In_ppn, In_npp, In_npn, CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri0, CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri1, CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri2, CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri3);
float NiagaraScript_813_Func_Output_AreaFraction4;
NiagaraScript_813_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri0, NiagaraScript_813_Func_Output_AreaFraction4, Context);
float NiagaraScript_813_Func_Output_AreaFraction5;
NiagaraScript_813_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri1, NiagaraScript_813_Func_Output_AreaFraction5, Context);
float NiagaraScript_813_Func_Output_AreaFraction6;
NiagaraScript_813_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri2, NiagaraScript_813_Func_Output_AreaFraction6, Context);
float NiagaraScript_813_Func_Output_AreaFraction7;
NiagaraScript_813_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri3, NiagaraScript_813_Func_Output_AreaFraction7, Context);
float CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_Output_Avg;
CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_(NiagaraScript_813_Func_Output_AreaFraction4, NiagaraScript_813_Func_Output_AreaFraction5, NiagaraScript_813_Func_Output_AreaFraction6, NiagaraScript_813_Func_Output_AreaFraction7, CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_Output_Avg);
float3 CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri0;
float3 CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri1;
float3 CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri2;
float3 CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri3;
CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_(In_ppp, In_pnp, In_nnp, In_npp, CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri0, CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri1, CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri2, CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri3);
float NiagaraScript_813_Func_Output_AreaFraction8;
NiagaraScript_813_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri0, NiagaraScript_813_Func_Output_AreaFraction8, Context);
float NiagaraScript_813_Func_Output_AreaFraction9;
NiagaraScript_813_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri1, NiagaraScript_813_Func_Output_AreaFraction9, Context);
float NiagaraScript_813_Func_Output_AreaFraction10;
NiagaraScript_813_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri2, NiagaraScript_813_Func_Output_AreaFraction10, Context);
float NiagaraScript_813_Func_Output_AreaFraction11;
NiagaraScript_813_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri3, NiagaraScript_813_Func_Output_AreaFraction11, Context);
float CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_Output_Avg;
CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_(NiagaraScript_813_Func_Output_AreaFraction8, NiagaraScript_813_Func_Output_AreaFraction9, NiagaraScript_813_Func_Output_AreaFraction10, NiagaraScript_813_Func_Output_AreaFraction11, CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_Output_Avg);
Output11.x = CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_Output_Avg;
Output11.y = CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_Output_Avg;
Output11.z = CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_Output_Avg;
Out_FaceFractions = Output11;
ExecutionIndexToGridIndex_Emitter_TransientGrid(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppp;
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppn;
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnn;
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnp;
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnp;
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npp;
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npn;
float CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnn;
float3 CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, In_dt, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_AverageSolidVelocity);
float3 NiagaraScript_812_Func_Output_FaceFractions;
NiagaraScript_812_Func_(CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npn, NiagaraScript_812_Func_Output_FaceFractions, Context);
X = NiagaraScript_812_Func_Output_FaceFractions.x;
Y = NiagaraScript_812_Func_Output_FaceFractions.y;
Z = NiagaraScript_812_Func_Output_FaceFractions.z;
bool CustomHlsl0017216087B0E5D48622728598E9900CEC42174EFED_Func_Output_IsFullyInsideBoundary;
CustomHlsl0017216087B0E5D48622728598E9900CEC42174EFED_Func_(CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl0017216087B0E5D48622728598E9900CEC42174EFED_Func_Output_IsFullyInsideBoundary);
Out_XFace = X;
Out_YFace = Y;
Out_ZFace = Z;
Out_IsFullyInsideBoundary = CustomHlsl0017216087B0E5D48622728598E9900CEC42174EFED_Func_Output_IsFullyInsideBoundary;
Out_SolidVelocity = CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
ExecutionIndexToUnit_Emitter_TransientGrid(1, ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit);
float3 Constant12 = float3(0,0,0);
Output1.x = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.x;
Output1.y = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.y;
Output1.z = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.z;
float3 Result = mul(float4(Output1,1.0),Context.Map.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld).xyz;
Context.Map.Local.Grid3D_ComputeHighPrecisionBoundary.UnitPosition = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
Context.Map.Transient.SolidVelocity = Constant12;
Context.Map.Local.Grid3D_ComputeHighPrecisionBoundary.WorldPos = Result;
float Constant13 = 0.0001;
Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(Context.Map.Grid3D_ComputeHighPrecisionBoundary.dt, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity, Context);
Output12.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output12.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output12.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
float3 CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_Output_FaceFraction;
CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_(Output12, Constant13, CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_Output_FaceFraction);
Context.Map.Transient.FaceFraction = CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_Output_FaceFraction;
Context.Map.Transient.SolidVelocity = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
float Constant15 = 1;
ExecutionIndexToGridIndex_Emitter_TransientGrid(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1);
int Constant16 = 2;
GetNumCells_Emitter_TransientGrid(1, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ);
CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, Constant16, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_Output_Boundary);
float Constant17 = (0.0);
float NiagaraFloat_SelectResult = Constant17;
NiagaraFloat_SelectResult = Constant15;
CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_(NiagaraFloat_SelectResult, Context.Map.Transient.SimFloat, CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary);
int Constant19 = 7;
ExecutionIndexToGridIndex_Emitter_TransientGrid(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2);
X1 = Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity.x;
Y1 = Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity.y;
Z1 = Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity.z;
Output13.x = X1;
Output13.y = Y1;
Output13.z = Z1;
Output13.w = Context.Map.Grid3D_SetFluidAttribute002.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, Output13);
ExecutionIndexToGridIndex_Emitter_FaceGrid(2, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ);
SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(2, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, Context.Map.ScratchModule_02.FaceVals);
EnterStatScope(1 /**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
Context.Map.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld = Context.Map.Emitter.UnitToWorld;
Context.Map.Grid3D_ComputeHighPrecisionBoundary.dt = Context.Map.Emitter.dt;
float Constant11 = 0.0001;
EnterStatScope(2 /**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Context.Map.Grid3D_SetFluidAttribute002.Boundary = Context.Map.Transient.Boundary;
Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity = Context.Map.Transient.SolidVelocity;
EnterStatScope(3 /**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Context.Map.ScratchModule_02.FaceVals = Context.Map.Transient.FaceFraction;
EnterStatScope(4 /**ScratchModule_02_Emitter_Func_*/);
EnterStatScope(5 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.dt = Emitter_dt;
EnterStatScope(6 /**SimulationStage_2_0_MapMain*/);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_RasterizationGrid_velocity(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetFloatGridValue_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
void ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
Context.Map.Local.Grid3D_GetFluidAttribute001.Resample = Constant3;
Context.Map.Local.Grid3D_GetFluidAttribute001.Unit = Constant6;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity = Output1;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary = Output11;
Context.Map.Transient.SolidVelocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity;
Context.Map.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
Context.Map.Transient.Boundary = Context.Map.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary;
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 0, Out_OutVelocity.x);
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 1, Out_OutVelocity.y);
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 2, Out_OutVelocity.z);
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 3, TmpWeight);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 0, TmpVelocity.x);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 1, TmpVelocity.y);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 2, TmpVelocity.z);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 3, TmpWeight);
int Constant13 = 1;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(2, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ);
GetNumCells_Emitter_RasterizationGrid_velocity(2, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant14, Context.Map.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity;
int Constant16 = 9;
ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(3, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ);
SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(3, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ, Context.Map.Grid3D_SetFluidAttribute001.StartVelocity);
EnterStatScope(1 /**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Context.Map.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
EnterStatScope(2 /**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
Context.Map.Grid3D_ExtrapolateVelocity.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex = Context.Map.Emitter.SimGrid_SimFloatIndex;
Context.Map.Grid3D_ExtrapolateVelocity.UseRasterizationGrid = Constant11;
EnterStatScope(3 /**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Context.Map.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(4 /**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
Context.Map.Grid3D_SetFluidAttribute001.StartVelocity = Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(5 /**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
void GetGridValue_Emitter_SimGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
GetGridValue_Emitter_SimGrid(0, In_IndexX+1, In_IndexY, In_IndexZ, In_VectorIndex, Vx_right);
GetGridValue_Emitter_SimGrid(0, In_IndexX-1, In_IndexY, In_IndexZ, In_VectorIndex, Vx_left);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY+1, In_IndexZ, In_VectorIndex+1, Vy_up);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY-1, In_IndexZ, In_VectorIndex+1, Vy_down);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY, In_IndexZ+1, In_VectorIndex+2, Vz_front);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY, In_IndexZ-1, In_VectorIndex+2, Vz_back);
ExecutionIndexToGridIndex_Emitter_SimGrid(0, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_Output_Div;
CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_(Context.Map.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, Context.Map.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_Output_Div);
Context.Map.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_Output_Div;
Context.Map.Emitter.PressureGrid.Pressure = Constant1;
int Constant3 = 3;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, Context.Map.Grid3D_SetFluidAttribute.SimFloat);
Context.Map.Grid3D_ComputeDivergence.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_ComputeDivergence.VectorIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
EnterStatScope(1 /**Grid3D_ComputeDivergence_Emitter_Func_*/);
EnterStatScope(2 /**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
Context.Map.Grid3D_SetFluidAttribute.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_ComputeDivergence.Div;
EnterStatScope(3 /**Grid3D_SetFluidAttribute_Emitter_Func_*/);
void CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void NiagaraScript_790_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_(float In_InFloat, out float Out_OutFloat);
void NiagaraScript_791_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
Context.Map.Local.Grid3D_GetFluidAttribute004.Resample = Constant3;
Context.Map.Local.Grid3D_GetFluidAttribute004.Unit = Constant6;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
Context.Map.Transient.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.Map.Local.Grid3D_GetFluidAttribute005.Resample = Constant14;
Context.Map.Local.Grid3D_GetFluidAttribute005.Unit = Constant17;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
Context.Map.Transient.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
int CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_IterationIndex;
int CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_MaxIterations;
float CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NormalizedIterationIndex;
int CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_LoopIndex;
int CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NumberOfLoops;
float CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NormalizedLoopIndex;
CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_(CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_IterationIndex, CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_MaxIterations, CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NormalizedIterationIndex, CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_LoopIndex, CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NumberOfLoops, CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NormalizedLoopIndex);
Out_IterationIndex = CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_IterationIndex;
Out_MaxIterations = CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_MaxIterations;
Out_NormalizedIterationIndex = CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NormalizedIterationIndex;
Out_LoopIndex = CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_LoopIndex;
Out_NumberOfLoops = CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_Output_NormalizedLoopIndex;
float CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_Output_OutFloat;
CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_(In_Value, CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_Output_OutFloat);
Out_ClampedValue = CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_Output_OutFloat;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ, B_center);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX+1, In_IndexY, In_IndexZ, P_right);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX-1, In_IndexY, In_IndexZ, P_left);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY+1, In_IndexZ, P_up);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY-1, In_IndexZ, P_down);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY, In_IndexZ+1, P_front);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY, In_IndexZ-1, P_back);
int NiagaraScript_790_Func_Output_IterationIndex;
int NiagaraScript_790_Func_Output_MaxIterations;
float NiagaraScript_790_Func_Output_NormalizedIterationIndex;
int NiagaraScript_790_Func_Output_LoopIndex;
int NiagaraScript_790_Func_Output_NumberOfLoops;
float NiagaraScript_790_Func_Output_NormalizedLoopIndex;
NiagaraScript_790_Func_(NiagaraScript_790_Func_Output_IterationIndex, NiagaraScript_790_Func_Output_MaxIterations, NiagaraScript_790_Func_Output_NormalizedIterationIndex, NiagaraScript_790_Func_Output_LoopIndex, NiagaraScript_790_Func_Output_NumberOfLoops, NiagaraScript_790_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_791_Particle_Func_Output_ClampedValue;
NiagaraScript_791_Particle_Func_(Context.Map.Grid3D_PressureIteration.Relaxation, NiagaraScript_791_Particle_Func_Output_ClampedValue, Context);
float4 CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_back;
CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_right, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_left, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_up, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_down, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_front, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_back);
float CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_right;
float CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_left;
float CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_up;
float CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_down;
float CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_front;
float CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_back;
CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_(CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_right, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_left, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_up, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_down, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_front, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_back, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_right, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_left, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_up, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_down, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_front, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_back);
float CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_(Context.Map.Grid3D_PressureIteration.dx, Context.Map.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Context.Map.Grid3D_PressureIteration.Divergence, NiagaraScript_790_Func_Output_IterationIndex, NiagaraScript_791_Particle_Func_Output_ClampedValue, Context.Map.Grid3D_PressureIteration.Velocity, Context.Map.Grid3D_PressureIteration.Pressure, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_right, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_left, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_up, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_down, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_front, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_back, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_right, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_left, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_up, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_down, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_front, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_back, CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.Map.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
Context.Map.Emitter.PressureGrid.Pressure = Context.Map.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure;
EnterStatScope(1 /**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(2 /**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Context.Map.Grid3D_PressureIteration.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_PressureIteration.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Grid3D_PressureIteration.Divergence = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.Map.Grid3D_PressureIteration.Pressure = Context.Map.Emitter.PressureGrid.Pressure;
Context.Map.Grid3D_PressureIteration.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
Context.Map.Grid3D_PressureIteration.UseHighPrecisionCollisions = Constant22;
Context.Map.Grid3D_PressureIteration.Relaxation = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation;
EnterStatScope(3 /**Grid3D_PressureIteration_Emitter_Func_*/);
Context.Map.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure = Context.Map.OUTPUT_VAR.Grid3D_PressureIteration.Pressure;
EnterStatScope(4 /**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
Context.Map.Emitter.PressureGrid.Pressure = Emitter_PressureGrid_Pressure;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation = Emitter_Grid3D_FLIP_FLUID_CONTROLS_PressureRelaxation;
float3 Constant2 = float3(0,0,-980);
float3 Result = Context.Map.Transient.PhysicsForce + Constant2;
float3 Result1 = Result * Context.Map.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result2 = Context.Map.Particles.Velocity + Result1;
Context.Map.Particles.Velocity = Result2;
EnterStatScope(0 /**UpdateScript_2_0*/);
Context.Map.Grid3D_FLIP_IntegrateParticleVelocity.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Transient.PhysicsForce = Constant;
float3 Constant1 = float3(0,0,-980);
EnterStatScope(1 /**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
ExitStatScope(/**UpdateScript_2_0*/);
EnterStatScope(2 /**UpdateScript_2_0_Main*/);
Context.Map.Particles.Position.x = InputDataFloat(0, 0);
Context.Map.Array.Position = 0;
Context.Map.Particles.Position.y = InputDataFloat(0, 1);
Context.Map.Array.Position = 1;
Context.Map.Particles.Position.z = InputDataFloat(0, 2);
Context.Map.Array.Position = 2;
Context.Map.Particles.SpriteSize.x = InputDataFloat(0, 3);
Context.Map.Array.SpriteSize = 3;
Context.Map.Particles.SpriteSize.y = InputDataFloat(0, 4);
Context.Map.Array.SpriteSize = 4;
Context.Map.Particles.UniqueID = InputDataInt(0, 0);
Context.Map.Array.UniqueID = 0;
Context.Map.Particles.Velocity.x = InputDataFloat(0, 5);
Context.Map.Array.Velocity = 5;
Context.Map.Particles.Velocity.y = InputDataFloat(0, 6);
Context.Map.Array.Velocity = 6;
Context.Map.Particles.Velocity.z = InputDataFloat(0, 7);
Context.Map.Array.Velocity = 7;
EnterStatScope(3 /**UpdateScript_2_0_MapMain*/);
ExitStatScope(/**UpdateScript_2_0_MapMain*/);
ExitStatScope(/**UpdateScript_2_0_Main*/);
CustomHlslBBE0E8969C2067B677A00323B63A8F9C891645C8Emitter_KernelGrid_Func_(Context.Map.Grid3D_CreateConvolutionKernel.Radius, Context);
Éî†Jq≤;îKﬂ‰à
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant6, NiagaraScript_853_Func_Output_bUseOriginal, NiagaraScript_853_Func_Output_OutTransform, NiagaraScript_853_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_853_Func_Output_OutTransform).xyz;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant16, NiagaraScript_853_Func_Output_bUseOriginal1, NiagaraScript_853_Func_Output_OutTransform1, NiagaraScript_853_Func_Output_LocalToWorld1, Context);
float3 Result29 = mul(float4(In_InVector,0.0),NiagaraScript_853_Func_Output_OutTransform1).xyz;
CustomHlsl27B9BB65BCB3D14D240998C5C0E8BD174A8EF3ECEmitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result30, Context.Map.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
void GetClosestPoint_User_Collide_Meshes(int In_InstanceData, float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestNormal, out float3 Out_ClosestVelocity);
void GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReader(int In_InstanceData, out int Out_NumParticles);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePosition(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeScale(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeMeshOrientation(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float4 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeVelocity(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevMeshOrientation(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float4 Out_Value);
void GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevPosition(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
float3 Constant14 = float3(0.5,0.5,0.5);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePosition(5, CurrIdx, Valid, ParticlePos);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeScale(5, CurrIdx, Valid, ParticleMeshSize);
    GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeMeshOrientation(5, CurrIdx, Valid, q);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributeVelocity(5, CurrIdx, Valid, ParticleVel);
        GetQuaternionByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevMeshOrientation(5, CurrIdx, Valid, prevq);
GetVectorByIndex_Emitter_Grid3D_ComputeBoundary_ParticleReader_AttributePrevPosition(5, CurrIdx, Valid, PrevParticlePos);
int Constant19 = 0;
CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant23, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary);
GetClosestPoint_User_Collide_Meshes(3, Context.Map.Local.Grid3D_ComputeBoundary.WorldPos, Context.Map.Engine.WorldDeltaTime, Context.Map.Engine.System.TimeStepFraction, GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance, GetClosestPoint_User_Collide_MeshesOutput_ClosestPosition, GetClosestPoint_User_Collide_MeshesOutput_ClosestNormal, GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity);
float Constant25 = 0;
bool Result2 = NiagaraAll(GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance <= Constant25);
float Constant26 = 1;
float3 Result3 = GetClosestPoint_User_Collide_MeshesOutput_ClosestVelocity * Context.Map.Grid3D_ComputeBoundary.VelocityScale;
float Constant27 = (0.0);
float NiagaraFloat_SelectResult = Constant27;
float3 Constant28 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult = Constant28;
NiagaraFloat_SelectResult = Constant26;
NiagaraFloat_SelectResult = CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary;
float Result5 = min(GetClosestPoint_User_Collide_MeshesOutput_ClosestDistance, Constant24);
int Constant29 = 0;
int Constant30 = 1;
float3 Result6 = mul(float4(Context.Map.Local.Grid3D_ComputeBoundary.WorldPos,1.0),Context.Map.Grid3D_ComputeBoundary.WorldToLocal).xyz;
Output12.x = Result6.x;
Output12.y = Result6.y;
Output12.z = Result6.z;
GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReader(5, GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles);
CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_(Output12, Context.Map.Grid3D_ComputeBoundary.VelocityScale, GetNumParticles_Emitter_Grid3D_ComputeBoundary_ParticleReaderOutput_NumParticles, Context.Map.Grid3D_ComputeBoundary.WorldToLocal, Context.Map.Grid3D_ComputeBoundary.dt, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance);
float Result7 = max(NiagaraFloat_SelectResult, CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_BoundaryOut);
float3 Result8 = CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_VelocityOut + Context.Map.Transient.SolidVelocity;
Context.Map.Transient.SolidVelocity = Result8;
float Result9 = min(CustomHlsl0047EA38A67001229EBC1FF0FC2180AC3132BD82C5EEmitter_Grid3D_ComputeBoundary_ParticleReader_Func_Output_SignedDistance, Result5);
int Constant31 = 1;
CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_(Result7, Context.Map.Transient.Boundary, CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary);
Context.Map.Transient.Boundary = CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary;
Context.Map.Transient.BoundarySignedDistance = Result9;
int Constant36 = 7;
ExecutionIndexToGridIndex_Emitter_TransientGrid(6, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
X1 = Context.Map.Grid3D_SetFluidAttribute003.SolidVelocity.x;
Y1 = Context.Map.Grid3D_SetFluidAttribute003.SolidVelocity.y;
Z1 = Context.Map.Grid3D_SetFluidAttribute003.SolidVelocity.z;
Output13.w = Context.Map.Grid3D_SetFluidAttribute003.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(6, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output13);
int Constant32 = 0;
Context.Map.Grid3D_SetFluidAttribute004.Enable = Constant32;
Context.Map.Grid3D_SetFluidAttribute003.Enable = Constant34;
;OroÄË4O?
Context.Map.Local.Grid3D_GetFluidAttribute007.Resample = Constant14;
Context.Map.Local.Grid3D_GetFluidAttribute007.Unit = Constant17;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute007.SolidVelocity = Output1;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute007.Boundary = Output11;
Context.Map.Transient.SolidVelocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute007.SolidVelocity;
Context.Map.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute007.Boundary;
Output13.x = CustomHlslFF03F817137D9F288F8DAF1B9D734F0AA9A4F278_Func_Output_Avg;
Output13.y = CustomHlsl0348AE273B478844CEB31A0A3338B1A7003705B0_Func_Output_Avg;
Output13.z = CustomHlslB90662E35BB60107E5D5EB7683948ADAE395D82D_Func_Output_Avg;
Out_FaceFractions = Output13;
CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, In_dt, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_npn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl60B90C9885ABE9B52BE6DD5C139B3FE319C8E1E0Emitter_TransientGrid_Func_Output_AverageSolidVelocity);
X = NiagaraScript_881_Func_Output_FaceFractions.x;
Y = NiagaraScript_881_Func_Output_FaceFractions.y;
Z = NiagaraScript_881_Func_Output_FaceFractions.z;
float3 Constant23 = float3(0,0,0);
Output12.x = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.x;
Output12.y = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.y;
Output12.z = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.z;
float3 Result = mul(float4(Output12,1.0),Context.Map.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld).xyz;
Context.Map.Transient.SolidVelocity = Constant23;
float Constant24 = 0.1;
float3 Output14;
Output14.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output14.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output14.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_(Output14, Constant24, CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_Output_FaceFraction);
Context.Map.Transient.FaceFraction = CustomHlsl194F3F10216F49AAECFA0D7248F5F270CA38F967_Func_Output_FaceFraction;
int Constant27 = 2;
CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, Constant27, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslFA4CE56E48701FA94EDB4C56BDDC269D2B206606_Func_Output_Boundary);
float Constant28 = (0.0);
float NiagaraFloat_SelectResult = Constant28;
CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_(NiagaraFloat_SelectResult, Context.Map.Transient.SimFloat, CustomHlsl9396C81DABC44094CA2BF42588BC1B316CBD98A2_Func_Output_RetBoundary);
int Constant29 = 1;
int Constant30 = 7;
ExecutionIndexToGridIndex_Emitter_TransientGrid(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3);
float4 Output15;
Output15.x = X1;
Output15.y = Y1;
Output15.z = Z1;
Output15.w = Context.Map.Grid3D_SetFluidAttribute002.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3, Output15);
EnterStatScope(2 /**Grid3D_GetFluidAttribute007_Emitter_Func_*/);
float Constant22 = 0.1;
EnterStatScope(3 /**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
EnterStatScope(4 /**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
EnterStatScope(5 /**ScratchModule_02_Emitter_Func_*/);
CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant14, Context.Map.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlsl74552BB3C379DFDB4EE66E502D4A6B73508D8D83Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_(Context.Map.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, Context.Map.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_Output_Div);
Context.Map.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl48AE1297ED8EF11CDE258E519958256ABEBBC740Emitter_SimGrid_Func_Output_Div;
void GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(4, In_IndexX, In_IndexY, In_IndexZ, TmpFraction);
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(4, In_IndexX-1, In_IndexY, In_IndexZ, TmpFraction);
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(4, In_IndexX, In_IndexY-1, In_IndexZ, TmpFraction);
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(4, In_IndexX, In_IndexY, In_IndexZ - 1, TmpFraction);
int Constant23 = 1;
NiagaraScript_859_Particle_Func_(Context.Map.Grid3D_PressureIteration.Relaxation, NiagaraScript_859_Particle_Func_Output_ClampedValue, Context);
CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_right, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_left, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_up, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_down, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_front, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_back);
CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_right, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_left, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_up, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_down, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_front, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_back, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_right, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_left, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_up, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_down, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_front, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_back);
CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_(Context.Map.Grid3D_PressureIteration.dx, Context.Map.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Context.Map.Grid3D_PressureIteration.Divergence, NiagaraScript_858_Func_Output_IterationIndex, NiagaraScript_859_Particle_Func_Output_ClampedValue, Context.Map.Grid3D_PressureIteration.Velocity, Context.Map.Grid3D_PressureIteration.Pressure, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_right, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_left, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_up, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_down, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_front, CustomHlsl45BD00E31434BED22ED4587C3C1F52368E0B9E67Emitter_FaceGrid_Func_Output_F_back, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_right, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_left, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_up, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_down, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_front, CustomHlslF78EDB1DA79E0A8A4B37A6ED4F4B4C6A7B238587Emitter_TransientGrid_Func_Output_B_back, CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.Map.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlslFF9EEE4BBE40E8C79E8BC301C70AD9F4CCFE1FB5Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
int Constant22 = 1;
CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_(Context.Map.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.Map.Grid3D_ComputeGradient.ScalarIndex, CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_Output_Grad);
Context.Map.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlslA14F77455C016B6E7C9F3531DE172855890DA4FDEmitter_PressureGrid_Func_Output_Grad;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(3, In_IndexX, In_IndexY, In_IndexZ, TmpFraction);
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(3, In_IndexX-1, In_IndexY, In_IndexZ, TmpFraction);
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(3, In_IndexX, In_IndexY-1, In_IndexZ, TmpFraction);
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(3, In_IndexX, In_IndexY, In_IndexZ - 1, TmpFraction);
int Constant1 = 1;
CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_right, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_left, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_up, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_down, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_front, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_back);
CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_right, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_left, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_up, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_down, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_front, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_back, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_right, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_left, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_up, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_down, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_front, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_back);
CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_(Result1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_right, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_left, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_up, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_down, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_front, CustomHlsl68664E0DD82E73BE4A54EFD548CCD0D08F9E9609Emitter_FaceGrid_Func_Output_F_back, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_right, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_left, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_up, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_down, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_front, CustomHlsl0964DA628C2A1F354B257F538DCCCDC7818FAD30Emitter_TransientGrid_Func_Output_B_back, CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_Output_VelocityOut);
Context.Map.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlslE2CD32F664D844FE0DB946DB70CFACFA1A4AB412Emitter_TransientGrid_Func_Output_VelocityOut;
CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_(Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, Context.Map.Local.Grid3D_Visualize_VectorField.IndexY, Context.Map.Local.Grid3D_Visualize_VectorField.IndexZ, Constant23, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, GetNumCells_Emitter_SimGridOutput_NumCellsX, CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_Output_Execute);
Context.Map.Local.Grid3D_Visualize_VectorField.Drawable = CustomHlsl99B3CF453A7B31A38648406FB1553D0B08D19F60_Func_Output_Execute;
CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Constant27, Context.Map.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.Map.Transient.Velocity, Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlsl2648FA114B9FF7CCD76AB611B11DF17C031676A1Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant4, NiagaraScript_853_Func_Output_bUseOriginal, NiagaraScript_853_Func_Output_OutTransform, NiagaraScript_853_Func_Output_LocalToWorld, Context);
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant15, NiagaraScript_853_Func_Output_bUseOriginal1, NiagaraScript_853_Func_Output_OutTransform1, NiagaraScript_853_Func_Output_LocalToWorld1, Context);
float3 Result38 = mul(float4(In_InPosition,1.0),NiagaraScript_853_Func_Output_OutTransform1).xyz;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant19, NiagaraScript_853_Func_Output_bUseOriginal2, NiagaraScript_853_Func_Output_OutTransform2, NiagaraScript_853_Func_Output_LocalToWorld2, Context);
float3 Result41 = mul(float4(In_InVector,0.0),NiagaraScript_853_Func_Output_OutTransform2).xyz;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant23, NiagaraScript_853_Func_Output_bUseOriginal3, NiagaraScript_853_Func_Output_OutTransform3, NiagaraScript_853_Func_Output_LocalToWorld3, Context);
float3 Result44 = mul(float4(In_InVector,0.0),NiagaraScript_853_Func_Output_OutTransform3).xyz;
CustomHlsl1781695C29BCB52ED96F4BB5C815FF141DC50C6F_Func_(Result30, CustomHlsl1781695C29BCB52ED96F4BB5C815FF141DC50C6F_Func_Output_ret);
bool Result31 = !CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_Output_IsInside;
bool Result32 = CustomHlslA479C658154E00798922BB290711A93B51C117C2_Func_Output_IsInside || Result31;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl9768D3BD016485BECCCE64EF35171E4F73CC5D83_Func_Output_IsInside;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlslD931918DCB45B5476DCC3563A717057531B4B84B_Func_Output_IsInside;
NiagaraScript_853_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant12, NiagaraScript_853_Func_Output_bUseOriginal, NiagaraScript_853_Func_Output_OutTransform, NiagaraScript_853_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_853_Func_Output_OutTransform).xyz;
NiagaraScript_873_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant2, Constant3, Constant4, Constant5, Constant6, Constant7, Constant8, NiagaraScript_873_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
NiagaraPosition_SelectResult2 = NiagaraScript_873_Emitter_Localspace_false_Particle_Func_Output_Position;
CustomHlsl9D0FD15FAA926ECB08302705292F9C8D2C0E6115Emitter_RasterizationGrid_Func_(Output1, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.Map.RasterizationGrid_ParticleSource.dx, Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth, Context.Map.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Constant4, Constant1, CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlsl193124017E7C7164295C196B237774A7E9FE73A5Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant4, Constant1, CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
‰S∫Ì=M9O†<ù.Ü;mîß
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlslC6099960378F83345A3F5560F6B01F4A0EE4EAF9Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFraction(2, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value);
float Result1 = length(GetPreviousVectorValue_Emitter_FaceGrid_AttributeFaceFractionOutput_Value);
bool Result2 = NiagaraAll(Result1 > Constant5);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(3, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
X = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Result3 = round(W);
bool Result4 = NiagaraAll(((int)Result3) == Constant6);
bool Result5 = Result2 && Result4;
float Output1;
Output1 = Result5;
Context.Map.Transient.Len = Output1;
float Constant13 = 0;
float Constant14 = 0;
float4 Output11;
Output11.r = Context.Map.Grid3D_SetRTValues.Red;
Output11.g = Constant12;
Output11.b = Constant13;
Output11.a = Constant14;
Context.Map.Local.Grid3D_SetRTValues.Value = Output11;
bool Constant15 = true;
ExecToIndex_Emitter_SimRT(4, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(4, Constant15, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.Map.Local.Grid3D_SetRTValues.Value);
EnterStatScope(2 /**ScratchModule_03_Emitter_Func_*/);
float Constant8 = 0;
float Constant9 = 0;
EnterStatScope(3 /**Grid3D_SetRTValues_Emitter_Func_*/);
void LinearToIndex_Emitter_SimGrid(int In_InstanceData, int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
GetNumCells_Emitter_SimGrid(0, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
int Result4 = GetNumCells_Emitter_SimGridOutput_NumCellsX * GetNumCells_Emitter_SimGridOutput_NumCellsY * Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex;
LinearToIndex_Emitter_SimGrid(0, Result7, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, LinearToIndex_Emitter_SimGridOutput_IndexZ);
int Result8 = Context.Map.Grid3D_Flip_GridParticles.ParticlesPerCell * Context.Map.Grid3D_Flip_GridParticles.TotalEmissionCells;
int Result10 = Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex - Constant19;
IndexToUnit_Emitter_SimGrid(0, X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Result12 = mul(float4(IndexToUnit_Emitter_SimGridOutput_Unit,1.0),Context.Map.Grid3D_Flip_GridParticles.UnitToWorld).xyz;
bool Result13 = NiagaraAll(IndexZ_SelectResult >= Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex);
float Result15 = Context.Map.Grid3D_Flip_GridParticles.dx * Constant7;
Vector3f_SelectResult1 = Context.Map.Particles.Position;
NiagaraBool_SelectResult1 = Context.Map.Transient.Kill;
Vector2D_SelectResult1 = Context.Map.Particles.SpriteSize;
Vector3f001_SelectResult1 = Context.Map.Particles.Velocity;
Context.Map.Particles.Position = Vector3f_SelectResult1;
Context.Map.Transient.Kill = NiagaraBool_SelectResult1;
Context.Map.Particles.SpriteSize = Vector2D_SelectResult1;
Context.Map.Particles.Velocity = Vector3f001_SelectResult1;
EnterStatScope(0 /**SpawnScript_2_2*/);
Context.Map.Particles.SpriteSize = Constant;
Context.Map.Particles.Velocity = Constant1;
Context.Map.Grid3D_Flip_GridParticles.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_Flip_GridParticles.UnitToWorld = Context.Map.Emitter.UnitToWorld;
Context.Map.Grid3D_Flip_GridParticles.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_Flip_GridParticles.SpawnedThisFrame = Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame;
Context.Map.Grid3D_Flip_GridParticles.UseLandscape = Constant2;
Context.Map.Grid3D_Flip_GridParticles.ParticlesPerCell = Context.Map.Emitter.OVERRIDE.ParticlesPerCell;
Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex = Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex;
Context.Map.Grid3D_Flip_GridParticles.TotalEmissionCells = Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells;
Context.Map.Particles.Position = Constant4;
Context.Map.Transient.Kill = Constant5;
Context.Map.KillParticles001.KillParticles = Context.Map.Transient.Kill;
ExitStatScope(/**SpawnScript_2_2*/);
EnterStatScope(3 /**SpawnScript_2_2_Main*/);
Context.Map.Particles.Position.x = 0.0f;
Context.Map.Particles.Position.y = 0.0f;
Context.Map.Particles.Position.z = 0.0f;
Context.Map.Particles.SpriteSize.x = 0.0f;
Context.Map.Particles.SpriteSize.y = 0.0f;
Context.Map.Particles.UniqueID = 0;
Context.Map.Particles.Velocity.x = 0.0f;
Context.Map.Particles.Velocity.y = 0.0f;
Context.Map.Particles.Velocity.z = 0.0f;
Context.Map.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + ExecIndex();
Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame = Emitter_Grid3D_FLIP_Tank_Spawn_HasSpawnedThisFrame;
Context.Map.Emitter.OVERRIDE.ParticlesPerCell = Emitter_OVERRIDE_ParticlesPerCell;
Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex = Emitter_Grid3D_FLIP_Tank_Spawn_WaterHeightZIndex;
Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells = Emitter_Grid3D_FLIP_Tank_Spawn_TotalEmissionCells;
EnterStatScope(4 /**SpawnScript_2_2_MapMain*/);
ExitStatScope(/**SpawnScript_2_2_MapMain*/);
bool bValid = Context.Map.DataInstance.Alive;
int TmpWriteIndex = OutputIndex(0, true, bValid);
ExitStatScope(/**SpawnScript_2_2_Main*/);
EnterStatScope(0 /**UpdateScript_2_2*/);
ExitStatScope(/**UpdateScript_2_2*/);
EnterStatScope(2 /**UpdateScript_2_2_Main*/);
EnterStatScope(3 /**UpdateScript_2_2_MapMain*/);
ExitStatScope(/**UpdateScript_2_2_MapMain*/);
ExitStatScope(/**UpdateScript_2_2_Main*/);
ß≤≠˚KΩ{∏Or<;]Î
ß≤≠˚KΩ{∏Or<;]]
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
float4 MeshOrientation;
float3 PreviousVelocity;
float3 RotationalForce;
float RotationalInertia;
float3 RotationalVelocity;
bool WritetoIntrinsicProperties;
float4 PrevMeshOrientation;
float3 PrevPosition;
FParamMap0_SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Particles Particles;
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
void CustomHlsl7D8A8E568AEB8535ACA8FD3C492E4BA62E2C7281_Func_(float3 In_Rad, out float Out_Vol);
void CustomHlsl5D2B78E5D2C7D2B6D635C78B4204641BE95FBCB5_Func_(float3 In_r, float In_m, out float3 Out_MomentOfInertia);
void CustomHlsl161C37EA0F2D2AD38A8FBF42359A54644F8F6F52_Func_(float3 In_Radius, out float2 Out_SpriteSize);
void ScratchModule_04_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_885_Func_(float4 In_AxisAngle, bool In_NormalizeAxis, out float4 Out_Quaternion, inout FSimulationContext Context);
void MakeQuatFromAxisAngle_Emitter_Func_(out float4 Out_Quaternion, inout FSimulationContext Context);
void SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_(inout FSimulationContext Context);
void ParticleState_Emitter_Func_(inout FSimulationContext Context);
void GravityForce_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void GetPreviousFloatValue_Emitter_PressureReader_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void GetPreviousVector4Value_Emitter_BoundaryReader_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_(float3 In_Unit, float In_dx, float In_ParticleIndexRadius, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float4x4 In_UnitToWorld, float3 In_WorldParticleCenter, float In_Mass, bool In_Debug, out float3 Out_BuoyancyForce, out float3 Out_RotationalForce);
void Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_914_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void Collision_TransformPosition007_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void Collision_TransformVector009_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision_TransformVector010_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void NiagaraScript_916_Particle_Method_NewEnumerator0_Func_(float2 In_SpriteSize, out float Out_Radius, inout FSimulationContext Context);
void NiagaraScript_891_Particle_Func_(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void NiagaraScript_888_Particle_Func_(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_Query(float3 In_FieldSamplePosWorld, out float Out_DistanceToNearestSurface, out float3 Out_FieldGradient, out bool Out_IsDistanceFieldValid);
void Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_(float3 In_Position, float3 In_StartTrace, float3 In_EndTrace, out bool Out_Collides, out float3 Out_ImpactPosition, out float3 Out_ImpactNormal, out bool Out_Insideamesh, out bool Out_DistanceFieldIsValid, out float Out_DistanceToSurface, inout FSimulationContext Context);
void NiagaraScript_903_Func_(float3 In_PlaneNormal, float3 In_PlanePivotPoint, float3 In_InitialSphereLocation, float3 In_SpherePositionDelta, float In_CollisionRadius, float In_PhysicsDeltaTime, float In_MaxCorrectiondistance, out bool Out_Collides, out float3 Out_IntersectionLocation, out float3 Out_PreASC45IntersectionSphereCenterLocation, out float3 Out_InitialPositionRelativeCollisionLocation, out float Out_TimeElapsedToCollision, out float Out_RemainingTimePostCollision, out float Out_PercentageofTimeUsedToPerformCollision, out float Out_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, out float Out_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, inout FSimulationContext Context);
void NiagaraScript_907_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void NiagaraScript_906_Func_(float2 In_Min, float2 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float2 Out_Result, inout FSimulationContext Context);
void CustomHlsl8C77CF06BE09BBAC6ACA2CCF8A8A8A315B5C88E7_Func_(float3 In_From, float3 In_To, out float4 Out_Result);
void NiagaraScript_908_Func_(float3 In_From, float3 In_To, out float4 Out_NewOutput, inout FSimulationContext Context);
void NiagaraScript_892_Func_(float3 In_VECTOR_VAR, float4 In_Quaternion, out float3 Out_Vector, inout FSimulationContext Context);
void NiagaraScript_905_Func_(float3 In_ConeAxis, float In_Scale, float In_Spread, out float3 Out_Ouput, inout FSimulationContext Context);
void NiagaraScript_904_Func_(float3 In_InVector, float3 In_Normal, out float3 Out_Reflected, inout FSimulationContext Context);
void NiagaraScript_909_Func_(float3 In_INPUT_VAR, out float3 Out_CentimeterstoMeters, out float3 Out_MeterstoCentimeters, inout FSimulationContext Context);
void NiagaraScript_901_Particle_Func_(float3 In_VECTOR_VAR, float3 In_FallbackVector, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void NiagaraScript_910_Particle_Func_(float3 In_VECTOR_VAR, float3 In_Normal, bool In_NormalizeNormal, out float3 Out_Ouput, inout FSimulationContext Context);
void NiagaraScript_911_Func_(float3 In_INPUT_VAR, out float3 Out_CentimeterstoMeters, out float3 Out_MeterstoCentimeters, inout FSimulationContext Context);
void NiagaraScript_912_Func_(float3 In_INPUT_VAR, out float3 Out_CentimeterstoMeters, out float3 Out_MeterstoCentimeters, inout FSimulationContext Context);
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
void CustomHlsl001412C1732C3C785D3CA68D75E26A3520C7B30B713_Func_(float4 In_Quat1, float4 In_Quat2, out float4 Out_Result);
void NiagaraScript_889_Func_(float4 In_QuaternionA, float4 In_QuaternionB, out float4 Out_Quaternion, inout FSimulationContext Context);
void NiagaraScript_887_Particle_NormalizeRotations_false_Func_(float3 In_RotationalVelocityVector, float In_DeltaTime, float4 In_ExistingOrientationQuat, out float4 Out_NewOrientationQuat, inout FSimulationContext Context);
void ScratchModule_Emitter_Func_(inout FSimulationContext Context);
Out_Vol = 4./3 * 3.1415926 * In_Rad.x * In_Rad.y * In_Rad.z;
Out_MomentOfInertia.x = In_r.y * In_r.y + In_r.z * In_r.z;
Out_MomentOfInertia.y = In_r.z * In_r.z + In_r.x * In_r.x;
Out_MomentOfInertia.z = In_r.y * In_r.y + In_r.x * In_r.x;
Out_MomentOfInertia *= In_m / 5.;
Out_SpriteSize = 2.0 * max(max(In_Radius.x, In_Radius.y), In_Radius.z);
float Constant31 = 0.5;
float3 Constant32 = float3(40,20,20);
float CustomHlsl7D8A8E568AEB8535ACA8FD3C492E4BA62E2C7281_Func_Output_Vol;
CustomHlsl7D8A8E568AEB8535ACA8FD3C492E4BA62E2C7281_Func_(Constant32, CustomHlsl7D8A8E568AEB8535ACA8FD3C492E4BA62E2C7281_Func_Output_Vol);
float Result = CustomHlsl7D8A8E568AEB8535ACA8FD3C492E4BA62E2C7281_Func_Output_Vol * Constant31;
float Constant33 = 2;
float3 Result1 = Constant32 * Constant33;
float Constant34 = 100;
float3 Result2 = Result1 / Constant34;
float Result3 = length(Constant32);
float Result4 = Result3 * Result;
float3 CustomHlsl5D2B78E5D2C7D2B6D635C78B4204641BE95FBCB5_Func_Output_MomentOfInertia;
CustomHlsl5D2B78E5D2C7D2B6D635C78B4204641BE95FBCB5_Func_(Constant32, Result, CustomHlsl5D2B78E5D2C7D2B6D635C78B4204641BE95FBCB5_Func_Output_MomentOfInertia);
Context.MapSpawn.Particles.Volume = CustomHlsl7D8A8E568AEB8535ACA8FD3C492E4BA62E2C7281_Func_Output_Vol;
Context.MapSpawn.Particles.Mass = Result;
Context.MapSpawn.Particles.Scale = Result2;
Context.MapSpawn.Particles.RotationalInertia = Result4;
Context.MapSpawn.Particles.MomentOfInertia = CustomHlsl5D2B78E5D2C7D2B6D635C78B4204641BE95FBCB5_Func_Output_MomentOfInertia;
float Constant35 = 2;
float Result5 = Result3 * Constant35;
float2 CustomHlsl161C37EA0F2D2AD38A8FBF42359A54644F8F6F52_Func_Output_SpriteSize;
CustomHlsl161C37EA0F2D2AD38A8FBF42359A54644F8F6F52_Func_(Constant32, CustomHlsl161C37EA0F2D2AD38A8FBF42359A54644F8F6F52_Func_Output_SpriteSize);
Context.MapSpawn.Particles.Diameter = Result5;
Context.MapSpawn.Particles.SpriteSize = CustomHlsl161C37EA0F2D2AD38A8FBF42359A54644F8F6F52_Func_Output_SpriteSize;
Context.MapSpawn.Particles.Radius = Result3;
#if ((SimulationStageIndex == 0) || (SimulationStageIndex == 0)) // Multiple stages
float3 VECTOR_VAR;
float NiagaraFloat;
VECTOR_VAR.x = In_AxisAngle.x;
VECTOR_VAR.y = In_AxisAngle.y;
VECTOR_VAR.z = In_AxisAngle.z;
NiagaraFloat = In_AxisAngle.w;
float3 Result7 = normalize(VECTOR_VAR);
Vector_IfResult = Result7;
Vector_IfResult = VECTOR_VAR;
float Constant42 = 2;
float Result8 = NiagaraFloat / Constant42;
float Result9 = sin(Result8);
float3 Result10 = Vector_IfResult * Result9;
float Result11 = cos(Result8);
float4 Output3;
Output3.x = Result10.x;
Output3.y = Result10.y;
Output3.z = Result10.z;
Output3.w = Result11;
Out_Quaternion = Output3;
float3 Constant40 = float3(0,1,0);
float Constant41 = 45;
float Result6 = (PI/180.0f)*(Constant41);
Output1.x = Constant40.x;
Output1.y = Constant40.y;
Output1.z = Constant40.z;
Output1.w = Result6;
float4 NiagaraScript_885_Func_Output_Quaternion;
NiagaraScript_885_Func_(Output1, Context.MapSpawn.MakeQuatFromAxisAngle.NormalizeAxis, NiagaraScript_885_Func_Output_Quaternion, Context);
Out_Quaternion = NiagaraScript_885_Func_Output_Quaternion;
float3 Constant46 = float3(0,0,0);
float3 Constant47 = float3(0,0,0);
float4 Constant48 = float4(0,0,0,1);
Context.MapSpawn.Particles.Position = Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.Position;
Context.MapSpawn.Particles.RotationalVelocity = Constant46;
Context.MapSpawn.Particles.Velocity = Constant47;
Context.MapSpawn.Particles.MeshOrientation = Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.MeshOrientation;
Context.MapSpawn.Particles.PrevMeshOrientation = Constant48;
bool Result12 = NiagaraAll(Context.MapUpdate.Particles.Age <= Context.MapUpdate.Engine.DeltaTime);
Context.MapUpdate.OUTPUT_VAR.ParticleState.FirstFrame = Result12;
Context.MapUpdate.Transient.FirstFrame = Result12;
int Constant52 = 0;
bool Result13 = NiagaraAny(Context.MapUpdate.Emitter.ExecutionState != Constant52);
int Constant53 = 0;
bool Result14 = NiagaraAny(Context.MapUpdate.System.ExecutionState != Constant53);
bool Result15 = Result13 || Result14;
bool Result16 = Context.MapUpdate.ParticleState.LetInfinitelyLivedParticlesDieWhenEmitterDeactivates && Result15;
bool Result17 = !Result16;
bool Result18 = Context.MapUpdate.ParticleState.LoopParticlesLifetime && Result17;
float Result19 = Context.MapUpdate.Particles.Age + Context.MapUpdate.ParticleState.DeltaTime;
float Constant54 = 1e-05;
float Result20 = max(Context.MapUpdate.ParticleState.Lifetime, Constant54);
float Result21 = ModuloPrecise(Result19, Result20);
float Age_IfResult;
Age_IfResult = Result21;
Age_IfResult = Result19;
float Constant55 = 0.0001;
float Result22 = Result20 - Constant55;
bool Result23 = NiagaraAll(Age_IfResult > Result22);
bool Result24 = Result23 && Result16;
bool Constant56 = false;
bool_IfResult = Constant56;
bool_IfResult = Context.MapUpdate.DataInstance.Alive;
float Result25 = Age_IfResult / Result20;
Context.MapUpdate.DataInstance.Alive = bool_IfResult;
Context.MapUpdate.Particles.Age = Age_IfResult;
Context.MapUpdate.Particles.NormalizedAge = Result25;
bool Constant57 = true;
float3 Constant60 = float3(0,0,-980);
float3 Result26 = Constant60 * Context.MapUpdate.Particles.Mass;
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
float Constant62 = 0.5;
float Result29 = X * Constant62;
float Result30 = Result29 / Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx;
Output12.x = Context.MapUpdate.Particles.Position.x;
Output12.y = Context.MapUpdate.Particles.Position.y;
Output12.z = Context.MapUpdate.Particles.Position.z;
bool Constant63 = false;
float3 CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce;
float3 CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce;
CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_(Output11, Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx, Result30, Context.MapUpdate.Emitter.NumCellsX, Context.MapUpdate.Emitter.NumCellsY, Context.MapUpdate.Emitter.NumCellsZ, Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld, Output12, Context.MapUpdate.Particles.Mass, Constant63, CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce, CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce);
float3 Result31 = Context.MapUpdate.Transient.PhysicsForce + CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce;
float3 Result32 = Context.MapUpdate.Transient.PhysicsRotationalForce + CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce;
bool Constant64 = true;
Context.MapUpdate.Transient.PhysicsForce = Result31;
Context.MapUpdate.Transient.PhysicsRotationalForce = Result32;
Context.MapUpdate.Transient.RotationalVelocityEnabled = Constant64;
bool Result38 = NiagaraAll(In_SourceSpace == Constant101);
int Constant102 = 0;
bool Result39 = NiagaraAll(In_DestinationSpace == Constant102);
bool Result40 = Result38 && Result39;
bool Result41 = NiagaraAll(In_SourceSpace == Constant103);
int Constant104 = 1;
bool Result42 = NiagaraAll(In_DestinationSpace == Constant104);
bool Result43 = Result41 && Result42;
bool Result44 = Result40 || Result43;
int Constant105 = 2;
bool Result45 = NiagaraAll(In_SourceSpace == Constant105);
int Constant106 = 2;
bool Result46 = NiagaraAll(In_DestinationSpace == Constant106);
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
bool Constant100 = false;
Matrix_IfResult = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_914_Func_Output_bUseOriginal;
float4x4 NiagaraScript_914_Func_Output_OutTransform;
bool NiagaraScript_914_Func_Output_LocalToWorld;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant100, NiagaraScript_914_Func_Output_bUseOriginal, NiagaraScript_914_Func_Output_OutTransform, NiagaraScript_914_Func_Output_LocalToWorld, Context);
float3 Result65 = mul(float4(In_InPosition,1.0),NiagaraScript_914_Func_Output_OutTransform).xyz;
Vector_IfResult1 = Result65;
bool Constant110 = false;
Matrix_IfResult2 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_914_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_914_Func_Output_OutTransform1;
bool NiagaraScript_914_Func_Output_LocalToWorld1;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant110, NiagaraScript_914_Func_Output_bUseOriginal1, NiagaraScript_914_Func_Output_OutTransform1, NiagaraScript_914_Func_Output_LocalToWorld1, Context);
float3 Result66 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform1).xyz;
Vector_IfResult2 = Result66;
bool Constant114 = false;
Matrix_IfResult3 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_914_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_914_Func_Output_OutTransform2;
bool NiagaraScript_914_Func_Output_LocalToWorld2;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant114, NiagaraScript_914_Func_Output_bUseOriginal2, NiagaraScript_914_Func_Output_OutTransform2, NiagaraScript_914_Func_Output_LocalToWorld2, Context);
float3 Result67 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform2).xyz;
Vector_IfResult3 = Result67;
float Result68 = length(In_SpriteSize);
float Constant116 = 0.5;
float Result69 = Result68 * Constant116;
Out_Radius = Result69;
float3 Result76 = In_Velocity - In_AdvectionVelocity;
float Result77 = In_Drag * In_InverseMass;
float Constant128 = (0.0);
float NiagaraFloat_SelectResult = Constant128;
NiagaraFloat_SelectResult = In_Drag;
NiagaraFloat_SelectResult = Result77;
float Constant129 = 0;
float Result78 = max(NiagaraFloat_SelectResult, Constant129);
float Result79 = Result78 * In_DeltaTime;
float Constant130 = 1;
float Result80 = Result79 + Constant130;
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
float3 Constant133 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult1 = Constant133;
float Constant134 = (0.0);
float Length_SelectResult1 = Constant134;
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
float Constant138 = 0;
bool Result99 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface < Constant138);
bool Result100 = !Result99;
bool Result101 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid && Result98 && Result100;
float3 Constant139 = float3(0,0,1);
float Constant140 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction2;
float NiagaraScript_888_Particle_Func_Output_Length2;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold2;
NiagaraScript_888_Particle_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient, Constant139, Constant140, NiagaraScript_888_Particle_Func_Output_Direction2, NiagaraScript_888_Particle_Func_Output_Length2, NiagaraScript_888_Particle_Func_Output_BelowThreshold2, Context);
float3 Result102 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface * NiagaraScript_888_Particle_Func_Output_Direction2;
float3 Result103 = In_Position - Result102;
Out_Collides = Result101;
Out_ImpactPosition = Result103;
Out_ImpactNormal = NiagaraScript_888_Particle_Func_Output_Direction2;
Out_Insideamesh = Result99;
Out_DistanceFieldIsValid = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid;
Out_DistanceToSurface = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface;
float3 Result107 = -(In_PlaneNormal);
float3 Result108 = In_PlanePivotPoint - In_InitialSphereLocation;
float Result109 = dot(Result107,Result108);
float Result110 = Result109 - In_CollisionRadius;
float Constant146 = 0;
bool Result111 = NiagaraAll(Result110 < Constant146);
bool Constant147 = true;
float3 Result112 = Result107 * Result109;
float3 Result113 = Result112 + In_InitialSphereLocation;
float Result114 = max(In_MaxCorrectiondistance, Result110);
float3 Result115 = Result114 * Result107;
float3 Result116 = Result115 + In_InitialSphereLocation;
float Constant148 = 0;
float Constant149 = 0;
float3 Result117 = In_InitialSphereLocation + In_SpherePositionDelta;
float3 Result118 = In_PlanePivotPoint - Result117;
float Result119 = dot(Result107,Result118);
float Result120 = Result119 - In_CollisionRadius;
float Constant150 = 0;
bool Result121 = NiagaraAll(Result120 <= Constant150);
float Result122 = abs(Result120);
float Result123 = Result110 - Result120;
float Result124 = abs(Result123);
float Constant151 = 1e-06;
float Result125 = max(Result124, Constant151);
float Result126 = Result122 / Result125;
float Constant152 = 0;
bool Result127 = NiagaraAll(Result126 == Constant152);
bool Result128 = Result111 || Result127;
float Constant153 = 1;
float float_IfResult;
float_IfResult = Constant153;
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
Collides_IfResult = Constant147;
IntersectionLocation_IfResult = Result113;
PreASC45IntersectionSphereCenterLocation_IfResult = Result116;
InitialPositionRelativeCollisionLocation_IfResult = Result112;
TimeElapsedToCollision_IfResult = Constant148;
RemainingTimePostCollision_IfResult = In_PhysicsDeltaTime;
PercentageofTimeUsedToPerformCollision_IfResult = Constant149;
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
bool Constant169 = false;
int Constant170 = 0;
bool Result152 = NiagaraAll(In_RandomnessMode == Constant170);
bool Result153 = Constant169 && Result152;
bool Result154 = NiagaraAll(In_RandomnessMode == Constant171);
bool Result155 = Result153 || Result154;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapUpdate.Emitter.RandomSeed;
int Seed1_IfResult;
int Seed2_IfResult;
int Seed3_IfResult;
Seed1_IfResult = Seed_IfResult;
Seed2_IfResult = Constant172;
Seed3_IfResult = Constant173;
Seed1_IfResult = Context.MapUpdate.Particles.UniqueID;
Seed2_IfResult = Context.MapUpdate.Engine.System.TickCount;
Seed3_IfResult = Seed_IfResult;
int Constant174 = -1;
int Constant175 = -1;
int Constant176 = -1;
int Seed1_IfResult1;
int Seed2_IfResult1;
int Seed3_IfResult1;
Seed1_IfResult1 = Seed1_IfResult;
Seed2_IfResult1 = Seed2_IfResult;
Seed3_IfResult1 = Seed3_IfResult;
Seed1_IfResult1 = Constant174;
Seed2_IfResult1 = Constant175;
Seed3_IfResult1 = Constant176;
NiagaraRandInfo Output15;
Output15.Seed1 = Seed1_IfResult1;
Output15.Seed2 = Seed2_IfResult1;
Output15.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output15;
Out_UseDeterministicRandoms = Result155;
int Constant164 = (0);
bool Constant165 = false;
int Constant166 = 0;
int Constant167 = (0);
bool Constant168 = false;
NiagaraRandInfo NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
NiagaraScript_907_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant164, In_OverrideSeed, Constant166, Constant167, Constant168, In_RandomnessMode, NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float2 Result156 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed1;
Seed2 = NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed2;
Seed3 = NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed3;
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
float3 Constant183 = float3(1,0,0);
float Constant184 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction4;
float NiagaraScript_888_Particle_Func_Output_Length4;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold4;
NiagaraScript_888_Particle_Func_(In_From, Constant183, Constant184, NiagaraScript_888_Particle_Func_Output_Direction4, NiagaraScript_888_Particle_Func_Output_Length4, NiagaraScript_888_Particle_Func_Output_BelowThreshold4, Context);
float3 Constant185 = float3(1,0,0);
float Constant186 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction5;
float NiagaraScript_888_Particle_Func_Output_Length5;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold5;
NiagaraScript_888_Particle_Func_(In_To, Constant185, Constant186, NiagaraScript_888_Particle_Func_Output_Direction5, NiagaraScript_888_Particle_Func_Output_Length5, NiagaraScript_888_Particle_Func_Output_BelowThreshold5, Context);
float4 CustomHlsl8C77CF06BE09BBAC6ACA2CCF8A8A8A315B5C88E7_Func_Output_Result;
CustomHlsl8C77CF06BE09BBAC6ACA2CCF8A8A8A315B5C88E7_Func_(NiagaraScript_888_Particle_Func_Output_Direction4, NiagaraScript_888_Particle_Func_Output_Direction5, CustomHlsl8C77CF06BE09BBAC6ACA2CCF8A8A8A315B5C88E7_Func_Output_Result);
Out_NewOutput = CustomHlsl8C77CF06BE09BBAC6ACA2CCF8A8A8A315B5C88E7_Func_Output_Result;
float3 Output0;
Output0.x = In_Quaternion.x;
Output0.y = In_Quaternion.y;
Output0.z = In_Quaternion.z;
Output16 = In_Quaternion.w;
float Result171 = dot(Output0,In_VECTOR_VAR);
float Constant187 = 2;
float Result172 = Result171 * Constant187;
float3 Result173 = Output0 * Result172;
float Result174 = Output16 * Output16;
float Result175 = dot(Output0,Output0);
float Result176 = Result174 - Result175;
float3 Result177 = Result176 * In_VECTOR_VAR;
float3 Result178 = Result173 + Result177;
float3 Result179 = cross(Output0,In_VECTOR_VAR);
float Constant188 = 2;
float Result180 = Output16 * Constant188;
float3 Result181 = Result179 * Result180;
float3 Result182 = Result178 + Result181;
Out_Vector = Result182;
float Constant158 = 0;
float Constant159 = 1;
float Result150 = clamp(In_Spread,Constant158,Constant159);
float Constant160 = -1;
float Result151 = Result150 * Constant160;
float2 Output13;
Output13.x = Result151;
Output13.y = Result151;
float2 Output14;
Output14.x = Result150;
Output14.y = Result150;
int Constant161 = -1;
int Constant162 = 0;
bool Constant163 = false;
float2 NiagaraScript_906_Func_Output_Result;
NiagaraScript_906_Func_(Output13, Output14, Constant161, Constant162, Constant163, NiagaraScript_906_Func_Output_Result, Context);
X1 = NiagaraScript_906_Func_Output_Result.x;
Y1 = NiagaraScript_906_Func_Output_Result.y;
float3 Constant177 = float3(1,0,0);
float3 Result160 = X1 * Constant177;
float3 Constant178 = float3(0,1,0);
float3 Result161 = Y1 * Constant178;
float3 Result162 = Result160 + Result161;
float Result163 = abs(X1);
float Result164 = abs(Y1);
float Result165 = max(Result163, Result164);
float Result166 = 1 - Result165;
float3 Constant179 = float3(0,0,1);
float3 Result167 = Result166 * Constant179;
float3 Result168 = Result162 + Result167;
float3 Result169 = normalize(Result168);
float3 Result170 = Result169 * In_Scale;
float3 Constant180 = float3(0,0,1);
float3 Constant181 = float3(0,0,1);
float Constant182 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction3;
float NiagaraScript_888_Particle_Func_Output_Length3;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold3;
NiagaraScript_888_Particle_Func_(In_ConeAxis, Constant181, Constant182, NiagaraScript_888_Particle_Func_Output_Direction3, NiagaraScript_888_Particle_Func_Output_Length3, NiagaraScript_888_Particle_Func_Output_BelowThreshold3, Context);
float4 NiagaraScript_908_Func_Output_NewOutput;
NiagaraScript_908_Func_(Constant180, NiagaraScript_888_Particle_Func_Output_Direction3, NiagaraScript_908_Func_Output_NewOutput, Context);
float3 NiagaraScript_892_Func_Output_Vector;
NiagaraScript_892_Func_(Result170, NiagaraScript_908_Func_Output_NewOutput, NiagaraScript_892_Func_Output_Vector, Context);
Out_Ouput = NiagaraScript_892_Func_Output_Vector;
float Result183 = dot(In_InVector,In_Normal);
float Result184 = Result183 + Result183;
float3 Result185 = Result184 * In_Normal;
float3 Result186 = In_InVector - Result185;
Out_Reflected = Result186;
float Constant189 = 0.01;
float3 Result187 = In_INPUT_VAR * Constant189;
float Constant190 = 100;
float3 Result188 = In_INPUT_VAR * Constant190;
Out_CentimeterstoMeters = Result187;
Out_MeterstoCentimeters = Result188;
float Result193 = dot(In_VECTOR_VAR,In_VECTOR_VAR);
float Result194 = In_Threshold * In_Threshold;
bool Result195 = NiagaraAll(Result193 < Result194);
float Result196 = length(In_FallbackVector);
float Result197 = rsqrt(Result193);
float3 Result198 = In_VECTOR_VAR * Result197;
float Result199 = Reciprocal(Result197);
float3 Constant195 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult2 = Constant195;
float Constant196 = (0.0);
float Length_SelectResult2 = Constant196;
Direction_SelectResult2 = In_FallbackVector;
Length_SelectResult2 = Result196;
Direction_SelectResult2 = Result198;
Length_SelectResult2 = Result199;
Out_Direction = Direction_SelectResult2;
Out_Length = Length_SelectResult2;
Out_BelowThreshold = Result195;
float Result192 = dot(In_VECTOR_VAR,In_Normal);
float3 Constant193 = float3(0,0,0);
float Constant194 = 1e-05;
float3 NiagaraScript_901_Particle_Func_Output_Direction;
float NiagaraScript_901_Particle_Func_Output_Length;
bool NiagaraScript_901_Particle_Func_Output_BelowThreshold;
NiagaraScript_901_Particle_Func_(In_Normal, Constant193, Constant194, NiagaraScript_901_Particle_Func_Output_Direction, NiagaraScript_901_Particle_Func_Output_Length, NiagaraScript_901_Particle_Func_Output_BelowThreshold, Context);
float3 Constant197 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult3 = Constant197;
Vector3f_SelectResult3 = NiagaraScript_901_Particle_Func_Output_Direction;
Vector3f_SelectResult3 = In_Normal;
float3 Result200 = Result192 * Vector3f_SelectResult3;
float3 Result201 = In_VECTOR_VAR - Result200;
Out_Ouput = Result201;
float Constant200 = 0.01;
float3 Result202 = In_INPUT_VAR * Constant200;
float Constant201 = 100;
float3 Result203 = In_INPUT_VAR * Constant201;
Out_CentimeterstoMeters = Result202;
Out_MeterstoCentimeters = Result203;
float Constant207 = 0.01;
float3 Result212 = In_INPUT_VAR * Constant207;
float Constant208 = 100;
float3 Result213 = In_INPUT_VAR * Constant208;
Out_CentimeterstoMeters = Result212;
Out_MeterstoCentimeters = Result213;
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
float3 NiagaraScript_891_Particle_Func_Output_Output;
NiagaraScript_891_Particle_Func_(Result75, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, NiagaraScript_891_Particle_Func_Output_Output, Context);
float3 Result83 = NiagaraScript_891_Particle_Func_Output_Output * Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleInitialForceDividedByMass = Result73;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution = Result74;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate = Result83;
float3 Constant131 = float3(0,0,-1);
float Constant132 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction;
float NiagaraScript_888_Particle_Func_Output_Length;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold;
NiagaraScript_888_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution, Constant131, Constant132, NiagaraScript_888_Particle_Func_Output_Direction, NiagaraScript_888_Particle_Func_Output_Length, NiagaraScript_888_Particle_Func_Output_BelowThreshold, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceVector = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceDirection = NiagaraScript_888_Particle_Func_Output_Direction;
float3 Result91 = NiagaraScript_888_Particle_Func_Output_Direction * Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius;
float3 Result92 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin - Result91;
float3 Result93 = Result91 + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
float3 Constant135 = float3(0,0,-1);
float Constant136 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction1;
float NiagaraScript_888_Particle_Func_Output_Length1;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold1;
NiagaraScript_888_Particle_Func_(Result93, Constant135, Constant136, NiagaraScript_888_Particle_Func_Output_Direction1, NiagaraScript_888_Particle_Func_Output_Length1, NiagaraScript_888_Particle_Func_Output_BelowThreshold1, Context);
float3 Result94 = NiagaraScript_888_Particle_Func_Output_Direction1 * NiagaraScript_888_Particle_Func_Output_Length1;
float3 Result95 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin + Result94;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart = Result92;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd = Result95;
int Constant137 = 0;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
float3 Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
float3 Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh;
bool Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid;
float Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface;
Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_(Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface, Context);
bool Result104 = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh && Context.MapUpdate.Collision.CollisionQueryAndResponse.KillParticlesLodgedWithinMeshes && Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionEnabled;
bool Result105 = !Result104;
bool Result106 = Context.MapUpdate.DataInstance.Alive && Result105;
bool Constant142 = false;
bool Constant143 = true;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse.CollisionID = Constant137;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedFriction = Constant141;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedRestitution = Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient;
Context.MapUpdate.DataInstance.Alive = Result106;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.ModuleDepthBasedCollisionParticleOccluded = Constant142;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.ParticleOnScreen = Constant143;
float3 Constant144 = float3(0,0,1);
float3 Constant145 = float3(0,0,-1e+16);
float3 PlaneNormal_IfResult;
float3 PlanePivotPoint_IfResult;
PlaneNormal_IfResult = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult = Constant144;
PlanePivotPoint_IfResult = Constant145;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal = PlaneNormal_IfResult;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlanePivotPoint = PlanePivotPoint_IfResult;
bool NiagaraScript_903_Func_Output_Collides;
float3 NiagaraScript_903_Func_Output_IntersectionLocation;
float3 NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation;
float3 NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation;
float NiagaraScript_903_Func_Output_TimeElapsedToCollision;
float NiagaraScript_903_Func_Output_RemainingTimePostCollision;
float NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision;
float NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
float NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
NiagaraScript_903_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius, Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Collision.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance, NiagaraScript_903_Func_Output_Collides, NiagaraScript_903_Func_Output_IntersectionLocation, NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation, NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation, NiagaraScript_903_Func_Output_TimeElapsedToCollision, NiagaraScript_903_Func_Output_RemainingTimePostCollision, NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision, NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = NiagaraScript_903_Func_Output_IntersectionLocation;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTickDeltaForThisCollisionUpdate = NiagaraScript_903_Func_Output_TimeElapsedToCollision;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePhysicsDeltaTime = NiagaraScript_903_Func_Output_RemainingTimePostCollision;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePercentageOfTickDedicatedToUpdatingPosition = NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance = NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
Context.MapUpdate.Transient.CollisionDistanceToCollision = NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
float Constant154 = 0;
bool Result137 = NiagaraAll(Context.MapUpdate.Transient.CollisionDistanceToCollision <= Constant154);
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
float Constant155 = 0.1;
bool Result146 = NiagaraAll(Result145 < Constant155);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleRemoveRestitution = Result146;
float3 Result147 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate / Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float float_IfResult1;
float_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModulePhysicsDeltaTime;
float_IfResult1 = Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float Constant156 = 0;
float float_IfResult2;
float_IfResult2 = Constant156;
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
float Constant157 = 1;
float3 NiagaraScript_905_Func_Output_Ouput;
NiagaraScript_905_Func_(Context.MapUpdate.Transient.CollisionNormal, Constant157, Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage, NiagaraScript_905_Func_Output_Ouput, Context);
Vector_IfResult4 = NiagaraScript_905_Func_Output_Ouput;
Vector_IfResult4 = Context.MapUpdate.Transient.CollisionNormal;
float3 NiagaraScript_904_Func_Output_Reflected;
NiagaraScript_904_Func_(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult4, NiagaraScript_904_Func_Output_Reflected, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity = NiagaraScript_904_Func_Output_Reflected;
float3 NiagaraScript_909_Func_Output_CentimeterstoMeters;
float3 NiagaraScript_909_Func_Output_MeterstoCentimeters;
NiagaraScript_909_Func_(Context.MapUpdate.Transient.CollisionVelocity, NiagaraScript_909_Func_Output_CentimeterstoMeters, NiagaraScript_909_Func_Output_MeterstoCentimeters, Context);
float3 Result189 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * NiagaraScript_909_Func_Output_CentimeterstoMeters;
float Constant191 = -1;
float3 Result190 = Result189 * Constant191;
float Result191 = dot(Result190,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons = Result191;
bool Constant192 = false;
float3 NiagaraScript_910_Particle_Func_Output_Ouput;
NiagaraScript_910_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant192, NiagaraScript_910_Particle_Func_Output_Ouput, Context);
float3 Constant198 = float3(0,0,0);
float Constant199 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction6;
float NiagaraScript_888_Particle_Func_Output_Length6;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold6;
NiagaraScript_888_Particle_Func_(NiagaraScript_910_Particle_Func_Output_Ouput, Constant198, Constant199, NiagaraScript_888_Particle_Func_Output_Direction6, NiagaraScript_888_Particle_Func_Output_Length6, NiagaraScript_888_Particle_Func_Output_BelowThreshold6, Context);
float3 NiagaraScript_911_Func_Output_CentimeterstoMeters;
float3 NiagaraScript_911_Func_Output_MeterstoCentimeters;
NiagaraScript_911_Func_(NiagaraScript_910_Particle_Func_Output_Ouput, NiagaraScript_911_Func_Output_CentimeterstoMeters, NiagaraScript_911_Func_Output_MeterstoCentimeters, Context);
float3 Result204 = NiagaraScript_911_Func_Output_CentimeterstoMeters * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float Constant202 = 0;
float float_IfResult3;
float_IfResult3 = Constant202;
float_IfResult3 = NiagaraScript_888_Particle_Func_Output_Length6;
bool Result205 = NiagaraAll(float_IfResult3 > Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionEngagementSpeed);
float float_IfResult4;
float_IfResult4 = Context.MapUpdate.Collision.CollisionQueryAndResponse.DynamicFrictionCoefficient;
float_IfResult4 = Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionCoefficient;
float float_IfResult5;
float_IfResult5 = float_IfResult4;
float_IfResult5 = Context.MapUpdate.Collision.CollisionQueryAndResponse.BounceCollisionFriction;
float3 Result206 = NiagaraScript_888_Particle_Func_Output_Direction6 * float_IfResult5 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons;
float3 Result207 = Result204 - Result206;
float3 Constant203 = float3(0,0,0);
float Constant204 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction7;
float NiagaraScript_888_Particle_Func_Output_Length7;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold7;
NiagaraScript_888_Particle_Func_(Result207, Constant203, Constant204, NiagaraScript_888_Particle_Func_Output_Direction7, NiagaraScript_888_Particle_Func_Output_Length7, NiagaraScript_888_Particle_Func_Output_BelowThreshold7, Context);
float Result208 = dot(NiagaraScript_888_Particle_Func_Output_Direction6,NiagaraScript_888_Particle_Func_Output_Direction7);
float Constant205 = 0;
bool Result209 = NiagaraAll(Result208 <= Constant205);
Vector_IfResult5 = Result204;
Vector_IfResult5 = Result206;
float Constant206 = -1;
float3 Result210 = Vector_IfResult5 * Constant206;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons = Result210;
float3 Result211 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 NiagaraScript_912_Func_Output_CentimeterstoMeters;
float3 NiagaraScript_912_Func_Output_MeterstoCentimeters;
NiagaraScript_912_Func_(Result211, NiagaraScript_912_Func_Output_CentimeterstoMeters, NiagaraScript_912_Func_Output_MeterstoCentimeters, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector = NiagaraScript_912_Func_Output_MeterstoCentimeters;
float3 Result214 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector;
float Result215 = dot(Context.MapUpdate.Transient.CollisionNormal,Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity);
float3 Result216 = Context.MapUpdate.Transient.CollisionNormal * Result215;
float Result217 = 1 - Context.MapUpdate.Transient.CollisionRestitution;
float3 Result218 = Result216 * Result217;
float3 Result219 = Result214 - Result218;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocityWithFrictionApplied = Result219;
float3 Particleposition_IfResult;
Particleposition_IfResult = Context.MapUpdate.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult;
float3 Constant209 = float3(0,0,1);
float Constant210 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction8;
float NiagaraScript_888_Particle_Func_Output_Length8;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold8;
NiagaraScript_888_Particle_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant209, Constant210, NiagaraScript_888_Particle_Func_Output_Direction8, NiagaraScript_888_Particle_Func_Output_Length8, NiagaraScript_888_Particle_Func_Output_BelowThreshold8, Context);
float Result220 = dot(NiagaraScript_888_Particle_Func_Output_Direction8,Context.MapUpdate.Transient.CollisionNormal);
float Constant211 = 0;
bool Result221 = NiagaraAll(Result220 < Constant211);
bool Result222 = Result221 && Context.MapUpdate.Transient.CollisionValid;
float3 Constant212 = float3(0,0,0);
float3 physicsforce_IfResult;
float3 Velocity_IfResult;
physicsforce_IfResult = Constant212;
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
float3 Result233 = In_StartTrace - In_EndTrace;
float Result234 = length(Result233);
bool Result235 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface < Result234);
float Constant221 = 0;
bool Result236 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface < Constant221);
bool Result237 = !Result236;
bool Result238 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid && Result235 && Result237;
float3 Constant222 = float3(0,0,1);
float Constant223 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction11;
float NiagaraScript_888_Particle_Func_Output_Length11;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold11;
NiagaraScript_888_Particle_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient, Constant222, Constant223, NiagaraScript_888_Particle_Func_Output_Direction11, NiagaraScript_888_Particle_Func_Output_Length11, NiagaraScript_888_Particle_Func_Output_BelowThreshold11, Context);
float3 Result239 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface * NiagaraScript_888_Particle_Func_Output_Direction11;
float3 Result240 = In_Position - Result239;
Out_Collides = Result238;
Out_ImpactPosition = Result240;
Out_ImpactNormal = NiagaraScript_888_Particle_Func_Output_Direction11;
Out_Insideamesh = Result236;
Out_DistanceFieldIsValid = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid;
Out_DistanceToSurface = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleInitialDataInstanceAlive = Context.MapUpdate.DataInstance.Alive;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float Result223 = Reciprocal(Context.MapUpdate.Transient.Collision_ParticleMassReplacement);
Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement = Result223;
float3 Result224 = Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 Result225 = Result224 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float3 Result226 = Result225 + Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
float3 NiagaraScript_891_Particle_Func_Output_Output1;
NiagaraScript_891_Particle_Func_(Result226, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, NiagaraScript_891_Particle_Func_Output_Output1, Context);
float3 Result227 = NiagaraScript_891_Particle_Func_Output_Output1 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass = Result224;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleForceContribution = Result225;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate = Result227;
float3 Constant216 = float3(0,0,-1);
float Constant217 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction9;
float NiagaraScript_888_Particle_Func_Output_Length9;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold9;
NiagaraScript_888_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Constant216, Constant217, NiagaraScript_888_Particle_Func_Output_Direction9, NiagaraScript_888_Particle_Func_Output_Length9, NiagaraScript_888_Particle_Func_Output_BelowThreshold9, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceVector = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceDirection = NiagaraScript_888_Particle_Func_Output_Direction9;
float3 Result228 = NiagaraScript_888_Particle_Func_Output_Direction9 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius;
float3 Result229 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin - Result228;
float3 Result230 = Result228 + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
float3 Constant218 = float3(0,0,-1);
float Constant219 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction10;
float NiagaraScript_888_Particle_Func_Output_Length10;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold10;
NiagaraScript_888_Particle_Func_(Result230, Constant218, Constant219, NiagaraScript_888_Particle_Func_Output_Direction10, NiagaraScript_888_Particle_Func_Output_Length10, NiagaraScript_888_Particle_Func_Output_BelowThreshold10, Context);
float3 Result231 = NiagaraScript_888_Particle_Func_Output_Direction10 * NiagaraScript_888_Particle_Func_Output_Length10;
float3 Result232 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin + Result231;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart = Result229;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd = Result232;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
float3 Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
float3 Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh;
bool Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid;
float Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface;
Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_(Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface, Context);
float Constant224 = 0;
bool Result241 = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh && Context.MapUpdate.Collision.CollisionQueryAndResponse001.KillParticlesLodgedWithinMeshes && Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionEnabled;
bool Result242 = !Result241;
bool Result243 = Context.MapUpdate.DataInstance.Alive && Result242;
bool Constant225 = false;
bool Constant226 = true;
Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse001.CollisionID = Constant220;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedFriction = Constant224;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedRestitution = Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient;
Context.MapUpdate.DataInstance.Alive = Result243;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.ModuleDepthBasedCollisionParticleOccluded = Constant225;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.ParticleOnScreen = Constant226;
float3 Constant227 = float3(0,0,1);
float3 Constant228 = float3(0,0,-1e+16);
float3 PlaneNormal_IfResult1;
float3 PlanePivotPoint_IfResult1;
PlaneNormal_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult1 = Constant227;
PlanePivotPoint_IfResult1 = Constant228;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal = PlaneNormal_IfResult1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlanePivotPoint = PlanePivotPoint_IfResult1;
bool NiagaraScript_903_Func_Output_Collides1;
float3 NiagaraScript_903_Func_Output_IntersectionLocation1;
float3 NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation1;
float3 NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation1;
float NiagaraScript_903_Func_Output_TimeElapsedToCollision1;
float NiagaraScript_903_Func_Output_RemainingTimePostCollision1;
float NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision1;
float NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
float NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
NiagaraScript_903_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin, Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius, Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance, NiagaraScript_903_Func_Output_Collides1, NiagaraScript_903_Func_Output_IntersectionLocation1, NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation1, NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation1, NiagaraScript_903_Func_Output_TimeElapsedToCollision1, NiagaraScript_903_Func_Output_RemainingTimePostCollision1, NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision1, NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1, NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = NiagaraScript_903_Func_Output_IntersectionLocation1;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation1;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTickDeltaForThisCollisionUpdate = NiagaraScript_903_Func_Output_TimeElapsedToCollision1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePhysicsDeltaTime = NiagaraScript_903_Func_Output_RemainingTimePostCollision1;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePercentageOfTickDedicatedToUpdatingPosition = NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision1;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance = NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
Context.MapUpdate.Transient.CollisionDistanceToCollision = NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
float Constant229 = 0;
bool Result244 = NiagaraAll(Context.MapUpdate.Transient.CollisionDistanceToCollision <= Constant229);
bool Result245 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionEnabled && Result244;
bool Result246 = Result245 || Context.MapUpdate.Particles.HasCollided;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.PhysicsCollidesThisFrame = Result245;
Context.MapUpdate.Particles.HasCollided = Result246;
float3 Result247 = -(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal);
float Result248 = dot(Result247,Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate);
float Result249 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float3 Result250 = Result249 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass;
float Result251 = dot(Result247,Result250);
float Result252 = Result248 - Result251;
float Constant230 = 0.1;
bool Result253 = NiagaraAll(Result252 < Constant230);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleRemoveRestitution = Result253;
float3 Result254 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate / Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float float_IfResult6;
float_IfResult6 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePhysicsDeltaTime;
float_IfResult6 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float Constant231 = 0;
float float_IfResult7;
float_IfResult7 = Constant231;
float_IfResult7 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedRestitution;
Context.MapUpdate.Transient.CollisionValid = Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.PhysicsCollidesThisFrame;
Context.MapUpdate.Transient.CollisionSize = Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius;
Context.MapUpdate.Transient.CollisionNormal = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal;
Context.MapUpdate.Transient.CollisionVelocity = Result254;
Context.MapUpdate.Transient.CollisionFriction = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedFriction;
Context.MapUpdate.Transient.PhysicsDeltaTime = float_IfResult6;
Context.MapUpdate.Transient.CollisionRestitution = float_IfResult7;
bool Result255 = !Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleRemoveRestitution;
bool Result256 = Result255 && Context.MapUpdate.Collision.CollisionQueryAndResponse001.RandomizeCollisionNormal;
float Constant232 = 1;
float3 NiagaraScript_905_Func_Output_Ouput1;
NiagaraScript_905_Func_(Context.MapUpdate.Transient.CollisionNormal, Constant232, Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage, NiagaraScript_905_Func_Output_Ouput1, Context);
float3 Vector_IfResult6;
Vector_IfResult6 = NiagaraScript_905_Func_Output_Ouput1;
Vector_IfResult6 = Context.MapUpdate.Transient.CollisionNormal;
float3 NiagaraScript_904_Func_Output_Reflected1;
NiagaraScript_904_Func_(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult6, NiagaraScript_904_Func_Output_Reflected1, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity = NiagaraScript_904_Func_Output_Reflected1;
float3 NiagaraScript_909_Func_Output_CentimeterstoMeters1;
float3 NiagaraScript_909_Func_Output_MeterstoCentimeters1;
NiagaraScript_909_Func_(Context.MapUpdate.Transient.CollisionVelocity, NiagaraScript_909_Func_Output_CentimeterstoMeters1, NiagaraScript_909_Func_Output_MeterstoCentimeters1, Context);
float3 Result257 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * NiagaraScript_909_Func_Output_CentimeterstoMeters1;
float Constant233 = -1;
float3 Result258 = Result257 * Constant233;
float Result259 = dot(Result258,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons = Result259;
bool Constant234 = false;
float3 NiagaraScript_910_Particle_Func_Output_Ouput1;
NiagaraScript_910_Particle_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant234, NiagaraScript_910_Particle_Func_Output_Ouput1, Context);
float3 Constant235 = float3(0,0,0);
float Constant236 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction12;
float NiagaraScript_888_Particle_Func_Output_Length12;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold12;
NiagaraScript_888_Particle_Func_(NiagaraScript_910_Particle_Func_Output_Ouput1, Constant235, Constant236, NiagaraScript_888_Particle_Func_Output_Direction12, NiagaraScript_888_Particle_Func_Output_Length12, NiagaraScript_888_Particle_Func_Output_BelowThreshold12, Context);
float3 NiagaraScript_911_Func_Output_CentimeterstoMeters1;
float3 NiagaraScript_911_Func_Output_MeterstoCentimeters1;
NiagaraScript_911_Func_(NiagaraScript_910_Particle_Func_Output_Ouput1, NiagaraScript_911_Func_Output_CentimeterstoMeters1, NiagaraScript_911_Func_Output_MeterstoCentimeters1, Context);
float3 Result260 = NiagaraScript_911_Func_Output_CentimeterstoMeters1 * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float Constant237 = 0;
float float_IfResult8;
float_IfResult8 = Constant237;
float_IfResult8 = NiagaraScript_888_Particle_Func_Output_Length12;
bool Result261 = NiagaraAll(float_IfResult8 > Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed);
float float_IfResult9;
float_IfResult9 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.DynamicFrictionCoefficient;
float_IfResult9 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionCoefficient;
float float_IfResult10;
float_IfResult10 = float_IfResult9;
float_IfResult10 = Context.MapUpdate.Collision.CollisionQueryAndResponse001.BounceCollisionFriction;
float3 Result262 = NiagaraScript_888_Particle_Func_Output_Direction12 * float_IfResult10 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons;
float3 Result263 = Result260 - Result262;
float3 Constant238 = float3(0,0,0);
float Constant239 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction13;
float NiagaraScript_888_Particle_Func_Output_Length13;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold13;
NiagaraScript_888_Particle_Func_(Result263, Constant238, Constant239, NiagaraScript_888_Particle_Func_Output_Direction13, NiagaraScript_888_Particle_Func_Output_Length13, NiagaraScript_888_Particle_Func_Output_BelowThreshold13, Context);
float Result264 = dot(NiagaraScript_888_Particle_Func_Output_Direction12,NiagaraScript_888_Particle_Func_Output_Direction13);
float Constant240 = 0;
bool Result265 = NiagaraAll(Result264 <= Constant240);
float3 Vector_IfResult7;
Vector_IfResult7 = Result260;
Vector_IfResult7 = Result262;
float Constant241 = -1;
float3 Result266 = Vector_IfResult7 * Constant241;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons = Result266;
float3 Result267 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 NiagaraScript_912_Func_Output_CentimeterstoMeters1;
float3 NiagaraScript_912_Func_Output_MeterstoCentimeters1;
NiagaraScript_912_Func_(Result267, NiagaraScript_912_Func_Output_CentimeterstoMeters1, NiagaraScript_912_Func_Output_MeterstoCentimeters1, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector = NiagaraScript_912_Func_Output_MeterstoCentimeters1;
float3 Result268 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity + Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector;
float Result269 = dot(Context.MapUpdate.Transient.CollisionNormal,Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity);
float3 Result270 = Context.MapUpdate.Transient.CollisionNormal * Result269;
float Result271 = 1 - Context.MapUpdate.Transient.CollisionRestitution;
float3 Result272 = Result270 * Result271;
float3 Result273 = Result268 - Result272;
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied = Result273;
float3 Particleposition_IfResult1;
Particleposition_IfResult1 = Context.MapUpdate.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult1 = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult1;
float3 Constant242 = float3(0,0,1);
float Constant243 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction14;
float NiagaraScript_888_Particle_Func_Output_Length14;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold14;
NiagaraScript_888_Particle_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant242, Constant243, NiagaraScript_888_Particle_Func_Output_Direction14, NiagaraScript_888_Particle_Func_Output_Length14, NiagaraScript_888_Particle_Func_Output_BelowThreshold14, Context);
float Result274 = dot(NiagaraScript_888_Particle_Func_Output_Direction14,Context.MapUpdate.Transient.CollisionNormal);
float Constant244 = 0;
bool Result275 = NiagaraAll(Result274 < Constant244);
bool Result276 = Result275 && Context.MapUpdate.Transient.CollisionValid;
float3 Constant245 = float3(0,0,0);
float3 physicsforce_IfResult1;
float3 Velocity_IfResult1;
physicsforce_IfResult1 = Constant245;
Velocity_IfResult1 = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied;
physicsforce_IfResult1 = Context.MapUpdate.Transient.PhysicsForce;
Velocity_IfResult1 = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Velocity_IfResult1;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = physicsforce_IfResult1;
Out_ModuleTraceWorldStart = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart;
Out_ModuleTraceWorldEnd = Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd;
bool Constant277 = false;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_914_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_914_Func_Output_OutTransform3;
bool NiagaraScript_914_Func_Output_LocalToWorld3;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant277, NiagaraScript_914_Func_Output_bUseOriginal3, NiagaraScript_914_Func_Output_OutTransform3, NiagaraScript_914_Func_Output_LocalToWorld3, Context);
float3 Result304 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult10;
Vector_IfResult10 = In_InVector;
Vector_IfResult10 = Result304;
Out_OutVector = Vector_IfResult10;
bool Constant282 = false;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_914_Func_Output_bUseOriginal4;
float4x4 NiagaraScript_914_Func_Output_OutTransform4;
bool NiagaraScript_914_Func_Output_LocalToWorld4;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult4, Constant282, NiagaraScript_914_Func_Output_bUseOriginal4, NiagaraScript_914_Func_Output_OutTransform4, NiagaraScript_914_Func_Output_LocalToWorld4, Context);
float3 Result307 = mul(float4(In_InPosition,1.0),NiagaraScript_914_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult11;
Vector_IfResult11 = In_InPosition;
Vector_IfResult11 = Result307;
Out_OutPosition = Vector_IfResult11;
bool Constant286 = false;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_914_Func_Output_bUseOriginal5;
float4x4 NiagaraScript_914_Func_Output_OutTransform5;
bool NiagaraScript_914_Func_Output_LocalToWorld5;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult5, Constant286, NiagaraScript_914_Func_Output_bUseOriginal5, NiagaraScript_914_Func_Output_OutTransform5, NiagaraScript_914_Func_Output_LocalToWorld5, Context);
float3 Result308 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult12;
Vector_IfResult12 = In_InVector;
Vector_IfResult12 = Result308;
Out_OutVector = Vector_IfResult12;
int Constant94 = 1;
int Constant95 = 1;
int Result33 = max(Constant94, Constant95);
bool Result34 = NiagaraAll(Context.MapUpdate.Particles.NumberOfCollisions >= Result33);
bool Result35 = Result34 && Context.MapUpdate.Collision.EnableRestState && Context.MapUpdate.Collision.EnableMaxCollisionCount;
bool Result36 = Result35 || Context.MapUpdate.Transient.CollisionIsResting || Context.MapUpdate.Collision.ManuallyEnterRest;
Context.MapUpdate.Local.Collision.ManuallyEnterRest = Result36;
float Constant96 = 0.001;
float Result37 = max(Context.MapUpdate.Collision.ParticleMass, Constant96);
Context.MapUpdate.Transient.Collision_ParticleMassReplacement = Result37;
Context.MapUpdate.OUTPUT_VAR.Collision.IncomingCollisionVelocity = Context.MapUpdate.Particles.Velocity;
int Constant98 = 1;
bool Constant99 = false;
float3 Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Collision_TransformPosition007_Emitter_Func_(Context.MapUpdate.Particles.Position, Constant97, Constant98, Constant99, Collision_TransformPosition007_Emitter_Func_Output_OutPosition, Context);
int Constant108 = 1;
bool Constant109 = false;
float3 Collision_TransformVector009_Emitter_Func_Output_OutVector;
Collision_TransformVector009_Emitter_Func_(Context.MapUpdate.Particles.Velocity, Constant107, Constant108, Constant109, Collision_TransformVector009_Emitter_Func_Output_OutVector, Context);
int Constant111 = 0;
int Constant112 = 1;
bool Constant113 = false;
float3 Collision_TransformVector010_Emitter_Func_Output_OutVector;
Collision_TransformVector010_Emitter_Func_(Context.MapUpdate.Collision.PhysicsForce, Constant111, Constant112, Constant113, Collision_TransformVector010_Emitter_Func_Output_OutVector, Context);
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Local.Collision.InputPositionPassthrough_NeededForSimStageExecution = Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector009_Emitter_Func_Output_OutVector;
Context.MapUpdate.Local.Collision.InputVelocityPassthrough_NeededForSimStageExecution = Collision_TransformVector009_Emitter_Func_Output_OutVector;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = Collision_TransformVector010_Emitter_Func_Output_OutVector;
Context.MapUpdate.Local.Collision.InputForcePassthrough_NeededForSimStageExecution = Collision_TransformVector010_Emitter_Func_Output_OutVector;
float Constant115 = 1;
float NiagaraScript_916_Particle_Method_NewEnumerator0_Func_Output_Radius;
NiagaraScript_916_Particle_Method_NewEnumerator0_Func_(Context.MapUpdate.Particles.SpriteSize, NiagaraScript_916_Particle_Method_NewEnumerator0_Func_Output_Radius, Context);
float Result70 = Constant115 * NiagaraScript_916_Particle_Method_NewEnumerator0_Func_Output_Radius;
float Constant117 = 1e-06;
float Result71 = max(Result70, Constant117);
Context.MapUpdate.Local.Collision.ModuleParticleRadius = Result71;
float Constant118 = 0;
float Constant119 = 0;
float Constant120 = 0;
float Constant121 = 0;
float Constant122 = 0.1;
float Constant123 = 0;
float Constant124 = -999999;
Context.MapUpdate.Collision.CollisionQueryAndResponse.DynamicFrictionCoefficient = Constant118;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.DynamicFrictionCoefficient = Constant118;
Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionCoefficient = Constant119;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionCoefficient = Constant119;
Context.MapUpdate.Collision.CollisionQueryAndResponse.StaticFrictionEngagementSpeed = Constant120;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed = Constant120;
Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius = Context.MapUpdate.Local.Collision.ModuleParticleRadius;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius = Context.MapUpdate.Local.Collision.ModuleParticleRadius;
Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient = Constant121;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient = Constant121;
Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage = Constant122;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage = Constant122;
Context.MapUpdate.Collision.CollisionQueryAndResponse.CollisionEnabled = Context.MapUpdate.Collision.CollisionEnabled;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.CollisionEnabled = Context.MapUpdate.Collision.CollisionEnabled;
Context.MapUpdate.Collision.CollisionQueryAndResponse.RandomizeCollisionNormal = Context.MapUpdate.Collision.RandomizeCollisionNormalVector;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.RandomizeCollisionNormal = Context.MapUpdate.Collision.RandomizeCollisionNormalVector;
Context.MapUpdate.Collision.CollisionQueryAndResponse.UpdateRotationalVelocity = Context.MapUpdate.Local.Collision.UpdateMeshRotation;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.UpdateRotationalVelocity = Context.MapUpdate.Local.Collision.UpdateMeshRotation;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.BounceCollisionFriction = Constant123;
Context.MapUpdate.Collision.CollisionQueryAndResponse.BounceCollisionFriction = Constant123;
Context.MapUpdate.Collision.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance = Constant124;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance = Constant124;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.KillParticlesLodgedWithinMeshes = Context.MapUpdate.Collision.KillParticlesLodgedWithinMeshes;
Context.MapUpdate.Collision.CollisionQueryAndResponse.KillParticlesLodgedWithinMeshes = Context.MapUpdate.Collision.KillParticlesLodgedWithinMeshes;
Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float Constant125 = 1;
Context.MapUpdate.Collision.CollisionQueryAndResponse.TraceVectorLengthMultiplier = Constant125;
float Constant126 = 1e+10;
Context.MapUpdate.Collision.CollisionQueryAndResponse.MaxTraceLength = Constant126;
Context.MapUpdate.Collision.CollisionQueryAndResponse.CPUFrictionMergeType = Constant127;
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
float Constant213 = 1;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.TraceVectorLengthMultiplier = Constant213;
float Constant214 = 1e+10;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.MaxTraceLength = Constant214;
Context.MapUpdate.Collision.CollisionQueryAndResponse001.CPUFrictionMergeType = Constant215;
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
bool Result277 = Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Valid || Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision2Valid;
int Constant246 = 1;
int Result278 = Context.MapUpdate.Particles.NumberOfCollisions + Constant246;
int int32_IfResult;
int32_IfResult = Result278;
int32_IfResult = Context.MapUpdate.Particles.NumberOfCollisions;
Context.MapUpdate.Transient.CollisionValid = Result277;
Context.MapUpdate.OUTPUT_VAR.Collision.CollisionValid = Result277;
Context.MapUpdate.Particles.NumberOfCollisions = int32_IfResult;
float Constant247 = 1;
float Constant248 = 0.5;
float Constant249 = 0.5;
float3 Constant250 = float3(0,0,1);
float Constant251 = 0.5;
float Constant252 = 0;
bool Result279 = NiagaraAll(Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance < Constant252);
float Constant253 = 0;
bool Result280 = NiagaraAll(Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance < Constant253);
bool Result281 = Result279 && Result280;
float Constant254 = 0.5;
float Constant255 = 0;
float Constant256 = (0.0);
float NiagaraFloat_SelectResult4 = Constant256;
NiagaraFloat_SelectResult4 = Constant254;
NiagaraFloat_SelectResult4 = Constant255;
float Constant257 = 0.5;
float Constant258 = 0;
float Constant259 = (0.0);
float NiagaraFloat_SelectResult5 = Constant259;
NiagaraFloat_SelectResult5 = Constant257;
NiagaraFloat_SelectResult5 = Constant258;
float Result282 = NiagaraFloat_SelectResult4 + NiagaraFloat_SelectResult5;
float Result283 = Context.MapUpdate.Engine.DeltaTime * Constant248;
float Result284 = lerp(Context.MapUpdate.Particles.RestCounter,Result282,Result283);
bool Result285 = NiagaraAll(Result284 > Constant247);
float Constant260 = -1;
float Result286 = Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance * Constant260;
bool Result287 = NiagaraAll(Result286 > Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance);
float Constant261 = -1;
float Result288 = Constant249 * Constant261;
bool Result289 = NiagaraAll(Result288 > Context.MapUpdate.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance);
bool Result290 = Result287 || Result289;
bool Result291 = Result281 || Result285 || Result290;
float3 Constant262 = float3(0,0,0);
float3 Vector_IfResult8;
Vector_IfResult8 = Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision1Normal;
Vector_IfResult8 = Constant262;
float3 Constant263 = float3(0,0,0);
float3 Vector_IfResult9;
Vector_IfResult9 = Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCollision2Normal;
Vector_IfResult9 = Constant263;
float3 Result292 = Vector_IfResult8 + Vector_IfResult9;
float Constant265 = 1e-05;
float3 NiagaraScript_901_Particle_Func_Output_Direction1;
float NiagaraScript_901_Particle_Func_Output_Length1;
bool NiagaraScript_901_Particle_Func_Output_BelowThreshold1;
NiagaraScript_901_Particle_Func_(Result292, Constant264, Constant265, NiagaraScript_901_Particle_Func_Output_Direction1, NiagaraScript_901_Particle_Func_Output_Length1, NiagaraScript_901_Particle_Func_Output_BelowThreshold1, Context);
float Result293 = dot(NiagaraScript_901_Particle_Func_Output_Direction1,Constant250);
float Constant266 = 0.5;
float Result294 = Constant251 - Constant266;
float Constant267 = 2;
float Result295 = Result294 * Constant267;
bool Result296 = NiagaraAll(Result293 > Result295);
bool Result297 = Result291 && Result296;
bool_IfResult1 = Result297;
bool_IfResult1 = Result291;
bool Result298 = Context.MapUpdate.Collision.EnableRestState && bool_IfResult1 && Context.MapUpdate.Collision.CollisionEnabled;
bool Result299 = Result298 || Context.MapUpdate.Local.Collision.ManuallyEnterRest;
float3 Constant268 = float3(0,0,0);
float3 Constant269 = float3(0,0,0);
float3 Constant270 = float3(0,0,0);
float Result300 = dot(Context.MapUpdate.Transient.AdvectionVelocity,NiagaraScript_901_Particle_Func_Output_Direction1);
float Constant271 = 0;
bool Result301 = NiagaraAll(Result300 > Constant271);
float3 Result302 = NiagaraScript_901_Particle_Func_Output_Direction1 * Result300;
float3 Result303 = Context.MapUpdate.Transient.AdvectionVelocity - Result302;
float3 Constant272 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult6 = Constant272;
Vector3f_SelectResult6 = Context.MapUpdate.Transient.AdvectionVelocity;
Vector3f_SelectResult6 = Result303;
float3 Position_IfResult;
float3 Velocity_IfResult2;
float3 Force_IfResult;
float deltatime_IfResult;
float3 AdvectionVelocity_IfResult;
Position_IfResult = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult2 = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Force_IfResult = Constant270;
deltatime_IfResult = Context.MapUpdate.Transient.PhysicsDeltaTime;
AdvectionVelocity_IfResult = Vector3f_SelectResult6;
Position_IfResult = Context.MapUpdate.Local.Collision.InputPositionPassthrough_NeededForSimStageExecution;
Velocity_IfResult2 = Context.MapUpdate.Local.Collision.InputVelocityPassthrough_NeededForSimStageExecution;
Force_IfResult = Context.MapUpdate.Local.Collision.InputForcePassthrough_NeededForSimStageExecution;
deltatime_IfResult = Context.MapUpdate.Engine.DeltaTime;
AdvectionVelocity_IfResult = Context.MapUpdate.Transient.AdvectionVelocity;
float3 Constant273 = float3(0,0,0);
float3 Position_IfResult1;
float3 Velocity_IfResult3;
float3 Force_IfResult1;
float deltatime_IfResult1;
float3 AdvectionVelocity_IfResult1;
Position_IfResult1 = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult3 = Constant268;
Force_IfResult1 = Constant269;
deltatime_IfResult1 = deltatime_IfResult;
AdvectionVelocity_IfResult1 = Constant273;
Position_IfResult1 = Position_IfResult;
Velocity_IfResult3 = Velocity_IfResult2;
Force_IfResult1 = Force_IfResult;
AdvectionVelocity_IfResult1 = AdvectionVelocity_IfResult;
int Constant274 = 1;
int Constant275 = 0;
bool Constant276 = false;
float3 Collision_TransformVector_Emitter_Func_Output_OutVector;
Collision_TransformVector_Emitter_Func_(Force_IfResult1, Constant274, Constant275, Constant276, Collision_TransformVector_Emitter_Func_Output_OutVector, Context);
bool Result305 = Result285 && Context.MapUpdate.Collision.CollisionEnabled;
bool Result306 = Context.MapUpdate.Local.Collision.ManuallyEnterRest || Result305;
float3 Constant278 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult7 = Constant278;
Vector3f_SelectResult7 = NiagaraScript_901_Particle_Func_Output_Direction1;
Vector3f_SelectResult7 = Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal;
int Constant279 = 1;
int Constant280 = 0;
bool Constant281 = false;
float3 Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Collision_TransformPosition001_Emitter_Func_(Position_IfResult1, Constant279, Constant280, Constant281, Collision_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
int Constant283 = 1;
int Constant284 = 0;
bool Constant285 = false;
float3 Collision_TransformVector001_Emitter_Func_Output_OutVector;
Collision_TransformVector001_Emitter_Func_(Velocity_IfResult3, Constant283, Constant284, Constant285, Collision_TransformVector001_Emitter_Func_Output_OutVector, Context);
Context.MapUpdate.Transient.PhysicsForce = Collision_TransformVector_Emitter_Func_Output_OutVector;
Context.MapUpdate.Transient.PhysicsDeltaTime = deltatime_IfResult1;
Context.MapUpdate.Transient.CollisionIsResting = Result306;
Context.MapUpdate.Particles.RestCounter = Result284;
Context.MapUpdate.OUTPUT_VAR.Collision.ModuleCombinedCollisionNormal = Vector3f_SelectResult7;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector001_Emitter_Func_Output_OutVector;
Context.MapUpdate.Particles.Velocity = Collision_TransformVector001_Emitter_Func_Output_OutVector;
Context.MapUpdate.Particles.Position = Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.MapUpdate.OUTPUT_VAR.Collision.CombinedCollisionNormal = Vector3f_SelectResult7;
Context.MapUpdate.Transient.AdvectionVelocity = AdvectionVelocity_IfResult1;
Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal = Vector3f_SelectResult7;
float Constant287 = 0;
Context.MapUpdate.Collision.AdvancedAgingRate = Constant287;
int Constant288 = 1;
Context.MapUpdate.Local.Collision.KillOnCollision = Constant288;
Context.MapUpdate.Particles.PrevPosition = Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevPosition;
Context.MapUpdate.Particles.PrevMeshOrientation = Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevMeshOrientation;
float Constant293 = 0.5;
float Result309 = Constant293 + Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsDrag = Result309;
float Constant294 = 0;
float Constant295 = 0.01;
float Result310 = Context.MapUpdate.Transient.PhysicsRotationalDrag * Constant295;
Context.MapUpdate.Transient.PhysicsRotationalDrag = Result310;
Context.MapUpdate.Transient.DragIgnoreMass = Context.MapUpdate.Drag.IgnoreMass;
Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime = Context.MapUpdate.SolveForcesAndVelocity001.DeltaTime;
float Constant303 = 1e-05;
float Result311 = max(Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime, Constant303);
float Result312 = Reciprocal(Result311);
Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseDeltaTime = Result312;
Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce = Context.MapUpdate.SolveForcesAndVelocity001.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsForce = Context.MapUpdate.SolveForcesAndVelocity001.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Context.MapUpdate.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.Local.SolveForcesAndVelocity001.Mass = Context.MapUpdate.SolveForcesAndVelocity001.Mass;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position = Context.MapUpdate.SolveForcesAndVelocity001.Position;
Context.MapUpdate.Particles.Presolve.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.Particles.Presolve.Position = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Context.MapUpdate.Particles.Presolve.PhysicsForce = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsForce;
float Constant304 = 1e-06;
float Result313 = max(Context.MapUpdate.Local.SolveForcesAndVelocity001.Mass, Constant304);
float Result314 = Reciprocal(Result313);
float3 Result315 = Result314 * Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce;
Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce = Result315;
Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseMass = Result314;
float3 Result316 = Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsForce * Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Result316;
Context.MapUpdate.Local.SolveForcesAndVelocity001.AdvectionVelocity = Context.MapUpdate.Transient.AdvectionVelocity;
Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Local.SolveForcesAndVelocity001.DragIgnoreMass = Context.MapUpdate.Transient.DragIgnoreMass;
float3 NiagaraScript_891_Particle_Func_Output_Output2;
NiagaraScript_891_Particle_Func_(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity001.DragIgnoreMass, NiagaraScript_891_Particle_Func_Output_Output2, Context);
float3 Result317 = NiagaraScript_891_Particle_Func_Output_Output2 - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = NiagaraScript_891_Particle_Func_Output_Output2;
Context.MapUpdate.Local.SolveForcesAndVelocity001.DragVelocity = Result317;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsDrag = Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag;
float Constant305 = 1000;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
float Constant306 = 9999;
float3 Result318 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity * Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime;
float3 Result319 = Result318 + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position = Result319;
float3 Position_IfResult2;
float3 Velocity_IfResult4;
Position_IfResult2 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Velocity_IfResult4 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Position_IfResult2 = Context.MapUpdate.Particles.Position;
Velocity_IfResult4 = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.Particles.Position = Position_IfResult2;
Context.MapUpdate.Particles.Velocity = Velocity_IfResult4;
float3 Constant307 = float3(0,0,0);
float Constant308 = 0;
float3 ForceVector_IfResult;
float Drag_IfResult;
ForceVector_IfResult = Constant307;
Drag_IfResult = Constant308;
ForceVector_IfResult = Context.MapUpdate.Transient.PhysicsForce;
Drag_IfResult = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsForce = ForceVector_IfResult;
Context.MapUpdate.Transient.PhysicsDrag = Drag_IfResult;
float3 Result320 = Context.MapUpdate.Particles.Position - Context.MapUpdate.Particles.Previous.Position;
float Result321 = length(Result320);
float Constant309 = 0.3333;
float Result322 = Result321 * Constant309;
float Constant310 = 1e+08;
float Result323 = Modulo(Context.MapUpdate.Particles.DistanceTraveled, Constant310);
float Result324 = Result322 + Result323;
Context.MapUpdate.Particles.DistanceTraveled = Result324;
//SetConstantByStaticVariable "/Solve Forces and Velocity 001/Map Get/Map Get->Particles.RotationalVelocityEnabled"
int Constant311 = 0;
//SetConstantByStaticVariable "/Solve Forces and Velocity 001/Map Get/Map Get->Module.Manually Enable Rotational Solver"
int Constant312 = 0;
//SetConstantByStaticVariable "/Solve Forces and Velocity 001/Logic OR (Static)/Logic OR (Static)->Result"
int Constant313 = 0;
float4 SIGN_MASK0 = float4( 1.f, -1.f, 1.f, -1.f );
float4 SIGN_MASK1 = float4( 1.f, 1.f, -1.f, -1.f );
float4 SIGN_MASK2 = float4( -1.f, 1.f, 1.f, -1.f );
Out_Result = (In_Quat1.wwww * In_Quat2);
Out_Result = ((In_Quat1.xxxx * In_Quat2.wzyx) * SIGN_MASK0) + Out_Result;
Out_Result = ((In_Quat1.yyyy * In_Quat2.zwxy)* SIGN_MASK1) + Out_Result;
Out_Result = ((In_Quat1.zzzz * In_Quat2.yxwz)* SIGN_MASK2) + Out_Result;
float4 CustomHlsl001412C1732C3C785D3CA68D75E26A3520C7B30B713_Func_Output_Result;
CustomHlsl001412C1732C3C785D3CA68D75E26A3520C7B30B713_Func_(In_QuaternionA, In_QuaternionB, CustomHlsl001412C1732C3C785D3CA68D75E26A3520C7B30B713_Func_Output_Result);
Out_Quaternion = CustomHlsl001412C1732C3C785D3CA68D75E26A3520C7B30B713_Func_Output_Result;
float3 Result332 = In_RotationalVelocityVector * In_DeltaTime;
float3 Constant318 = float3(0,0,0);
float Constant319 = 1e-05;
float3 NiagaraScript_888_Particle_Func_Output_Direction15;
float NiagaraScript_888_Particle_Func_Output_Length15;
bool NiagaraScript_888_Particle_Func_Output_BelowThreshold15;
NiagaraScript_888_Particle_Func_(Result332, Constant318, Constant319, NiagaraScript_888_Particle_Func_Output_Direction15, NiagaraScript_888_Particle_Func_Output_Length15, NiagaraScript_888_Particle_Func_Output_BelowThreshold15, Context);
float4 Vector4;
Vector4.x = NiagaraScript_888_Particle_Func_Output_Direction15.x;
Vector4.y = NiagaraScript_888_Particle_Func_Output_Direction15.y;
Vector4.z = NiagaraScript_888_Particle_Func_Output_Direction15.z;
Vector4.w = NiagaraScript_888_Particle_Func_Output_Length15;
bool Constant320 = true;
float4 NiagaraScript_885_Func_Output_Quaternion1;
NiagaraScript_885_Func_(Vector4, Constant320, NiagaraScript_885_Func_Output_Quaternion1, Context);
float4 NiagaraScript_889_Func_Output_Quaternion;
NiagaraScript_889_Func_(NiagaraScript_885_Func_Output_Quaternion1, In_ExistingOrientationQuat, NiagaraScript_889_Func_Output_Quaternion, Context);
float4 Quat_IfResult;
Quat_IfResult = In_ExistingOrientationQuat;
Quat_IfResult = NiagaraScript_889_Func_Output_Quaternion;
Out_NewOrientationQuat = Quat_IfResult;
float3 Result325 = Context.MapUpdate.Transient.PhysicsRotationalForce / Context.MapUpdate.Particles.MomentOfInertia;
float3 Result326 = Result325 * Context.MapUpdate.ScratchModule.DeltaTime;
float3 Result327 = Context.MapUpdate.Particles.RotationalVelocity + Result326;
Context.MapUpdate.Particles.RotationalVelocity = Result327;
float Constant315 = 0.5;
float Constant316 = 0;
float Result328 = max(Constant315, Constant316);
float Result329 = Result328 * Context.MapUpdate.ScratchModule.DeltaTime;
float Constant317 = 1;
float Result330 = Result329 + Constant317;
float3 Result331 = Context.MapUpdate.Particles.RotationalVelocity / Result330;
Context.MapUpdate.Particles.RotationalVelocity = Result331;
float4 NiagaraScript_887_Particle_NormalizeRotations_false_Func_Output_NewOrientationQuat;
NiagaraScript_887_Particle_NormalizeRotations_false_Func_(Context.MapUpdate.Particles.RotationalVelocity, Context.MapUpdate.ScratchModule.DeltaTime, Context.MapUpdate.Particles.MeshOrientation, NiagaraScript_887_Particle_NormalizeRotations_false_Func_Output_NewOrientationQuat, Context);
Context.MapUpdate.Particles.MeshOrientation = NiagaraScript_887_Particle_NormalizeRotations_false_Func_Output_NewOrientationQuat;
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
Context.MapSpawn.Particles.Age = Constant13;
Context.MapSpawn.Particles.Lifetime = Constant14;
float Constant15 = (0.0);
Context.MapSpawn.Particles.NormalizedAge = Constant15;
Context.MapSpawn.Particles.NumberOfCollisions = Constant16;
int Constant17 = (0);
Context.MapSpawn.Particles.Collision.CollisionQueryAndResponse.CollisionID = Constant17;
Context.MapSpawn.Particles.HasCollided = Constant18;
int Constant19 = (0);
Context.MapSpawn.Particles.Collision.CollisionQueryAndResponse001.CollisionID = Constant19;
float Constant20 = 0;
Context.MapSpawn.Particles.RestCounter = Constant20;
float3 Constant21 = float3(0,0,0);
Context.MapSpawn.Particles.Collision.SafeCombinedCollisionNormal = Constant21;
float3 Constant22 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.PrevPosition = Constant22;
float3 Constant23 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Velocity = Constant23;
Context.MapSpawn.Particles.Presolve.Position = Constant24;
Context.MapSpawn.Particles.Presolve.PhysicsForce = Constant25;
float3 Constant26 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Velocity = Constant26;
float3 Constant27 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Position = Constant27;
float Constant28 = 0;
Context.MapSpawn.Particles.DistanceTraveled = Constant28;
float Constant29 = 0.5;
float3 Constant30 = float3(40,20,20);
EnterStatScope(1 /**ScratchModule_04_Emitter_Func_*/);
ScratchModule_04_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_04_Emitter_Func_*/);
float3 Constant36 = float3(0,0,200);
float3 Constant37 = float3(0,1,0);
float Constant38 = 45;
Context.MapSpawn.MakeQuatFromAxisAngle.NormalizeAxis = Constant39;
float4 MakeQuatFromAxisAngle_Emitter_Func_Output_Quaternion;
MakeQuatFromAxisAngle_Emitter_Func_(MakeQuatFromAxisAngle_Emitter_Func_Output_Quaternion, Context);
Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.Position = Constant36;
Context.MapSpawn.SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC.Particles.MeshOrientation = MakeQuatFromAxisAngle_Emitter_Func_Output_Quaternion;
float3 Constant43 = float3(0,0,0);
float3 Constant44 = float3(0,0,0);
float4 Constant45 = float4(0,0,0,1);
EnterStatScope(2 /**SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_*/);
SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_1C92CC5F44C4C7C35436AE997E0A33CC_Emitter_Func_*/);
bool Constant49 = true;
Context.MapUpdate.DataInstance.Alive = Constant49;
bool Constant50 = false;
Context.MapUpdate.ParticleState.LoopParticlesLifetime = Constant50;
Context.MapUpdate.ParticleState.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
bool Constant51 = false;
Context.MapUpdate.ParticleState.LetInfinitelyLivedParticlesDieWhenEmitterDeactivates = Constant51;
EnterStatScope(3 /**ParticleState_Emitter_Func_*/);
ParticleState_Emitter_Func_(Context);
ExitStatScope(/**ParticleState_Emitter_Func_*/);
float3 Constant58 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant58;
float3 Constant59 = float3(0,0,-980);
EnterStatScope(4 /**GravityForce_Emitter_Func_*/);
GravityForce_Emitter_Func_(Context);
ExitStatScope(/**GravityForce_Emitter_Func_*/);
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.dx = Context.MapUpdate.Emitter.dx;
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld = Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapUpdate.Grid3D_ExternalObjectBuoyancyForce.WorldToUnit = Context.MapUpdate.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit;
Context.MapUpdate.Transient.PhysicsRotationalForce = Constant61;
EnterStatScope(5 /**Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_*/);
Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_*/);
bool Constant66 = true;
Context.MapUpdate.Collision.EnableRestState = Constant66;
bool Constant67 = false;
Context.MapUpdate.Transient.CollisionIsResting = Constant67;
bool Constant68 = false;
Context.MapUpdate.Collision.ManuallyEnterRest = Constant68;
bool Constant69 = false;
Context.MapUpdate.Collision.EnableMaxCollisionCount = Constant69;
Context.MapUpdate.Collision.ParticleMass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.Collision.PhysicsForce = Context.MapUpdate.Transient.PhysicsForce;
bool Constant70 = false;
float Constant71 = 1;
float Constant72 = 0;
float Constant73 = 0;
float Constant74 = 0;
float Constant75 = 0;
float Constant76 = 0.1;
bool Constant77 = true;
Context.MapUpdate.Collision.CollisionEnabled = Constant77;
bool Constant78 = false;
Context.MapUpdate.Collision.RandomizeCollisionNormalVector = Constant78;
bool Constant79 = false;
Context.MapUpdate.Local.Collision.UpdateMeshRotation = Constant79;
bool Constant81 = true;
Context.MapUpdate.Collision.KillParticlesLodgedWithinMeshes = Constant81;
float3 Constant82 = float3(0,0,0);
Context.MapUpdate.Transient.Collision_PredictedParticlePositionForSimStages = Constant82;
Context.MapUpdate.Transient.PhysicsDeltaTime = Context.MapUpdate.Engine.DeltaTime;
float3 Constant83 = float3(0,0,0);
Context.MapUpdate.Transient.AdvectionVelocity = Constant83;
float Constant84 = 0;
Context.MapUpdate.Transient.PhysicsDrag = Constant84;
bool Constant85 = true;
Context.MapUpdate.Transient.DragIgnoreMass = Constant85;
float Constant86 = 1;
float Constant87 = 0.5;
float Constant88 = 0.5;
float3 Constant89 = float3(0,0,1);
bool Constant90 = false;
Context.MapUpdate.Collision.ControlRestStateViaSurfaceNormal = Constant90;
float Constant91 = 0.5;
float Constant92 = 0;
int Constant93 = 1;
EnterStatScope(6 /**Collision_Emitter_Func_*/);
Collision_Emitter_Func_(Context);
ExitStatScope(/**Collision_Emitter_Func_*/);
Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevMeshOrientation = Context.MapUpdate.Particles.MeshOrientation;
Context.MapUpdate.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevPosition = Context.MapUpdate.Particles.Position;
EnterStatScope(7 /**SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_*/);
SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_*/);
float Constant289 = 0.5;
float Constant290 = 0;
float Constant291 = 0;
Context.MapUpdate.Transient.PhysicsRotationalDrag = Constant291;
bool Constant292 = true;
Context.MapUpdate.Drag.IgnoreMass = Constant292;
EnterStatScope(8 /**Drag_Emitter_Func_*/);
Drag_Emitter_Func_(Context);
ExitStatScope(/**Drag_Emitter_Func_*/);
float Constant296 = 0;
float3 Constant297 = float3(0,0,0);
float3 Constant298 = float3(0,0,0);
float4 Constant299 = float4(0,0,0,1);
Context.MapUpdate.SolveForcesAndVelocity001.RotationalInertia = Constant296;
Context.MapUpdate.SolveForcesAndVelocity001.RotationalForce = Constant297;
Context.MapUpdate.SolveForcesAndVelocity001.RotationalVelocity = Constant298;
Context.MapUpdate.SolveForcesAndVelocity001.MeshOrientation = Constant299;
Context.MapUpdate.SolveForcesAndVelocity001.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
Context.MapUpdate.SolveForcesAndVelocity001.Force = Context.MapUpdate.Transient.PhysicsForce;
Context.MapUpdate.SolveForcesAndVelocity001.Velocity = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.SolveForcesAndVelocity001.Mass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.SolveForcesAndVelocity001.Position = Context.MapUpdate.Particles.Position;
float Constant300 = 1000;
Context.MapUpdate.SolveForcesAndVelocity001.PreviousVelocity = Context.MapUpdate.Particles.Previous.Velocity;
float Constant301 = 9999;
bool Constant302 = true;
Context.MapUpdate.SolveForcesAndVelocity001.WritetoIntrinsicProperties = Constant302;
EnterStatScope(9 /**SolveForcesAndVelocity001_Emitter_Func_*/);
SolveForcesAndVelocity001_Emitter_Func_(Context);
ExitStatScope(/**SolveForcesAndVelocity001_Emitter_Func_*/);
Context.MapUpdate.ScratchModule.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
float Constant314 = 0.5;
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
Context.MapUpdate.Particles.Previous.Velocity = Context.MapSpawn.Particles.Velocity;
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
int Engine_ExecutionCount;
int PREV_Engine_ExecutionCount;
float PREV_Emitter_SpawnInterval;
float PREV_Emitter_InterpSpawnStartDt;
int PREV_Emitter_SpawnGroup;
float InterpSpawnStartDt;
int SpawnGroup;
float SpawnInterval;
void GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void GetPreviousFloatValue_Emitter_PressureReader_AttributePressure(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void GetPreviousVector4Value_Emitter_BoundaryReader_AttributeSolidVelocity_Boundary(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void NiagaraScript_916_Method_NewEnumerator0_Func_(float2 In_SpriteSize, out float Out_Radius, inout FSimulationContext Context);
void NiagaraScript_891_Func_(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void NiagaraScript_888_Func_(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_Query(int In_InstanceData, float3 In_FieldSamplePosWorld, out float Out_DistanceToNearestSurface, out float3 Out_FieldGradient, out bool Out_IsDistanceFieldValid);
void NiagaraScript_907_Emitter_Determinism_false_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void NiagaraScript_901_Func_(float3 In_VECTOR_VAR, float3 In_FallbackVector, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void NiagaraScript_910_Func_(float3 In_VECTOR_VAR, float3 In_Normal, bool In_NormalizeNormal, out float3 Out_Ouput, inout FSimulationContext Context);
void QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_Query(int In_InstanceData, float3 In_FieldSamplePosWorld, out float Out_DistanceToNearestSurface, out float3 Out_FieldGradient, out bool Out_IsDistanceFieldValid);
void NiagaraScript_887_NormalizeRotations_false_Func_(float3 In_RotationalVelocityVector, float In_DeltaTime, float4 In_ExistingOrientationQuat, out float4 Out_NewOrientationQuat, inout FSimulationContext Context);
        GetPreviousVector4Value_Emitter_BoundaryReader_AttributeSolidVelocity_Boundary(0, CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
            GetPreviousFloatValue_Emitter_PressureReader_AttributePressure(3, CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(2, CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(2, CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(2, CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
            GetPreviousVectorValue_Emitter_FaceReader_AttributeFaceFraction(2, CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_Query(4, In_Position, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid);
float3 NiagaraScript_888_Func_Output_Direction2;
float NiagaraScript_888_Func_Output_Length2;
bool NiagaraScript_888_Func_Output_BelowThreshold2;
NiagaraScript_888_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient, Constant139, Constant140, NiagaraScript_888_Func_Output_Direction2, NiagaraScript_888_Func_Output_Length2, NiagaraScript_888_Func_Output_BelowThreshold2, Context);
float3 Result102 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface * NiagaraScript_888_Func_Output_Direction2;
Out_ImpactNormal = NiagaraScript_888_Func_Output_Direction2;
NiagaraRandInfo NiagaraScript_907_Emitter_Determinism_false_Func_Output_RandomInfo;
bool NiagaraScript_907_Emitter_Determinism_false_Func_Output_UseDeterministicRandoms;
NiagaraScript_907_Emitter_Determinism_false_Func_(In_Seed, Constant164, In_OverrideSeed, Constant166, Constant167, Constant168, In_RandomnessMode, NiagaraScript_907_Emitter_Determinism_false_Func_Output_RandomInfo, NiagaraScript_907_Emitter_Determinism_false_Func_Output_UseDeterministicRandoms, Context);
Seed1 = NiagaraScript_907_Emitter_Determinism_false_Func_Output_RandomInfo.Seed1;
Seed2 = NiagaraScript_907_Emitter_Determinism_false_Func_Output_RandomInfo.Seed2;
Seed3 = NiagaraScript_907_Emitter_Determinism_false_Func_Output_RandomInfo.Seed3;
float3 NiagaraScript_888_Func_Output_Direction4;
float NiagaraScript_888_Func_Output_Length4;
bool NiagaraScript_888_Func_Output_BelowThreshold4;
NiagaraScript_888_Func_(In_From, Constant183, Constant184, NiagaraScript_888_Func_Output_Direction4, NiagaraScript_888_Func_Output_Length4, NiagaraScript_888_Func_Output_BelowThreshold4, Context);
float3 NiagaraScript_888_Func_Output_Direction5;
float NiagaraScript_888_Func_Output_Length5;
bool NiagaraScript_888_Func_Output_BelowThreshold5;
NiagaraScript_888_Func_(In_To, Constant185, Constant186, NiagaraScript_888_Func_Output_Direction5, NiagaraScript_888_Func_Output_Length5, NiagaraScript_888_Func_Output_BelowThreshold5, Context);
CustomHlsl8C77CF06BE09BBAC6ACA2CCF8A8A8A315B5C88E7_Func_(NiagaraScript_888_Func_Output_Direction4, NiagaraScript_888_Func_Output_Direction5, CustomHlsl8C77CF06BE09BBAC6ACA2CCF8A8A8A315B5C88E7_Func_Output_Result);
float3 NiagaraScript_888_Func_Output_Direction3;
float NiagaraScript_888_Func_Output_Length3;
bool NiagaraScript_888_Func_Output_BelowThreshold3;
NiagaraScript_888_Func_(In_ConeAxis, Constant181, Constant182, NiagaraScript_888_Func_Output_Direction3, NiagaraScript_888_Func_Output_Length3, NiagaraScript_888_Func_Output_BelowThreshold3, Context);
NiagaraScript_908_Func_(Constant180, NiagaraScript_888_Func_Output_Direction3, NiagaraScript_908_Func_Output_NewOutput, Context);
float3 NiagaraScript_901_Func_Output_Direction;
float NiagaraScript_901_Func_Output_Length;
bool NiagaraScript_901_Func_Output_BelowThreshold;
NiagaraScript_901_Func_(In_Normal, Constant193, Constant194, NiagaraScript_901_Func_Output_Direction, NiagaraScript_901_Func_Output_Length, NiagaraScript_901_Func_Output_BelowThreshold, Context);
Vector3f_SelectResult3 = NiagaraScript_901_Func_Output_Direction;
float3 NiagaraScript_891_Func_Output_Output;
NiagaraScript_891_Func_(Result75, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, NiagaraScript_891_Func_Output_Output, Context);
float3 Result83 = NiagaraScript_891_Func_Output_Output * Context.MapUpdate.Collision.CollisionQueryAndResponse.DeltaTime;
float3 NiagaraScript_888_Func_Output_Direction;
float NiagaraScript_888_Func_Output_Length;
bool NiagaraScript_888_Func_Output_BelowThreshold;
NiagaraScript_888_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution, Constant131, Constant132, NiagaraScript_888_Func_Output_Direction, NiagaraScript_888_Func_Output_Length, NiagaraScript_888_Func_Output_BelowThreshold, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleTraceDirection = NiagaraScript_888_Func_Output_Direction;
float3 Result91 = NiagaraScript_888_Func_Output_Direction * Context.MapUpdate.Collision.CollisionQueryAndResponse.ParticleRadius;
float3 NiagaraScript_888_Func_Output_Direction1;
float NiagaraScript_888_Func_Output_Length1;
bool NiagaraScript_888_Func_Output_BelowThreshold1;
NiagaraScript_888_Func_(Result93, Constant135, Constant136, NiagaraScript_888_Func_Output_Direction1, NiagaraScript_888_Func_Output_Length1, NiagaraScript_888_Func_Output_BelowThreshold1, Context);
float3 Result94 = NiagaraScript_888_Func_Output_Direction1 * NiagaraScript_888_Func_Output_Length1;
float3 NiagaraScript_910_Func_Output_Ouput;
NiagaraScript_910_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant192, NiagaraScript_910_Func_Output_Ouput, Context);
float3 NiagaraScript_888_Func_Output_Direction6;
float NiagaraScript_888_Func_Output_Length6;
bool NiagaraScript_888_Func_Output_BelowThreshold6;
NiagaraScript_888_Func_(NiagaraScript_910_Func_Output_Ouput, Constant198, Constant199, NiagaraScript_888_Func_Output_Direction6, NiagaraScript_888_Func_Output_Length6, NiagaraScript_888_Func_Output_BelowThreshold6, Context);
NiagaraScript_911_Func_(NiagaraScript_910_Func_Output_Ouput, NiagaraScript_911_Func_Output_CentimeterstoMeters, NiagaraScript_911_Func_Output_MeterstoCentimeters, Context);
float_IfResult3 = NiagaraScript_888_Func_Output_Length6;
float3 Result206 = NiagaraScript_888_Func_Output_Direction6 * float_IfResult5 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons;
float3 NiagaraScript_888_Func_Output_Direction7;
float NiagaraScript_888_Func_Output_Length7;
bool NiagaraScript_888_Func_Output_BelowThreshold7;
NiagaraScript_888_Func_(Result207, Constant203, Constant204, NiagaraScript_888_Func_Output_Direction7, NiagaraScript_888_Func_Output_Length7, NiagaraScript_888_Func_Output_BelowThreshold7, Context);
float Result208 = dot(NiagaraScript_888_Func_Output_Direction6,NiagaraScript_888_Func_Output_Direction7);
float3 NiagaraScript_888_Func_Output_Direction8;
float NiagaraScript_888_Func_Output_Length8;
bool NiagaraScript_888_Func_Output_BelowThreshold8;
NiagaraScript_888_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant209, Constant210, NiagaraScript_888_Func_Output_Direction8, NiagaraScript_888_Func_Output_Length8, NiagaraScript_888_Func_Output_BelowThreshold8, Context);
float Result220 = dot(NiagaraScript_888_Func_Output_Direction8,Context.MapUpdate.Transient.CollisionNormal);
QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_Query(5, In_Position, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient, QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid);
float3 NiagaraScript_888_Func_Output_Direction11;
float NiagaraScript_888_Func_Output_Length11;
bool NiagaraScript_888_Func_Output_BelowThreshold11;
NiagaraScript_888_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient, Constant222, Constant223, NiagaraScript_888_Func_Output_Direction11, NiagaraScript_888_Func_Output_Length11, NiagaraScript_888_Func_Output_BelowThreshold11, Context);
float3 Result239 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface * NiagaraScript_888_Func_Output_Direction11;
Out_ImpactNormal = NiagaraScript_888_Func_Output_Direction11;
float3 NiagaraScript_891_Func_Output_Output1;
NiagaraScript_891_Func_(Result226, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, NiagaraScript_891_Func_Output_Output1, Context);
float3 Result227 = NiagaraScript_891_Func_Output_Output1 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.DeltaTime;
float3 NiagaraScript_888_Func_Output_Direction9;
float NiagaraScript_888_Func_Output_Length9;
bool NiagaraScript_888_Func_Output_BelowThreshold9;
NiagaraScript_888_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Constant216, Constant217, NiagaraScript_888_Func_Output_Direction9, NiagaraScript_888_Func_Output_Length9, NiagaraScript_888_Func_Output_BelowThreshold9, Context);
Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleTraceDirection = NiagaraScript_888_Func_Output_Direction9;
float3 Result228 = NiagaraScript_888_Func_Output_Direction9 * Context.MapUpdate.Collision.CollisionQueryAndResponse001.ParticleRadius;
float3 NiagaraScript_888_Func_Output_Direction10;
float NiagaraScript_888_Func_Output_Length10;
bool NiagaraScript_888_Func_Output_BelowThreshold10;
NiagaraScript_888_Func_(Result230, Constant218, Constant219, NiagaraScript_888_Func_Output_Direction10, NiagaraScript_888_Func_Output_Length10, NiagaraScript_888_Func_Output_BelowThreshold10, Context);
float3 Result231 = NiagaraScript_888_Func_Output_Direction10 * NiagaraScript_888_Func_Output_Length10;
float3 NiagaraScript_910_Func_Output_Ouput1;
NiagaraScript_910_Func_(Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant234, NiagaraScript_910_Func_Output_Ouput1, Context);
float3 NiagaraScript_888_Func_Output_Direction12;
float NiagaraScript_888_Func_Output_Length12;
bool NiagaraScript_888_Func_Output_BelowThreshold12;
NiagaraScript_888_Func_(NiagaraScript_910_Func_Output_Ouput1, Constant235, Constant236, NiagaraScript_888_Func_Output_Direction12, NiagaraScript_888_Func_Output_Length12, NiagaraScript_888_Func_Output_BelowThreshold12, Context);
NiagaraScript_911_Func_(NiagaraScript_910_Func_Output_Ouput1, NiagaraScript_911_Func_Output_CentimeterstoMeters1, NiagaraScript_911_Func_Output_MeterstoCentimeters1, Context);
float_IfResult8 = NiagaraScript_888_Func_Output_Length12;
float3 Result262 = NiagaraScript_888_Func_Output_Direction12 * float_IfResult10 * Context.MapUpdate.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons;
float3 NiagaraScript_888_Func_Output_Direction13;
float NiagaraScript_888_Func_Output_Length13;
bool NiagaraScript_888_Func_Output_BelowThreshold13;
NiagaraScript_888_Func_(Result263, Constant238, Constant239, NiagaraScript_888_Func_Output_Direction13, NiagaraScript_888_Func_Output_Length13, NiagaraScript_888_Func_Output_BelowThreshold13, Context);
float Result264 = dot(NiagaraScript_888_Func_Output_Direction12,NiagaraScript_888_Func_Output_Direction13);
float3 NiagaraScript_888_Func_Output_Direction14;
float NiagaraScript_888_Func_Output_Length14;
bool NiagaraScript_888_Func_Output_BelowThreshold14;
NiagaraScript_888_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant242, Constant243, NiagaraScript_888_Func_Output_Direction14, NiagaraScript_888_Func_Output_Length14, NiagaraScript_888_Func_Output_BelowThreshold14, Context);
float Result274 = dot(NiagaraScript_888_Func_Output_Direction14,Context.MapUpdate.Transient.CollisionNormal);
float NiagaraScript_916_Method_NewEnumerator0_Func_Output_Radius;
NiagaraScript_916_Method_NewEnumerator0_Func_(Context.MapUpdate.Particles.SpriteSize, NiagaraScript_916_Method_NewEnumerator0_Func_Output_Radius, Context);
float Result70 = Constant115 * NiagaraScript_916_Method_NewEnumerator0_Func_Output_Radius;
float3 NiagaraScript_901_Func_Output_Direction1;
float NiagaraScript_901_Func_Output_Length1;
bool NiagaraScript_901_Func_Output_BelowThreshold1;
NiagaraScript_901_Func_(Result292, Constant264, Constant265, NiagaraScript_901_Func_Output_Direction1, NiagaraScript_901_Func_Output_Length1, NiagaraScript_901_Func_Output_BelowThreshold1, Context);
float Result293 = dot(NiagaraScript_901_Func_Output_Direction1,Constant250);
float Result300 = dot(Context.MapUpdate.Transient.AdvectionVelocity,NiagaraScript_901_Func_Output_Direction1);
float3 Result302 = NiagaraScript_901_Func_Output_Direction1 * Result300;
Vector3f_SelectResult7 = NiagaraScript_901_Func_Output_Direction1;
float3 NiagaraScript_891_Func_Output_Output2;
NiagaraScript_891_Func_(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity001.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity001.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity001.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity001.DragIgnoreMass, NiagaraScript_891_Func_Output_Output2, Context);
float3 Result317 = NiagaraScript_891_Func_Output_Output2 - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = NiagaraScript_891_Func_Output_Output2;
float3 NiagaraScript_888_Func_Output_Direction15;
float NiagaraScript_888_Func_Output_Length15;
bool NiagaraScript_888_Func_Output_BelowThreshold15;
NiagaraScript_888_Func_(Result332, Constant318, Constant319, NiagaraScript_888_Func_Output_Direction15, NiagaraScript_888_Func_Output_Length15, NiagaraScript_888_Func_Output_BelowThreshold15, Context);
Vector4.x = NiagaraScript_888_Func_Output_Direction15.x;
Vector4.y = NiagaraScript_888_Func_Output_Direction15.y;
Vector4.z = NiagaraScript_888_Func_Output_Direction15.z;
Vector4.w = NiagaraScript_888_Func_Output_Length15;
float4 NiagaraScript_887_NormalizeRotations_false_Func_Output_NewOrientationQuat;
NiagaraScript_887_NormalizeRotations_false_Func_(Context.MapUpdate.Particles.RotationalVelocity, Context.MapUpdate.ScratchModule.DeltaTime, Context.MapUpdate.Particles.MeshOrientation, NiagaraScript_887_NormalizeRotations_false_Func_Output_NewOrientationQuat, Context);
Context.MapUpdate.Particles.MeshOrientation = NiagaraScript_887_NormalizeRotations_false_Func_Output_NewOrientationQuat;
EnterStatScope(11 /**SpawnScript_0_Main*/);
Context.MapSpawn.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + ExecIndex();
Context.MapUpdate.Emitter.SpawnInterval = Emitter_SpawnInterval;
Context.MapUpdate.Emitter.InterpSpawnStartDt = Emitter_InterpSpawnStartDt;
Context.MapUpdate.Emitter.SpawnGroup = Emitter_SpawnGroup;
Context.MapSpawn.Engine.ExecIndex = ExecIndex();
EnterStatScope(12 /**SpawnScript_0_MapSpawnMain*/);
ExitStatScope(/**SpawnScript_0_MapSpawnMain*/);
//Begin Transfer of Attributes!
//End Transfer of Attributes!
Context.MapUpdate.Engine.ExecIndex = ExecIndex();
EnterStatScope(13 /**SpawnScript_0_MapUpdateMain*/);
ExitStatScope(/**SpawnScript_0_MapUpdateMain*/);
bool bValid = Context.MapUpdate.DataInstance.Alive;
OutputDataFloat(0, 0, TmpWriteIndex, Context.MapUpdate.Particles.Age);
OutputDataInt(0, 0, TmpWriteIndex, Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse.CollisionID);
OutputDataInt(0, 1, TmpWriteIndex, Context.MapUpdate.Particles.Collision.CollisionQueryAndResponse001.CollisionID);
OutputDataFloat(0, 1, TmpWriteIndex, Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.x);
OutputDataFloat(0, 2, TmpWriteIndex, Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.y);
OutputDataFloat(0, 3, TmpWriteIndex, Context.MapUpdate.Particles.Collision.SafeCombinedCollisionNormal.z);
OutputDataFloat(0, 4, TmpWriteIndex, Context.MapUpdate.Particles.Diameter);
OutputDataFloat(0, 5, TmpWriteIndex, Context.MapUpdate.Particles.DistanceTraveled);
OutputDataBool(0, 2, TmpWriteIndex, Context.MapUpdate.Particles.HasCollided);
OutputDataFloat(0, 6, TmpWriteIndex, Context.MapUpdate.Particles.Lifetime);
OutputDataFloat(0, 7, TmpWriteIndex, Context.MapUpdate.Particles.Mass);
OutputDataFloat(0, 8, TmpWriteIndex, Context.MapUpdate.Particles.MeshOrientation.x);
OutputDataFloat(0, 9, TmpWriteIndex, Context.MapUpdate.Particles.MeshOrientation.y);
OutputDataFloat(0, 10, TmpWriteIndex, Context.MapUpdate.Particles.MeshOrientation.z);
OutputDataFloat(0, 11, TmpWriteIndex, Context.MapUpdate.Particles.MeshOrientation.w);
OutputDataFloat(0, 12, TmpWriteIndex, Context.MapUpdate.Particles.MomentOfInertia.x);
OutputDataFloat(0, 13, TmpWriteIndex, Context.MapUpdate.Particles.MomentOfInertia.y);
OutputDataFloat(0, 14, TmpWriteIndex, Context.MapUpdate.Particles.MomentOfInertia.z);
OutputDataFloat(0, 15, TmpWriteIndex, Context.MapUpdate.Particles.NormalizedAge);
OutputDataInt(0, 3, TmpWriteIndex, Context.MapUpdate.Particles.NumberOfCollisions);
OutputDataFloat(0, 16, TmpWriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 17, TmpWriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 18, TmpWriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 19, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.x);
OutputDataFloat(0, 20, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.y);
OutputDataFloat(0, 21, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.z);
OutputDataFloat(0, 22, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Position.x);
OutputDataFloat(0, 23, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Position.y);
OutputDataFloat(0, 24, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Position.z);
OutputDataFloat(0, 25, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.x);
OutputDataFloat(0, 26, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.y);
OutputDataFloat(0, 27, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.z);
OutputDataFloat(0, 28, TmpWriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.x);
OutputDataFloat(0, 29, TmpWriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.y);
OutputDataFloat(0, 30, TmpWriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.z);
OutputDataFloat(0, 31, TmpWriteIndex, Context.MapUpdate.Particles.Previous.MeshOrientation.w);
OutputDataFloat(0, 32, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Position.x);
OutputDataFloat(0, 33, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Position.y);
OutputDataFloat(0, 34, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Position.z);
OutputDataFloat(0, 35, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Scale.x);
OutputDataFloat(0, 36, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Scale.y);
OutputDataFloat(0, 37, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Scale.z);
OutputDataFloat(0, 38, TmpWriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 39, TmpWriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 40, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Velocity.x);
OutputDataFloat(0, 41, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Velocity.y);
OutputDataFloat(0, 42, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Velocity.z);
OutputDataFloat(0, 43, TmpWriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.x);
OutputDataFloat(0, 44, TmpWriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.y);
OutputDataFloat(0, 45, TmpWriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.z);
OutputDataFloat(0, 46, TmpWriteIndex, Context.MapUpdate.Particles.PrevMeshOrientation.w);
OutputDataFloat(0, 47, TmpWriteIndex, Context.MapUpdate.Particles.PrevPosition.x);
OutputDataFloat(0, 48, TmpWriteIndex, Context.MapUpdate.Particles.PrevPosition.y);
OutputDataFloat(0, 49, TmpWriteIndex, Context.MapUpdate.Particles.PrevPosition.z);
OutputDataFloat(0, 50, TmpWriteIndex, Context.MapUpdate.Particles.Radius);
OutputDataFloat(0, 51, TmpWriteIndex, Context.MapUpdate.Particles.RestCounter);
OutputDataFloat(0, 52, TmpWriteIndex, Context.MapUpdate.Particles.RotationalInertia);
OutputDataFloat(0, 53, TmpWriteIndex, Context.MapUpdate.Particles.RotationalVelocity.x);
OutputDataFloat(0, 54, TmpWriteIndex, Context.MapUpdate.Particles.RotationalVelocity.y);
OutputDataFloat(0, 55, TmpWriteIndex, Context.MapUpdate.Particles.RotationalVelocity.z);
OutputDataFloat(0, 56, TmpWriteIndex, Context.MapUpdate.Particles.Scale.x);
OutputDataFloat(0, 57, TmpWriteIndex, Context.MapUpdate.Particles.Scale.y);
OutputDataFloat(0, 58, TmpWriteIndex, Context.MapUpdate.Particles.Scale.z);
OutputDataFloat(0, 59, TmpWriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 60, TmpWriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataInt(0, 4, TmpWriteIndex, Context.MapUpdate.Particles.UniqueID);
OutputDataFloat(0, 61, TmpWriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 62, TmpWriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 63, TmpWriteIndex, Context.MapUpdate.Particles.Velocity.z);
OutputDataFloat(0, 64, TmpWriteIndex, Context.MapUpdate.Particles.Volume);
ExitStatScope(/**SpawnScript_0_Main*/);
bool Result = NiagaraAll(Context.Map.Particles.Age <= Context.Map.Engine.DeltaTime);
Context.Map.OUTPUT_VAR.ParticleState.FirstFrame = Result;
Context.Map.Transient.FirstFrame = Result;
bool Result1 = NiagaraAny(Context.Map.Emitter.ExecutionState != Constant3);
bool Result2 = NiagaraAny(Context.Map.System.ExecutionState != Constant4);
bool Result3 = Result1 || Result2;
bool Result4 = Context.Map.ParticleState.LetInfinitelyLivedParticlesDieWhenEmitterDeactivates && Result3;
bool Result5 = !Result4;
bool Result6 = Context.Map.ParticleState.LoopParticlesLifetime && Result5;
float Result7 = Context.Map.Particles.Age + Context.Map.ParticleState.DeltaTime;
float Constant5 = 1e-05;
float Result8 = max(Context.Map.ParticleState.Lifetime, Constant5);
float Result9 = ModuloPrecise(Result7, Result8);
Age_IfResult = Result9;
Age_IfResult = Result7;
float Constant6 = 0.0001;
float Result10 = Result8 - Constant6;
bool Result11 = NiagaraAll(Age_IfResult > Result10);
bool Result12 = Result11 && Result4;
bool Constant7 = false;
bool_IfResult = Constant7;
float Result13 = Age_IfResult / Result8;
Context.Map.Particles.Age = Age_IfResult;
Context.Map.Particles.NormalizedAge = Result13;
bool Constant8 = true;
float3 Constant11 = float3(0,0,-980);
float3 Result14 = Constant11 * Context.Map.Particles.Mass;
float3 Result15 = Context.Map.Transient.PhysicsForce + Result14;
Context.Map.Transient.PhysicsForce = Result15;
float3 Result16 = mul(float4(Context.Map.Particles.Position,1.0),Context.Map.Grid3D_ExternalObjectBuoyancyForce.WorldToUnit).xyz;
Output1.x = Result16.x;
Output1.y = Result16.y;
Output1.z = Result16.z;
X = Context.Map.Particles.SpriteSize.x;
Y = Context.Map.Particles.SpriteSize.y;
float Constant13 = 0.5;
float Result17 = X * Constant13;
float Result18 = Result17 / Context.Map.Grid3D_ExternalObjectBuoyancyForce.dx;
Output11.x = Context.Map.Particles.Position.x;
Output11.y = Context.Map.Particles.Position.y;
Output11.z = Context.Map.Particles.Position.z;
CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_(Output1, Context.Map.Grid3D_ExternalObjectBuoyancyForce.dx, Result18, Context.Map.Emitter.NumCellsX, Context.Map.Emitter.NumCellsY, Context.Map.Emitter.NumCellsZ, Context.Map.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld, Output11, Context.Map.Particles.Mass, Constant14, CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce, CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce);
float3 Result19 = Context.Map.Transient.PhysicsForce + CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_BuoyancyForce;
float3 Result20 = Context.Map.Transient.PhysicsRotationalForce + CustomHlsl21283B54A8380294D2DCC538F47270FCDC4633B6Emitter_FaceReaderEmitter_PressureReaderEmitter_BoundaryReader_Func_Output_RotationalForce;
Context.Map.Transient.PhysicsForce = Result19;
Context.Map.Transient.PhysicsRotationalForce = Result20;
Context.Map.Transient.RotationalVelocityEnabled = Constant15;
bool Result26 = NiagaraAll(In_SourceSpace == Constant52);
bool Result27 = NiagaraAll(In_DestinationSpace == Constant53);
int Constant54 = 1;
bool Result29 = NiagaraAll(In_SourceSpace == Constant54);
bool Result30 = NiagaraAll(In_DestinationSpace == Constant55);
bool Result31 = Result29 && Result30;
bool Result32 = Result28 || Result31;
int Constant56 = 2;
bool Result33 = NiagaraAll(In_SourceSpace == Constant56);
int Constant57 = 2;
bool Result34 = NiagaraAll(In_DestinationSpace == Constant57);
bool Result35 = Result33 && Result34;
bool Result36 = Result32 || Result35;
bool Result37 = Result26 && Result34;
bool Result38 = Result33 && Result27;
bool Result39 = Result37 || Result38;
bool Result40 = In_bLocalSpace && Result39;
bool Result41 = Result36 || Result40;
bool Result42 = !In_bLocalSpace;
bool Result43 = Result26 && Result30;
bool Result44 = Result29 && Result27;
bool Result46 = Result42 && Result45;
bool Result47 = Result41 || Result46;
bool Result48 = In_bLocalSpace && Result43;
bool Result49 = Result33 && Result30;
bool Result50 = Result48 || Result49;
bool Result51 = Result42 && Result38;
bool Result52 = Result50 || Result51;
Out_bUseOriginal = Result47;
Out_LocalToWorld = Result52;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant51, NiagaraScript_914_Func_Output_bUseOriginal, NiagaraScript_914_Func_Output_OutTransform, NiagaraScript_914_Func_Output_LocalToWorld, Context);
float3 Result53 = mul(float4(In_InPosition,1.0),NiagaraScript_914_Func_Output_OutTransform).xyz;
Vector_IfResult = Result53;
bool Constant61 = false;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant61, NiagaraScript_914_Func_Output_bUseOriginal1, NiagaraScript_914_Func_Output_OutTransform1, NiagaraScript_914_Func_Output_LocalToWorld1, Context);
float3 Result54 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform1).xyz;
Vector_IfResult1 = Result54;
bool Constant65 = false;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant65, NiagaraScript_914_Func_Output_bUseOriginal2, NiagaraScript_914_Func_Output_OutTransform2, NiagaraScript_914_Func_Output_LocalToWorld2, Context);
float3 Result55 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform2).xyz;
Vector_IfResult2 = Result55;
float Result56 = length(In_SpriteSize);
float Constant67 = 0.5;
float Result57 = Result56 * Constant67;
Out_Radius = Result57;
float3 Result64 = In_Velocity - In_AdvectionVelocity;
float Result65 = In_Drag * In_InverseMass;
float Constant79 = (0.0);
float NiagaraFloat_SelectResult = Constant79;
NiagaraFloat_SelectResult = Result65;
float Result66 = max(NiagaraFloat_SelectResult, Constant80);
float Result67 = Result66 * In_DeltaTime;
float Result68 = Result67 + Constant81;
float3 Result69 = Result64 / Result68;
float3 Result70 = Result69 + In_AdvectionVelocity;
Out_Output = Result70;
float Result72 = dot(In_V,In_V);
float Result73 = In_Threshold * In_Threshold;
bool Result74 = NiagaraAll(Result72 < Result73);
float Result75 = length(In_Fallback);
float Result76 = rsqrt(Result72);
float3 Result77 = In_V * Result76;
float Result78 = Reciprocal(Result76);
float3 Constant84 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult1 = Constant84;
float Constant85 = (0.0);
float Length_SelectResult1 = Constant85;
Length_SelectResult1 = Result75;
Direction_SelectResult1 = Result77;
Length_SelectResult1 = Result78;
Out_BelowThreshold = Result74;
float3 Result84 = In_StartTrace - In_EndTrace;
float Result85 = length(Result84);
bool Result86 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface < Result85);
float Constant89 = 0;
bool Result87 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface < Constant89);
bool Result88 = !Result87;
bool Result89 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_IsDistanceFieldValid && Result86 && Result88;
float3 Constant90 = float3(0,0,1);
float Constant91 = 1e-05;
NiagaraScript_888_Particle_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_FieldGradient, Constant90, Constant91, NiagaraScript_888_Particle_Func_Output_Direction2, NiagaraScript_888_Particle_Func_Output_Length2, NiagaraScript_888_Particle_Func_Output_BelowThreshold2, Context);
float3 Result90 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse_QueryOutput_DistanceToNearestSurface * NiagaraScript_888_Particle_Func_Output_Direction2;
float3 Result91 = In_Position - Result90;
Out_Collides = Result89;
Out_ImpactPosition = Result91;
Out_Insideamesh = Result87;
float3 Result95 = -(In_PlaneNormal);
float3 Result96 = In_PlanePivotPoint - In_InitialSphereLocation;
float Result97 = dot(Result95,Result96);
float Result98 = Result97 - In_CollisionRadius;
float Constant97 = 0;
bool Result99 = NiagaraAll(Result98 < Constant97);
bool Constant98 = true;
float3 Result100 = Result95 * Result97;
float3 Result101 = Result100 + In_InitialSphereLocation;
float Result102 = max(In_MaxCorrectiondistance, Result98);
float3 Result103 = Result102 * Result95;
float3 Result104 = Result103 + In_InitialSphereLocation;
float Constant99 = 0;
float Constant100 = 0;
float3 Result105 = In_InitialSphereLocation + In_SpherePositionDelta;
float3 Result106 = In_PlanePivotPoint - Result105;
float Result107 = dot(Result95,Result106);
float Result108 = Result107 - In_CollisionRadius;
float Constant101 = 0;
bool Result109 = NiagaraAll(Result108 <= Constant101);
float Result110 = abs(Result108);
float Result111 = Result98 - Result108;
float Result112 = abs(Result111);
float Constant102 = 1e-06;
float Result113 = max(Result112, Constant102);
float Result114 = Result110 / Result113;
float Constant103 = 0;
bool Result115 = NiagaraAll(Result114 == Constant103);
bool Result116 = Result99 || Result115;
float Constant104 = 1;
float_IfResult = Constant104;
float_IfResult = Result114;
float Result117 = 1 - float_IfResult;
float3 Result118 = Result117 * In_SpherePositionDelta;
float3 Result119 = In_InitialSphereLocation + Result118;
float3 Result120 = Result95 * In_CollisionRadius;
float3 Result121 = Result119 + Result120;
float3 Result122 = Result121 - Result119;
float Result123 = In_PhysicsDeltaTime * Result117;
float Result124 = In_PhysicsDeltaTime * float_IfResult;
Collides_IfResult = Constant98;
IntersectionLocation_IfResult = Result101;
PreASC45IntersectionSphereCenterLocation_IfResult = Result104;
InitialPositionRelativeCollisionLocation_IfResult = Result100;
TimeElapsedToCollision_IfResult = Constant99;
PercentageofTimeUsedToPerformCollision_IfResult = Constant100;
InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision_IfResult = Result98;
UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane_IfResult = Result108;
Collides_IfResult = Result109;
IntersectionLocation_IfResult = Result121;
PreASC45IntersectionSphereCenterLocation_IfResult = Result119;
InitialPositionRelativeCollisionLocation_IfResult = Result122;
TimeElapsedToCollision_IfResult = Result123;
RemainingTimePostCollision_IfResult = Result124;
PercentageofTimeUsedToPerformCollision_IfResult = Result117;
bool Constant120 = false;
int Constant121 = 0;
bool Result140 = NiagaraAll(In_RandomnessMode == Constant121);
bool Result141 = Constant120 && Result140;
int Constant122 = 1;
bool Result142 = NiagaraAll(In_RandomnessMode == Constant122);
bool Result143 = Result141 || Result142;
Seed_IfResult = Context.Map.Emitter.RandomSeed;
int Constant123 = 0;
int Constant124 = 0;
Seed2_IfResult = Constant123;
Seed3_IfResult = Constant124;
Seed1_IfResult = Context.Map.Particles.UniqueID;
Seed2_IfResult = Context.Map.Engine.System.TickCount;
int Constant125 = -1;
int Constant126 = -1;
int Constant127 = -1;
Seed1_IfResult1 = Constant125;
Seed2_IfResult1 = Constant126;
Seed3_IfResult1 = Constant127;
NiagaraRandInfo Output14;
Output14.Seed1 = Seed1_IfResult1;
Output14.Seed2 = Seed2_IfResult1;
Output14.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output14;
Out_UseDeterministicRandoms = Result143;
int Constant115 = (0);
bool Constant116 = false;
int Constant117 = 0;
int Constant118 = (0);
bool Constant119 = false;
NiagaraScript_907_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant115, In_OverrideSeed, Constant117, Constant118, Constant119, In_RandomnessMode, NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, NiagaraScript_907_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float2 Result144 = In_Max - In_Min;
float2 Result145 = rand_float(Result144, Seed1, Seed2, Seed3);
float2 Result146 = rand_float(Result144);
Random_IfResult = Result145;
Random_IfResult = Result146;
float2 Result147 = In_Min + Random_IfResult;
Out_Result = Result147;
float3 Constant134 = float3(1,0,0);
float Constant135 = 1e-05;
NiagaraScript_888_Particle_Func_(In_From, Constant134, Constant135, NiagaraScript_888_Particle_Func_Output_Direction4, NiagaraScript_888_Particle_Func_Output_Length4, NiagaraScript_888_Particle_Func_Output_BelowThreshold4, Context);
float3 Constant136 = float3(1,0,0);
float Constant137 = 1e-05;
NiagaraScript_888_Particle_Func_(In_To, Constant136, Constant137, NiagaraScript_888_Particle_Func_Output_Direction5, NiagaraScript_888_Particle_Func_Output_Length5, NiagaraScript_888_Particle_Func_Output_BelowThreshold5, Context);
float Output15;
Output15 = In_Quaternion.w;
float Result159 = dot(Output0,In_VECTOR_VAR);
float Constant138 = 2;
float Result160 = Result159 * Constant138;
float3 Result161 = Output0 * Result160;
float Result162 = Output15 * Output15;
float Result163 = dot(Output0,Output0);
float Result164 = Result162 - Result163;
float3 Result165 = Result164 * In_VECTOR_VAR;
float3 Result166 = Result161 + Result165;
float3 Result167 = cross(Output0,In_VECTOR_VAR);
float Constant139 = 2;
float Result168 = Output15 * Constant139;
float3 Result169 = Result167 * Result168;
float3 Result170 = Result166 + Result169;
Out_Vector = Result170;
float Constant109 = 0;
float Constant110 = 1;
float Result138 = clamp(In_Spread,Constant109,Constant110);
float Constant111 = -1;
float Result139 = Result138 * Constant111;
float2 Output12;
Output12.x = Result139;
Output12.y = Result139;
Output13.x = Result138;
Output13.y = Result138;
int Constant112 = -1;
int Constant113 = 0;
NiagaraScript_906_Func_(Output12, Output13, Constant112, Constant113, Constant114, NiagaraScript_906_Func_Output_Result, Context);
float3 Constant128 = float3(1,0,0);
float3 Result148 = X1 * Constant128;
float3 Constant129 = float3(0,1,0);
float3 Result149 = Y1 * Constant129;
float3 Result150 = Result148 + Result149;
float Result151 = abs(X1);
float Result152 = abs(Y1);
float Result153 = max(Result151, Result152);
float Result154 = 1 - Result153;
float3 Constant130 = float3(0,0,1);
float3 Result155 = Result154 * Constant130;
float3 Result156 = Result150 + Result155;
float3 Result157 = normalize(Result156);
float3 Result158 = Result157 * In_Scale;
float3 Constant131 = float3(0,0,1);
float3 Constant132 = float3(0,0,1);
float Constant133 = 1e-05;
NiagaraScript_888_Particle_Func_(In_ConeAxis, Constant132, Constant133, NiagaraScript_888_Particle_Func_Output_Direction3, NiagaraScript_888_Particle_Func_Output_Length3, NiagaraScript_888_Particle_Func_Output_BelowThreshold3, Context);
NiagaraScript_908_Func_(Constant131, NiagaraScript_888_Particle_Func_Output_Direction3, NiagaraScript_908_Func_Output_NewOutput, Context);
NiagaraScript_892_Func_(Result158, NiagaraScript_908_Func_Output_NewOutput, NiagaraScript_892_Func_Output_Vector, Context);
float Result171 = dot(In_InVector,In_Normal);
float Result172 = Result171 + Result171;
float3 Result173 = Result172 * In_Normal;
float3 Result174 = In_InVector - Result173;
Out_Reflected = Result174;
float Constant140 = 0.01;
float3 Result175 = In_INPUT_VAR * Constant140;
float Constant141 = 100;
float3 Result176 = In_INPUT_VAR * Constant141;
Out_CentimeterstoMeters = Result175;
Out_MeterstoCentimeters = Result176;
float Result181 = dot(In_VECTOR_VAR,In_VECTOR_VAR);
float Result182 = In_Threshold * In_Threshold;
bool Result183 = NiagaraAll(Result181 < Result182);
float Result184 = length(In_FallbackVector);
float Result185 = rsqrt(Result181);
float3 Result186 = In_VECTOR_VAR * Result185;
float Result187 = Reciprocal(Result185);
float3 Constant146 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult2 = Constant146;
float Constant147 = (0.0);
float Length_SelectResult2 = Constant147;
Length_SelectResult2 = Result184;
Direction_SelectResult2 = Result186;
Length_SelectResult2 = Result187;
Out_BelowThreshold = Result183;
float Result180 = dot(In_VECTOR_VAR,In_Normal);
float3 Constant144 = float3(0,0,0);
float Constant145 = 1e-05;
NiagaraScript_901_Particle_Func_(In_Normal, Constant144, Constant145, NiagaraScript_901_Particle_Func_Output_Direction, NiagaraScript_901_Particle_Func_Output_Length, NiagaraScript_901_Particle_Func_Output_BelowThreshold, Context);
float3 Constant148 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult3 = Constant148;
float3 Result188 = Result180 * Vector3f_SelectResult3;
float3 Result189 = In_VECTOR_VAR - Result188;
Out_Ouput = Result189;
float Constant151 = 0.01;
float3 Result190 = In_INPUT_VAR * Constant151;
float Constant152 = 100;
float3 Result191 = In_INPUT_VAR * Constant152;
Out_CentimeterstoMeters = Result190;
Out_MeterstoCentimeters = Result191;
float Constant158 = 0.01;
float3 Result200 = In_INPUT_VAR * Constant158;
float Constant159 = 100;
float3 Result201 = In_INPUT_VAR * Constant159;
Out_CentimeterstoMeters = Result200;
Out_MeterstoCentimeters = Result201;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleInitialDataInstanceAlive = Context.Map.DataInstance.Alive;
Context.Map.Transient.Collision_ParticlePositionReplacement = Context.Map.Transient.Collision_ParticlePositionReplacement;
Context.Map.Transient.Collision_PredictedParticlePositionForSimStages = Context.Map.Transient.Collision_PredictedParticlePositionForSimStages;
Context.Map.Collision.CollisionQueryAndResponse.DeltaTime = Context.Map.Collision.CollisionQueryAndResponse.DeltaTime;
float Result60 = Reciprocal(Context.Map.Transient.Collision_ParticleMassReplacement);
Context.Map.Transient.Collision_ParticleVelocityReplacement = Context.Map.Transient.Collision_ParticleVelocityReplacement;
Context.Map.Transient.Collision_ParticlePhysicsForceReplacement = Context.Map.Transient.Collision_ParticlePhysicsForceReplacement;
Context.Map.Transient.Collision_ParticleMassReplacement = Context.Map.Transient.Collision_ParticleMassReplacement;
Context.Map.Transient.Collision_ParticleInverseMassReplacement = Result60;
float3 Result61 = Context.Map.Transient.Collision_ParticlePhysicsForceReplacement * Context.Map.Transient.Collision_ParticleInverseMassReplacement;
float3 Result62 = Result61 * Context.Map.Collision.CollisionQueryAndResponse.DeltaTime;
float3 Result63 = Result62 + Context.Map.Transient.Collision_ParticleVelocityReplacement;
NiagaraScript_891_Particle_Func_(Result63, Context.Map.Transient.AdvectionVelocity, Context.Map.Transient.Collision_ParticleInverseMassReplacement, Context.Map.Transient.PhysicsDrag, Context.Map.Collision.CollisionQueryAndResponse.DeltaTime, Context.Map.Transient.DragIgnoreMass, NiagaraScript_891_Particle_Func_Output_Output, Context);
float3 Result71 = NiagaraScript_891_Particle_Func_Output_Output * Context.Map.Collision.CollisionQueryAndResponse.DeltaTime;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin = Context.Map.Transient.Collision_ParticlePositionReplacement;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleInitialForceDividedByMass = Result61;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution = Result62;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate = Result71;
float3 Constant82 = float3(0,0,-1);
float Constant83 = 1e-05;
NiagaraScript_888_Particle_Func_(Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution, Constant82, Constant83, NiagaraScript_888_Particle_Func_Output_Direction, NiagaraScript_888_Particle_Func_Output_Length, NiagaraScript_888_Particle_Func_Output_BelowThreshold, Context);
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceVector = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceDirection = NiagaraScript_888_Particle_Func_Output_Direction;
float3 Result79 = NiagaraScript_888_Particle_Func_Output_Direction * Context.Map.Collision.CollisionQueryAndResponse.ParticleRadius;
float3 Result80 = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin - Result79;
float3 Result81 = Result79 + Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleForceContribution;
float3 Constant86 = float3(0,0,-1);
float Constant87 = 1e-05;
NiagaraScript_888_Particle_Func_(Result81, Constant86, Constant87, NiagaraScript_888_Particle_Func_Output_Direction1, NiagaraScript_888_Particle_Func_Output_Length1, NiagaraScript_888_Particle_Func_Output_BelowThreshold1, Context);
float3 Result82 = NiagaraScript_888_Particle_Func_Output_Direction1 * NiagaraScript_888_Particle_Func_Output_Length1;
float3 Result83 = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin + Result82;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart = Result80;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd = Result83;
Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_(Context.Map.Transient.Collision_ParticlePositionReplacement, Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart, Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid, Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface, Context);
bool Result92 = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh && Context.Map.Collision.CollisionQueryAndResponse.KillParticlesLodgedWithinMeshes && Context.Map.Collision.CollisionQueryAndResponse.CollisionEnabled;
bool Result93 = !Result92;
bool Result94 = Context.Map.DataInstance.Alive && Result93;
bool Constant93 = false;
bool Constant94 = true;
Context.Map.Particles.Collision.CollisionQueryAndResponse.CollisionID = Constant88;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedFriction = Constant92;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedRestitution = Context.Map.Collision.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient;
Context.Map.DataInstance.Alive = Result94;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse.ModuleDepthBasedCollisionParticleOccluded = Constant93;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse.ParticleOnScreen = Constant94;
float3 Constant95 = float3(0,0,1);
float3 Constant96 = float3(0,0,-1e+16);
PlaneNormal_IfResult = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult = Constant95;
PlanePivotPoint_IfResult = Constant96;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal = PlaneNormal_IfResult;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePlanePivotPoint = PlanePivotPoint_IfResult;
NiagaraScript_903_Func_(Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal, Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePlanePivotPoint, Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceOrigin, Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate, Context.Map.Collision.CollisionQueryAndResponse.ParticleRadius, Context.Map.Collision.CollisionQueryAndResponse.DeltaTime, Context.Map.Collision.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance, NiagaraScript_903_Func_Output_Collides, NiagaraScript_903_Func_Output_IntersectionLocation, NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation, NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation, NiagaraScript_903_Func_Output_TimeElapsedToCollision, NiagaraScript_903_Func_Output_RemainingTimePostCollision, NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision, NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, Context);
Context.Map.Transient.CollisionWorldPosition = NiagaraScript_903_Func_Output_IntersectionLocation;
Context.Map.Transient.CollisionParticleWorldPosition = NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation;
Context.Map.Transient.CollisionParticleRelativeCollisionLocation = NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTickDeltaForThisCollisionUpdate = NiagaraScript_903_Func_Output_TimeElapsedToCollision;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePhysicsDeltaTime = NiagaraScript_903_Func_Output_RemainingTimePostCollision;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePercentageOfTickDedicatedToUpdatingPosition = NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance = NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
Context.Map.Transient.CollisionDistanceToCollision = NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
float Constant105 = 0;
bool Result125 = NiagaraAll(Context.Map.Transient.CollisionDistanceToCollision <= Constant105);
bool Result126 = Context.Map.Collision.CollisionQueryAndResponse.CollisionEnabled && Result125;
bool Result127 = Result126 || Context.Map.Particles.HasCollided;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse.PhysicsCollidesThisFrame = Result126;
Context.Map.Particles.HasCollided = Result127;
float3 Result128 = -(Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal);
float Result129 = dot(Result128,Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate);
float Result130 = Context.Map.Collision.CollisionQueryAndResponse.DeltaTime * Context.Map.Collision.CollisionQueryAndResponse.DeltaTime;
float3 Result131 = Result130 * Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleInitialForceDividedByMass;
float Result132 = dot(Result128,Result131);
float Result133 = Result129 - Result132;
float Constant106 = 0.1;
bool Result134 = NiagaraAll(Result133 < Constant106);
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleRemoveRestitution = Result134;
float3 Result135 = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate / Context.Map.Collision.CollisionQueryAndResponse.DeltaTime;
float_IfResult1 = Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePhysicsDeltaTime;
float_IfResult1 = Context.Map.Collision.CollisionQueryAndResponse.DeltaTime;
float Constant107 = 0;
float_IfResult2 = Constant107;
float_IfResult2 = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedRestitution;
Context.Map.Transient.CollisionValid = Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse.PhysicsCollidesThisFrame;
Context.Map.Transient.CollisionSize = Context.Map.Collision.CollisionQueryAndResponse.ParticleRadius;
Context.Map.Transient.CollisionNormal = Context.Map.Local.Collision.CollisionQueryAndResponse.ModulePlaneNormal;
Context.Map.Transient.CollisionVelocity = Result135;
Context.Map.Transient.CollisionFriction = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReturnedFriction;
Context.Map.Transient.PhysicsDeltaTime = float_IfResult1;
Context.Map.Transient.CollisionRestitution = float_IfResult2;
bool Result136 = !Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleRemoveRestitution;
bool Result137 = Result136 && Context.Map.Collision.CollisionQueryAndResponse.RandomizeCollisionNormal;
float Constant108 = 1;
NiagaraScript_905_Func_(Context.Map.Transient.CollisionNormal, Constant108, Context.Map.Collision.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage, NiagaraScript_905_Func_Output_Ouput, Context);
Vector_IfResult3 = NiagaraScript_905_Func_Output_Ouput;
Vector_IfResult3 = Context.Map.Transient.CollisionNormal;
NiagaraScript_904_Func_(Context.Map.Transient.CollisionVelocity, Vector_IfResult3, NiagaraScript_904_Func_Output_Reflected, Context);
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity = NiagaraScript_904_Func_Output_Reflected;
NiagaraScript_909_Func_(Context.Map.Transient.CollisionVelocity, NiagaraScript_909_Func_Output_CentimeterstoMeters, NiagaraScript_909_Func_Output_MeterstoCentimeters, Context);
float3 Result177 = Context.Map.Transient.Collision_ParticleMassReplacement * NiagaraScript_909_Func_Output_CentimeterstoMeters;
float Constant142 = -1;
float3 Result178 = Result177 * Constant142;
float Result179 = dot(Result178,Context.Map.Transient.CollisionNormal);
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons = Result179;
bool Constant143 = false;
NiagaraScript_910_Particle_Func_(Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity, Context.Map.Transient.CollisionNormal, Constant143, NiagaraScript_910_Particle_Func_Output_Ouput, Context);
float3 Constant149 = float3(0,0,0);
float Constant150 = 1e-05;
NiagaraScript_888_Particle_Func_(NiagaraScript_910_Particle_Func_Output_Ouput, Constant149, Constant150, NiagaraScript_888_Particle_Func_Output_Direction6, NiagaraScript_888_Particle_Func_Output_Length6, NiagaraScript_888_Particle_Func_Output_BelowThreshold6, Context);
float3 Result192 = NiagaraScript_911_Func_Output_CentimeterstoMeters * Context.Map.Transient.Collision_ParticleMassReplacement;
float Constant153 = 0;
float_IfResult3 = Constant153;
bool Result193 = NiagaraAll(float_IfResult3 > Context.Map.Collision.CollisionQueryAndResponse.StaticFrictionEngagementSpeed);
float_IfResult4 = Context.Map.Collision.CollisionQueryAndResponse.DynamicFrictionCoefficient;
float_IfResult4 = Context.Map.Collision.CollisionQueryAndResponse.StaticFrictionCoefficient;
float_IfResult5 = Context.Map.Collision.CollisionQueryAndResponse.BounceCollisionFriction;
float3 Result194 = NiagaraScript_888_Particle_Func_Output_Direction6 * float_IfResult5 * Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleNormalForceInNewtons;
float3 Result195 = Result192 - Result194;
float3 Constant154 = float3(0,0,0);
float Constant155 = 1e-05;
NiagaraScript_888_Particle_Func_(Result195, Constant154, Constant155, NiagaraScript_888_Particle_Func_Output_Direction7, NiagaraScript_888_Particle_Func_Output_Length7, NiagaraScript_888_Particle_Func_Output_BelowThreshold7, Context);
float Result196 = dot(NiagaraScript_888_Particle_Func_Output_Direction6,NiagaraScript_888_Particle_Func_Output_Direction7);
bool Result197 = NiagaraAll(Result196 <= Constant156);
Vector_IfResult4 = Result192;
Vector_IfResult4 = Result194;
float Constant157 = -1;
float3 Result198 = Vector_IfResult4 * Constant157;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons = Result198;
float3 Result199 = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons * Context.Map.Transient.Collision_ParticleInverseMassReplacement;
NiagaraScript_912_Func_(Result199, NiagaraScript_912_Func_Output_CentimeterstoMeters, NiagaraScript_912_Func_Output_MeterstoCentimeters, Context);
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector = NiagaraScript_912_Func_Output_MeterstoCentimeters;
float3 Result202 = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity + Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector;
float Result203 = dot(Context.Map.Transient.CollisionNormal,Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocity);
float3 Result204 = Context.Map.Transient.CollisionNormal * Result203;
float Result205 = 1 - Context.Map.Transient.CollisionRestitution;
float3 Result206 = Result204 * Result205;
float3 Result207 = Result202 - Result206;
Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocityWithFrictionApplied = Result207;
Particleposition_IfResult = Context.Map.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult = Context.Map.Transient.Collision_ParticlePositionReplacement;
Context.Map.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult;
float3 Constant160 = float3(0,0,1);
float Constant161 = 1e-05;
NiagaraScript_888_Particle_Func_(Context.Map.Transient.CollisionVelocity, Constant160, Constant161, NiagaraScript_888_Particle_Func_Output_Direction8, NiagaraScript_888_Particle_Func_Output_Length8, NiagaraScript_888_Particle_Func_Output_BelowThreshold8, Context);
float Result208 = dot(NiagaraScript_888_Particle_Func_Output_Direction8,Context.Map.Transient.CollisionNormal);
float Constant162 = 0;
bool Result209 = NiagaraAll(Result208 < Constant162);
bool Result210 = Result209 && Context.Map.Transient.CollisionValid;
float3 Constant163 = float3(0,0,0);
physicsforce_IfResult = Constant163;
Velocity_IfResult = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleReflectedVelocityWithFrictionApplied;
physicsforce_IfResult = Context.Map.Transient.PhysicsForce;
Velocity_IfResult = Context.Map.Transient.Collision_ParticleVelocityReplacement;
Context.Map.Transient.Collision_ParticleVelocityReplacement = Velocity_IfResult;
Context.Map.Transient.Collision_ParticlePhysicsForceReplacement = physicsforce_IfResult;
Out_ModuleTraceWorldStart = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldStart;
Out_ModuleTraceWorldEnd = Context.Map.Local.Collision.CollisionQueryAndResponse.ModuleTraceWorldEnd;
Out_CollisionPosition = Context.Map.Transient.CollisionWorldPosition;
Out_CollisionNormal = Context.Map.Transient.CollisionNormal;
Out_Collided = Context.Map.Transient.CollisionValid;
float3 Result221 = In_StartTrace - In_EndTrace;
float Result222 = length(Result221);
bool Result223 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface < Result222);
float Constant172 = 0;
bool Result224 = NiagaraAll(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface < Constant172);
bool Result225 = !Result224;
bool Result226 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_IsDistanceFieldValid && Result223 && Result225;
float3 Constant173 = float3(0,0,1);
float Constant174 = 1e-05;
NiagaraScript_888_Particle_Func_(QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_FieldGradient, Constant173, Constant174, NiagaraScript_888_Particle_Func_Output_Direction11, NiagaraScript_888_Particle_Func_Output_Length11, NiagaraScript_888_Particle_Func_Output_BelowThreshold11, Context);
float3 Result227 = QueryMeshDistanceFieldGPU_Collision_CollisionQueryAndResponse001_QueryOutput_DistanceToNearestSurface * NiagaraScript_888_Particle_Func_Output_Direction11;
float3 Result228 = In_Position - Result227;
Out_Collides = Result226;
Out_ImpactPosition = Result228;
Out_Insideamesh = Result224;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleInitialDataInstanceAlive = Context.Map.DataInstance.Alive;
Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime = Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime;
float Result211 = Reciprocal(Context.Map.Transient.Collision_ParticleMassReplacement);
Context.Map.Transient.Collision_ParticleInverseMassReplacement = Result211;
float3 Result212 = Context.Map.Transient.Collision_ParticlePhysicsForceReplacement * Context.Map.Transient.Collision_ParticleInverseMassReplacement;
float3 Result213 = Result212 * Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime;
float3 Result214 = Result213 + Context.Map.Transient.Collision_ParticleVelocityReplacement;
NiagaraScript_891_Particle_Func_(Result214, Context.Map.Transient.AdvectionVelocity, Context.Map.Transient.Collision_ParticleInverseMassReplacement, Context.Map.Transient.PhysicsDrag, Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime, Context.Map.Transient.DragIgnoreMass, NiagaraScript_891_Particle_Func_Output_Output1, Context);
float3 Result215 = NiagaraScript_891_Particle_Func_Output_Output1 * Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin = Context.Map.Transient.Collision_ParticlePositionReplacement;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass = Result212;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleForceContribution = Result213;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate = Result215;
float3 Constant167 = float3(0,0,-1);
float Constant168 = 1e-05;
NiagaraScript_888_Particle_Func_(Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Constant167, Constant168, NiagaraScript_888_Particle_Func_Output_Direction9, NiagaraScript_888_Particle_Func_Output_Length9, NiagaraScript_888_Particle_Func_Output_BelowThreshold9, Context);
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceVector = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceDirection = NiagaraScript_888_Particle_Func_Output_Direction9;
float3 Result216 = NiagaraScript_888_Particle_Func_Output_Direction9 * Context.Map.Collision.CollisionQueryAndResponse001.ParticleRadius;
float3 Result217 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin - Result216;
float3 Result218 = Result216 + Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
float3 Constant169 = float3(0,0,-1);
float Constant170 = 1e-05;
NiagaraScript_888_Particle_Func_(Result218, Constant169, Constant170, NiagaraScript_888_Particle_Func_Output_Direction10, NiagaraScript_888_Particle_Func_Output_Length10, NiagaraScript_888_Particle_Func_Output_BelowThreshold10, Context);
float3 Result219 = NiagaraScript_888_Particle_Func_Output_Direction10 * NiagaraScript_888_Particle_Func_Output_Length10;
float3 Result220 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin + Result219;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart = Result217;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd = Result220;
int Constant171 = 0;
Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_(Context.Map.Transient.Collision_ParticlePositionReplacement, Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart, Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceFieldIsValid, Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_DistanceToSurface, Context);
float Constant175 = 0;
bool Result229 = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Insideamesh && Context.Map.Collision.CollisionQueryAndResponse001.KillParticlesLodgedWithinMeshes && Context.Map.Collision.CollisionQueryAndResponse001.CollisionEnabled;
bool Result230 = !Result229;
bool Result231 = Context.Map.DataInstance.Alive && Result230;
bool Constant176 = false;
bool Constant177 = true;
Context.Map.Particles.Collision.CollisionQueryAndResponse001.CollisionID = Constant171;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionValidBool = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_Collides;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactPosition;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal = Collision_CollisionQueryAndResponse001_NiagaraDistanceFieldCollisions001_Emitter_Func_Output_ImpactNormal;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedFriction = Constant175;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedRestitution = Context.Map.Collision.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient;
Context.Map.DataInstance.Alive = Result231;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.ModuleDepthBasedCollisionParticleOccluded = Constant176;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.ParticleOnScreen = Constant177;
float3 Constant178 = float3(0,0,1);
float3 Constant179 = float3(0,0,-1e+16);
PlaneNormal_IfResult1 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult1 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult1 = Constant178;
PlanePivotPoint_IfResult1 = Constant179;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal = PlaneNormal_IfResult1;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePlanePivotPoint = PlanePivotPoint_IfResult1;
NiagaraScript_903_Func_(Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal, Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePlanePivotPoint, Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceOrigin, Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Context.Map.Collision.CollisionQueryAndResponse001.ParticleRadius, Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime, Context.Map.Collision.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance, NiagaraScript_903_Func_Output_Collides1, NiagaraScript_903_Func_Output_IntersectionLocation1, NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation1, NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation1, NiagaraScript_903_Func_Output_TimeElapsedToCollision1, NiagaraScript_903_Func_Output_RemainingTimePostCollision1, NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision1, NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1, NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1, Context);
Context.Map.Transient.CollisionWorldPosition = NiagaraScript_903_Func_Output_IntersectionLocation1;
Context.Map.Transient.CollisionParticleWorldPosition = NiagaraScript_903_Func_Output_PreASC45IntersectionSphereCenterLocation1;
Context.Map.Transient.CollisionParticleRelativeCollisionLocation = NiagaraScript_903_Func_Output_InitialPositionRelativeCollisionLocation1;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTickDeltaForThisCollisionUpdate = NiagaraScript_903_Func_Output_TimeElapsedToCollision1;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePhysicsDeltaTime = NiagaraScript_903_Func_Output_RemainingTimePostCollision1;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePercentageOfTickDedicatedToUpdatingPosition = NiagaraScript_903_Func_Output_PercentageofTimeUsedToPerformCollision1;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance = NiagaraScript_903_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
Context.Map.Transient.CollisionDistanceToCollision = NiagaraScript_903_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
float Constant180 = 0;
bool Result232 = NiagaraAll(Context.Map.Transient.CollisionDistanceToCollision <= Constant180);
bool Result233 = Context.Map.Collision.CollisionQueryAndResponse001.CollisionEnabled && Result232;
bool Result234 = Result233 || Context.Map.Particles.HasCollided;
Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.PhysicsCollidesThisFrame = Result233;
Context.Map.Particles.HasCollided = Result234;
float3 Result235 = -(Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal);
float Result236 = dot(Result235,Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate);
float Result237 = Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime * Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime;
float3 Result238 = Result237 * Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass;
float Result239 = dot(Result235,Result238);
float Result240 = Result236 - Result239;
float Constant181 = 0.1;
bool Result241 = NiagaraAll(Result240 < Constant181);
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleRemoveRestitution = Result241;
float3 Result242 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate / Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime;
float_IfResult6 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePhysicsDeltaTime;
float_IfResult6 = Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime;
float Constant182 = 0;
float_IfResult7 = Constant182;
float_IfResult7 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedRestitution;
Context.Map.Transient.CollisionValid = Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.PhysicsCollidesThisFrame;
Context.Map.Transient.CollisionSize = Context.Map.Collision.CollisionQueryAndResponse001.ParticleRadius;
Context.Map.Transient.CollisionNormal = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModulePlaneNormal;
Context.Map.Transient.CollisionVelocity = Result242;
Context.Map.Transient.CollisionFriction = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReturnedFriction;
Context.Map.Transient.PhysicsDeltaTime = float_IfResult6;
Context.Map.Transient.CollisionRestitution = float_IfResult7;
bool Result243 = !Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleRemoveRestitution;
bool Result244 = Result243 && Context.Map.Collision.CollisionQueryAndResponse001.RandomizeCollisionNormal;
float Constant183 = 1;
NiagaraScript_905_Func_(Context.Map.Transient.CollisionNormal, Constant183, Context.Map.Collision.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage, NiagaraScript_905_Func_Output_Ouput1, Context);
Vector_IfResult5 = NiagaraScript_905_Func_Output_Ouput1;
Vector_IfResult5 = Context.Map.Transient.CollisionNormal;
NiagaraScript_904_Func_(Context.Map.Transient.CollisionVelocity, Vector_IfResult5, NiagaraScript_904_Func_Output_Reflected1, Context);
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity = NiagaraScript_904_Func_Output_Reflected1;
NiagaraScript_909_Func_(Context.Map.Transient.CollisionVelocity, NiagaraScript_909_Func_Output_CentimeterstoMeters1, NiagaraScript_909_Func_Output_MeterstoCentimeters1, Context);
float3 Result245 = Context.Map.Transient.Collision_ParticleMassReplacement * NiagaraScript_909_Func_Output_CentimeterstoMeters1;
float Constant184 = -1;
float3 Result246 = Result245 * Constant184;
float Result247 = dot(Result246,Context.Map.Transient.CollisionNormal);
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons = Result247;
bool Constant185 = false;
NiagaraScript_910_Particle_Func_(Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity, Context.Map.Transient.CollisionNormal, Constant185, NiagaraScript_910_Particle_Func_Output_Ouput1, Context);
float3 Constant186 = float3(0,0,0);
float Constant187 = 1e-05;
NiagaraScript_888_Particle_Func_(NiagaraScript_910_Particle_Func_Output_Ouput1, Constant186, Constant187, NiagaraScript_888_Particle_Func_Output_Direction12, NiagaraScript_888_Particle_Func_Output_Length12, NiagaraScript_888_Particle_Func_Output_BelowThreshold12, Context);
float3 Result248 = NiagaraScript_911_Func_Output_CentimeterstoMeters1 * Context.Map.Transient.Collision_ParticleMassReplacement;
float Constant188 = 0;
float_IfResult8 = Constant188;
bool Result249 = NiagaraAll(float_IfResult8 > Context.Map.Collision.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed);
float_IfResult9 = Context.Map.Collision.CollisionQueryAndResponse001.DynamicFrictionCoefficient;
float_IfResult9 = Context.Map.Collision.CollisionQueryAndResponse001.StaticFrictionCoefficient;
float_IfResult10 = Context.Map.Collision.CollisionQueryAndResponse001.BounceCollisionFriction;
float3 Result250 = NiagaraScript_888_Particle_Func_Output_Direction12 * float_IfResult10 * Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleNormalForceInNewtons;
float3 Result251 = Result248 - Result250;
float3 Constant189 = float3(0,0,0);
float Constant190 = 1e-05;
NiagaraScript_888_Particle_Func_(Result251, Constant189, Constant190, NiagaraScript_888_Particle_Func_Output_Direction13, NiagaraScript_888_Particle_Func_Output_Length13, NiagaraScript_888_Particle_Func_Output_BelowThreshold13, Context);
float Result252 = dot(NiagaraScript_888_Particle_Func_Output_Direction12,NiagaraScript_888_Particle_Func_Output_Direction13);
float Constant191 = 0;
bool Result253 = NiagaraAll(Result252 <= Constant191);
Vector_IfResult6 = Result248;
Vector_IfResult6 = Result250;
float Constant192 = -1;
float3 Result254 = Vector_IfResult6 * Constant192;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons = Result254;
float3 Result255 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons * Context.Map.Transient.Collision_ParticleInverseMassReplacement;
NiagaraScript_912_Func_(Result255, NiagaraScript_912_Func_Output_CentimeterstoMeters1, NiagaraScript_912_Func_Output_MeterstoCentimeters1, Context);
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector = NiagaraScript_912_Func_Output_MeterstoCentimeters1;
float3 Result256 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity + Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector;
float Result257 = dot(Context.Map.Transient.CollisionNormal,Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocity);
float3 Result258 = Context.Map.Transient.CollisionNormal * Result257;
float Result259 = 1 - Context.Map.Transient.CollisionRestitution;
float3 Result260 = Result258 * Result259;
float3 Result261 = Result256 - Result260;
Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied = Result261;
Particleposition_IfResult1 = Context.Map.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult1 = Context.Map.Transient.Collision_ParticlePositionReplacement;
Context.Map.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult1;
float3 Constant193 = float3(0,0,1);
NiagaraScript_888_Particle_Func_(Context.Map.Transient.CollisionVelocity, Constant193, Constant194, NiagaraScript_888_Particle_Func_Output_Direction14, NiagaraScript_888_Particle_Func_Output_Length14, NiagaraScript_888_Particle_Func_Output_BelowThreshold14, Context);
float Result262 = dot(NiagaraScript_888_Particle_Func_Output_Direction14,Context.Map.Transient.CollisionNormal);
float Constant195 = 0;
bool Result263 = NiagaraAll(Result262 < Constant195);
bool Result264 = Result263 && Context.Map.Transient.CollisionValid;
float3 Constant196 = float3(0,0,0);
physicsforce_IfResult1 = Constant196;
Velocity_IfResult1 = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied;
physicsforce_IfResult1 = Context.Map.Transient.PhysicsForce;
Velocity_IfResult1 = Context.Map.Transient.Collision_ParticleVelocityReplacement;
Context.Map.Transient.Collision_ParticleVelocityReplacement = Velocity_IfResult1;
Context.Map.Transient.Collision_ParticlePhysicsForceReplacement = physicsforce_IfResult1;
Out_ModuleTraceWorldStart = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldStart;
Out_ModuleTraceWorldEnd = Context.Map.Local.Collision.CollisionQueryAndResponse001.ModuleTraceWorldEnd;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant228, NiagaraScript_914_Func_Output_bUseOriginal3, NiagaraScript_914_Func_Output_OutTransform3, NiagaraScript_914_Func_Output_LocalToWorld3, Context);
float3 Result292 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform3).xyz;
Vector_IfResult9 = In_InVector;
Vector_IfResult9 = Result292;
Out_OutVector = Vector_IfResult9;
Matrix_IfResult5 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult4, Constant233, NiagaraScript_914_Func_Output_bUseOriginal4, NiagaraScript_914_Func_Output_OutTransform4, NiagaraScript_914_Func_Output_LocalToWorld4, Context);
float3 Result295 = mul(float4(In_InPosition,1.0),NiagaraScript_914_Func_Output_OutTransform4).xyz;
Vector_IfResult10 = In_InPosition;
Vector_IfResult10 = Result295;
Out_OutPosition = Vector_IfResult10;
bool Constant237 = false;
Matrix_IfResult6 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
NiagaraScript_914_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult5, Constant237, NiagaraScript_914_Func_Output_bUseOriginal5, NiagaraScript_914_Func_Output_OutTransform5, NiagaraScript_914_Func_Output_LocalToWorld5, Context);
float3 Result296 = mul(float4(In_InVector,0.0),NiagaraScript_914_Func_Output_OutTransform5).xyz;
Vector_IfResult11 = In_InVector;
Vector_IfResult11 = Result296;
Out_OutVector = Vector_IfResult11;
int Constant45 = 1;
int Constant46 = 1;
int Result21 = max(Constant45, Constant46);
bool Result22 = NiagaraAll(Context.Map.Particles.NumberOfCollisions >= Result21);
bool Result23 = Result22 && Context.Map.Collision.EnableRestState && Context.Map.Collision.EnableMaxCollisionCount;
bool Result24 = Result23 || Context.Map.Transient.CollisionIsResting || Context.Map.Collision.ManuallyEnterRest;
Context.Map.Local.Collision.ManuallyEnterRest = Result24;
float Constant47 = 0.001;
float Result25 = max(Context.Map.Collision.ParticleMass, Constant47);
Context.Map.Transient.Collision_ParticleMassReplacement = Result25;
Context.Map.OUTPUT_VAR.Collision.IncomingCollisionVelocity = Context.Map.Particles.Velocity;
int Constant48 = 0;
int Constant49 = 1;
Collision_TransformPosition007_Emitter_Func_(Context.Map.Particles.Position, Constant48, Constant49, Constant50, Collision_TransformPosition007_Emitter_Func_Output_OutPosition, Context);
int Constant59 = 1;
bool Constant60 = false;
Collision_TransformVector009_Emitter_Func_(Context.Map.Particles.Velocity, Constant58, Constant59, Constant60, Collision_TransformVector009_Emitter_Func_Output_OutVector, Context);
int Constant63 = 1;
bool Constant64 = false;
Collision_TransformVector010_Emitter_Func_(Context.Map.Collision.PhysicsForce, Constant62, Constant63, Constant64, Collision_TransformVector010_Emitter_Func_Output_OutVector, Context);
Context.Map.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.Map.Local.Collision.InputPositionPassthrough_NeededForSimStageExecution = Collision_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.Map.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector009_Emitter_Func_Output_OutVector;
Context.Map.Local.Collision.InputVelocityPassthrough_NeededForSimStageExecution = Collision_TransformVector009_Emitter_Func_Output_OutVector;
Context.Map.Transient.Collision_ParticlePhysicsForceReplacement = Collision_TransformVector010_Emitter_Func_Output_OutVector;
Context.Map.Local.Collision.InputForcePassthrough_NeededForSimStageExecution = Collision_TransformVector010_Emitter_Func_Output_OutVector;
float Constant66 = 1;
NiagaraScript_916_Particle_Method_NewEnumerator0_Func_(Context.Map.Particles.SpriteSize, NiagaraScript_916_Particle_Method_NewEnumerator0_Func_Output_Radius, Context);
float Result58 = Constant66 * NiagaraScript_916_Particle_Method_NewEnumerator0_Func_Output_Radius;
float Constant68 = 1e-06;
float Result59 = max(Result58, Constant68);
Context.Map.Local.Collision.ModuleParticleRadius = Result59;
float Constant69 = 0;
float Constant70 = 0;
float Constant71 = 0;
float Constant73 = 0.1;
float Constant75 = -999999;
Context.Map.Collision.CollisionQueryAndResponse.DynamicFrictionCoefficient = Constant69;
Context.Map.Collision.CollisionQueryAndResponse001.DynamicFrictionCoefficient = Constant69;
Context.Map.Collision.CollisionQueryAndResponse.StaticFrictionCoefficient = Constant70;
Context.Map.Collision.CollisionQueryAndResponse001.StaticFrictionCoefficient = Constant70;
Context.Map.Collision.CollisionQueryAndResponse.StaticFrictionEngagementSpeed = Constant71;
Context.Map.Collision.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed = Constant71;
Context.Map.Collision.CollisionQueryAndResponse.ParticleRadius = Context.Map.Local.Collision.ModuleParticleRadius;
Context.Map.Collision.CollisionQueryAndResponse001.ParticleRadius = Context.Map.Local.Collision.ModuleParticleRadius;
Context.Map.Collision.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient = Constant72;
Context.Map.Collision.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient = Constant72;
Context.Map.Collision.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage = Constant73;
Context.Map.Collision.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage = Constant73;
Context.Map.Collision.CollisionQueryAndResponse.CollisionEnabled = Context.Map.Collision.CollisionEnabled;
Context.Map.Collision.CollisionQueryAndResponse001.CollisionEnabled = Context.Map.Collision.CollisionEnabled;
Context.Map.Collision.CollisionQueryAndResponse.RandomizeCollisionNormal = Context.Map.Collision.RandomizeCollisionNormalVector;
Context.Map.Collision.CollisionQueryAndResponse001.RandomizeCollisionNormal = Context.Map.Collision.RandomizeCollisionNormalVector;
Context.Map.Collision.CollisionQueryAndResponse.UpdateRotationalVelocity = Context.Map.Local.Collision.UpdateMeshRotation;
Context.Map.Collision.CollisionQueryAndResponse001.UpdateRotationalVelocity = Context.Map.Local.Collision.UpdateMeshRotation;
Context.Map.Collision.CollisionQueryAndResponse001.BounceCollisionFriction = Constant74;
Context.Map.Collision.CollisionQueryAndResponse.BounceCollisionFriction = Constant74;
Context.Map.Collision.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance = Constant75;
Context.Map.Collision.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance = Constant75;
Context.Map.Collision.CollisionQueryAndResponse001.KillParticlesLodgedWithinMeshes = Context.Map.Collision.KillParticlesLodgedWithinMeshes;
Context.Map.Collision.CollisionQueryAndResponse.KillParticlesLodgedWithinMeshes = Context.Map.Collision.KillParticlesLodgedWithinMeshes;
Context.Map.Collision.CollisionQueryAndResponse.DeltaTime = Context.Map.Transient.PhysicsDeltaTime;
float Constant76 = 1;
Context.Map.Collision.CollisionQueryAndResponse.TraceVectorLengthMultiplier = Constant76;
float Constant77 = 1e+10;
Context.Map.Collision.CollisionQueryAndResponse.MaxTraceLength = Constant77;
int Constant78 = 0;
Context.Map.Collision.CollisionQueryAndResponse.CPUFrictionMergeType = Constant78;
Context.Map.Local.Collision.ModuleTraceWorldStart1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldStart;
Context.Map.Local.Collision.ModuleTraceWorldEnd1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldEnd;
Context.Map.Local.Collision.DebugCollisionPosition1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionPosition;
Context.Map.Local.Collision.DebugCollisionNormal1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_CollisionNormal;
Context.Map.Local.Collision.DebugCollided1 = Collision_CollisionQueryAndResponse_Emitter_Func_Output_Collided;
Context.Map.OUTPUT_VAR.Collision.ModuleCollision1Valid = Context.Map.Transient.CollisionValid;
Context.Map.OUTPUT_VAR.Collision.ModuleCollision1Normal = Context.Map.Transient.CollisionNormal;
Context.Map.Collision.CollisionQueryAndResponse001.DeltaTime = Context.Map.Transient.PhysicsDeltaTime;
float Constant164 = 1;
Context.Map.Collision.CollisionQueryAndResponse001.TraceVectorLengthMultiplier = Constant164;
float Constant165 = 1e+10;
Context.Map.Collision.CollisionQueryAndResponse001.MaxTraceLength = Constant165;
Context.Map.Collision.CollisionQueryAndResponse001.CPUFrictionMergeType = Constant166;
Context.Map.Local.Collision.ModuleTraceWorldStart2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldStart;
Context.Map.Local.Collision.ModuleTraceWorldEnd2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldEnd;
Context.Map.Local.Collision.DebugCollisionPosition2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionPosition;
Context.Map.Local.Collision.DebugCollisionNormal2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionNormal;
Context.Map.Local.Collision.DebugCollided2 = Collision_CollisionQueryAndResponse001_Emitter_Func_Output_Collided;
Context.Map.OUTPUT_VAR.Collision.ModuleCollision2Valid = Context.Map.Transient.CollisionValid;
Context.Map.OUTPUT_VAR.Collision.ModuleCollision2Normal = Context.Map.Transient.CollisionNormal;
bool Result265 = Context.Map.OUTPUT_VAR.Collision.ModuleCollision1Valid || Context.Map.OUTPUT_VAR.Collision.ModuleCollision2Valid;
int Constant197 = 1;
int Result266 = Context.Map.Particles.NumberOfCollisions + Constant197;
int32_IfResult = Result266;
int32_IfResult = Context.Map.Particles.NumberOfCollisions;
Context.Map.Transient.CollisionValid = Result265;
Context.Map.OUTPUT_VAR.Collision.CollisionValid = Result265;
Context.Map.Particles.NumberOfCollisions = int32_IfResult;
float Constant198 = 1;
float Constant199 = 0.5;
float Constant200 = 0.5;
float3 Constant201 = float3(0,0,1);
float Constant202 = 0.5;
float Constant203 = 0;
bool Result267 = NiagaraAll(Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance < Constant203);
float Constant204 = 0;
bool Result268 = NiagaraAll(Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance < Constant204);
bool Result269 = Result267 && Result268;
float Constant205 = 0.5;
float Constant206 = 0;
float Constant207 = (0.0);
float NiagaraFloat_SelectResult4 = Constant207;
NiagaraFloat_SelectResult4 = Constant205;
NiagaraFloat_SelectResult4 = Constant206;
float Constant208 = 0.5;
float Constant209 = 0;
float Constant210 = (0.0);
float NiagaraFloat_SelectResult5 = Constant210;
NiagaraFloat_SelectResult5 = Constant208;
NiagaraFloat_SelectResult5 = Constant209;
float Result270 = NiagaraFloat_SelectResult4 + NiagaraFloat_SelectResult5;
float Result271 = Context.Map.Engine.DeltaTime * Constant199;
float Result272 = lerp(Context.Map.Particles.RestCounter,Result270,Result271);
bool Result273 = NiagaraAll(Result272 > Constant198);
float Constant211 = -1;
float Result274 = Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse.CollisionPenetrationDistance * Constant211;
bool Result275 = NiagaraAll(Result274 > Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance);
float Constant212 = -1;
float Result276 = Constant200 * Constant212;
bool Result277 = NiagaraAll(Result276 > Context.Map.OUTPUT_VAR.Collision.CollisionQueryAndResponse001.CollisionPenetrationDistance);
bool Result278 = Result275 || Result277;
bool Result279 = Result269 || Result273 || Result278;
float3 Constant213 = float3(0,0,0);
Vector_IfResult7 = Context.Map.OUTPUT_VAR.Collision.ModuleCollision1Normal;
Vector_IfResult7 = Constant213;
float3 Constant214 = float3(0,0,0);
Vector_IfResult8 = Context.Map.OUTPUT_VAR.Collision.ModuleCollision2Normal;
Vector_IfResult8 = Constant214;
float3 Result280 = Vector_IfResult7 + Vector_IfResult8;
float3 Constant215 = float3(0,0,1);
float Constant216 = 1e-05;
NiagaraScript_901_Particle_Func_(Result280, Constant215, Constant216, NiagaraScript_901_Particle_Func_Output_Direction1, NiagaraScript_901_Particle_Func_Output_Length1, NiagaraScript_901_Particle_Func_Output_BelowThreshold1, Context);
float Result281 = dot(NiagaraScript_901_Particle_Func_Output_Direction1,Constant201);
float Constant217 = 0.5;
float Result282 = Constant202 - Constant217;
float Constant218 = 2;
float Result283 = Result282 * Constant218;
bool Result284 = NiagaraAll(Result281 > Result283);
bool Result285 = Result279 && Result284;
bool_IfResult1 = Result285;
bool_IfResult1 = Result279;
bool Result286 = Context.Map.Collision.EnableRestState && bool_IfResult1 && Context.Map.Collision.CollisionEnabled;
bool Result287 = Result286 || Context.Map.Local.Collision.ManuallyEnterRest;
float3 Constant219 = float3(0,0,0);
float3 Constant220 = float3(0,0,0);
float3 Constant221 = float3(0,0,0);
float Result288 = dot(Context.Map.Transient.AdvectionVelocity,NiagaraScript_901_Particle_Func_Output_Direction1);
float Constant222 = 0;
bool Result289 = NiagaraAll(Result288 > Constant222);
float3 Result290 = NiagaraScript_901_Particle_Func_Output_Direction1 * Result288;
float3 Result291 = Context.Map.Transient.AdvectionVelocity - Result290;
float3 Vector3f_SelectResult6 = Constant223;
Vector3f_SelectResult6 = Context.Map.Transient.AdvectionVelocity;
Vector3f_SelectResult6 = Result291;
Position_IfResult = Context.Map.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult2 = Context.Map.Transient.Collision_ParticleVelocityReplacement;
Force_IfResult = Constant221;
deltatime_IfResult = Context.Map.Transient.PhysicsDeltaTime;
Position_IfResult = Context.Map.Local.Collision.InputPositionPassthrough_NeededForSimStageExecution;
Velocity_IfResult2 = Context.Map.Local.Collision.InputVelocityPassthrough_NeededForSimStageExecution;
Force_IfResult = Context.Map.Local.Collision.InputForcePassthrough_NeededForSimStageExecution;
deltatime_IfResult = Context.Map.Engine.DeltaTime;
AdvectionVelocity_IfResult = Context.Map.Transient.AdvectionVelocity;
float3 Constant224 = float3(0,0,0);
Position_IfResult1 = Context.Map.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult3 = Constant219;
Force_IfResult1 = Constant220;
AdvectionVelocity_IfResult1 = Constant224;
int Constant225 = 1;
int Constant226 = 0;
bool Constant227 = false;
Collision_TransformVector_Emitter_Func_(Force_IfResult1, Constant225, Constant226, Constant227, Collision_TransformVector_Emitter_Func_Output_OutVector, Context);
bool Result293 = Result273 && Context.Map.Collision.CollisionEnabled;
bool Result294 = Context.Map.Local.Collision.ManuallyEnterRest || Result293;
float3 Constant229 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult7 = Constant229;
Vector3f_SelectResult7 = Context.Map.Particles.Collision.SafeCombinedCollisionNormal;
int Constant230 = 1;
int Constant231 = 0;
bool Constant232 = false;
Collision_TransformPosition001_Emitter_Func_(Position_IfResult1, Constant230, Constant231, Constant232, Collision_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
int Constant234 = 1;
int Constant235 = 0;
bool Constant236 = false;
Collision_TransformVector001_Emitter_Func_(Velocity_IfResult3, Constant234, Constant235, Constant236, Collision_TransformVector001_Emitter_Func_Output_OutVector, Context);
Context.Map.Transient.PhysicsForce = Collision_TransformVector_Emitter_Func_Output_OutVector;
Context.Map.Transient.PhysicsDeltaTime = deltatime_IfResult1;
Context.Map.Transient.CollisionIsResting = Result294;
Context.Map.Particles.RestCounter = Result272;
Context.Map.OUTPUT_VAR.Collision.ModuleCombinedCollisionNormal = Vector3f_SelectResult7;
Context.Map.Transient.Collision_ParticlePositionReplacement = Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.Map.Transient.Collision_ParticleVelocityReplacement = Collision_TransformVector001_Emitter_Func_Output_OutVector;
Context.Map.Particles.Velocity = Collision_TransformVector001_Emitter_Func_Output_OutVector;
Context.Map.Particles.Position = Collision_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.Map.OUTPUT_VAR.Collision.CombinedCollisionNormal = Vector3f_SelectResult7;
Context.Map.Transient.AdvectionVelocity = AdvectionVelocity_IfResult1;
Context.Map.Particles.Collision.SafeCombinedCollisionNormal = Vector3f_SelectResult7;
float Constant238 = 0;
Context.Map.Collision.AdvancedAgingRate = Constant238;
int Constant239 = 1;
Context.Map.Local.Collision.KillOnCollision = Constant239;
Context.Map.Particles.PrevPosition = Context.Map.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevPosition;
Context.Map.Particles.PrevMeshOrientation = Context.Map.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevMeshOrientation;
float Constant244 = 0.5;
float Result297 = Constant244 + Context.Map.Transient.PhysicsDrag;
Context.Map.Transient.PhysicsDrag = Result297;
float Constant245 = 0;
float Constant246 = 0.01;
float Result298 = Context.Map.Transient.PhysicsRotationalDrag * Constant246;
Context.Map.Transient.PhysicsRotationalDrag = Result298;
Context.Map.Transient.DragIgnoreMass = Context.Map.Drag.IgnoreMass;
Context.Map.Local.SolveForcesAndVelocity001.DeltaTime = Context.Map.SolveForcesAndVelocity001.DeltaTime;
float Constant254 = 1e-05;
float Result299 = max(Context.Map.Local.SolveForcesAndVelocity001.DeltaTime, Constant254);
float Result300 = Reciprocal(Result299);
Context.Map.Local.SolveForcesAndVelocity001.InverseDeltaTime = Result300;
Context.Map.Local.SolveForcesAndVelocity001.PhysicsForce = Context.Map.SolveForcesAndVelocity001.Force;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsForce = Context.Map.SolveForcesAndVelocity001.Force;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Context.Map.SolveForcesAndVelocity001.Velocity;
Context.Map.Local.SolveForcesAndVelocity001.Mass = Context.Map.SolveForcesAndVelocity001.Mass;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Position = Context.Map.SolveForcesAndVelocity001.Position;
Context.Map.Particles.Presolve.Velocity = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.Map.Particles.Presolve.Position = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Context.Map.Particles.Presolve.PhysicsForce = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsForce;
float Constant255 = 1e-06;
float Result301 = max(Context.Map.Local.SolveForcesAndVelocity001.Mass, Constant255);
float Result302 = Reciprocal(Result301);
float3 Result303 = Result302 * Context.Map.Local.SolveForcesAndVelocity001.PhysicsForce;
Context.Map.Local.SolveForcesAndVelocity001.PhysicsForce = Result303;
Context.Map.Local.SolveForcesAndVelocity001.InverseMass = Result302;
float3 Result304 = Context.Map.Local.SolveForcesAndVelocity001.PhysicsForce * Context.Map.Local.SolveForcesAndVelocity001.DeltaTime + Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Result304;
Context.Map.Local.SolveForcesAndVelocity001.AdvectionVelocity = Context.Map.Transient.AdvectionVelocity;
Context.Map.Local.SolveForcesAndVelocity001.PhysicsDrag = Context.Map.Transient.PhysicsDrag;
Context.Map.Local.SolveForcesAndVelocity001.DragIgnoreMass = Context.Map.Transient.DragIgnoreMass;
NiagaraScript_891_Particle_Func_(Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity, Context.Map.Local.SolveForcesAndVelocity001.AdvectionVelocity, Context.Map.Local.SolveForcesAndVelocity001.InverseMass, Context.Map.Local.SolveForcesAndVelocity001.PhysicsDrag, Context.Map.Local.SolveForcesAndVelocity001.DeltaTime, Context.Map.Local.SolveForcesAndVelocity001.DragIgnoreMass, NiagaraScript_891_Particle_Func_Output_Output2, Context);
float3 Result305 = NiagaraScript_891_Particle_Func_Output_Output2 - Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = NiagaraScript_891_Particle_Func_Output_Output2;
Context.Map.Local.SolveForcesAndVelocity001.DragVelocity = Result305;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.IncomingPhysicsDrag = Context.Map.Local.SolveForcesAndVelocity001.PhysicsDrag;
float Constant256 = 1000;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
float Constant257 = 9999;
float3 Result306 = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity * Context.Map.Local.SolveForcesAndVelocity001.DeltaTime;
float3 Result307 = Result306 + Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Position = Result307;
Position_IfResult2 = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Position;
Velocity_IfResult4 = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity001.Velocity;
Position_IfResult2 = Context.Map.Particles.Position;
Velocity_IfResult4 = Context.Map.Particles.Velocity;
Context.Map.Particles.Position = Position_IfResult2;
Context.Map.Particles.Velocity = Velocity_IfResult4;
float3 Constant258 = float3(0,0,0);
float Constant259 = 0;
ForceVector_IfResult = Constant258;
Drag_IfResult = Constant259;
ForceVector_IfResult = Context.Map.Transient.PhysicsForce;
Drag_IfResult = Context.Map.Transient.PhysicsDrag;
Context.Map.Transient.PhysicsForce = ForceVector_IfResult;
Context.Map.Transient.PhysicsDrag = Drag_IfResult;
float3 Result308 = Context.Map.Particles.Position - Context.Map.Particles.Previous.Position;
float Result309 = length(Result308);
float Constant260 = 0.3333;
float Result310 = Result309 * Constant260;
float Constant261 = 1e+08;
float Result311 = Modulo(Context.Map.Particles.DistanceTraveled, Constant261);
float Result312 = Result310 + Result311;
Context.Map.Particles.DistanceTraveled = Result312;
int Constant262 = 0;
int Constant263 = 0;
int Constant264 = 0;
float3 Result321 = normalize(VECTOR_VAR);
Vector_IfResult12 = Result321;
Vector_IfResult12 = VECTOR_VAR;
float Constant272 = 2;
float Result322 = NiagaraFloat / Constant272;
float Result323 = sin(Result322);
float3 Result324 = Vector_IfResult12 * Result323;
float Result325 = cos(Result322);
Output3.x = Result324.x;
Output3.y = Result324.y;
Output3.z = Result324.z;
Output3.w = Result325;
float3 Result320 = In_RotationalVelocityVector * In_DeltaTime;
float Constant270 = 1e-05;
NiagaraScript_888_Particle_Func_(Result320, Constant269, Constant270, NiagaraScript_888_Particle_Func_Output_Direction15, NiagaraScript_888_Particle_Func_Output_Length15, NiagaraScript_888_Particle_Func_Output_BelowThreshold15, Context);
bool Constant271 = true;
NiagaraScript_885_Func_(Vector4, Constant271, NiagaraScript_885_Func_Output_Quaternion, Context);
NiagaraScript_889_Func_(NiagaraScript_885_Func_Output_Quaternion, In_ExistingOrientationQuat, NiagaraScript_889_Func_Output_Quaternion, Context);
float3 Result313 = Context.Map.Transient.PhysicsRotationalForce / Context.Map.Particles.MomentOfInertia;
float3 Result314 = Result313 * Context.Map.ScratchModule.DeltaTime;
float3 Result315 = Context.Map.Particles.RotationalVelocity + Result314;
Context.Map.Particles.RotationalVelocity = Result315;
float Result316 = max(Constant266, Constant267);
float Result317 = Result316 * Context.Map.ScratchModule.DeltaTime;
float Constant268 = 1;
float Result318 = Result317 + Constant268;
float3 Result319 = Context.Map.Particles.RotationalVelocity / Result318;
Context.Map.Particles.RotationalVelocity = Result319;
NiagaraScript_887_Particle_NormalizeRotations_false_Func_(Context.Map.Particles.RotationalVelocity, Context.Map.ScratchModule.DeltaTime, Context.Map.Particles.MeshOrientation, NiagaraScript_887_Particle_NormalizeRotations_false_Func_Output_NewOrientationQuat, Context);
Context.Map.Particles.MeshOrientation = NiagaraScript_887_Particle_NormalizeRotations_false_Func_Output_NewOrientationQuat;
EnterStatScope(0 /**UpdateScript_1*/);
bool Constant = true;
Context.Map.DataInstance.Alive = Constant;
Context.Map.ParticleState.LoopParticlesLifetime = Constant1;
Context.Map.ParticleState.DeltaTime = Context.Map.Engine.DeltaTime;
Context.Map.ParticleState.Lifetime = Context.Map.Particles.Lifetime;
bool Constant2 = false;
Context.Map.ParticleState.LetInfinitelyLivedParticlesDieWhenEmitterDeactivates = Constant2;
EnterStatScope(1 /**ParticleState_Emitter_Func_*/);
float3 Constant9 = float3(0,0,0);
Context.Map.Transient.PhysicsForce = Constant9;
float3 Constant10 = float3(0,0,-980);
EnterStatScope(2 /**GravityForce_Emitter_Func_*/);
Context.Map.Grid3D_ExternalObjectBuoyancyForce.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_ExternalObjectBuoyancyForce.UnitToWorld = Context.Map.System.Grid3D_CreateUnitToWorldTransform.UnitToWorld;
Context.Map.Grid3D_ExternalObjectBuoyancyForce.WorldToUnit = Context.Map.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit;
Context.Map.Transient.PhysicsRotationalForce = Constant12;
EnterStatScope(3 /**Grid3D_ExternalObjectBuoyancyForce_Emitter_Func_*/);
bool Constant17 = true;
Context.Map.Collision.EnableRestState = Constant17;
Context.Map.Transient.CollisionIsResting = Constant18;
Context.Map.Collision.ManuallyEnterRest = Constant19;
bool Constant20 = false;
Context.Map.Collision.EnableMaxCollisionCount = Constant20;
Context.Map.Collision.ParticleMass = Context.Map.Particles.Mass;
Context.Map.Collision.PhysicsForce = Context.Map.Transient.PhysicsForce;
bool Constant21 = false;
float Constant22 = 1;
float Constant24 = 0;
float Constant26 = 0;
float Constant27 = 0.1;
Context.Map.Collision.CollisionEnabled = Constant28;
Context.Map.Collision.RandomizeCollisionNormalVector = Constant29;
bool Constant30 = false;
Context.Map.Local.Collision.UpdateMeshRotation = Constant30;
float Constant31 = 0;
bool Constant32 = true;
Context.Map.Collision.KillParticlesLodgedWithinMeshes = Constant32;
float3 Constant33 = float3(0,0,0);
Context.Map.Transient.Collision_PredictedParticlePositionForSimStages = Constant33;
Context.Map.Transient.PhysicsDeltaTime = Context.Map.Engine.DeltaTime;
float3 Constant34 = float3(0,0,0);
Context.Map.Transient.AdvectionVelocity = Constant34;
Context.Map.Transient.PhysicsDrag = Constant35;
bool Constant36 = true;
Context.Map.Transient.DragIgnoreMass = Constant36;
float Constant37 = 1;
float Constant38 = 0.5;
float Constant39 = 0.5;
float3 Constant40 = float3(0,0,1);
bool Constant41 = false;
Context.Map.Collision.ControlRestStateViaSurfaceNormal = Constant41;
float Constant42 = 0.5;
float Constant43 = 0;
int Constant44 = 1;
EnterStatScope(4 /**Collision_Emitter_Func_*/);
Context.Map.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevMeshOrientation = Context.Map.Particles.MeshOrientation;
Context.Map.SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3.Particles.PrevPosition = Context.Map.Particles.Position;
EnterStatScope(5 /**SetVariables_8B44EBDF443D62E321EDCFBA6571ABC3_Emitter_Func_*/);
float Constant240 = 0.5;
float Constant241 = 0;
float Constant242 = 0;
Context.Map.Transient.PhysicsRotationalDrag = Constant242;
bool Constant243 = true;
Context.Map.Drag.IgnoreMass = Constant243;
EnterStatScope(6 /**Drag_Emitter_Func_*/);
float Constant247 = 0;
float3 Constant248 = float3(0,0,0);
float3 Constant249 = float3(0,0,0);
float4 Constant250 = float4(0,0,0,1);
Context.Map.SolveForcesAndVelocity001.RotationalInertia = Constant247;
Context.Map.SolveForcesAndVelocity001.RotationalForce = Constant248;
Context.Map.SolveForcesAndVelocity001.RotationalVelocity = Constant249;
Context.Map.SolveForcesAndVelocity001.MeshOrientation = Constant250;
Context.Map.SolveForcesAndVelocity001.DeltaTime = Context.Map.Transient.PhysicsDeltaTime;
Context.Map.SolveForcesAndVelocity001.Force = Context.Map.Transient.PhysicsForce;
Context.Map.SolveForcesAndVelocity001.Velocity = Context.Map.Particles.Velocity;
Context.Map.SolveForcesAndVelocity001.Mass = Context.Map.Particles.Mass;
Context.Map.SolveForcesAndVelocity001.Position = Context.Map.Particles.Position;
float Constant251 = 1000;
Context.Map.SolveForcesAndVelocity001.PreviousVelocity = Context.Map.Particles.Previous.Velocity;
float Constant252 = 9999;
bool Constant253 = true;
Context.Map.SolveForcesAndVelocity001.WritetoIntrinsicProperties = Constant253;
EnterStatScope(7 /**SolveForcesAndVelocity001_Emitter_Func_*/);
Context.Map.ScratchModule.DeltaTime = Context.Map.Engine.DeltaTime;
float Constant265 = 0.5;
EnterStatScope(8 /**ScratchModule_Emitter_Func_*/);
ExitStatScope(/**UpdateScript_1*/);
EnterStatScope(9 /**UpdateScript_1_Main*/);
Context.Map.Particles.Age = InputDataFloat(0, 0);
Context.Map.Array.Age = 0;
Context.Map.Particles.Collision.CollisionQueryAndResponse.CollisionID = InputDataInt(0, 0);
Context.Map.Array.Collision.CollisionQueryAndResponse.CollisionID = 0;
Context.Map.Particles.Collision.CollisionQueryAndResponse001.CollisionID = InputDataInt(0, 1);
Context.Map.Array.Collision.CollisionQueryAndResponse001.CollisionID = 1;
Context.Map.Particles.Collision.SafeCombinedCollisionNormal.x = InputDataFloat(0, 1);
Context.Map.Array.Collision.SafeCombinedCollisionNormal = 1;
Context.Map.Particles.Collision.SafeCombinedCollisionNormal.y = InputDataFloat(0, 2);
Context.Map.Array.Collision.SafeCombinedCollisionNormal = 2;
Context.Map.Particles.Collision.SafeCombinedCollisionNormal.z = InputDataFloat(0, 3);
Context.Map.Array.Collision.SafeCombinedCollisionNormal = 3;
Context.Map.Particles.Diameter = InputDataFloat(0, 4);
Context.Map.Array.Diameter = 4;
Context.Map.Particles.DistanceTraveled = InputDataFloat(0, 5);
Context.Map.Array.DistanceTraveled = 5;
Context.Map.Particles.HasCollided = InputDataBool(0, 2);
Context.Map.Array.HasCollided = 2;
Context.Map.Particles.Lifetime = InputDataFloat(0, 6);
Context.Map.Array.Lifetime = 6;
Context.Map.Particles.Mass = InputDataFloat(0, 7);
Context.Map.Array.Mass = 7;
Context.Map.Particles.MeshOrientation.x = InputDataFloat(0, 8);
Context.Map.Array.MeshOrientation = 8;
Context.Map.Particles.MeshOrientation.y = InputDataFloat(0, 9);
Context.Map.Array.MeshOrientation = 9;
Context.Map.Particles.MeshOrientation.z = InputDataFloat(0, 10);
Context.Map.Array.MeshOrientation = 10;
Context.Map.Particles.MeshOrientation.w = InputDataFloat(0, 11);
Context.Map.Array.MeshOrientation = 11;
Context.Map.Particles.MomentOfInertia.x = InputDataFloat(0, 12);
Context.Map.Array.MomentOfInertia = 12;
Context.Map.Particles.MomentOfInertia.y = InputDataFloat(0, 13);
Context.Map.Array.MomentOfInertia = 13;
Context.Map.Particles.MomentOfInertia.z = InputDataFloat(0, 14);
Context.Map.Array.MomentOfInertia = 14;
Context.Map.Particles.NormalizedAge = InputDataFloat(0, 15);
Context.Map.Array.NormalizedAge = 15;
Context.Map.Particles.NumberOfCollisions = InputDataInt(0, 3);
Context.Map.Array.NumberOfCollisions = 3;
Context.Map.Particles.Position.x = InputDataFloat(0, 16);
Context.Map.Array.Position = 16;
Context.Map.Particles.Position.y = InputDataFloat(0, 17);
Context.Map.Array.Position = 17;
Context.Map.Particles.Position.z = InputDataFloat(0, 18);
Context.Map.Array.Position = 18;
Context.Map.Particles.Presolve.PhysicsForce.x = InputDataFloat(0, 19);
Context.Map.Array.Presolve.PhysicsForce = 19;
Context.Map.Particles.Presolve.PhysicsForce.y = InputDataFloat(0, 20);
Context.Map.Array.Presolve.PhysicsForce = 20;
Context.Map.Particles.Presolve.PhysicsForce.z = InputDataFloat(0, 21);
Context.Map.Array.Presolve.PhysicsForce = 21;
Context.Map.Particles.Presolve.Position.x = InputDataFloat(0, 22);
Context.Map.Array.Presolve.Position = 22;
Context.Map.Particles.Presolve.Position.y = InputDataFloat(0, 23);
Context.Map.Array.Presolve.Position = 23;
Context.Map.Particles.Presolve.Position.z = InputDataFloat(0, 24);
Context.Map.Array.Presolve.Position = 24;
Context.Map.Particles.Presolve.Velocity.x = InputDataFloat(0, 25);
Context.Map.Array.Presolve.Velocity = 25;
Context.Map.Particles.Presolve.Velocity.y = InputDataFloat(0, 26);
Context.Map.Array.Presolve.Velocity = 26;
Context.Map.Particles.Presolve.Velocity.z = InputDataFloat(0, 27);
Context.Map.Array.Presolve.Velocity = 27;
Context.Map.Particles.PrevMeshOrientation.x = InputDataFloat(0, 43);
Context.Map.Array.PrevMeshOrientation = 43;
Context.Map.Particles.PrevMeshOrientation.y = InputDataFloat(0, 44);
Context.Map.Array.PrevMeshOrientation = 44;
Context.Map.Particles.PrevMeshOrientation.z = InputDataFloat(0, 45);
Context.Map.Array.PrevMeshOrientation = 45;
Context.Map.Particles.PrevMeshOrientation.w = InputDataFloat(0, 46);
Context.Map.Array.PrevMeshOrientation = 46;
Context.Map.Particles.PrevPosition.x = InputDataFloat(0, 47);
Context.Map.Array.PrevPosition = 47;
Context.Map.Particles.PrevPosition.y = InputDataFloat(0, 48);
Context.Map.Array.PrevPosition = 48;
Context.Map.Particles.PrevPosition.z = InputDataFloat(0, 49);
Context.Map.Array.PrevPosition = 49;
Context.Map.Particles.Radius = InputDataFloat(0, 50);
Context.Map.Array.Radius = 50;
Context.Map.Particles.RestCounter = InputDataFloat(0, 51);
Context.Map.Array.RestCounter = 51;
Context.Map.Particles.RotationalInertia = InputDataFloat(0, 52);
Context.Map.Array.RotationalInertia = 52;
Context.Map.Particles.RotationalVelocity.x = InputDataFloat(0, 53);
Context.Map.Array.RotationalVelocity = 53;
Context.Map.Particles.RotationalVelocity.y = InputDataFloat(0, 54);
Context.Map.Array.RotationalVelocity = 54;
Context.Map.Particles.RotationalVelocity.z = InputDataFloat(0, 55);
Context.Map.Array.RotationalVelocity = 55;
Context.Map.Particles.Scale.x = InputDataFloat(0, 56);
Context.Map.Array.Scale = 56;
Context.Map.Particles.Scale.y = InputDataFloat(0, 57);
Context.Map.Array.Scale = 57;
Context.Map.Particles.Scale.z = InputDataFloat(0, 58);
Context.Map.Array.Scale = 58;
Context.Map.Particles.SpriteSize.x = InputDataFloat(0, 59);
Context.Map.Array.SpriteSize = 59;
Context.Map.Particles.SpriteSize.y = InputDataFloat(0, 60);
Context.Map.Array.SpriteSize = 60;
Context.Map.Particles.UniqueID = InputDataInt(0, 4);
Context.Map.Array.UniqueID = 4;
Context.Map.Particles.Velocity.x = InputDataFloat(0, 61);
Context.Map.Array.Velocity = 61;
Context.Map.Particles.Velocity.y = InputDataFloat(0, 62);
Context.Map.Array.Velocity = 62;
Context.Map.Particles.Velocity.z = InputDataFloat(0, 63);
Context.Map.Array.Velocity = 63;
Context.Map.Particles.Volume = InputDataFloat(0, 64);
Context.Map.Array.Volume = 64;
Context.Map.Particles.MeshOrientation;
Context.Map.Particles.Position;
Context.Map.Particles.Scale;
Context.Map.Particles.SpriteSize;
Context.Map.Particles.Velocity;
Context.Map.Emitter.ExecutionState = Emitter_ExecutionState;
Context.Map.System.ExecutionState = System_ExecutionState;
Context.Map.System.Grid3D_CreateUnitToWorldTransform.UnitToWorld = System_Grid3D_CreateUnitToWorldTransform_UnitToWorld;
Context.Map.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit = System_Grid3D_CreateUnitToWorldTransform_WorldToUnit;
Context.Map.Engine.Owner.Position = Engine_Owner_Position;
Context.Map.Emitter.NumCellsX = Emitter_NumCellsX;
Context.Map.Emitter.NumCellsY = Emitter_NumCellsY;
Context.Map.Emitter.NumCellsZ = Emitter_NumCellsZ;
Context.Map.Engine.System.TickCount = Engine_System_TickCount;
Context.Map.Engine.Emitter.ID.ID = 1;
EnterStatScope(10 /**UpdateScript_1_MapMain*/);
ExitStatScope(/**UpdateScript_1_MapMain*/);
OutputDataFloat(0, 0, TmpWriteIndex, Context.Map.Particles.Age);
OutputDataInt(0, 0, TmpWriteIndex, Context.Map.Particles.Collision.CollisionQueryAndResponse.CollisionID);
OutputDataInt(0, 1, TmpWriteIndex, Context.Map.Particles.Collision.CollisionQueryAndResponse001.CollisionID);
OutputDataFloat(0, 1, TmpWriteIndex, Context.Map.Particles.Collision.SafeCombinedCollisionNormal.x);
OutputDataFloat(0, 2, TmpWriteIndex, Context.Map.Particles.Collision.SafeCombinedCollisionNormal.y);
OutputDataFloat(0, 3, TmpWriteIndex, Context.Map.Particles.Collision.SafeCombinedCollisionNormal.z);
OutputDataFloat(0, 4, TmpWriteIndex, Context.Map.Particles.Diameter);
OutputDataFloat(0, 5, TmpWriteIndex, Context.Map.Particles.DistanceTraveled);
OutputDataBool(0, 2, TmpWriteIndex, Context.Map.Particles.HasCollided);
OutputDataFloat(0, 6, TmpWriteIndex, Context.Map.Particles.Lifetime);
OutputDataFloat(0, 7, TmpWriteIndex, Context.Map.Particles.Mass);
OutputDataFloat(0, 8, TmpWriteIndex, Context.Map.Particles.MeshOrientation.x);
OutputDataFloat(0, 9, TmpWriteIndex, Context.Map.Particles.MeshOrientation.y);
OutputDataFloat(0, 10, TmpWriteIndex, Context.Map.Particles.MeshOrientation.z);
OutputDataFloat(0, 11, TmpWriteIndex, Context.Map.Particles.MeshOrientation.w);
OutputDataFloat(0, 12, TmpWriteIndex, Context.Map.Particles.MomentOfInertia.x);
OutputDataFloat(0, 13, TmpWriteIndex, Context.Map.Particles.MomentOfInertia.y);
OutputDataFloat(0, 14, TmpWriteIndex, Context.Map.Particles.MomentOfInertia.z);
OutputDataFloat(0, 15, TmpWriteIndex, Context.Map.Particles.NormalizedAge);
OutputDataInt(0, 3, TmpWriteIndex, Context.Map.Particles.NumberOfCollisions);
OutputDataFloat(0, 16, TmpWriteIndex, Context.Map.Particles.Position.x);
OutputDataFloat(0, 17, TmpWriteIndex, Context.Map.Particles.Position.y);
OutputDataFloat(0, 18, TmpWriteIndex, Context.Map.Particles.Position.z);
OutputDataFloat(0, 19, TmpWriteIndex, Context.Map.Particles.Presolve.PhysicsForce.x);
OutputDataFloat(0, 20, TmpWriteIndex, Context.Map.Particles.Presolve.PhysicsForce.y);
OutputDataFloat(0, 21, TmpWriteIndex, Context.Map.Particles.Presolve.PhysicsForce.z);
OutputDataFloat(0, 22, TmpWriteIndex, Context.Map.Particles.Presolve.Position.x);
OutputDataFloat(0, 23, TmpWriteIndex, Context.Map.Particles.Presolve.Position.y);
OutputDataFloat(0, 24, TmpWriteIndex, Context.Map.Particles.Presolve.Position.z);
OutputDataFloat(0, 25, TmpWriteIndex, Context.Map.Particles.Presolve.Velocity.x);
OutputDataFloat(0, 26, TmpWriteIndex, Context.Map.Particles.Presolve.Velocity.y);
OutputDataFloat(0, 27, TmpWriteIndex, Context.Map.Particles.Presolve.Velocity.z);
OutputDataFloat(0, 28, TmpWriteIndex, Context.Map.Particles.Previous.MeshOrientation.x);
OutputDataFloat(0, 29, TmpWriteIndex, Context.Map.Particles.Previous.MeshOrientation.y);
OutputDataFloat(0, 30, TmpWriteIndex, Context.Map.Particles.Previous.MeshOrientation.z);
OutputDataFloat(0, 31, TmpWriteIndex, Context.Map.Particles.Previous.MeshOrientation.w);
OutputDataFloat(0, 32, TmpWriteIndex, Context.Map.Particles.Previous.Position.x);
OutputDataFloat(0, 33, TmpWriteIndex, Context.Map.Particles.Previous.Position.y);
OutputDataFloat(0, 34, TmpWriteIndex, Context.Map.Particles.Previous.Position.z);
OutputDataFloat(0, 35, TmpWriteIndex, Context.Map.Particles.Previous.Scale.x);
OutputDataFloat(0, 36, TmpWriteIndex, Context.Map.Particles.Previous.Scale.y);
OutputDataFloat(0, 37, TmpWriteIndex, Context.Map.Particles.Previous.Scale.z);
OutputDataFloat(0, 38, TmpWriteIndex, Context.Map.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 39, TmpWriteIndex, Context.Map.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 40, TmpWriteIndex, Context.Map.Particles.Previous.Velocity.x);
OutputDataFloat(0, 41, TmpWriteIndex, Context.Map.Particles.Previous.Velocity.y);
OutputDataFloat(0, 42, TmpWriteIndex, Context.Map.Particles.Previous.Velocity.z);
OutputDataFloat(0, 43, TmpWriteIndex, Context.Map.Particles.PrevMeshOrientation.x);
OutputDataFloat(0, 44, TmpWriteIndex, Context.Map.Particles.PrevMeshOrientation.y);
OutputDataFloat(0, 45, TmpWriteIndex, Context.Map.Particles.PrevMeshOrientation.z);
OutputDataFloat(0, 46, TmpWriteIndex, Context.Map.Particles.PrevMeshOrientation.w);
OutputDataFloat(0, 47, TmpWriteIndex, Context.Map.Particles.PrevPosition.x);
OutputDataFloat(0, 48, TmpWriteIndex, Context.Map.Particles.PrevPosition.y);
OutputDataFloat(0, 49, TmpWriteIndex, Context.Map.Particles.PrevPosition.z);
OutputDataFloat(0, 50, TmpWriteIndex, Context.Map.Particles.Radius);
OutputDataFloat(0, 51, TmpWriteIndex, Context.Map.Particles.RestCounter);
OutputDataFloat(0, 52, TmpWriteIndex, Context.Map.Particles.RotationalInertia);
OutputDataFloat(0, 53, TmpWriteIndex, Context.Map.Particles.RotationalVelocity.x);
OutputDataFloat(0, 54, TmpWriteIndex, Context.Map.Particles.RotationalVelocity.y);
OutputDataFloat(0, 55, TmpWriteIndex, Context.Map.Particles.RotationalVelocity.z);
OutputDataFloat(0, 56, TmpWriteIndex, Context.Map.Particles.Scale.x);
OutputDataFloat(0, 57, TmpWriteIndex, Context.Map.Particles.Scale.y);
OutputDataFloat(0, 58, TmpWriteIndex, Context.Map.Particles.Scale.z);
OutputDataFloat(0, 59, TmpWriteIndex, Context.Map.Particles.SpriteSize.x);
OutputDataFloat(0, 60, TmpWriteIndex, Context.Map.Particles.SpriteSize.y);
OutputDataInt(0, 4, TmpWriteIndex, Context.Map.Particles.UniqueID);
OutputDataFloat(0, 61, TmpWriteIndex, Context.Map.Particles.Velocity.x);
OutputDataFloat(0, 62, TmpWriteIndex, Context.Map.Particles.Velocity.y);
OutputDataFloat(0, 63, TmpWriteIndex, Context.Map.Particles.Velocity.z);
OutputDataFloat(0, 64, TmpWriteIndex, Context.Map.Particles.Volume);
ExitStatScope(/**UpdateScript_1_Main*/);
;π…f–Ô¥
;Ä?Ä@Äˇˇ
I¬‰ëgx“Jà;\
@å;w¡@Yá
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„E
xì;ö©\?Nñ∫/hÑ
'Ä¬”Á;ÍCÇï3Qæ
|À¿§5¶ÛJ£b÷;‚∆¬
q;@é÷i¶•&
ı≥Ûü¸;%Eº<=]˜›≤
bÔ«Ÿzó…I§T•ï;
õ;4”$6
‰§C∆;ºªHáU·Ñ‹‹
„“4Ç˝ußK£;å
MO;#ÂÌ≠œ
¡É*ûóˆ•Ä.;ƒ—


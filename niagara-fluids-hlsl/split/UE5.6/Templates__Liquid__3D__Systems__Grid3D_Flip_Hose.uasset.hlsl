{SLl;P"z))h
‚A¯UÑæÖá$è≠béM;5Jl\®›I‚
;SqÕ.)ä‚riUr¿{
»Nsê;Á
ÈÛ;X\™˜
„bA«sÍ)4Î;c©ˇ
–;#Ç¨ß
∆TÁ$è^k¢}j;]<»◊Iq‰å4ãèòû
¸];uzÃGé´^
’+8≤÷B≥7;Ω´
qÒ‰0È9;A´t™Ë}µ»
Hep:FIûe;EœÁ€!µ
p;!2*N´Hó7
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
∞J‰0µjXZnµ;0µ
K®˛Ú‚(;Gâ±≥iƒ
˝Üp;Æ∑
mx±;gWªJêR
ôÎE∂ê$]ﬂ;sT¯í˘I
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
-° 4È}è;∞
;®Âl‰˚D¨è\•—Yß€/a<eEµ
ÿ;ºÉ5R
ôè¯ÏñO5©Çö;•n
wõ©∂Îâ-[ïÎ◊Ò;
;E˜9—‘
rU˘ë≥ª;π
µe°;˝L∫z"{˙
⁄*tD<;úEì&É
fπ∏NêX´;M°˛Ωµ
≠G∏;—O
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊Ú
·Ä;2Kx+J≤Bè§]â‹#˙
s;Mi”DÅéÄµó«RË˙
öc,„( ÒCí;˙™gÊN1˙
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
cMäI#í;…Ï£Á
—Xd°JeG∏;(
»˘Ûüh“ﬁHØ„w≤◊süÛ;
O™â¡ª…i¨≥;
ﬁ;®J´A]
ﬁJΩu&ÑkU„;ˆ
ﬁJΩu&ÑkU„;1
—Ì7;GΩ
ﬁJΩu&ÑkU„;O
ﬁJΩu&ÑkU„;h
‡gYßÖ¯Hê");rÆ◊\o
‡gYßÖ¯Hê");rÆ◊\1
‡gYßÖ¯Hê");rÆ◊\P
‡gYßÖ¯Hê");rÆ◊\ó
ﬁJΩu&ÑkU„;U
‡gYßÖ¯Hê");rÆ◊\V
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
£;n4‰EfC∞Ì
±qú©#N7O™ª;eﬂ
W`Äd˘å°B≥t¥÷;ƒk|±
‡gYßÖ¯Hê");rÆ◊\
nÂ¢q“qMâ;}tk
;W/Ë¿]Ñ
;W/Ë¿]æ
Â√˙»S;ÅD†ò
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3Z
ãsL≥L©j;Ö®¨¶ºx
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿x
>Â;N™Õ)vãh.Zx
b\^ÇPÛEü;±
”5oU;Já±±@†®%9Q
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™∏
K˜ZC ö;Mòïs
;Iò£+1
TA±;ãÒ¢!Áyò
TA±;ãÒ¢!Áyö
87ô5¶3Në;
Ñq;dœDÿJë`†à]ÀÁÆ[
¸ëØNµ‹P%Náw;ø
EÉ©N}í.;œW
ãß;ÂR@ø©àm¯êúJ
÷ÎÜ˚õAé;¿Ùc.ó∑=
Ò≈;ªO≠lÜ••˙C≥x
Æ;IN:ˆ
˝í;ÎÈ=
;≠ã£πÏ™G•'∆5
ˇÚEì;Ú"∑
*J;œ’$ÓI¥ÒƒƒÚo‘~D
Oö;P2π¸Æ*
!;ÌBÔΩ«@†À<Ç*
†6i ;D
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^C
mk†;$û•O´ÜáVóIø¥
OÆÎi;^¡ò
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.Èù
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í
†HæÂ˛†’H-;Û
;Ô“].ºB
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—ÛÛ
Y{3;FçûRô®<NC
 DÄ÷bûYPc7B
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠ÓË
xH;A˘q
˜cKª‰´˛;‡Úˇ`
 iÈJÜ-g$ûZH⁄Û
7uù¬‘RçKô'î£lÅ;k
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿ÇR
:Ã;3ËBqM£<Y)ôfH$`
AÉ%F;XOÖ6x‡jæÊ\µ
xùù⁄€HH≠cç;[*Y>®
xùù⁄€HH≠cç;[*Y>ö
Ñq;dœDÿJë`†à]ÀÁÆ_
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
ØÜHòh∞'Ãﬁ;å∞
ØÜHòh∞'Ãﬁ;å‰
;|ã´Îø
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>mx
Dó0¿¯;ÑOæx
 l;æNÉÒÌ‡~ 4=Q
ÑÒ`@ºèS;<»ZöQ
%wäJÄ‚+“;Eh
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜‡
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
I ;qÚKí
z;›˜™O†lÏwêäNV±
\∏Aä;!ô-¬€¡µ
;+¯OOûû7>
;W/Ë¿]Ë
TA±;ãÒ¢!Áy¸
xùù⁄€HH≠cç;[*Y>
L≠ë;%ç
œW‡µ;⁄_E≤≠ÄÖ√˜ñH
ØÜHòh∞'Ãﬁ;å
Ö¥Ù8Ù2∑Fû;
ëÖ;ü>=-N©
z˚πîp;
j@ëg—…Ÿ;
AÖ;F}y§êA[
≤™cZ_Cí\;
;¬ÒÒEª
M;„uÓÎ»Må†e
;[]eL∏m¬u
àŸC¶œ;'q˚OhM
àŸC¶œ;'q˚Ohö
àŸC¶œ;'q˚Ohf
∆N‡˚ú7—AçÂµ;Ωv·
∂ÙµO≥;3Yx‘(Ç±
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†}
;aJΩzO ?∆+†ñ
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;FØ
Ä~E;ﬁÂ
B≥%Îë;
;?%¶f\
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
Ü;‚{v¡!JéDY†a
∆M±\Oå;µxK
¨•;ª´Ê“Kß√t
Ö∏:“)¢ŒOò;æíÖ√„õ√
Ö∏:“)¢ŒOò;æíÖ√
{tïuQ2PD∏≥ô∫∂%;Õ
;aJΩzO ?∆+†‰
‚¶|;jÈºFµ çEåä
Ö∏:“)¢ŒOò;æíÖ√„õ,
E¨Ñõ;ôGK2
[;w‹ÊC÷M´Wƒ;ÃQ√H
@;x§ù.DAàÔ«;–Ë
°;bF[Ø
V;äALVzG¨ñ
ó‚‰z;XUIÄt7a!EÏ
Úó;˝3g.Dì
z;O∫kÉ^˝öËT±
≤´;à‘ÿ
j¨∞Â@∑;{ˇ«Áó%ì
j¨∞Â@∑;{ˇ«Áó%è
≈c°óûN¶LªO‡á ;q<±
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;
Lø;z˛rLWOµ
XûEøEø;bÒ1°π
XûEøEø;bÒ1°˛
XûEøEø;bÒ1°ı
Z;Öj6sêO¢øÍky@‰»
\≤ﬂﬁ1;ıM°&´“ C…zØ
!òRC@•√PVSdüñ;
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;±
q‘ı;EûuCdﬁ&5›A
q‘ı;EûuCdﬁ&5
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
£í;Cä˘G¥
@™ÛlØ,;
;aJΩzO ?∆+†
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]N
Aì;˝ˇ\∑Ç]
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_U
É∆:JóÑƒ—;Tá_j
9á‚ s‘]MäSr;˚±µ`Ø
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNı^
9;˛π$J»Añ{C8·åNıµ
ùY˝;BEî¢
Ò¢;•BˆCî
‚¢;®Âíp
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€
Ω.BπYÎ;k7Î˜v
Ω.BπYÎ;k7Î˜j
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Hñô5ÏëLe;
Gò;ä∆…±
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“Aå
 ZSiBº´AéÓ—lÜ∆“Aµ
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
Q;öÎ™.
 C®ØHŸ˜ÎR
––˙»H™;[á}zŒB±
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
;ªÑê*%¶
;ªÑê*%
N´†;zXã
;8K¨VA`O¶rKü†J
j°Dîv;
‹ÒW¡¬9G®T©·˚[É;¨
‹ÒW¡¬9G®T©·˚[É;µ
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
EñC‡w@¸k;µ
&≠,ÿ;´§Oª‚œ
¯∂7…›”¡Aü‹–;(ˇ
◊#¯IâDb;Ùﬁ
>bÉ/y;<@éÎ
Ìó!;mJÅá˝#À/~/·
Ìó!;mJÅá˝#À/~/
iyH≠T‘;0
πhM∫Ù-;Ö¥≠Ië
˘';hPNû
;2Zñ5bmE∞\|ÿ
 r±'ÂL´¢
πhM∫Ù-;Ö¥≠I
sÔ◊;ü€
ﬂJÁÊﬁ‹;O∞ºπ
 OöLke˙Ãˇ!÷
 OöLke˙Ãˇ!
;g∆<ksÕIß:«œ[ $t±
∆ÀI;∫ä'L™
ë∏û/ï%MAµ#ƒZ7t;Ÿ
≠¥pÊ1Eê;á˝Ô
Dú#˛;bã⁄
H;Îw‹_MKØ˚µ2Z‘Á‰Ë
H;Îw‹_MKØ˚µ2Z‘Á‰Å
∆M±\Oå;µxKÈ
∆M±\Oå;µxKj
∞L˙>{Ò¿@¥d8Á;
{tïuQ2PD∏≥ô∫∂%;ÕÔ
{tïuQ2PD∏≥ô∫∂%;Õj
¯;·€J_UD®9&Ÿ
@ø™ﬁEôF»;
Q;û:ƒÓGA≤î
îê∫âã!’O∑˙ª æ;˙Ù˚
îê∫âã!’O∑˙ª æ;˙Ùµ
\;ÖI•*ÊÑ
˘5D;Ö¯-AÖUß„à]1§µ
8—d≤G©G¡`Q;◊H±
Íi+;<’Nö±w
Û]¯;¨òïBá
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;ë
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
ı‰®I¶;
¨3êC?D´Ü∂v;“%10
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆ3
ùΩ;Bêa¢óoÆóˆj
 A´KUTFöR!5
 A´KUTFöR!µ
DH;Eêé$,*H‹–:
DH;Eêé$,*H‹–
:œ'ÖÈ;
®4DÆàj›‹A§õ;
GåÁÂé-;Ë‡<
GåÁÂé-;Ë‡q
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;ë
;YÂLËµ
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQbµ
©ÁI°Q-¸;_◊
¿PBÄ}å;¯›zÊ±
q‘ı;EûuCdﬁ&5›Y
Aì;˝ˇ\∑Ç]i
É∆:JóÑƒ—;Tá_p
9;˛π$J»Añ{C8·åNıy
OÖ;ÅëÔ
Ω.BπYÎ;k7Î˜ì
 ZSiBº´AéÓ—lÜ∆“A§
;ªÑê*%æ
‹ÒW¡¬9G®T©·˚[É;ƒ
 OöLke˙Ãˇ!Ï
H;Îw‹_MKØ˚µ2Z‘Á‰˝
∆M±\Oå;µxK˛
îê∫âã!’O∑˙ª æ;˙Ù
;´Ì˘∞ª≠Mä”Áƒ9˚œI±
J°_ycô‰;
;¬D≤<Ä
∂;ΩR\µ
8«O∫~;•{
GÖ,Ü;GÖRËc~H‚3ë
ìÇGÖ,Ü;GÖRËc~H‚3
®+´c ı„A©W!∑;
œW‡µ;⁄_E≤≠ÄÖ√˜ñH&
œW‡µ;⁄_E≤≠ÄÖ√˜ñHj
ä•PLê#è;∫åøu
‰c≤@íN0;ijÛÁ&
‰c≤@íN0;ijÛÁ
W^¢Ãi\¡EÄ;*ø0ö⁄~
{,A;ÜEä&£$¨∏k≤'
{,A;ÜEä&£$¨∏k≤
H^˛;Dµ
£;ï›Iò
fD≤µ˚Qåà;⁄,
fD≤µ˚Qåà;⁄
oi∑;_Aå¢õÜ‘ÃÈ9J
¨3êC?D´Ü∂v;“%1^
ùΩ;Bêa¢óoÆóˆa
 A´KUTFöR!c
GåÁÂé-;Ë‡g
6;G«XN¶ yΩ¥}√/õÌ—!ë}
6;G«XN¶ yΩ¥}√/
¨©8¢H3Iø nUGÎ&+‡h†qy;0I¢ù€ˆ≤lÜ\R[L<hKáGæÆÑ
‡h†qy;0I¢ù€ˆ≤lÜ\
™;MYÀD∫s·–
;ﬁoß/*ûOÑ
ÅµéLPl;¨ÖY…
TÕ;oËÌQMÉÛmàáXxD
l;¨ÖY…
˝‘WXÚ7äF•Wﬂ–;ow"
˝‘WXÚ7äF•Wﬂ–;ow"µ
;ßÄ«\~@ûSØ}@üı«
âiFã/&Ø;™∑ˆ
âiFã/&Ø;™∑ˆµ
E¨Ñõ;ôGK2Å
E¨Ñõ;ôGK2j
[;w‹ÊC÷M´Wƒ;ÃQ√HÖ
[;w‹ÊC÷M´Wƒ;ÃQ√Hj
5\´Ô;O≠yÄç‚LÒ&Ö
5\´Ô;O≠yÄç‚LÒ&µ
˘FCüö‡Èz«;)ë
˘FCüö‡Èz«;)
'ªÙú¬Ù;Nê
åójÕVJØ;ueßä%
åójÕVJØ;ueßä%€
·4∑„ë»-@ó´;['J
)Õ`ä;πmDÇ–
ej;æïDâã–Y
Nˇ¡ë7„mN∂ƒGñR;
¯éºÖ≤‚ìGºÍ˜‰^;~
Fë$;a’[
⁄;Æ_CD∞—Opwd
µ˜Œuº;nEâﬂj>R
˚C„[;aQBà&8∞
;◊X≤B∏N
˝‘WXÚ7äF•Wﬂ–;ow"ø
âiFã/&Ø;™∑ˆø
E¨Ñõ;ôGK2¡
[;w‹ÊC÷M´Wƒ;ÃQ√H≈
5\´Ô;O≠yÄç‚LÒ&≈
åójÕVJØ;ueßä%€Œ
ñå´Ä¸4·ò)èLâ@¨˘‘}Gàã&[˙⁄Ï¥3;Gß8
‰‹;KÉÕ%¿•m'ÿ˙
‰‹;KÉÕ%¿•m'
[˙⁄Ï¥3;Gß8
;DÉ˘’«D
˚>ˆAµ‡V;z≠ù˚µ
lë;•Cãß
ó‚‰z;XUIÄt7a!EÏj
;©†˚(ÊÂFêç
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•µ
x´;Bé§í‡Òä`Ê^
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
4´;ÉùØ
zC∏ª;D◊Û2o
XûEøEø;bÒ1°
K;Óñ‰ﬁ#
K;Óñ‰ﬁ
&HÚ´;R
DÅ)¯P√}i;)
DÅ)¯P√}i;Õ
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
Ö∏:“)¢ŒOò;æíÖ√„õ
g;MåÌ\£RÒB“
Úh;|}}
qi;;¥E∂o>2e
:ı„ÂÒ“;F¢Gâ0=√2A
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯X2
;˙/¯XZ
ıR9ÿ"D¨Úq;Ã
TA±;ãÒ¢!Áy
g‹I∏xü;Ü
%îh;˘Ä_G∑
H;Îw‹_MKØ˚µ2Z‘Á‰
Ö°ÄE<;ÈFÑñ
AÖ˙àöÙ&æ.;
ª¯pπ¡ﬁI¥¨<óô¸'ä;
ºH∫æöÙÖÄÊÖ;
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
GåÁÂé-;Ë‡
ìáï∆)K;Mà±≠/˜˜ùö±
;M¸è¿sK£ﬁ»u8q„eµ
ì◊rÒ®ETEá¥éM;∂
˛´T“@õÜ;˘TÑq™J
˛´T“@õÜ;˘TÑq™D
\Ày`AçÇZ≥Ñ˙;±K
\Ày`AçÇZ≥Ñ˙;±ı
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
å·;ˆ÷hÆNóıÓŸƒq±∞o
å·;ˆ÷hÆNóıÓŸƒq±∞
 —<;?h™Môç•ØZüòUw
x´;Bé§í‡Òä`Êz
‰g;•†0MÜQ:âıπº^|
DÅ)¯P√}i;ï
;˙/¯Xû
PoG®\;
ä•PLê#è;∫åøu¢
˛´T“@õÜ;˘TÑq™∂
\Ày`AçÇZ≥Ñ˙;±∑
å·;ˆ÷hÆNóıÓŸƒq±∞›
Z;Öj6sêO¢øÍky@‰»„
Z;Öj6sêO¢øÍky@‰»ı
TÕ;oËÌQMÉÛmàáXxD„
TÕ;oËÌQMÉÛmàáXxD¢
;ßÄ«\~@ûSØ}@üı«„
;ßÄ«\~@ûSØ}@üı
¯˚ç2;±§HæO}ê
‡Á¸Œ˙åBF∞π;/
ñ8~.Ô;
™Ø ;LCå5â©zÍMø±
›;-ÒJ¢§S/¿
àŸC¶œ;'q˚Oh
j¨∞Â@∑;{ˇ«Áó%
;√nQm+
;√nQm∏
NæÆÄqæ∫;*√
ó±√;ÚM¢°
NæÆÄqæ∫;*
õ…;ÔÙ∞NíDK∫O6Ë¿2
õ…;ÔÙ∞NíDK∫O6Ë¿
v†S]¶Æ"Kª;ò_YIto√
v†S]¶Æ"Kª;ò_YIto
õ…;ÔÙ∞NíDK∫O6Ë¿7
Kã·Ç–∆XQr;
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
float4x4 System_Grid3D_CreateUnitToWorldTransform_WorldToUnit;
float4x4 Emitter_UnitToWorld;
float4x4 Emitter_WorldToUnit;
float4x4 Emitter_WorldToLocal;
float4x4 Emitter_LocalToWorld;
float3 Emitter_SimGrid_Velocity;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_SDFParticleSizeMult;
float3 Emitter_StartVelocityGrid_StartVelocity;
int Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
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
float Value;
float Boundary;
float BoundarySignedDistance;
float3 FaceFraction;
bool Kill;
float3 PhysicsForce;
float SimFloat;
float3 SolidVelocity;
float3 Velocity;
float4x4 WorldToUnit;
FParamMap0_System_Grid3D_CreateUnitToWorldTransform Grid3D_CreateUnitToWorldTransform;
int CoordinateSpace;
bool FixedRandomSeed;
bool HemisphereX;
bool HemisphereY;
bool HemisphereZ;
bool NormalizeThickness;
bool OverrideRandomness;
bool OverrideSeed;
int RandomnessMode;
float3 SphereOrigin;
int SurfaceExpansionMode;
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
float2 SpriteSize;
FParamMap0_SetVariables_4405CB544D551592967D60972962E8B8_Particles Particles;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter Emitter;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B_Transient Transient;
float3 FaceVals;
bool UseHighPrecision;
float dx;
int HalfBandwidth;
float RadiusMult;
bool SourceIsLocalSpace;
float3 Position;
int UniqueID;
float3 SphereNormal;
float3 SphereVector;
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
FParamMap0_OUTPUT_VAR_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_OUTPUT_VAR_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_OUTPUT_VAR_SphereLocation SphereLocation;
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
FParamMap0_Local_Grid3D_SetRTValues Grid3D_SetRTValues;
FParamMap0_Local_Grid3D_Visualize_VectorField Grid3D_Visualize_VectorField;
FParamMap0_Local_SphereLocation SphereLocation;
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
FParamMap0_ScratchModule_01 ScratchModule_01;
FParamMap0_ScratchModule_02 ScratchModule_02;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B SetVariables_196415D64713B26D008A18AD62DEAC4B;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7 SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7;
FParamMap0_SetVariables_4405CB544D551592967D60972962E8B8 SetVariables_4405CB544D551592967D60972962E8B8;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4 SetVariables_9DBFE6D34A13F2D4792275A8C97387E4;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704 SetVariables_A6C8B03743BE41C39A693F9918B79704;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB SetVariables_A802BB404624ACFB5C9C96987F3207AB;
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC SetVariables_C70B065E4ACA60099D622884219EB2AC;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48 SetVariables_C7A11F704885D153E91991B58A269A48;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939 SetVariables_E132597143CDBB6A0359E5AE7A16F939;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686 SetVariables_F07AF7D941D725DF04BE00AD577F0686;
FParamMap0_SphereLocation SphereLocation;
FParamMap0_System System;
FParamMap0_Transient Transient;
FParamMap0_Vector2DFromFloat Vector2DFromFloat;
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
void Vector2DFromFloat_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_(inout FSimulationContext Context);
void SphereLocation_SimulationPosition_Emitter_Func_(out float3 Out_OutPosition, inout FSimulationContext Context);
void NiagaraScript_7_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void NiagaraScript_6_Func_(float3 In_Min, float3 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, bool In_FixedOverrideSeed, out float3 Out_Result, inout FSimulationContext Context);
void NiagaraScript_5_Func_(float In_InnerRadius, float In_OuterRadius, int In_RandomnessMode, bool In_OverrideSeed, int In_Seed, bool In_FixedOverrideSeed, out float3 Out_Ouput, inout FSimulationContext Context);
void CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_(bool In_X, bool In_Y, bool In_Z, out float3 Out_Output);
void NiagaraScript_10_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void SphereLocation_NF_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9467D3964304D77DD887728C19B28EE9_Emitter_Func_(inout FSimulationContext Context);
void SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDF(float3 In_Unit, out float Out_Value);
void ScratchModule_01_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_2_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void LinearToIndex_Emitter_SimGrid(int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void CustomHlsl19006592509BBC2DE28B19BB198A5F2E16ADD4DD_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, out bool Out_ret);
void GetHeight_User_LandscapeCollisions(float3 In_WorldPos, out float Out_Value, out bool Out_IsValid);
void Grid3D_Flip_GridParticles_Emitter_Func_(inout FSimulationContext Context);
void KillParticles001_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_IndexX, int In_IndexY, float In_Value);
void CustomHlslC3843BE4CA970BB384E0A537F6815F01268DC49CEmitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
void Grid3D_CreateConvolutionKernel_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TemporaryGrid(float3 In_Unit, out float3 Out_Index);
void Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SetGridValue_Emitter_TemporaryGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl17F5E5EF34E31B99994EAF2250473AA52096C640Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_01_Emitter_Func_(out float3 Out_Output, inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, float In_MaxDistance, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestVelocity);
void CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute006_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_TransientGrid(out float3 Out_Unit);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float In_dt, out float Out_theta_ppp, out float Out_theta_ppn, out float Out_theta_pnn, out float Out_theta_pnp, out float Out_theta_nnp, out float Out_theta_npp, out float Out_theta_npn, out float Out_theta_nnn, out float3 Out_AverageSolidVelocity);
void CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlslE80EB7EABE00DCC23A14EA8DD6F092FBE86F013C_Func_(float3 In_theta, out float Out_AreaFraction);
void NiagaraScript_41_Func_(float3 In_INPUT_VAR, out float Out_AreaFraction, inout FSimulationContext Context);
void CustomHlsl0E05D7E99FF6BAB34C889B91ACCD95CB24F67427_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlslE8233762C7707F02B558F32A894DD7BDA337854B_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl6DB7854ACE1F43028B4FF45E0A14062252D5F112_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void NiagaraScript_40_Func_(float In_ppp, float In_ppn, float In_pnn, float In_pnp, float In_nnp, float In_npp, float In_npn, out float3 Out_FaceFractions, inout FSimulationContext Context);
void CustomHlsl00144804B9BD6219EB77F2E9A444FDD2C2956DB71DC_Func_(float In_theta_ppp, float In_theta_ppn, float In_theta_pnn, float In_theta_pnp, float In_theta_nnp, float In_theta_npp, float In_theta_npn, float In_theta_nnn, out bool Out_IsFullyInsideBoundary);
void Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(float In_dt, out float Out_XFace, out float Out_YFace, out float Out_ZFace, out bool Out_IsFullyInsideBoundary, out float3 Out_SolidVelocity, inout FSimulationContext Context);
void CustomHlsl3F15F1BEE9E1018158791E3FEA7ACBD1C47F9C32_Func_(float3 In_Face, float In_MinFaceFraction, out float3 Out_FaceFraction);
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
void CustomHlsl245967361B3F4AA2C7481E9D05056D6226AD1B7AEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
void SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl43AFB04F65C84037F8B6FE73FBC69EDF30E4BA1AEmitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
void Grid3D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void Grid3D_GetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void Grid3D_GetFluidAttribute005_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void NiagaraScript_18_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl9824AA6B2373EB4CFDBC43EDB04824CCFE1F4EBF_Func_(float In_InFloat, out float Out_OutFloat);
void NiagaraScript_19_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl247FEE33B7F615FABC30A091D92871D8B3331F8CEmitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
void Grid3D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslC1BBB2AD7FD3C2CFBC6D9EFD9482C1AC1C3687BFEmitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlsl8A01E1672FB0317CBD14BBB6CEFAF8A6B41DB709Emitter_TransientGrid_Func_(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
void Grid3D_ProjectPressure_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl24B08C6CAAD8C0E8FC33894FD9192D40F00FFF2E_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_PlaneOffset, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_Plane, int In_PlaneMax, out bool Out_Execute);
void Grid3D_Visualize_VectorField_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslD0DC9D50C7BB9E39F190452FC3913CE3384F160BEmitter_SimGridEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TransientGrid(float3 In_Unit, out float3 Out_Index);
void CustomHlslD2F22EC6F3AC70E0DE5EB886564733D3BD049BAE_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl361A845E91829398CAB8F1AEADDFB6E1F04E7FA9_Func_(float3 In_UnitPos, out float Out_ret);
void CustomHlsl71F40B24D7F0E66EB0880944D0BDC81456ACD2DF_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl346C47520DAD7AB0C9786B6D1DE898DFB02AAC34_Func_(float In_Mask, out bool Out_IsInside);
void SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_Emitter_Func_(inout FSimulationContext Context);
void KillParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void NiagaraScript_33_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(int In_ParticleIndex, out bool Out_Valid, out float2 Out_Value);
void UnitToFloatIndex_Emitter_RasterizationGrid(float3 In_Unit, out float3 Out_Index);
void GetNumCells_Emitter_RasterizationGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void InterlockedMinFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl30658FC8961513D139CCB4F1EB64738FD6B53F73Emitter_RasterizationGrid_Func_(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
void RasterizationGrid_ParticleSource_Emitter_Func_(inout FSimulationContext Context);
void GetNumCells_Emitter_KernelGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void GetPreviousFloatValue_Emitter_KernelGrid_Attributek(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl298C20453B040416B80FC2C9768A2277213B7652Emitter_RasterizationGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SDFGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void GetNumCells_Emitter_SDFGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_ConvolveAxis002_Emitter_Func_(inout FSimulationContext Context);
void ExecToIndex_Emitter_SimRT(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
float GetSpawnInterpolation();
float2 Output1;
Output1.x = Context.MapSpawn.Vector2DFromFloat.Value;
Output1.y = Context.MapSpawn.Vector2DFromFloat.Value;
Out_Vec2 = Output1;
Context.MapSpawn.Particles.SpriteSize = Context.MapSpawn.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize;
Out_OutPosition = Context.MapSpawn.Engine.Owner.Position;
bool Constant35 = false;
int Constant36 = 0;
bool Result3 = NiagaraAll(In_RandomnessMode == Constant36);
bool Result4 = Constant35 && Result3;
int Constant37 = 1;
bool Result5 = NiagaraAll(In_RandomnessMode == Constant37);
bool Result6 = Result4 || Result5;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapSpawn.Emitter.RandomSeed;
int Constant38 = 0;
int Constant39 = 0;
int Seed1_IfResult;
int Seed2_IfResult;
int Seed3_IfResult;
Seed1_IfResult = Seed_IfResult;
Seed2_IfResult = Constant38;
Seed3_IfResult = Constant39;
Seed1_IfResult = Context.MapSpawn.Particles.UniqueID;
Seed2_IfResult = Context.MapSpawn.Engine.System.TickCount;
Seed3_IfResult = Seed_IfResult;
int Constant40 = -1;
int Constant41 = -1;
int Constant42 = -1;
int Seed1_IfResult1;
int Seed2_IfResult1;
int Seed3_IfResult1;
Seed1_IfResult1 = Seed1_IfResult;
Seed2_IfResult1 = Seed2_IfResult;
Seed3_IfResult1 = Seed3_IfResult;
Seed1_IfResult1 = Constant40;
Seed2_IfResult1 = Constant41;
Seed3_IfResult1 = Constant42;
NiagaraRandInfo Output13;
Output13.Seed1 = Seed1_IfResult1;
Output13.Seed2 = Seed2_IfResult1;
Output13.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output13;
Out_UseDeterministicRandoms = Result6;
int Constant31 = (0);
bool Constant32 = false;
int Constant33 = 0;
int Constant34 = (0);
NiagaraRandInfo NiagaraScript_7_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool NiagaraScript_7_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
NiagaraScript_7_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant31, In_OverrideSeed, Constant33, Constant34, In_FixedOverrideSeed, In_RandomnessMode, NiagaraScript_7_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, NiagaraScript_7_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float3 Result7 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = NiagaraScript_7_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed1;
Seed2 = NiagaraScript_7_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed2;
Seed3 = NiagaraScript_7_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed3;
float3 Result8 = rand_float(Result7, Seed1, Seed2, Seed3);
float3 Result9 = rand_float(Result7);
float3 Random_IfResult;
Random_IfResult = Result8;
Random_IfResult = Result9;
float3 Result10 = In_Min + Random_IfResult;
Out_Result = Result10;
float Constant26 = 0;
float Constant27 = -1;
float Constant28 = 3;
float Result = pow(max(0, In_InnerRadius),Constant28);
float3 Output11;
Output11.x = Constant26;
Output11.y = Constant27;
Output11.z = Result;
float Result1 = TWO_PI;
float Constant29 = 1;
float Constant30 = 3;
float Result2 = pow(max(0, In_OuterRadius),Constant30);
float3 Output12;
Output12.x = Result1;
Output12.y = Constant29;
Output12.z = Result2;
float3 NiagaraScript_6_Func_Output_Result;
NiagaraScript_6_Func_(Output11, Output12, In_Seed, In_RandomnessMode, In_OverrideSeed, In_FixedOverrideSeed, NiagaraScript_6_Func_Output_Result, Context);
float Phi;
float CosASC40ThetaASC41;
float RASC943;
Phi = NiagaraScript_6_Func_Output_Result.x;
CosASC40ThetaASC41 = NiagaraScript_6_Func_Output_Result.y;
RASC943 = NiagaraScript_6_Func_Output_Result.z;
float Result11 = cos(Phi);
float Result12 = CosASC40ThetaASC41 * CosASC40ThetaASC41;
float Result13 = 1 - Result12;
float Result14 = sqrt(Result13);
float Result15 = Result11 * Result14;
float Result16 = sin(Phi);
float Result17 = Result16 * Result14;
float3 Output14;
Output14.x = Result15;
Output14.y = Result17;
Output14.z = CosASC40ThetaASC41;
float Constant43 = 0.333333;
float Result18 = pow(max(0, RASC943),Constant43);
float3 Result19 = Output14 * Result18;
Out_Ouput = Result19;
Out_Output = float3(In_X, In_Y, In_Z);
int Constant51 = 0;
bool Result24 = NiagaraAll(In_SourceSpace == Constant51);
int Constant52 = 0;
bool Result25 = NiagaraAll(In_DestinationSpace == Constant52);
bool Result26 = Result24 && Result25;
int Constant53 = 1;
bool Result27 = NiagaraAll(In_SourceSpace == Constant53);
int Constant54 = 1;
bool Result28 = NiagaraAll(In_DestinationSpace == Constant54);
bool Result29 = Result27 && Result28;
bool Result30 = Result26 || Result29;
int Constant55 = 2;
bool Result31 = NiagaraAll(In_SourceSpace == Constant55);
int Constant56 = 2;
bool Result32 = NiagaraAll(In_DestinationSpace == Constant56);
bool Result33 = Result31 && Result32;
bool Result34 = Result30 || Result33;
bool Result35 = Result24 && Result32;
bool Result36 = Result31 && Result25;
bool Result37 = Result35 || Result36;
bool Result38 = In_bLocalSpace && Result37;
bool Result39 = Result34 || Result38;
bool Result40 = !In_bLocalSpace;
bool Result41 = Result24 && Result28;
bool Result42 = Result27 && Result25;
bool Result43 = Result41 || Result42;
bool Result44 = Result40 && Result43;
bool Result45 = Result39 || Result44;
bool Result46 = In_bLocalSpace && Result41;
bool Result47 = Result31 && Result28;
bool Result48 = Result46 || Result47;
bool Result49 = Result40 && Result36;
bool Result50 = Result48 || Result49;
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result45;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result50;
bool Constant50 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_10_Func_Output_bUseOriginal;
float4x4 NiagaraScript_10_Func_Output_OutTransform;
bool NiagaraScript_10_Func_Output_LocalToWorld;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant50, NiagaraScript_10_Func_Output_bUseOriginal, NiagaraScript_10_Func_Output_OutTransform, NiagaraScript_10_Func_Output_LocalToWorld, Context);
float3 Result51 = mul(float4(In_InVector,0.0),NiagaraScript_10_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InVector;
Vector_IfResult = Result51;
Out_OutVector = Vector_IfResult;
float Constant19 = 0;
float Constant20 = 1;
int Constant21 = 0;
float Constant22 = 0;
float Constant23 = 50;
int Constant24 = 0;
bool Constant25 = false;
int Mode_IfResult;
bool Override_IfResult;
Mode_IfResult = Context.MapSpawn.SphereLocation.RandomnessMode;
Override_IfResult = Context.MapSpawn.SphereLocation.OverrideSeed;
Mode_IfResult = Constant24;
Override_IfResult = Constant25;
float3 NiagaraScript_5_Func_Output_Ouput;
NiagaraScript_5_Func_(Constant19, Constant20, Mode_IfResult, Override_IfResult, Constant21, Context.MapSpawn.SphereLocation.FixedRandomSeed, NiagaraScript_5_Func_Output_Ouput, Context);
Context.MapSpawn.Local.SphereLocation.SphereVector = NiagaraScript_5_Func_Output_Ouput;
float3 Result20 = abs(Context.MapSpawn.Local.SphereLocation.SphereVector);
float3 CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_Output_Output;
CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_(Context.MapSpawn.SphereLocation.HemisphereX, Context.MapSpawn.SphereLocation.HemisphereY, Context.MapSpawn.SphereLocation.HemisphereZ, CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_Output_Output);
float3 Result21 = lerp(Context.MapSpawn.Local.SphereLocation.SphereVector,Result20,CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_Output_Output);
Context.MapSpawn.Local.SphereLocation.SphereVector = Result21;
float Constant44 = 50;
float3 Constant45 = float3(1,1,1);
float3 Result22 = Constant44 * Context.MapSpawn.Local.SphereLocation.SphereVector * Constant45;
Context.MapSpawn.Local.SphereLocation.SphereVector = Result22;
float3 Constant46 = float3(0,0,300);
int Constant47 = 0;
float3 Result23 = Context.MapSpawn.SphereLocation.SphereOrigin + Constant46;
int Constant48 = 0;
bool Constant49 = true;
float3 SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
SphereLocation_NF_TransformVector_Emitter_Func_(Context.MapSpawn.Local.SphereLocation.SphereVector, Context.MapSpawn.SphereLocation.CoordinateSpace, Constant48, Constant49, SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result52 = Result23 + SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
float3 Result53 = normalize(SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector);
Context.MapSpawn.Particles.Position = Result52;
Context.MapSpawn.OUTPUT_VAR.SphereLocation.SphereNormal = Result53;
Context.MapSpawn.OUTPUT_VAR.SphereLocation.SphereVector = SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
float3 Constant58 = float3(150,0,0);
Context.MapSpawn.Particles.Velocity = Constant58;
float3 Output15;
Output15.x = Context.MapSpawn.Particles.Position.x;
Output15.y = Context.MapSpawn.Particles.Position.y;
Output15.z = Context.MapSpawn.Particles.Position.z;
float3 Result54 = mul(float4(Output15,1.0),Context.MapSpawn.ScratchModule_01.WorldToUnit).xyz;
float SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDFOutput_Value;
SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDF(Result54, SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDFOutput_Value);
float Constant59 = 0;
bool Result55 = NiagaraAll(SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDFOutput_Value < Constant59);
Context.MapSpawn.Transient.Kill = Result55;
bool Constant73 = false;
float3 Result56 = In_RangeMax - In_RangeMin;
float3 Result57 = rand(Result56);
float3 Result58 = In_RangeMin + Result57;
Out_RandomValue = Result58;
Out_IsDeterministic = Constant73;
In_IndexX >= In_NumCellsX - 2 || In_IndexY >= In_NumCellsY - 2 || In_IndexZ >= In_NumCellsZ - 2;
float Constant63 = 1;
float Constant64 = 1;
int Constant65 = (0);
float3 Constant66 = float3(-0.5,-0.5,-0.5);
float3 Constant67 = float3(0.5,0.5,0.5);
int Constant68 = -1;
int Constant69 = (0);
int Constant70 = 0;
int Constant71 = (0);
int Constant72 = (0);
float3 NiagaraScript_2_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue;
bool NiagaraScript_2_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_2_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant65, Constant66, Constant67, Constant68, Constant69, Constant70, Constant71, Constant72, NiagaraScript_2_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue, NiagaraScript_2_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
int Result59 = ExecIndex();
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
int Result60 = GetNumCells_Emitter_SimGridOutput_NumCellsX * GetNumCells_Emitter_SimGridOutput_NumCellsY * Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex;
bool Result61 = NiagaraAll(Result59 >= Result60);
float Constant74 = 1;
float3 Result62 = NiagaraScript_2_Particle_Particle_ScriptUsage3_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue * Constant64 * Result61 * Constant74;
int Result63 = ModuloPrecise(Result59, Result60);
int LinearToIndex_Emitter_SimGridOutput_IndexX;
int LinearToIndex_Emitter_SimGridOutput_IndexY;
int LinearToIndex_Emitter_SimGridOutput_IndexZ;
LinearToIndex_Emitter_SimGrid(Result63, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, LinearToIndex_Emitter_SimGridOutput_IndexZ);
int Result64 = Context.MapSpawn.Grid3D_Flip_GridParticles.ParticlesPerCell * Context.MapSpawn.Grid3D_Flip_GridParticles.TotalEmissionCells;
bool Result65 = NiagaraAll(Result59 > Result64);
int Constant75 = 1;
int Result66 = Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex - Constant75;
int Constant76 = (0);
int IndexZ_SelectResult = Constant76;
IndexZ_SelectResult = Result66;
IndexZ_SelectResult = LinearToIndex_Emitter_SimGridOutput_IndexZ;
float3 Output16;
Output16.x = LinearToIndex_Emitter_SimGridOutput_IndexX;
Output16.y = LinearToIndex_Emitter_SimGridOutput_IndexY;
Output16.z = IndexZ_SelectResult;
float3 Result67 = Result62 + Output16;
float X;
float Y;
float Z;
X = Result67.x;
Y = Result67.y;
Z = Result67.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Result68 = mul(float4(IndexToUnit_Emitter_SimGridOutput_Unit,1.0),Context.MapSpawn.Grid3D_Flip_GridParticles.UnitToWorld).xyz;
//SetConstantByStaticVariable "/Grid 3D Flip Grid Particles/Map Get/Map Get->Module.Use Landscape"
int Constant77 = 1;
float3 Constant78 = float3(0,0,0);
float Constant79 = 0;
bool Result69 = NiagaraAll(IndexZ_SelectResult >= Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex);
bool CustomHlsl19006592509BBC2DE28B19BB198A5F2E16ADD4DD_Func_Output_ret;
CustomHlsl19006592509BBC2DE28B19BB198A5F2E16ADD4DD_Func_(LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, IndexZ_SelectResult, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, CustomHlsl19006592509BBC2DE28B19BB198A5F2E16ADD4DD_Func_Output_ret);
bool Result70 = Result69 || CustomHlsl19006592509BBC2DE28B19BB198A5F2E16ADD4DD_Func_Output_ret;
float X1;
float Y1;
float Z1;
X1 = Result68.x;
Y1 = Result68.y;
Z1 = Result68.z;
float GetHeight_User_LandscapeCollisionsOutput_Value;
bool GetHeight_User_LandscapeCollisionsOutput_IsValid;
GetHeight_User_LandscapeCollisions(Result68, GetHeight_User_LandscapeCollisionsOutput_Value, GetHeight_User_LandscapeCollisionsOutput_IsValid);
bool Result71 = NiagaraAll(Z1 < GetHeight_User_LandscapeCollisionsOutput_Value);
bool Result72 = Result71 && GetHeight_User_LandscapeCollisionsOutput_IsValid;
bool Result73 = Result70 || Result72;
float Result74 = Context.MapSpawn.Grid3D_Flip_GridParticles.dx * Constant63;
float3 Constant80 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult1 = Constant80;
bool Constant81 = (false);
bool NiagaraBool_SelectResult1 = Constant81;
float2 Constant82 = float2(0.0, 0.0);
float2 Vector2D_SelectResult1 = Constant82;
float3 Constant83 = float3(0.0, 0.0, 0.0);
float3 Vector3f001_SelectResult1 = Constant83;
Vector3f_SelectResult1 = Result68;
NiagaraBool_SelectResult1 = Result73;
Vector2D_SelectResult1 = Result74;
Vector3f001_SelectResult1 = Constant78;
Vector3f_SelectResult1 = Context.MapSpawn.Particles.Position;
NiagaraBool_SelectResult1 = Context.MapSpawn.Transient.Kill;
Vector2D_SelectResult1 = Context.MapSpawn.Particles.SpriteSize;
Vector3f001_SelectResult1 = Context.MapSpawn.Particles.Velocity;
Context.MapSpawn.Particles.Position = Vector3f_SelectResult1;
Context.MapSpawn.Transient.Kill = NiagaraBool_SelectResult1;
Context.MapSpawn.Particles.SpriteSize = Vector2D_SelectResult1;
Context.MapSpawn.Particles.Velocity = Vector3f001_SelectResult1;
bool Constant85 = false;
bool bool_IfResult;
bool_IfResult = Constant85;
bool_IfResult = Context.MapSpawn.DataInstance.Alive;
Context.MapSpawn.DataInstance.Alive = bool_IfResult;
float3 Constant88 = float3(0,0,-980);
float3 Result75 = Context.MapUpdate.Transient.PhysicsForce + Constant88;
float3 Result76 = Result75 * Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result77 = Context.MapUpdate.Particles.Velocity + Result76;
Context.MapUpdate.Particles.Velocity = Result77;
   SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0,0,1);
    float Total = 0;
    for (int i = 0; i <= In_Radius; ++i)
        float Val = 1. - 1. * i/(In_Radius+1);
        Total += Val;
        // add negative side to total
        if (i > 0)
            Total += Val;
        SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(i, 0, Val/Total);
//SetConstantByStaticVariable "/Grid 3D Create Convolution Kernel/Map Get/Map Get->Module.Smoothing Kernel"
int Constant89 = 2;
CustomHlslC3843BE4CA970BB384E0A537F6815F01268DC49CEmitter_KernelGrid_Func_(Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius, Context);
float Constant91 = 0;
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Constant91;
float3 Constant93 = float3(0,0,0);
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Constant93;
int Constant101 = 0;
bool Result78 = NiagaraAll(In_SourceSpace == Constant101);
int Constant102 = 0;
bool Result79 = NiagaraAll(In_DestinationSpace == Constant102);
bool Result80 = Result78 && Result79;
int Constant103 = 1;
bool Result81 = NiagaraAll(In_SourceSpace == Constant103);
int Constant104 = 1;
bool Result82 = NiagaraAll(In_DestinationSpace == Constant104);
bool Result83 = Result81 && Result82;
bool Result84 = Result80 || Result83;
int Constant105 = 2;
bool Result85 = NiagaraAll(In_SourceSpace == Constant105);
int Constant106 = 2;
bool Result86 = NiagaraAll(In_DestinationSpace == Constant106);
bool Result87 = Result85 && Result86;
bool Result88 = Result84 || Result87;
bool Result89 = Result78 && Result86;
bool Result90 = Result85 && Result79;
bool Result91 = Result89 || Result90;
bool Result92 = In_bLocalSpace && Result91;
bool Result93 = Result88 || Result92;
bool Result94 = !In_bLocalSpace;
bool Result95 = Result78 && Result82;
bool Result96 = Result81 && Result79;
bool Result97 = Result95 || Result96;
bool Result98 = Result94 && Result97;
bool Result99 = Result93 || Result98;
bool Result100 = In_bLocalSpace && Result95;
bool Result101 = Result85 && Result82;
bool Result102 = Result100 || Result101;
bool Result103 = Result94 && Result90;
bool Result104 = Result102 || Result103;
float4x4 Matrix_IfResult3;
Matrix_IfResult3 = In_LocalToWorldTransform;
Matrix_IfResult3 = In_WorldToLocalTransform;
Out_bUseOriginal = Result99;
Out_OutTransform = Matrix_IfResult3;
Out_LocalToWorld = Result104;
bool Constant100 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_10_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_10_Func_Output_OutTransform1;
bool NiagaraScript_10_Func_Output_LocalToWorld1;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant100, NiagaraScript_10_Func_Output_bUseOriginal1, NiagaraScript_10_Func_Output_OutTransform1, NiagaraScript_10_Func_Output_LocalToWorld1, Context);
float3 Result105 = mul(float4(In_InPosition,1.0),NiagaraScript_10_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InPosition;
Vector_IfResult1 = Result105;
Out_OutPosition = Vector_IfResult1;
bool Constant110 = false;
float4x4 Matrix_IfResult4;
float4x4 Matrix001_IfResult2;
Matrix_IfResult4 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_10_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_10_Func_Output_OutTransform2;
bool NiagaraScript_10_Func_Output_LocalToWorld2;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult2, Constant110, NiagaraScript_10_Func_Output_bUseOriginal2, NiagaraScript_10_Func_Output_OutTransform2, NiagaraScript_10_Func_Output_LocalToWorld2, Context);
float3 Result107 = mul(float4(In_InVector,0.0),NiagaraScript_10_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result107;
Out_OutVector = Vector_IfResult2;
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
int Constant96 = 1;
int Constant97 = 0;
int Constant98 = 1;
bool Constant99 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Position, Constant97, Constant98, Constant99, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result106 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(Result106, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant107 = 0;
int Constant108 = 1;
bool Constant109 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Velocity, Constant107, Constant108, Constant109, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result108 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlsl17F5E5EF34E31B99994EAF2250473AA52096C640Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result108, Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Enable"
int Constant111 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
int Constant112 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant113 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
int Constant114 = 0;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Resample = Constant114;
int Constant115 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Local.Module.Resample"
int Constant116 = 0;
float3 Constant117 = float3(0,0,0);
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Unit = Constant117;
int Constant118 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant119 = 3;
int Constant120 = 0;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Write To Transient"
int Constant121 = 1;
Context.MapSimStage5_ComputeBoundary.Transient.SimFloat = Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
//SetConstantByStaticVariable "/Scratch Dynamic Input 01/Map Get/Map Get->Module.Use High Precision"
int Constant124 = 0;
float3 Constant125 = float3(0,0,0);
Out_Output = Constant125;
#if ((SimulationStageIndex == 5) || (SimulationStageIndex == 6)) // Multiple stages
Out_Boundary = 0;
  Out_Boundary = In_OpenBoundaryRight ? 2 : 1;
  Out_Boundary = In_OpenBoundaryLeft ? 2 : 1;
  Out_Boundary = In_OpenBoundaryDown ? 2 : 1;
  Out_Boundary = In_OpenBoundaryUp ? 2 : 1;
  Out_Boundary = In_OpenBoundaryBack ? 2 : 1;
  Out_Boundary = In_OpenBoundaryFront ? 2 : 1;
#endif // Multiple stages
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
const  int RASTERIZED_FLUID_CELL = 3;
Out_RetBoundary = EMPTY_CELL;
  Out_RetBoundary = FLUID_CELL;
  Out_RetBoundary = In_SolidValue;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Landscape Collisions"
int Constant126 = 1;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Particle Collisions"
int Constant127 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Geometry Collection Collisions"
int Constant128 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Collisions"
int Constant129 = 1;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Distance Fields"
int Constant130 = 1;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Depth Map Collisions"
int Constant131 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Global Distance Field Collisions"
int Constant132 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float3 Output17;
Output17.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output17.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output17.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result109 = Output17 + Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OffsetSamplePosition;
float X2;
float Y2;
float Z2;
X2 = Result109.x;
Y2 = Result109.y;
Z2 = Result109.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit1;
IndexToUnit_Emitter_SimGrid(X2, Y2, Z2, IndexToUnit_Emitter_SimGridOutput_Unit1);
float3 Constant133 = float3(0,0,0);
float3 Output18;
Output18.x = IndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output18.y = IndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output18.z = IndexToUnit_Emitter_SimGridOutput_Unit1.z;
float3 Result110 = mul(float4(Output18,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit1;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Constant133;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos = Result110;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
int Constant134 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX1;
int GetNumCells_Emitter_SimGridOutput_NumCellsY1;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ1;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_Output_Boundary;
CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant134, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_Output_Boundary);
float Constant135 = 1e+17;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Accurate SDF Iteration"
int Constant136 = 0;
float Constant137 = 0.001;
float GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity;
GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, Context.MapSimStage5_ComputeBoundary.Engine.WorldDeltaTime, Context.MapSimStage5_ComputeBoundary.Engine.System.TimeStepFraction, Constant137, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity);
float Constant138 = 0;
bool Result111 = NiagaraAll(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance <= Constant138);
float Constant139 = 1;
float3 Result112 = GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity * Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale;
float3 Result113 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity + Result112;
float Constant140 = (0.0);
float NiagaraFloat_SelectResult2 = Constant140;
float3 Constant141 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult2 = Constant141;
NiagaraFloat_SelectResult2 = Constant139;
Vector3f_SelectResult2 = Result113;
NiagaraFloat_SelectResult2 = CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_Output_Boundary;
Vector3f_SelectResult2 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Vector3f_SelectResult2;
float Result114 = min(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, Constant135);
float3 Output19;
Output19.x = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.x;
Output19.y = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.y;
Output19.z = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.z;
float X3;
float Y3;
float Z3;
X3 = Output19.x;
Y3 = Output19.y;
Z3 = Output19.z;
float GetHeight_User_LandscapeCollisionsOutput_Value1;
bool GetHeight_User_LandscapeCollisionsOutput_IsValid1;
GetHeight_User_LandscapeCollisions(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, GetHeight_User_LandscapeCollisionsOutput_Value1, GetHeight_User_LandscapeCollisionsOutput_IsValid1);
bool Result115 = NiagaraAll(Z3 < GetHeight_User_LandscapeCollisionsOutput_Value1);
float Constant142 = 1;
float Result116 = Z3 - GetHeight_User_LandscapeCollisionsOutput_Value1;
float Result117 = min(Result116, Result114);
float Constant143 = (0.0);
float NiagaraFloat_SelectResult3 = Constant143;
float Constant144 = (0.0);
float NiagaraFloat001_SelectResult3 = Constant144;
NiagaraFloat_SelectResult3 = Constant142;
NiagaraFloat001_SelectResult3 = Result117;
NiagaraFloat_SelectResult3 = NiagaraFloat_SelectResult2;
NiagaraFloat001_SelectResult3 = Result114;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Free Surface"
int Constant145 = 1;
float CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_Output_RetBoundary;
CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_(NiagaraFloat_SelectResult3, Context.MapSimStage5_ComputeBoundary.Transient.Boundary, CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_Output_RetBoundary);
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_Output_RetBoundary;
Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance = NiagaraFloat001_SelectResult3;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Enable"
int Constant147 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Attribute"
int Constant148 = 7;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float X4;
float Y4;
float Z4;
X4 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.x;
Y4 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.y;
Z4 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.z;
float4 Output110;
Output110.x = X4;
Output110.y = Y4;
Output110.z = Z4;
Output110.w = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output110);
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 003/Map Get/Map Get->Module.Enable"
int Constant150 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Enable"
int Constant151 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample To Another Grid"
int Constant152 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant153 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Logic OR (Static)/Logic OR (Static)->Result"
int Constant154 = 0;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Resample = Constant154;
int Constant155 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Local.Module.Resample"
int Constant156 = 0;
float3 Constant157 = float3(0,0,0);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Unit = Constant157;
int Constant158 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Attribute"
int Constant159 = 3;
int Constant160 = 0;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Write To Transient"
int Constant161 = 1;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat = Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat;
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
float CustomHlslE80EB7EABE00DCC23A14EA8DD6F092FBE86F013C_Func_Output_AreaFraction;
CustomHlslE80EB7EABE00DCC23A14EA8DD6F092FBE86F013C_Func_(In_INPUT_VAR, CustomHlslE80EB7EABE00DCC23A14EA8DD6F092FBE86F013C_Func_Output_AreaFraction);
Out_AreaFraction = CustomHlslE80EB7EABE00DCC23A14EA8DD6F092FBE86F013C_Func_Output_AreaFraction;
Out_Avg = .25 * (In_A+In_B+In_C+In_D);
float3 CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri0;
float3 CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri1;
float3 CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri2;
float3 CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri3;
CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_(In_ppp, In_ppn, In_pnn, In_pnp, CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri0, CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri1, CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri2, CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri3);
float NiagaraScript_41_Func_Output_AreaFraction;
NiagaraScript_41_Func_(CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri0, NiagaraScript_41_Func_Output_AreaFraction, Context);
float NiagaraScript_41_Func_Output_AreaFraction1;
NiagaraScript_41_Func_(CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri1, NiagaraScript_41_Func_Output_AreaFraction1, Context);
float NiagaraScript_41_Func_Output_AreaFraction2;
NiagaraScript_41_Func_(CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri2, NiagaraScript_41_Func_Output_AreaFraction2, Context);
float NiagaraScript_41_Func_Output_AreaFraction3;
NiagaraScript_41_Func_(CustomHlsl28DF340B1AAD869D8A2972D1CC41EFE5A692259B_Func_Output_Tri3, NiagaraScript_41_Func_Output_AreaFraction3, Context);
float CustomHlsl0E05D7E99FF6BAB34C889B91ACCD95CB24F67427_Func_Output_Avg;
CustomHlsl0E05D7E99FF6BAB34C889B91ACCD95CB24F67427_Func_(NiagaraScript_41_Func_Output_AreaFraction, NiagaraScript_41_Func_Output_AreaFraction1, NiagaraScript_41_Func_Output_AreaFraction2, NiagaraScript_41_Func_Output_AreaFraction3, CustomHlsl0E05D7E99FF6BAB34C889B91ACCD95CB24F67427_Func_Output_Avg);
float3 CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri0;
float3 CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri1;
float3 CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri2;
float3 CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri3;
CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_(In_ppp, In_ppn, In_npp, In_npn, CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri0, CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri1, CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri2, CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri3);
float NiagaraScript_41_Func_Output_AreaFraction4;
NiagaraScript_41_Func_(CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri0, NiagaraScript_41_Func_Output_AreaFraction4, Context);
float NiagaraScript_41_Func_Output_AreaFraction5;
NiagaraScript_41_Func_(CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri1, NiagaraScript_41_Func_Output_AreaFraction5, Context);
float NiagaraScript_41_Func_Output_AreaFraction6;
NiagaraScript_41_Func_(CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri2, NiagaraScript_41_Func_Output_AreaFraction6, Context);
float NiagaraScript_41_Func_Output_AreaFraction7;
NiagaraScript_41_Func_(CustomHlsl3101888E509D50BA064029BBEA2A9FA09E3DE1A2_Func_Output_Tri3, NiagaraScript_41_Func_Output_AreaFraction7, Context);
float CustomHlslE8233762C7707F02B558F32A894DD7BDA337854B_Func_Output_Avg;
CustomHlslE8233762C7707F02B558F32A894DD7BDA337854B_Func_(NiagaraScript_41_Func_Output_AreaFraction4, NiagaraScript_41_Func_Output_AreaFraction5, NiagaraScript_41_Func_Output_AreaFraction6, NiagaraScript_41_Func_Output_AreaFraction7, CustomHlslE8233762C7707F02B558F32A894DD7BDA337854B_Func_Output_Avg);
float3 CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri0;
float3 CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri1;
float3 CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri2;
float3 CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri3;
CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_(In_ppp, In_pnp, In_nnp, In_npp, CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri0, CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri1, CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri2, CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri3);
float NiagaraScript_41_Func_Output_AreaFraction8;
NiagaraScript_41_Func_(CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri0, NiagaraScript_41_Func_Output_AreaFraction8, Context);
float NiagaraScript_41_Func_Output_AreaFraction9;
NiagaraScript_41_Func_(CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri1, NiagaraScript_41_Func_Output_AreaFraction9, Context);
float NiagaraScript_41_Func_Output_AreaFraction10;
NiagaraScript_41_Func_(CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri2, NiagaraScript_41_Func_Output_AreaFraction10, Context);
float NiagaraScript_41_Func_Output_AreaFraction11;
NiagaraScript_41_Func_(CustomHlslC135742A3E56022EFE758D4B170808EA1BB5F1BA_Func_Output_Tri3, NiagaraScript_41_Func_Output_AreaFraction11, Context);
float CustomHlsl6DB7854ACE1F43028B4FF45E0A14062252D5F112_Func_Output_Avg;
CustomHlsl6DB7854ACE1F43028B4FF45E0A14062252D5F112_Func_(NiagaraScript_41_Func_Output_AreaFraction8, NiagaraScript_41_Func_Output_AreaFraction9, NiagaraScript_41_Func_Output_AreaFraction10, NiagaraScript_41_Func_Output_AreaFraction11, CustomHlsl6DB7854ACE1F43028B4FF45E0A14062252D5F112_Func_Output_Avg);
float3 Output112;
Output112.x = CustomHlsl0E05D7E99FF6BAB34C889B91ACCD95CB24F67427_Func_Output_Avg;
Output112.y = CustomHlslE8233762C7707F02B558F32A894DD7BDA337854B_Func_Output_Avg;
Output112.z = CustomHlsl6DB7854ACE1F43028B4FF45E0A14062252D5F112_Func_Output_Avg;
Out_FaceFractions = Output112;
    In_theta_ppp < 1e-20 && 
    In_theta_ppn < 1e-20 && 
    In_theta_pnn < 1e-20 && 
    In_theta_pnp < 1e-20 && 
    In_theta_nnp < 1e-20 && 
    In_theta_npp < 1e-20 && 
    In_theta_npn < 1e-20 && 
    In_theta_nnn < 1e-20;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1);
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppp;
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppn;
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnn;
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnp;
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_nnp;
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npp;
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npn;
float CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_nnn;
float3 CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, In_dt, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_AverageSolidVelocity);
float3 NiagaraScript_40_Func_Output_FaceFractions;
NiagaraScript_40_Func_(CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npn, NiagaraScript_40_Func_Output_FaceFractions, Context);
float X5;
float Y5;
float Z5;
X5 = NiagaraScript_40_Func_Output_FaceFractions.x;
Y5 = NiagaraScript_40_Func_Output_FaceFractions.y;
Z5 = NiagaraScript_40_Func_Output_FaceFractions.z;
bool CustomHlsl00144804B9BD6219EB77F2E9A444FDD2C2956DB71DC_Func_Output_IsFullyInsideBoundary;
CustomHlsl00144804B9BD6219EB77F2E9A444FDD2C2956DB71DC_Func_(CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npp, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_npn, CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl00144804B9BD6219EB77F2E9A444FDD2C2956DB71DC_Func_Output_IsFullyInsideBoundary);
Out_XFace = X5;
Out_YFace = Y5;
Out_ZFace = Z5;
Out_IsFullyInsideBoundary = CustomHlsl00144804B9BD6219EB77F2E9A444FDD2C2956DB71DC_Func_Output_IsFullyInsideBoundary;
Out_SolidVelocity = CustomHlslB5A8FE6305E02F4FDCCDF9292F9BA83791654002Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
Out_FaceFraction.x = In_Face.x > 1e-20 ? max(In_Face.x, In_MinFaceFraction) : 0;
Out_FaceFraction.y = In_Face.y > 1e-20 ? max(In_Face.y, In_MinFaceFraction) : 0;
Out_FaceFraction.z = In_Face.z > 1e-20 ? max(In_Face.z, In_MinFaceFraction) : 0;
Out_FaceFraction = saturate(Out_FaceFraction);
float3 ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
ExecutionIndexToUnit_Emitter_TransientGrid(ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit);
float3 Constant163 = float3(0,0,0);
float3 Output111;
Output111.x = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.x;
Output111.y = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.y;
Output111.z = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.z;
float3 Result118 = mul(float4(Output111,1.0),Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld).xyz;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.UnitPosition = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Constant163;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.WorldPos = Result118;
float Constant164 = 0.0001;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
bool Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary;
float3 Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.dt, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity, Context);
float3 Output113;
Output113.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output113.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output113.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
float3 CustomHlsl3F15F1BEE9E1018158791E3FEA7ACBD1C47F9C32_Func_Output_FaceFraction;
CustomHlsl3F15F1BEE9E1018158791E3FEA7ACBD1C47F9C32_Func_(Output113, Constant164, CustomHlsl3F15F1BEE9E1018158791E3FEA7ACBD1C47F9C32_Func_Output_FaceFraction);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction = CustomHlsl3F15F1BEE9E1018158791E3FEA7ACBD1C47F9C32_Func_Output_FaceFraction;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
//SetConstantByStaticVariable "/Grid 3D Compute High Precision Boundary/Map Get/Map Get->Module.Use Free Surface"
int Constant165 = 1;
float Constant166 = 1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2);
int Constant167 = 2;
int GetNumCells_Emitter_TransientGridOutput_NumCellsX;
int GetNumCells_Emitter_TransientGridOutput_NumCellsY;
int GetNumCells_Emitter_TransientGridOutput_NumCellsZ;
GetNumCells_Emitter_TransientGrid(GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ);
float CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_Output_Boundary1;
CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, Constant167, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_Output_Boundary1);
float Constant168 = (0.0);
float NiagaraFloat_SelectResult4 = Constant168;
NiagaraFloat_SelectResult4 = Constant166;
NiagaraFloat_SelectResult4 = CustomHlslC81BD6A93221614C04BF9B5D1BF3F0049DDC8B3B_Func_Output_Boundary1;
float CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_Output_RetBoundary1;
CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_(NiagaraFloat_SelectResult4, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat, CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_Output_RetBoundary1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary = CustomHlsl28AE850CA098CE4C2685D32D4181FED42CC3B7C4_Func_Output_RetBoundary1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 002/Map Get/Map Get->Module.Enable"
int Constant169 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 002/Map Get/Map Get->Module.Attribute"
int Constant170 = 7;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3);
float X6;
float Y6;
float Z6;
X6 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.x;
Y6 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.y;
Z6 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.z;
float4 Output114;
Output114.x = X6;
Output114.y = Y6;
Output114.z = Z6;
Output114.w = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3, Output114);
//SetConstantByStaticVariable "/Scratch Module 02/Map Get/Map Get->Module.Use High Precision Collisions"
int Constant171 = 1;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_FaceGrid(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ);
SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.ScratchModule_02.FaceVals);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Enable"
int Constant172 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample To Another Grid"
int Constant173 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant174 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Logic OR (Static)/Logic OR (Static)->Result"
int Constant175 = 0;
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Resample = Constant175;
int Constant176 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Local.Module.Resample"
int Constant177 = 0;
float3 Constant178 = float3(0,0,0);
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Unit = Constant178;
int Constant179 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Attribute"
int Constant180 = 7;
int Constant181 = 0;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float3 Output115;
Output115.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Output115.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Output115.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Output116;
Output116 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity = Output115;
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary = Output116;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Write To Transient"
int Constant182 = 1;
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
            else
                TmpVelocity = float3(0,0,0);
    if (TotalWeight > 1e-5)
        Out_OutVelocity /= TotalWeight;
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant185 = 1;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ);
int Constant186 = 1;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlsl245967361B3F4AA2C7481E9D05056D6226AD1B7AEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl245967361B3F4AA2C7481E9D05056D6226AD1B7AEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant186, Context.MapSimStage7_ExtrapolateVelocity.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl245967361B3F4AA2C7481E9D05056D6226AD1B7AEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlsl245967361B3F4AA2C7481E9D05056D6226AD1B7AEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid.Velocity = Context.MapSimStage7_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Enable"
int Constant187 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Attribute"
int Constant188 = 9;
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
float CustomHlsl43AFB04F65C84037F8B6FE73FBC69EDF30E4BA1AEmitter_SimGrid_Func_Output_Div;
CustomHlsl43AFB04F65C84037F8B6FE73FBC69EDF30E4BA1AEmitter_SimGrid_Func_(Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl43AFB04F65C84037F8B6FE73FBC69EDF30E4BA1AEmitter_SimGrid_Func_Output_Div);
Context.MapSimStage8_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl43AFB04F65C84037F8B6FE73FBC69EDF30E4BA1AEmitter_SimGrid_Func_Output_Div;
float Constant190 = 0;
Context.MapSimStage8_ComputeDivergence.Emitter.PressureGrid.Pressure = Constant190;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Enable"
int Constant191 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant192 = 3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Enable"
int Constant193 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample To Another Grid"
int Constant194 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant195 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Logic OR (Static)/Logic OR (Static)->Result"
int Constant196 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Resample = Constant196;
int Constant197 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Local.Module.Resample"
int Constant198 = 0;
float3 Constant199 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Unit = Constant199;
int Constant200 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Attribute"
int Constant201 = 3;
int Constant202 = 0;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Write To Transient"
int Constant203 = 1;
Context.MapSimStage9_SolvePressure.Transient.SimFloat = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Enable"
int Constant204 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample To Another Grid"
int Constant205 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant206 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Logic OR (Static)/Logic OR (Static)->Result"
int Constant207 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Resample = Constant207;
int Constant208 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Local.Module.Resample"
int Constant209 = 0;
float3 Constant210 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Unit = Constant210;
int Constant211 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Attribute"
int Constant212 = 4;
int Constant213 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Write To Transient"
int Constant214 = 1;
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
int CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_IterationIndex;
int CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_MaxIterations;
float CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NormalizedIterationIndex;
int CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_LoopIndex;
int CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NumberOfLoops;
float CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NormalizedLoopIndex;
CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_(CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_IterationIndex, CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_MaxIterations, CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NormalizedIterationIndex, CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_LoopIndex, CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NumberOfLoops, CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NormalizedLoopIndex);
Out_IterationIndex = CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_IterationIndex;
Out_MaxIterations = CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_MaxIterations;
Out_NormalizedIterationIndex = CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NormalizedIterationIndex;
Out_LoopIndex = CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_LoopIndex;
Out_NumberOfLoops = CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlsl0F9200FA6434BDBCD29550B680AF3248E2DD33CA_Func_Output_NormalizedLoopIndex;
Out_OutFloat = saturate (In_InFloat);
float CustomHlsl9824AA6B2373EB4CFDBC43EDB04824CCFE1F4EBF_Func_Output_OutFloat;
CustomHlsl9824AA6B2373EB4CFDBC43EDB04824CCFE1F4EBF_Func_(In_Value, CustomHlsl9824AA6B2373EB4CFDBC43EDB04824CCFE1F4EBF_Func_Output_OutFloat);
Out_ClampedValue = CustomHlsl9824AA6B2373EB4CFDBC43EDB04824CCFE1F4EBF_Func_Output_OutFloat;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
const int FLUID_CELL = 0;
const int SOLID_CELL = 1;
const int EMPTY_CELL = 2;
Out_F_right = round(In_B_right.w) == SOLID_CELL ? 1 : 0;
Out_F_left = round(In_B_left.w) == SOLID_CELL ? 1 : 0;
Out_F_up = round(In_B_up.w) == SOLID_CELL ? 1 : 0;
Out_F_down = round(In_B_down.w) == SOLID_CELL ? 1 : 0;
Out_F_front = round(In_B_front.w) == SOLID_CELL ? 1 : 0;
Out_F_back = round(In_B_back.w) == SOLID_CELL ? 1 : 0;
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
int Constant216 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4);
int NiagaraScript_18_Func_Output_IterationIndex;
int NiagaraScript_18_Func_Output_MaxIterations;
float NiagaraScript_18_Func_Output_NormalizedIterationIndex;
int NiagaraScript_18_Func_Output_LoopIndex;
int NiagaraScript_18_Func_Output_NumberOfLoops;
float NiagaraScript_18_Func_Output_NormalizedLoopIndex;
NiagaraScript_18_Func_(NiagaraScript_18_Func_Output_IterationIndex, NiagaraScript_18_Func_Output_MaxIterations, NiagaraScript_18_Func_Output_NormalizedIterationIndex, NiagaraScript_18_Func_Output_LoopIndex, NiagaraScript_18_Func_Output_NumberOfLoops, NiagaraScript_18_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_19_Particle_Func_Output_ClampedValue;
NiagaraScript_19_Particle_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Relaxation, NiagaraScript_19_Particle_Func_Output_ClampedValue, Context);
float4 CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_right;
float4 CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_left;
float4 CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_up;
float4 CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_down;
float4 CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_front;
float4 CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_back;
CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_right, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_left, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_up, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_down, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_front, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_back);
float CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_right;
float CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_left;
float CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_up;
float CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_down;
float CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_front;
float CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_back;
CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_(CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_right, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_left, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_up, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_down, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_front, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_back, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_right, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_left, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_up, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_down, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_front, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_back);
float CustomHlsl247FEE33B7F615FABC30A091D92871D8B3331F8CEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
CustomHlsl247FEE33B7F615FABC30A091D92871D8B3331F8CEmitter_PressureGridEmitter_TransientGrid_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence, NiagaraScript_18_Func_Output_IterationIndex, NiagaraScript_19_Particle_Func_Output_ClampedValue, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_right, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_left, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_up, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_down, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_front, CustomHlsl50C38415C0994C2D849F587AADF90BCFF8742A45_Func_Output_F_back, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_right, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_left, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_up, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_down, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_front, CustomHlsl9F4657E0193ABBA7D85FE4A3FE2489E2CC65C09EEmitter_TransientGrid_Func_Output_B_back, CustomHlsl247FEE33B7F615FABC30A091D92871D8B3331F8CEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlsl247FEE33B7F615FABC30A091D92871D8B3331F8CEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
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
float3 CustomHlslC1BBB2AD7FD3C2CFBC6D9EFD9482C1AC1C3687BFEmitter_PressureGrid_Func_Output_Grad;
CustomHlslC1BBB2AD7FD3C2CFBC6D9EFD9482C1AC1C3687BFEmitter_PressureGrid_Func_(Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex, CustomHlslC1BBB2AD7FD3C2CFBC6D9EFD9482C1AC1C3687BFEmitter_PressureGrid_Func_Output_Grad);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlslC1BBB2AD7FD3C2CFBC6D9EFD9482C1AC1C3687BFEmitter_PressureGrid_Func_Output_Grad;
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
int Constant218 = 0;
float3 Result119 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient * Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt;
float3 Result120 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity - Result119;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5);
float4 CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_back;
CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_right, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_left, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_up, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_down, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_front, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_back);
float CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_right;
float CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_left;
float CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_up;
float CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_down;
float CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_front;
float CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_back;
CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_(CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_right, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_left, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_up, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_down, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_front, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_back, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_right, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_left, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_up, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_down, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_front, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_back);
float3 CustomHlsl8A01E1672FB0317CBD14BBB6CEFAF8A6B41DB709Emitter_TransientGrid_Func_Output_VelocityOut;
CustomHlsl8A01E1672FB0317CBD14BBB6CEFAF8A6B41DB709Emitter_TransientGrid_Func_(Result120, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_right, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_left, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_up, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_down, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_front, CustomHlslA6017C07D57B55FACEA427533AAB47A3A6F6329B_Func_Output_F_back, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_right, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_left, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_up, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_down, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_front, CustomHlslD15156D97CC873F187E8BDAF26C348DA8DE9CD97Emitter_TransientGrid_Func_Output_B_back, CustomHlsl8A01E1672FB0317CBD14BBB6CEFAF8A6B41DB709Emitter_TransientGrid_Func_Output_VelocityOut);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlsl8A01E1672FB0317CBD14BBB6CEFAF8A6B41DB709Emitter_TransientGrid_Func_Output_VelocityOut;
Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage10_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Enable"
int Constant219 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample To Another Grid"
int Constant220 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant221 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Logic OR (Static)/Logic OR (Static)->Result"
int Constant222 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Resample = Constant222;
int Constant223 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Local.Module.Resample"
int Constant224 = 0;
float3 Constant225 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Unit = Constant225;
int Constant226 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Attribute"
int Constant227 = 7;
int Constant228 = 0;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY5;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ5;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ5);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ5, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1);
float3 Output117;
Output117.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.x;
Output117.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.y;
Output117.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.z;
float Output118;
Output118 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.w;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity = Output117;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary = Output118;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Write To Transient"
int Constant229 = 1;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.SolidVelocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Enable"
int Constant230 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample To Another Grid"
int Constant231 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant232 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Logic OR (Static)/Logic OR (Static)->Result"
int Constant233 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Resample = Constant233;
int Constant234 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Local.Module.Resample"
int Constant235 = 0;
float3 Constant236 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Unit = Constant236;
int Constant237 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Attribute"
int Constant238 = 4;
int Constant239 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Write To Transient"
int Constant240 = 1;
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
int Constant242 = 0;
int GetNumCells_Emitter_SimGridOutput_NumCellsX2;
int GetNumCells_Emitter_SimGridOutput_NumCellsY2;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ2;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX2, GetNumCells_Emitter_SimGridOutput_NumCellsY2, GetNumCells_Emitter_SimGridOutput_NumCellsZ2);
bool CustomHlsl24B08C6CAAD8C0E8FC33894FD9192D40F00FFF2E_Func_Output_Execute;
CustomHlsl24B08C6CAAD8C0E8FC33894FD9192D40F00FFF2E_Func_(Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexX, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexY, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexZ, Constant242, GetNumCells_Emitter_SimGridOutput_NumCellsX2, GetNumCells_Emitter_SimGridOutput_NumCellsY2, GetNumCells_Emitter_SimGridOutput_NumCellsZ2, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.IndexX, GetNumCells_Emitter_SimGridOutput_NumCellsX2, CustomHlsl24B08C6CAAD8C0E8FC33894FD9192D40F00FFF2E_Func_Output_Execute);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_Visualize_VectorField.Drawable = CustomHlsl24B08C6CAAD8C0E8FC33894FD9192D40F00FFF2E_Func_Output_Execute;
//SetConstantByStaticVariable "/Grid 3D Visualize Vector Field/Map Get/Map Get->Module.Draw Visualizer"
int Constant243 = 0;
Out_OutVelocity = In_Velocity;
            GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);
            Out_OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity 001/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant245 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX8;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY8;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ8;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ8);
int Constant246 = 1;
int GetNumCells_Emitter_SimGridOutput_NumCellsX3;
int GetNumCells_Emitter_SimGridOutput_NumCellsY3;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ3;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX3, GetNumCells_Emitter_SimGridOutput_NumCellsY3, GetNumCells_Emitter_SimGridOutput_NumCellsZ3);
float3 CustomHlslD0DC9D50C7BB9E39F190452FC3913CE3384F160BEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlslD0DC9D50C7BB9E39F190452FC3913CE3384F160BEmitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY8, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ8, Constant246, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX3, GetNumCells_Emitter_SimGridOutput_NumCellsY3, GetNumCells_Emitter_SimGridOutput_NumCellsZ3, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlslD0DC9D50C7BB9E39F190452FC3913CE3384F160BEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlslD0DC9D50C7BB9E39F190452FC3913CE3384F160BEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
int Constant252 = 0;
bool Result121 = NiagaraAll(In_SourceSpace == Constant252);
int Constant253 = 0;
bool Result122 = NiagaraAll(In_DestinationSpace == Constant253);
bool Result123 = Result121 && Result122;
int Constant254 = 1;
bool Result124 = NiagaraAll(In_SourceSpace == Constant254);
int Constant255 = 1;
bool Result125 = NiagaraAll(In_DestinationSpace == Constant255);
bool Result126 = Result124 && Result125;
bool Result127 = Result123 || Result126;
int Constant256 = 2;
bool Result128 = NiagaraAll(In_SourceSpace == Constant256);
int Constant257 = 2;
bool Result129 = NiagaraAll(In_DestinationSpace == Constant257);
bool Result130 = Result128 && Result129;
bool Result131 = Result127 || Result130;
bool Result132 = Result121 && Result129;
bool Result133 = Result128 && Result122;
bool Result134 = Result132 || Result133;
bool Result135 = In_bLocalSpace && Result134;
bool Result136 = Result131 || Result135;
bool Result137 = !In_bLocalSpace;
bool Result138 = Result121 && Result125;
bool Result139 = Result124 && Result122;
bool Result140 = Result138 || Result139;
bool Result141 = Result137 && Result140;
bool Result142 = Result136 || Result141;
bool Result143 = In_bLocalSpace && Result138;
bool Result144 = Result128 && Result125;
bool Result145 = Result143 || Result144;
bool Result146 = Result137 && Result133;
bool Result147 = Result145 || Result146;
float4x4 Matrix_IfResult6;
Matrix_IfResult6 = In_LocalToWorldTransform;
Matrix_IfResult6 = In_WorldToLocalTransform;
Out_bUseOriginal = Result142;
Out_OutTransform = Matrix_IfResult6;
Out_LocalToWorld = Result147;
bool Constant251 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult3;
Matrix_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_10_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_10_Func_Output_OutTransform3;
bool NiagaraScript_10_Func_Output_LocalToWorld3;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult3, Constant251, NiagaraScript_10_Func_Output_bUseOriginal3, NiagaraScript_10_Func_Output_OutTransform3, NiagaraScript_10_Func_Output_LocalToWorld3, Context);
float3 Result148 = mul(float4(In_InPosition,1.0),NiagaraScript_10_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InPosition;
Vector_IfResult3 = Result148;
Out_OutPosition = Vector_IfResult3;
Out_IsInside = round(In_Mask) ==2;
  In_UnitPos.z >= 0 && In_UnitPos.x <= 1 && 
In_UnitPos.y <= 1 && In_UnitPos.z <= 1;
Out_IsInside = In_Mask > 1e-7;
Out_IsInside = round(In_Mask) == 1;
bool Constant262 = false;
float4x4 Matrix_IfResult7;
float4x4 Matrix001_IfResult4;
Matrix_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_10_Func_Output_bUseOriginal4;
float4x4 NiagaraScript_10_Func_Output_OutTransform4;
bool NiagaraScript_10_Func_Output_LocalToWorld4;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult7, Matrix001_IfResult4, Constant262, NiagaraScript_10_Func_Output_bUseOriginal4, NiagaraScript_10_Func_Output_OutTransform4, NiagaraScript_10_Func_Output_LocalToWorld4, Context);
float3 Result159 = mul(float4(In_InPosition,1.0),NiagaraScript_10_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InPosition;
Vector_IfResult4 = Result159;
Out_OutPosition = Vector_IfResult4;
bool Constant266 = false;
float4x4 Matrix_IfResult8;
float4x4 Matrix001_IfResult5;
Matrix_IfResult8 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult8 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_10_Func_Output_bUseOriginal5;
float4x4 NiagaraScript_10_Func_Output_OutTransform5;
bool NiagaraScript_10_Func_Output_LocalToWorld5;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult8, Matrix001_IfResult5, Constant266, NiagaraScript_10_Func_Output_bUseOriginal5, NiagaraScript_10_Func_Output_OutTransform5, NiagaraScript_10_Func_Output_LocalToWorld5, Context);
float3 Result162 = mul(float4(In_InVector,0.0),NiagaraScript_10_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InVector;
Vector_IfResult5 = Result162;
Out_OutVector = Vector_IfResult5;
bool Constant270 = false;
float4x4 Matrix_IfResult9;
float4x4 Matrix001_IfResult6;
Matrix_IfResult9 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult9 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_10_Func_Output_bUseOriginal6;
float4x4 NiagaraScript_10_Func_Output_OutTransform6;
bool NiagaraScript_10_Func_Output_LocalToWorld6;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult9, Matrix001_IfResult6, Constant270, NiagaraScript_10_Func_Output_bUseOriginal6, NiagaraScript_10_Func_Output_OutTransform6, NiagaraScript_10_Func_Output_LocalToWorld6, Context);
float3 Result165 = mul(float4(In_InVector,0.0),NiagaraScript_10_Func_Output_OutTransform6).xyz;
float3 Vector_IfResult6;
Vector_IfResult6 = In_InVector;
Vector_IfResult6 = Result165;
Out_OutVector = Vector_IfResult6;
int Constant248 = 0;
int Constant249 = 1;
bool Constant250 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Position, Constant248, Constant249, Constant250, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Output119;
Output119.x = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.x;
Output119.y = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.y;
Output119.z = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.z;
float3 Result149 = mul(float4(((float3)Output119),1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TransientGridOutput_Index;
UnitToFloatIndex_Emitter_TransientGrid(Result149, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result150 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float X7;
float Y7;
float Z7;
X7 = Result150.x;
Y7 = Result150.y;
Z7 = Result150.z;
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(X7, Y7, Z7, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2);
float X8;
float Y8;
float Z8;
float W;
X8 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.x;
Y8 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.y;
Z8 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.z;
W = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.w;
bool CustomHlslD2F22EC6F3AC70E0DE5EB886564733D3BD049BAE_Func_Output_IsInside;
CustomHlslD2F22EC6F3AC70E0DE5EB886564733D3BD049BAE_Func_(W, CustomHlslD2F22EC6F3AC70E0DE5EB886564733D3BD049BAE_Func_Output_IsInside);
float3 Result151 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlsl361A845E91829398CAB8F1AEADDFB6E1F04E7FA9_Func_Output_ret;
CustomHlsl361A845E91829398CAB8F1AEADDFB6E1F04E7FA9_Func_(Result151, CustomHlsl361A845E91829398CAB8F1AEADDFB6E1F04E7FA9_Func_Output_ret);
bool CustomHlsl71F40B24D7F0E66EB0880944D0BDC81456ACD2DF_Func_Output_IsInside;
CustomHlsl71F40B24D7F0E66EB0880944D0BDC81456ACD2DF_Func_(CustomHlsl361A845E91829398CAB8F1AEADDFB6E1F04E7FA9_Func_Output_ret, CustomHlsl71F40B24D7F0E66EB0880944D0BDC81456ACD2DF_Func_Output_IsInside);
bool Result152 = !CustomHlsl71F40B24D7F0E66EB0880944D0BDC81456ACD2DF_Func_Output_IsInside;
bool Result153 = CustomHlslD2F22EC6F3AC70E0DE5EB886564733D3BD049BAE_Func_Output_IsInside || Result152;
float3 Result154 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result155 = Context.MapSimStage12_FLIP_PICforce.Particles.Position + Result154;
bool CustomHlsl346C47520DAD7AB0C9786B6D1DE898DFB02AAC34_Func_Output_IsInside;
CustomHlsl346C47520DAD7AB0C9786B6D1DE898DFB02AAC34_Func_(W, CustomHlsl346C47520DAD7AB0C9786B6D1DE898DFB02AAC34_Func_Output_IsInside);
float3 Constant258 = float3(0,0,0);
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(Result151, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result156 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result157 = Result156 * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result158 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result157;
int Constant259 = 1;
int Constant260 = 0;
bool Constant261 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result158, Constant259, Constant260, Constant261, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
float3 SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(Result151, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result160 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result161 = Result156 - Result160;
int Constant263 = 0;
int Constant264 = 1;
bool Constant265 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Velocity, Constant263, Constant264, Constant265, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result163 = Result161 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result164 = lerp(Result156,Result163,Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant267 = 1;
int Constant268 = 0;
bool Constant269 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result164, Constant267, Constant268, Constant269, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Constant271 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult5 = Constant271;
float3 Constant272 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult5 = Constant272;
Position_SelectResult5 = Context.MapSimStage12_FLIP_PICforce.Particles.Position;
Velocity_SelectResult5 = Constant258;
Position_SelectResult5 = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Velocity_SelectResult5 = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
float3 Constant273 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult6 = Constant273;
float3 Constant274 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult6 = Constant274;
Position_SelectResult6 = Result155;
Velocity_SelectResult6 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity;
Position_SelectResult6 = Position_SelectResult5;
Velocity_SelectResult6 = Velocity_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.Particles.Position = Position_SelectResult6;
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity = Velocity_SelectResult6;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl71F40B24D7F0E66EB0880944D0BDC81456ACD2DF_Func_Output_IsInside;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl346C47520DAD7AB0C9786B6D1DE898DFB02AAC34_Func_Output_IsInside;
bool Constant276 = false;
bool bool_IfResult1;
bool_IfResult1 = Constant276;
bool_IfResult1 = Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = bool_IfResult1;
int Constant290 = 0;
bool Result167 = NiagaraAll(In_SourceSpace == Constant290);
int Constant291 = 0;
bool Result168 = NiagaraAll(In_DestinationSpace == Constant291);
bool Result169 = Result167 && Result168;
int Constant292 = 1;
bool Result170 = NiagaraAll(In_SourceSpace == Constant292);
int Constant293 = 1;
bool Result171 = NiagaraAll(In_DestinationSpace == Constant293);
bool Result172 = Result170 && Result171;
bool Result173 = Result169 || Result172;
int Constant294 = 2;
bool Result174 = NiagaraAll(In_SourceSpace == Constant294);
int Constant295 = 2;
bool Result175 = NiagaraAll(In_DestinationSpace == Constant295);
bool Result176 = Result174 && Result175;
bool Result177 = Result173 || Result176;
bool Result178 = Result167 && Result175;
bool Result179 = Result174 && Result168;
bool Result180 = Result178 || Result179;
bool Result181 = In_bLocalSpace && Result180;
bool Result182 = Result177 || Result181;
bool Result183 = !In_bLocalSpace;
bool Result184 = Result167 && Result171;
bool Result185 = Result170 && Result168;
bool Result186 = Result184 || Result185;
bool Result187 = Result183 && Result186;
bool Result188 = Result182 || Result187;
bool Result189 = In_bLocalSpace && Result184;
bool Result190 = Result174 && Result171;
bool Result191 = Result189 || Result190;
bool Result192 = Result183 && Result179;
bool Result193 = Result191 || Result192;
float4x4 Matrix_IfResult10;
Matrix_IfResult10 = In_LocalToWorldTransform;
Matrix_IfResult10 = In_WorldToLocalTransform;
Out_bUseOriginal = Result188;
Out_OutTransform = Matrix_IfResult10;
Out_LocalToWorld = Result193;
float4x4 Constant287 = (float4x4)0;
float4x4 LocalToWorld_SelectResult7 = Constant287;
float4x4 Constant288 = (float4x4)0;
float4x4 WorldToLocal_SelectResult7 = Constant288;
LocalToWorld_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant289 = false;
bool NiagaraScript_10_Func_Output_bUseOriginal7;
float4x4 NiagaraScript_10_Func_Output_OutTransform7;
bool NiagaraScript_10_Func_Output_LocalToWorld7;
NiagaraScript_10_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult7, WorldToLocal_SelectResult7, Constant289, NiagaraScript_10_Func_Output_bUseOriginal7, NiagaraScript_10_Func_Output_OutTransform7, NiagaraScript_10_Func_Output_LocalToWorld7, Context);
float3 Result194 = mul(float4(In_Position,1.0),NiagaraScript_10_Func_Output_OutTransform7).xyz;
float3 Constant296 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult8 = Constant296;
NiagaraPosition_SelectResult8 = In_Position;
NiagaraPosition_SelectResult8 = Result194;
Out_Position = NiagaraPosition_SelectResult8;
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
int Constant278 = 0;
int Result166 = ExecIndex();
bool GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(Result166, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
int Constant279 = 2;
int Constant280 = 1;
bool Constant281 = false;
float4x4 Constant282 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant283 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant284 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant285 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant286 = false;
float3 NiagaraScript_33_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_33_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant279, Constant280, Constant281, Constant282, Constant283, Constant284, Constant285, NiagaraScript_33_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant297 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult9 = Constant297;
NiagaraPosition_SelectResult9 = NiagaraScript_33_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult9 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
bool GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid;
float2 GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(Result166, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 Result195 = mul(float4(NiagaraPosition_SelectResult9,1.0),Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
float3 Output120;
Output120.x = Result195.x;
Output120.y = Result195.y;
Output120.z = Result195.z;
float3 UnitToFloatIndex_Emitter_RasterizationGridOutput_Index;
UnitToFloatIndex_Emitter_RasterizationGrid(Output120, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlsl30658FC8961513D139CCB4F1EB64738FD6B53F73Emitter_RasterizationGrid_Func_(Output120, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
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
int Constant299 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 001/Map Get/Map Get->Module.Axis"
int Constant300 = 0;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX, GetNumCells_Emitter_KernelGridOutput_NumCellsY);
int Constant301 = 1;
int Result196 = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant301;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1);
float3 Constant302 = float3(1,0,0);
float CustomHlsl298C20453B040416B80FC2C9768A2277213B7652Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl298C20453B040416B80FC2C9768A2277213B7652Emitter_RasterizationGridEmitter_KernelGrid_Func_(Result196, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1, Constant302, Constant299, CustomHlsl298C20453B040416B80FC2C9768A2277213B7652Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlsl298C20453B040416B80FC2C9768A2277213B7652Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage14_SmoothinX.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
#if ((SimulationStageIndex == 15) || (SimulationStageIndex == 16)) // Multiple stages
  GetPreviousFloatValueAtIndex_Emitter_SDFGrid(CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
int Constant304 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis/Map Get/Map Get->Module.Axis"
int Constant305 = 1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY1;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX1, GetNumCells_Emitter_KernelGridOutput_NumCellsY1);
int Constant306 = 1;
int Result197 = GetNumCells_Emitter_KernelGridOutput_NumCellsX1 - Constant306;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant307 = float3(0,1,0);
float CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_(Result197, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant307, Constant304, CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage15_SmoothinY.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
int Constant309 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 002/Map Get/Map Get->Module.Axis"
int Constant310 = 2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY2;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX2, GetNumCells_Emitter_KernelGridOutput_NumCellsY2);
int Constant311 = 1;
int Result198 = GetNumCells_Emitter_KernelGridOutput_NumCellsX2 - Constant311;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ1;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1);
float3 Constant312 = float3(0,0,1);
float CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_(Result198, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1, GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1, Constant312, Constant309, CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1);
Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.Enable"
int Constant316 = 1;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.SetFromVector"
int Constant317 = 0;
float Constant318 = 0;
float Constant319 = 0;
float Constant320 = 0;
float4 Output121;
Output121.r = Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red;
Output121.g = Constant318;
Output121.b = Constant319;
Output121.a = Constant320;
Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value = Output121;
bool Constant321 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int Constant322 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant321, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
//Begin Spawn Script!
//Begin Initialize Parameter Map Defaults
float2 Constant = float2(0.0, 0.0);
Context.MapSpawn.Particles.SpriteSize = Constant;
float3 Constant1 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Velocity = Constant1;
//End Initialize Parameter Map Defaults
Context.MapSpawn.Vector2DFromFloat.Value = Context.MapSpawn.Emitter.dx;
float2 Vector2DFromFloat_Emitter_Func_Output_Vec2;
Vector2DFromFloat_Emitter_Func_(Vector2DFromFloat_Emitter_Func_Output_Vec2, Context);
Context.MapSpawn.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize = Vector2DFromFloat_Emitter_Func_Output_Vec2;
EnterStatScope(1 /**SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_*/);
SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_*/);
bool Constant2 = false;
Context.MapSpawn.SphereLocation.OverrideRandomness = Constant2;
int Constant3 = 0;
Context.MapSpawn.SphereLocation.RandomnessMode = Constant3;
bool Constant4 = false;
Context.MapSpawn.SphereLocation.OverrideSeed = Constant4;
int Constant5 = 0;
float Constant6 = 0;
float Constant7 = 50;
int Constant8 = 0;
Context.MapSpawn.SphereLocation.SurfaceExpansionMode = Constant8;
bool Constant9 = true;
Context.MapSpawn.SphereLocation.NormalizeThickness = Constant9;
bool Constant10 = false;
Context.MapSpawn.SphereLocation.FixedRandomSeed = Constant10;
bool Constant11 = false;
Context.MapSpawn.SphereLocation.HemisphereX = Constant11;
bool Constant12 = false;
Context.MapSpawn.SphereLocation.HemisphereY = Constant12;
bool Constant13 = false;
Context.MapSpawn.SphereLocation.HemisphereZ = Constant13;
float3 Constant14 = float3(1,1,1);
float3 SphereLocation_SimulationPosition_Emitter_Func_Output_OutPosition;
SphereLocation_SimulationPosition_Emitter_Func_(SphereLocation_SimulationPosition_Emitter_Func_Output_OutPosition, Context);
Context.MapSpawn.Particles.Position = SphereLocation_SimulationPosition_Emitter_Func_Output_OutPosition;
Context.MapSpawn.SphereLocation.SphereOrigin = Context.MapSpawn.Particles.Position;
float3 Constant15 = float3(0,0,300);
int Constant16 = 2;
Context.MapSpawn.SphereLocation.CoordinateSpace = Constant16;
int Constant17 = 0;
bool Constant18 = false;
EnterStatScope(2 /**SphereLocation_Emitter_Func_*/);
SphereLocation_Emitter_Func_(Context);
ExitStatScope(/**SphereLocation_Emitter_Func_*/);
float3 Constant57 = float3(150,0,0);
EnterStatScope(3 /**SetVariables_9467D3964304D77DD887728C19B28EE9_Emitter_Func_*/);
SetVariables_9467D3964304D77DD887728C19B28EE9_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9467D3964304D77DD887728C19B28EE9_Emitter_Func_*/);
Context.MapSpawn.ScratchModule_01.WorldToUnit = Context.MapSpawn.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit;
EnterStatScope(4 /**ScratchModule_01_Emitter_Func_*/);
ScratchModule_01_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_01_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use Landscape Collisions"
int Constant60 = 1;
Context.MapSpawn.Grid3D_Flip_GridParticles.dx = Context.MapSpawn.Emitter.dx;
Context.MapSpawn.Grid3D_Flip_GridParticles.UnitToWorld = Context.MapSpawn.Emitter.UnitToWorld;
Context.MapSpawn.Grid3D_Flip_GridParticles.WorldToUnit = Context.MapSpawn.Emitter.WorldToUnit;
Context.MapSpawn.Grid3D_Flip_GridParticles.SpawnedThisFrame = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame;
Context.MapSpawn.Grid3D_Flip_GridParticles.UseLandscape = Constant60;
Context.MapSpawn.Grid3D_Flip_GridParticles.ParticlesPerCell = Context.MapSpawn.Emitter.OVERRIDE.ParticlesPerCell;
Context.MapSpawn.Grid3D_Flip_GridParticles.WaterHeightZIndex = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex;
Context.MapSpawn.Grid3D_Flip_GridParticles.TotalEmissionCells = Context.MapSpawn.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells;
float Constant61 = 1;
float Constant62 = 1;
EnterStatScope(5 /**Grid3D_Flip_GridParticles_Emitter_Func_*/);
Grid3D_Flip_GridParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Flip_GridParticles_Emitter_Func_*/);
Context.MapSpawn.KillParticles001.KillParticles = Context.MapSpawn.Transient.Kill;
bool Constant84 = true;
Context.MapSpawn.DataInstance.Alive = Constant84;
EnterStatScope(6 /**KillParticles001_Emitter_Func_*/);
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
float3 Constant86 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant86;
float3 Constant87 = float3(0,0,-980);
EnterStatScope(7 /**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
//End Update Script!
//Begin Stage Script: MapSimStage1_BuildKernelArray!
Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius = Context.MapSimStage1_BuildKernelArray.Emitter.Grid3D_InitializeConvolutionKernel.Radius;
EnterStatScope(8 /**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
Grid3D_CreateConvolutionKernel_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage1_BuildKernelArray
//Begin Stage Script: MapSimStage2_InitTemporaryGrid!
float Constant90 = 0;
EnterStatScope(9 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage2_InitTemporaryGrid
//Begin Stage Script: MapSimStage3_InitializeStartVelocityGrid!
float3 Constant92 = float3(0,0,0);
EnterStatScope(10 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage3_InitializeStartVelocityGrid
//Begin Stage Script: MapSimStage4_RasterizeParticles!
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use Rasterization Grid For P2G"
int Constant94 = 1;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.VelocityIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToUnit;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToLocal;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_SimFloatIndex;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.UseRasterizationGrid = Constant94;
bool Constant95 = false;
EnterStatScope(11 /**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Grid3D_FLIP_RasterizeParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage4_RasterizeParticles
//Begin Stage Script: MapSimStage5_ComputeBoundary!
EnterStatScope(12 /**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Grid3D_GetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.SimFloat;
EnterStatScope(13 /**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use High Precision Collisions"
int Constant122 = 0;
Context.MapSimStage5_ComputeBoundary.ScratchDynamicInput_01.UseHighPrecision = Constant122;
int Constant123 = 1;
float3 ScratchDynamicInput_01_Emitter_Func_Output_Output;
ScratchDynamicInput_01_Emitter_Func_(ScratchDynamicInput_01_Emitter_Func_Output_Output, Context);
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld = Context.MapSimStage5_ComputeBoundary.Emitter.UnitToWorld;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.dt = Context.MapSimStage5_ComputeBoundary.Emitter.DeltaTime;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.WorldToLocal = Context.MapSimStage5_ComputeBoundary.Emitter.WorldToLocal;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.CollisionVelocityMult;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UseLandscapeCollisions = Constant123;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OffsetSamplePosition = ScratchDynamicInput_01_Emitter_Func_Output_Output;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
EnterStatScope(14 /**Grid3D_ComputeBoundary_Emitter_Func_*/);
Grid3D_ComputeBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeBoundary_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Not Use High Precision Collisions"
int Constant146 = 1;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.Boundary;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Enable = Constant146;
EnterStatScope(15 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Grid3D_SetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
int Constant149 = 0;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute003.Enable = Constant149;
EnterStatScope(16 /**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
Grid3D_SetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage5_ComputeBoundary
//Begin Stage Script: MapSimStage6_ComputeBoundaryHighPrecision2!
EnterStatScope(17 /**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Grid3D_GetFluidAttribute006_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.UnitToWorld;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.dt = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.dt;
float Constant162 = 0.0001;
EnterStatScope(18 /**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.Boundary = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity;
EnterStatScope(19 /**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Grid3D_SetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.ScratchModule_02.FaceVals = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction;
EnterStatScope(20 /**ScratchModule_02_Emitter_Func_*/);
ScratchModule_02_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_02_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage6_ComputeBoundaryHighPrecision2
//Begin Stage Script: MapSimStage7_ExtrapolateVelocity!
EnterStatScope(21 /**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Grid3D_GetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
EnterStatScope(22 /**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
int Constant183 = 1;
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.VelocityIndex = Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex = Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_SimFloatIndex;
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.UseRasterizationGrid = Constant183;
int Constant184 = 1;
EnterStatScope(23 /**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(24 /**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_SetFluidAttribute001.StartVelocity = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(25 /**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
Grid3D_SetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage7_ExtrapolateVelocity
//Begin Stage Script: MapSimStage8_ComputeDivergence!
Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.dx = Context.MapSimStage8_ComputeDivergence.Emitter.dx;
Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex = Context.MapSimStage8_ComputeDivergence.Emitter.SimGrid_VelocityIndex;
EnterStatScope(26 /**Grid3D_ComputeDivergence_Emitter_Func_*/);
Grid3D_ComputeDivergence_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeDivergence_Emitter_Func_*/);
float Constant189 = 0;
EnterStatScope(27 /**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
Context.MapSimStage8_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat = Context.MapSimStage8_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div;
EnterStatScope(28 /**Grid3D_SetFluidAttribute_Emitter_Func_*/);
Grid3D_SetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage8_ComputeDivergence
//Begin Stage Script: MapSimStage9_SolvePressure!
EnterStatScope(29 /**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
Grid3D_GetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(30 /**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Grid3D_GetFluidAttribute005_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
int Constant215 = 0;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx = Context.MapSimStage9_SolvePressure.Emitter.dx;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt = Context.MapSimStage9_SolvePressure.Emitter.DeltaTime;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure = Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.UseHighPrecisionCollisions = Constant215;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Relaxation = Context.MapSimStage9_SolvePressure.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation;
EnterStatScope(31 /**Grid3D_PressureIteration_Emitter_Func_*/);
Grid3D_PressureIteration_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_PressureIteration_Emitter_Func_*/);
Context.MapSimStage9_SolvePressure.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure;
EnterStatScope(32 /**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage9_SolvePressure
//Begin Stage Script: MapSimStage10_ProjectPressure!
Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.dx = Context.MapSimStage10_ProjectPressure.Emitter.dx;
Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex = Context.MapSimStage10_ProjectPressure.Emitter.SimGrid_PressureIndex;
EnterStatScope(33 /**Grid3D_ComputeGradient_Emitter_Func_*/);
Grid3D_ComputeGradient_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeGradient_Emitter_Func_*/);
int Constant217 = 0;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient = Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt = Context.MapSimStage10_ProjectPressure.Emitter.DeltaTime;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity = Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.UseHighPrecisionCollisions = Constant217;
EnterStatScope(34 /**Grid3D_ProjectPressure_Emitter_Func_*/);
Grid3D_ProjectPressure_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ProjectPressure_Emitter_Func_*/);
Context.MapSimStage10_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity = Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity;
EnterStatScope(35 /**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage10_ProjectPressure
//Begin Stage Script: MapSimStage11_ExtrapolateVelocitiesAgain!
EnterStatScope(36 /**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
Grid3D_GetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
EnterStatScope(37 /**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Grid3D_GetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
EnterStatScope(38 /**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_Visualize_VectorField.UnitToWorld = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.UnitToWorld;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_Visualize_VectorField.VectorValue = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity;
int Constant241 = 0;
EnterStatScope(39 /**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Grid3D_Visualize_VectorField_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_BoundaryIndex;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_VelocityIndex;
int Constant244 = 1;
EnterStatScope(40 /**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity;
EnterStatScope(41 /**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage11_ExtrapolateVelocitiesAgain
//Begin Stage Script: MapSimStage12_FLIP_PICforce!
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.MapSimStage12_FLIP_PICforce.Emitter.LocalToWorld;
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.MapSimStage12_FLIP_PICforce.Emitter.WorldToUnit;
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip = Context.MapSimStage12_FLIP_PICforce.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio;
bool Constant247 = false;
EnterStatScope(42 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.MapSimStage12_FLIP_PICforce.KillParticles.KillParticles = Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant275 = true;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = Constant275;
EnterStatScope(43 /**KillParticles_Emitter_Func_*/);
KillParticles_Emitter_Func_(Context);
ExitStatScope(/**KillParticles_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage12_FLIP_PICforce
//Begin Stage Script: MapSimStage13_FillRasterizationGrid!
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.dx;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit = Context.MapSimStage13_FillRasterizationGrid.Emitter.WorldToUnit;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult = Context.MapSimStage13_FillRasterizationGrid.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult;
bool Constant277 = false;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant277;
EnterStatScope(44 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
RasterizationGrid_ParticleSource_Emitter_Func_(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_FillRasterizationGrid
//Begin Stage Script: MapSimStage14_SmoothinX!
int Constant298 = 0;
EnterStatScope(45 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Grid3D_ConvolveAxis001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(46 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_SmoothinX
//Begin Stage Script: MapSimStage15_SmoothinY!
int Constant303 = 0;
EnterStatScope(47 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Grid3D_ConvolveAxis_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(48 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage15_SmoothinY
//Begin Stage Script: MapSimStage16_SmoothinZandOutput!
int Constant308 = 0;
EnterStatScope(49 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Grid3D_ConvolveAxis002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red = Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
float Constant313 = 0;
float Constant314 = 0;
float Constant315 = 0;
EnterStatScope(50 /**Grid3D_SetRTValues_Emitter_Func_*/);
Grid3D_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage16_SmoothinZandOutput
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
// Copyright Epic Games, Inc. All Rights Reserved.
int3 TotalDim = Emitter_SDFGrid_NumCells * Emitter_SDFGrid_NumTiles;
float3 GridPos = float3(TotalDim[0] * UVW[0] - 0.5,  TotalDim[1] * UVW[1] - 0.5, TotalDim[2] * UVW[2] - 0.5f);
int3 GridCell = floor(GridPos);
float3 delta = float3( GridPos[0] - GridCell[0], GridPos[1] - GridCell[1], GridPos[2] - GridCell[2]);
// local values
float4 F; 
// bottom face
F[0] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
// bottom value
float BV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// top face
F[0] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_SDFGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
// top value
float TV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// interp between bottom and top
return TV * delta.z + BV * (1.-delta.z);
// identify the lower-left-hand corner of the cell
int3 LocalCell = GridCell % Emitter_SDFGrid_NumCells;
const int3 MaxCell = Emitter_SDFGrid_NumCells - int3(2,2,2);
// revert to trilinear hardware sampling at the boundary cells.
return Emitter_SDFGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
// sample point offset from lower left
float t = 1. + delta.x;
float u = 1. + delta.y;
float v = 1. + delta.z;
float4x1 DataInZ;
float1 minv = 3.402823466e+38;
float1 maxv = -3.402823466e+38;
for (int zk = 0; zk < 4; zk++)
int plane = GridCell[2] + zk -1;
float4x1  DataInY;
for (int yj = 0; yj < 4; yj++)
float4x1 DataInX;
int row = GridCell[1] + yj - 1;
for(int xi = 0; xi < 4; xi++)
int col = GridCell[0] + xi - 1;
DataInX[xi] = Emitter_SDFGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
minv = min(DataInX[xi], minv);
maxv = max(DataInX[xi], maxv);
// coefficients
float1 Cx0 =   6.f * DataInX[0];
float1 Cx1 = -11.f * DataInX[0] + 18.f * DataInX[1] - 9.f * DataInX[2] + 2.f * DataInX[3];
float1 Cx2 =   6.f * DataInX[0] - 15.f * DataInX[1] +12.f * DataInX[2] - 3.f * DataInX[3];
float1 Cx3 =        -DataInX[0] +  3.f * DataInX[1] - 3.f * DataInX[2] +       DataInX[3];
DataInY[yj] = (1.f/6.f) * (Cx0 + t * ( Cx1 +  t * ( Cx2 + t * Cx3 ) ));
float1 Cy0 =   6.f * DataInY[0];
float1 Cy1 = -11.f * DataInY[0] + 18.f * DataInY[1] - 9.f * DataInY[2] + 2.f * DataInY[3];
float1 Cy2 =   6.f * DataInY[0] - 15.f * DataInY[1] +12.f * DataInY[2] - 3.f * DataInY[3];
float1 Cy3 =        -DataInY[0] +  3.f * DataInY[1] - 3.f * DataInY[2] +       DataInY[3];
DataInZ[zk] = (1.f/6.f) * (Cy0 + u * ( Cy1 +  u * ( Cy2 + u * Cy3 ) ));
float1 Cz0 =   6.f * DataInZ[0];
float1 Cz1 = -11.f * DataInZ[0] + 18.f * DataInZ[1] - 9.f * DataInZ[2] + 2.f * DataInZ[3];
float1 Cz2 =   6.f * DataInZ[0] - 15.f * DataInZ[1] +12.f * DataInZ[2] - 3.f * DataInZ[3];
float1 Cz3 =        -DataInZ[0] +  3.f * DataInZ[1] - 3.f * DataInZ[2] +       DataInZ[3];
float1 TriCubicValue = (1.f/6.f) * (Cz0 + v * ( Cz1 +  v * ( Cz2 + v * Cz3 ) ));
// for the fluid sims, a nice look can be achieved with BlendAmount = 0.25f;
// float BlendAmount = 0.0f;
// return lerp(TriCubicValue, TriLinearValue, BlendAmount);
return  min(max(TriCubicValue, minv), maxv);
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
int3 TotalDim = Emitter_SimGrid_NumCells * Emitter_SimGrid_NumTiles;
F[0] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_SimGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_SimGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_SimGrid_NumCells;
const int3 MaxCell = Emitter_SimGrid_NumCells - int3(2,2,2);
return Emitter_SimGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
float4x3 DataInZ;
float3 minv = 3.402823466e+38;
float3 maxv = -3.402823466e+38;
float4x3  DataInY;
float4x3 DataInX;
DataInX[xi] = Emitter_SimGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
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
DataInX[xi] = Emitter_TemporaryGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
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
Emitter_RasterizationGrid_ParticleSource_Reader_AttributeCompressed[1];// Copyright Epic Games, Inc. All Rights Reserved.
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
Value = Emitter_SDFGrid_Grid.SampleLevel(Emitter_SDFGrid_GridSampler, Unit, 0).r;
Out_IndexX = GDispatchThreadId.x;
Out_IndexY = GDispatchThreadId.y;
Out_IndexZ = GDispatchThreadId.z;
const uint Linear = GLinearThreadId;
Out_IndexX = Linear % Emitter_SDFGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_SDFGrid_NumCells.x) % Emitter_SDFGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_SDFGrid_NumCells.x * Emitter_SDFGrid_NumCells.y);
Emitter_SDFGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].r = Value;
Out_NumCellsX = Emitter_SDFGrid_NumCells.x;
Out_NumCellsY = Emitter_SDFGrid_NumCells.y;
Out_NumCellsZ = Emitter_SDFGrid_NumCells.z;
Value = Emitter_SDFGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).r;
Out_NumCellsX = Emitter_SimGrid_NumCells.x;
Out_NumCellsY = Emitter_SimGrid_NumCells.y;
Out_NumCellsZ = Emitter_SimGrid_NumCells.z;
Out_IndexX = In_Linear % Emitter_SimGrid_NumCells.x;
Out_IndexY = (In_Linear / Emitter_SimGrid_NumCells.x) % Emitter_SimGrid_NumCells.y;
Out_IndexZ = In_Linear / (Emitter_SimGrid_NumCells.x * Emitter_SimGrid_NumCells.y);
Out_Unit = (float3(In_IndexX, In_IndexY, In_IndexZ) + .5) * Emitter_SimGrid_UnitToUV;
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
Out_IndexX = Linear % Emitter_TransientGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_TransientGrid_NumCells.x) % Emitter_TransientGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_TransientGrid_NumCells.x * Emitter_TransientGrid_NumCells.y);
Emitter_TransientGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].rgba = Value;
Out_Unit = (float3(GDispatchThreadId.x, GDispatchThreadId.y, GDispatchThreadId.z) + .5) / Emitter_TransientGrid_NumCells;
const uint IndexX = Linear % Emitter_TransientGrid_NumCells.x;
const uint IndexY = (Linear / Emitter_TransientGrid_NumCells.x) % Emitter_TransientGrid_NumCells.y;
const uint IndexZ = Linear / (Emitter_TransientGrid_NumCells.x * Emitter_TransientGrid_NumCells.y);
Out_Unit = (float3(IndexX, IndexY, IndexZ) + .5) / Emitter_TransientGrid_NumCells;
Value = Emitter_TransientGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgba;
Out_NumCellsX = Emitter_TransientGrid_NumCells.x;
Out_NumCellsY = Emitter_TransientGrid_NumCells.y;
Out_NumCellsZ = Emitter_TransientGrid_NumCells.z;
Out_Index = In_Unit * Emitter_TransientGrid_NumCells - .5;
Out_IndexX = Linear % Emitter_FaceGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_FaceGrid_NumCells.x) % Emitter_FaceGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_FaceGrid_NumCells.x * Emitter_FaceGrid_NumCells.y);
Emitter_FaceGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].rgb = Value;
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
    if(RegisterIndex != -1 && ParticleIndex >= 0 && ParticleIndex < NumParticles)
        Out_Valid = true;
        BRANCH
        if (Emitter_RasterizationGrid_ParticleSource_Reader_AttributeCompressed[0].x)
                Out_Value.x = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputHalfBuffer[(RegisterIndex + 0)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.y = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputHalfBuffer[(RegisterIndex + 1)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideHalf + ParticleIndex]);
                Out_Value.z = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputHalfBuffer[(RegisterIndex + 2)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideHalf + ParticleIndex]);
        else
#endif //NIAGARA_COMPRESSED_ATTRIBUTES_ENABLED
                Out_Value.x = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputFloatBuffer[(RegisterIndex + 0)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideFloat + ParticleIndex]);
                Out_Value.y = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputFloatBuffer[(RegisterIndex + 1)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideFloat + ParticleIndex]);
                Out_Value.z = float(Emitter_RasterizationGrid_ParticleSource_Reader_InputFloatBuffer[(RegisterIndex + 2)*Emitter_RasterizationGrid_ParticleSource_Reader_ParticleStrideFloat + ParticleIndex]);
    else
        Out_Valid = false;
        Out_Value = (float3)0;
    int RegisterIndex = Emitter_RasterizationGrid_ParticleSource_Reader_AttributeIndices[0].y;
        if (Emitter_RasterizationGrid_ParticleSource_Reader_AttributeCompressed[0].y)
        Out_Value = (float2)0;
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
Context.MapSpawn.Engine.Owner.Position = Engine_Owner_Position;
Context.MapSpawn.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSpawn.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSpawn.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSpawn.Engine.System.TickCount = Engine_System_TickCount;
Context.MapSpawn.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit = System_Grid3D_CreateUnitToWorldTransform_WorldToUnit;
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
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(µ
_\õ=õ):;l˙<
;©spŸ4◊≈QìX&D
;©spŸ4◊≈QìX&U
ñ6sôRsHüeß;ÄÃSáD
ñ6sôRsHüeß;ÄÃSáU
FParamMap0 Map;
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void CustomHlsl07FCE32A670B6737C5DAB2A3B1D59DE47BE79D94Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
   SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0, 0,0,1);
    float Sigma = In_Radius;
    float TwoSigmaSquared = 2. * Sigma * Sigma;
    float Coeff = 1./sqrt(3.141569 * TwoSigmaSquared);
    float Total = 0.0;
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared));
        Total +=  Val;
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared)); 
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
int Constant2 = 0;
Context.Map.Local.Grid3D_GetFluidAttribute002.Resample = Constant3;
int Constant4 = 0;
float3 Constant6 = float3(0,0,0);
Context.Map.Local.Grid3D_GetFluidAttribute002.Unit = Constant6;
int Constant7 = 0;
int Constant8 = 7;
int Constant9 = 0;
ExecutionIndexToGridIndex_Emitter_TransientGrid(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float3 Output1;
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
int Constant14 = 0;
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
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_785_Func_Output_bUseOriginal;
float4x4 NiagaraScript_785_Func_Output_OutTransform;
bool NiagaraScript_785_Func_Output_LocalToWorld;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant4, NiagaraScript_785_Func_Output_bUseOriginal, NiagaraScript_785_Func_Output_OutTransform, NiagaraScript_785_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_785_Func_Output_OutTransform).xyz;
Vector_IfResult = In_InPosition;
Vector_IfResult = Result27;
Out_OutPosition = Vector_IfResult;
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
Vector_IfResult1 = Result38;
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
Vector_IfResult2 = Result41;
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
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.Map.Particles.Velocity, Constant16, Constant17, Constant18, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result42 = Result40 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result43 = lerp(Result35,Result42,Context.Map.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant20 = 1;
bool Constant22 = false;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result43, Constant20, Constant21, Constant22, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Constant24 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult = Constant24;
float3 Constant25 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult = Constant25;
Position_SelectResult = Context.Map.Particles.Position;
Velocity_SelectResult = Constant11;
Position_SelectResult = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Velocity_SelectResult = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
float3 Constant26 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult1 = Constant26;
float3 Constant27 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult1 = Constant27;
Position_SelectResult1 = Result34;
Velocity_SelectResult1 = Context.Map.Particles.Velocity;
Position_SelectResult1 = Position_SelectResult;
Velocity_SelectResult1 = Velocity_SelectResult;
Context.Map.Particles.Position = Position_SelectResult1;
Context.Map.Particles.Velocity = Velocity_SelectResult1;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_Output_IsInside;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_Output_IsInside;
bool Constant29 = false;
bool_IfResult = Constant29;
bool_IfResult = Context.Map.DataInstance.Alive;
Context.Map.DataInstance.Alive = bool_IfResult;
Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.Map.Emitter.LocalToWorld;
Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_FLIP_ParticleUpdate.PicOrFlip = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio;
bool Constant = false;
EnterStatScope(1 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.Map.KillParticles.KillParticles = Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant28 = true;
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
ád˘Ôn;…G¶ﬁ=m˙ÄD(µ
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
ád˘Ôn;…G¶ﬁ=m˙ÄD(e
‰S∫Ì=M9O†<ù.Ü;mîc
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
float Constant7 = 0;
EnterStatScope(2 /**Grid3D_SetRTValues_Emitter_Func_*/);
float3 Constant1 = float3(0,0,0);
Context.Map.Emitter.StartVelocityGrid.StartVelocity = Constant1;
float3 Constant = float3(0,0,0);
EnterStatScope(1 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
void UnitToFloatIndex_Emitter_TemporaryGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void SetGridValue_Emitter_TemporaryGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslB7AFD42C69DDE685BF5C57E72A28C76C3C0EF335Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
bool Result = NiagaraAll(In_SourceSpace == Constant7);
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
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result29;
Out_OutVector = Vector_IfResult1;
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 0, GridWeightXYZ*In_Velocity.x, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 1, GridWeightXYZ*In_Velocity.y, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 2, GridWeightXYZ*In_Velocity.z, IGNORE);
                InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 3, GridWeightXYZ, IGNORE);
                SetGridValue_Emitter_TemporaryGrid(2, XIndexInt+x, YIndexInt+y, ZIndexInt+z, In_BoundaryIndex, 3, IGNORE);
int Constant4 = 1;
bool Constant5 = false;
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
int Constant18 = 1;
int Constant19 = 1;
Output1.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output1.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output1.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result = Output1 + Context.Map.Grid3D_ComputeBoundary.OffsetSamplePosition;
X = Result.x;
Y = Result.y;
Z = Result.z;
IndexToUnit_Emitter_SimGrid(1, X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Constant22 = float3(0,0,0);
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
int Constant25 = 0;
float Constant26 = 0.001;
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
void CustomHlsl91210FFD5223D8E8CEE32F9755061227BF47926EEmitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
int Constant = 2;
CustomHlsl91210FFD5223D8E8CEE32F9755061227BF47926EEmitter_KernelGrid_Func_(Context.Map.Grid3D_CreateConvolutionKernel.Radius, Context);
void NiagaraScript_1011_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
bool NiagaraScript_1011_Func_Output_bUseOriginal;
float4x4 NiagaraScript_1011_Func_Output_OutTransform;
bool NiagaraScript_1011_Func_Output_LocalToWorld;
NiagaraScript_1011_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant6, NiagaraScript_1011_Func_Output_bUseOriginal, NiagaraScript_1011_Func_Output_OutTransform, NiagaraScript_1011_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_1011_Func_Output_OutTransform).xyz;
bool NiagaraScript_1011_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_1011_Func_Output_OutTransform1;
bool NiagaraScript_1011_Func_Output_LocalToWorld1;
NiagaraScript_1011_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant16, NiagaraScript_1011_Func_Output_bUseOriginal1, NiagaraScript_1011_Func_Output_OutTransform1, NiagaraScript_1011_Func_Output_LocalToWorld1, Context);
float3 Result29 = mul(float4(In_InVector,0.0),NiagaraScript_1011_Func_Output_OutTransform1).xyz;
void NiagaraScript_1042_Func_(float3 In_INPUT_VAR, out float Out_AreaFraction, inout FSimulationContext Context);
void NiagaraScript_1041_Func_(float In_ppp, float In_ppn, float In_pnn, float In_pnp, float In_nnp, float In_npp, float In_npn, out float3 Out_FaceFractions, inout FSimulationContext Context);
float NiagaraScript_1042_Func_Output_AreaFraction;
NiagaraScript_1042_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri0, NiagaraScript_1042_Func_Output_AreaFraction, Context);
float NiagaraScript_1042_Func_Output_AreaFraction1;
NiagaraScript_1042_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri1, NiagaraScript_1042_Func_Output_AreaFraction1, Context);
float NiagaraScript_1042_Func_Output_AreaFraction2;
NiagaraScript_1042_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri2, NiagaraScript_1042_Func_Output_AreaFraction2, Context);
float NiagaraScript_1042_Func_Output_AreaFraction3;
NiagaraScript_1042_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri3, NiagaraScript_1042_Func_Output_AreaFraction3, Context);
CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_(NiagaraScript_1042_Func_Output_AreaFraction, NiagaraScript_1042_Func_Output_AreaFraction1, NiagaraScript_1042_Func_Output_AreaFraction2, NiagaraScript_1042_Func_Output_AreaFraction3, CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_Output_Avg);
float NiagaraScript_1042_Func_Output_AreaFraction4;
NiagaraScript_1042_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri0, NiagaraScript_1042_Func_Output_AreaFraction4, Context);
float NiagaraScript_1042_Func_Output_AreaFraction5;
NiagaraScript_1042_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri1, NiagaraScript_1042_Func_Output_AreaFraction5, Context);
float NiagaraScript_1042_Func_Output_AreaFraction6;
NiagaraScript_1042_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri2, NiagaraScript_1042_Func_Output_AreaFraction6, Context);
float NiagaraScript_1042_Func_Output_AreaFraction7;
NiagaraScript_1042_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri3, NiagaraScript_1042_Func_Output_AreaFraction7, Context);
CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_(NiagaraScript_1042_Func_Output_AreaFraction4, NiagaraScript_1042_Func_Output_AreaFraction5, NiagaraScript_1042_Func_Output_AreaFraction6, NiagaraScript_1042_Func_Output_AreaFraction7, CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_Output_Avg);
float NiagaraScript_1042_Func_Output_AreaFraction8;
NiagaraScript_1042_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri0, NiagaraScript_1042_Func_Output_AreaFraction8, Context);
float NiagaraScript_1042_Func_Output_AreaFraction9;
NiagaraScript_1042_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri1, NiagaraScript_1042_Func_Output_AreaFraction9, Context);
float NiagaraScript_1042_Func_Output_AreaFraction10;
NiagaraScript_1042_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri2, NiagaraScript_1042_Func_Output_AreaFraction10, Context);
float NiagaraScript_1042_Func_Output_AreaFraction11;
NiagaraScript_1042_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri3, NiagaraScript_1042_Func_Output_AreaFraction11, Context);
CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_(NiagaraScript_1042_Func_Output_AreaFraction8, NiagaraScript_1042_Func_Output_AreaFraction9, NiagaraScript_1042_Func_Output_AreaFraction10, NiagaraScript_1042_Func_Output_AreaFraction11, CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_Output_Avg);
float3 NiagaraScript_1041_Func_Output_FaceFractions;
NiagaraScript_1041_Func_(CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npn, NiagaraScript_1041_Func_Output_FaceFractions, Context);
X = NiagaraScript_1041_Func_Output_FaceFractions.x;
Y = NiagaraScript_1041_Func_Output_FaceFractions.y;
Z = NiagaraScript_1041_Func_Output_FaceFractions.z;
void NiagaraScript_1019_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void NiagaraScript_1020_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
int NiagaraScript_1019_Func_Output_IterationIndex;
int NiagaraScript_1019_Func_Output_MaxIterations;
float NiagaraScript_1019_Func_Output_NormalizedIterationIndex;
int NiagaraScript_1019_Func_Output_LoopIndex;
int NiagaraScript_1019_Func_Output_NumberOfLoops;
float NiagaraScript_1019_Func_Output_NormalizedLoopIndex;
NiagaraScript_1019_Func_(NiagaraScript_1019_Func_Output_IterationIndex, NiagaraScript_1019_Func_Output_MaxIterations, NiagaraScript_1019_Func_Output_NormalizedIterationIndex, NiagaraScript_1019_Func_Output_LoopIndex, NiagaraScript_1019_Func_Output_NumberOfLoops, NiagaraScript_1019_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_1020_Particle_Func_Output_ClampedValue;
NiagaraScript_1020_Particle_Func_(Context.Map.Grid3D_PressureIteration.Relaxation, NiagaraScript_1020_Particle_Func_Output_ClampedValue, Context);
CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_(Context.Map.Grid3D_PressureIteration.dx, Context.Map.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Context.Map.Grid3D_PressureIteration.Divergence, NiagaraScript_1019_Func_Output_IterationIndex, NiagaraScript_1020_Particle_Func_Output_ClampedValue, Context.Map.Grid3D_PressureIteration.Velocity, Context.Map.Grid3D_PressureIteration.Pressure, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_right, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_left, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_up, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_down, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_front, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_back, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_right, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_left, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_up, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_down, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_front, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_back, CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
NiagaraScript_1011_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant4, NiagaraScript_1011_Func_Output_bUseOriginal, NiagaraScript_1011_Func_Output_OutTransform, NiagaraScript_1011_Func_Output_LocalToWorld, Context);
NiagaraScript_1011_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant15, NiagaraScript_1011_Func_Output_bUseOriginal1, NiagaraScript_1011_Func_Output_OutTransform1, NiagaraScript_1011_Func_Output_LocalToWorld1, Context);
float3 Result38 = mul(float4(In_InPosition,1.0),NiagaraScript_1011_Func_Output_OutTransform1).xyz;
bool NiagaraScript_1011_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_1011_Func_Output_OutTransform2;
bool NiagaraScript_1011_Func_Output_LocalToWorld2;
NiagaraScript_1011_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant19, NiagaraScript_1011_Func_Output_bUseOriginal2, NiagaraScript_1011_Func_Output_OutTransform2, NiagaraScript_1011_Func_Output_LocalToWorld2, Context);
float3 Result41 = mul(float4(In_InVector,0.0),NiagaraScript_1011_Func_Output_OutTransform2).xyz;
bool NiagaraScript_1011_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_1011_Func_Output_OutTransform3;
bool NiagaraScript_1011_Func_Output_LocalToWorld3;
NiagaraScript_1011_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant23, NiagaraScript_1011_Func_Output_bUseOriginal3, NiagaraScript_1011_Func_Output_OutTransform3, NiagaraScript_1011_Func_Output_LocalToWorld3, Context);
float3 Result44 = mul(float4(In_InVector,0.0),NiagaraScript_1011_Func_Output_OutTransform3).xyz;
void NiagaraScript_1034_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
NiagaraScript_1011_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant12, NiagaraScript_1011_Func_Output_bUseOriginal, NiagaraScript_1011_Func_Output_OutTransform, NiagaraScript_1011_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_1011_Func_Output_OutTransform).xyz;
float3 NiagaraScript_1034_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_1034_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant2, Constant3, Constant4, Constant5, Constant6, Constant7, Constant8, NiagaraScript_1034_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
NiagaraPosition_SelectResult2 = NiagaraScript_1034_Emitter_Localspace_false_Particle_Func_Output_Position;
CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant4, Constant1, CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl3C56E1B1144E8C265C004BCB02D02C2016F030C8Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
void SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDF(int In_InstanceData, float3 In_Unit, out float Out_Value);
void LinearToIndex_Emitter_SimGrid(int In_InstanceData, int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
Output1.x = Context.Map.Vector2DFromFloat.Value;
Output1.y = Context.Map.Vector2DFromFloat.Value;
Context.Map.Particles.SpriteSize = Context.Map.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize;
Out_OutPosition = Context.Map.Engine.Owner.Position;
Seed_IfResult = Context.Map.Emitter.RandomSeed;
Seed1_IfResult = Context.Map.Particles.UniqueID;
Seed2_IfResult = Context.Map.Engine.System.TickCount;
Mode_IfResult = Context.Map.SphereLocation.RandomnessMode;
Override_IfResult = Context.Map.SphereLocation.OverrideSeed;
NiagaraScript_5_Func_(Constant19, Constant20, Mode_IfResult, Override_IfResult, Constant21, Context.Map.SphereLocation.FixedRandomSeed, NiagaraScript_5_Func_Output_Ouput, Context);
Context.Map.Local.SphereLocation.SphereVector = NiagaraScript_5_Func_Output_Ouput;
float3 Result20 = abs(Context.Map.Local.SphereLocation.SphereVector);
CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_(Context.Map.SphereLocation.HemisphereX, Context.Map.SphereLocation.HemisphereY, Context.Map.SphereLocation.HemisphereZ, CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_Output_Output);
float3 Result21 = lerp(Context.Map.Local.SphereLocation.SphereVector,Result20,CustomHlslBD036F57F99020EECEA828DD5F93FB3811947348_Func_Output_Output);
Context.Map.Local.SphereLocation.SphereVector = Result21;
float3 Result22 = Constant44 * Context.Map.Local.SphereLocation.SphereVector * Constant45;
Context.Map.Local.SphereLocation.SphereVector = Result22;
float3 Result23 = Context.Map.SphereLocation.SphereOrigin + Constant46;
SphereLocation_NF_TransformVector_Emitter_Func_(Context.Map.Local.SphereLocation.SphereVector, Context.Map.SphereLocation.CoordinateSpace, Constant48, Constant49, SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
Context.Map.Particles.Position = Result52;
Context.Map.OUTPUT_VAR.SphereLocation.SphereNormal = Result53;
Context.Map.OUTPUT_VAR.SphereLocation.SphereVector = SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
Context.Map.Particles.Velocity = Constant58;
Output15.x = Context.Map.Particles.Position.x;
Output15.y = Context.Map.Particles.Position.y;
Output15.z = Context.Map.Particles.Position.z;
float3 Result54 = mul(float4(Output15,1.0),Context.Map.ScratchModule_01.WorldToUnit).xyz;
SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDF(0, Result54, SamplePreviousGridFloatValue_Emitter_SDFGrid_AttributeSDFOutput_Value);
Context.Map.Transient.Kill = Result55;
int Result60 = GetNumCells_Emitter_SimGridOutput_NumCellsX * GetNumCells_Emitter_SimGridOutput_NumCellsY * Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex;
LinearToIndex_Emitter_SimGrid(1, Result63, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, LinearToIndex_Emitter_SimGridOutput_IndexZ);
int Result64 = Context.Map.Grid3D_Flip_GridParticles.ParticlesPerCell * Context.Map.Grid3D_Flip_GridParticles.TotalEmissionCells;
int Result66 = Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex - Constant75;
float3 Result68 = mul(float4(IndexToUnit_Emitter_SimGridOutput_Unit,1.0),Context.Map.Grid3D_Flip_GridParticles.UnitToWorld).xyz;
bool Result69 = NiagaraAll(IndexZ_SelectResult >= Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex);
GetHeight_User_LandscapeCollisions(2, Result68, GetHeight_User_LandscapeCollisionsOutput_Value, GetHeight_User_LandscapeCollisionsOutput_IsValid);
float Result74 = Context.Map.Grid3D_Flip_GridParticles.dx * Constant63;
Vector3f_SelectResult1 = Context.Map.Particles.Position;
NiagaraBool_SelectResult1 = Context.Map.Transient.Kill;
Vector2D_SelectResult1 = Context.Map.Particles.SpriteSize;
Vector3f001_SelectResult1 = Context.Map.Particles.Velocity;
Context.Map.Particles.Position = Vector3f_SelectResult1;
Context.Map.Transient.Kill = NiagaraBool_SelectResult1;
Context.Map.Particles.SpriteSize = Vector2D_SelectResult1;
Context.Map.Particles.Velocity = Vector3f001_SelectResult1;
EnterStatScope(0 /**SpawnScript_2_4*/);
Context.Map.Particles.SpriteSize = Constant;
Context.Map.Particles.Velocity = Constant1;
Context.Map.Vector2DFromFloat.Value = Context.Map.Emitter.dx;
Context.Map.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize = Vector2DFromFloat_Emitter_Func_Output_Vec2;
Context.Map.SphereLocation.OverrideRandomness = Constant2;
Context.Map.SphereLocation.RandomnessMode = Constant3;
Context.Map.SphereLocation.OverrideSeed = Constant4;
Context.Map.SphereLocation.SurfaceExpansionMode = Constant8;
Context.Map.SphereLocation.NormalizeThickness = Constant9;
Context.Map.SphereLocation.FixedRandomSeed = Constant10;
Context.Map.SphereLocation.HemisphereX = Constant11;
Context.Map.SphereLocation.HemisphereY = Constant12;
Context.Map.SphereLocation.HemisphereZ = Constant13;
Context.Map.Particles.Position = SphereLocation_SimulationPosition_Emitter_Func_Output_OutPosition;
Context.Map.SphereLocation.SphereOrigin = Context.Map.Particles.Position;
Context.Map.SphereLocation.CoordinateSpace = Constant16;
Context.Map.ScratchModule_01.WorldToUnit = Context.Map.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit;
Context.Map.Grid3D_Flip_GridParticles.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_Flip_GridParticles.UnitToWorld = Context.Map.Emitter.UnitToWorld;
Context.Map.Grid3D_Flip_GridParticles.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_Flip_GridParticles.SpawnedThisFrame = Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame;
Context.Map.Grid3D_Flip_GridParticles.UseLandscape = Constant60;
Context.Map.Grid3D_Flip_GridParticles.ParticlesPerCell = Context.Map.Emitter.OVERRIDE.ParticlesPerCell;
Context.Map.Grid3D_Flip_GridParticles.WaterHeightZIndex = Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex;
Context.Map.Grid3D_Flip_GridParticles.TotalEmissionCells = Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells;
Context.Map.KillParticles001.KillParticles = Context.Map.Transient.Kill;
Context.Map.DataInstance.Alive = Constant84;
ExitStatScope(/**SpawnScript_2_4*/);
EnterStatScope(7 /**SpawnScript_2_4_Main*/);
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
Context.Map.Engine.Owner.Position = Engine_Owner_Position;
Context.Map.Engine.System.TickCount = Engine_System_TickCount;
Context.Map.System.Grid3D_CreateUnitToWorldTransform.WorldToUnit = System_Grid3D_CreateUnitToWorldTransform_WorldToUnit;
Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.HasSpawnedThisFrame = Emitter_Grid3D_FLIP_Tank_Spawn_HasSpawnedThisFrame;
Context.Map.Emitter.OVERRIDE.ParticlesPerCell = Emitter_OVERRIDE_ParticlesPerCell;
Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.WaterHeightZIndex = Emitter_Grid3D_FLIP_Tank_Spawn_WaterHeightZIndex;
Context.Map.Emitter.Grid3D_FLIP_Tank_Spawn.TotalEmissionCells = Emitter_Grid3D_FLIP_Tank_Spawn_TotalEmissionCells;
EnterStatScope(8 /**SpawnScript_2_4_MapMain*/);
ExitStatScope(/**SpawnScript_2_4_MapMain*/);
bool bValid = Context.Map.DataInstance.Alive;
int TmpWriteIndex = OutputIndex(0, true, bValid);
ExitStatScope(/**SpawnScript_2_4_Main*/);
EnterStatScope(0 /**UpdateScript_2_4*/);
ExitStatScope(/**UpdateScript_2_4*/);
EnterStatScope(2 /**UpdateScript_2_4_Main*/);
EnterStatScope(3 /**UpdateScript_2_4_MapMain*/);
ExitStatScope(/**UpdateScript_2_4_MapMain*/);
ExitStatScope(/**UpdateScript_2_4_Main*/);
˛AqˇQ@–I±õ5;
Bà;r‚=µç¶î
öu˝i+;Î>£7òµ
;π…f–Ô¥
;Ä?Ä@Äˇˇ
I¬‰ëgx“Jà;\
@å;w¡@Yá
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„Eµ
xì;ö©\?Nñ∫/hÑ
'Ä¬”Á;ÍCÇï3Qæ
|À¿§5¶ÛJ£b÷;‚∆¬
”ÿswKª;
 N´}`„à/;êµ
6ZN∞&;˛Œ
ôMG∞Îçnó;…ıµ
 óé4;g˛Añ
t;–Lô˛g…
ı≥Ûü¸;%Eº<=]˜›≤µ
bÔ«Ÿzó…I§T•ï;
¡É*ûóˆ•Ä.;ƒ—


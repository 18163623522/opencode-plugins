˛bºV¬ˆM>Ú;àè*y
öµÓ;«˛$
’ÕV-3SΩKg÷`[t;dµW
@;ﬂJÕ0∏f ôT`1≈0)≥
H¿˜†b˘¨;
 LÅªÊ>ºúgÈUpJÂÂp‡
I…Œqú—Ã;
íM;XW89ßº≤ MÄŸ*P˝Â#‘R¶Æ–F‡¬ﬁdàTH
Bdv;O@ﬂJóFÇ)µXcùëAla«
y∞yæb7Á«ÎM; µŸ—›¸F-
[Í;€Côí<ä©$eOJÍd›…h“ﬁHÂwàHS;Hœl
¥æc];πo‚$‰{èZä˙8mÿG
$≥;E±∂ê
b;sX:Ê´0‘·ï5#}
äâ∂…;2∆
÷p˚E≥¥a¶éE?pg≠+;Í
pAÏkR;Ñé÷&±Ic∏àfi
⁄€√{x…yÊ±O#Ã;ì
j\R∏Ï<sN¡¶)≈Jå;
ÈøÿZç“‹;
ÿ)é;y∑´0,Wú
Ü§V;p∂
SÒ;+tGOCº80≠ÌˇY?˙
’+8≤÷B≥7;Ω´
qÒ‰0È9;A´t™Ë}µ»
≥∫“œOáüı°’¯;ß˙
p;!2*N´Hó7
N‘CØ≠%£Bó;Lo0~‚ ≠
N‘CØ≠%£Bó;Lo0~‚ X
Gôeô~;òó#e
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
∞J‰0µjXZnµ;0˙
K®˛Ú‚(;Gâ±≥iƒ
˝Üp;Æ∑
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
-° 4È}è;∞
;®Âl‰˚D¨è\•—Yß€/a<eE˙
iæKØ—qoùßﬂ;˙
ÿ;ºÉ5R
ôè¯ÏñO5©Çö;•n
wõ©∂Îâ-[ïÎ◊Ò;
;E˜9—‘
rU˘ë≥ª;π
µe°;˝L∫z"{˙
CQ&»¸küUjZ;#
⁄*tD<;úEì&É
fπ∏NêX´;M°˛Ω˙
≠G∏;—O
N‘CØ≠%£Bó;Lo0~‚ B
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊[
·Ä;2Kx+J≤Bè§]â‹#>
s;Mi”DÅéÄµó«RË>
öc,„( ÒCí;˙™gÊN1>
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
âBL∂π9Hæ£[!;
cMäI#í;…Ï£+
—Xd°JeG∏;(
ﬁ;®J´A]
ﬁJΩu&ÑkU„;
ﬁJΩu&ÑkU„;Ä
—Ì7;GΩ
ﬁJΩu&ÑkU„;*
ﬁJΩu&ÑkU„;—
‡gYßÖ¯Hê");rÆ◊\’
‡gYßÖ¯Hê");rÆ◊\Ä
‡gYßÖ¯Hê");rÆ◊\+
‡gYßÖ¯Hê");rÆ◊\‹
ﬁJΩu&ÑkU„;0
‡gYßÖ¯Hê");rÆ◊\1
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
âo5ﬁ GÇG1o.¥±ã;
ÙÓ´l«aB¶^K9%ın[;
;W/Ë¿]
Fà⁄zAÿı´Ï;
£îÛ@dÖ;
∫]±+4V=@µTi¡m∫y@;
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
Å)YÆëŸnN∫;Ùm
£;n4‰EfC∞Ì
±qú©#N7O™ª;eﬂ
W`Äd˘å°B≥t¥÷;ƒk|ˆ
‡gYßÖ¯Hê");rÆ◊\
nÂ¢q“qMâ;}tk
;W/Ë¿]^
Â√˙»S;ÅD†ò
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3√
ãsL≥L©j;Ö®¨¶ºé
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿é
>Â;N™Õ)vãh.Zé
b\^ÇPÛEü;±
”5oU;Já±±@†®%9∫
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™˛
K˜ZC ö;Mòïs
;Iò£+1
TA±;ãÒ¢!Áyr
TA±;ãÒ¢!Áyﬂ
87ô5¶3Në;
Ñq;dœDÿJë`†à]À
¸ëØNµ‹P%Náw;◊
EÉ©N}í.;œg
ãß;ÂR@ø©àm¯êúJ
÷ÎÜ˚õAé;¿Ùc.ó∑¶
Ò≈;ªO≠lÜ••˙C≥é
Æ;IN:ˆ
˝í;ÎÈ¶
;≠ã£πÏ™G•'∆5
ˇÚEì;Ú"∑
*J;œ’$ÓI¥ÒƒƒÚo‘~ì
Oö;P2π¸Æ*
!;ÌBÔΩ«@†À<Ç*
†6i ;ì
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^í
mk†;$û•O´ÜáVóIø¥
OÆÎi;^¡òŸ˙
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.ÈÒ
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í Ò
†HæÂ˛†’H-;\
;Ô“].ºë
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Û\
Y{3;FçûRô®<NC
 DÄ÷bûYPc7ë
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Ó,
xH;A˘q
˜cKª‰´˛;‡Úˇa
 iÈJÜ-g$ûZH⁄\
7uù¬‘RçKô'î£lÅ;k
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿Çµ
:Ã;3ËBqM£<Y)ôfH$a
AÉ%F;XOÖ6x‡jæÊ\˙
xùù⁄€HH≠cç;[*Y>Ç
xùù⁄€HH≠cç;[*Y>ﬂ
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
ØÜHòh∞'Ãﬁ;åä
ØÜHòh∞'Ãﬁ;å(
;|ã´Îø
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>mé
Dó0¿¯;ÑOæé
 l;æNÉÒÌ‡~ 4=∫
ÑÒ`@ºèS;<»Zö∫
%wäJÄ‚+“;Eh–ˆ
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜$
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
I ;qÚKí
z;›˜™O†lÏwêäNVˆ
\∏Aä;!ô-¬€¡˙
;+¯OOûû7>
;W/Ë¿]¬
TA±;ãÒ¢!Áy÷
z’€2í«lAíè´%Å(i;ˆ
xùù⁄€HH≠cç;[*Y>Ê
∏M°2;X¸ú;{
ØÜHòh∞'Ãﬁ;åÓ
ëÖ;ü>=-N©
j@ëg—…Ÿ;
≤™cZ_Cí\;
;¬ÒÒEª
M;„uÓÎ»Må†e
;[]eL∏m¬u
àŸC¶œ;'q˚Oh$
àŸC¶œ;'q˚Ohﬂ
A˘9@©]DÓÓ”÷P;
“sB_∞D¨b‹”gí0=;
ê†ΩµÊ∂ÊC®ˇÙ*æàê&;
àŸC¶œ;'q˚Oh?
∆N‡˚ú7—AçÂµ;Ωv·
∂ÙµO≥;3Yx‘(Çˆ
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†U
;aJΩzO ?∆+†€
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;FÙ
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
Ö∏:“)¢ŒOò;æíÖ√„õ€
{tïuQ2PD∏≥ô∫∂%;Õ
;aJΩzO ?∆+†º
Ö∏:“)¢ŒOò;æíÖ√„õ
E¨Ñõ;ôGK2
[;w‹ÊC÷M´Wƒ;ÃQ√H
@;x§ù.DAàÔ«;–Ë
°;bF[Ù
Xói≈,æEIçG±°Ã›÷S;
ó‚‰z;XUIÄt7a!EÏ
Úó;˝3g.Dì
z;O∫kÉ^˝öËTˆ
≤´;à‘ÿ
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;”Ù
Lø;z˛rLWO˙
XûEøEø;bÒ1°å
XûEøEø;bÒ1°B
XûEøEø;bÒ1°«
Z;Öj6sêO¢øÍky@‰»
\≤ﬂﬁ1;ıM°&´“ C…zÙ
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;ˆ
q‘ı;EûuCdﬁ&5›
q‘ı;EûuCdﬁ&5›˙
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
£í;Cä˘G¥
@™ÛlØ,;
;aJΩzO ?∆+†
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]
Aì;˝ˇ\∑Ç]Y
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_&
É∆:JóÑƒ—;Tá_–
9á‚ s‘]MäSr;˚±µ`Ù
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNı/
9;˛π$J»Añ{C8·åNı˙
ùY˝;BEî¢
NEgŸÂ;
ªJTd#”;
Ò¢;•BˆCî
‚¢;®ÂíA
‚¢;®Âí˙
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€
Ω.BπYÎ;k7Î˜G
Ω.BπYÎ;k7Î˜–
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Gò;ä∆…±
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“A]
 ZSiBº´AéÓ—lÜ∆“A˙
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
Q;öÎ™f
Q;öÎ™=
 C®ØHŸ˜ÎRﬁ˙
––˙»H™;[á}zŒBˆ
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
;ªÑê*%w
;ªÑê*%
N´†;zXã
;8K¨VA`O¶rKü†J
j°Dîv;
‹ÒW¡¬9G®T©·˚[É;}
‹ÒW¡¬9G®T©·˚[É;˙
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
EñC‡w@¸k;˙
&≠,ÿ;´§Oª‚œ
¯∂7…›”¡Aü‹–;(ˇ
◊#¯IâDb;Ùﬁ‚ûˆ
>bÉ/y;<@éÎ
Ìó!;mJÅá˝#À/~/·
Ìó!;mJÅá˝#À/~/
iyH≠T‘;0
πhM∫Ù-;Ö¥≠Ií
˘';hPNû
;2Zñ5bmE∞\|ÿ
 r±'ÂL´¢
πhM∫Ù-;Ö¥≠I
sÔ◊;ü€
ﬂJÁÊﬁ‹;O∞ºπ
 OöLke˙Ãˇ!ß
 OöLke˙Ãˇ!Ä
;g∆<ksÕIß:«œ[ $tˆ
∆ÀI;∫ä'L™
ë∏û/ï%MAµ#ƒZ7t;Ÿ
≠¥pÊ1Eê;á˝Ô
Dú#˛;bã⁄
H;Îw‹_MKØ˚µ2Z‘Á‰π
H;Îw‹_MKØ˚µ2Z‘Á‰ë
∆M±\Oå;µxK∫
∆M±\Oå;µxK–
∞L˙>{Ò¿@¥d8Á;
{tïuQ2PD∏≥ô∫∂%;Õ¿
{tïuQ2PD∏≥ô∫∂%;Õ–
¯;·€J_UD®9&Ÿ
@ø™ﬁEôF»;
Q;û:ƒÓGA≤î
îê∫âã!’O∑˙ª æ;˙ÙÃ
îê∫âã!’O∑˙ª æ;˙Ù˙
\;ÖI•*ÊÑ
˘5D;Ö¯-AÖUß„à]1§˙
8—d≤G©G¡`Q;◊Hˆ
Íi+;<’Nö±w
Û]¯;¨òïBá
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9Ì
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;í
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
H°·R.˘z#»;
ı‰®I¶;
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆ–
 A´KUTFöR!
 A´KUTFöR!˙
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡
GåÁÂé-;Ë‡Å
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;í
;YÂLË˙
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQb˙
©ÁI°Q-¸;_◊
¿PBÄ}å;¯›zÊˆ
q‘ı;EûuCdﬁ&5›*
Aì;˝ˇ\∑Ç]:
(™¶òÃ;
ÎÏÏ( ÂõIº˝ÎG∫U»f;
É∆:JóÑƒ—;Tá_A
9;˛π$J»Añ{C8·åNıJ
‚¢;®Âí\
Ω.BπYÎ;k7Î˜b
 ZSiBº´AéÓ—lÜ∆“As
Q;öÎ™|
;ªÑê*%ç
‹ÒW¡¬9G®T©·˚[É;ì
 OöLke˙Ãˇ!ª
H;Îw‹_MKØ˚µ2Z‘Á‰Ã
∆M±\Oå;µxKÕ
{tïuQ2PD∏≥ô∫∂%;Õ”
îê∫âã!’O∑˙ª æ;˙Ùﬂ
 EÜ™8Â
 EÜ™8–
;O≥A€˚fE•È∆
J°_ycô‰;
öˆ[;ÑÁ
öˆ[;Ñá
÷;ŸŒƒÈ
÷;ŸŒƒ–
N^°Ô‰Bó—;K⁄˙
∂;ΩR\˙
∏M°2;X¸ú;{Í
∏M°2;X¸ú;{–
eY:ûZAâvóe7;§ïˆ
836˙;8∞BÑk}©èò™öˆ
®+´c ı„A©W!∑;
R"xAU¿;Iû"O
;FË;FFO§\eW◊˝
H^˛;D˙
\SCD∫Hå¿ﬂ;0ÁYÙˆÓaÖ"
\SCD∫Hå¿ﬂ;0ÁYÙ
¨3êC?D´Ü∂v;“%1+
ùΩ;Bêa¢óoÆóˆ.
 A´KUTFöR!0
GåÁÂé-;Ë‡4
¯JãòOÌ[ÿ˛´;
6;G«XN¶ yΩ¥}√/õÌ—!ë}
6;G«XN¶ yΩ¥}√/
¨©8¢H3Iø nUGÎ&+‡h†qy;0I¢ù€ˆ≤lÜ\R[L<hKáGæÆÑ
‡h†qy;0I¢ù€ˆ≤lÜ\
™;MYÀD∫s·–
;ﬁoß/*ûOÑ
ÅµéLPl;¨ÖY…
TÕ;oËÌQMÉÛmàáXxD
l;¨ÖY…
˝‘WXÚ7äF•Wﬂ–;ow"L
˝‘WXÚ7äF•Wﬂ–;ow"˙
;ßÄ«\~@ûSØ}@üı«
âiFã/&Ø;™∑ˆL
âiFã/&Ø;™∑ˆ˙
E¨Ñõ;ôGK2N
E¨Ñõ;ôGK2–
[;w‹ÊC÷M´Wƒ;ÃQ√HR
[;w‹ÊC÷M´Wƒ;ÃQ√H–
5\´Ô;O≠yÄç‚LÒ&R
5\´Ô;O≠yÄç‚LÒ&˙
˘FCüö‡Èz«;)í
˘FCüö‡Èz«;)
'ªÙú¬Ù;Nê
åójÕVJØ;ueßä%€[
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
˝‘WXÚ7äF•Wﬂ–;ow"å
âiFã/&Ø;™∑ˆå
E¨Ñõ;ôGK2é
[;w‹ÊC÷M´Wƒ;ÃQ√Hí
5\´Ô;O≠yÄç‚LÒ&í
åójÕVJØ;ueßä%
 s&≥|˙
‰˜DÖ0;èU
7D{C°èÅG¢#pÓ[;7
ó‚‰z;XUIÄt7a!EÏ–
;©†˚(ÊÂFêç
 —<;?h™Môç•ØZüòUÿ
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•˙
x´;Bé§í‡Òä`Ê€
x´;Bé§í‡Òä`Ên
‰g;•†0MÜQ:âıπº^›
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
4´;ÉùÙ
zC∏ª;D◊Û2o
XûEøEø;bÒ1°
K;Óñ‰ﬁÔ
K;Óñ‰ﬁ
&HÚ´;R
DÅ)¯P√}i;ı
DÅ)¯P√}i;Â
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
g;MåÌ\£RÒB“
Úh;|}}
qi;;¥E∂o>2e
:ı„ÂÒ“;F¢Gâ0=√2A
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯X˛
;˙/¯X≠
ıR9ÿ"D¨Úq;Ã
ØÜHòh∞'Ãﬁ;å
TA±;ãÒ¢!Áy
g‹I∏xü;Ü
%îh;˘Ä_G∑
H;Îw‹_MKØ˚µ2Z‘Á‰
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
ìáï∆)K;Mà±≠/˜˜ùöˆ
;M¸è¿sK£ﬁ»u8q„e˙
ì◊rÒ®ETEá¥éM;∂
xùù⁄€HH≠cç;[*Y>
 OöLke˙Ãˇ!
˛´T“@õÜ;˘TÑq™â
\Ày`AçÇZ≥Ñ˙;±ˇ
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
aß¸¸–;
å·;ˆ÷hÆNóıÓŸƒq±∞;
å·;ˆ÷hÆNóıÓŸƒq±∞
 —<;?h™Môç•ØZüòUC
x´;Bé§í‡Òä`ÊF
‰g;•†0MÜQ:âıπº^H
K;Óñ‰ﬁZ
DÅ)¯P√}i;`
;˙/¯Xi
‹ÌsB£0ÎAè¿;ã
˛´T“@õÜ;˘TÑq™Å
\Ày`AçÇZ≥Ñ˙;±Ç
å·;ˆ÷hÆNóıÓŸƒq±∞ß
Z;Öj6sêO¢øÍky@‰
Z;Öj6sêO¢øÍky@‰»ˇ
TÕ;oËÌQMÉÛmàáXxD≠
TÕ;oËÌQMÉÛmàáXxD≤
;ßÄ«\~@ûSØ}@üı
¯˚ç2;±§HæO}ê
‡Á¸Œ˙åBF∞π;/
Gº3Õ'âï£!;
ñ8~.Ô;
™Ø ;LCå5â©zÍMøˆ
›;-ÒJ¢§S/¿
àŸC¶œ;'q˚Oh
Z;Öj6sêO¢øÍky@‰»—
TÕ;oËÌQMÉÛmàáXxD—
;ßÄ«\~@ûSØ}@üı«—
;√nQmÙ
;√nQm–
NæÆÄqæ∫;*
ó±√;ÚM¢°
õ…;ÔÙ∞NíDK∫O6Ë¿˚
õ…;ÔÙ∞NíDK∫O6Ë¿
v†S]¶Æ"Kª;ò_YIto
ÿˇR:˘≤zñy;Ÿ
ãWXZ°†∏;J…såà/Ö
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
float Boundary;
float BoundarySignedDistance;
float3 FaceFraction;
bool Kill;
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
FParamMap0_OUTPUT_VAR_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_OUTPUT_VAR_Grid3D_ProjectPressure Grid3D_ProjectPressure;
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
bool KillParticles;
float Red;
float3 StartVelocity;
float dt;
float3 PressureGradient;
float Divergence;
float Relaxation;
int BoundaryIndex;
float4x4 WorldToLocal;
float4x4 LocalToWorld;
float PicOrFlip;
int ParticlesPerCell;
bool SpawnedThisFrame;
int TotalEmissionCells;
float4x4 UnitToWorld;
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
FParamMap0_Grid3D_SetFluidAttribute004 Grid3D_SetFluidAttribute004;
FParamMap0_Grid3D_SetRTValues Grid3D_SetRTValues;
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
void CalculateRandomRange_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void LinearToIndex_Emitter_SimGrid(int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void CustomHlslDCC4EFFAD55B5AC758354F8DDE4EADE5F122EC28_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, out bool Out_ret);
void GetHeight_User_LandscapeCollisions(float3 In_WorldPos, out float Out_Value, out bool Out_IsValid);
void Grid3D_Flip_GridParticles_Emitter_Func_(inout FSimulationContext Context);
void KillParticles001_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_IndexX, int In_IndexY, float In_Value);
void CustomHlsl6335FD618A48BBC0736B8747B7B1787DB6173166Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
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
void CustomHlslCAD8B6269D32D9E9836479234D5028BE6B2E86C9Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_01_Emitter_Func_(out float3 Out_Output, inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, float In_MaxDistance, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestVelocity);
void CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute006_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_TransientGrid(out float3 Out_Unit);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float In_dt, out float Out_theta_ppp, out float Out_theta_ppn, out float Out_theta_pnn, out float Out_theta_pnp, out float Out_theta_nnp, out float Out_theta_npp, out float Out_theta_npn, out float Out_theta_nnn, out float3 Out_AverageSolidVelocity);
void CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl3C63873390BA78F3DCCAA59B91D54E621B29B0C7_Func_(float3 In_theta, out float Out_AreaFraction);
void ComputeAreaFraction_Func_(float3 In_INPUT_VAR, out float Out_AreaFraction, inout FSimulationContext Context);
void CustomHlslEACD34187752505B34B1CF131B7E41A83F6B6D3A_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl1ADEAE150AFB129B5A61737CCC3C942EBD7DE4C3_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_(float In_A, float In_B, float In_C, float In_D, out float3 Out_Tri0, out float3 Out_Tri1, out float3 Out_Tri2, out float3 Out_Tri3);
void CustomHlsl15CD40E58E2257CE95A4349D7990BBFB49A7B406_Func_(float In_A, float In_B, float In_C, float In_D, out float Out_Avg);
void ComputeFaceFractions_Func_(float In_ppp, float In_ppn, float In_pnn, float In_pnp, float In_nnp, float In_npp, float In_npn, out float3 Out_FaceFractions, inout FSimulationContext Context);
void CustomHlsl0018AE99D4DB915994E43B6ECA0F4E51352D7897B71_Func_(float In_theta_ppp, float In_theta_ppn, float In_theta_pnn, float In_theta_pnp, float In_theta_nnp, float In_theta_npp, float In_theta_npn, float In_theta_nnn, out bool Out_IsFullyInsideBoundary);
void Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(float In_dt, out float Out_XFace, out float Out_YFace, out float Out_ZFace, out bool Out_IsFullyInsideBoundary, out float3 Out_SolidVelocity, inout FSimulationContext Context);
void CustomHlslE7527ACD45F9553335695B107E94869069F42A83_Func_(float3 In_Face, float In_MinFaceFraction, out float3 Out_FaceFraction);
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
void CustomHlsl6DC16740F3D5F5D5071A72B659051D78F70BD8EBEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
void SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl70C81733FC56A67104CBCD5B87BB1CF6C604D10EEmitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
void Grid3D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void Grid3D_GetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void Grid3D_GetFluidAttribute005_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void SimulationStageIterationInfo_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl3C943BB6CE1D7BB6B9BDBB407C10A9E0F36123BA_Func_(float In_InFloat, out float Out_OutFloat);
void SaturateFloat_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl6FD064129ACB5A3F097F9D372E2C286D250FEE0DEmitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
void Grid3D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl50C340EA0C6377CA14E3BDEB061F941EC92FE7C9Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlsl0E0EA7F1FB64267C43FDFF3C92BF474180AD415DEmitter_TransientGrid_Func_(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
void Grid3D_ProjectPressure_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_Visualize_VectorField_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslC729A939EF42D984BDC2F0624B4305AF38AEAFD4Emitter_SimGridEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TransientGrid(float3 In_Unit, out float3 Out_Index);
void CustomHlslD8FF7A26FB69198077FED157A3672E3C130A08B6_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl88BDFB3DAB51A2C7B314E6FEA90042F90330D60A_Func_(float3 In_UnitPos, out float Out_ret);
void CustomHlsl46B4B78F8616CC0A906E2E126567B0F5906EA7ED_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl712636B448618B0B8EDDE980E89724DAF414BF5B_Func_(float In_Mask, out bool Out_IsInside);
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
void CustomHlsl5FEAB372E559B56F64B6A3CDDF10B165CD1E4ACBEmitter_RasterizationGrid_Func_(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
void RasterizationGrid_ParticleSource_Emitter_Func_(inout FSimulationContext Context);
void GetNumCells_Emitter_KernelGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void GetPreviousFloatValue_Emitter_KernelGrid_Attributek(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl054606C9786B3104AB65A6ACECEBE2484664C866Emitter_RasterizationGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SDFGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void GetNumCells_Emitter_SDFGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_ConvolveAxis002_Emitter_Func_(inout FSimulationContext Context);
void ExecToIndex_Emitter_SimRT(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
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
bool CustomHlslDCC4EFFAD55B5AC758354F8DDE4EADE5F122EC28_Func_Output_ret;
CustomHlslDCC4EFFAD55B5AC758354F8DDE4EADE5F122EC28_Func_(LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, IndexZ_SelectResult, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, CustomHlslDCC4EFFAD55B5AC758354F8DDE4EADE5F122EC28_Func_Output_ret);
bool Result14 = Result13 || CustomHlslDCC4EFFAD55B5AC758354F8DDE4EADE5F122EC28_Func_Output_ret;
float X1;
float Y1;
float Z1;
X1 = Result12.x;
Y1 = Result12.y;
Z1 = Result12.z;
//SetConstantByStaticVariable "/Grid 3D Flip Grid Particles/Map Get/Map Get->Module.Use Landscape"
int Constant21 = 1;
float GetHeight_User_LandscapeCollisionsOutput_Value;
bool GetHeight_User_LandscapeCollisionsOutput_IsValid;
GetHeight_User_LandscapeCollisions(Result12, GetHeight_User_LandscapeCollisionsOutput_Value, GetHeight_User_LandscapeCollisionsOutput_IsValid);
bool Result15 = NiagaraAll(Z1 < GetHeight_User_LandscapeCollisionsOutput_Value);
bool Result16 = Result15 && GetHeight_User_LandscapeCollisionsOutput_IsValid;
bool Result17 = Result14 || Result16;
float Result18 = Context.MapSpawn.Grid3D_Flip_GridParticles.dx * Constant6;
float3 Constant22 = float3(0,0,0);
float3 Constant23 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult1 = Constant23;
bool Constant24 = (false);
bool NiagaraBool_SelectResult1 = Constant24;
float2 Constant25 = float2(0.0, 0.0);
float2 Vector2D_SelectResult1 = Constant25;
float3 Constant26 = float3(0.0, 0.0, 0.0);
float3 Vector3f001_SelectResult1 = Constant26;
Vector3f_SelectResult1 = Result12;
NiagaraBool_SelectResult1 = Result17;
Vector2D_SelectResult1 = Result18;
Vector3f001_SelectResult1 = Constant22;
Vector3f_SelectResult1 = Context.MapSpawn.Particles.Position;
NiagaraBool_SelectResult1 = Context.MapSpawn.Transient.Kill;
Vector2D_SelectResult1 = Context.MapSpawn.Particles.SpriteSize;
Vector3f001_SelectResult1 = Context.MapSpawn.Particles.Velocity;
Context.MapSpawn.Particles.Position = Vector3f_SelectResult1;
Context.MapSpawn.Transient.Kill = NiagaraBool_SelectResult1;
Context.MapSpawn.Particles.SpriteSize = Vector2D_SelectResult1;
Context.MapSpawn.Particles.Velocity = Vector3f001_SelectResult1;
bool Constant28 = false;
bool bool_IfResult;
bool_IfResult = Constant28;
bool_IfResult = Context.MapSpawn.DataInstance.Alive;
Context.MapSpawn.DataInstance.Alive = bool_IfResult;
float3 Constant31 = float3(0,0,-980);
float3 Result19 = Context.MapUpdate.Transient.PhysicsForce + Constant31;
float3 Result20 = Result19 * Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result21 = Context.MapUpdate.Particles.Velocity + Result20;
Context.MapUpdate.Particles.Velocity = Result21;
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
int Constant32 = 0;
CustomHlsl6335FD618A48BBC0736B8747B7B1787DB6173166Emitter_KernelGrid_Func_(Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius, Context);
float Constant34 = 0;
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Constant34;
float3 Constant36 = float3(0,0,0);
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Constant36;
int Constant42 = 0;
bool Result22 = NiagaraAll(In_SourceSpace == Constant42);
int Constant43 = 0;
bool Result23 = NiagaraAll(In_DestinationSpace == Constant43);
bool Result24 = Result22 && Result23;
int Constant44 = 1;
bool Result25 = NiagaraAll(In_SourceSpace == Constant44);
int Constant45 = 1;
bool Result26 = NiagaraAll(In_DestinationSpace == Constant45);
bool Result27 = Result25 && Result26;
bool Result28 = Result24 || Result27;
int Constant46 = 2;
bool Result29 = NiagaraAll(In_SourceSpace == Constant46);
int Constant47 = 2;
bool Result30 = NiagaraAll(In_DestinationSpace == Constant47);
bool Result31 = Result29 && Result30;
bool Result32 = Result28 || Result31;
bool Result33 = Result22 && Result30;
bool Result34 = Result29 && Result23;
bool Result35 = Result33 || Result34;
bool Result36 = In_bLocalSpace && Result35;
bool Result37 = Result32 || Result36;
bool Result38 = !In_bLocalSpace;
bool Result39 = Result22 && Result26;
bool Result40 = Result25 && Result23;
bool Result41 = Result39 || Result40;
bool Result42 = Result38 && Result41;
bool Result43 = Result37 || Result42;
bool Result44 = In_bLocalSpace && Result39;
bool Result45 = Result29 && Result26;
bool Result46 = Result44 || Result45;
bool Result47 = Result38 && Result34;
bool Result48 = Result46 || Result47;
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result43;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result48;
bool Constant41 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal;
float4x4 TransformBase_Func_Output_OutTransform;
bool TransformBase_Func_Output_LocalToWorld;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant41, TransformBase_Func_Output_bUseOriginal, TransformBase_Func_Output_OutTransform, TransformBase_Func_Output_LocalToWorld, Context);
float3 Result49 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InPosition;
Vector_IfResult = Result49;
Out_OutPosition = Vector_IfResult;
bool Constant51 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal1;
float4x4 TransformBase_Func_Output_OutTransform1;
bool TransformBase_Func_Output_LocalToWorld1;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant51, TransformBase_Func_Output_bUseOriginal1, TransformBase_Func_Output_OutTransform1, TransformBase_Func_Output_LocalToWorld1, Context);
float3 Result51 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result51;
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
int Constant38 = 0;
int Constant39 = 1;
bool Constant40 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Position, Constant38, Constant39, Constant40, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result50 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(Result50, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant48 = 0;
int Constant49 = 1;
bool Constant50 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Velocity, Constant48, Constant49, Constant50, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result52 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlslCAD8B6269D32D9E9836479234D5028BE6B2E86C9Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result52, Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
int Constant52 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant53 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
int Constant54 = 0;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Resample = Constant54;
float3 Constant55 = float3(0,0,0);
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Unit = Constant55;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
Context.MapSimStage5_ComputeBoundary.Transient.SimFloat = Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
float3 Constant57 = float3(0,0,0);
Out_Output = Constant57;
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
float Constant58 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float3 Output11;
Output11.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output11.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output11.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result53 = Output11 + Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OffsetSamplePosition;
float X2;
float Y2;
float Z2;
X2 = Result53.x;
Y2 = Result53.y;
Z2 = Result53.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit1;
IndexToUnit_Emitter_SimGrid(X2, Y2, Z2, IndexToUnit_Emitter_SimGridOutput_Unit1);
float3 Constant59 = float3(0,0,0);
float3 Output12;
Output12.x = IndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output12.y = IndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output12.z = IndexToUnit_Emitter_SimGridOutput_Unit1.z;
float3 Result54 = mul(float4(Output12,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit1;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Constant59;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos = Result54;
float Constant60 = 0.001;
float GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity;
GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, Context.MapSimStage5_ComputeBoundary.Engine.WorldDeltaTime, Context.MapSimStage5_ComputeBoundary.Engine.System.TimeStepFraction, Constant60, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity);
float Constant61 = 0;
bool Result55 = NiagaraAll(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance <= Constant61);
float Constant62 = 1;
float3 Result56 = GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity * Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale;
float3 Result57 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity + Result56;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
int Constant63 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX1;
int GetNumCells_Emitter_SimGridOutput_NumCellsY1;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ1;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_Output_Boundary;
CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant63, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_Output_Boundary);
float Constant64 = (0.0);
float NiagaraFloat_SelectResult2 = Constant64;
float3 Constant65 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult2 = Constant65;
NiagaraFloat_SelectResult2 = Constant62;
Vector3f_SelectResult2 = Result57;
NiagaraFloat_SelectResult2 = CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_Output_Boundary;
Vector3f_SelectResult2 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Vector3f_SelectResult2;
float3 Output13;
Output13.x = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.x;
Output13.y = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.y;
Output13.z = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.z;
float X3;
float Y3;
float Z3;
X3 = Output13.x;
Y3 = Output13.y;
Z3 = Output13.z;
float GetHeight_User_LandscapeCollisionsOutput_Value1;
bool GetHeight_User_LandscapeCollisionsOutput_IsValid1;
GetHeight_User_LandscapeCollisions(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, GetHeight_User_LandscapeCollisionsOutput_Value1, GetHeight_User_LandscapeCollisionsOutput_IsValid1);
bool Result58 = NiagaraAll(Z3 < GetHeight_User_LandscapeCollisionsOutput_Value1);
float Constant66 = 1;
float Result59 = Z3 - GetHeight_User_LandscapeCollisionsOutput_Value1;
float Constant67 = 1e+17;
float Result60 = min(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, Constant67);
float Result61 = min(Result59, Result60);
float Constant68 = (0.0);
float NiagaraFloat_SelectResult3 = Constant68;
float Constant69 = (0.0);
float NiagaraFloat001_SelectResult3 = Constant69;
NiagaraFloat_SelectResult3 = Constant66;
NiagaraFloat001_SelectResult3 = Result61;
NiagaraFloat_SelectResult3 = NiagaraFloat_SelectResult2;
NiagaraFloat001_SelectResult3 = Result60;
float CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_Output_RetBoundary;
CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_(NiagaraFloat_SelectResult3, Context.MapSimStage5_ComputeBoundary.Transient.Boundary, CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_Output_RetBoundary);
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_Output_RetBoundary;
Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance = NiagaraFloat001_SelectResult3;
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
float4 Output14;
Output14.x = X4;
Output14.y = Y4;
Output14.z = Z4;
Output14.w = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output14);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample To Another Grid"
int Constant70 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant71 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Logic OR (Static)/Logic OR (Static)->Result"
int Constant72 = 0;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Resample = Constant72;
float3 Constant73 = float3(0,0,0);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Unit = Constant73;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
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
float CustomHlsl3C63873390BA78F3DCCAA59B91D54E621B29B0C7_Func_Output_AreaFraction;
CustomHlsl3C63873390BA78F3DCCAA59B91D54E621B29B0C7_Func_(In_INPUT_VAR, CustomHlsl3C63873390BA78F3DCCAA59B91D54E621B29B0C7_Func_Output_AreaFraction);
Out_AreaFraction = CustomHlsl3C63873390BA78F3DCCAA59B91D54E621B29B0C7_Func_Output_AreaFraction;
Out_Avg = .25 * (In_A+In_B+In_C+In_D);
float3 CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri0;
float3 CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri1;
float3 CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri2;
float3 CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri3;
CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_(In_ppp, In_ppn, In_pnn, In_pnp, CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri0, CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri1, CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri2, CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri3);
float ComputeAreaFraction_Func_Output_AreaFraction;
ComputeAreaFraction_Func_(CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri0, ComputeAreaFraction_Func_Output_AreaFraction, Context);
float ComputeAreaFraction_Func_Output_AreaFraction1;
ComputeAreaFraction_Func_(CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri1, ComputeAreaFraction_Func_Output_AreaFraction1, Context);
float ComputeAreaFraction_Func_Output_AreaFraction2;
ComputeAreaFraction_Func_(CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri2, ComputeAreaFraction_Func_Output_AreaFraction2, Context);
float ComputeAreaFraction_Func_Output_AreaFraction3;
ComputeAreaFraction_Func_(CustomHlslE98E3E753EA1BAF5E194992C073964503B0F0CC7_Func_Output_Tri3, ComputeAreaFraction_Func_Output_AreaFraction3, Context);
float CustomHlslEACD34187752505B34B1CF131B7E41A83F6B6D3A_Func_Output_Avg;
CustomHlslEACD34187752505B34B1CF131B7E41A83F6B6D3A_Func_(ComputeAreaFraction_Func_Output_AreaFraction, ComputeAreaFraction_Func_Output_AreaFraction1, ComputeAreaFraction_Func_Output_AreaFraction2, ComputeAreaFraction_Func_Output_AreaFraction3, CustomHlslEACD34187752505B34B1CF131B7E41A83F6B6D3A_Func_Output_Avg);
float3 CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri0;
float3 CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri1;
float3 CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri2;
float3 CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri3;
CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_(In_ppp, In_ppn, In_npp, In_npn, CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri0, CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri1, CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri2, CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri3);
float ComputeAreaFraction_Func_Output_AreaFraction4;
ComputeAreaFraction_Func_(CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri0, ComputeAreaFraction_Func_Output_AreaFraction4, Context);
float ComputeAreaFraction_Func_Output_AreaFraction5;
ComputeAreaFraction_Func_(CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri1, ComputeAreaFraction_Func_Output_AreaFraction5, Context);
float ComputeAreaFraction_Func_Output_AreaFraction6;
ComputeAreaFraction_Func_(CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri2, ComputeAreaFraction_Func_Output_AreaFraction6, Context);
float ComputeAreaFraction_Func_Output_AreaFraction7;
ComputeAreaFraction_Func_(CustomHlsl6CD1A0E0F905DBAB820A9106490F400D0B3767C0_Func_Output_Tri3, ComputeAreaFraction_Func_Output_AreaFraction7, Context);
float CustomHlsl1ADEAE150AFB129B5A61737CCC3C942EBD7DE4C3_Func_Output_Avg;
CustomHlsl1ADEAE150AFB129B5A61737CCC3C942EBD7DE4C3_Func_(ComputeAreaFraction_Func_Output_AreaFraction4, ComputeAreaFraction_Func_Output_AreaFraction5, ComputeAreaFraction_Func_Output_AreaFraction6, ComputeAreaFraction_Func_Output_AreaFraction7, CustomHlsl1ADEAE150AFB129B5A61737CCC3C942EBD7DE4C3_Func_Output_Avg);
float3 CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri0;
float3 CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri1;
float3 CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri2;
float3 CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri3;
CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_(In_ppp, In_pnp, In_nnp, In_npp, CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri0, CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri1, CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri2, CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri3);
float ComputeAreaFraction_Func_Output_AreaFraction8;
ComputeAreaFraction_Func_(CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri0, ComputeAreaFraction_Func_Output_AreaFraction8, Context);
float ComputeAreaFraction_Func_Output_AreaFraction9;
ComputeAreaFraction_Func_(CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri1, ComputeAreaFraction_Func_Output_AreaFraction9, Context);
float ComputeAreaFraction_Func_Output_AreaFraction10;
ComputeAreaFraction_Func_(CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri2, ComputeAreaFraction_Func_Output_AreaFraction10, Context);
float ComputeAreaFraction_Func_Output_AreaFraction11;
ComputeAreaFraction_Func_(CustomHlslDE83111B96F4807AF5D473773C3F805A807F08D1_Func_Output_Tri3, ComputeAreaFraction_Func_Output_AreaFraction11, Context);
float CustomHlsl15CD40E58E2257CE95A4349D7990BBFB49A7B406_Func_Output_Avg;
CustomHlsl15CD40E58E2257CE95A4349D7990BBFB49A7B406_Func_(ComputeAreaFraction_Func_Output_AreaFraction8, ComputeAreaFraction_Func_Output_AreaFraction9, ComputeAreaFraction_Func_Output_AreaFraction10, ComputeAreaFraction_Func_Output_AreaFraction11, CustomHlsl15CD40E58E2257CE95A4349D7990BBFB49A7B406_Func_Output_Avg);
float3 Output16;
Output16.x = CustomHlslEACD34187752505B34B1CF131B7E41A83F6B6D3A_Func_Output_Avg;
Output16.y = CustomHlsl1ADEAE150AFB129B5A61737CCC3C942EBD7DE4C3_Func_Output_Avg;
Output16.z = CustomHlsl15CD40E58E2257CE95A4349D7990BBFB49A7B406_Func_Output_Avg;
Out_FaceFractions = Output16;
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
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppp;
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppn;
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnn;
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnp;
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_nnp;
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npp;
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npn;
float CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_nnn;
float3 CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, In_dt, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_AverageSolidVelocity);
float3 ComputeFaceFractions_Func_Output_FaceFractions;
ComputeFaceFractions_Func_(CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npn, ComputeFaceFractions_Func_Output_FaceFractions, Context);
float X5;
float Y5;
float Z5;
X5 = ComputeFaceFractions_Func_Output_FaceFractions.x;
Y5 = ComputeFaceFractions_Func_Output_FaceFractions.y;
Z5 = ComputeFaceFractions_Func_Output_FaceFractions.z;
bool CustomHlsl0018AE99D4DB915994E43B6ECA0F4E51352D7897B71_Func_Output_IsFullyInsideBoundary;
CustomHlsl0018AE99D4DB915994E43B6ECA0F4E51352D7897B71_Func_(CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_npn, CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl0018AE99D4DB915994E43B6ECA0F4E51352D7897B71_Func_Output_IsFullyInsideBoundary);
Out_XFace = X5;
Out_YFace = Y5;
Out_ZFace = Z5;
Out_IsFullyInsideBoundary = CustomHlsl0018AE99D4DB915994E43B6ECA0F4E51352D7897B71_Func_Output_IsFullyInsideBoundary;
Out_SolidVelocity = CustomHlsl900884142E2F4C36C569313576AD1875C1BCF696Emitter_TransientGrid_Func_Output_AverageSolidVelocity;
Out_FaceFraction.x = In_Face.x > 1e-20 ? max(In_Face.x, In_MinFaceFraction) : 0;
Out_FaceFraction.y = In_Face.y > 1e-20 ? max(In_Face.y, In_MinFaceFraction) : 0;
Out_FaceFraction.z = In_Face.z > 1e-20 ? max(In_Face.z, In_MinFaceFraction) : 0;
Out_FaceFraction = saturate(Out_FaceFraction);
float Constant76 = 0;
float3 ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
ExecutionIndexToUnit_Emitter_TransientGrid(ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit);
float3 Constant77 = float3(0,0,0);
float3 Output15;
Output15.x = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.x;
Output15.y = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.y;
Output15.z = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.z;
float3 Result62 = mul(float4(Output15,1.0),Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld).xyz;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.UnitPosition = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Constant77;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.WorldPos = Result62;
float Constant78 = 0;
float Constant79 = 0.0001;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
bool Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary;
float3 Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(Constant78, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity, Context);
float3 Output17;
Output17.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output17.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output17.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
float3 CustomHlslE7527ACD45F9553335695B107E94869069F42A83_Func_Output_FaceFraction;
CustomHlslE7527ACD45F9553335695B107E94869069F42A83_Func_(Output17, Constant79, CustomHlslE7527ACD45F9553335695B107E94869069F42A83_Func_Output_FaceFraction);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction = CustomHlslE7527ACD45F9553335695B107E94869069F42A83_Func_Output_FaceFraction;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
float Constant80 = 1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2);
int Constant81 = 2;
int GetNumCells_Emitter_TransientGridOutput_NumCellsX;
int GetNumCells_Emitter_TransientGridOutput_NumCellsY;
int GetNumCells_Emitter_TransientGridOutput_NumCellsZ;
GetNumCells_Emitter_TransientGrid(GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ);
float CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_Output_Boundary1;
CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, Constant81, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_Output_Boundary1);
float Constant82 = (0.0);
float NiagaraFloat_SelectResult4 = Constant82;
NiagaraFloat_SelectResult4 = Constant80;
NiagaraFloat_SelectResult4 = CustomHlslAC426F8C39E785EF710223929EA92FD5A0EA617A_Func_Output_Boundary1;
float CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_Output_RetBoundary1;
CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_(NiagaraFloat_SelectResult4, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat, CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_Output_RetBoundary1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary = CustomHlsl0A1BE31E0FCB9C1F29E0B748C79D64BD81255E0F_Func_Output_RetBoundary1;
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
float4 Output18;
Output18.x = X6;
Output18.y = Y6;
Output18.z = Z6;
Output18.w = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3, Output18);
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
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ4, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float3 Output19;
Output19.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Output19.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Output19.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Output110;
Output110 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity = Output19;
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary = Output110;
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
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ);
int Constant88 = 1;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlsl6DC16740F3D5F5D5071A72B659051D78F70BD8EBEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl6DC16740F3D5F5D5071A72B659051D78F70BD8EBEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant88, Context.MapSimStage7_ExtrapolateVelocity.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl6DC16740F3D5F5D5071A72B659051D78F70BD8EBEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlsl6DC16740F3D5F5D5071A72B659051D78F70BD8EBEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
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
float CustomHlsl70C81733FC56A67104CBCD5B87BB1CF6C604D10EEmitter_SimGrid_Func_Output_Div;
CustomHlsl70C81733FC56A67104CBCD5B87BB1CF6C604D10EEmitter_SimGrid_Func_(Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl70C81733FC56A67104CBCD5B87BB1CF6C604D10EEmitter_SimGrid_Func_Output_Div);
Context.MapSimStage8_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl70C81733FC56A67104CBCD5B87BB1CF6C604D10EEmitter_SimGrid_Func_Output_Div;
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
int CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_IterationIndex;
int CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_MaxIterations;
float CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NormalizedIterationIndex;
int CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_LoopIndex;
int CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NumberOfLoops;
float CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NormalizedLoopIndex;
CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_(CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_IterationIndex, CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_MaxIterations, CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NormalizedIterationIndex, CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_LoopIndex, CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NumberOfLoops, CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NormalizedLoopIndex);
Out_IterationIndex = CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_IterationIndex;
Out_MaxIterations = CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_MaxIterations;
Out_NormalizedIterationIndex = CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NormalizedIterationIndex;
Out_LoopIndex = CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_LoopIndex;
Out_NumberOfLoops = CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlsl544B5C8B17B68CA6DF78CA4CDD885DDB50717340_Func_Output_NormalizedLoopIndex;
Out_OutFloat = saturate (In_InFloat);
float CustomHlsl3C943BB6CE1D7BB6B9BDBB407C10A9E0F36123BA_Func_Output_OutFloat;
CustomHlsl3C943BB6CE1D7BB6B9BDBB407C10A9E0F36123BA_Func_(In_Value, CustomHlsl3C943BB6CE1D7BB6B9BDBB407C10A9E0F36123BA_Func_Output_OutFloat);
Out_ClampedValue = CustomHlsl3C943BB6CE1D7BB6B9BDBB407C10A9E0F36123BA_Func_Output_OutFloat;
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
int Constant99 = 0;
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
float4 CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_right;
float4 CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_left;
float4 CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_up;
float4 CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_down;
float4 CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_front;
float4 CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_back;
CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_right, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_left, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_up, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_down, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_front, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_back);
float CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_right;
float CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_left;
float CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_up;
float CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_down;
float CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_front;
float CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_back;
CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_(CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_right, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_left, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_up, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_down, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_front, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_back, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_right, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_left, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_up, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_down, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_front, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_back);
float CustomHlsl6FD064129ACB5A3F097F9D372E2C286D250FEE0DEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
CustomHlsl6FD064129ACB5A3F097F9D372E2C286D250FEE0DEmitter_PressureGridEmitter_TransientGrid_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence, SimulationStageIterationInfo_Func_Output_IterationIndex, SaturateFloat_Particle_Func_Output_ClampedValue, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_right, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_left, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_up, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_down, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_front, CustomHlsl61A1DA2A7CFCCEC70F01503874B522E7F3842AC4_Func_Output_F_back, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_right, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_left, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_up, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_down, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_front, CustomHlslA4AD97E7EF1EACB781976E6C6F048570B661720EEmitter_TransientGrid_Func_Output_B_back, CustomHlsl6FD064129ACB5A3F097F9D372E2C286D250FEE0DEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlsl6FD064129ACB5A3F097F9D372E2C286D250FEE0DEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
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
float3 CustomHlsl50C340EA0C6377CA14E3BDEB061F941EC92FE7C9Emitter_PressureGrid_Func_Output_Grad;
CustomHlsl50C340EA0C6377CA14E3BDEB061F941EC92FE7C9Emitter_PressureGrid_Func_(Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex, CustomHlsl50C340EA0C6377CA14E3BDEB061F941EC92FE7C9Emitter_PressureGrid_Func_Output_Grad);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlsl50C340EA0C6377CA14E3BDEB061F941EC92FE7C9Emitter_PressureGrid_Func_Output_Grad;
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
int Constant100 = 0;
float3 Result63 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient * Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt;
float3 Result64 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity - Result63;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5);
float4 CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_back;
CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_right, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_left, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_up, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_down, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_front, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_back);
float CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_right;
float CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_left;
float CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_up;
float CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_down;
float CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_front;
float CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_back;
CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_(CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_right, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_left, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_up, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_down, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_front, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_back, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_right, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_left, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_up, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_down, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_front, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_back);
float3 CustomHlsl0E0EA7F1FB64267C43FDFF3C92BF474180AD415DEmitter_TransientGrid_Func_Output_VelocityOut;
CustomHlsl0E0EA7F1FB64267C43FDFF3C92BF474180AD415DEmitter_TransientGrid_Func_(Result64, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_right, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_left, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_up, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_down, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_front, CustomHlsl2879D50BAEF3556AE4F02A2678BF13B57DA156C7_Func_Output_F_back, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_right, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_left, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_up, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_down, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_front, CustomHlsl5581B6A3DDF810F342344EC02D444138C386B954Emitter_TransientGrid_Func_Output_B_back, CustomHlsl0E0EA7F1FB64267C43FDFF3C92BF474180AD415DEmitter_TransientGrid_Func_Output_VelocityOut);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlsl0E0EA7F1FB64267C43FDFF3C92BF474180AD415DEmitter_TransientGrid_Func_Output_VelocityOut;
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
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity = Output111;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary = Output112;
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
float3 CustomHlslC729A939EF42D984BDC2F0624B4305AF38AEAFD4Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlslC729A939EF42D984BDC2F0624B4305AF38AEAFD4Emitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7, Constant110, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX2, GetNumCells_Emitter_SimGridOutput_NumCellsY2, GetNumCells_Emitter_SimGridOutput_NumCellsZ2, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlslC729A939EF42D984BDC2F0624B4305AF38AEAFD4Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlslC729A939EF42D984BDC2F0624B4305AF38AEAFD4Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
int Constant116 = 0;
bool Result65 = NiagaraAll(In_SourceSpace == Constant116);
int Constant117 = 0;
bool Result66 = NiagaraAll(In_DestinationSpace == Constant117);
bool Result67 = Result65 && Result66;
int Constant118 = 1;
bool Result68 = NiagaraAll(In_SourceSpace == Constant118);
int Constant119 = 1;
bool Result69 = NiagaraAll(In_DestinationSpace == Constant119);
bool Result70 = Result68 && Result69;
bool Result71 = Result67 || Result70;
int Constant120 = 2;
bool Result72 = NiagaraAll(In_SourceSpace == Constant120);
int Constant121 = 2;
bool Result73 = NiagaraAll(In_DestinationSpace == Constant121);
bool Result74 = Result72 && Result73;
bool Result75 = Result71 || Result74;
bool Result76 = Result65 && Result73;
bool Result77 = Result72 && Result66;
bool Result78 = Result76 || Result77;
bool Result79 = In_bLocalSpace && Result78;
bool Result80 = Result75 || Result79;
bool Result81 = !In_bLocalSpace;
bool Result82 = Result65 && Result69;
bool Result83 = Result68 && Result66;
bool Result84 = Result82 || Result83;
bool Result85 = Result81 && Result84;
bool Result86 = Result80 || Result85;
bool Result87 = In_bLocalSpace && Result82;
bool Result88 = Result72 && Result69;
bool Result89 = Result87 || Result88;
bool Result90 = Result81 && Result77;
bool Result91 = Result89 || Result90;
float4x4 Matrix_IfResult4;
Matrix_IfResult4 = In_LocalToWorldTransform;
Matrix_IfResult4 = In_WorldToLocalTransform;
Out_bUseOriginal = Result86;
Out_OutTransform = Matrix_IfResult4;
Out_LocalToWorld = Result91;
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
float3 Result92 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InPosition;
Vector_IfResult2 = Result92;
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
float3 Result103 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InPosition;
Vector_IfResult3 = Result103;
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
float3 Result106 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InVector;
Vector_IfResult4 = Result106;
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
float3 Result109 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InVector;
Vector_IfResult5 = Result109;
Out_OutVector = Vector_IfResult5;
int Constant112 = 0;
int Constant113 = 1;
bool Constant114 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Position, Constant112, Constant113, Constant114, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Output113;
Output113.x = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.x;
Output113.y = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.y;
Output113.z = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.z;
float3 Result93 = mul(float4(((float3)Output113),1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TransientGridOutput_Index;
UnitToFloatIndex_Emitter_TransientGrid(Result93, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result94 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float X7;
float Y7;
float Z7;
X7 = Result94.x;
Y7 = Result94.y;
Z7 = Result94.z;
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
bool CustomHlslD8FF7A26FB69198077FED157A3672E3C130A08B6_Func_Output_IsInside;
CustomHlslD8FF7A26FB69198077FED157A3672E3C130A08B6_Func_(W, CustomHlslD8FF7A26FB69198077FED157A3672E3C130A08B6_Func_Output_IsInside);
float3 Result95 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlsl88BDFB3DAB51A2C7B314E6FEA90042F90330D60A_Func_Output_ret;
CustomHlsl88BDFB3DAB51A2C7B314E6FEA90042F90330D60A_Func_(Result95, CustomHlsl88BDFB3DAB51A2C7B314E6FEA90042F90330D60A_Func_Output_ret);
bool CustomHlsl46B4B78F8616CC0A906E2E126567B0F5906EA7ED_Func_Output_IsInside;
CustomHlsl46B4B78F8616CC0A906E2E126567B0F5906EA7ED_Func_(CustomHlsl88BDFB3DAB51A2C7B314E6FEA90042F90330D60A_Func_Output_ret, CustomHlsl46B4B78F8616CC0A906E2E126567B0F5906EA7ED_Func_Output_IsInside);
bool Result96 = !CustomHlsl46B4B78F8616CC0A906E2E126567B0F5906EA7ED_Func_Output_IsInside;
bool Result97 = CustomHlslD8FF7A26FB69198077FED157A3672E3C130A08B6_Func_Output_IsInside || Result96;
float3 Result98 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result99 = Context.MapSimStage12_FLIP_PICforce.Particles.Position + Result98;
bool CustomHlsl712636B448618B0B8EDDE980E89724DAF414BF5B_Func_Output_IsInside;
CustomHlsl712636B448618B0B8EDDE980E89724DAF414BF5B_Func_(W, CustomHlsl712636B448618B0B8EDDE980E89724DAF414BF5B_Func_Output_IsInside);
float3 Constant122 = float3(0,0,0);
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(Result95, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result100 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result101 = Result100 * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result102 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result101;
int Constant123 = 1;
int Constant124 = 0;
bool Constant125 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result102, Constant123, Constant124, Constant125, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
float3 SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(Result95, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result104 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result105 = Result100 - Result104;
int Constant127 = 0;
int Constant128 = 1;
bool Constant129 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Velocity, Constant127, Constant128, Constant129, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result107 = Result105 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result108 = lerp(Result100,Result107,Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant131 = 1;
int Constant132 = 0;
bool Constant133 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result108, Constant131, Constant132, Constant133, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Constant135 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult5 = Constant135;
float3 Constant136 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult5 = Constant136;
Position_SelectResult5 = Context.MapSimStage12_FLIP_PICforce.Particles.Position;
Velocity_SelectResult5 = Constant122;
Position_SelectResult5 = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Velocity_SelectResult5 = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
float3 Constant137 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult6 = Constant137;
float3 Constant138 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult6 = Constant138;
Position_SelectResult6 = Result99;
Velocity_SelectResult6 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity;
Position_SelectResult6 = Position_SelectResult5;
Velocity_SelectResult6 = Velocity_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.Particles.Position = Position_SelectResult6;
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity = Velocity_SelectResult6;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl46B4B78F8616CC0A906E2E126567B0F5906EA7ED_Func_Output_IsInside;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl712636B448618B0B8EDDE980E89724DAF414BF5B_Func_Output_IsInside;
bool Constant140 = false;
bool bool_IfResult1;
bool_IfResult1 = Constant140;
bool_IfResult1 = Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = bool_IfResult1;
int Constant154 = 0;
bool Result111 = NiagaraAll(In_SourceSpace == Constant154);
int Constant155 = 0;
bool Result112 = NiagaraAll(In_DestinationSpace == Constant155);
bool Result113 = Result111 && Result112;
int Constant156 = 1;
bool Result114 = NiagaraAll(In_SourceSpace == Constant156);
int Constant157 = 1;
bool Result115 = NiagaraAll(In_DestinationSpace == Constant157);
bool Result116 = Result114 && Result115;
bool Result117 = Result113 || Result116;
int Constant158 = 2;
bool Result118 = NiagaraAll(In_SourceSpace == Constant158);
int Constant159 = 2;
bool Result119 = NiagaraAll(In_DestinationSpace == Constant159);
bool Result120 = Result118 && Result119;
bool Result121 = Result117 || Result120;
bool Result122 = Result111 && Result119;
bool Result123 = Result118 && Result112;
bool Result124 = Result122 || Result123;
bool Result125 = In_bLocalSpace && Result124;
bool Result126 = Result121 || Result125;
bool Result127 = !In_bLocalSpace;
bool Result128 = Result111 && Result115;
bool Result129 = Result114 && Result112;
bool Result130 = Result128 || Result129;
bool Result131 = Result127 && Result130;
bool Result132 = Result126 || Result131;
bool Result133 = In_bLocalSpace && Result128;
bool Result134 = Result118 && Result115;
bool Result135 = Result133 || Result134;
bool Result136 = Result127 && Result123;
bool Result137 = Result135 || Result136;
float4x4 Matrix_IfResult8;
Matrix_IfResult8 = In_LocalToWorldTransform;
Matrix_IfResult8 = In_WorldToLocalTransform;
Out_bUseOriginal = Result132;
Out_OutTransform = Matrix_IfResult8;
Out_LocalToWorld = Result137;
float4x4 Constant151 = (float4x4)0;
float4x4 LocalToWorld_SelectResult7 = Constant151;
float4x4 Constant152 = (float4x4)0;
float4x4 WorldToLocal_SelectResult7 = Constant152;
LocalToWorld_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult7 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant153 = false;
bool TransformBase_Func_Output_bUseOriginal6;
float4x4 TransformBase_Func_Output_OutTransform6;
bool TransformBase_Func_Output_LocalToWorld6;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult7, WorldToLocal_SelectResult7, Constant153, TransformBase_Func_Output_bUseOriginal6, TransformBase_Func_Output_OutTransform6, TransformBase_Func_Output_LocalToWorld6, Context);
float3 Result138 = mul(float4(In_Position,1.0),TransformBase_Func_Output_OutTransform6).xyz;
float3 Constant160 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult8 = Constant160;
NiagaraPosition_SelectResult8 = In_Position;
NiagaraPosition_SelectResult8 = Result138;
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
int Constant142 = 0;
int Result110 = ExecIndex();
bool GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(Result110, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
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
float3 NiagaraPosition_SelectResult9 = Constant161;
NiagaraPosition_SelectResult9 = TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult9 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
float3 Result139 = mul(float4(NiagaraPosition_SelectResult9,1.0),Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
float3 Output114;
Output114.x = Result139.x;
Output114.y = Result139.y;
Output114.z = Result139.z;
bool GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid;
float2 GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(Result110, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 UnitToFloatIndex_Emitter_RasterizationGridOutput_Index;
UnitToFloatIndex_Emitter_RasterizationGrid(Output114, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlsl5FEAB372E559B56F64B6A3CDDF10B165CD1E4ACBEmitter_RasterizationGrid_Func_(Output114, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
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
int Result140 = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant165;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1);
float3 Constant166 = float3(1,0,0);
float CustomHlsl054606C9786B3104AB65A6ACECEBE2484664C866Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl054606C9786B3104AB65A6ACECEBE2484664C866Emitter_RasterizationGridEmitter_KernelGrid_Func_(Result140, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1, Constant166, Constant163, CustomHlsl054606C9786B3104AB65A6ACECEBE2484664C866Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlsl054606C9786B3104AB65A6ACECEBE2484664C866Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
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
int Result141 = GetNumCells_Emitter_KernelGridOutput_NumCellsX1 - Constant170;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant171 = float3(0,1,0);
float CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_(Result141, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant171, Constant168, CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage15_SmoothinY.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
int Constant173 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 002/Map Get/Map Get->Module.Axis"
int Constant174 = 2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY2;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX2, GetNumCells_Emitter_KernelGridOutput_NumCellsY2);
int Constant175 = 1;
int Result142 = GetNumCells_Emitter_KernelGridOutput_NumCellsX2 - Constant175;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ1;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1);
float3 Constant176 = float3(0,0,1);
float CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_(Result142, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1, GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1, Constant176, Constant173, CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1);
Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl1AD82A9F16E022F6909FDA1006606DA8D9B50453Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
float Constant180 = 0;
float Constant181 = 0;
float Constant182 = 0;
float4 Output115;
Output115.r = Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red;
Output115.g = Constant180;
Output115.b = Constant181;
Output115.a = Constant182;
Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value = Output115;
bool Constant183 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int Constant184 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant183, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value);
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
bool Constant27 = true;
Context.MapSpawn.DataInstance.Alive = Constant27;
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
float3 Constant29 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant29;
float3 Constant30 = float3(0,0,-980);
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
float Constant33 = 0;
EnterStatScope(5 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage2_InitTemporaryGrid
//Begin Stage Script: MapSimStage3_InitializeStartVelocityGrid!
float3 Constant35 = float3(0,0,0);
EnterStatScope(6 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage3_InitializeStartVelocityGrid
//Begin Stage Script: MapSimStage4_RasterizeParticles!
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToUnit;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToLocal;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_SimFloatIndex;
bool Constant37 = false;
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
int Constant56 = 0;
Context.MapSimStage5_ComputeBoundary.ScratchDynamicInput_01.UseHighPrecision = Constant56;
float3 ScratchDynamicInput_01_Emitter_Func_Output_Output;
ScratchDynamicInput_01_Emitter_Func_(ScratchDynamicInput_01_Emitter_Func_Output_Output, Context);
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld = Context.MapSimStage5_ComputeBoundary.Emitter.UnitToWorld;
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
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.Boundary;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
EnterStatScope(11 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Grid3D_SetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(12 /**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
Grid3D_SetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage5_ComputeBoundary
//Begin Stage Script: MapSimStage6_ComputeBoundaryHighPrecision2!
EnterStatScope(13 /**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Grid3D_GetFluidAttribute006_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.UnitToWorld;
float Constant74 = 0;
float Constant75 = 0.0001;
EnterStatScope(14 /**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.Boundary = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity;
EnterStatScope(15 /**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Grid3D_SetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.ScratchModule_02.FaceVals = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction;
EnterStatScope(16 /**ScratchModule_02_Emitter_Func_*/);
ScratchModule_02_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_02_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage6_ComputeBoundaryHighPrecision2
//Begin Stage Script: MapSimStage7_ExtrapolateVelocity!
EnterStatScope(17 /**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Grid3D_GetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
EnterStatScope(18 /**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex = Context.MapSimStage7_ExtrapolateVelocity.Emitter.SimGrid_SimFloatIndex;
int Constant87 = 1;
EnterStatScope(19 /**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(20 /**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
Context.MapSimStage7_ExtrapolateVelocity.Grid3D_SetFluidAttribute001.StartVelocity = Context.MapSimStage7_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(21 /**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
Grid3D_SetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage7_ExtrapolateVelocity
//Begin Stage Script: MapSimStage8_ComputeDivergence!
Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.dx = Context.MapSimStage8_ComputeDivergence.Emitter.dx;
Context.MapSimStage8_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex = Context.MapSimStage8_ComputeDivergence.Emitter.SimGrid_VelocityIndex;
EnterStatScope(22 /**Grid3D_ComputeDivergence_Emitter_Func_*/);
Grid3D_ComputeDivergence_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeDivergence_Emitter_Func_*/);
float Constant89 = 0;
EnterStatScope(23 /**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
Context.MapSimStage8_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat = Context.MapSimStage8_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div;
EnterStatScope(24 /**Grid3D_SetFluidAttribute_Emitter_Func_*/);
Grid3D_SetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage8_ComputeDivergence
//Begin Stage Script: MapSimStage9_SolvePressure!
EnterStatScope(25 /**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
Grid3D_GetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(26 /**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Grid3D_GetFluidAttribute005_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx = Context.MapSimStage9_SolvePressure.Emitter.dx;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt = Context.MapSimStage9_SolvePressure.Emitter.DeltaTime;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure = Context.MapSimStage9_SolvePressure.Emitter.PressureGrid.Pressure;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Relaxation = Context.MapSimStage9_SolvePressure.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation;
EnterStatScope(27 /**Grid3D_PressureIteration_Emitter_Func_*/);
Grid3D_PressureIteration_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_PressureIteration_Emitter_Func_*/);
Context.MapSimStage9_SolvePressure.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure;
EnterStatScope(28 /**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage9_SolvePressure
//Begin Stage Script: MapSimStage10_ProjectPressure!
Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.dx = Context.MapSimStage10_ProjectPressure.Emitter.dx;
Context.MapSimStage10_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex = Context.MapSimStage10_ProjectPressure.Emitter.SimGrid_PressureIndex;
EnterStatScope(29 /**Grid3D_ComputeGradient_Emitter_Func_*/);
Grid3D_ComputeGradient_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeGradient_Emitter_Func_*/);
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient = Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt = Context.MapSimStage10_ProjectPressure.Emitter.DeltaTime;
Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity = Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity;
EnterStatScope(30 /**Grid3D_ProjectPressure_Emitter_Func_*/);
Grid3D_ProjectPressure_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ProjectPressure_Emitter_Func_*/);
Context.MapSimStage10_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity = Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity;
EnterStatScope(31 /**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage10_ProjectPressure
//Begin Stage Script: MapSimStage11_ExtrapolateVelocitiesAgain!
EnterStatScope(32 /**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
Grid3D_GetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
EnterStatScope(33 /**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Grid3D_GetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
EnterStatScope(34 /**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
EnterStatScope(35 /**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Grid3D_Visualize_VectorField_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_BoundaryIndex;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid_VelocityIndex;
int Constant109 = 1;
EnterStatScope(36 /**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity;
EnterStatScope(37 /**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage11_ExtrapolateVelocitiesAgain
//Begin Stage Script: MapSimStage12_FLIP_PICforce!
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.MapSimStage12_FLIP_PICforce.Emitter.LocalToWorld;
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.MapSimStage12_FLIP_PICforce.Emitter.WorldToUnit;
Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip = Context.MapSimStage12_FLIP_PICforce.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio;
bool Constant111 = false;
EnterStatScope(38 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.MapSimStage12_FLIP_PICforce.KillParticles.KillParticles = Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant139 = true;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = Constant139;
EnterStatScope(39 /**KillParticles_Emitter_Func_*/);
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
EnterStatScope(40 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
RasterizationGrid_ParticleSource_Emitter_Func_(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_FillRasterizationGrid
//Begin Stage Script: MapSimStage14_SmoothinX!
int Constant162 = 0;
EnterStatScope(41 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Grid3D_ConvolveAxis001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(42 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_SmoothinX
//Begin Stage Script: MapSimStage15_SmoothinY!
int Constant167 = 0;
EnterStatScope(43 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Grid3D_ConvolveAxis_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(44 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage15_SmoothinY
//Begin Stage Script: MapSimStage16_SmoothinZandOutput!
int Constant172 = 0;
EnterStatScope(45 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Grid3D_ConvolveAxis002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red = Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
float Constant177 = 0;
float Constant178 = 0;
float Constant179 = 0;
EnterStatScope(46 /**Grid3D_SetRTValues_Emitter_Func_*/);
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
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(˙
_\õ=õ):;l˙<
;©spŸ4◊≈QìX&≠
;©spŸ4◊≈QìX&X
ñ6sôRsHüeß;ÄÃSá≠
ñ6sôRsHüeß;ÄÃSáX
ád˘Ôn;…G¶ﬁ=m˙ÄD(˙
ád˘Ôn;…G¶ﬁ=m˙ÄD(o
‰S∫Ì=M9O†<ù.Ü;mîm
T5`;BºÎ8
2£;íy–¬
˛AqˇQ@–I±õ5;
Bà;r‚=µç¶ì
»8?ôk]•∏;C
// SimStage[1] = Find Secondary Emission Points
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
int Emitter_MaxSecondaryParticlesPerFrame;
float Emitter_SpawnRate;
float4x4 PREV_Emitter_UnitToWorld;
float4x4 PREV_Emitter_WorldToUnit;
int PREV_Emitter_MaxSecondaryParticlesPerFrame;
float PREV_Emitter_DeltaTime;
float PREV_Emitter_dx;
int PREV_Emitter_SimGrid_VelocityIndex;
float PREV_Emitter_SpawnRate;
float Value;
float AgingRate;
bool FirstFrame;
float Lifetime;
float4 DynamicMaterialParameter;
NiagaraID ID;
float NormalizedAge;
FParamMap0_Particles_Previous Previous;
int State;
FParamMap0_OUTPUT_VAR_Grid3D_Secondary_UpdateParticles Grid3D_Secondary_UpdateParticles;
FParamMap0_OUTPUT_VAR_ParticleState ParticleState;
float A;
float B;
int INT_VAR;
float Emitter_InterpSpawnStartDt;
int Emitter_SpawnGroup;
float Emitter_SpawnInterval;
int InterpSpawn_Index;
float InterpSpawn_InvSpawnTime;
float InterpSpawn_InvUpdateTime;
float InterpSpawn_SpawnTime;
float InterpSpawn_UpdateTime;
float SpawnInterp;
float SimDt;
int MaxSecondaryParticlesPerFrame;
float SimDx;
float CurveIndex;
int ExecutionCount;
float SpawnRate;
float Index0Param1;
float Index0Param2;
float Index0Param4;
bool Param0WriteEnabled;
bool Param1WriteEnabled;
bool Param2WriteEnabled;
bool Param3WriteEnabled;
int Age;
int DynamicMaterialParameter;
int Lifetime;
int NormalizedAge;
FParamMap0_Array_Previous Previous;
FParamMap0_DynamicMaterialParameters DynamicMaterialParameters;
FParamMap0_FloatFromCurve FloatFromCurve;
FParamMap0_Grid3D_Secondary_EmissionPoints Grid3D_Secondary_EmissionPoints;
FParamMap0_Grid3D_Secondary_SpawnParticles Grid3D_Secondary_SpawnParticles;
FParamMap0_Grid3D_Secondary_UpdateParticles Grid3D_Secondary_UpdateParticles;
FParamMap0_Interpolation Interpolation;
FParamMap0_MakeFloatFromInt MakeFloatFromInt;
FParamMap0_Multiply_Float Multiply_Float;
FParamMap0_ParticleState ParticleState;
FParamMap0_ScratchModule ScratchModule;
FParamMap0_Vector2DFromFloat001 Vector2DFromFloat001;
#if ((SimulationStageIndex == 1)) // MapSimStage1_FindSecondaryEmissionPoints
FParamMap0 MapSimStage1_FindSecondaryEmissionPoints;
#endif // MapSimStage1_FindSecondaryEmissionPoints
void CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void SampleCurve_Emitter_FloatFromCurve_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void Vector2DFromFloat001_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void RandomRangeFloat001_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void ScratchModule_Emitter_Func_(inout FSimulationContext Context);
void GetParticleNeighborCount_Emitter_EmissionCounter(int In_LINEAR_VAR, out int Out_NeighborCount);
void GetNumCells_Emitter_EmissionPositions(out int Out_NumCellsX, out int Out_NumCellsY);
void GetGridValue_Emitter_EmissionPositions(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void SamplePreviousGridVector3Value_Emitter_SimGridReader_AttributeVelocity(float3 In_Unit, out float3 Out_Value);
void CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_(int In_Index, int In_MaxSecondaryParticlesPerFrame, int In_EmissionCount, float4x4 In_UnitToWorld, out float3 Out_World, out bool Out_IsAlive, out float3 Out_Velocity);
void GetRandomInfo_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float2 In_Min, float2 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, bool In_FixedOverrideSeed, out float2 Out_Result, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float In_Min, float In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float Out_Result, inout FSimulationContext Context);
void RandomUnitVector_Func_(int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float3 Out_UnitVector3D, out float2 Out_UnitVector2D, inout FSimulationContext Context);
void RemapRange_ClampResults_true_Func_(float3 In_Value, float3 In_InputMin, float3 In_InputMax, float3 In_OutputMin, float3 In_OutputMax, out float3 Out_NewOutput, inout FSimulationContext Context);
void Grid3D_Secondary_SpawnParticles_Emitter_Func_(inout FSimulationContext Context);
void SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDF(float3 In_Unit, out float Out_Value);
void CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_(float3 In_Position, float3 In_CurrUnit, float3 In_InPosition, float In_SimDt, float3 In_Velocity, bool In_Alive, float3 In_BubbleBounancy, float3 In_Gravity, float In_FoamThickness, float In_FoamAgingRate, float In_SprayAgingRate, float In_BubbleAgingRate, int In_State, out float3 Out_OutPosition, out float3 Out_OutVelocity, out bool Out_OutAlive, out int Out_OutState, out float Out_AgingRate);
void SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundary(float3 In_Unit, out float Out_Value);
void CustomHlsl004FF4EB03EB2F5CF4BF3A343960131422B247D1839_Func_(float In_Mask, out bool Out_IsInside);
void Grid3D_Secondary_UpdateParticles_Emitter_Func_(inout FSimulationContext Context);
void MakeFloatFromInt_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat002_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat003_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void DynamicMaterialParameters_Emitter_Func_(inout FSimulationContext Context);
void Multiply_Float_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void ParticleState_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGridReader(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetGridValue_Emitter_SimGridReader(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslBA7567051752165D1D96DA69BDD985B481B20EF7Emitter_SimGridReader_Func_(float In_dx, int In_VectorIndex, int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_curl);
void ExecutionIndexToUnit_Emitter_SimGridReader(out float3 Out_Unit);
void GetPreviousVectorValue_Emitter_SimGridReader_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void SetParticleNeighborCount_Emitter_EmissionCounter(int In_LINEAR_VAR, int In_Increment, out int Out_PrevNeighborCount);
void SetGridValue_Emitter_EmissionPositions(int In_IndexX, int In_IndexY, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl7F1DB03B357DB1410BDF43A0E7AF84B5B9A3B520Emitter_EmissionCounterEmitter_EmissionPositions_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, float In_SimDt, float In_EmissionMult, float In_VorticityMagnitude, float In_MinEmitVorticity, float In_MaxEmitVorticity, int In_MaxSecondaryParticlesPerFrame, float3 In_CurrUnit, float In_SDFValue, float In_MinEmitVelocityMagnitude, float In_MaxEmitVelocityMagnitude, float In_VelocityMagnitude, float In_VorticityEmissionMult, float In_VelocityEmissionMult, float In_Random0To1, float2 In_EmissionClamp, float In_SDFMinValue, float In_SDFMaxValue, float In_AccelMagnitude, float In_MinEmitAccelMagnitude, float In_MaxEmitAccelMagnitude, float In_AccelEmissionMult, inout FSimulationContext Context);
void Grid3D_Secondary_EmissionPoints_Emitter_Func_(inout FSimulationContext Context);
bool Constant18 = false;
float Result = In_FloatMax - In_FloatMin;
float Result1 = rand_float(Result);
float Result2 = In_FloatMin + Result1;
Out_RandomFloat = Result2;
Out_IsDeterministic = Constant18;
int Constant11 = (0);
float Constant12 = 0;
float Constant13 = 1;
int Constant14 = 0;
int Constant15 = 0;
int Constant16 = (0);
int Constant17 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant11, Constant12, Constant13, Constant14, Constant15, Constant16, Constant17, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
float Constant20 = 1.5;
float SampleCurve_Emitter_FloatFromCurve_FloatCurveOutput_Value;
SampleCurve_Emitter_FloatFromCurve_FloatCurve(Context.MapSpawn.FloatFromCurve.CurveIndex, SampleCurve_Emitter_FloatFromCurve_FloatCurveOutput_Value);
float Result3 = SampleCurve_Emitter_FloatFromCurve_FloatCurveOutput_Value * Constant20;
Out_Value = Result3;
float2 Output1;
Output1.x = Context.MapSpawn.Vector2DFromFloat001.Value;
Output1.y = Context.MapSpawn.Vector2DFromFloat001.Value;
Out_Vec2 = Output1;
int Constant24 = (0);
float Constant25 = 2;
float Constant26 = 3;
int Constant27 = 0;
int Constant28 = 0;
int Constant29 = (0);
int Constant30 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant24, Constant25, Constant26, Constant27, Constant28, Constant29, Constant30, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
Context.MapSpawn.Particles.Lifetime = Context.MapSpawn.ScratchModule.Lifetime;
Context.MapSpawn.Particles.SpriteSize = Context.MapSpawn.ScratchModule.SpriteSize;
Out_IsAlive = true;
Out_World = float3(0,0,0);
Out_Velocity = float3(0,0,0);
int2 NumCells;
GetNumCells_Emitter_EmissionPositions(NumCells.x, NumCells.y);
  float3 Unit = float3(0,0,0);
  int xx = In_Index % NumCells.x;
  int yy = In_Index / NumCells.x;
  GetGridValue_Emitter_EmissionPositions(xx, yy, 0, Unit.x);
  GetGridValue_Emitter_EmissionPositions(xx, yy, 1, Unit.y);
  GetGridValue_Emitter_EmissionPositions(xx, yy, 2, Unit.z);
  SamplePreviousGridVector3Value_Emitter_SimGridReader_AttributeVelocity(Unit, Out_Velocity);
//SimGridReader.SampleGrid(Unit.x, Unit.y, Unit.z, 0, Velocity.x);
//SimGridReader.SampleGrid(Unit.x, Unit.y, Unit.z, 1, Velocity.y);
//SimGridReader.SampleGrid(Unit.x, Unit.y, Unit.z, 2, Velocity.z);
  Out_World = mul(float4(Unit, 1), In_UnitToWorld).xyz;
  Out_IsAlive = true;
  Out_IsAlive = false;
  Color = float4(1,0,0,1);
  Color = float4(0,1,0,1);
Color = float4(1,0,0,1);
bool Constant54 = false;
int Constant55 = 0;
bool Result5 = NiagaraAll(In_RandomnessMode == Constant55);
bool Result6 = Constant54 && Result5;
int Constant56 = 1;
bool Result7 = NiagaraAll(In_RandomnessMode == Constant56);
bool Result8 = Result6 || Result7;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapSpawn.Emitter.RandomSeed;
int Constant57 = 0;
int Constant58 = 0;
int Seed1_IfResult;
int Seed2_IfResult;
int Seed3_IfResult;
Seed1_IfResult = Seed_IfResult;
Seed2_IfResult = Constant57;
Seed3_IfResult = Constant58;
Seed1_IfResult = Context.MapSpawn.Particles.UniqueID;
Seed2_IfResult = Context.MapSpawn.Engine.System.TickCount;
Seed3_IfResult = Seed_IfResult;
int Constant59 = -1;
int Constant60 = -1;
int Constant61 = -1;
int Seed1_IfResult1;
int Seed2_IfResult1;
int Seed3_IfResult1;
Seed1_IfResult1 = Seed1_IfResult;
Seed2_IfResult1 = Seed2_IfResult;
Seed3_IfResult1 = Seed3_IfResult;
Seed1_IfResult1 = Constant59;
Seed2_IfResult1 = Constant60;
Seed3_IfResult1 = Constant61;
NiagaraRandInfo Output11;
Output11.Seed1 = Seed1_IfResult1;
Output11.Seed2 = Seed2_IfResult1;
Output11.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output11;
Out_UseDeterministicRandoms = Result8;
int Constant50 = (0);
int Constant53 = (0);
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant50, In_OverrideSeed, Constant52, Constant53, In_FixedOverrideSeed, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float2 Result9 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed1;
Seed2 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed2;
Seed3 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed3;
float2 Result10 = rand_float(Result9, Seed1, Seed2, Seed3);
float2 Result11 = rand_float(Result9);
float2 Random_IfResult;
Random_IfResult = Result10;
Random_IfResult = Result11;
float2 Result12 = In_Min + Random_IfResult;
Out_Result = Result12;
int Constant67 = (0);
bool Constant68 = false;
int Constant69 = 0;
int Constant70 = (0);
bool Constant71 = false;
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant67, In_OverrideSeed, Constant69, Constant70, Constant71, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1, Context);
float Result20 = In_Max - In_Min;
int Seed11;
int Seed21;
int Seed31;
Seed11 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed1;
Seed21 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed2;
Seed31 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed3;
float Result21 = rand_float(Result20, Seed11, Seed21, Seed31);
float Result22 = rand_float(Result20);
float Random_IfResult1;
Random_IfResult1 = Result21;
Random_IfResult1 = Result22;
float Result23 = In_Min + Random_IfResult1;
Out_Result = Result23;
float2 Constant47 = float2(0,-1);
float2 Constant48 = float2(6.28319,1);
bool Constant49 = false;
float2 RandomRangeFloat_Func_Output_Result;
RandomRangeFloat_Func_(Constant47, Constant48, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant49, RandomRangeFloat_Func_Output_Result, Context);
float Phi;
float CosASC40ThetaASC41;
Phi = RandomRangeFloat_Func_Output_Result.x;
CosASC40ThetaASC41 = RandomRangeFloat_Func_Output_Result.y;
float Result13 = cos(Phi);
float Result14 = CosASC40ThetaASC41 * CosASC40ThetaASC41;
float Result15 = 1 - Result14;
float Result16 = sqrt(Result15);
float Result17 = Result13 * Result16;
float Result18 = sin(Phi);
float Result19 = Result18 * Result16;
float3 PositionOnSphere;
PositionOnSphere.x = Result17;
PositionOnSphere.y = Result19;
PositionOnSphere.z = CosASC40ThetaASC41;
float Constant62 = 0;
float Constant63 = 6.28319;
int Constant64 = -1;
int Constant65 = 0;
bool Constant66 = false;
float RandomRangeFloat_Func_Output_Result1;
RandomRangeFloat_Func_(Constant62, Constant63, Constant64, Constant65, Constant66, RandomRangeFloat_Func_Output_Result1, Context);
float Result24 = cos(RandomRangeFloat_Func_Output_Result1);
float Result25 = sin(RandomRangeFloat_Func_Output_Result1);
float2 PositionOnCircle;
PositionOnCircle.x = Result24;
PositionOnCircle.y = Result25;
Out_UnitVector3D = PositionOnSphere;
Out_UnitVector2D = PositionOnCircle;
float3 Result36 = In_Value - In_InputMin;
float3 Result37 = In_InputMax - In_InputMin;
float3 Result38 = Result36 / Result37;
float Constant82 = 0;
float Constant83 = 1;
float3 Result39 = clamp(Result38,Constant82,Constant83);
float3 Result40 = lerp(In_OutputMin,In_OutputMax,Result39);
Out_NewOutput = Result40;
int Result4 = ExecIndex();
float Constant37 = 1;
float Constant38 = 0;
float Constant39 = 0;
float Constant40 = 1;
float Constant41 = 1;
float Constant42 = 1000;
int GetParticleNeighborCount_Emitter_EmissionCounterOutput_NeighborCount;
GetParticleNeighborCount_Emitter_EmissionCounter(Constant43, GetParticleNeighborCount_Emitter_EmissionCounterOutput_NeighborCount);
float3 CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_World;
bool CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_IsAlive;
float3 CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_Velocity;
CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_(Result4, Context.MapSpawn.Grid3D_Secondary_SpawnParticles.MaxSecondaryParticlesPerFrame, GetParticleNeighborCount_Emitter_EmissionCounterOutput_NeighborCount, Context.MapSpawn.Grid3D_Secondary_SpawnParticles.UnitToWorld, CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_World, CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_IsAlive, CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_Velocity);
int Constant44 = -1;
int Constant45 = 0;
bool Constant46 = false;
float3 RandomUnitVector_Func_Output_UnitVector3D;
float2 RandomUnitVector_Func_Output_UnitVector2D;
RandomUnitVector_Func_(Constant44, Constant45, Constant46, RandomUnitVector_Func_Output_UnitVector3D, RandomUnitVector_Func_Output_UnitVector2D, Context);
float3 Result26 = RandomUnitVector_Func_Output_UnitVector3D * Constant39;
float3 Result27 = lerp(Result26,CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_Velocity,Constant41);
float3 Result28 = Result27 * Constant40;
float3 Result29 = normalize(Result28);
float Result30 = length(Result28);
float Result31 = min(Result30, Constant42);
float3 Result32 = Result29 * Result31;
float Constant72 = 0;
float Constant73 = 1;
int Constant74 = -1;
int Constant75 = 0;
bool Constant76 = false;
float RandomRangeFloat_Func_Output_Result2;
RandomRangeFloat_Func_(Constant72, Constant73, Constant74, Constant75, Constant76, RandomRangeFloat_Func_Output_Result2, Context);
float3 Result33 = Result32 * Context.MapSpawn.Grid3D_Secondary_SpawnParticles.SimDt * Constant37 * RandomRangeFloat_Func_Output_Result2;
float3 Result34 = CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_World + Result33;
float3 Constant77 = float3(1,1,1);
float3 Result35 = rand_float(Constant77);
float3 Constant78 = float3(0,0,0);
float3 Constant79 = float3(1,1,1);
float3 Constant80 = float3(-1,-1,-1);
float3 Constant81 = float3(1,1,1);
float3 RemapRange_ClampResults_true_Func_Output_NewOutput;
RemapRange_ClampResults_true_Func_(Result35, Constant78, Constant79, Constant80, Constant81, RemapRange_ClampResults_true_Func_Output_NewOutput, Context);
float Constant84 = 0.5;
float3 Result41 = RemapRange_ClampResults_true_Func_Output_NewOutput * Constant38 * Context.MapSpawn.Grid3D_Secondary_SpawnParticles.dx * Constant84;
float3 Result42 = Result34 + Result41;
Context.MapSpawn.Particles.Position = Result42;
Context.MapSpawn.DataInstance.Alive = CustomHlsl6699E5AF01E2FFF44D1527C6EA531E62C8936F83Emitter_EmissionPositionsEmitter_SimGridReader_Func_Output_IsAlive;
Context.MapSpawn.Particles.Velocity = Result32;
Out_OutPosition = In_Position;
Out_OutAlive = In_Alive;
Out_OutState = -1;
float3 TmpVel;
SamplePreviousGridVector3Value_Emitter_SimGridReader_AttributeVelocity(In_CurrUnit, TmpVel);
float TmpVelMag = length(TmpVel);
float SDFValue;
SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDF(In_CurrUnit, SDFValue);
  Out_OutVelocity = TmpVel;
  Out_OutPosition += In_Velocity * In_SimDt;
  Out_AgingRate = In_FoamAgingRate;
  Out_OutState = 0;
  Out_OutVelocity += In_Gravity * In_SimDt;
  Out_AgingRate = In_SprayAgingRate;
  Out_OutState = 1;
  Out_OutVelocity += In_BubbleBounancy * In_SimDt;
  Out_AgingRate = In_BubbleAgingRate;
  Out_OutState = 2;
// kill non moving or particles out of the domain
    In_CurrUnit.x < 0 || In_CurrUnit.x > 1 ||
    In_CurrUnit.y < 0 || In_CurrUnit.y > 1 ||
    In_CurrUnit.z < 0 || In_CurrUnit.z > 1)
    Out_OutAlive = false;
float3 Constant91 = float3(0,0,980);
float3 Constant92 = float3(0,0,-980);
float Constant93 = 1;
float3 Result43 = mul(float4(((float3)Context.MapUpdate.Particles.Position),1.0),Context.MapUpdate.Grid3D_Secondary_UpdateParticles.WorldToUnit).xyz;
float Constant94 = 1;
float Constant95 = 1;
float Constant96 = 1;
float3 CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutPosition;
float3 CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutVelocity;
bool CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutAlive;
int CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutState;
float CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_AgingRate;
CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_(Context.MapUpdate.Particles.Position, Result43, Context.MapUpdate.Particles.Position, Context.MapUpdate.Grid3D_Secondary_UpdateParticles.SimDt, Context.MapUpdate.Particles.Velocity, Context.MapUpdate.DataInstance.Alive, Constant91, Constant92, Constant93, Constant94, Constant95, Constant96, Context.MapUpdate.Particles.State, CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutPosition, CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutVelocity, CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutAlive, CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutState, CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_AgingRate);
Context.MapUpdate.Particles.Position = CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutPosition;
Context.MapUpdate.Particles.Velocity = CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutVelocity;
Context.MapUpdate.DataInstance.Alive = CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_OutAlive;
Context.MapUpdate.Transient.AgingRate = CustomHlsl3CDE4AE5E97DD18FA1FFC3BB198C737069E81394Emitter_SimGridReaderEmitter_SDFReader_Func_Output_AgingRate;
float SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundaryOutput_Value;
SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundary(Result43, SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundaryOutput_Value);
bool CustomHlsl004FF4EB03EB2F5CF4BF3A343960131422B247D1839_Func_Output_IsInside;
CustomHlsl004FF4EB03EB2F5CF4BF3A343960131422B247D1839_Func_(SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundaryOutput_Value, CustomHlsl004FF4EB03EB2F5CF4BF3A343960131422B247D1839_Func_Output_IsInside);
Context.MapUpdate.OUTPUT_VAR.Grid3D_Secondary_UpdateParticles.IsInsideBoundary = CustomHlsl004FF4EB03EB2F5CF4BF3A343960131422B247D1839_Func_Output_IsInside;
float NiagaraFloat;
NiagaraFloat = Context.MapUpdate.MakeFloatFromInt.INT_VAR;
Out_Output = NiagaraFloat;
bool Constant110 = false;
float Result44 = In_FloatMax - In_FloatMin;
int Constant111 = 1194453164;
float Result45 = rand_float(Result44, Context.MapUpdate.Particles.UniqueID, Constant111, Context.MapUpdate.Engine.Emitter.InstanceSeed);
float Result46 = In_FloatMin + Result45;
Out_RandomFloat = Result46;
Out_IsDeterministic = Constant110;
int Constant103 = (0);
float Constant104 = 0;
float Constant105 = 1;
int Constant108 = (0);
int Constant109 = (0);
float CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
bool CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant103, Constant104, Constant105, Constant106, Constant107, Constant108, Constant109, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
int Constant115 = (0);
float Constant116 = 0;
float Constant117 = 1;
int Constant118 = 0;
int Constant119 = 0;
int Constant120 = (0);
int Constant121 = (0);
float CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
bool CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1;
CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant115, Constant116, Constant117, Constant118, Constant119, Constant120, Constant121, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
float Constant124 = 0;
X = Context.MapUpdate.Particles.DynamicMaterialParameter.x;
Y = Context.MapUpdate.Particles.DynamicMaterialParameter.y;
Z = Context.MapUpdate.Particles.DynamicMaterialParameter.z;
W = Context.MapUpdate.Particles.DynamicMaterialParameter.w;
float float_IfResult;
float_IfResult = Context.MapUpdate.DynamicMaterialParameters.Index0Param1;
float_IfResult = X;
float float_IfResult1;
float_IfResult1 = Context.MapUpdate.DynamicMaterialParameters.Index0Param2;
float_IfResult1 = Y;
float float_IfResult2;
float_IfResult2 = Constant124;
float_IfResult2 = Z;
float float_IfResult3;
float_IfResult3 = Context.MapUpdate.DynamicMaterialParameters.Index0Param4;
float_IfResult3 = W;
float4 Output12;
Output12.x = float_IfResult;
Output12.y = float_IfResult1;
Output12.z = float_IfResult2;
Output12.w = float_IfResult3;
Context.MapUpdate.Particles.DynamicMaterialParameter = Output12;
float Result47 = Context.MapUpdate.Multiply_Float.A * Context.MapUpdate.Multiply_Float.B;
Out_Result = Result47;
bool Result48 = NiagaraAll(Context.MapUpdate.Particles.Age <= Context.MapUpdate.Engine.DeltaTime);
Context.MapUpdate.OUTPUT_VAR.ParticleState.FirstFrame = Result48;
Context.MapUpdate.Transient.FirstFrame = Result48;
float Result49 = Context.MapUpdate.Particles.Age + Context.MapUpdate.ParticleState.DeltaTime;
float Constant125 = 1e-05;
float Result50 = max(Context.MapUpdate.ParticleState.Lifetime, Constant125);
float Constant126 = 0.0001;
float Result51 = Result50 - Constant126;
bool Result52 = NiagaraAll(Result49 < Result51);
bool Constant127 = false;
bool_IfResult = Context.MapUpdate.DataInstance.Alive;
bool_IfResult = Constant127;
float Result53 = Result49 / Result50;
Context.MapUpdate.DataInstance.Alive = bool_IfResult;
Context.MapUpdate.Particles.Age = Result49;
Context.MapUpdate.Particles.NormalizedAge = Result53;
bool Constant128 = false;
bool Constant129 = true;
bool_IfResult1 = Constant130;
bool_IfResult1 = Context.MapUpdate.DataInstance.Alive;
Context.MapUpdate.DataInstance.Alive = bool_IfResult1;
float Vz_up;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY+1, In_IndexZ, In_VectorIndex+2, Vz_up);
float Vz_down;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY-1, In_IndexZ, In_VectorIndex+2, Vz_down);
float Vy_front;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY, In_IndexZ+1, In_VectorIndex+1, Vy_front);
float Vy_back;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY, In_IndexZ-1, In_VectorIndex+1, Vy_back);
float Vx_front;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY, In_IndexZ+1, In_VectorIndex, Vx_front);
float Vx_back;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY, In_IndexZ-1, In_VectorIndex, Vx_back);
float Vz_right;
GetGridValue_Emitter_SimGridReader(In_IndexX+1, In_IndexY, In_IndexZ, In_VectorIndex+2, Vz_right);
float Vz_left;
GetGridValue_Emitter_SimGridReader(In_IndexX-1, In_IndexY, In_IndexZ, In_VectorIndex+2, Vz_left);
float Vy_right;
GetGridValue_Emitter_SimGridReader(In_IndexX+1, In_IndexY, In_IndexZ, In_VectorIndex+1, Vy_right);
float Vy_left;
GetGridValue_Emitter_SimGridReader(In_IndexX+1, In_IndexY, In_IndexZ, In_VectorIndex+1, Vy_left);
float Vx_up;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY+1, In_IndexZ, In_VectorIndex, Vx_up);
float Vx_down;
GetGridValue_Emitter_SimGridReader(In_IndexX, In_IndexY-1, In_IndexZ, In_VectorIndex, Vx_down);
) / (2. * In_dx);
// Emit
float EmitVal = 0;
EmitVal += In_VorticityEmissionMult * smoothstep(In_MinEmitVorticity, In_MaxEmitVorticity, In_VorticityMagnitude);
EmitVal += In_VelocityEmissionMult * smoothstep(In_MinEmitVelocityMagnitude, In_MaxEmitVelocityMagnitude, In_VelocityMagnitude);
EmitVal += In_AccelEmissionMult * smoothstep(In_MinEmitAccelMagnitude, In_MaxEmitAccelMagnitude, In_AccelMagnitude);
EmitVal = clamp(EmitVal * In_EmissionMult, In_EmissionClamp.x, In_EmissionClamp.y);
int NumEmitted = 0;
NumEmitted = floor(EmitVal) + (frac(EmitVal) >= In_Random0To1 ? 1 : 0);
// increment emission buffer by OutGridVal
  float PrevVal = 0;
  SetParticleNeighborCount_Emitter_EmissionCounter(0, NumEmitted, PrevVal);
  // initialized to -1, so make sure it is 0 for the first time we add particles
  PrevVal = max(0, PrevVal);  
  for (int i = PrevVal; i < NumEmitted + PrevVal &&  i < In_MaxSecondaryParticlesPerFrame; ++i)
      int d = 0;
      int xx = i % NumCells.x;
      int yy = i / NumCells.x;
      SetGridValue_Emitter_EmissionPositions(xx, yy, 0, In_CurrUnit.x, d);
      SetGridValue_Emitter_EmissionPositions(xx, yy, 1, In_CurrUnit.y, d);
      SetGridValue_Emitter_EmissionPositions(xx, yy, 2, In_CurrUnit.z, d);
float Constant144 = 1;
float Constant145 = 5;
float Constant146 = 20;
float Constant147 = 0;
float Constant148 = 0;
float Constant149 = 1;
float Constant150 = 0;
float2 Constant151 = float2(0,1e+06);
float Constant152 = -1e+06;
float Constant153 = 0.0001;
float Constant154 = 0;
float Constant155 = 0;
float Constant156 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SimGridReader(ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ);
int ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGridReader(ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ1);
float3 CustomHlslBA7567051752165D1D96DA69BDD985B481B20EF7Emitter_SimGridReader_Func_Output_curl;
CustomHlslBA7567051752165D1D96DA69BDD985B481B20EF7Emitter_SimGridReader_Func_(Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.SimDx, Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.VelocityIndex, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ1, CustomHlslBA7567051752165D1D96DA69BDD985B481B20EF7Emitter_SimGridReader_Func_Output_curl);
float Result54 = length(CustomHlslBA7567051752165D1D96DA69BDD985B481B20EF7Emitter_SimGridReader_Func_Output_curl);
float3 ExecutionIndexToUnit_Emitter_SimGridReaderOutput_Unit;
ExecutionIndexToUnit_Emitter_SimGridReader(ExecutionIndexToUnit_Emitter_SimGridReaderOutput_Unit);
float SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDFOutput_Value;
SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDF(ExecutionIndexToUnit_Emitter_SimGridReaderOutput_Unit, SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDFOutput_Value);
float3 GetPreviousVectorValue_Emitter_SimGridReader_AttributeVelocityOutput_Value;
GetPreviousVectorValue_Emitter_SimGridReader_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ1, GetPreviousVectorValue_Emitter_SimGridReader_AttributeVelocityOutput_Value);
float Result55 = length(GetPreviousVectorValue_Emitter_SimGridReader_AttributeVelocityOutput_Value);
float Constant157 = 1;
float Result56 = rand_float(Constant157);
float Constant158 = 0;
CustomHlsl7F1DB03B357DB1410BDF43A0E7AF84B5B9A3B520Emitter_EmissionCounterEmitter_EmissionPositions_Func_(ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ, Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.SimDt, Constant144, Result54, Constant145, Constant146, Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.MaxSecondaryParticlesPerFrame, ExecutionIndexToUnit_Emitter_SimGridReaderOutput_Unit, SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDFOutput_Value, Constant147, Constant148, Result55, Constant149, Constant150, Result56, Constant151, Constant152, Constant153, Constant158, Constant154, Constant155, Constant156, Context);
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
Context.MapSpawn.Emitter.DeltaTime = lerp(PREV_Emitter_DeltaTime, Emitter_DeltaTime, SpawnInterp);
Context.MapSpawn.Emitter.dx = lerp(PREV_Emitter_dx, Emitter_dx, SpawnInterp);
Context.MapUpdate.Engine.DeltaTime = InterpSpawn_UpdateTime;
Context.MapUpdate.Engine.InverseDeltaTime = InterpSpawn_InvUpdateTime;
Context.MapSpawn.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Previous.SpriteSize = Context.MapSpawn.Particles.SpriteSize;
Context.MapSpawn.Particles.Previous.Velocity = Context.MapSpawn.Particles.Velocity;
//Begin Interpolated Spawn Script!
float Constant = (0.0);
Context.MapSpawn.Particles.Lifetime = Constant;
float2 Constant1 = float2(0.0, 0.0);
Context.MapSpawn.Particles.SpriteSize = Constant1;
float3 Constant2 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Position = Constant2;
float3 Constant3 = float3(0,0,1000);
Context.MapSpawn.Particles.Velocity = Constant3;
int Constant4 = 0;
Context.MapSpawn.Particles.State = Constant4;
float4 Constant5 = float4(0,0,0,0);
Context.MapSpawn.Particles.DynamicMaterialParameter = Constant5;
float Constant6 = 0;
Context.MapSpawn.Particles.Age = Constant6;
float Constant7 = (0.0);
Context.MapSpawn.Particles.NormalizedAge = Constant7;
float Constant8 = 0;
float Constant9 = 1;
int Constant10 = 0;
float RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat_Emitter_Func_(RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.FloatFromCurve.CurveIndex = RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
float Constant19 = 1.5;
float FloatFromCurve_Emitter_Func_Output_Value;
FloatFromCurve_Emitter_Func_(FloatFromCurve_Emitter_Func_Output_Value, Context);
Context.MapSpawn.Vector2DFromFloat001.Value = FloatFromCurve_Emitter_Func_Output_Value;
float2 Vector2DFromFloat001_Emitter_Func_Output_Vec2;
Vector2DFromFloat001_Emitter_Func_(Vector2DFromFloat001_Emitter_Func_Output_Vec2, Context);
float Constant21 = 2;
float Constant22 = 3;
int Constant23 = 0;
float RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat001_Emitter_Func_(RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.ScratchModule.SpriteSize = Vector2DFromFloat001_Emitter_Func_Output_Vec2;
Context.MapSpawn.ScratchModule.Lifetime = RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
EnterStatScope(1 /**ScratchModule_Emitter_Func_*/);
ScratchModule_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_Emitter_Func_*/);
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.MaxSecondaryParticlesPerFrame = Context.MapSpawn.Emitter.MaxSecondaryParticlesPerFrame;
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.SimDt = Context.MapSpawn.Emitter.DeltaTime;
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.UnitToWorld = Context.MapSpawn.Emitter.UnitToWorld;
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.dx = Context.MapSpawn.Emitter.dx;
float Constant31 = 1;
float Constant32 = 0;
float Constant34 = 1;
float Constant35 = 1;
float Constant36 = 1000;
EnterStatScope(2 /**Grid3D_Secondary_SpawnParticles_Emitter_Func_*/);
Grid3D_Secondary_SpawnParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Secondary_SpawnParticles_Emitter_Func_*/);
Context.MapUpdate.Grid3D_Secondary_UpdateParticles.WorldToUnit = Context.MapUpdate.Emitter.WorldToUnit;
Context.MapUpdate.Grid3D_Secondary_UpdateParticles.SimDt = Context.MapUpdate.Emitter.DeltaTime;
float3 Constant85 = float3(0,0,980);
float3 Constant86 = float3(0,0,-980);
float Constant87 = 1;
float Constant88 = 1;
float Constant89 = 1;
float Constant90 = 1;
EnterStatScope(3 /**Grid3D_Secondary_UpdateParticles_Emitter_Func_*/);
Grid3D_Secondary_UpdateParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Secondary_UpdateParticles_Emitter_Func_*/);
Context.MapUpdate.MakeFloatFromInt.INT_VAR = Context.MapUpdate.Particles.State;
bool Constant97 = true;
bool Constant98 = true;
bool Constant99 = false;
float MakeFloatFromInt_Emitter_Func_Output_Output;
MakeFloatFromInt_Emitter_Func_(MakeFloatFromInt_Emitter_Func_Output_Output, Context);
float Constant100 = 0;
float Constant101 = 1;
float RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat002_Emitter_Func_(RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat, Context);
float Constant112 = 0;
float Constant113 = 1;
int Constant114 = 0;
float RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat003_Emitter_Func_(RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapUpdate.DynamicMaterialParameters.Param0WriteEnabled = Constant97;
Context.MapUpdate.DynamicMaterialParameters.Param1WriteEnabled = Constant98;
Context.MapUpdate.DynamicMaterialParameters.Param2WriteEnabled = Constant99;
Context.MapUpdate.DynamicMaterialParameters.Index0Param4 = MakeFloatFromInt_Emitter_Func_Output_Output;
Context.MapUpdate.DynamicMaterialParameters.Index0Param1 = RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
Context.MapUpdate.DynamicMaterialParameters.Index0Param2 = RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
float Constant122 = 0;
bool Constant123 = true;
Context.MapUpdate.DynamicMaterialParameters.Param3WriteEnabled = Constant123;
EnterStatScope(4 /**DynamicMaterialParameters_Emitter_Func_*/);
DynamicMaterialParameters_Emitter_Func_(Context);
ExitStatScope(/**DynamicMaterialParameters_Emitter_Func_*/);
Context.MapUpdate.Multiply_Float.A = Context.MapUpdate.Emitter.DeltaTime;
Context.MapUpdate.Multiply_Float.B = Context.MapUpdate.Transient.AgingRate;
float Multiply_Float_Emitter_Func_Output_Result;
Multiply_Float_Emitter_Func_(Multiply_Float_Emitter_Func_Output_Result, Context);
Context.MapUpdate.ParticleState.DeltaTime = Multiply_Float_Emitter_Func_Output_Result;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
EnterStatScope(5 /**ParticleState_Emitter_Func_*/);
ParticleState_Emitter_Func_(Context);
ExitStatScope(/**ParticleState_Emitter_Func_*/);
Context.MapUpdate.KillParticles.KillParticles = Context.MapUpdate.OUTPUT_VAR.Grid3D_Secondary_UpdateParticles.IsInsideBoundary;
EnterStatScope(6 /**KillParticles_Emitter_Func_*/);
//Begin Stage Script: MapSimStage1_FindSecondaryEmissionPoints!
Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.MaxSecondaryParticlesPerFrame = Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.MaxSecondaryParticlesPerFrame;
Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.SimDt = Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.DeltaTime;
Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.VelocityIndex = Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.SimDx = Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.dx;
float Constant131 = 1;
float Constant132 = 5;
float Constant133 = 20;
float Constant134 = 0;
float Constant135 = 0;
float Constant136 = 1;
float Constant137 = 0;
float2 Constant138 = float2(0,1e+06);
float Constant139 = -1e+06;
float Constant140 = 0.0001;
float Constant141 = 0;
float Constant142 = 0;
float Constant143 = 0;
EnterStatScope(7 /**Grid3D_Secondary_EmissionPoints_Emitter_Func_*/);
Grid3D_Secondary_EmissionPoints_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Secondary_EmissionPoints_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage1_FindSecondaryEmissionPoints
Emitter_FloatFromCurve_FloatCurve_MinTime;
Emitter_FloatFromCurve_FloatCurve_MaxTime;
Emitter_FloatFromCurve_FloatCurve_InvTimeRange;
Emitter_FloatFromCurve_FloatCurve_CurveLUTNumMinusOne;
Emitter_FloatFromCurve_FloatCurve_LUTOffset;
Emitter_FloatFromCurve_FloatCurve_CurveLUT;
float RemappedTime = saturate((Time - Emitter_FloatFromCurve_FloatCurve_MinTime) * Emitter_FloatFromCurve_FloatCurve_InvTimeRange) * float(Emitter_FloatFromCurve_FloatCurve_CurveLUTNumMinusOne);
IndexA = floor(RemappedTime);
IndexB = min(IndexA + 1, Emitter_FloatFromCurve_FloatCurve_CurveLUTNumMinusOne);
Fraction = frac(RemappedTime);
return Emitter_FloatFromCurve_FloatCurve_CurveLUT[index];
return StaticInputFloat[Emitter_FloatFromCurve_FloatCurve_LUTOffset + index];
uint IndexA, IndexB;
float Fraction;
GetCurveLUTIndices_Emitter_FloatFromCurve_FloatCurve(Time, IndexA, IndexB, Fraction);
IndexA *= 1;
IndexB *= 1;
for ( int i=0; i < 1; ++i )
Value = lerp(SampleCurveLUT_Emitter_FloatFromCurve_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_FloatFromCurve_FloatCurve(IndexB + i), Fraction);
Value[i] = lerp(SampleCurveLUT_Emitter_FloatFromCurve_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_FloatFromCurve_FloatCurve(IndexB + i), Fraction);
int3 Emitter_EmissionCounter_NumCells;
float3 Emitter_EmissionCounter_UnitToUV;
float3 Emitter_EmissionCounter_CellSize;
float3 Emitter_EmissionCounter_WorldBBoxSize;
Emitter_EmissionCounter_MaxNeighborsPerCellValue;
Emitter_EmissionCounter_ParticleNeighbors;
Emitter_EmissionCounter_ParticleNeighborCount;
Emitter_EmissionCounter_OutputParticleNeighbors;
Emitter_EmissionCounter_OutputParticleNeighborCount;
int2 Emitter_EmissionPositions_NumCells;
float2 Emitter_EmissionPositions_UnitToUV;
float2 Emitter_EmissionPositions_CellSize;
float2 Emitter_EmissionPositions_WorldBBoxSize;
Texture2DArray<float> Emitter_EmissionPositions_Grid;
RWTexture2DArray<float> Emitter_EmissionPositions_OutputGrid;
SamplerState Emitter_EmissionPositions_GridSampler;
int4 Emitter_EmissionPositions_AttributeIndices[1];
int Emitter_EmissionPositions_NumAttributes;
const float2 GridPos = UVW.xy * Emitter_EmissionPositions_NumCells.xy - .5;
const int2 MaxCell = Emitter_EmissionPositions_NumCells - int2(3,3);
return Emitter_EmissionPositions_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float CurrValue = Emitter_EmissionPositions_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
InterpInX[j] = Basic1DCubic_Emitter_EmissionPositions(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_EmissionPositions(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
const int2 MaxCell = Emitter_EmissionPositions_NumCells - int2(2,2);
InterpInX[j] = Monotonic1DCubic_Emitter_EmissionPositions(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Monotonic1DCubic_Emitter_EmissionPositions(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return Basic2DCubic_Emitter_EmissionPositions(Sampler, UVW, MipLevel);
int3 Emitter_SimGridReader_NumCells;
float3 Emitter_SimGridReader_UnitToUV;
float3 Emitter_SimGridReader_CellSize;
float3 Emitter_SimGridReader_WorldBBoxSize;
Texture3D<float3> Emitter_SimGridReader_Grid;
RWTexture3D<float3> Emitter_SimGridReader_OutputGrid;
int3 Emitter_SimGridReader_NumTiles;
float3 Emitter_SimGridReader_OneOverNumTiles;
float3 Emitter_SimGridReader_UnitClampMin;
float3 Emitter_SimGridReader_UnitClampMax;
SamplerState Emitter_SimGridReader_GridSampler;
int4 Emitter_SimGridReader_AttributeIndices[2];
Buffer<float4> Emitter_SimGridReader_PerAttributeData;
int Emitter_SimGridReader_NumAttributes;
int Emitter_SimGridReader_NumNamedAttributes;
int3 TotalDim = Emitter_SimGridReader_NumCells * Emitter_SimGridReader_NumTiles;
F[0] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_SimGridReader_NumCells;
const int3 MaxCell = Emitter_SimGridReader_NumCells - int3(2,2,2);
return Emitter_SimGridReader_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_SimGridReader_Grid.Load(int4(col, row, plane, MipLevel)); 
int3 Emitter_SDFReader_NumCells;
float3 Emitter_SDFReader_UnitToUV;
float3 Emitter_SDFReader_CellSize;
float3 Emitter_SDFReader_WorldBBoxSize;
Texture3D<float> Emitter_SDFReader_Grid;
RWTexture3D<float> Emitter_SDFReader_OutputGrid;
int3 Emitter_SDFReader_NumTiles;
float3 Emitter_SDFReader_OneOverNumTiles;
float3 Emitter_SDFReader_UnitClampMin;
float3 Emitter_SDFReader_UnitClampMax;
SamplerState Emitter_SDFReader_GridSampler;
int4 Emitter_SDFReader_AttributeIndices[1];
Buffer<float4> Emitter_SDFReader_PerAttributeData;
int Emitter_SDFReader_NumAttributes;
int Emitter_SDFReader_NumNamedAttributes;
int3 TotalDim = Emitter_SDFReader_NumCells * Emitter_SDFReader_NumTiles;
F[0] = Emitter_SDFReader_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_SDFReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_SDFReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_SDFReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
F[0] = Emitter_SDFReader_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_SDFReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_SDFReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_SDFReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
int3 LocalCell = GridCell % Emitter_SDFReader_NumCells;
const int3 MaxCell = Emitter_SDFReader_NumCells - int3(2,2,2);
return Emitter_SDFReader_Grid.SampleLevel(Sampler, UVW, MipLevel);
DataInX[xi] = Emitter_SDFReader_Grid.Load(int4(col, row, plane, MipLevel)); 
int3 Emitter_BoundaryReader_NumCells;
float3 Emitter_BoundaryReader_UnitToUV;
float3 Emitter_BoundaryReader_CellSize;
float3 Emitter_BoundaryReader_WorldBBoxSize;
Texture3D<float> Emitter_BoundaryReader_Grid;
RWTexture3D<float> Emitter_BoundaryReader_OutputGrid;
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
Out_ParticleNeighborIndex = Emitter_EmissionCounter_ParticleNeighborCount[In_Index];
InterlockedAdd(Emitter_EmissionCounter_OutputParticleNeighborCount[In_Index], In_Increment, PreviousNeighborCount);
Out_NumCellsX = Emitter_EmissionPositions_NumCells.x;
Out_NumCellsY = Emitter_EmissionPositions_NumCells.y;
Out_Val = Emitter_EmissionPositions_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
Emitter_EmissionPositions_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Value = Emitter_SimGridReader_Grid.SampleLevel(Emitter_SimGridReader_GridSampler, Unit, 0).rgb;
Out_IndexX = Linear % Emitter_SimGridReader_NumCells.x;
Out_IndexY = (Linear / Emitter_SimGridReader_NumCells.x) % Emitter_SimGridReader_NumCells.y;
Out_IndexZ = Linear / (Emitter_SimGridReader_NumCells.x * Emitter_SimGridReader_NumCells.y);
    const float3 TmpVal = Emitter_SimGridReader_Grid.Load(int4(In_IndexX, In_IndexY, In_IndexZ, 0));
Out_Unit = (float3(GDispatchThreadId.x, GDispatchThreadId.y, GDispatchThreadId.z) + .5) / Emitter_SimGridReader_NumCells;
const uint IndexX = Linear % Emitter_SimGridReader_NumCells.x;
const uint IndexY = (Linear / Emitter_SimGridReader_NumCells.x) % Emitter_SimGridReader_NumCells.y;
const uint IndexZ = Linear / (Emitter_SimGridReader_NumCells.x * Emitter_SimGridReader_NumCells.y);
Out_Unit = (float3(IndexX, IndexY, IndexZ) + .5) / Emitter_SimGridReader_NumCells;
Value = Emitter_SimGridReader_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgb;
Value = Emitter_SDFReader_Grid.SampleLevel(Emitter_SDFReader_GridSampler, Unit, 0).r;
Value = Emitter_BoundaryReader_Grid.SampleLevel(Emitter_BoundaryReader_GridSampler, Unit, 0).r;
Context.MapSpawn.Emitter.MaxSecondaryParticlesPerFrame = Emitter_MaxSecondaryParticlesPerFrame;
Context.MapSpawn.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSpawn.Engine.Time = Engine_Time;
Context.MapSpawn.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSpawn.Engine.System.TickCount = Engine_System_TickCount;
Context.MapUpdate.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapUpdate.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapUpdate.Engine.DeltaTime = Engine_DeltaTime;
Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.MaxSecondaryParticlesPerFrame = Emitter_MaxSecondaryParticlesPerFrame;
Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.dx = Emitter_dx;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.Time = Engine_Time;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.WorldDeltaTime = Engine_WorldDeltaTime;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.DeltaTime = Engine_DeltaTime;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.InverseDeltaTime = Engine_InverseDeltaTime;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.ExecutionCount = Engine_ExecutionCount;
Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.SpawnRate = Emitter_SpawnRate;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapSimStage1_FindSecondaryEmissionPoints.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapSimStage1_FindSecondaryEmissionPoints.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.MapSpawn.Particles.Age = 0.0f;
Context.MapSpawn.Particles.DynamicMaterialParameter.x = 0.0f;
Context.MapSpawn.Particles.DynamicMaterialParameter.y = 0.0f;
Context.MapSpawn.Particles.DynamicMaterialParameter.z = 0.0f;
Context.MapSpawn.Particles.DynamicMaterialParameter.w = 0.0f;
Context.MapSpawn.Particles.ID.Index = 0;
Context.MapSpawn.Particles.ID.AcquireTag = 0;
Context.MapSpawn.Particles.Lifetime = 0.0f;
Context.MapSpawn.Particles.NormalizedAge = 0.0f;
Context.MapSpawn.Particles.Previous.Position.x = 0.0f;
Context.MapSpawn.Particles.Previous.Position.y = 0.0f;
Context.MapSpawn.Particles.Previous.Position.z = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.z = 0.0f;
Context.MapSpawn.Particles.State = 0;
int IDIndex, IDAcquireTag;
AcquireID(0, IDIndex, IDAcquireTag);
Context.MapSpawn.Particles.ID.Index = IDIndex;
Context.MapSpawn.Particles.ID.AcquireTag = IDAcquireTag;
Context.MapSpawn.Engine.Emitter.ID.ID = 1;
Context.MapUpdate.Array.Age = 0;
Context.MapUpdate.Particles.Age = InputDataFloat(0, 0, InstanceIdx);
Context.MapUpdate.Array.DynamicMaterialParameter = 1;
Context.MapUpdate.Particles.DynamicMaterialParameter.x = InputDataFloat(0, 1, InstanceIdx);
Context.MapUpdate.Particles.DynamicMaterialParameter.y = InputDataFloat(0, 2, InstanceIdx);
Context.MapUpdate.Particles.DynamicMaterialParameter.z = InputDataFloat(0, 3, InstanceIdx);
Context.MapUpdate.Particles.DynamicMaterialParameter.w = InputDataFloat(0, 4, InstanceIdx);
Context.MapUpdate.Array.ID = 0;
Context.MapUpdate.Particles.ID.Index = InputDataInt(0, 0, InstanceIdx);
Context.MapUpdate.Particles.ID.AcquireTag = InputDataInt(0, 1, InstanceIdx);
Context.MapUpdate.Array.Lifetime = 5;
Context.MapUpdate.Particles.Lifetime = InputDataFloat(0, 5, InstanceIdx);
Context.MapUpdate.Array.NormalizedAge = 6;
Context.MapUpdate.Particles.NormalizedAge = InputDataFloat(0, 6, InstanceIdx);
Context.MapUpdate.Array.Position = 7;
Context.MapUpdate.Particles.Position.x = InputDataFloat(0, 7, InstanceIdx);
Context.MapUpdate.Particles.Position.y = InputDataFloat(0, 8, InstanceIdx);
Context.MapUpdate.Particles.Position.z = InputDataFloat(0, 9, InstanceIdx);
Context.MapUpdate.Array.SpriteSize = 18;
Context.MapUpdate.Particles.SpriteSize.x = InputDataFloat(0, 18, InstanceIdx);
Context.MapUpdate.Particles.SpriteSize.y = InputDataFloat(0, 19, InstanceIdx);
Context.MapUpdate.Array.State = 2;
Context.MapUpdate.Particles.State = InputDataInt(0, 2, InstanceIdx);
Context.MapUpdate.Array.UniqueID = 3;
Context.MapUpdate.Particles.UniqueID = InputDataInt(0, 3, InstanceIdx);
Context.MapUpdate.Array.Velocity = 20;
Context.MapUpdate.Particles.Velocity.x = InputDataFloat(0, 20, InstanceIdx);
Context.MapUpdate.Particles.Velocity.y = InputDataFloat(0, 21, InstanceIdx);
Context.MapUpdate.Particles.Velocity.z = InputDataFloat(0, 22, InstanceIdx);
Context.MapUpdate.Particles.Position;
Context.MapUpdate.Particles.SpriteSize;
Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.Engine.Emitter.ID.ID = 1;
InterpolateParameters(Context);
#elif ((SimulationStageIndex == 1)) // MapSimStage1_FindSecondaryEmissionPoints
UpdateID(0, bValid ? Context.MapUpdate.Particles.ID.Index : -1, WriteIndex);
OutputDataFloat(0, 0, WriteIndex, Context.MapUpdate.Particles.Age);
OutputDataFloat(0, 1, WriteIndex, Context.MapUpdate.Particles.DynamicMaterialParameter.x);
OutputDataFloat(0, 2, WriteIndex, Context.MapUpdate.Particles.DynamicMaterialParameter.y);
OutputDataFloat(0, 3, WriteIndex, Context.MapUpdate.Particles.DynamicMaterialParameter.z);
OutputDataFloat(0, 4, WriteIndex, Context.MapUpdate.Particles.DynamicMaterialParameter.w);
OutputDataInt(0, 0, WriteIndex, Context.MapUpdate.Particles.ID.Index);
OutputDataInt(0, 1, WriteIndex, Context.MapUpdate.Particles.ID.AcquireTag);
OutputDataFloat(0, 5, WriteIndex, Context.MapUpdate.Particles.Lifetime);
OutputDataFloat(0, 6, WriteIndex, Context.MapUpdate.Particles.NormalizedAge);
OutputDataFloat(0, 7, WriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 8, WriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 9, WriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 10, WriteIndex, Context.MapUpdate.Particles.Previous.Position.x);
OutputDataFloat(0, 11, WriteIndex, Context.MapUpdate.Particles.Previous.Position.y);
OutputDataFloat(0, 12, WriteIndex, Context.MapUpdate.Particles.Previous.Position.z);
OutputDataFloat(0, 13, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 14, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 15, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.x);
OutputDataFloat(0, 16, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.y);
OutputDataFloat(0, 17, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.z);
OutputDataFloat(0, 18, WriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 19, WriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataInt(0, 2, WriteIndex, Context.MapUpdate.Particles.State);
OutputDataInt(0, 3, WriteIndex, Context.MapUpdate.Particles.UniqueID);
OutputDataFloat(0, 20, WriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 21, WriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 22, WriteIndex, Context.MapUpdate.Particles.Velocity.z);
#elif SimulationStageIndex == 1 // MapSimStage1_FindSecondaryEmissionPoints
SimulateMapSimStage1_FindSecondaryEmissionPoints(Context);
öu˝i+;Î>£7ò˙
FKÍõ/;ﬁH∂îø{FôH∏¢
E5ˇ;£π
;Å(ê›JÕNúÎ§
;π…f–Ô¥
| #n();
| R[0] = #n();
| O[581] = #n();
| O[177] = #n();
| O[580] = #n();
| O[176] = #n();
| O[579] = #n();
| O[175] = #n();
| O[49] = #n();
| O[21] = #n();
| O[52] = #n();
| O[61] = #n();
| O[75] = #n();
| R[0] = #n(C[3]);
| O[580] = #n(I[6], I[1]);
| #n(C[0], C[1], C[2], C[3]R[65535]);
| #n(C[4]O[176]);
| O[581] = #n(C[5], C[6]);
| O[177] = #n(O[581]);
| O[37] = #n(O[177], C[4], I[11], I[11]);
| O[61] = #n(O[177], C[4], C[7], C[7]);
| #n(0, 5, R[0], I[3]);
| O[175] = #n(O[177], C[4], I[8], I[8]);
| O[177] = #n(O[177], C[4], I[9], I[10]);
| O[581] = #n(O[581]);
| #n(0, 1, R[0], C[4]);
| #n(0, 2, R[0], C[4]);
| #n(0, 12, R[0], C[4]);
| #n(0, 13, R[0], C[4]);
| #n(0, 14, R[0], C[4]);
| #n(0, 15, R[0], C[4]);
| #n(0, 42, R[0], C[4]);
| #n(0, 44, R[0], O[177]);
| #n(0, 61, R[0], C[4]);
| #n(0, 62, R[0], C[4]);
| #n(0, 65, R[0], C[4]);
| #n(0, 68, R[0], C[4]);
| #n(0, 69, R[0], C[4]);
| #n(0, 71, R[0], C[4]);
| #n(0, 72, R[0], C[4]);
| #n(0, 73, R[0], C[4]);
| O[581] = #n(O[581], C[4], I[10], I[10]);
| #n(0, 45, R[0], O[581]);
| #n(C[8], C[9], C[2], C[3]R[65535]);
| #n(0, 8, R[0], C[3]);
| O[579] = #n(I[5], I[0]);
| O[177] = #n(O[579], O[580]);
| O[581] = #n(I[7], I[2]);
| O[49] = #n(O[581], O[177]);
| O[177] = #n(O[175], C[2]);
| O[52] = #n(O[177], O[49]);
| O[177] = #n(O[579], O[52]);
| O[177] = #n(O[177]);
| O[75] = #n(O[177]);
| O[177] = #n(O[580], O[52]);
| O[34] = #n(O[177]);
| O[177] = #n(O[581], O[52]);
| O[21] = #n(O[177]);
| O[177] = #n(O[34], O[52]);
| O[177] = #n(O[177], O[580]);
| O[49] = #n(O[579], O[581]);
| O[49] = #n(O[579], O[580], O[49]);
| O[177] = #n(O[177], C[10], O[49]);
| O[49] = #n(O[34], C[2]);
| O[34] = #n(O[177], O[49], O[34]);
| O[177] = #n(O[21], O[52]);
| O[177] = #n(O[177], O[581]);
| O[49] = #n(O[21], C[2]);
| O[21] = #n(O[177], O[49], O[21]);
| O[177] = #n(O[75], O[52]);
| O[177] = #n(O[177], O[579]);
| O[49] = #n(O[580], O[581]);
| O[49] = #n(O[580], O[579], O[49]);
| O[49] = #n(O[75], C[2]);
| O[75] = #n(O[177], O[49], O[75]);
| O[177] = #n(O[177], O[49], O[21]);
| O[49] = #n(O[75], O[52]);
| O[49] = #n(O[49], O[579]);
| O[49] = #n(O[49]);
| O[21] = #n(O[581], O[580]);
| O[21] = #n(O[581], O[579], O[21]);
| O[49] = #n(O[49], C[10], O[21]);
| O[21] = #n(O[75], C[2]);
| O[21] = #n(O[49], O[21], O[75]);
| O[49] = #n(O[34], O[52]);
| O[49] = #n(O[49], O[580]);
| O[75] = #n(O[581], O[580]);
| O[75] = #n(O[581], O[579], O[75]);
| #n(0, 46, R[0], O[37]);
| O[49] = #n(O[49], C[10], O[75]);
| O[75] = #n(O[34], C[2]);
| O[49] = #n(O[49], O[75], O[34]);
| O[168] = #n(O[21], O[52]);
| O[34] = #n(O[49], O[52]);
| O[67] = #n(O[177], O[52]);
| O[52] = #n(O[21]);
| O[21] = #n(O[49]);
| O[49] = #n(O[177]);
| O[177] = #n(O[52]);
| O[75] = #n(O[21]);
| O[37] = #n(O[49]);
| #n(C[11], O[177], O[75], O[37]R[65535]);
| O[167] = #n(O[168], O[52]);
| O[96] = #n(O[34], O[21]);
| O[177] = #n(O[67], O[49]);
| O[75] = #n(O[52]);
| O[21] = #n(O[21]);
| #n(0, 10, R[0], C[6]);
| #n(0, 22, R[0], O[21]);
| #n(C[11]O[52], O[21], O[49]);
| O[44] = #n(O[52]);
| O[49] = #n(O[44]);
| O[19] = #n(O[52]);
| O[41] = #n(O[21]);
| #n(C[12], O[49], O[19], O[41]R[65535]);
| O[49] = #n(O[579], O[44]);
| O[19] = #n(O[580], O[52]);
| #n(0, 0, R[0], C[24]);
| #n(0, 1, R[0], C[24]);
| #n(0, 2, R[0], C[24]);
| #n(0, 3, R[0], C[24]);
| #n(0, 4, R[0], C[24]);
| #n(0, 14, R[0], C[24]);
| #n(0, 15, R[0], C[24]);
| #n(0, 23, R[0], O[19]);
| #n(0, 58, R[0], C[24]);
| #n(0, 59, R[0], C[24]);
| #n(0, 60, R[0], C[24]);
| #n(0, 61, R[0], C[24]);
| #n(0, 62, R[0], C[24]);
| #n(0, 63, R[0], C[24]);
| #n(0, 65, R[0], C[24]);
| #n(0, 66, R[0], C[24]);
| #n(0, 67, R[0], C[24]);
| #n(0, 68, R[0], C[24]);
| #n(0, 69, R[0], C[24]);
| #n(0, 70, R[0], C[24]);
| #n(0, 71, R[0], C[24]);
| #n(0, 72, R[0], C[24]);
| #n(0, 73, R[0], C[24]);
| #n(0, 74, R[0], C[24]);
| #n(0, 75, R[0], C[24]);
| #n(0, 76, R[0], C[24]);
| #n(0, 77, R[0], C[24]);
| #n(0, 78, R[0], C[24]);
| #n(0, 79, R[0], C[24]);
| #n(0, 80, R[0], C[24]);
| #n(0, 81, R[0], C[24]);
| #n(0, 82, R[0], C[24]);
| #n(0, 83, R[0], C[24]);
| #n(0, 84, R[0], C[24]);
| #n(0, 85, R[0], C[24]);
| #n(0, 86, R[0], C[24]);
| #n(0, 87, R[0], C[24]);
| #n(0, 88, R[0], C[24]);
| #n(0, 89, R[0], C[24]);
| #n(0, 90, R[0], C[24]);
| #n(0, 91, R[0], C[24]);
| #n(0, 92, R[0], C[24]);
| #n(0, 93, R[0], C[24]);
| #n(0, 94, R[0], C[24]);
| #n(0, 95, R[0], C[24]);
| #n(0, 96, R[0], C[24]);
| #n(0, 97, R[0], C[24]);
| #n(0, 98, R[0], C[24]);
| #n(0, 99, R[0], C[24]);
| #n(0, 100, R[0], C[24]);
| #n(0, 101, R[0], C[24]);
| #n(0, 102, R[0], C[24]);
| #n(0, 104, R[0], C[24]);
| #n(0, 105, R[0], C[24]);
| #n(0, 106, R[0], C[24]);
| #n(0, 107, R[0], C[24]);
| #n(0, 108, R[0], C[24]);
| #n(0, 109, R[0], C[24]);
| #n(0, 110, R[0], C[24]);
| #n(0, 111, R[0], C[24]);
| #n(0, 112, R[0], C[24]);
| #n(0, 113, R[0], C[24]);
| #n(0, 128, R[0], C[24]);
| #n(0, 130, R[0], C[24]);
| #n(0, 131, R[0], C[24]);
| #n(0, 132, R[0], C[24]);
| #n(0, 133, R[0], C[24]);
| #n(0, 134, R[0], C[24]);
| #n(0, 135, R[0], C[24]);
| #n(0, 136, R[0], C[24]);
| #n(0, 137, R[0], C[24]);
| #n(0, 138, R[0], C[24]);
| #n(0, 139, R[0], C[24]);
| #n(0, 140, R[0], C[24]);
| #n(0, 141, R[0], C[24]);
| #n(0, 142, R[0], C[24]);
| #n(0, 143, R[0], C[24]);
| #n(0, 144, R[0], C[24]);
| #n(0, 145, R[0], C[24]);
| #n(0, 146, R[0], C[24]);
| #n(0, 150, R[0], C[24]);
| #n(0, 151, R[0], C[24]);
| #n(0, 152, R[0], C[24]);
| #n(0, 153, R[0], C[24]);
| #n(0, 154, R[0], C[24]);
| #n(0, 155, R[0], C[24]);
| #n(0, 156, R[0], C[24]);
| #n(0, 157, R[0], C[24]);
| #n(0, 158, R[0], C[24]);
| #n(0, 159, R[0], C[24]);
| #n(0, 160, R[0], C[24]);
| #n(0, 161, R[0], C[24]);
| #n(0, 162, R[0], C[24]);
| #n(0, 163, R[0], C[24]);
| #n(0, 164, R[0], C[24]);
| #n(0, 165, R[0], C[24]);
| #n(0, 166, R[0], C[24]);
| #n(0, 167, R[0], C[24]);
| #n(0, 168, R[0], C[24]);
| #n(0, 169, R[0], C[24]);
| #n(0, 170, R[0], C[24]);
| #n(0, 171, R[0], C[24]);
| #n(0, 172, R[0], C[24]);
| #n(0, 173, R[0], C[24]);
| #n(0, 174, R[0], C[24]);
| #n(0, 175, R[0], C[24]);
| #n(0, 176, R[0], C[24]);
| #n(0, 177, R[0], C[24]);
| #n(0, 178, R[0], C[24]);
| #n(0, 179, R[0], C[24]);
| #n(0, 180, R[0], C[24]);
| #n(0, 181, R[0], C[24]);
| #n(0, 182, R[0], C[24]);
| #n(0, 183, R[0], C[24]);
| #n(0, 184, R[0], C[24]);
| #n(0, 185, R[0], C[24]);
| #n(0, 186, R[0], C[24]);
| #n(0, 187, R[0], C[24]);
| #n(0, 188, R[0], C[24]);
| #n(0, 189, R[0], C[24]);
| #n(0, 190, R[0], C[24]);
| #n(0, 191, R[0], C[24]);
| #n(0, 192, R[0], C[24]);
| #n(0, 193, R[0], C[24]);
| #n(0, 194, R[0], C[24]);
| #n(0, 195, R[0], C[24]);
| #n(0, 196, R[0], C[24]);
| #n(0, 197, R[0], C[24]);
| #n(0, 198, R[0], C[24]);
| #n(0, 199, R[0], C[24]);
| #n(0, 200, R[0], C[24]);
| #n(0, 201, R[0], C[24]);
| #n(0, 202, R[0], C[24]);
| #n(0, 203, R[0], C[24]);
| #n(0, 204, R[0], C[24]);
| #n(0, 205, R[0], C[24]);
| #n(0, 211, R[0], C[24]);
| #n(0, 212, R[0], C[24]);
| #n(0, 213, R[0], C[24]);
| #n(0, 214, R[0], C[24]);
| #n(0, 215, R[0], C[24]);
| #n(0, 216, R[0], C[24]);
| #n(0, 218, R[0], C[24]);
| #n(0, 219, R[0], C[24]);
| #n(0, 220, R[0], C[24]);
| #n(0, 221, R[0], C[24]);
| #n(0, 222, R[0], C[24]);
| #n(0, 223, R[0], C[24]);
| #n(0, 224, R[0], C[24]);
| #n(0, 225, R[0], C[24]);
| #n(0, 226, R[0], C[24]);
| #n(0, 227, R[0], C[24]);
| #n(0, 228, R[0], C[24]);
| #n(0, 229, R[0], C[24]);
| #n(0, 230, R[0], C[24]);
| #n(0, 231, R[0], C[24]);
| #n(0, 232, R[0], C[24]);
| #n(0, 233, R[0], C[24]);
| #n(0, 234, R[0], C[24]);
| #n(0, 235, R[0], C[24]);
| #n(0, 237, R[0], C[24]);
| #n(0, 238, R[0], C[24]);
| #n(0, 239, R[0], C[24]);
| #n(0, 240, R[0], C[24]);
| #n(0, 241, R[0], C[24]);
| #n(0, 242, R[0], C[24]);
| #n(0, 243, R[0], C[24]);
| #n(0, 244, R[0], C[24]);
| #n(0, 245, R[0], C[24]);
| #n(0, 246, R[0], C[24]);
| #n(0, 247, R[0], C[24]);
| #n(0, 248, R[0], C[24]);
| #n(0, 249, R[0], C[24]);
| #n(0, 250, R[0], C[24]);
| #n(0, 251, R[0], C[24]);
| #n(0, 252, R[0], C[24]);
| #n(0, 253, R[0], C[24]);
| #n(0, 254, R[0], C[24]);
| #n(0, 255, R[0], C[24]);
| #n(0, 256, R[0], C[24]);
| #n(0, 257, R[0], C[24]);
| #n(0, 258, R[0], C[24]);
| #n(0, 259, R[0], C[24]);
| #n(0, 260, R[0], C[24]);
| #n(0, 261, R[0], C[24]);
| #n(0, 262, R[0], C[24]);
| #n(0, 263, R[0], C[24]);
| #n(0, 264, R[0], C[24]);
| #n(0, 265, R[0], C[24]);
| #n(0, 266, R[0], C[24]);
| #n(0, 267, R[0], C[24]);
| #n(0, 268, R[0], C[24]);
| #n(0, 269, R[0], C[24]);
| #n(0, 270, R[0], C[24]);
| #n(0, 271, R[0], C[24]);
| #n(0, 272, R[0], C[24]);
| #n(0, 273, R[0], C[24]);
| #n(0, 274, R[0], C[24]);
| #n(0, 275, R[0], C[24]);
| #n(0, 276, R[0], C[24]);
| #n(0, 277, R[0], C[24]);
| #n(0, 278, R[0], C[24]);
| #n(0, 279, R[0], C[24]);
| #n(0, 280, R[0], C[24]);
| #n(0, 281, R[0], C[24]);
| #n(0, 282, R[0], C[24]);
| #n(0, 283, R[0], C[24]);
| #n(0, 284, R[0], C[24]);
| #n(0, 285, R[0], C[24]);
| #n(0, 286, R[0], C[24]);
| #n(0, 287, R[0], C[24]);
| #n(0, 288, R[0], C[24]);
| #n(0, 289, R[0], C[24]);
| #n(0, 290, R[0], C[24]);
| #n(0, 291, R[0], C[24]);
| #n(0, 292, R[0], C[24]);
| #n(0, 293, R[0], C[24]);
| #n(0, 294, R[0], C[24]);
| #n(0, 295, R[0], C[24]);
| #n(0, 296, R[0], C[24]);
| #n(0, 297, R[0], C[24]);
| #n(0, 298, R[0], C[24]);
| #n(0, 299, R[0], C[24]);
| #n(0, 300, R[0], C[24]);
| #n(0, 301, R[0], C[24]);
| #n(0, 302, R[0], C[24]);
| #n(0, 303, R[0], C[24]);
| #n(0, 304, R[0], C[24]);
| #n(0, 305, R[0], C[24]);
| #n(0, 306, R[0], C[24]);
| #n(0, 307, R[0], C[24]);
| #n(0, 308, R[0], C[24]);
| #n(0, 309, R[0], C[24]);
| #n(0, 310, R[0], C[24]);
| #n(0, 311, R[0], C[24]);
| #n(0, 312, R[0], C[24]);
| #n(0, 314, R[0], C[24]);
| #n(0, 315, R[0], C[24]);
| #n(0, 316, R[0], C[24]);
| #n(0, 317, R[0], C[24]);
| #n(0, 318, R[0], C[24]);
| #n(0, 319, R[0], C[24]);
| #n(0, 320, R[0], C[24]);
| #n(0, 321, R[0], C[24]);
| #n(0, 322, R[0], C[24]);
| #n(0, 323, R[0], C[24]);
| #n(0, 324, R[0], C[24]);
| #n(0, 325, R[0], C[24]);
| #n(0, 326, R[0], C[24]);
| #n(0, 327, R[0], C[24]);
| #n(0, 328, R[0], C[24]);
| #n(0, 329, R[0], C[24]);
| #n(0, 330, R[0], C[24]);
| #n(0, 331, R[0], C[24]);
| #n(0, 332, R[0], C[24]);
| #n(0, 334, R[0], C[24]);
| #n(0, 335, R[0], C[24]);
| #n(0, 336, R[0], C[24]);
| #n(0, 337, R[0], C[24]);
| #n(0, 339, R[0], C[24]);
| #n(0, 340, R[0], C[24]);
| #n(0, 341, R[0], C[24]);
| #n(0, 342, R[0], C[24]);
| #n(0, 344, R[0], C[24]);
| #n(0, 345, R[0], C[24]);
| #n(0, 346, R[0], C[24]);
| #n(0, 347, R[0], C[24]);
| #n(0, 349, R[0], C[24]);
| #n(0, 350, R[0], C[24]);
| #n(0, 351, R[0], C[24]);
| #n(0, 352, R[0], C[24]);
| #n(0, 353, R[0], C[24]);
| #n(0, 354, R[0], C[24]);
| #n(0, 355, R[0], C[24]);
| #n(0, 356, R[0], C[24]);
| #n(0, 357, R[0], C[24]);
| #n(0, 358, R[0], C[24]);
| #n(0, 359, R[0], C[24]);
| #n(0, 360, R[0], C[24]);
| #n(0, 361, R[0], C[24]);
| #n(0, 362, R[0], C[24]);
| #n(0, 363, R[0], C[24]);
| #n(0, 364, R[0], C[24]);
| #n(0, 365, R[0], C[24]);
| #n(0, 366, R[0], C[24]);
| #n(0, 367, R[0], C[24]);
| #n(0, 368, R[0], C[24]);
| #n(0, 369, R[0], C[24]);
| #n(0, 370, R[0], C[24]);
| #n(0, 371, R[0], C[24]);
| #n(0, 372, R[0], C[24]);
| #n(0, 373, R[0], C[24]);
| #n(0, 374, R[0], C[24]);
| #n(0, 375, R[0], C[24]);
| #n(0, 376, R[0], C[24]);
| #n(0, 377, R[0], C[24]);
| #n(0, 378, R[0], C[24]);
| #n(0, 379, R[0], C[24]);
| #n(0, 380, R[0], C[24]);
| #n(0, 382, R[0], C[24]);
| #n(0, 383, R[0], C[24]);
| #n(0, 384, R[0], C[24]);
| #n(0, 385, R[0], C[24]);
| #n(0, 387, R[0], C[24]);
| #n(0, 388, R[0], C[24]);
| #n(0, 389, R[0], C[24]);
| #n(0, 390, R[0], C[24]);
| #n(0, 392, R[0], C[24]);
| #n(0, 393, R[0], C[24]);
| #n(0, 394, R[0], C[24]);
| #n(0, 395, R[0], C[24]);
| #n(0, 398, R[0], C[24]);
| #n(0, 399, R[0], C[24]);
| #n(0, 400, R[0], C[24]);
| #n(0, 401, R[0], C[24]);
| #n(0, 403, R[0], C[24]);
| #n(0, 404, R[0], C[24]);
| #n(0, 405, R[0], C[24]);
| #n(0, 406, R[0], C[24]);
| #n(0, 408, R[0], C[24]);
| #n(0, 409, R[0], C[24]);
| #n(0, 410, R[0], C[24]);
| #n(0, 411, R[0], C[24]);
| #n(0, 413, R[0], C[24]);
| #n(0, 414, R[0], C[24]);
| #n(0, 415, R[0], C[24]);
| #n(0, 416, R[0], C[24]);
| #n(0, 417, R[0], C[24]);
| #n(0, 418, R[0], C[24]);
| #n(0, 419, R[0], C[24]);
| #n(0, 420, R[0], C[24]);
| #n(0, 421, R[0], C[24]);
| #n(0, 422, R[0], C[24]);
| #n(0, 423, R[0], C[24]);
| #n(0, 424, R[0], C[24]);
| #n(0, 425, R[0], C[24]);
| #n(0, 426, R[0], C[24]);
| #n(0, 427, R[0], C[24]);
| #n(0, 428, R[0], C[24]);
| #n(0, 430, R[0], C[24]);
| #n(0, 431, R[0], C[24]);
| #n(0, 432, R[0], C[24]);
| #n(0, 433, R[0], C[24]);
| #n(0, 435, R[0], C[24]);
| #n(0, 436, R[0], C[24]);
| #n(0, 437, R[0], C[24]);
| #n(0, 438, R[0], C[24]);
| #n(0, 440, R[0], C[24]);
| #n(0, 441, R[0], C[24]);
| #n(0, 442, R[0], C[24]);
| #n(0, 443, R[0], C[24]);
| #n(0, 445, R[0], C[24]);
| #n(0, 446, R[0], C[24]);
| #n(0, 447, R[0], C[24]);
| #n(0, 448, R[0], C[24]);
| #n(0, 449, R[0], C[24]);
| #n(0, 450, R[0], C[24]);
| #n(0, 452, R[0], C[24]);
| #n(0, 453, R[0], C[24]);
| #n(0, 454, R[0], C[24]);
| #n(0, 455, R[0], C[24]);
| #n(0, 456, R[0], C[24]);
| #n(0, 457, R[0], C[24]);
| #n(0, 458, R[0], C[24]);
| #n(0, 459, R[0], C[24]);
| #n(0, 460, R[0], C[24]);
| #n(0, 461, R[0], C[24]);
| #n(0, 462, R[0], C[24]);
| #n(0, 463, R[0], C[24]);
| #n(0, 464, R[0], C[24]);
| #n(0, 465, R[0], C[24]);
| #n(0, 466, R[0], C[24]);
| #n(0, 467, R[0], C[24]);
| #n(0, 468, R[0], C[24]);
| #n(0, 469, R[0], C[24]);
| #n(0, 470, R[0], C[24]);
| #n(0, 471, R[0], C[24]);
| #n(0, 472, R[0], C[24]);
| #n(0, 473, R[0], C[24]);
| #n(0, 474, R[0], C[24]);
| #n(0, 475, R[0], C[24]);
| #n(0, 476, R[0], C[24]);
| #n(0, 477, R[0], C[24]);
| #n(0, 478, R[0], C[24]);
| #n(0, 479, R[0], C[24]);
| #n(0, 480, R[0], C[24]);
| #n(0, 481, R[0], C[24]);
| #n(0, 482, R[0], C[24]);
| #n(0, 483, R[0], C[24]);
| #n(0, 484, R[0], C[24]);
| #n(0, 485, R[0], C[24]);
| #n(0, 486, R[0], C[24]);
| #n(0, 487, R[0], C[24]);
| #n(0, 488, R[0], C[24]);
| #n(0, 489, R[0], C[24]);
| #n(0, 490, R[0], C[24]);
| #n(0, 491, R[0], C[24]);
| #n(0, 492, R[0], C[24]);
| #n(0, 493, R[0], C[24]);
| #n(0, 494, R[0], C[24]);
| #n(0, 495, R[0], C[24]);
| #n(0, 496, R[0], C[24]);
| #n(0, 497, R[0], C[24]);
| #n(0, 498, R[0], C[24]);
| #n(0, 499, R[0], C[24]);
| #n(0, 500, R[0], C[24]);
| #n(0, 501, R[0], C[24]);
| #n(0, 502, R[0], C[24]);
| #n(0, 503, R[0], C[24]);
| #n(0, 504, R[0], C[24]);
| #n(0, 508, R[0], C[24]);
| #n(0, 509, R[0], C[24]);
| #n(0, 510, R[0], C[24]);
| #n(0, 511, R[0], C[24]);
| #n(0, 512, R[0], C[24]);
| #n(0, 513, R[0], C[24]);
| #n(0, 514, R[0], C[24]);
| #n(0, 515, R[0], C[24]);
| #n(0, 516, R[0], C[24]);
| #n(0, 517, R[0], C[24]);
| #n(0, 518, R[0], C[24]);
| #n(0, 519, R[0], C[24]);
| #n(0, 520, R[0], C[24]);
| #n(0, 521, R[0], C[24]);
| #n(0, 522, R[0], C[24]);
| #n(0, 523, R[0], C[24]);
| #n(0, 524, R[0], C[24]);
| #n(0, 525, R[0], C[24]);
| #n(0, 526, R[0], C[24]);
| #n(0, 527, R[0], C[24]);
| #n(0, 528, R[0], C[24]);
| #n(0, 529, R[0], C[24]);
| #n(0, 530, R[0], C[24]);
| #n(0, 531, R[0], C[24]);
| #n(0, 532, R[0], C[24]);
| #n(0, 533, R[0], C[24]);
| #n(0, 534, R[0], C[24]);
| #n(0, 535, R[0], C[24]);
| #n(0, 536, R[0], C[24]);
| #n(0, 537, R[0], C[24]);
| #n(0, 538, R[0], C[24]);
| #n(0, 539, R[0], C[24]);
| #n(0, 540, R[0], C[24]);
| #n(0, 541, R[0], C[24]);
| #n(0, 542, R[0], C[24]);
| #n(0, 543, R[0], C[24]);
| #n(0, 544, R[0], C[24]);
| #n(0, 545, R[0], C[24]);
| #n(0, 546, R[0], C[24]);
| #n(0, 547, R[0], C[24]);
| #n(0, 548, R[0], C[24]);
| #n(0, 549, R[0], C[24]);
| #n(0, 550, R[0], C[24]);
| #n(0, 551, R[0], C[24]);
| #n(0, 552, R[0], C[24]);
| #n(0, 553, R[0], C[24]);
| #n(0, 554, R[0], C[24]);
| #n(0, 555, R[0], C[24]);
| O[19] = #n(O[581], O[21]);
| #n(0, 24, R[0], O[19]);
| #n(0, 3, R[0], C[25]);
| #n(0, 4, R[0], C[25]);
| #n(0, 5, R[0], C[25]);
| #n(0, 6, R[0], C[25]);
| #n(0, 7, R[0], C[25]);
| #n(0, 11, R[0], C[25]);
| #n(0, 70, R[0], C[25]);
| O[44] = #n(O[44]);
| #n(0, 6, R[0], C[26]);
| #n(0, 9, R[0], C[26]);
| #n(0, 64, R[0], C[26]);
| #n(0, 208, R[0], C[26]);
| #n(0, 209, R[0], C[26]);
| #n(0, 210, R[0], C[26]);
| #n(0, 217, R[0], C[26]);
| #n(0, 236, R[0], C[26]);
| #n(0, 313, R[0], C[26]);
| #n(0, 333, R[0], C[26]);
| #n(0, 338, R[0], C[26]);
| #n(0, 343, R[0], C[26]);
| #n(0, 348, R[0], C[26]);
| #n(0, 381, R[0], C[26]);
| #n(0, 386, R[0], C[26]);
| #n(0, 391, R[0], C[26]);
| #n(0, 396, R[0], C[26]);
| #n(0, 397, R[0], C[26]);
| #n(0, 402, R[0], C[26]);
| #n(0, 407, R[0], C[26]);
| #n(0, 412, R[0], C[26]);
| #n(0, 429, R[0], C[26]);
| #n(0, 434, R[0], C[26]);
| #n(0, 439, R[0], C[26]);
| #n(0, 444, R[0], C[26]);
| #n(0, 451, R[0], C[26]);
| #n(0, 24, R[0], O[44]);
| O[52] = #n(O[52]);
| #n(0, 0, R[0], C[23]);
| #n(0, 25, R[0], O[52]);
| #n(C[11]O[44], O[52], O[21]);
| O[19] = #n(O[44]);
| O[94] = #n(O[52]);
| O[95] = #n(O[21]);
| #n(C[13], O[19], O[94], O[95]R[65535]);
| O[19] = #n(O[579], O[44]);
| #n(0, 8, R[0], C[28]);
| #n(0, 40, R[0], O[19]);
| #n(0, 41, R[0], O[19]);
| #n(0, 207, R[0], C[30]);
| #n(0, 42, R[0], O[19]);
| #n(0, 33, R[0], O[44]);
| #n(0, 206, R[0], C[29]);
| #n(0, 34, R[0], O[52]);
| #n(C[11]O[19], O[44], O[21]);
| O[19] = #n(O[19]);
| O[94] = #n(O[19]);
| O[95] = #n(O[44]);
| O[48] = #n(O[21]);
| #n(C[14], O[94], O[95], O[48]R[65535]);
| O[94] = #n(O[579], O[19]);
| #n(0, 28, R[0], O[94]);
| O[94] = #n(O[580], O[44]);
| #n(0, 29, R[0], O[94]);
| O[94] = #n(O[581], O[21]);
| #n(0, 30, R[0], O[94]);
| #n(0, 27, R[0], O[19]);
| #n(0, 28, R[0], O[44]);
| #n(0, 7, R[0], C[27]);
| #n(0, 29, R[0], O[21]);
| #n(C[15], O[94], O[95], O[48]R[65535]);
| #n(0, 26, R[0], O[41]);
| O[41] = #n(O[579], O[19]);
| #n(0, 46, R[0], O[41]);
| O[41] = #n(O[580], O[44]);
| #n(0, 47, R[0], O[41]);
| O[41] = #n(O[581], O[21]);
| #n(0, 48, R[0], O[41]);
| #n(0, 36, R[0], O[19]);
| #n(0, 37, R[0], O[44]);
| #n(0, 38, R[0], O[21]);
| O[19] = #n(O[19], C[16]);
| O[44] = #n(O[44], C[16]);
| O[21] = #n(O[21], C[16]);
| O[41] = #n(O[19]);
| O[94] = #n(O[44]);
| #n(C[17], O[41], O[94], O[95]R[65535]);
| #n(0, 17, R[0], O[96]);
| O[96] = #n(O[579], O[19]);
| #n(0, 52, R[0], O[96]);
| O[96] = #n(O[580], O[44]);
| #n(0, 53, R[0], O[96]);
| O[96] = #n(O[581], O[21]);
| #n(0, 54, R[0], O[96]);
| #n(0, 39, R[0], O[19]);
| #n(0, 40, R[0], O[44]);
| #n(0, 41, R[0], O[21]);
| #n(C[11]O[21]);
| #n(0, 60, R[0], O[21]);
| #n(C[18]O[21]);
| #n(0, 55, R[0], O[21]);
| #n(0, 19, R[0], O[168]);
| #n(0, 59, R[0], O[21]);
| #n(C[12]O[21]);
| #n(0, 58, R[0], O[21]);
| #n(0, 54, R[0], O[21]);
| #n(C[14]O[21]);
| #n(0, 16, R[0], O[167]);
| #n(0, 56, R[0], O[21]);
| #n(C[13]O[21]);
| #n(0, 21, R[0], O[67]);
| #n(0, 57, R[0], O[21]);
| #n(C[11]O[21], O[167], O[67]);
| #n(0, 48, R[0], O[21]);
| O[21] = #n(O[21], O[61]);
| #n(0, 49, R[0], O[167]);
| O[167] = #n(O[167], O[61]);
| #n(0, 50, R[0], O[67]);
| O[67] = #n(O[67], O[61]);
| O[168] = #n(O[21]);
| O[44] = #n(O[167]);
| O[19] = #n(O[67]);
| #n(C[19], O[168], O[44], O[19]R[65535]);
| O[21] = #n(O[579], O[21]);
| O[167] = #n(O[580], O[167]);
| #n(0, 116, R[0], O[167]);
| O[67] = #n(O[581], O[67]);
| #n(0, 117, R[0], O[67]);
| #n(0, 20, R[0], O[34]);
| #n(0, 9, R[0], C[2]);
| #n(0, 16, R[0], C[9]);
| #n(0, 17, R[0], C[2]);
| #n(0, 47, R[0], C[9]);
| #n(0, 64, R[0], C[2]);
| #n(0, 67, R[0], O[176]);
| O[176] = #n(C[9], C[2]);
| O[176] = #n(O[176], O[21]);
| #n(0, 114, R[0], O[21]);
| #n(0, 115, R[0], O[21]);
| #n(0, 129, R[0], O[21]);
| #n(C[19], O[176]R[65535]);
| #n(0, 18, R[0], O[177]);
| #n(C[11]O[21], O[176], O[177]);
| O[34] = #n(O[61], C[16]);
| #n(0, 23, R[0], O[37]);
| O[21] = #n(O[21], O[34]);
| O[176] = #n(O[176], O[34]);
| O[177] = #n(O[177], O[34]);
| O[34] = #n(O[21]);
| O[37] = #n(O[176]);
| O[67] = #n(O[177]);
| #n(C[20], O[34], O[37], O[67]R[65535]);
| #n(0, 21, R[0], O[75]);
| O[75] = #n(O[579], O[21]);
| #n(0, 34, R[0], O[75]);
| O[75] = #n(O[580], O[176]);
| #n(0, 35, R[0], O[75]);
| O[75] = #n(O[581], O[177]);
| #n(0, 36, R[0], O[75]);
| #n(0, 30, R[0], O[21]);
| O[176] = #n(O[176]);
| #n(0, 31, R[0], O[176]);
| #n(0, 32, R[0], O[177]);
| O[176] = #n(O[176], O[61]);
| O[177] = #n(O[177], O[61]);
| #n(0, 103, R[0], O[61]);
| #n(0, 127, R[0], O[61]);
| O[61] = #n(O[21]);
| O[75] = #n(O[176]);
| #n(C[21], O[61], O[75], O[34]R[65535]);
| #n(0, 35, R[0], O[52]);
| #n(0, 18, R[0], O[21]);
| #n(0, 19, R[0], O[176]);
| #n(0, 20, R[0], O[177]);
| #n(C[11]O[176], O[177], O[21]);
| #n(0, 43, R[0], O[175]);
| O[175] = #n(O[176]);
| #n(0, 51, R[0], O[176]);
| O[176] = #n(O[177]);
| #n(0, 52, R[0], O[177]);
| O[177] = #n(O[21]);
| #n(0, 53, R[0], O[21]);
| O[21] = #n(O[175]);
| O[52] = #n(O[176]);
| O[61] = #n(O[177]);
| #n(C[22], O[21], O[52], O[61]R[65535]);
| #n(0, 22, R[0], O[49]);
| O[175] = #n(O[579], O[175]);
| #n(0, 11, R[0], O[579]);
| #n(0, 25, R[0], O[579]);
| #n(0, 31, R[0], O[579]);
| #n(0, 37, R[0], O[579]);
| #n(0, 43, R[0], O[579]);
| #n(0, 49, R[0], O[579]);
| #n(0, 55, R[0], O[579]);
| #n(0, 118, R[0], O[579]);
| #n(0, 121, R[0], O[175]);
| #n(0, 124, R[0], O[579]);
| #n(0, 147, R[0], O[579]);
| #n(0, 505, R[0], O[579]);
| O[176] = #n(O[580], O[176]);
| #n(0, 12, R[0], O[580]);
| #n(0, 26, R[0], O[580]);
| #n(0, 32, R[0], O[580]);
| #n(0, 38, R[0], O[580]);
| #n(0, 44, R[0], O[580]);
| #n(0, 50, R[0], O[580]);
| #n(0, 56, R[0], O[580]);
| #n(0, 119, R[0], O[580]);
| #n(0, 122, R[0], O[176]);
| #n(0, 125, R[0], O[580]);
| #n(0, 148, R[0], O[580]);
| #n(0, 506, R[0], O[580]);
| O[177] = #n(O[581], O[177]);
| #n(0, 13, R[0], O[581]);
| #n(0, 27, R[0], O[581]);
| #n(0, 33, R[0], O[581]);
| #n(0, 39, R[0], O[581]);
| #n(0, 51, R[0], O[581]);
| #n(0, 57, R[0], O[581]);
| #n(0, 120, R[0], O[581]);
| #n(0, 123, R[0], O[177]);
| #n(0, 126, R[0], O[581]);
| #n(0, 149, R[0], O[581]);
| #n(0, 507, R[0], O[581]);
| #n(0, 63, R[0], C[1]);
| #n(0, 66, R[0], C[1]);
| #n(0, 10, R[0], I[4]);
| O[6] = #n();
| O[524] = #n();
| O[523] = #n();
| O[522] = #n();
| O[521] = #n();
| O[520] = #n();
| O[519] = #n();
| O[518] = #n();
| O[20] = #n();
| O[207] = #n();
| O[12] = #n();
| O[375] = #n();
| O[22] = #n();
| O[14] = #n();
| O[628] = #n();
| O[624] = #n();
| O[623] = #n();
| O[622] = #n();
| O[7] = #n();
| O[34] = #n();
| O[36] = #n();
| O[3] = #n();
| O[4] = #n();
| O[265] = #n();
| O[575] = #n();
| O[203] = #n();
| O[569] = #n();
| O[568] = #n();
| O[567] = #n();
| O[150] = #n();
| O[191] = #n();
| O[310] = #n();
| O[454] = #n();
| O[267] = #n();
| O[268] = #n();
| O[606] = #n();
| O[605] = #n();
| O[604] = #n();
| O[603] = #n();
| O[602] = #n();
| O[601] = #n();
| O[600] = #n();
| O[599] = #n();
| O[598] = #n();
| O[123] = #n();
| O[434] = #n();
| O[122] = #n();
| O[138] = #n();
| O[427] = #n();
| O[426] = #n();
| O[619] = #n();
| O[618] = #n();
| O[247] = #n();
| O[617] = #n();
| O[616] = #n();
| O[615] = #n();
| O[614] = #n();
| O[243] = #n();
| O[358] = #n();
| O[502] = #n();
| R[63] = #n();
| R[64] = #n();
| R[65] = #n();
| R[66] = #n();
| R[67] = #n();
| R[68] = #n();
| R[69] = #n();
| R[70] = #n();
| R[71] = #n();
| R[72] = #n();
| R[73] = #n();
| R[74] = #n();
| R[75] = #n();
| R[76] = #n();
| R[77] = #n();
| R[78] = #n();
| R[79] = #n();
| R[80] = #n();
| R[81] = #n();
| R[82] = #n();
| R[83] = #n();
| R[84] = #n();
| R[85] = #n();
| R[86] = #n();
| R[87] = #n();
| R[88] = #n();
| R[89] = #n();
| R[90] = #n();
| R[91] = #n();
| R[92] = #n();
| R[93] = #n();
| R[94] = #n();
| R[95] = #n();
| R[96] = #n();
| R[97] = #n();
| R[98] = #n();
| R[99] = #n();
| R[100] = #n();
| R[101] = #n();
| R[102] = #n();
| R[103] = #n();
| R[104] = #n();
| R[105] = #n();
| R[106] = #n();
| R[107] = #n();
| R[108] = #n();
| R[109] = #n();
| R[110] = #n();
| R[111] = #n();
| R[112] = #n();
| R[113] = #n();
| R[114] = #n();
| R[115] = #n();
| R[116] = #n();
| R[117] = #n();
| R[118] = #n();
| R[119] = #n();
| R[120] = #n();
| R[121] = #n();
| R[122] = #n();
| R[123] = #n();
| R[124] = #n();
| R[125] = #n();
| R[126] = #n();
| R[127] = #n();
| R[128] = #n();
| R[129] = #n();
| R[130] = #n();
| R[131] = #n();
| R[132] = #n();
| R[133] = #n();
| R[134] = #n();
| R[135] = #n();
| R[136] = #n();
| R[137] = #n();
| R[138] = #n();
| R[139] = #n();
| R[140] = #n();
| R[141] = #n();
| R[142] = #n();
| R[143] = #n();
| R[144] = #n();
| R[145] = #n();
| R[146] = #n();
| R[147] = #n();
| R[148] = #n();
| R[149] = #n();
| R[150] = #n();
| R[151] = #n();
| R[152] = #n();
| R[153] = #n();
| R[154] = #n();
| R[155] = #n();
| R[156] = #n();
| R[157] = #n();
| R[158] = #n();
| R[159] = #n();
| R[160] = #n();
| R[161] = #n();
| R[162] = #n();
| R[163] = #n();
| R[164] = #n();
| R[165] = #n();
| R[166] = #n();
| R[167] = #n();
| R[168] = #n();
| R[169] = #n();
| R[170] = #n();
| R[171] = #n();
| R[172] = #n();
| R[173] = #n();
| R[174] = #n();
| R[175] = #n();
| R[176] = #n();
| R[177] = #n();
| R[0] = #n(C[18]);
| O[523] = #n(I[87], C[0], C[1], I[89]);
| O[524] = #n(C[2], I[90]);
| O[6] = #n(O[524], O[523]);
| O[6] = #n(O[6], C[3]);
| O[522] = #n(O[6], O[523]);
| O[524] = #n(O[524], O[522]);
| O[522] = #n(O[6], I[153]);
| #n(0, 65, R[0], O[522]);
| #n(0, 73, R[0], O[522]);
| O[522] = #n(I[87], C[2]);
| #n(0, 198, R[0], O[522]);
| #n(0, 304, R[0], O[522]);
| O[523] = #n(O[6], O[523], O[523]);
| O[524] = #n(O[6], O[524], O[524]);
| #n(0, 203, R[0], O[523]);
| #n(0, 234, R[0], O[524]);
| #n(0, 235, R[0], O[6]);
| #n(0, 306, R[0], O[523]);
| #n(0, 471, R[0], O[524]);
| #n(0, 472, R[0], O[6]);
| O[6] = #n(I[152], C[3]);
| O[523] = #n(O[6], C[3], I[151]);
| O[524] = #n(O[6], C[3], I[152]);
| O[6] = #n(I[177], C[3]);
| O[6] = #n(O[524], C[4], O[6]);
| O[310] = #n(O[6], I[177], O[523]);
| O[20] = #n(O[6], C[4], O[524]);
| O[6] = #n(I[162], I[162]);
| O[519] = #n(I[163], I[163]);
| O[522] = #n(I[164], I[164]);
| O[524] = #n(I[163], O[519]);
| O[523] = #n(I[163], O[522]);
| O[520] = #n(I[164], O[522]);
| O[521] = #n(I[165], O[519]);
| O[518] = #n(I[165], O[522]);
| O[598] = #n(I[163], O[519], O[520], C[5]);
| O[426] = #n(I[162], O[519], O[518]);
| O[434] = #n(I[162], O[522], O[521]);
| O[602] = #n(I[162], O[519], O[518]);
| O[122] = #n(I[162], O[6], O[520], C[5]);
| O[605] = #n(I[165], O[6], O[523]);
| O[606] = #n(I[162], O[522], O[521]);
| O[523] = #n(I[165], O[6], O[523]);
| O[6] = #n(I[162], O[6], O[524]);
| O[522] = #n(C[5], O[6]);
| O[6] = #n(I[174], I[168]);
| O[524] = #n(C[6], O[6]);
| O[579] = #n(I[172], I[166]);
| O[22] = #n(C[7], O[579], C[7], C[0]);
| O[4] = #n(I[173], I[167]);
| O[519] = #n(C[7], C[0], C[7], O[4]);
| O[520] = #n(C[7], C[0], C[7], C[0]);
| O[521] = #n(C[7], C[0], C[7], C[0]);
| O[521] = #n(C[7], C[0], O[521], C[5]);
| O[21] = #n(C[7], C[0], O[519], C[0]);
| O[518] = #n(C[7], O[6], O[520], C[0]);
| O[521] = #n(O[521], C[0]);
| O[520] = #n(C[0], C[0], O[579]);
| O[375] = #n(C[0], C[0], C[0], C[0]);
| O[265] = #n(C[0], C[0], C[0], O[524]);
| O[207] = #n(O[4], C[0], C[0], C[0]);
| O[622] = #n(C[0], C[0], C[0], O[524]);
| O[519] = #n(C[0], C[0], C[0], C[0]);
| O[12] = #n(O[6], C[0], C[0], O[524]);
| O[203] = #n(C[7], C[0], O[22], O[521], C[0]);
| O[569] = #n(O[21], C[0], O[521], C[0]);
| O[518] = #n(O[518], C[0], O[521], O[524]);
| O[575] = #n(O[520], O[598], O[375], O[426]);
| O[3] = #n(O[520], O[602], O[375], O[122]);
| O[34] = #n(O[520], O[606], O[375], O[523]);
| O[520] = #n(O[520], C[0], O[375], C[0]);
| O[375] = #n(C[0], C[5], C[0]);
| O[36] = #n(O[265], C[0], O[520], O[375]);
| O[520] = #n(C[0], C[0], C[0]);
| O[7] = #n(O[520], O[598], O[207], O[426]);
| O[623] = #n(O[520], O[602], O[207], O[122]);
| O[624] = #n(O[520], O[606], O[207], O[523]);
| O[520] = #n(O[520], C[0], O[207], C[0]);
| O[207] = #n(C[0], C[5], C[0]);
| O[628] = #n(O[622], C[0], O[520], O[207]);
| O[14] = #n(O[520], O[598], O[519], O[426]);
| O[375] = #n(O[520], O[602], O[519], O[122]);
| O[21] = #n(O[520], O[606], O[519], O[523]);
| O[520] = #n(O[520], C[0], O[519], C[0]);
| O[519] = #n(C[0], C[5], C[0]);
| O[22] = #n(O[12], C[0], O[520], O[519]);
| O[207] = #n(O[203], O[598], O[569], O[426]);
| O[519] = #n(O[203], O[602], O[569], O[122]);
| O[520] = #n(O[203], O[606], O[569], O[523]);
| O[203] = #n(O[203], C[0], O[569], C[0]);
| O[203] = #n(O[518], C[0], O[203]);
| O[521] = #n(O[521], C[5], C[0], O[203]);
| O[3] = #n(O[265], O[605], O[3], C[0]);
| O[34] = #n(O[265], O[522], O[34], C[0]);
| O[138] = #n(I[155], I[158], I[159]);
| O[203] = #n(O[265], O[434], O[575], O[36], O[138]);
| O[123] = #n(I[156], I[158], I[160]);
| O[3] = #n(O[36], O[123], O[3]);
| O[454] = #n(I[157], I[158], I[161]);
| O[34] = #n(O[36], O[454], O[34]);
| O[265] = #n(O[36], C[5], C[0]);
| O[623] = #n(O[622], O[605], O[623], C[0]);
| O[624] = #n(O[622], O[522], O[624], C[0]);
| O[567] = #n(O[622], O[434], O[7], O[628], O[138]);
| O[568] = #n(O[628], O[123], O[623]);
| O[569] = #n(O[628], O[454], O[624]);
| O[150] = #n(O[628], C[5], C[0]);
| O[375] = #n(O[12], O[605], O[375], C[0]);
| O[21] = #n(O[12], O[522], O[21], C[0]);
| O[12] = #n(O[12], O[434], O[14], O[22], O[138]);
| O[375] = #n(O[22], O[123], O[375]);
| O[21] = #n(O[22], O[454], O[21]);
| O[191] = #n(O[22], C[5], C[0]);
| O[519] = #n(O[518], O[605], O[519], C[0]);
| O[520] = #n(O[518], O[522], O[520], C[0]);
| O[575] = #n(O[518], O[434], O[207], O[521], O[138]);
| O[36] = #n(O[521], O[123], O[519]);
| O[7] = #n(O[521], O[454], O[520]);
| O[521] = #n(O[521], C[5], C[0]);
| #n(0, 145, R[0], O[521]);
| #n(0, 255, R[0], O[521]);
| #n(0, 396, R[0], O[521]);
| #n(0, 504, R[0], O[521]);
| O[521] = #n(O[138]);
| O[603] = #n(O[123]);
| O[207] = #n(O[454]);
| O[267] = #n(O[579]);
| O[14] = #n(O[4]);
| O[628] = #n(O[6]);
| O[520] = #n(O[524]);
| O[519] = #n(O[521], O[598], O[603], O[602]);
| O[22] = #n(O[521], O[426], O[603], O[122]);
| O[518] = #n(O[521], O[434], O[603], O[605]);
| O[624] = #n(O[521], C[0], O[603], C[0]);
| O[601] = #n(O[207], C[0], O[624], C[5]);
| O[600] = #n(O[207], O[523], O[22], C[0]);
| O[22] = #n(O[207], O[522], O[518], C[0]);
| O[268] = #n(C[0]);
| O[519] = #n(O[207], O[606], O[519], O[601], O[268]);
| O[518] = #n(C[0]);
| O[623] = #n(O[426], C[0], C[0]);
| O[614] = #n(O[434], C[0], C[0]);
| O[624] = #n(O[122], C[0], C[0]);
| O[618] = #n(O[605], C[0], C[0]);
| O[604] = #n(O[523], C[0], C[0]);
| O[622] = #n(O[522], C[0], C[0]);
| O[502] = #n(O[601], O[518], O[600], C[0]);
| O[22] = #n(O[601], O[520], O[22], C[0]);
| O[358] = #n(O[601], C[5], C[0], C[0]);
| O[243] = #n(O[598], O[267], O[623], C[0]);
| O[615] = #n(O[598], C[0], O[623], O[14]);
| O[616] = #n(O[598], C[0], O[623], C[0]);
| O[623] = #n(O[598], C[0], O[623], C[0]);
| O[601] = #n(C[0], C[0]);
| O[617] = #n(O[614], C[0], O[623], O[601]);
| O[247] = #n(O[602], O[267], O[624], C[0]);
| O[619] = #n(O[602], C[0], O[624], O[14]);
| O[427] = #n(O[602], C[0], O[624], C[0]);
| O[624] = #n(O[602], C[0], O[624], C[0]);
| O[623] = #n(C[0], C[0]);
| O[599] = #n(O[618], C[0], O[624], O[623]);
| O[600] = #n(O[606], O[267], O[604], C[0]);
| O[623] = #n(O[606], C[0], O[604], O[14]);
| O[624] = #n(O[606], C[0], O[604], C[0]);
| O[604] = #n(O[606], C[0], O[604], C[0]);
| O[601] = #n(O[622], C[0], O[604], O[601]);
| O[267] = #n(O[519], O[267], O[502], C[0]);
| O[14] = #n(O[519], C[0], O[502], O[14]);
| O[604] = #n(O[519], C[0], O[502], C[0]);
| O[519] = #n(O[519], C[0], O[502], C[0]);
| O[519] = #n(O[22], C[0], O[519], O[358]);
| O[615] = #n(O[614], C[0], O[615], C[0]);
| O[616] = #n(O[614], O[628], O[616], C[0]);
| O[614] = #n(O[614], C[0], O[243], O[617], C[6]);
| #n(0, 182, R[0], O[614]);
| #n(0, 288, R[0], O[614]);
| #n(0, 429, R[0], O[614]);
| #n(0, 540, R[0], O[614]);
| O[615] = #n(O[617], C[6], O[615]);
| #n(0, 183, R[0], O[615]);
| #n(0, 289, R[0], O[615]);
| #n(0, 430, R[0], O[615]);
| #n(0, 541, R[0], O[615]);
| O[616] = #n(O[617], C[6], O[616]);
| #n(0, 184, R[0], O[616]);
| #n(0, 290, R[0], O[616]);
| #n(0, 431, R[0], O[616]);
| #n(0, 542, R[0], O[616]);
| O[617] = #n(O[617], C[0]);
| #n(0, 185, R[0], O[617]);
| #n(0, 291, R[0], O[617]);
| #n(0, 432, R[0], O[617]);
| #n(0, 543, R[0], O[617]);
| O[619] = #n(O[618], C[0], O[619], C[0]);
| O[427] = #n(O[618], O[628], O[427], C[0]);
| O[618] = #n(O[618], C[0], O[247], O[599], C[6]);
| #n(0, 186, R[0], O[618]);
| #n(0, 292, R[0], O[618]);
| #n(0, 433, R[0], O[618]);
| #n(0, 544, R[0], O[618]);
| O[619] = #n(O[599], C[6], O[619]);
| #n(0, 187, R[0], O[619]);
| #n(0, 293, R[0], O[619]);
| #n(0, 434, R[0], O[619]);
| #n(0, 545, R[0], O[619]);
| O[427] = #n(O[599], C[6], O[427]);
| #n(0, 188, R[0], O[427]);
| #n(0, 294, R[0], O[427]);
| #n(0, 435, R[0], O[427]);
| #n(0, 546, R[0], O[427]);
| O[599] = #n(O[599], C[0]);
| #n(0, 189, R[0], O[599]);
| #n(0, 295, R[0], O[599]);
| #n(0, 436, R[0], O[599]);
| #n(0, 547, R[0], O[599]);
| O[623] = #n(O[622], C[0], O[623], C[0]);
| O[624] = #n(O[622], O[628], O[624], C[0]);
| O[622] = #n(O[622], C[0], O[600], O[601], C[6]);
| O[623] = #n(O[601], C[6], O[623]);
| O[624] = #n(O[601], C[6], O[624]);
| O[601] = #n(O[601], C[0]);
| #n(0, 193, R[0], O[601]);
| #n(0, 299, R[0], O[601]);
| #n(0, 440, R[0], O[601]);
| #n(0, 551, R[0], O[601]);
| O[14] = #n(O[22], C[0], O[14], C[0]);
| O[628] = #n(O[22], O[628], O[604], C[0]);
| O[22] = #n(O[22], C[0], O[267], O[519], C[6]);
| O[14] = #n(O[519], C[6], O[14]);
| O[628] = #n(O[519], C[6], O[628]);
| O[519] = #n(O[519], C[0]);
| #n(0, 197, R[0], O[519]);
| #n(0, 303, R[0], O[519]);
| #n(0, 444, R[0], O[519]);
| #n(0, 555, R[0], O[519]);
| O[267] = #n(O[521], O[598], O[603], O[602]);
| O[604] = #n(O[521], O[426], O[603], O[122]);
| O[519] = #n(O[521], O[434], O[603], O[605]);
| O[521] = #n(O[521], C[0], O[603], C[0]);
| O[521] = #n(O[207], C[0], O[521], C[5]);
| O[601] = #n(O[207], O[523], O[604], C[0]);
| O[519] = #n(O[207], O[522], O[519], C[0]);
| O[207] = #n(O[207], O[606], O[267], O[521], O[268]);
| O[599] = #n(O[426], C[0], C[0]);
| O[600] = #n(O[434], C[0], C[0]);
| O[603] = #n(O[122], C[0], C[0]);
| O[604] = #n(O[605], C[0], C[0]);
| O[268] = #n(O[523], C[0], C[0]);
| O[267] = #n(O[522], C[0], C[0]);
| O[518] = #n(O[521], O[518], O[601], C[0]);
| O[519] = #n(O[521], O[520], O[519], C[0]);
| O[520] = #n(O[521], C[5], C[0], C[0]);
| O[601] = #n(O[602], C[0]);
| O[521] = #n(O[606], C[0]);
| O[427] = #n(O[122], C[0]);
| O[523] = #n(O[523], C[0]);
| O[605] = #n(O[605], C[0]);
| O[522] = #n(O[522], C[0]);
| #n(0, 69, R[0], O[601]);
| #n(0, 85, R[0], O[601]);
| #n(0, 219, R[0], O[601]);
| #n(0, 334, R[0], O[601]);
| #n(0, 350, R[0], O[601]);
| #n(0, 70, R[0], O[521]);
| #n(0, 86, R[0], O[521]);
| #n(0, 220, R[0], O[521]);
| #n(0, 335, R[0], O[521]);
| #n(0, 351, R[0], O[521]);
| O[122] = #n(C[0], O[598], C[0], O[426]);
| #n(0, 72, R[0], O[426]);
| #n(0, 88, R[0], O[426]);
| #n(0, 222, R[0], O[426]);
| #n(0, 337, R[0], O[426]);
| #n(0, 353, R[0], O[426]);
| O[601] = #n(C[0], O[601], C[0], O[427]);
| #n(0, 73, R[0], O[427]);
| #n(0, 89, R[0], O[427]);
| #n(0, 223, R[0], O[427]);
| #n(0, 338, R[0], O[427]);
| #n(0, 354, R[0], O[427]);
| O[521] = #n(C[0], O[521], C[0], O[523]);
| #n(0, 74, R[0], O[523]);
| #n(0, 90, R[0], O[523]);
| #n(0, 224, R[0], O[523]);
| #n(0, 339, R[0], O[523]);
| #n(0, 355, R[0], O[523]);
| O[523] = #n(C[0], C[0], C[0], C[0]);
| #n(0, 76, R[0], O[434]);
| #n(0, 92, R[0], O[434]);
| #n(0, 226, R[0], O[434]);
| #n(0, 341, R[0], O[434]);
| #n(0, 357, R[0], O[434]);
| #n(0, 77, R[0], O[605]);
| #n(0, 93, R[0], O[605]);
| #n(0, 227, R[0], O[605]);
| #n(0, 342, R[0], O[605]);
| #n(0, 358, R[0], O[605]);
| #n(0, 78, R[0], O[522]);
| #n(0, 94, R[0], O[522]);
| #n(0, 228, R[0], O[522]);
| #n(0, 343, R[0], O[522]);
| #n(0, 359, R[0], O[522]);
| O[434] = #n(O[524], O[434], O[122], O[138]);
| #n(0, 80, R[0], O[434]);
| #n(0, 96, R[0], O[434]);
| #n(0, 230, R[0], O[434]);
| #n(0, 345, R[0], O[434]);
| #n(0, 361, R[0], O[434]);
| O[605] = #n(O[524], O[605], O[601], O[123]);
| #n(0, 81, R[0], O[605]);
| #n(0, 97, R[0], O[605]);
| #n(0, 231, R[0], O[605]);
| #n(0, 346, R[0], O[605]);
| #n(0, 362, R[0], O[605]);
| O[522] = #n(O[524], O[522], O[521], O[454]);
| #n(0, 82, R[0], O[522]);
| #n(0, 98, R[0], O[522]);
| #n(0, 232, R[0], O[522]);
| #n(0, 347, R[0], O[522]);
| #n(0, 363, R[0], O[522]);
| O[524] = #n(O[524], C[0], O[523], C[5]);
| #n(0, 83, R[0], O[524]);
| #n(0, 99, R[0], O[524]);
| #n(0, 233, R[0], O[524]);
| #n(0, 348, R[0], O[524]);
| #n(0, 364, R[0], O[524]);
| O[521] = #n(C[7], O[579], C[7], C[0]);
| O[522] = #n(C[7], C[0], C[7], O[4]);
| O[523] = #n(C[7], C[0], C[7], C[0]);
| O[524] = #n(C[7], C[0], C[7], C[0]);
| O[521] = #n(C[7], C[0], O[521]);
| #n(0, 377, R[0], O[521]);
| #n(0, 485, R[0], O[521]);
| O[522] = #n(C[7], C[0], O[522]);
| #n(0, 378, R[0], O[522]);
| #n(0, 486, R[0], O[522]);
| O[523] = #n(C[7], O[6], O[523]);
| #n(0, 379, R[0], O[523]);
| #n(0, 487, R[0], O[523]);
| #n(0, 3, R[0], I[93]);
| O[524] = #n(C[7], C[0], O[524], C[5]);
| #n(0, 380, R[0], O[524]);
| #n(0, 488, R[0], O[524]);
| O[524] = #n(O[579]);
| #n(0, 317, R[0], O[524]);
| #n(0, 455, R[0], O[524]);
| O[524] = #n(O[4]);
| #n(0, 322, R[0], O[524]);
| #n(0, 460, R[0], O[524]);
| O[524] = #n(O[6]);
| #n(0, 327, R[0], O[524]);
| #n(0, 465, R[0], O[524]);
| O[605] = #n(C[0], C[0]);
| O[454] = #n(C[0], C[0]);
| #n(O[598], O[599], O[600], O[601], O[602], O[603], O[604], O[605], O[606], O[268], O[267], O[454], O[207], O[518], O[519], O[520]O[521], O[522], O[523], O[524]);
| #n(0, 68, R[0], O[598]);
| #n(0, 84, R[0], O[598]);
| #n(0, 150, R[0], O[598]);
| #n(0, 151, R[0], O[599]);
| #n(0, 152, R[0], O[600]);
| #n(0, 153, R[0], O[601]);
| #n(0, 154, R[0], O[602]);
| #n(0, 155, R[0], O[603]);
| #n(0, 156, R[0], O[604]);
| #n(0, 157, R[0], O[605]);
| #n(0, 158, R[0], O[606]);
| #n(0, 159, R[0], O[268]);
| #n(0, 160, R[0], O[267]);
| #n(0, 161, R[0], O[454]);
| #n(0, 162, R[0], O[207]);
| #n(0, 163, R[0], O[518]);
| #n(0, 164, R[0], O[519]);
| #n(0, 165, R[0], O[520]);
| #n(0, 166, R[0], O[598]);
| #n(0, 167, R[0], O[599]);
| #n(0, 168, R[0], O[600]);
| #n(0, 169, R[0], O[601]);
| #n(0, 170, R[0], O[602]);
| #n(0, 171, R[0], O[603]);
| #n(0, 172, R[0], O[604]);
| #n(0, 173, R[0], O[605]);
| #n(0, 174, R[0], O[606]);
| #n(0, 175, R[0], O[268]);
| #n(0, 176, R[0], O[267]);
| #n(0, 177, R[0], O[454]);
| #n(0, 178, R[0], O[207]);
| #n(0, 179, R[0], O[518]);
| #n(0, 180, R[0], O[519]);
| #n(0, 181, R[0], O[520]);
| #n(0, 218, R[0], O[598]);
| #n(0, 256, R[0], O[598]);
| #n(0, 257, R[0], O[599]);
| #n(0, 258, R[0], O[600]);
| #n(0, 259, R[0], O[601]);
| #n(0, 260, R[0], O[602]);
| #n(0, 261, R[0], O[603]);
| #n(0, 262, R[0], O[604]);
| #n(0, 263, R[0], O[605]);
| #n(0, 264, R[0], O[606]);
| #n(0, 265, R[0], O[268]);
| #n(0, 266, R[0], O[267]);
| #n(0, 267, R[0], O[454]);
| #n(0, 268, R[0], O[207]);
| #n(0, 269, R[0], O[518]);
| #n(0, 270, R[0], O[519]);
| #n(0, 271, R[0], O[520]);
| #n(0, 272, R[0], O[598]);
| #n(0, 273, R[0], O[599]);
| #n(0, 274, R[0], O[600]);
| #n(0, 275, R[0], O[601]);
| #n(0, 276, R[0], O[602]);
| #n(0, 277, R[0], O[603]);
| #n(0, 278, R[0], O[604]);
| #n(0, 279, R[0], O[605]);
| #n(0, 280, R[0], O[606]);
| #n(0, 281, R[0], O[268]);
| #n(0, 282, R[0], O[267]);
| #n(0, 283, R[0], O[454]);
| #n(0, 284, R[0], O[207]);
| #n(0, 285, R[0], O[518]);
| #n(0, 286, R[0], O[519]);
| #n(0, 287, R[0], O[520]);
| #n(0, 333, R[0], O[598]);
| #n(0, 349, R[0], O[598]);
| #n(0, 397, R[0], O[598]);
| #n(0, 398, R[0], O[599]);
| #n(0, 399, R[0], O[600]);
| #n(0, 400, R[0], O[601]);
| #n(0, 401, R[0], O[602]);
| #n(0, 402, R[0], O[603]);
| #n(0, 403, R[0], O[604]);
| #n(0, 404, R[0], O[605]);
| #n(0, 405, R[0], O[606]);
| #n(0, 406, R[0], O[268]);
| #n(0, 407, R[0], O[267]);
| #n(0, 408, R[0], O[454]);
| #n(0, 409, R[0], O[207]);
| #n(0, 410, R[0], O[518]);
| #n(0, 411, R[0], O[519]);
| #n(0, 412, R[0], O[520]);
| #n(0, 413, R[0], O[598]);
| #n(0, 414, R[0], O[599]);
| #n(0, 415, R[0], O[600]);
| #n(0, 416, R[0], O[601]);
| #n(0, 417, R[0], O[602]);
| #n(0, 418, R[0], O[603]);
| #n(0, 419, R[0], O[604]);
| #n(0, 420, R[0], O[605]);
| #n(0, 421, R[0], O[606]);
| #n(0, 422, R[0], O[268]);
| #n(0, 423, R[0], O[267]);
| #n(0, 424, R[0], O[454]);
| #n(0, 425, R[0], O[207]);
| #n(0, 426, R[0], O[518]);
| #n(0, 427, R[0], O[519]);
| #n(0, 428, R[0], O[520]);
| #n(0, 508, R[0], O[598]);
| #n(0, 509, R[0], O[599]);
| #n(0, 510, R[0], O[600]);
| #n(0, 511, R[0], O[601]);
| #n(0, 512, R[0], O[602]);
| #n(0, 513, R[0], O[603]);
| #n(0, 514, R[0], O[604]);
| #n(0, 515, R[0], O[605]);
| #n(0, 516, R[0], O[606]);
| #n(0, 517, R[0], O[268]);
| #n(0, 518, R[0], O[267]);
| #n(0, 519, R[0], O[454]);
| #n(0, 520, R[0], O[207]);
| #n(0, 521, R[0], O[518]);
| #n(0, 522, R[0], O[519]);
| #n(0, 523, R[0], O[520]);
| #n(0, 524, R[0], O[598]);
| #n(0, 525, R[0], O[599]);
| #n(0, 526, R[0], O[600]);
| #n(0, 527, R[0], O[601]);
| #n(0, 528, R[0], O[602]);
| #n(0, 529, R[0], O[603]);
| #n(0, 530, R[0], O[604]);
| #n(0, 531, R[0], O[605]);
| #n(0, 532, R[0], O[606]);
| #n(0, 533, R[0], O[268]);
| #n(0, 534, R[0], O[267]);
| #n(0, 535, R[0], O[454]);
| #n(0, 536, R[0], O[207]);
| #n(0, 537, R[0], O[518]);
| #n(0, 538, R[0], O[519]);
| #n(0, 539, R[0], O[520]);
| O[518] = #n(O[203], C[6], O[567], C[6]);
| O[519] = #n(O[3], C[6], O[568], C[6]);
| O[520] = #n(O[34], C[6], O[569], C[6]);
| O[518] = #n(O[12], C[6], O[518], O[575]);
| O[519] = #n(O[375], C[6], O[519], O[36]);
| O[520] = #n(O[21], C[6], O[520], O[7]);
| O[524] = #n(O[524], C[8]);
| O[518] = #n(I[155], I[158], O[518]);
| O[519] = #n(I[156], I[158], O[519]);
| O[520] = #n(I[157], I[158], O[520]);
| O[207] = #n(I[154], C[0], C[9]);
| #n(0, 237, R[0], O[207]);
| O[207] = #n(I[145], C[10]);
| O[207] = #n(I[145], C[11], O[207]);
| O[207] = #n(O[20], C[3], O[207]);
| O[207] = #n(I[146], O[20], O[207]);
| O[454] = #n(I[145], C[12]);
| O[454] = #n(I[145], C[4], O[454]);
| O[454] = #n(O[310], C[4], O[454]);
| O[454] = #n(O[454]);
| O[454] = #n(O[454], C[3], O[310], C[12]);
| O[267] = #n(O[207], O[454], I[145]);
| O[454] = #n(O[207], O[20], I[146]);
| O[207] = #n(O[20], C[3]);
| O[207] = #n(O[310], C[3], O[207]);
| O[268] = #n(O[267], C[11]);
| O[268] = #n(O[267], C[10], O[268]);
| O[207] = #n(O[207], O[268]);
| O[207] = #n(O[454], C[12], O[207]);
| O[267] = #n(O[207], C[12], O[267]);
| O[454] = #n(O[207], C[12], O[454]);
| O[207] = #n(O[20], C[4]);
| O[207] = #n(I[176], C[3]);
| O[207] = #n(O[267], C[3], O[207]);
| O[207] = #n(O[454], C[3], O[207]);
| O[207] = #n(O[454], C[10], O[207]);
| O[267] = #n(O[207], C[10], O[267]);
| #n(0, 61, R[0], O[267]);
| O[207] = #n(O[207], C[10], O[454]);
| #n(0, 62, R[0], O[207]);
| O[207] = #n(I[170], C[2]);
| O[454] = #n(I[169], C[2]);
| O[454] = #n(O[207], O[207], O[454], O[454]);
| O[207] = #n(I[171], C[2]);
| O[207] = #n(O[207], O[207], O[454]);
| O[207] = #n(I[81], C[13], O[207]);
| #n(0, 205, R[0], O[207]);
| #n(C[3]O[267], O[454], O[207]);
| O[267] = #n(O[267], O[579]);
| #n(0, 199, R[0], O[267]);
| #n(0, 206, R[0], O[267]);
| #n(0, 365, R[0], O[579]);
| #n(0, 473, R[0], O[579]);
| O[454] = #n(O[454], O[4]);
| #n(0, 200, R[0], O[454]);
| #n(0, 370, R[0], O[4]);
| #n(0, 478, R[0], O[4]);
| #n(0, 506, R[0], O[4]);
| O[207] = #n(O[207], O[6]);
| #n(0, 201, R[0], O[207]);
| #n(0, 375, R[0], O[6]);
| #n(0, 483, R[0], O[6]);
| #n(0, 507, R[0], O[6]);
| #n(0, 66, R[0], I[149]);
| O[6] = #n(I[149]);
| O[6] = #n(O[6]);
| #n(0, 68, R[0], O[6]);
| O[6] = #n(I[0], C[0], C[14], I[1]);
| #n(0, 1, R[0], O[6]);
| #n(0, 7, R[0], I[5]);
| O[6] = #n(I[0], C[2]);
| #n(0, 0, R[0], O[6]);
| #n(0, 5, R[0], I[95]);
| O[6] = #n(I[91], C[10]);
| O[6] = #n(I[91], C[11], O[6]);
| O[6] = #n(O[20], C[3], O[6]);
| O[207] = #n(I[92], O[20], O[6]);
| O[6] = #n(I[91], C[12]);
| O[6] = #n(I[91], C[4], O[6]);
| O[6] = #n(O[310], C[4], O[6]);
| O[6] = #n(O[6], C[3], O[310], C[12]);
| O[6] = #n(O[207], O[6], I[91]);
| O[207] = #n(O[207], O[20], I[92]);
| O[4] = #n(O[310], C[3]);
| #n(0, 71, R[0], O[310]);
| #n(0, 72, R[0], O[20]);
| O[20] = #n(O[20], C[4], O[4]);
| O[4] = #n(O[6], C[11]);
| O[4] = #n(O[6], C[10], O[4]);
| O[20] = #n(O[20], O[4]);
| O[20] = #n(O[207], C[12], O[20]);
| O[6] = #n(O[20], C[12], O[6]);
| O[207] = #n(O[20], C[12], O[207]);
| O[20] = #n(O[6], C[3]);
| O[20] = #n(O[207], C[3], O[20]);
| O[20] = #n(I[175], C[3], O[20]);
| O[20] = #n(O[207], C[10], O[20]);
| O[6] = #n(O[20], C[10], O[6]);
| O[207] = #n(O[20], C[10], O[207]);
| O[20] = #n(I[170], C[2]);
| O[4] = #n(I[169], C[2]);
| O[4] = #n(O[20], O[20], O[4], O[4]);
| O[20] = #n(I[171], C[2]);
| O[20] = #n(O[20], O[20], O[4]);
| O[20] = #n(I[2], C[13], O[20]);
| #n(C[12]O[4], R[65535], R[65535]);
| O[4] = #n(O[4], I[78]);
| #n(0, 4, R[0], O[4]);
| #n(0, 111, R[0], I[78]);
| #n(0, 147, R[0], I[78]);
| O[4] = #n(O[3], O[3], O[203], O[203]);
| O[4] = #n(O[34], O[34], O[4], O[265], O[265]);
| #n(0, 133, R[0], O[265]);
| #n(0, 243, R[0], O[265]);
| #n(0, 384, R[0], O[265]);
| #n(0, 492, R[0], O[265]);
| O[4] = #n(O[4]);
| O[265] = #n(O[568], O[568], O[567], O[567]);
| O[265] = #n(O[569], O[569], O[265], O[150], O[150]);
| #n(0, 137, R[0], O[150]);
| #n(0, 247, R[0], O[150]);
| #n(0, 388, R[0], O[150]);
| #n(0, 496, R[0], O[150]);
| O[150] = #n(O[265]);
| O[265] = #n(O[375], O[375], O[12], O[12]);
| O[265] = #n(O[21], O[21], O[265], O[191], O[191]);
| #n(0, 141, R[0], O[191]);
| #n(0, 251, R[0], O[191]);
| #n(0, 392, R[0], O[191]);
| #n(0, 500, R[0], O[191]);
| O[265] = #n(O[265]);
| O[4] = #n(O[4], C[6]);
| O[454] = #n(O[150], C[6]);
| O[265] = #n(O[265], C[6]);
| O[150] = #n(O[203], C[6], O[567], C[6]);
| O[191] = #n(O[3], C[6], O[568], C[6]);
| O[310] = #n(O[34], C[6], O[569], C[6]);
| O[150] = #n(O[12], C[6], O[150], O[575]);
| O[191] = #n(O[375], C[6], O[191], O[36]);
| O[310] = #n(O[21], C[6], O[310], O[7]);
| #n(C[4], I[130], O[150], O[191], O[310], I[162], I[163], I[164], I[165], O[4], O[454], O[265], C[5], C[0], C[0], C[5]);
| #n(0, 46, R[0], I[130]);
| #n(0, 130, R[0], O[203]);
| #n(0, 240, R[0], O[203]);
| #n(0, 381, R[0], O[203]);
| #n(0, 489, R[0], O[203]);
| #n(0, 131, R[0], O[3]);
| #n(0, 241, R[0], O[3]);
| #n(0, 382, R[0], O[3]);
| #n(0, 490, R[0], O[3]);
| #n(0, 132, R[0], O[34]);
| #n(0, 242, R[0], O[34]);
| #n(0, 383, R[0], O[34]);
| #n(0, 491, R[0], O[34]);
| O[203] = #n(O[203], C[6], O[567], C[6]);
| #n(0, 134, R[0], O[567]);
| #n(0, 244, R[0], O[567]);
| #n(0, 385, R[0], O[567]);
| #n(0, 493, R[0], O[567]);
| O[3] = #n(O[3], C[6], O[568], C[6]);
| #n(0, 135, R[0], O[568]);
| #n(0, 245, R[0], O[568]);
| #n(0, 386, R[0], O[568]);
| #n(0, 494, R[0], O[568]);
| O[34] = #n(O[34], C[6], O[569], C[6]);
| #n(0, 136, R[0], O[569]);
| #n(0, 246, R[0], O[569]);
| #n(0, 387, R[0], O[569]);
| #n(0, 495, R[0], O[569]);
| #n(0, 138, R[0], O[12]);
| #n(0, 248, R[0], O[12]);
| #n(0, 389, R[0], O[12]);
| #n(0, 497, R[0], O[12]);
| #n(0, 139, R[0], O[375]);
| #n(0, 249, R[0], O[375]);
| #n(0, 390, R[0], O[375]);
| #n(0, 498, R[0], O[375]);
| #n(0, 140, R[0], O[21]);
| #n(0, 250, R[0], O[21]);
| #n(0, 391, R[0], O[21]);
| #n(0, 499, R[0], O[21]);
| O[12] = #n(O[12], C[6], O[203], O[575]);
| #n(0, 142, R[0], O[575]);
| #n(0, 252, R[0], O[575]);
| #n(0, 393, R[0], O[575]);
| #n(0, 501, R[0], O[575]);
| O[375] = #n(O[375], C[6], O[3], O[36]);
| #n(0, 143, R[0], O[36]);
| #n(0, 253, R[0], O[36]);
| #n(0, 394, R[0], O[36]);
| #n(0, 502, R[0], O[36]);
| O[21] = #n(O[21], C[6], O[34], O[7]);
| #n(0, 8, R[0], I[6]);
| #n(0, 9, R[0], I[7]);
| #n(0, 144, R[0], O[7]);
| #n(0, 254, R[0], O[7]);
| #n(0, 395, R[0], O[7]);
| #n(0, 503, R[0], O[7]);
| O[7] = #n(I[162], C[16]);
| O[7] = #n(I[165], C[15], O[7]);
| O[34] = #n(I[162], C[15]);
| O[3] = #n(I[165], C[16], O[34], C[8]);
| O[34] = #n(I[163], C[16]);
| O[34] = #n(C[0], C[8], C[0], O[34]);
| O[36] = #n(I[163], C[15]);
| O[36] = #n(C[0], C[0], O[36], C[8]);
| O[7] = #n(C[0], O[7], C[0], C[8]);
| O[34] = #n(I[164], C[15], O[34]);
| O[36] = #n(I[164], C[16], O[36]);
| O[3] = #n(C[0], C[8], O[3], C[0], C[8]);
| #n(0, 4, R[0], I[94]);
| #n(C[4], C[17], O[12], O[375], O[21], O[7], O[34], O[36], O[3], O[4], O[265], I[103], I[105], C[6], C[0], C[0], C[5]);
| #n(0, 2, R[0], O[207]);
| #n(0, 18, R[0], I[103]);
| #n(0, 20, R[0], I[105]);
| O[207] = #n(C[2], I[61]);
| #n(0, 2, R[0], C[2]);
| #n(0, 3, R[0], O[20]);
| #n(0, 204, R[0], C[2]);
| #n(0, 238, R[0], C[2]);
| O[20] = #n(O[207], C[2]);
| #n(0, 14, R[0], O[20]);
| #n(0, 100, R[0], O[207]);
| O[207] = #n(O[207], C[0]);
| O[375] = #n(O[20], C[0], O[207]);
| #n(C[12]O[207], O[12], O[21]);
| O[20] = #n(O[622], I[8], O[22]);
| #n(0, 190, R[0], O[622]);
| #n(0, 194, R[0], O[22]);
| #n(0, 296, R[0], O[622]);
| #n(0, 300, R[0], O[22]);
| #n(0, 437, R[0], O[622]);
| #n(0, 441, R[0], O[22]);
| #n(0, 548, R[0], O[622]);
| #n(0, 552, R[0], O[22]);
| O[22] = #n(O[623], I[8], O[14]);
| #n(0, 191, R[0], O[623]);
| #n(0, 195, R[0], O[14]);
| #n(0, 297, R[0], O[623]);
| #n(0, 301, R[0], O[14]);
| #n(0, 438, R[0], O[623]);
| #n(0, 442, R[0], O[14]);
| #n(0, 549, R[0], O[623]);
| #n(0, 553, R[0], O[14]);
| O[14] = #n(O[624], I[8], O[628]);
| #n(0, 192, R[0], O[624]);
| #n(0, 196, R[0], O[628]);
| #n(0, 298, R[0], O[624]);
| #n(0, 302, R[0], O[628]);
| #n(0, 439, R[0], O[624]);
| #n(0, 443, R[0], O[628]);
| #n(0, 550, R[0], O[624]);
| #n(0, 554, R[0], O[628]);
| #n(C[12], O[20], O[22], O[14]R[65535], R[65535], O[20]);
| #n(0, 8, R[0], I[98]);
| O[20] = #n(O[20]);
| O[20] = #n(O[20], C[3], O[21]);
| O[21] = #n(O[207], O[12]);
| O[21] = #n(O[21], O[20]);
| O[21] = #n(O[21], I[128]);
| #n(0, 44, R[0], I[128]);
| O[21] = #n(O[21], I[4]);
| #n(0, 6, R[0], I[4]);
| O[22] = #n(O[21], C[5]);
| #n(0, 332, R[0], C[5]);
| #n(0, 470, R[0], C[5]);
| O[21] = #n(O[21], C[0], C[0], O[22]);
| O[375] = #n(O[375], O[21], C[3]);
| O[21] = #n(O[375], C[3]);
| #n(0, 11, R[0], O[21]);
| #n(0, 12, R[0], O[375]);
| O[207] = #n(O[207], O[12]);
| O[207] = #n(O[207], O[20]);
| #n(0, 14, R[0], O[207]);
| #n(0, 15, R[0], O[20]);
| O[12] = #n(C[6]);
| O[20] = #n(I[172], O[12], C[0]);
| O[207] = #n(I[173], O[12], C[0]);
| O[375] = #n(I[174], C[6]);
| O[12] = #n(I[174], O[12], O[375]);
| O[21] = #n(I[173], C[6], C[0]);
| #n(0, 15, R[0], C[0]);
| #n(0, 65, R[0], C[0]);
| #n(0, 66, R[0], C[0]);
| #n(0, 71, R[0], C[0]);
| #n(0, 75, R[0], C[0]);
| #n(0, 79, R[0], C[0]);
| #n(0, 87, R[0], C[0]);
| #n(0, 91, R[0], C[0]);
| #n(0, 95, R[0], C[0]);
| #n(0, 101, R[0], C[0]);
| O[22] = #n(I[154], C[0], C[9]);
| #n(0, 128, R[0], O[22]);
| #n(0, 221, R[0], C[0]);
| #n(0, 225, R[0], C[0]);
| #n(0, 229, R[0], C[0]);
| #n(0, 239, R[0], C[0]);
| #n(0, 314, R[0], C[0]);
| #n(0, 315, R[0], C[0]);
| #n(0, 318, R[0], C[0]);
| #n(0, 319, R[0], C[0]);
| #n(0, 320, R[0], C[0]);
| #n(0, 321, R[0], C[0]);
| #n(0, 323, R[0], C[0]);
| #n(0, 324, R[0], C[0]);
| #n(0, 325, R[0], C[0]);
| #n(0, 326, R[0], C[0]);
| #n(0, 328, R[0], C[0]);
| #n(0, 336, R[0], C[0]);
| #n(0, 340, R[0], C[0]);
| #n(0, 344, R[0], C[0]);
| #n(0, 352, R[0], C[0]);
| #n(0, 356, R[0], C[0]);
| #n(0, 360, R[0], C[0]);
| #n(0, 366, R[0], C[0]);
| #n(0, 367, R[0], C[0]);
| #n(0, 368, R[0], C[0]);
| #n(0, 369, R[0], C[0]);
| #n(0, 371, R[0], C[0]);
| #n(0, 372, R[0], C[0]);
| #n(0, 373, R[0], C[0]);
| #n(0, 374, R[0], C[0]);
| #n(0, 376, R[0], C[0]);
| #n(0, 452, R[0], C[0]);
| #n(0, 453, R[0], C[0]);
| #n(0, 456, R[0], C[0]);
| #n(0, 457, R[0], C[0]);
| #n(0, 458, R[0], C[0]);
| #n(0, 459, R[0], C[0]);
| #n(0, 461, R[0], C[0]);
| #n(0, 462, R[0], C[0]);
| #n(0, 463, R[0], C[0]);
| #n(0, 464, R[0], C[0]);
| #n(0, 466, R[0], C[0]);
| #n(0, 474, R[0], C[0]);
| #n(0, 475, R[0], C[0]);
| #n(0, 476, R[0], C[0]);
| #n(0, 477, R[0], C[0]);
| #n(0, 479, R[0], C[0]);
| #n(0, 480, R[0], C[0]);
| #n(0, 481, R[0], C[0]);
| #n(0, 482, R[0], C[0]);
| #n(0, 484, R[0], C[0]);
| O[22] = #n(I[174], C[6], O[375]);
| #n(0, 67, R[0], C[6]);
| #n(0, 316, R[0], C[6]);
| #n(0, 329, R[0], C[6]);
| #n(0, 330, R[0], C[6]);
| #n(0, 331, R[0], C[6]);
| #n(0, 454, R[0], C[6]);
| #n(0, 467, R[0], C[6]);
| #n(0, 468, R[0], C[6]);
| #n(0, 469, R[0], C[6]);
| O[375] = #n(I[172], C[6], C[0]);
| #n(C[10], C[18], C[18], O[20], O[207], O[12], O[375], O[21], O[22]);
| #n(0, 10, R[0], I[8]);
| #n(0, 146, R[0], I[8]);
| #n(0, 6, R[0], I[96]);
| #n(0, 70, R[0], C[18]);
| #n(C[11], O[518], O[519], O[520], O[521], O[522], O[523], O[524], I[9], I[10], I[11], C[3], C[17]R[65535]);
| #n(0, 11, R[0], I[9]);
| #n(0, 12, R[0], I[10]);
| #n(0, 13, R[0], I[11]);
| #n(0, 58, R[0], O[518]);
| #n(0, 59, R[0], O[519]);
| #n(0, 60, R[0], O[520]);
| #n(0, 61, R[0], O[521]);
| #n(0, 62, R[0], O[522]);
| #n(0, 63, R[0], O[523]);
| #n(0, 64, R[0], O[524]);
| #n(0, 102, R[0], C[20]);
| #n(0, 211, R[0], O[518]);
| #n(0, 212, R[0], O[519]);
| #n(0, 213, R[0], O[520]);
| #n(0, 214, R[0], O[521]);
| #n(0, 215, R[0], O[522]);
| #n(0, 216, R[0], O[523]);
| #n(0, 217, R[0], O[524]);
| #n(0, 307, R[0], O[518]);
| #n(0, 308, R[0], O[519]);
| #n(0, 309, R[0], O[520]);
| #n(0, 310, R[0], O[521]);
| #n(0, 311, R[0], O[522]);
| #n(0, 312, R[0], O[523]);
| #n(0, 313, R[0], O[524]);
| #n(0, 445, R[0], O[518]);
| #n(0, 446, R[0], O[519]);
| #n(0, 447, R[0], O[520]);
| #n(0, 448, R[0], O[521]);
| #n(0, 449, R[0], O[522]);
| #n(0, 450, R[0], O[523]);
| #n(0, 451, R[0], O[524]);
| #n(0, 0, R[0], C[19]);
| #n(0, 7, R[0], I[97]);
| #n(0, 9, R[0], I[99]);
| #n(0, 13, R[0], C[3]);
| #n(0, 42, R[0], C[3]);
| #n(0, 69, R[0], C[3]);
| #n(0, 16, R[0], I[12]);
| #n(0, 17, R[0], I[13]);
| #n(0, 18, R[0], I[14]);
| #n(0, 19, R[0], I[15]);
| #n(0, 20, R[0], I[16]);
| #n(0, 21, R[0], I[17]);
| #n(0, 22, R[0], I[18]);
| #n(0, 23, R[0], I[19]);
| #n(0, 24, R[0], I[20]);
| #n(0, 25, R[0], I[21]);
| #n(0, 26, R[0], I[22]);
| #n(0, 27, R[0], I[23]);
| #n(0, 28, R[0], I[24]);
| #n(0, 29, R[0], I[25]);
| #n(0, 30, R[0], I[26]);
| #n(0, 31, R[0], I[27]);
| #n(0, 32, R[0], I[28]);
| #n(0, 33, R[0], I[29]);
| #n(0, 34, R[0], I[30]);
| #n(0, 35, R[0], I[31]);
| #n(0, 36, R[0], I[32]);
| #n(0, 37, R[0], I[33]);
| #n(0, 38, R[0], I[34]);
| #n(0, 39, R[0], I[35]);
| #n(0, 40, R[0], I[36]);
| #n(0, 41, R[0], I[37]);
| #n(0, 42, R[0], I[38]);
| #n(0, 43, R[0], I[39]);
| #n(0, 44, R[0], I[40]);
| #n(0, 45, R[0], I[41]);
| #n(0, 46, R[0], I[42]);
| #n(0, 47, R[0], I[43]);
| #n(0, 48, R[0], I[44]);
| #n(0, 49, R[0], I[45]);
| #n(0, 50, R[0], I[46]);
| #n(0, 51, R[0], I[47]);
| #n(0, 52, R[0], I[48]);
| #n(0, 53, R[0], I[49]);
| #n(0, 54, R[0], I[50]);
| #n(0, 55, R[0], I[51]);
| #n(0, 56, R[0], I[52]);
| #n(0, 57, R[0], I[53]);
| #n(0, 103, R[0], I[62]);
| #n(0, 104, R[0], I[54]);
| #n(0, 105, R[0], I[55]);
| #n(0, 106, R[0], I[56]);
| #n(0, 107, R[0], I[57]);
| #n(0, 108, R[0], I[58]);
| #n(0, 109, R[0], I[59]);
| #n(0, 110, R[0], I[60]);
| #n(0, 112, R[0], I[79]);
| #n(0, 113, R[0], I[80]);
| #n(0, 114, R[0], I[63]);
| #n(0, 115, R[0], I[64]);
| #n(0, 116, R[0], I[65]);
| #n(0, 117, R[0], I[66]);
| #n(0, 118, R[0], I[67]);
| #n(0, 119, R[0], I[68]);
| #n(0, 120, R[0], I[69]);
| #n(0, 121, R[0], I[70]);
| #n(0, 122, R[0], I[71]);
| #n(0, 123, R[0], I[72]);
| #n(0, 124, R[0], I[73]);
| #n(0, 125, R[0], I[74]);
| #n(0, 126, R[0], I[75]);
| #n(0, 127, R[0], I[76]);
| #n(0, 129, R[0], I[77]);
| #n(0, 148, R[0], I[79]);
| #n(0, 149, R[0], I[80]);
| #n(0, 202, R[0], I[88]);
| #n(0, 207, R[0], I[82]);
| #n(0, 208, R[0], I[83]);
| #n(0, 209, R[0], I[84]);
| #n(0, 210, R[0], I[85]);
| #n(0, 236, R[0], I[86]);
| #n(0, 305, R[0], I[88]);
| #n(0, 10, R[0], I[100]);
| #n(0, 16, R[0], I[101]);
| #n(0, 17, R[0], I[102]);
| #n(0, 19, R[0], I[104]);
| #n(0, 21, R[0], I[106]);
| #n(0, 22, R[0], I[107]);
| #n(0, 23, R[0], I[108]);
| #n(0, 24, R[0], I[109]);
| #n(0, 25, R[0], I[110]);
| #n(0, 26, R[0], I[111]);
| #n(0, 27, R[0], I[112]);
| #n(0, 28, R[0], I[113]);
| #n(0, 29, R[0], I[114]);
| #n(0, 30, R[0], I[115]);
| #n(0, 31, R[0], I[116]);
| #n(0, 32, R[0], I[117]);
| #n(0, 33, R[0], I[118]);
| #n(0, 34, R[0], I[119]);
| #n(0, 35, R[0], I[120]);
| #n(0, 36, R[0], I[121]);
| #n(0, 37, R[0], I[122]);
| #n(0, 38, R[0], I[123]);
| #n(0, 39, R[0], I[124]);
| #n(0, 40, R[0], I[125]);
| #n(0, 41, R[0], I[126]);
| #n(0, 43, R[0], I[127]);
| #n(0, 45, R[0], I[129]);
| #n(0, 47, R[0], I[131]);
| #n(0, 48, R[0], I[132]);
| #n(0, 49, R[0], I[133]);
| #n(0, 50, R[0], I[134]);
| #n(0, 51, R[0], I[135]);
| #n(0, 52, R[0], I[136]);
| #n(0, 53, R[0], I[137]);
| #n(0, 54, R[0], I[138]);
| #n(0, 55, R[0], I[139]);
| #n(0, 56, R[0], I[140]);
| #n(0, 57, R[0], I[141]);
| #n(0, 58, R[0], I[142]);
| #n(0, 59, R[0], I[143]);
| #n(0, 60, R[0], I[144]);
| #n(0, 63, R[0], I[147]);
| #n(0, 64, R[0], I[148]);
| #n(0, 67, R[0], I[150]);
I¬‰ëgx“Jà;\
@å;w¡@Yá
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„E˙
xì;ö©\?Nñ∫/hÑ
'Ä¬”Á;ÍCÇï3Qæ
|À¿§5¶ÛJ£b÷;‚∆¬
”ÿswKª;
 N´}`„à/;ê˙
6ZN∞&;˛Œ
ôMG∞Îçnó;…ı˙
 óé4;g˛Añ
t;–Lô˛g…
ı≥Ûü¸;%Eº<=]˜›≤˙
ƒ—;√ˇ˙
¡É*ûóˆ•Ä.;ƒ—


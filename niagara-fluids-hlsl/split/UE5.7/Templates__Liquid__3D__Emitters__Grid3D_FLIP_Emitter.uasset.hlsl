*GÄhÕ;-
’+8≤÷B≥7;Ω´
p;!2*N´Hó7
Cw÷Kõ¨œ3oïd÷;
¶Ö#‡N»NäZó]Ù¥ÈΩ;
ìb%çıCúÈ(Ã_!Jà;
A°S«$woíÃ;
£es;¢+¸D≥üw:Uâ¶oZ
£es;¢+¸D≥üw:Uâ¶oY
8ö«Õ>;p
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
™JCÄ(;=…
¡∂Ká;¸p
ò&;Xq"£¸
O;ijaxKj¶ Í
»}Oc P;Lãt?-ì◊BÍp
‰‹C¥Á¯∏;p
∂©;èÖ∞¶JãseÜ?è"çZ
∂©;èÖ∞¶JãseÜ?è"çY
;®Âl‰˚D¨è\•—Yß€/a<eE¸
òëâˆc√Ì@á(D‡Øy;
ú?;R9p
‹;ÇøÅZTEÆóÙi∏r‡
 ‚ÖL£;âŸ*f@
/9$¸;Ü‰AÑ¢Ñ©6
 a´õRÍ
Ìú[x{;9ô@¸
π?Åv⁄-;á~°J
;Ø§€>y
∞J‰0µjXZnµ;0¸
ˇú;oF%1Cûl
;äCæF™y€
Ãl;3Ê∏¸
€v·;˝ÏÔæV ⁄-ªﬁj90dê
o¿†∫øÓAΩç;
Ãjg\–0%DãÕÕ¸˝;
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊[
·Ä;2Kx+J≤Bè§]â‹#.
s;Mi”DÅéÄµó«RË.
öc,„( ÒCí;˙™gÊN1.
¶Kôv›9;Ûÿ‡˘
6/Øém;<Jå
cMäI#í;…Ï£
ùΩ;Bêa¢óoÆóˆ
—Xd°JeG∏;(
Â;NiÈaûMâ¿
ﬁJΩu&ÑkU„;D
ﬁJΩu&ÑkU„;T
—Ì7;GΩ
ﬁJΩu&ÑkU„;
ﬁJΩu&ÑkU„;ú
‡gYßÖ¯Hê");rÆ◊\-
‡gYßÖ¯Hê");rÆ◊\T
‡gYßÖ¯Hê");rÆ◊\
‡gYßÖ¯Hê");rÆ◊\C
ﬁJΩu&ÑkU„;!
‡gYßÖ¯Hê");rÆ◊\"
ﬁJΩu&ÑkU„;'
‡gYßÖ¯Hê");rÆ◊\(
ﬁJΩu&ÑkU„;-
‡gYßÖ¯Hê");rÆ◊\.
ﬁJΩu&ÑkU„;3
‡gYßÖ¯Hê");rÆ◊\4
ﬁJΩu&ÑkU„;9
‡gYßÖ¯Hê");rÆ◊\:
(Û=sG≠D∑ vıB—;
zÜ∏Ûë;
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
£;n4‰EfC∞Ì
S~Îe≤Ï∫Aó;>h≠
±qú©#N7O™ª;eﬂ
W`Äd˘å°B≥t¥÷;ƒk|˘
nÂ¢q“qMâ;}tk
;W/Ë¿]m
!˝@âj‰;
¸ò∫q;
Â√˙»S;ÅD†ò
ièÇ\Ë;
¨òΩ∞ÅJ∏ÙÄfrc7r;
GÑcõÉm¬^‡;
;W/Ë¿]ì
;W/Ë¿]π
;W/Ë¿]‡
;W/Ë¿],
Gßøç@∆U„B;
;W/Ë¿]R
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3î
ãsL≥L©j;Ö®¨¶º5
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿5
>Â;N™Õ)vãh.Z5
b\^ÇPÛEü;±
”5oU;Já±±@†®%9ë
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™U
K˜ZC ö;Mòïs
;Iò£+1
¢Bçªòù‹E;∑ƒ
¢Bçªòù‹E;∑∆
¢Bçªòù‹E;∑‚
òpØOπõl&ë›;@
∞C¥5;ÅKßQã˙Cæº
3 yZ;Í]N∂m
87ô5¶3Në;
¢Bçªòù‹E;∑»
Ñq;dœDÿJë`†à]ÀÁÆy
ÚJÜÊ;§Ô
ãß;ÂR@ø©àm¯êúJK
÷ÎÜ˚õAé;¿Ùc.ó∑Ç
Ò≈;ªO≠lÜ••˙C≥5
Æ;IN:ˆ
˝í;ÎÈÇ
;≠ã£πÏ™G•'∆5
*J;œ’$ÓI¥ÒƒƒÚo‘~c
Oö;P2π¸Æ*J
!;ÌBÔΩ«@†À<Ç*
†6i ;c
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^b
mk†;$û•O´ÜáVóIø¥K
OÆÎi;^¡òŸ¸
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;K
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.È≠
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í
†HæÂ˛†’H-;\
;Ô“].ºa
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Û\
Y{3;FçûRô®<NCJ
 DÄ÷bûYPc7a
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Ó
xH;A˘qJ
˜cKª‰´˛;‡ÚˇA
 iÈJÜ-g$ûZH⁄\
7uù¬‘RçKô'î£lÅ;kJ
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿Ç
:Ã;3ËBqM£<Y)ôfH$A
AÉ%F;XOÖ6x‡jæÊ\¸
xùù⁄€HH≠cç;[*Y>q
xùù⁄€HH≠cç;[*Y>E
Ñq;dœDÿJë`†à]ÀÁÆ}
æπ~f;b
;|ã´Îø
wr»;z,mEãfˆ
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>m5
Dó0¿¯;ÑOæ5
 l;æNÉÒÌ‡~ 4=ë
ÑÒ`@ºèS;<»Zöë
%wäJÄ‚+“;Eh–˘
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
âH;ñS„ 
\∏Aä;!ô-¬€¡¸
TA±;ãÒ¢!Áyã
TA±;ãÒ¢!ÁyE
ó∆t‚"î±@Ö;i∞∑û6Ï˘
ˇÚEì;Ú"∑
@ãeT;Æúç
xùù⁄€HH≠cç;[*Y>ö
ÒÔºNÇú&;
;†Dò¬◊˚f™+û∞
;†Dò¬◊˚f™+ûE
π◊;u NI¶e∏…
xùù⁄€HH≠cç;[*Y>∫
¯;º!1Í’@Ø
TA±;ãÒ¢!Áy÷
¸ëØNµ‹P%Náw;`
EÉ©N}í.;œu
xùù⁄€HH≠cç;[*Y>‰
W;†HÆ(*Ó£
I ;qÚKí
;+¯OOûû7>
TA±;ãÒ¢!Áy
xùù⁄€HH≠cç;[*Y>
πsÏ^;˘
TA±;ãÒ¢!Áy.
2g·Ö—;
xùù⁄€HH≠cç;[*Y><
TA±;ãÒ¢!ÁyZ
xùù⁄€HH≠cç;[*Y>h
∂ÙµO≥;3Yx‘(Ç˘
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†œ
;aJΩzO ?∆+†B
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;F¯
Ä~E;ﬁÂ
B≥%Îë;
;?%¶f\
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
Ü;‚{v¡!JéDY†a
¨•;ª´Ê“Kß√t
;aJΩzO ?∆+†
Ö∏:“)¢ŒOò;æíÖ√„õV
Ö∏:“)¢ŒOò;æíÖ√„õB
;ı≥Kn™I±~ö†V∂ŸQ
;aJΩzO ?∆+†_
;aJΩzO ?∆+†ù
∆M±\Oå;µxK
Ö∏:“)¢ŒOò;æíÖ√„õ„
;aJΩzO ?∆+†
Ö∏:“)¢ŒOò;æíÖ√„õ5
;aJΩzO ?∆+†C
Ö∏:“)¢ŒOò;æíÖ√
;aJΩzO ?∆+†ñ
Ö∏:“)¢ŒOò;æíÖ√„õ‹
z;O∫kÉ^˝öËT˘
≤´;à‘ÿ
J†)E—;
#;Mà;Ä4
XûEøEø;bÒ1°h
XûEøEø;bÒ1°0
Âù˚z˙ÎÉOπ`)LA»;”¯
XûEøEø;bÒ1°ã
XûEøEø;bÒ1°´
XûEøEø;bÒ1°–
XûEøEø;bÒ1°˙
XûEøEø;bÒ1°$
¢∑W.5ÍÈD©Ê…”*!ÖZ;
XûEøEø;bÒ1°N
É;LßA^%Ÿ¸ª
q‘ı;EûuCdﬁ&5›h
q‘ı;EûuCdﬁ&5›¸
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
ÍzëﬂDñsØu„Lû;˘
q‘ı;EûuCdﬁ&5›s
q‘ı;EûuCdﬁ&5›~
q‘ı;EûuCdﬁ&5
£í;Cä˘G¥
@™ÛlØ,;
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]∑
Aì;˝ˇ\∑Ç]ä
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_æ
É∆:JóÑƒ—;Tá_(
9á‚ s‘]MäSr;˚±µ`¯
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ
9;˛π$J»Añ{C8·åNı«
9;˛π$J»Añ{C8·åNı¸
Ò¢;•BˆCî
U;7@ÆM¢2ÑC°˛k
U;7@ÆM¢2ÑC°˛
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€ƒk
Ω.BπYÎ;k7Î˜◊
Ω.BπYÎ;k7Î˜(
µ¶8ÀÀ|&@ô//„Jπ€ƒ
zÍHõ˘ÛﬁFÉæî;LÔ~ÏQr{ÏÛ/DE±
zÍHõ˘ÛﬁFÉæî;LÔ~Ï
Gò;ä∆…±
‹˙ÍäÓÑHæ;˚˛°0»—È
‹˙ÍäÓÑHæ;˚˛°0»—
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“AÏ
 ZSiBº´AéÓ—lÜ∆“A¸
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
/Ø£q;çØ
;#ˇMò’
Dzp;"!˜
Dzp;"!¸
jz+‚ R¥GÅ;/≤Güß¶¯
jz+‚ R¥GÅ;/≤Güß¶
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
;ªÑê*%¸
;ªÑê*%
N´†;zXã
&≠,ÿ;´§Oª‚œ
;—JˇèCà
H;Îw‹_MKØ˚µ2Z‘Á‰
H;Îw‹_MKØ˚µ2Z‘Á‰ò
8—d≤G©G¡`Q;◊H˘
Íi+;<’Nö±w
Û]¯;¨òïBá
0∂Kπ;ö
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
{;ÂîJçÂ-'3‘
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9%
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
“˜*A;÷Lòo„ì
B™Ö¯0b.\;k
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
É<^âFΩ9‹'Œe;`˘
6l;#˜µ¥O™
ü?°‰;
e{K®Zˆ-˝M;¿k
e{K®Zˆ-˝M;¿
DH;Eêé$,*H‹–C
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡E
GåÁÂé-;Ë‡â
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;k
;YÂLË¸
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQb¸
Aì;˝ˇ\∑Ç]b
É∆:JóÑƒ—;Tá_i
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNır
ùY˝;BEî¢
(MÜ;∏Ç
4Øˇ;oö˚Gú°ò
áŸJ∫î;
Ω.BπYÎ;k7Î˜Ç
;ı≥Kn™I±~ö†V∂ŸQÖ
;ı≥Kn™I±~ö†V∂ŸQ(
 ZSiBº´AéÓ—lÜ∆“Aï
;ªÑê*%™
H;Îw‹_MKØ˚µ2Z‘Á‰≤
oi∑;_Aå¢õÜ‘ÃÈ9”
ı‰®I¶;
¨3êC?D´Ü∂v;“%1Ê
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆÈ
ùΩ;Bêa¢óoÆóˆ(
 A´KUTFöR!Î
 A´KUTFöR!¸
DH;Eêé$,*H‹–Ô
GåÁÂé-;Ë‡Ò
Aì;˝ˇ\∑Ç]
9;˛π$J»Añ{C8·åNı
Ω.BπYÎ;k7Î˜%
 ZSiBº´AéÓ—lÜ∆“A7
;ªÑê*%C
H;Îw‹_MKØ˚µ2Z‘Á‰L
¸jÜò∑#;JÉ9_ßÁ°qb˘
oi∑;_Aå¢õÜ‘ÃÈ9m
DH;Eêé$,*H‹
GåÁÂé-;Ë‡ã
Aì;˝ˇ\∑Ç]•
É∆:JóÑƒ—;Tá_¨
9;˛π$J»Añ{C8·åNıµ
Ω.BπYÎ;k7Î˜À
 ZSiBº´AéÓ—lÜ∆“A·
 C®ØHŸ˜ÎRﬁ¸
––˙»H™;[á}zŒB˘
;ªÑê*%ı
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
∆M±\Oå;µxK(
oi∑;_Aå¢õÜ‘ÃÈ9'
”Âwˆ—;
¨3êC?D´Ü∂v;“%1;
ùΩ;Bêa¢óoÆóˆ>
 A´KUTFöR!@
DH;Eêé$,*H‹–E
GåÁÂé-;Ë‡G
©ÁI°Q-¸;_◊
Ω.BπYÎ;k7Î˜à
 ZSiBº´AéÓ—lÜ∆“Aú
;ªÑê*%≤
@&UIïóÿ;Â
H;Îw‹_MKØ˚µ2Z‘Á‰≈
oi∑;_Aå¢õÜ‘ÃÈ9„
¨3êC?D´Ü∂v;“%1˜
ùΩ;Bêa¢óoÆóˆ˙
GåÁÂé-;Ë‡
É∆:JóÑƒ—;Tá_&
9;˛π$J»Añ{C8·åNı/
@ûf∂ík&1;
Ω.BπYÎ;k7Î˜E
 ZSiBº´AéÓ—lÜ∆“A[
;ªÑê*%o
H;Îw‹_MKØ˚µ2Z‘Á‰Ä
∆M±\Oå;µxKÅ
oi∑;_Aå¢õÜ‘ÃÈ9°
¨3êC?D´Ü∂v;“%1µ
ùΩ;Bêa¢óoÆóˆ∏
 A´KUTFöR!∫
GåÁÂé-;Ë‡¡
Aì;˝ˇ\∑Ç]‹
É∆:JóÑƒ—;Tá_„
9;˛π$J»Añ{C8·åNıÏ
 ZSiBº´AéÓ—lÜ∆“A
;ªÑê*%,
£πç'ˇåEHÑ.f∆{Å5//
≈¿ësZ“¬O§û˘´9ˆo¿;
cı37=¿;
H;Îw‹_MKØ˚µ2Z‘Á‰=
∆M±\Oå;µxK>
oi∑;_Aå¢õÜ‘ÃÈ9^
¨3êC?D´Ü∂v;“%1r
ùΩ;Bêa¢óoÆóˆu
 A´KUTFöR!w
DH;Eêé$,*H‹–|
GåÁÂé-;Ë‡~
;©†˚(ÊÂFêç
 —<;?h™Môç•ØZüòU∂
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•¸
x´;Bé§í‡Òä`Êπ
x´;Bé§í‡Òä`Ê}
‰g;•†0MÜQ:âıπº^ª
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
;_Çóù3†Câ#
˜¸n⁄ P5Cî∑r;Ÿ‡7
XûEøEø;bÒ1°
K;Óñ‰ﬁ…
K;Óñ‰ﬁ
&HÚ´;R
DÅ)¯P√}i;œ
DÅ)¯P√}i;k
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
qi;;¥E∂o>2e
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯Xÿ
;˙/¯Xx
ıR9ÿ"D¨Úq;Ã
g‹I∏xü;Ü
%îh;˘Ä_G∑
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
;M¸è¿sK£ﬁ»u8q„e¸
˛´T“@õÜ;˘TÑq™
\Ày`AçÇZ≥Ñ˙;±Ò
\Ày`AçÇZ≥Ñ˙;±C
kgÉÄ§DÅPŒrq1;Ô
 Cã˛¡î
å·;ˆ÷hÆNóıÓŸƒq±∞¸
å·;ˆ÷hÆNóıÓŸƒq±∞
 —<;?h™Môç•ØZüòU˛
;‡ÑØj.8JôÄ
)%;¸<≥◊L™
Ö∏:“)¢ŒOò;æíÖ√„õ
Úh;|}}
;˙/¯X 
ìáï∆)K;Mà±≠/˜˜ùö˘
˛´T“@õÜ;˘TÑq™7
\Ày`AçÇZ≥Ñ˙;±8
Ç:Ôu˘E«G•π.ëID(c;
ö’iÑ\∫GJöT∏=/#ø,;
Ó3•1Tm;
;\AŒ#Ú≤JêO<ê†Kue
&—√n‡]⁄KØ;û
‡;ruôeÙH§•
å·;ˆ÷hÆNóıÓŸƒq±∞F
 —<;?h™Môç•ØZüòUH
x´;Bé§í‡Òä`ÊK
‰g;•†0MÜQ:âıπº^L
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒN
K;Óñ‰ﬁW
;†Dò¬◊˚f™+û
DÅ)¯P√}i;]
;˙/¯Xe
˛´T“@õÜ;˘TÑq™x
\Ày`AçÇZ≥Ñ˙;±y
å·;ˆ÷hÆNóıÓŸƒq±∞Ü
 —<;?h™Môç•ØZüòUà
x´;Bé§í‡Òä`Êã
‰g;•†0MÜQ:âıπº^ç
DÅ)¯P√}i;§
;˙/¯X≠
˛´T“@õÜ;˘TÑq™√
\Ày`AçÇZ≥Ñ˙;±ƒ
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
˘aûª;D°Oá
å·;ˆ÷hÆNóıÓŸƒq±∞€
 —<;?h™Môç•ØZüòU›
x´;Bé§í‡Òä`Ê‡
‰g;•†0MÜQ:âıπº^‚
K;Óñ‰ﬁÛ
DÅ)¯P√}i;˘
å·;ˆ÷hÆNóıÓŸƒq±∞0
 —<;?h™Môç•ØZüòU2
x´;Bé§í‡Òä`Ê5
‰g;•†0MÜQ:âıπº^7
K;Óñ‰ﬁH
DÅ)¯P√}i;N
;˙/¯XW
˛´T“@õÜ;˘TÑq™m
\Ày`AçÇZ≥Ñ˙;±n
å·;ˆ÷hÆNóıÓŸƒq±∞Ö
 —<;?h™Môç•ØZüòUá
x´;Bé§í‡Òä`Êä
‰g;•†0MÜQ:âıπº^å
DÅ)¯P√}i;£
;˙/¯X¨
˛´T“@õÜ;˘TÑq™¬
\Ày`AçÇZ≥Ñ˙;±√
å·;ˆ÷hÆNóıÓŸƒq±∞⁄
ºf√qÎrJ]Ç…4Ê¯o;5˘öÈ¸
æ;¡l,{3K¸V]ù˚
HdÓï;ÑÏÅz™z±«¸
‰;óHæeﬁ¸
Ôõ>÷;±¸
DµÓDs≈/«-;
ê·⁄}H∂cœ*◊Ú“X;
ˇ†LœZ;Ár
ÉçªÆLZ;
%∞2Çø;
—ÒΩK≤¬@≤öÑHÜ∑0{;
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(¸
_\õ=õ):;l˙<
˜âÄ]E»‰Bä˘{˛,RÖ™;
∆=”ÚLç"JeüQºd;
wK≠arM;
N˛èûæ;
ñ6sôRsHüeß;ÄÃSáâ
ñ6sôRsHüeß;ÄÃSá;
pó^d“;
%|=:ˇÖ"IàrÑÄ$ /Æ;
T5`;BºÎ8
‰S∫Ì=M9O†<ù.Ü;mî
Ô¨Fh<«◊E¥uJÑº>WÍ;
1wê—/;
&6Öÿ_;
Eõ2Sy‚ãM%;
:‹a:U9CKâHróVƒu≥;
ád˘Ôn;…G¶ﬁ=m˙ÄD(¸
ád˘Ôn;…G¶ﬁ=m˙ÄD(
†ÓKŸ»Œm/Åw6;ª
// Shader generated by Niagara HLSL Translator
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
int Emitter_Grid3D_InitializeConvolutionKernel_Radius;
float3 Position;
float2 SpriteSize;
int UniqueID;
float3 Velocity;
int Radius;
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
FParamMap0_Emitter_Grid3D_InitializeConvolutionKernel Grid3D_InitializeConvolutionKernel;
int Position;
int SpriteSize;
int Velocity;
FParamMap0_Array Array;
FParamMap0_Emitter Emitter;
FParamMap0_Engine Engine;
FParamMap0_Grid3D_CreateConvolutionKernel Grid3D_CreateConvolutionKernel;
FParamMap0_Particles Particles;
FParamMap0 Map;
static float HackSpawnInterp = 1.0;
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void CustomHlsl46CA6B944E6888E4A29E228B646854E8Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
void Grid3D_CreateConvolutionKernel_Emitter_Func_(inout FSimulationContext Context);
float GetSpawnInterpolation();
   SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0, 0,0,1);
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
        SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0, i, 0, Val/Total);
//SetConstantByStaticVariable "/Grid 3D Create Convolution Kernel/Map Get/Map Get->Module.Smoothing Kernel"
int Constant = 0;
CustomHlsl46CA6B944E6888E4A29E228B646854E8Emitter_KernelGrid_Func_(Context.Map.Grid3D_CreateConvolutionKernel.Radius, Context);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
EnterStatScope(0 /**SimulationStage_2_1*/);
//Begin Initialize Parameter Map Defaults
//End Initialize Parameter Map Defaults
Context.Map.Grid3D_CreateConvolutionKernel.Radius = Context.Map.Emitter.Grid3D_InitializeConvolutionKernel.Radius;
EnterStatScope(1 /**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
Grid3D_CreateConvolutionKernel_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
ExitStatScope(/**SimulationStage_2_1*/);
EnterStatScope(2 /**SimulationStage_2_1_Main*/);
FSimulationContext Context = (FSimulationContext)0;
Context.Map.Emitter.Grid3D_InitializeConvolutionKernel.Radius = Emitter_Grid3D_InitializeConvolutionKernel_Radius;
Context.Map.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.Map.Emitter.RandomSeed = Emitter_RandomSeed;
Context.Map.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.Map.Engine.System.RandomSeed = Engine_System_RandomSeed;
ReadDataSets(Context);
Context.Map.Engine.ExecIndex = ExecIndex();
Context.Map.Engine.Emitter.ID.ID = 0;
EnterStatScope(3 /**SimulationStage_2_1_MapMain*/);
Simulate(Context);
ExitStatScope(/**SimulationStage_2_1_MapMain*/);
WriteDataSets(Context);
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
ExitStatScope(/**SimulationStage_2_1_Main*/);
float Constants_Emitter_SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_TemporaryGrid_SimFloat;
float SimFloat;
FParamMap0_Emitter_TemporaryGrid TemporaryGrid;
void SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(inout FSimulationContext Context);
Context.Map.Emitter.TemporaryGrid.SimFloat = Constants_Emitter_SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_TemporaryGrid_SimFloat;
EnterStatScope(1 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
float3 Constants_Emitter_SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_StartVelocityGrid_StartVelocity;
float3 StartVelocity;
FParamMap0_Emitter_StartVelocityGrid StartVelocityGrid;
void SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(inout FSimulationContext Context);
Context.Map.Emitter.StartVelocityGrid.StartVelocity = Constants_Emitter_SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_StartVelocityGrid_StartVelocity;
EnterStatScope(1 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
int Emitter_SimGrid_VelocityIndex;
float4x4 Emitter_WorldToUnit;
float4x4 Emitter_WorldToLocal;
int Emitter_SimGrid_SimFloatIndex;
int BoundaryIndex;
int VelocityIndex;
float4x4 WorldToLocal;
float4x4 WorldToUnit;
int SimGrid_SimFloatIndex;
int SimGrid_VelocityIndex;
FParamMap0_Grid3D_FLIP_RasterizeParticles Grid3D_FLIP_RasterizeParticles;
void NiagaraScript_2091_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TemporaryGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SetGridValue_Emitter_TemporaryGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl99C6E6BE410CC3B50B1D7B9BBF67794AEmitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func_(inout FSimulationContext Context);
int Constant6 = 0;
bool Result = NiagaraAll(In_SourceSpace == Constant6);
int Constant7 = 0;
bool Result1 = NiagaraAll(In_DestinationSpace == Constant7);
bool Result2 = Result && Result1;
int Constant8 = 1;
bool Result3 = NiagaraAll(In_SourceSpace == Constant8);
int Constant9 = 1;
bool Result4 = NiagaraAll(In_DestinationSpace == Constant9);
bool Result5 = Result3 && Result4;
bool Result6 = Result2 || Result5;
int Constant10 = 2;
bool Result7 = NiagaraAll(In_SourceSpace == Constant10);
int Constant11 = 2;
bool Result8 = NiagaraAll(In_DestinationSpace == Constant11);
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
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result21;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result26;
bool Constant5 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_2091_Func_Output_bUseOriginal;
float4x4 NiagaraScript_2091_Func_Output_OutTransform;
bool NiagaraScript_2091_Func_Output_LocalToWorld;
NiagaraScript_2091_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant5, NiagaraScript_2091_Func_Output_bUseOriginal, NiagaraScript_2091_Func_Output_OutTransform, NiagaraScript_2091_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_2091_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InPosition;
Vector_IfResult = Result27;
Out_OutPosition = Vector_IfResult;
bool Constant15 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_2091_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_2091_Func_Output_OutTransform1;
bool NiagaraScript_2091_Func_Output_LocalToWorld1;
NiagaraScript_2091_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant15, NiagaraScript_2091_Func_Output_bUseOriginal1, NiagaraScript_2091_Func_Output_OutTransform1, NiagaraScript_2091_Func_Output_LocalToWorld1, Context);
float3 Result29 = mul(float4(In_InVector,0.0),NiagaraScript_2091_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result29;
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
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 0, GridWeightXYZ*In_Velocity.x, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 1, GridWeightXYZ*In_Velocity.y, IGNORE);
                InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 2, GridWeightXYZ*In_Velocity.z, IGNORE);
                InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(1, XIndexInt+x, YIndexInt+y, ZIndexInt+z, 3, GridWeightXYZ, IGNORE);
                SetGridValue_Emitter_TemporaryGrid(2, XIndexInt+x, YIndexInt+y, ZIndexInt+z, In_BoundaryIndex, 3, IGNORE);
//SetConstantByStaticVariable "/Grid 3D FLIP Rasterize Particles/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant1 = 1;
int Constant2 = 0;
int Constant3 = 1;
bool Constant4 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.Map.Particles.Position, Constant2, Constant3, Constant4, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result28 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(2, Result28, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant12 = 0;
int Constant13 = 1;
bool Constant14 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.Map.Particles.Velocity, Constant12, Constant13, Constant14, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result30 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlsl99C6E6BE410CC3B50B1D7B9BBF67794AEmitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result30, Context.Map.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
Context.Map.Grid3D_FLIP_RasterizeParticles.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.Map.Emitter.WorldToLocal;
Context.Map.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.Map.Emitter.SimGrid_SimFloatIndex;
bool Constant = false;
EnterStatScope(1 /**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Grid3D_FLIP_RasterizeParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Context.Map.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.Map.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.Map.Emitter.WorldToLocal = Emitter_WorldToLocal;
Context.Map.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.Map.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.Map.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.Map.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.Map.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
float4x4 Emitter_UnitToWorld;
float Emitter_DeltaTime;
float3 Constants_Emitter_Grid3D_ComputeBoundary_OffsetSamplePosition;
float Boundary;
float BoundarySignedDistance;
float3 SolidVelocity;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704_Transient Transient;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute Grid3D_GetFluidAttribute;
bool Resample;
float3 Unit;
float3 UnitPosition;
float3 WorldPos;
FParamMap0_Local_Grid3D_ComputeBoundary Grid3D_ComputeBoundary;
FParamMap0_Local_Grid3D_GetFluidAttribute Grid3D_GetFluidAttribute;
float dt;
bool OpenBoundaryASC43X;
bool OpenBoundaryASC43Y;
bool OpenBoundaryASC43Z;
bool OpenBoundaryASC45X;
bool OpenBoundaryASC45Y;
bool OpenBoundaryASC45Z;
float4x4 UnitToWorld;
FParamMap0_Grid3D_ComputeBoundary Grid3D_ComputeBoundary;
FParamMap0_Grid3D_SetFluidAttribute004 Grid3D_SetFluidAttribute004;
FParamMap0_Local Local;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704 SetVariables_A6C8B03743BE41C39A693F9918B79704;
FParamMap0_Transient Transient;
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void IndexToUnit_Emitter_SimGrid(int In_InstanceData, float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void GetNumCells_Emitter_SimGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void CustomHlslBA4D470F474D109F8F7947A803AC230B_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Enable"
int Constant = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
int Constant1 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
int Constant3 = 0;
Context.Map.Local.Grid3D_GetFluidAttribute.Resample = Constant3;
int Constant4 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Local.Module.Resample"
int Constant5 = 0;
float3 Constant6 = float3(0,0,0);
Context.Map.Local.Grid3D_GetFluidAttribute.Unit = Constant6;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant8 = 3;
int Constant9 = 0;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Write To Transient"
int Constant10 = 1;
Context.Map.Transient.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.Map.Transient.Boundary = Context.Map.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
Out_Boundary = 0;
  Out_Boundary = In_OpenBoundaryRight ? 2 : 1;
  Out_Boundary = In_OpenBoundaryLeft ? 2 : 1;
  Out_Boundary = In_OpenBoundaryDown ? 2 : 1;
  Out_Boundary = In_OpenBoundaryUp ? 2 : 1;
  Out_Boundary = In_OpenBoundaryBack ? 2 : 1;
  Out_Boundary = In_OpenBoundaryFront ? 2 : 1;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
const  int RASTERIZED_FLUID_CELL = 3;
Out_RetBoundary = EMPTY_CELL;
  Out_RetBoundary = FLUID_CELL;
  Out_RetBoundary = In_SolidValue;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Landscape Collisions"
int Constant17 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Particle Collisions"
int Constant18 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Geometry Collection Collisions"
int Constant19 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Collisions"
int Constant20 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Depth Map Collisions"
int Constant21 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Global Distance Field Collisions"
int Constant22 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float3 Output1;
Output1.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output1.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output1.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result = Output1 + Constants_Emitter_Grid3D_ComputeBoundary_OffsetSamplePosition;
float X;
float Y;
float Z;
X = Result.x;
Y = Result.y;
Z = Result.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(1, X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Constant23 = float3(0,0,0);
float3 Output11;
Output11.x = IndexToUnit_Emitter_SimGridOutput_Unit.x;
Output11.y = IndexToUnit_Emitter_SimGridOutput_Unit.y;
Output11.z = IndexToUnit_Emitter_SimGridOutput_Unit.z;
float3 Result1 = mul(float4(Output11,1.0),Context.Map.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.Map.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit;
Context.Map.Transient.SolidVelocity = Constant23;
Context.Map.Local.Grid3D_ComputeBoundary.WorldPos = Result1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
int Constant24 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ;
GetNumCells_Emitter_SimGrid(1, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
float CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary;
CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant24, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary);
float Constant25 = 1e+17;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Free Surface"
int Constant26 = 1;
float CustomHlslBA4D470F474D109F8F7947A803AC230B_Func_Output_RetBoundary;
CustomHlslBA4D470F474D109F8F7947A803AC230B_Func_(CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary, Context.Map.Transient.Boundary, CustomHlslBA4D470F474D109F8F7947A803AC230B_Func_Output_RetBoundary);
Context.Map.Transient.Boundary = CustomHlslBA4D470F474D109F8F7947A803AC230B_Func_Output_RetBoundary;
Context.Map.Transient.BoundarySignedDistance = Constant25;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Enable"
int Constant27 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Attribute"
int Constant28 = 7;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TransientGrid(2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float X1;
float Y1;
float Z1;
X1 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.x;
Y1 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.y;
Z1 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.z;
float4 Output12;
Output12.x = X1;
Output12.y = Y1;
Output12.z = Z1;
Output12.w = Context.Map.Grid3D_SetFluidAttribute004.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output12);
EnterStatScope(1 /**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Grid3D_GetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Context.Map.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary = Context.Map.Transient.SimFloat;
EnterStatScope(2 /**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
Context.Map.Grid3D_ComputeBoundary.UnitToWorld = Context.Map.Emitter.UnitToWorld;
Context.Map.Grid3D_ComputeBoundary.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Grid3D_ComputeBoundary.WorldToLocal = Context.Map.Emitter.WorldToLocal;
bool Constant11 = false;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45X = Constant11;
bool Constant12 = false;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43X = Constant12;
bool Constant13 = false;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Z = Constant13;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Z = Constant14;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Y = Constant15;
bool Constant16 = false;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Y = Constant16;
EnterStatScope(3 /**Grid3D_ComputeBoundary_Emitter_Func_*/);
Grid3D_ComputeBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeBoundary_Emitter_Func_*/);
Context.Map.Grid3D_SetFluidAttribute004.Boundary = Context.Map.Transient.Boundary;
Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity = Context.Map.Transient.SolidVelocity;
EnterStatScope(4 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Grid3D_SetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(5 /**SimulationStage_2_1_Main*/);
Context.Map.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.Map.Emitter.DeltaTime = Emitter_DeltaTime;
EnterStatScope(6 /**SimulationStage_2_1_MapMain*/);
int Constants_Emitter_Grid3D_ExtrapolateVelocity_ExtrapolationHalfWidth;
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC_Transient Transient;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter Emitter;
float3 ExtrapolatedVelocity;
FParamMap0_OUTPUT_VAR_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute001 Grid3D_GetFluidAttribute001;
FParamMap0_Local_Grid3D_GetFluidAttribute001 Grid3D_GetFluidAttribute001;
FParamMap0_Emitter_SimGrid SimGrid;
FParamMap0_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_Grid3D_SetFluidAttribute001 Grid3D_SetFluidAttribute001;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB SetVariables_A802BB404624ACFB5C9C96987F3207AB;
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC SetVariables_C70B065E4ACA60099D622884219EB2AC;
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void Grid3D_GetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_RasterizationGrid_velocity(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetFloatGridValue_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslFAE69ED84C4EF173A520EDB24D1A82ECEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void Grid3D_SetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample From Previous Frame"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Logic OR (Static)/Logic OR (Static)->Result"
Context.Map.Local.Grid3D_GetFluidAttribute001.Resample = Constant3;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Local.Module.Resample"
Context.Map.Local.Grid3D_GetFluidAttribute001.Unit = Constant6;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Attribute"
int Constant8 = 7;
ExecutionIndexToGridIndex_Emitter_TransientGrid(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
Output1.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Output1.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Output1.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Output11;
Output11 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity = Output1;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary = Output11;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Write To Transient"
Context.Map.Transient.SolidVelocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity;
Context.Map.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
Context.Map.Transient.Boundary = Context.Map.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary;
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 0, Out_OutVelocity.x);
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 1, Out_OutVelocity.y);
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 2, Out_OutVelocity.z);
float TmpWeight;
GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX, In_IndexY, In_IndexZ, 3, TmpWeight);
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
        GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(0, TmpIndexX, TmpIndexY, TmpIndexZ, TmpV);
        int TmpCellType = round(TmpV.a);
        // only extrapolate from fluid cells
        // don't extrapolate from the boundary of the domain to allow particles to pass through as ballistic when they leave
        if (TmpCellType == FLUID_CELL)
            float Weight = 1./length2(float3(xx,yy,zz));
            float3 TmpVelocity;
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 0, TmpVelocity.x);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 1, TmpVelocity.y);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 2, TmpVelocity.z);
            GetFloatGridValue_Emitter_RasterizationGrid_velocity(2, In_IndexX+xx, In_IndexY+yy, In_IndexZ+zz, 3, TmpWeight);
            if (TmpWeight > 1e-5)
                TmpVelocity /= TmpWeight;
                Out_OutVelocity += TmpVelocity * Weight;
                TotalWeight  += Weight;
            else
                TmpVelocity = float3(0,0,0);
    if (TotalWeight > 1e-5)
        Out_OutVelocity /= TotalWeight;
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant11 = 1;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(2, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(2, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlslFAE69ED84C4EF173A520EDB24D1A82ECEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlslFAE69ED84C4EF173A520EDB24D1A82ECEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constants_Emitter_Grid3D_ExtrapolateVelocity_ExtrapolationHalfWidth, Context.Map.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlslFAE69ED84C4EF173A520EDB24D1A82ECEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlslFAE69ED84C4EF173A520EDB24D1A82ECEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Enable"
int Constant12 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Attribute"
int Constant13 = 9;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(3, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ);
SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(3, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ, Context.Map.Grid3D_SetFluidAttribute001.StartVelocity);
EnterStatScope(1 /**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Grid3D_GetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute001_Emitter_Func_*/);
Context.Map.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
EnterStatScope(2 /**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_*/);
Context.Map.Grid3D_ExtrapolateVelocity.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex = Context.Map.Emitter.SimGrid_SimFloatIndex;
EnterStatScope(3 /**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity_Emitter_Func_*/);
Context.Map.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(4 /**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func_*/);
Context.Map.Grid3D_SetFluidAttribute001.StartVelocity = Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(5 /**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
Grid3D_SetFluidAttribute001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute001_Emitter_Func_*/);
EnterStatScope(6 /**SimulationStage_2_1_Main*/);
EnterStatScope(7 /**SimulationStage_2_1_MapMain*/);
float Emitter_dx;
float Constants_Emitter_SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_PressureGrid_Pressure;
float Div;
FParamMap0_OUTPUT_VAR_Grid3D_ComputeDivergence Grid3D_ComputeDivergence;
float dx;
int VectorIndex;
float Pressure;
FParamMap0_Emitter_PressureGrid PressureGrid;
FParamMap0_Grid3D_ComputeDivergence Grid3D_ComputeDivergence;
FParamMap0_Grid3D_SetFluidAttribute Grid3D_SetFluidAttribute;
void GetGridValue_Emitter_SimGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
void Grid3D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void Grid3D_SetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
float Vx_right;
GetGridValue_Emitter_SimGrid(0, In_IndexX+1, In_IndexY, In_IndexZ, In_VectorIndex, Vx_right);
float Vx_left;
GetGridValue_Emitter_SimGrid(0, In_IndexX-1, In_IndexY, In_IndexZ, In_VectorIndex, Vx_left);
float Vy_up;
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY+1, In_IndexZ, In_VectorIndex+1, Vy_up);
float Vy_down;
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY-1, In_IndexZ, In_VectorIndex+1, Vy_down);
float Vz_front;
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY, In_IndexZ+1, In_VectorIndex+2, Vz_front);
float Vz_back;
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY, In_IndexZ-1, In_VectorIndex+2, Vz_back);
Out_Div = (Vx_right - Vx_left + Vy_up - Vy_down + Vz_front - Vz_back) / (2. * In_dx);
Out_Div = 0.0;
ExecutionIndexToGridIndex_Emitter_SimGrid(0, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div;
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_(Context.Map.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, Context.Map.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div);
Context.Map.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div;
Context.Map.Emitter.PressureGrid.Pressure = Constants_Emitter_SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_PressureGrid_Pressure;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant1 = 3;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, Context.Map.Grid3D_SetFluidAttribute.SimFloat);
Context.Map.Grid3D_ComputeDivergence.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_ComputeDivergence.VectorIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
EnterStatScope(1 /**Grid3D_ComputeDivergence_Emitter_Func_*/);
Grid3D_ComputeDivergence_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeDivergence_Emitter_Func_*/);
EnterStatScope(2 /**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func_*/);
Context.Map.Grid3D_SetFluidAttribute.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_ComputeDivergence.Div;
EnterStatScope(3 /**Grid3D_SetFluidAttribute_Emitter_Func_*/);
Grid3D_SetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute_Emitter_Func_*/);
EnterStatScope(4 /**SimulationStage_2_1_Main*/);
Context.Map.Emitter.dx = Emitter_dx;
EnterStatScope(5 /**SimulationStage_2_1_MapMain*/);
float Emitter_PressureGrid_Pressure;
float Constants_Emitter_Grid3D_PressureIteration_Relaxation;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_PressureGrid PressureGrid;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter Emitter;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute004 Grid3D_GetFluidAttribute004;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute005 Grid3D_GetFluidAttribute005;
FParamMap0_OUTPUT_VAR_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_Local_Grid3D_GetFluidAttribute004 Grid3D_GetFluidAttribute004;
FParamMap0_Local_Grid3D_GetFluidAttribute005 Grid3D_GetFluidAttribute005;
float Divergence;
FParamMap0_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4 SetVariables_9DBFE6D34A13F2D4792275A8C97387E4;
void Grid3D_GetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void Grid3D_GetFluidAttribute005_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void NiagaraScript_2096_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl04C64086480DA644FCC88485B815E918_Func_(float In_InFloat, out float Out_OutFloat);
void NiagaraScript_2097_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl20011CBA4012BE1646DB41A6C44D87C8Emitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
void Grid3D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample From Previous Frame"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Logic OR (Static)/Logic OR (Static)->Result"
Context.Map.Local.Grid3D_GetFluidAttribute004.Resample = Constant3;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Local.Module.Resample"
Context.Map.Local.Grid3D_GetFluidAttribute004.Unit = Constant6;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Attribute"
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Write To Transient"
Context.Map.Transient.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant13 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Logic OR (Static)/Logic OR (Static)->Result"
int Constant14 = 0;
Context.Map.Local.Grid3D_GetFluidAttribute005.Resample = Constant14;
int Constant15 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Local.Module.Resample"
int Constant16 = 0;
float3 Constant17 = float3(0,0,0);
Context.Map.Local.Grid3D_GetFluidAttribute005.Unit = Constant17;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Attribute"
int Constant19 = 4;
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Write To Transient"
int Constant21 = 1;
Context.Map.Transient.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
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
int CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_IterationIndex;
int CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_MaxIterations;
float CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NormalizedIterationIndex;
int CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_LoopIndex;
int CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NumberOfLoops;
float CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NormalizedLoopIndex;
CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_(CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_IterationIndex, CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_MaxIterations, CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NormalizedIterationIndex, CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_LoopIndex, CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NumberOfLoops, CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NormalizedLoopIndex);
Out_IterationIndex = CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_IterationIndex;
Out_MaxIterations = CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_MaxIterations;
Out_NormalizedIterationIndex = CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NormalizedIterationIndex;
Out_LoopIndex = CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_LoopIndex;
Out_NumberOfLoops = CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_Output_NormalizedLoopIndex;
Out_OutFloat = saturate (In_InFloat);
float CustomHlsl04C64086480DA644FCC88485B815E918_Func_Output_OutFloat;
CustomHlsl04C64086480DA644FCC88485B815E918_Func_(In_Value, CustomHlsl04C64086480DA644FCC88485B815E918_Func_Output_OutFloat);
Out_ClampedValue = CustomHlsl04C64086480DA644FCC88485B815E918_Func_Output_OutFloat;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
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
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ, B_center);
int CellType = round(B_center.w);
float P_right;
float P_left;
float P_up;
float P_down;
float P_front;
float P_back;
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX+1, In_IndexY, In_IndexZ, P_right);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX-1, In_IndexY, In_IndexZ, P_left);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY+1, In_IndexZ, P_up);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY-1, In_IndexZ, P_down);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY, In_IndexZ+1, P_front);
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(3, In_IndexX, In_IndexY, In_IndexZ-1, P_back);
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
int NiagaraScript_2096_Func_Output_IterationIndex;
int NiagaraScript_2096_Func_Output_MaxIterations;
float NiagaraScript_2096_Func_Output_NormalizedIterationIndex;
int NiagaraScript_2096_Func_Output_LoopIndex;
int NiagaraScript_2096_Func_Output_NumberOfLoops;
float NiagaraScript_2096_Func_Output_NormalizedLoopIndex;
NiagaraScript_2096_Func_(NiagaraScript_2096_Func_Output_IterationIndex, NiagaraScript_2096_Func_Output_MaxIterations, NiagaraScript_2096_Func_Output_NormalizedIterationIndex, NiagaraScript_2096_Func_Output_LoopIndex, NiagaraScript_2096_Func_Output_NumberOfLoops, NiagaraScript_2096_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_2097_Particle_Func_Output_ClampedValue;
NiagaraScript_2097_Particle_Func_(Constants_Emitter_Grid3D_PressureIteration_Relaxation, NiagaraScript_2097_Particle_Func_Output_ClampedValue, Context);
float4 CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_back;
CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_right, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_left, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_up, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_down, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_front, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_back);
float CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_right;
float CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_left;
float CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_up;
float CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_down;
float CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_front;
float CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_back;
CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_(CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_right, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_left, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_up, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_down, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_front, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_back, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_right, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_left, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_up, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_down, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_front, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_back);
float CustomHlsl20011CBA4012BE1646DB41A6C44D87C8Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
CustomHlsl20011CBA4012BE1646DB41A6C44D87C8Emitter_PressureGridEmitter_TransientGrid_Func_(Context.Map.Grid3D_PressureIteration.dx, Context.Map.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Context.Map.Grid3D_PressureIteration.Divergence, NiagaraScript_2096_Func_Output_IterationIndex, NiagaraScript_2097_Particle_Func_Output_ClampedValue, Context.Map.Grid3D_PressureIteration.Velocity, Context.Map.Grid3D_PressureIteration.Pressure, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_right, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_left, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_up, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_down, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_front, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_back, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_right, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_left, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_up, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_down, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_front, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_back, CustomHlsl20011CBA4012BE1646DB41A6C44D87C8Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.Map.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlsl20011CBA4012BE1646DB41A6C44D87C8Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
Context.Map.Emitter.PressureGrid.Pressure = Context.Map.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure;
EnterStatScope(1 /**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
Grid3D_GetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(2 /**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Grid3D_GetFluidAttribute005_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute005_Emitter_Func_*/);
Context.Map.Grid3D_PressureIteration.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_PressureIteration.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Grid3D_PressureIteration.Divergence = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.Map.Grid3D_PressureIteration.Pressure = Context.Map.Emitter.PressureGrid.Pressure;
Context.Map.Grid3D_PressureIteration.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
EnterStatScope(3 /**Grid3D_PressureIteration_Emitter_Func_*/);
Grid3D_PressureIteration_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_PressureIteration_Emitter_Func_*/);
Context.Map.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure = Context.Map.OUTPUT_VAR.Grid3D_PressureIteration.Pressure;
EnterStatScope(4 /**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
Context.Map.Emitter.PressureGrid.Pressure = Emitter_PressureGrid_Pressure;
int Emitter_SimGrid_PressureIndex;
float3 Emitter_SimGrid_Velocity;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter Emitter;
float3 Grad;
FParamMap0_OUTPUT_VAR_Grid3D_ComputeGradient Grid3D_ComputeGradient;
FParamMap0_OUTPUT_VAR_Grid3D_ProjectPressure Grid3D_ProjectPressure;
float3 PressureGradient;
int ScalarIndex;
int SimGrid_PressureIndex;
FParamMap0_Grid3D_ComputeGradient Grid3D_ComputeGradient;
FParamMap0_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686 SetVariables_F07AF7D941D725DF04BE00AD577F0686;
void ExecutionIndexToGridIndex_Emitter_PressureGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetGridValue_Emitter_PressureGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_TransientGrid_Func_(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
void Grid3D_ProjectPressure_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(inout FSimulationContext Context);
GetGridValue_Emitter_PressureGrid(0, In_IndexX+1, In_IndexY, In_IndexZ, In_ScalarIndex, S_right);
GetGridValue_Emitter_PressureGrid(0, In_IndexX-1, In_IndexY, In_IndexZ, In_ScalarIndex, S_left);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY+1, In_IndexZ, In_ScalarIndex, S_up);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY-1, In_IndexZ, In_ScalarIndex, S_down);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY, In_IndexZ+1, In_ScalarIndex, S_front);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY, In_IndexZ-1, In_ScalarIndex, S_back);
Out_Grad = float3(S_right - S_left, S_up - S_down, S_front - S_back) / (2.0 * In_dx);
Out_Grad = float3(0.0, 0.0, 0.0);
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_PressureGrid(0, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ);
float3 CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad;
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_(Context.Map.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.Map.Grid3D_ComputeGradient.ScalarIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad);
Context.Map.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
Out_VelocityOut = In_Velocity;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ, B_center);
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
float3 Result = Context.Map.Grid3D_ProjectPressure.PressureGradient * Context.Map.Grid3D_ProjectPressure.dt;
float3 Result1 = Context.Map.Grid3D_ProjectPressure.Velocity - Result;
ExecutionIndexToGridIndex_Emitter_SimGrid(2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float4 CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_right;
float4 CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_left;
float4 CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_up;
float4 CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_down;
float4 CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_front;
float4 CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_back;
CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_back);
float CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_right;
float CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_left;
float CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_up;
float CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_down;
float CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_front;
float CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_back;
CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_(CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_back, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_right, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_left, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_up, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_down, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_front, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_back);
float3 CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_TransientGrid_Func_Output_VelocityOut;
CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_TransientGrid_Func_(Result1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_right, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_left, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_up, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_down, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_front, CustomHlslDEF944874A6B74B3DC1F849597CDB621_Func_Output_F_back, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl30A326914D356A6984524BAB2E3946E0Emitter_TransientGrid_Func_Output_B_back, CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_TransientGrid_Func_Output_VelocityOut);
Context.Map.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_TransientGrid_Func_Output_VelocityOut;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity;
Context.Map.Grid3D_ComputeGradient.dx = Context.Map.Emitter.dx;
Context.Map.Grid3D_ComputeGradient.ScalarIndex = Context.Map.Emitter.SimGrid_PressureIndex;
EnterStatScope(1 /**Grid3D_ComputeGradient_Emitter_Func_*/);
Grid3D_ComputeGradient_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeGradient_Emitter_Func_*/);
Context.Map.Grid3D_ProjectPressure.PressureGradient = Context.Map.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.Map.Grid3D_ProjectPressure.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Grid3D_ProjectPressure.Velocity = Context.Map.Emitter.SimGrid.Velocity;
EnterStatScope(2 /**Grid3D_ProjectPressure_Emitter_Func_*/);
Grid3D_ProjectPressure_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ProjectPressure_Emitter_Func_*/);
Context.Map.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity;
EnterStatScope(3 /**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
Context.Map.Emitter.SimGrid_PressureIndex = Emitter_SimGrid_PressureIndex;
Context.Map.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
int Emitter_SimGrid_BoundaryIndex;
int Constants_Emitter_Grid3D_ExtrapolateVelocity001_ExtrapolationHalfWidth;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48_Emitter Emitter;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B_Transient Transient;
FParamMap0_OUTPUT_VAR_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute002 Grid3D_GetFluidAttribute002;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute003 Grid3D_GetFluidAttribute003;
FParamMap0_Local_Grid3D_GetFluidAttribute002 Grid3D_GetFluidAttribute002;
FParamMap0_Local_Grid3D_GetFluidAttribute003 Grid3D_GetFluidAttribute003;
int SimGrid_BoundaryIndex;
FParamMap0_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B SetVariables_196415D64713B26D008A18AD62DEAC4B;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48 SetVariables_C7A11F704885D153E91991B58A269A48;
void Grid3D_GetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl0E4DFAEE4F92FADD7EDC6FA956035597Emitter_SimGridEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample From Previous Frame"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Logic OR (Static)/Logic OR (Static)->Result"
Context.Map.Local.Grid3D_GetFluidAttribute002.Resample = Constant3;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Local.Module.Resample"
Context.Map.Local.Grid3D_GetFluidAttribute002.Unit = Constant6;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Attribute"
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity = Output1;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary = Output11;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Write To Transient"
Context.Map.Transient.SolidVelocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.Map.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample From Previous Frame"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Logic OR (Static)/Logic OR (Static)->Result"
Context.Map.Local.Grid3D_GetFluidAttribute003.Resample = Constant14;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Local.Module.Resample"
Context.Map.Local.Grid3D_GetFluidAttribute003.Unit = Constant17;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Attribute"
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Write To Transient"
Context.Map.Transient.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
Context.Map.Transient.Boundary = Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary;
Context.Map.Transient.Velocity = Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity;
Out_OutVelocity = In_Velocity;
            GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(1, TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);
            Out_OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity 001/Map Get/Map Get->Module.Use Rasterization Grid"
float3 CustomHlsl0E4DFAEE4F92FADD7EDC6FA956035597Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl0E4DFAEE4F92FADD7EDC6FA956035597Emitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constants_Emitter_Grid3D_ExtrapolateVelocity001_ExtrapolationHalfWidth, Context.Map.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Transient.Velocity, Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlsl0E4DFAEE4F92FADD7EDC6FA956035597Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlsl0E4DFAEE4F92FADD7EDC6FA956035597Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
EnterStatScope(1 /**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
Grid3D_GetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute002_Emitter_Func_*/);
EnterStatScope(2 /**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Grid3D_GetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute003_Emitter_Func_*/);
Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
EnterStatScope(3 /**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_*/);
Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.Map.Emitter.SimGrid_BoundaryIndex;
Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
EnterStatScope(4 /**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Context.Map.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity;
EnterStatScope(5 /**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
Context.Map.Emitter.SimGrid_BoundaryIndex = Emitter_SimGrid_BoundaryIndex;
ÿˇR:˘≤zñy;Ÿ
float4x4 Emitter_LocalToWorld;
float Constants_Emitter_Grid3D_FLIP_ParticleUpdate_PicOrFlip;
bool IsInsideBoundary;
bool IsInsideDomain;
FParamMap0_OUTPUT_VAR_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
bool KillParticles;
float4x4 LocalToWorld;
bool Alive;
FParamMap0_DataInstance DataInstance;
FParamMap0_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
FParamMap0_KillParticles KillParticles;
void UnitToFloatIndex_Emitter_TransientGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void CustomHlslA08820C74C020D471B2B7C99C2C9BD74_Func_(float In_Mask, out bool Out_IsInside);
void Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void CustomHlsl944A2ACA424E53F6BAF56186F9B167CE_Func_(float3 In_UnitPos, out float Out_ret);
void CustomHlsl5E59208941B9CFEC0A24FEB82F6D82F0_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl56266D0B4E3CDB3F8D8053A291066D7B_Func_(float In_Mask, out bool Out_IsInside);
void SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(int In_InstanceData, float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_Emitter_Func_(inout FSimulationContext Context);
void KillParticles_Emitter_Func_(inout FSimulationContext Context);
Out_IsInside = round(In_Mask) ==2;
bool Result2 = NiagaraAll(In_SourceSpace == Constant5);
bool Result3 = NiagaraAll(In_DestinationSpace == Constant6);
bool Result4 = Result2 && Result3;
int Constant7 = 1;
bool Result5 = NiagaraAll(In_SourceSpace == Constant7);
bool Result6 = NiagaraAll(In_DestinationSpace == Constant8);
bool Result7 = Result5 && Result6;
bool Result8 = Result4 || Result7;
int Constant9 = 2;
bool Result9 = NiagaraAll(In_SourceSpace == Constant9);
bool Result10 = NiagaraAll(In_DestinationSpace == Constant10);
bool Result11 = Result9 && Result10;
bool Result12 = Result8 || Result11;
bool Result13 = Result2 && Result10;
bool Result14 = Result9 && Result3;
bool Result15 = Result13 || Result14;
bool Result16 = In_bLocalSpace && Result15;
bool Result17 = Result12 || Result16;
bool Result18 = !In_bLocalSpace;
bool Result19 = Result2 && Result6;
bool Result20 = Result5 && Result3;
bool Result21 = Result19 || Result20;
bool Result22 = Result18 && Result21;
bool Result23 = Result17 || Result22;
bool Result24 = In_bLocalSpace && Result19;
bool Result25 = Result9 && Result6;
bool Result27 = Result18 && Result14;
bool Result28 = Result26 || Result27;
Out_bUseOriginal = Result23;
Out_LocalToWorld = Result28;
NiagaraScript_2091_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant4, NiagaraScript_2091_Func_Output_bUseOriginal, NiagaraScript_2091_Func_Output_OutTransform, NiagaraScript_2091_Func_Output_LocalToWorld, Context);
float3 Result29 = mul(float4(In_InPosition,1.0),NiagaraScript_2091_Func_Output_OutTransform).xyz;
Vector_IfResult = Result29;
  In_UnitPos.z >= 0 && In_UnitPos.x <= 1 && 
In_UnitPos.y <= 1 && In_UnitPos.z <= 1;
Out_IsInside = In_Mask > 1e-7;
Out_IsInside = round(In_Mask) == 1;
float3 Result38 = mul(float4(In_InPosition,1.0),NiagaraScript_2091_Func_Output_OutTransform1).xyz;
Vector_IfResult1 = In_InPosition;
Vector_IfResult1 = Result38;
Out_OutPosition = Vector_IfResult1;
bool Constant19 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_2091_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_2091_Func_Output_OutTransform2;
bool NiagaraScript_2091_Func_Output_LocalToWorld2;
NiagaraScript_2091_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant19, NiagaraScript_2091_Func_Output_bUseOriginal2, NiagaraScript_2091_Func_Output_OutTransform2, NiagaraScript_2091_Func_Output_LocalToWorld2, Context);
float3 Result41 = mul(float4(In_InVector,0.0),NiagaraScript_2091_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result41;
Out_OutVector = Vector_IfResult2;
bool Constant23 = false;
float4x4 Matrix_IfResult4;
float4x4 Matrix001_IfResult3;
Matrix_IfResult4 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_2091_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_2091_Func_Output_OutTransform3;
bool NiagaraScript_2091_Func_Output_LocalToWorld3;
NiagaraScript_2091_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant23, NiagaraScript_2091_Func_Output_bUseOriginal3, NiagaraScript_2091_Func_Output_OutTransform3, NiagaraScript_2091_Func_Output_LocalToWorld3, Context);
float3 Result44 = mul(float4(In_InVector,0.0),NiagaraScript_2091_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InVector;
Vector_IfResult3 = Result44;
Out_OutVector = Vector_IfResult3;
float3 Result = mul(float4(((float3)Context.Map.Particles.Position),1.0),Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TransientGridOutput_Index;
UnitToFloatIndex_Emitter_TransientGrid(1, Result, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result1 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
X = Result1.x;
Y = Result1.y;
Z = Result1.z;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, X, Y, Z, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float W;
X1 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Y1 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Z1 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
W = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
bool CustomHlslA08820C74C020D471B2B7C99C2C9BD74_Func_Output_IsInside;
CustomHlslA08820C74C020D471B2B7C99C2C9BD74_Func_(W, CustomHlslA08820C74C020D471B2B7C99C2C9BD74_Func_Output_IsInside);
int Constant2 = 1;
bool Constant3 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.Map.Particles.Position, Constant1, Constant2, Constant3, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result30 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlsl944A2ACA424E53F6BAF56186F9B167CE_Func_Output_ret;
CustomHlsl944A2ACA424E53F6BAF56186F9B167CE_Func_(Result30, CustomHlsl944A2ACA424E53F6BAF56186F9B167CE_Func_Output_ret);
bool CustomHlsl5E59208941B9CFEC0A24FEB82F6D82F0_Func_Output_IsInside;
CustomHlsl5E59208941B9CFEC0A24FEB82F6D82F0_Func_(CustomHlsl944A2ACA424E53F6BAF56186F9B167CE_Func_Output_ret, CustomHlsl5E59208941B9CFEC0A24FEB82F6D82F0_Func_Output_IsInside);
bool Result31 = !CustomHlsl5E59208941B9CFEC0A24FEB82F6D82F0_Func_Output_IsInside;
bool Result32 = CustomHlslA08820C74C020D471B2B7C99C2C9BD74_Func_Output_IsInside || Result31;
float3 Result33 = Context.Map.Particles.Velocity * Context.Map.Engine.DeltaTime;
float3 Result34 = Context.Map.Particles.Position + Result33;
bool CustomHlsl56266D0B4E3CDB3F8D8053A291066D7B_Func_Output_IsInside;
CustomHlsl56266D0B4E3CDB3F8D8053A291066D7B_Func_(W, CustomHlsl56266D0B4E3CDB3F8D8053A291066D7B_Func_Output_IsInside);
float3 Constant11 = float3(0,0,0);
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(0, Result30, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result35 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result36 = Result35 * Context.Map.Engine.DeltaTime;
float3 Result37 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result36;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result37, Constant12, Constant13, Constant14, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
float3 SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(2, Result30, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result39 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result40 = Result35 - Result39;
int Constant17 = 1;
bool Constant18 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.Map.Particles.Velocity, Constant16, Constant17, Constant18, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result42 = Result40 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result43 = lerp(Result35,Result42,Constants_Emitter_Grid3D_FLIP_ParticleUpdate_PicOrFlip);
int Constant20 = 1;
bool Constant22 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
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
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl5E59208941B9CFEC0A24FEB82F6D82F0_Func_Output_IsInside;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl56266D0B4E3CDB3F8D8053A291066D7B_Func_Output_IsInside;
bool Constant29 = false;
bool bool_IfResult;
bool_IfResult = Constant29;
bool_IfResult = Context.Map.DataInstance.Alive;
Context.Map.DataInstance.Alive = bool_IfResult;
Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.Map.Emitter.LocalToWorld;
Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.Map.Emitter.WorldToUnit;
EnterStatScope(1 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.Map.KillParticles.KillParticles = Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant28 = true;
Context.Map.DataInstance.Alive = Constant28;
EnterStatScope(2 /**KillParticles_Emitter_Func_*/);
KillParticles_Emitter_Func_(Context);
ExitStatScope(/**KillParticles_Emitter_Func_*/);
EnterStatScope(3 /**SimulationStage_2_1_Main*/);
Context.Map.Emitter.LocalToWorld = Emitter_LocalToWorld;
Context.Map.Engine.DeltaTime = Engine_DeltaTime;
EnterStatScope(4 /**SimulationStage_2_1_MapMain*/);
float Emitter_RasterizationGrid3D_Initialize_dx;
int Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
float Constants_Emitter_RasterizationGrid_ParticleSource_RadiusMult;
int HalfBandwidth;
bool SourceIsLocalSpace;
FParamMap0_Emitter_RasterizationGrid3D_Initialize RasterizationGrid3D_Initialize;
FParamMap0_RasterizationGrid_ParticleSource RasterizationGrid_ParticleSource;
void GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void NiagaraScript_2110_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float2 Out_Value);
void UnitToFloatIndex_Emitter_RasterizationGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void GetNumCells_Emitter_RasterizationGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void InterlockedMinFloatGridValue_Emitter_RasterizationGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlsl2AF969324AFA1874A7F749A205B7D1E9Emitter_RasterizationGrid_Func_(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
void RasterizationGrid_ParticleSource_Emitter_Func_(inout FSimulationContext Context);
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
NiagaraScript_2091_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant12, NiagaraScript_2091_Func_Output_bUseOriginal, NiagaraScript_2091_Func_Output_OutTransform, NiagaraScript_2091_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_2091_Func_Output_OutTransform).xyz;
float3 Constant19 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult1 = Constant19;
NiagaraPosition_SelectResult1 = In_Position;
NiagaraPosition_SelectResult1 = Result28;
Out_Position = NiagaraPosition_SelectResult1;
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
        InterlockedMinFloatGridValue_Emitter_RasterizationGrid(0, CurrIndex.x, CurrIndex.y, CurrIndex.z, 0, IndexDist * In_dx, IGNORE);
//SetConstantByStaticVariable "/Rasterization Grid Particle Source/Map Get/Map Get->Module.UseNDC"
int Result = ExecIndex();
bool GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(1, Result, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
int Constant2 = 2;
float4x4 Constant5 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant6 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant7 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant8 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant9 = false;
float3 NiagaraScript_2110_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_2110_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant2, Constant3, Constant4, Constant5, Constant6, Constant7, Constant8, NiagaraScript_2110_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant20 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult2 = Constant20;
NiagaraPosition_SelectResult2 = NiagaraScript_2110_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult2 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
bool GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid;
float2 GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(1, Result, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 Result29 = mul(float4(NiagaraPosition_SelectResult2,1.0),Context.Map.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
Output1.x = Result29.x;
Output1.y = Result29.y;
Output1.z = Result29.z;
float3 UnitToFloatIndex_Emitter_RasterizationGridOutput_Index;
UnitToFloatIndex_Emitter_RasterizationGrid(0, Output1, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid(0, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlsl2AF969324AFA1874A7F749A205B7D1E9Emitter_RasterizationGrid_Func_(Output1, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.Map.RasterizationGrid_ParticleSource.dx, Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth, Constants_Emitter_RasterizationGrid_ParticleSource_RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
Context.Map.RasterizationGrid_ParticleSource.dx = Context.Map.Emitter.RasterizationGrid3D_Initialize.dx;
Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth = Context.Map.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.Map.RasterizationGrid_ParticleSource.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant;
EnterStatScope(1 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
RasterizationGrid_ParticleSource_Emitter_Func_(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func_*/);
Context.Map.Emitter.RasterizationGrid3D_Initialize.dx = Emitter_RasterizationGrid3D_Initialize_dx;
Context.Map.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth = Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
int Constants_Emitter_Grid3D_ConvolveAxis001_AttributeIndex;
float SDF;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter Emitter;
float ConvolvedValue;
FParamMap0_OUTPUT_VAR_Grid3D_ConvolveAxis001 Grid3D_ConvolveAxis001;
FParamMap0_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939 SetVariables_E132597143CDBB6A0359E5AE7A16F939;
void GetNumCells_Emitter_KernelGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetFloatGridValue_Emitter_RasterizationGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void GetPreviousFloatValue_Emitter_KernelGrid_Attributek(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlslC7B4141F457DE3F6A139D68DB3639347Emitter_RasterizationGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(inout FSimulationContext Context);
Out_ConvolvedValue = 0;
int3 CurrCell = int3(In_IndexX, In_IndexY, In_IndexZ);
int3 MaxCells = int3(In_NumCellsX, In_NumCellsY, In_NumCellsZ)  - 1;
for (int uu = -In_Radius; uu <= In_Radius; ++uu) {
  int3 SampleVec = uu * In_ConvAxis;
  int3 CurrIndex = clamp(CurrCell + SampleVec, int3(0,0,0), MaxCells);
  GetFloatGridValue_Emitter_RasterizationGrid(0, CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
  float KernelValue;
  GetPreviousFloatValue_Emitter_KernelGrid_Attributek(1, abs(uu), 0, KernelValue);
  Out_ConvolvedValue += Sample * KernelValue;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 001/Map Get/Map Get->Module.Axis"
int GetNumCells_Emitter_KernelGridOutput_NumCellsX;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY;
GetNumCells_Emitter_KernelGrid(1, GetNumCells_Emitter_KernelGridOutput_NumCellsX, GetNumCells_Emitter_KernelGridOutput_NumCellsY);
int Result = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant1;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(0, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
float3 Constant2 = float3(1,0,0);
float CustomHlslC7B4141F457DE3F6A139D68DB3639347Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlslC7B4141F457DE3F6A139D68DB3639347Emitter_RasterizationGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Constant2, Constants_Emitter_Grid3D_ConvolveAxis001_AttributeIndex, CustomHlslC7B4141F457DE3F6A139D68DB3639347Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlslC7B4141F457DE3F6A139D68DB3639347Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.Map.Emitter.SDFGrid.SDF = Context.Map.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
EnterStatScope(1 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Grid3D_ConvolveAxis001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.Map.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(2 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
int Constants_Emitter_Grid3D_ConvolveAxis_AttributeIndex;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter Emitter;
FParamMap0_OUTPUT_VAR_Grid3D_ConvolveAxis Grid3D_ConvolveAxis;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7 SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7;
void ExecutionIndexToGridIndex_Emitter_SDFGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_SDFGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(inout FSimulationContext Context);
  GetPreviousFloatValueAtIndex_Emitter_SDFGrid(0, CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
//SetConstantByStaticVariable "/Grid 3D Convolve Axis/Map Get/Map Get->Module.Axis"
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SDFGrid(0, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ;
GetNumCells_Emitter_SDFGrid(0, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant2 = float3(0,1,0);
float CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant2, Constants_Emitter_Grid3D_ConvolveAxis_AttributeIndex, CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.Map.Emitter.SDFGrid.SDF = Context.Map.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
EnterStatScope(1 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Grid3D_ConvolveAxis_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.Map.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(2 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
int Constants_Emitter_Grid3D_ConvolveAxis002_AttributeIndex;
float Constants_Emitter_Grid3D_SetRTValues_Green;
float Constants_Emitter_Grid3D_SetRTValues_Blue;
float Constants_Emitter_Grid3D_SetRTValues_Alpha;
FParamMap0_OUTPUT_VAR_Grid3D_ConvolveAxis002 Grid3D_ConvolveAxis002;
float4 Value;
FParamMap0_Local_Grid3D_SetRTValues Grid3D_SetRTValues;
float Red;
FParamMap0_Grid3D_SetRTValues Grid3D_SetRTValues;
void Grid3D_ConvolveAxis002_Emitter_Func_(inout FSimulationContext Context);
void ExecToIndex_Emitter_SimRT(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(int In_InstanceData, bool In_Enabled, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 002/Map Get/Map Get->Module.Axis"
int Constant = 2;
float3 Constant2 = float3(0,0,1);
CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant2, Constants_Emitter_Grid3D_ConvolveAxis002_AttributeIndex, CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.SetFromVector"
float4 Output1;
Output1.r = Context.Map.Grid3D_SetRTValues.Red;
Output1.g = Constants_Emitter_Grid3D_SetRTValues_Green;
Output1.b = Constants_Emitter_Grid3D_SetRTValues_Blue;
Output1.a = Constants_Emitter_Grid3D_SetRTValues_Alpha;
Context.Map.Local.Grid3D_SetRTValues.Value = Output1;
bool Constant5 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(2, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(2, Constant5, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.Map.Local.Grid3D_SetRTValues.Value);
EnterStatScope(1 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Grid3D_ConvolveAxis002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Context.Map.Grid3D_SetRTValues.Red = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
EnterStatScope(2 /**Grid3D_SetRTValues_Emitter_Func_*/);
Grid3D_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues_Emitter_Func_*/);
EnterStatScope(0 /**SimulationStage_2_0*/);
ExitStatScope(/**SimulationStage_2_0*/);
EnterStatScope(2 /**SimulationStage_2_0_Main*/);
EnterStatScope(3 /**SimulationStage_2_0_MapMain*/);
ExitStatScope(/**SimulationStage_2_0_MapMain*/);
ExitStatScope(/**SimulationStage_2_0_Main*/);
float Constant1 = 0;
Context.Map.Emitter.TemporaryGrid.SimFloat = Constant1;
float Constant = 0;
float3 Constant1 = float3(0,0,0);
Context.Map.Emitter.StartVelocityGrid.StartVelocity = Constant1;
float3 Constant = float3(0,0,0);
void NiagaraScript_940_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
bool NiagaraScript_940_Func_Output_bUseOriginal;
float4x4 NiagaraScript_940_Func_Output_OutTransform;
bool NiagaraScript_940_Func_Output_LocalToWorld;
NiagaraScript_940_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant5, NiagaraScript_940_Func_Output_bUseOriginal, NiagaraScript_940_Func_Output_OutTransform, NiagaraScript_940_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_940_Func_Output_OutTransform).xyz;
bool NiagaraScript_940_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_940_Func_Output_OutTransform1;
bool NiagaraScript_940_Func_Output_LocalToWorld1;
NiagaraScript_940_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant15, NiagaraScript_940_Func_Output_bUseOriginal1, NiagaraScript_940_Func_Output_OutTransform1, NiagaraScript_940_Func_Output_LocalToWorld1, Context);
float3 Result29 = mul(float4(In_InVector,0.0),NiagaraScript_940_Func_Output_OutTransform1).xyz;
int Constant23 = 0;
float3 Constant24 = float3(0,0,0);
float3 Result = Output1 + Constant24;
float3 Constant25 = float3(0,0,0);
Context.Map.Transient.SolidVelocity = Constant25;
int Constant26 = 2;
CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant26, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary);
float Constant27 = 1e+17;
int Constant28 = 1;
Context.Map.Transient.BoundarySignedDistance = Constant27;
int Constant29 = 1;
int Constant30 = 7;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45X = Constant12;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43X = Constant13;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Z = Constant14;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Z = Constant15;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC43Y = Constant16;
bool Constant17 = false;
Context.Map.Grid3D_ComputeBoundary.OpenBoundaryASC45Y = Constant17;
EnterStatScope(5 /**SimulationStage_2_0_Main*/);
EnterStatScope(6 /**SimulationStage_2_0_MapMain*/);
CustomHlslFAE69ED84C4EF173A520EDB24D1A82ECEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant13, Context.Map.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlslFAE69ED84C4EF173A520EDB24D1A82ECEmitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
int Constant14 = 1;
int Constant15 = 9;
EnterStatScope(6 /**SimulationStage_2_0_Main*/);
EnterStatScope(7 /**SimulationStage_2_0_MapMain*/);
Context.Map.Emitter.PressureGrid.Pressure = Constant1;
int Constant3 = 3;
EnterStatScope(4 /**SimulationStage_2_0_Main*/);
EnterStatScope(5 /**SimulationStage_2_0_MapMain*/);
void NiagaraScript_945_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void NiagaraScript_946_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
float Constant23 = 0.95;
int Constant24 = 0;
int NiagaraScript_945_Func_Output_IterationIndex;
int NiagaraScript_945_Func_Output_MaxIterations;
float NiagaraScript_945_Func_Output_NormalizedIterationIndex;
int NiagaraScript_945_Func_Output_LoopIndex;
int NiagaraScript_945_Func_Output_NumberOfLoops;
float NiagaraScript_945_Func_Output_NormalizedLoopIndex;
NiagaraScript_945_Func_(NiagaraScript_945_Func_Output_IterationIndex, NiagaraScript_945_Func_Output_MaxIterations, NiagaraScript_945_Func_Output_NormalizedIterationIndex, NiagaraScript_945_Func_Output_LoopIndex, NiagaraScript_945_Func_Output_NumberOfLoops, NiagaraScript_945_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_946_Particle_Func_Output_ClampedValue;
NiagaraScript_946_Particle_Func_(Constant23, NiagaraScript_946_Particle_Func_Output_ClampedValue, Context);
CustomHlsl20011CBA4012BE1646DB41A6C44D87C8Emitter_PressureGridEmitter_TransientGrid_Func_(Context.Map.Grid3D_PressureIteration.dx, Context.Map.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Context.Map.Grid3D_PressureIteration.Divergence, NiagaraScript_945_Func_Output_IterationIndex, NiagaraScript_946_Particle_Func_Output_ClampedValue, Context.Map.Grid3D_PressureIteration.Velocity, Context.Map.Grid3D_PressureIteration.Pressure, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_right, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_left, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_up, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_down, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_front, CustomHlsl23BE62DB4D3C4CB41502E4A051BAE0A2_Func_Output_F_back, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_right, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_left, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_up, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_down, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_front, CustomHlsl10FF39DD4158ED6DEE2522BD8ECFFBD7Emitter_TransientGrid_Func_Output_B_back, CustomHlsl20011CBA4012BE1646DB41A6C44D87C8Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
float Constant22 = 0.95;
int Constant24 = 1;
CustomHlsl0E4DFAEE4F92FADD7EDC6FA956035597Emitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant24, Context.Map.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Transient.Velocity, Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlsl0E4DFAEE4F92FADD7EDC6FA956035597Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
int Constant22 = 1;
bool Result2 = NiagaraAll(In_SourceSpace == Constant7);
int Constant8 = 0;
bool Result3 = NiagaraAll(In_DestinationSpace == Constant8);
bool Result5 = NiagaraAll(In_SourceSpace == Constant9);
bool Result6 = NiagaraAll(In_DestinationSpace == Constant10);
bool Result9 = NiagaraAll(In_SourceSpace == Constant11);
int Constant12 = 2;
bool Result10 = NiagaraAll(In_DestinationSpace == Constant12);
bool Constant6 = false;
NiagaraScript_940_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant6, NiagaraScript_940_Func_Output_bUseOriginal, NiagaraScript_940_Func_Output_OutTransform, NiagaraScript_940_Func_Output_LocalToWorld, Context);
float3 Result29 = mul(float4(In_InPosition,1.0),NiagaraScript_940_Func_Output_OutTransform).xyz;
NiagaraScript_940_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant17, NiagaraScript_940_Func_Output_bUseOriginal1, NiagaraScript_940_Func_Output_OutTransform1, NiagaraScript_940_Func_Output_LocalToWorld1, Context);
float3 Result38 = mul(float4(In_InPosition,1.0),NiagaraScript_940_Func_Output_OutTransform1).xyz;
bool Constant21 = false;
bool NiagaraScript_940_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_940_Func_Output_OutTransform2;
bool NiagaraScript_940_Func_Output_LocalToWorld2;
NiagaraScript_940_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant21, NiagaraScript_940_Func_Output_bUseOriginal2, NiagaraScript_940_Func_Output_OutTransform2, NiagaraScript_940_Func_Output_LocalToWorld2, Context);
float3 Result41 = mul(float4(In_InVector,0.0),NiagaraScript_940_Func_Output_OutTransform2).xyz;
bool Constant25 = false;
bool NiagaraScript_940_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_940_Func_Output_OutTransform3;
bool NiagaraScript_940_Func_Output_LocalToWorld3;
NiagaraScript_940_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant25, NiagaraScript_940_Func_Output_bUseOriginal3, NiagaraScript_940_Func_Output_OutTransform3, NiagaraScript_940_Func_Output_LocalToWorld3, Context);
float3 Result44 = mul(float4(In_InVector,0.0),NiagaraScript_940_Func_Output_OutTransform3).xyz;
float Constant2 = 0.9;
int Constant4 = 1;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.Map.Particles.Position, Constant3, Constant4, Constant5, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Constant13 = float3(0,0,0);
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result37, Constant14, Constant15, Constant16, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
int Constant19 = 1;
bool Constant20 = false;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.Map.Particles.Velocity, Constant18, Constant19, Constant20, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result43 = lerp(Result35,Result42,Constant2);
bool Constant24 = false;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result43, Constant22, Constant23, Constant24, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Position_SelectResult = Constant26;
float3 Velocity_SelectResult = Constant27;
Velocity_SelectResult = Constant13;
float3 Constant28 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult1 = Constant28;
float3 Constant29 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult1 = Constant29;
bool Constant31 = false;
bool_IfResult = Constant31;
float Constant = 0.9;
bool Constant1 = false;
bool Constant30 = true;
Context.Map.DataInstance.Alive = Constant30;
EnterStatScope(3 /**SimulationStage_2_0_Main*/);
EnterStatScope(4 /**SimulationStage_2_0_MapMain*/);
void NiagaraScript_959_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
bool Result1 = NiagaraAll(In_SourceSpace == Constant15);
bool Result2 = NiagaraAll(In_DestinationSpace == Constant16);
bool Result4 = NiagaraAll(In_SourceSpace == Constant17);
int Constant18 = 1;
bool Result5 = NiagaraAll(In_DestinationSpace == Constant18);
int Constant19 = 2;
bool Result8 = NiagaraAll(In_SourceSpace == Constant19);
int Constant20 = 2;
bool Result9 = NiagaraAll(In_DestinationSpace == Constant20);
float4x4 Constant12 = (float4x4)0;
float4x4 LocalToWorld_SelectResult = Constant12;
float4x4 Constant13 = (float4x4)0;
float4x4 WorldToLocal_SelectResult = Constant13;
NiagaraScript_940_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant14, NiagaraScript_940_Func_Output_bUseOriginal, NiagaraScript_940_Func_Output_OutTransform, NiagaraScript_940_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_940_Func_Output_OutTransform).xyz;
float3 Constant21 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult1 = Constant21;
float Constant2 = 1;
int Constant4 = 2;
int Constant5 = 1;
float4x4 Constant9 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant10 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float3 NiagaraScript_959_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_959_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant4, Constant5, Constant6, Constant7, Constant8, Constant9, Constant10, NiagaraScript_959_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant22 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult2 = Constant22;
NiagaraPosition_SelectResult2 = NiagaraScript_959_Emitter_Localspace_false_Particle_Func_Output_Position;
CustomHlsl2AF969324AFA1874A7F749A205B7D1E9Emitter_RasterizationGrid_Func_(Output1, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.Map.RasterizationGrid_ParticleSource.dx, Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth, Constant2, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
float Constant = 1;
Context.Map.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant1;
int Result = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant3;
float3 Constant4 = float3(1,0,0);
CustomHlslC7B4141F457DE3F6A139D68DB3639347Emitter_RasterizationGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Constant4, Constant1, CustomHlslC7B4141F457DE3F6A139D68DB3639347Emitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
float3 Constant4 = float3(0,1,0);
CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant4, Constant1, CustomHlsl6B7471274511B9B58D80F6993A34A582Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
float3 Constant4 = float3(0,0,1);
float Constant10 = 0;
float Constant11 = 0;
float Constant12 = 0;
Output1.g = Constant10;
Output1.b = Constant11;
Output1.a = Constant12;
bool Constant13 = true;
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(2, Constant13, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.Map.Local.Grid3D_SetRTValues.Value);
float Constant5 = 0;
float Constant6 = 0;
float Constant7 = 0;
float Value;
FParamMap0_SetVariables_4405CB544D551592967D60972962E8B8_Particles Particles;
FParamMap0_SetVariables_4405CB544D551592967D60972962E8B8 SetVariables_4405CB544D551592967D60972962E8B8;
FParamMap0_Vector2DFromFloat Vector2DFromFloat;
void Vector2DFromFloat_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_(inout FSimulationContext Context);
float2 Output1;
Output1.x = Context.Map.Vector2DFromFloat.Value;
Output1.y = Context.Map.Vector2DFromFloat.Value;
Out_Vec2 = Output1;
Context.Map.Particles.SpriteSize = Context.Map.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize;
EnterStatScope(0 /**SpawnScript_2_2*/);
float2 Constant = float2(0.0, 0.0);
Context.Map.Particles.SpriteSize = Constant;
Context.Map.Particles.Velocity = Constant1;
Context.Map.Vector2DFromFloat.Value = Context.Map.Emitter.dx;
float2 Vector2DFromFloat_Emitter_Func_Output_Vec2;
Vector2DFromFloat_Emitter_Func_(Vector2DFromFloat_Emitter_Func_Output_Vec2, Context);
Context.Map.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize = Vector2DFromFloat_Emitter_Func_Output_Vec2;
EnterStatScope(1 /**SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_*/);
SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_*/);
// Begin HandleMissingDefaultValues
float3 Constant2 = float3(0,0,0);
Context.Map.Particles.Position = Constant2;
// End HandleMissingDefaultValues
ExitStatScope(/**SpawnScript_2_2*/);
EnterStatScope(2 /**SpawnScript_2_2_Main*/);
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
EnterStatScope(3 /**SpawnScript_2_2_MapMain*/);
ExitStatScope(/**SpawnScript_2_2_MapMain*/);
ExitStatScope(/**SpawnScript_2_2_Main*/);
EnterStatScope(0 /**SpawnScript_2_3*/);
ExitStatScope(/**SpawnScript_2_3*/);
EnterStatScope(2 /**SpawnScript_2_3_Main*/);
EnterStatScope(3 /**SpawnScript_2_3_MapMain*/);
ExitStatScope(/**SpawnScript_2_3_MapMain*/);
ExitStatScope(/**SpawnScript_2_3_Main*/);
float3 Constants_Emitter_Grid3D_FLIP_IntegrateParticleVelocity_Gravity;
float3 PhysicsForce;
FParamMap0_Grid3D_FLIP_IntegrateParticleVelocity Grid3D_FLIP_IntegrateParticleVelocity;
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(inout FSimulationContext Context);
float3 Result = Context.Map.Transient.PhysicsForce + Constants_Emitter_Grid3D_FLIP_IntegrateParticleVelocity_Gravity;
float3 Result1 = Result * Context.Map.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result2 = Context.Map.Particles.Velocity + Result1;
Context.Map.Particles.Velocity = Result2;
EnterStatScope(0 /**UpdateScript_2_4*/);
Context.Map.Grid3D_FLIP_IntegrateParticleVelocity.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Transient.PhysicsForce = Constant;
EnterStatScope(1 /**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
ExitStatScope(/**UpdateScript_2_4*/);
EnterStatScope(2 /**UpdateScript_2_4_Main*/);
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
EnterStatScope(3 /**UpdateScript_2_4_MapMain*/);
ExitStatScope(/**UpdateScript_2_4_MapMain*/);
ExitStatScope(/**UpdateScript_2_4_Main*/);
float3 Constant2 = float3(0,0,-980);
float3 Result = Context.Map.Transient.PhysicsForce + Constant2;
EnterStatScope(0 /**UpdateScript_2_5*/);
float3 Constant1 = float3(0,0,-980);
ExitStatScope(/**UpdateScript_2_5*/);
EnterStatScope(2 /**UpdateScript_2_5_Main*/);
EnterStatScope(3 /**UpdateScript_2_5_MapMain*/);
ExitStatScope(/**UpdateScript_2_5_MapMain*/);
ExitStatScope(/**UpdateScript_2_5_Main*/);
é∆"B—˛#C¨®»¿HE;9¸
 i≠•⁄VHÅ
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„E¸
€@Ç8{;¸¡´â¸
A6¨A@ä≈s∫Èœ;B¸
—}FVéBÖ&;æo,ô0¸
l;ÆPåq
xì;ö©\?Nñ∫/hÑ
m¢òË7à;O±ÆzÔVÄ
¡É*ûóˆ•Ä.;ƒ—


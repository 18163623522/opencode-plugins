o¿†∫øÓAΩç;
Ãjg\–0%DãÕÕ¸˝;
£es;¢+¸D≥üw:Uâ¶oæ
£es;¢+¸D≥üw:Uâ¶oΩ
8ö«Õ>;Ò
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
¡˙i|«`@ç´‡;øœ*ø
¬;µO¬˛˙
™JCÄ(;=…
¡∂Ká;¸Ò
ò&;Xq"£h
‘ƒf–Uƒ$ç•Í!;≤∑ﬁ5d
O;ijaxKj¶ Í
»}Oc P;Lãt?-ì◊BÍÒ
‰‹C¥Á¯∏;p
∂©;èÖ∞¶JãseÜ?è"çæ
∂©;èÖ∞¶JãseÜ?è"çΩ
{çAëöe;=Â@\Œh
;®Âl‰˚D¨è\•—Yß€/a<eEh
à–Â>V&Àqï§;¸1h
òëâˆc√Ì@á(D‡Øy;
ú?;R9Ò
‹;ÇøÅZTEÆóÙi∏r‡
 ‚ÖL£;âŸ*f@
/9$¸;Ü‰AÑ¢Ñ©6
|;H√k¡≤
Ìú[x{;9ô@h
;Ø§€>y
∞J‰0µjXZnµ;0h
ˇú;oF%1Cûl
;äCæF™y€
€v·;˝ÏÔæV ⁄-ªﬁj90dê
âØ®Gá˙wïÃ;·ßÒ
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊⁄
·Ä;2Kx+J≤Bè§]â‹#û
s;Mi”DÅéÄµó«RËû
öc,„( ÒCí;˙™gÊN1û
¶Kôv›9;Ûÿ‡e
6/Øém;<Jå
cMäI#í;…
ùΩ;Bêa¢óoÆóˆ
—Xd°JeG∏;(
Â;NiÈaûMâ¿
Ù;HgI©“7
ﬁJΩu&ÑkU„;b
ﬁJΩu&ÑkU„;»
—Ì7;GΩ
ﬁJΩu&ÑkU„;Í
ﬁJΩu&ÑkU„; 
‡gYßÖ¯Hê");rÆ◊\™
‡gYßÖ¯Hê");rÆ◊\»
‡gYßÖ¯Hê");rÆ◊\Î
‡gYßÖ¯Hê");rÆ◊\°
ﬁJΩu&ÑkU„;
‡gYßÖ¯Hê");rÆ◊\Ò
ﬁJΩu&ÑkU„;ˆ
‡gYßÖ¯Hê");rÆ◊\˜
ﬁJΩu&ÑkU„;¸
‡gYßÖ¯Hê");rÆ◊\˝
ﬁJΩu&ÑkU„;
‡gYßÖ¯Hê");rÆ◊\
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
S~Îe≤Ï∫Aó;>h≠
±qú©#N7O™ª;eﬂ
+?n¡bPrKªf=Çj„‚ø;
W`Äd˘å°B≥t¥÷;ƒk|e
nÂ¢q“qMâ;}tk
;W/Ë¿]K
;W/Ë¿]n
Â√˙»S;ÅD†ò
;W/Ë¿]q
;W/Ë¿]ó
;W/Ë¿]Ω
è;ÿ˙ú†qBï*tÎˇ
÷‡y|;NÄuÀ^‰îÍﬁ
÷‡y|;NÄuÀ^‰îÍﬁ 
÷‡y|;NÄuÀ^‰îÍ
;W/Ë¿]Ê
;W/Ë¿]2
˚˙{ßYGß<8ÊVKÒƒ;
ièÇ\Ë;
Læái+:zr¥;
*¯ı°”^;
;W/Ë¿]X
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3
ãsL≥L©j;Ö®¨¶ºz
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿z
>Â;N™Õ)vãh.Zz
b\^ÇPÛEü;±
”5oU;Já±±@†®%9
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™π
K˜ZC ö;Mòïs
;Iò£+1
¢Bçªòù‹E;∑
¢Bçªòù‹E;∑:
òpØOπõl&ë›;@ã
∞C¥5;ÅKßQã˙Cæº
3 yZ;Í]N∂m
87ô5¶3Në;
¢Bçªòù‹E;∑ 
Ñq;dœDÿJë`†à]ÀÁÆÌ
ÚJÜÊ;§Ô
ãß;ÂR@ø©àm¯êúJj
÷ÎÜ˚õAé;¿Ùc.ó∑
Ò≈;ªO≠lÜ••˙C≥z
Æ;IN:ˆ
;≠ã£πÏ™G•'∆5
*J;œ’$ÓI¥ÒƒƒÚo‘~◊
Oö;P2π¸Æ*i
!;ÌBÔΩ«@†À<Ç*
†6i ;◊
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^÷
mk†;$û•O´ÜáVóIø¥j
OÆÎi;^¡òŸh
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;j
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.È
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í 
†HæÂ˛†’H-;€
;Ô“].º’
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Û€
Y{3;FçûRô®<NCi
 DÄ÷bûYPc7’
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Óå
xH;A˘qi
˜cKª‰´˛;‡ÚˇF
 iÈJÜ-g$ûZH⁄€
7uù¬‘RçKô'î£lÅ;ki
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿Çá
:Ã;3ËBqM£<Y)ôfH$F
AÉ%F;XOÖ6x‡jæÊ\h
xùù⁄€HH≠cç;[*Y>w
xùù⁄€HH≠cç;[*Y>§
Ñq;dœDÿJë`†à]ÀÁÆÒ
æπ~f;b
;|ã´Îø
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>mz
Dó0¿¯;ÑOæz
 l;æNÉÒÌ‡~ 4=
ÑÒ`@ºèS;<»Zö
%wäJÄ‚+“;Eh–e
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜Ñ
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
âH;ñS„Z
\∏Aä;!ô-¬€¡h
TA±;ãÒ¢!Áyë
TA±;ãÒ¢!Áy§
ó∆t‚"î±@Ö;i∞∑û6Ïe
ˇÚEì;Ú"∑
@ãeT;Æúç
xùù⁄€HH≠cç;[*Y>†
ÒÔºNÇú&;
;†Dò¬◊˚f™+û∂
;†Dò¬◊˚f™+û§
π◊;u NI¶e∏…
xùù⁄€HH≠cç;[*Y>¿
¯;º!1Í’@Ø
TA±;ãÒ¢!Áy‹
¸ëØNµ‹P%Náw;•
EÉ©N}í.;
xùù⁄€HH≠cç;[*Y>Í
I ;qÚKí
(s±;î`ÏCö6⁄V`6X3Z
;+¯OOûû7>
TA±;ãÒ¢!Áy
xùù⁄€HH≠cç;[*Y>
πsÏ^;e
TA±;ãÒ¢!Áy4
ZAÜûÀ;
xùù⁄€HH≠cç;[*Y>B
TA±;ãÒ¢!Áy`
xùù⁄€HH≠cç;[*Y>n
f;èçKï#GÉ~1áúÔ¿We
Ñq;dœDÿJë`†à]ÀÁÆ+
TA±;ãÒ¢!Áyå
xùù⁄€HH≠cç;[*Y>ú
∂ÙµO≥;3Yx‘(Çe
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†
;aJΩzO ?∆+††
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;Fd
Ä~E;ﬁÂ
B≥%Îë;
;?%¶f\
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
@ï`ko»1ßï;
Ü;‚{v¡!JéDY†a
¨•;ª´Ê“Kß√t
;aJΩzO ?∆+†X
Ö∏:“)¢ŒOò;æíÖ√
;ı≥Kn™I±~ö†V∂ŸQ
;aJΩzO ?∆+†°
;aJΩzO ?∆+†ﬂ
∆M±\Oå;µxK
Ö∏:“)¢ŒOò;æíÖ√„õ%
;aJΩzO ?∆+†2
_V!»√RèI†§Â·¿ÿ_G;
Ö∏:“)¢ŒOò;æíÖ√„õw
;aJΩzO ?∆+†Ö
Ö∏:“)¢ŒOò;æíÖ√„õÀ
;aJΩzO ?∆+†ÿ
Ö∏:“)¢ŒOò;æíÖ√„õ
;aJΩzO ?∆+†+
Ö∏:“)¢ŒOò;æíÖ√„õq
z;O∫kÉ^˝öËTe
≤´;à‘ÿ
“US?ˆºbE™;e›k˜¯
J†)E—;
#;Mà;Ä4
XûEøEø;bÒ1°
XûEøEø;bÒ1°°
Âù˚z˙ÎÉOπ`)LA»;”d
XûEøEø;bÒ1°9
XûEøEø;bÒ1°Y
XûEøEø;bÒ1°~
XûEøEø;bÒ1°®
XûEøEø;bÒ1°“
XûEøEø;bÒ1°¸
É;LßA^%Ÿ¸ª
q‘ı;EûuCdﬁ&5›B
q‘ı;EûuCdﬁ&5›h
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
ÍzëﬂDñsØu„Lû;e
q‘ı;EûuCdﬁ&5›M
q‘ı;EûuCdﬁ&5›X
q‘ı;EûuCdﬁ&5›c
sVb∑I;|B™0
êÑ”7X;KªGûﬁV±ë˙
´;{Á9o€F≠ïÊ.ﬂ
q‘ı;EûuCdﬁ&5›p
q‘ı;EûuCdﬁ&5›{
q‘ı;EûuCdﬁ&5
£í;Cä˘G¥
@™ÛlØ,;
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]û
Aì;˝ˇ\∑Ç]Ô
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_•
9á‚ s‘]MäSr;˚±µ`d
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ
9;˛π$J»Añ{C8·åNıÆ
9;˛π$J»Añ{C8·åNıh
Ò¢;•BˆCî
U;7@ÆM¢2ÑC°˛t
U;7@ÆM¢2ÑC°˛
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€ƒt
Ω.BπYÎ;k7Î˜æ
Ω.BπYÎ;k7Î˜•
µ¶8ÀÀ|&@ô//„Jπ€ƒ
zÍHõ˘ÛﬁFÉæî;LÔ~ÏQr{ÏÛ/DE±
zÍHõ˘ÛﬁFÉæî;LÔ~Ï
Gò;ä∆…±
‹˙ÍäÓÑHæ;˚˛°0»—–
‹˙ÍäÓÑHæ;˚˛°0»—
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“A”
 ZSiBº´AéÓ—lÜ∆“Ah
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
/Ø£q;çØ
;#ˇMò’
Dzp;"!ﬁ
Dzp;"!h
jz+‚ R¥GÅ;/≤Güß¶ﬂ
jz+‚ R¥GÅ;/≤Güß¶
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
;ªÑê*%„
;ªÑê*%
N´†;zXã
&≠,ÿ;´§Oª‚œ
;—JˇèCà
H;Îw‹_MKØ˚µ2Z‘Á‰Ï
H;Îw‹_MKØ˚µ2Z‘Á‰¬
8—d≤G©G¡`Q;◊He
Íi+;<’Nö±w
Û]¯;¨òïBá
0∂Kπ;ö
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
{;ÂîJçÂ-'3‘
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
“˜*A;÷Lòo„ì
B™Ö¯0b.\;t
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
É<^âFΩ9‹'Œe;`e
6l;#˜µ¥O™
e{K®Zˆ-˝M;¿t
e{K®Zˆ-˝M;¿
DH;Eêé$,*H‹–*
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡,
GåÁÂé-;Ë‡≤
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;t
;YÂLËh
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQbh
fì˘≈‚d†G≤Û&ÖP±vG;
Aì;˝ˇ\∑Ç]I
É∆:JóÑƒ—;Tá_P
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNıY
ùY˝;BEî¢
(MÜ;∏Ç
4Øˇ;oö˚Gú°ò
áŸJ∫î;
Ω.BπYÎ;k7Î˜i
;ı≥Kn™I±~ö†V∂ŸQl
;ı≥Kn™I±~ö†V∂ŸQ•
 ZSiBº´AéÓ—lÜ∆“A|
;ªÑê*%ë
H;Îw‹_MKØ˚µ2Z‘Á‰ô
oi∑;_Aå¢õÜ‘ÃÈ9∫
ı‰®I¶;
¨3êC?D´Ü∂v;“%1Õ
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆ–
ùΩ;Bêa¢óoÆóˆ•
 A´KUTFöR!“
 A´KUTFöR!h
DH;Eêé$,*H‹–÷
GåÁÂé-;Ë‡ÿ
Aì;˝ˇ\∑Ç]Ù
9;˛π$J»Añ{C8·åNı˛
 ZSiBº´AéÓ—lÜ∆“A
;ªÑê*%*
H;Îw‹_MKØ˚µ2Z‘Á‰3
¸jÜò∑#;JÉ9_ßÁ°qbe
oi∑;_Aå¢õÜ‘ÃÈ9T
DH;Eêé$,*H‹–p
GåÁÂé-;Ë‡r
Aì;˝ˇ\∑Ç]å
É∆:JóÑƒ—;Tá_ì
9;˛π$J»Añ{C8·åNıú
Ω.BπYÎ;k7Î˜≤
 ZSiBº´AéÓ—lÜ∆“A»
 C®ØHŸ˜ÎRﬁh
––˙»H™;[á}zŒBe
;ªÑê*%‹
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
H;Îw‹_MKØ˚µ2Z‘Á‰Ì
∆M±\Oå;µxKÓ
∆M±\Oå;µxK•
¨3êC?D´Ü∂v;“%1"
ùΩ;Bêa¢óoÆóˆ%
 A´KUTFöR!'
DH;Eêé$,*H‹–,
GåÁÂé-;Ë‡.
5k~/·*ÅIø˙LÎd¿Ì2;
©ÁI°Q-¸;_◊
Ω.BπYÎ;k7Î˜o
 ZSiBº´AéÓ—lÜ∆“AÉ
;ªÑê*%ô
@&UIïóÿ;Â
H;Îw‹_MKØ˚µ2Z‘Á‰¨
oi∑;_Aå¢õÜ‘ÃÈ9 
¨3êC?D´Ü∂v;“%1ﬁ
ùΩ;Bêa¢óoÆóˆ·
 A´KUTFöR!„
DH;Eêé$,*H‹–Ë
GåÁÂé-;Ë‡Í
Aì;˝ˇ\∑Ç]
9;˛π$J»Añ{C8·åNı
Ω.BπYÎ;k7Î˜,
a¸Ÿ¯[ˇ@Hñ&õﬁÕm4¯;
 ZSiBº´AéÓ—lÜ∆“AB
;ªÑê*%V
H;Îw‹_MKØ˚µ2Z‘Á‰g
∆M±\Oå;µxKh
oi∑;_Aå¢õÜ‘ÃÈ9à
¨3êC?D´Ü∂v;“%1ú
ùΩ;Bêa¢óoÆóˆü
 A´KUTFöR!°
DH;Eêé$,*H‹
GåÁÂé-;Ë‡®
Aì;˝ˇ\∑Ç]√
É∆:JóÑƒ—;Tá_ 
9;˛π$J»Añ{C8·åNı”
Ω.BπYÎ;k7Î˜È
 ZSiBº´AéÓ—lÜ∆“Aˇ
H;Îw‹_MKØ˚µ2Z‘Á‰$
∆M±\Oå;µxK%
oi∑;_Aå¢õÜ‘ÃÈ9E
¨3êC?D´Ü∂v;“%1Y
ùΩ;Bêa¢óoÆóˆ\
 A´KUTFöR!^
DH;Eêé$,*H‹–c
GåÁÂé-;Ë‡e
Aì;˝ˇ\∑Ç]Ä
É∆:JóÑƒ—;Tá_á
9;˛π$J»Añ{C8·åNıê
¯;¨ìnLÉ
Ω.BπYÎ;k7Î˜¶
 ZSiBº´AéÓ—lÜ∆“Aº
‘!„Ñ;≈≈
‘!„Ñ;≈‡
˛ÕÕC+˝CàúÓÑ;Ìª6e
IVj;≈DE©
;ªÑê*%÷
wàB“Nç†;¸ˇ”Î
≠“A©;P›ıŸ
H;Îw‹_MKØ˚µ2Z‘Á‰Í
∆M±\Oå;µxKÎ
ùΩ;Bêa¢óoÆóˆ"
 A´KUTFöR!$
DH;Eêé$,*H‹–)
GåÁÂé-;Ë‡+
J¶1Äﬁ;
;©†˚(ÊÂFêç
@Ô¥-;M©EåQ†
 —<;?h™Môç•ØZüòUl
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•h
x´;Bé§í‡Òä`Êo
x´;Bé§í‡Òä`Ê°
‰g;•†0MÜQ:âıπº^q
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
;_Çóù3†Câ#
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒu
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ∆
K;Óñ‰ﬁ
&HÚ´;R
DÅ)¯P√}i;Ö
DÅ)¯P√}i;±
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
qi;;¥E∂o>2e
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯Xé
;˙/¯XÏ
ıR9ÿ"D¨Úq;Ã
g‹I∏xü;Ü
%îh;˘Ä_G∑
H;Îw‹_MKØ˚µ2Z‘Á‰
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
GåÁÂé-;Ë‡
;M¸è¿sK£ﬁ»u8q„eh
˛´T“@õÜ;˘TÑq™¶
˛´T“@õÜ;˘TÑq™o
\Ày`AçÇZ≥Ñ˙;±ß
\Ày`AçÇZ≥Ñ˙;±a
kgÉÄ§DÅPŒrq1;Ô
 Cã˛¡î
å·;ˆ÷hÆNóıÓŸƒq±∞≤
å·;ˆ÷hÆNóıÓŸƒq±∞
 —<;?h™Môç•ØZüòU¥
x´;Bé§í‡Òä`Ê∑
‰g;•†0MÜQ:âıπº^π
;‡ÑØj.8JôÄ
)%;¸<≥◊L™
K;Óñ‰ﬁ«
DÅ)¯P√}i;Õ
Úh;|}}
;˙/¯X÷
ìáï∆)K;Mà±≠/˜˜ùöe
˛´T“@õÜ;˘TÑq™Ì
\Ày`AçÇZ≥Ñ˙;±Ó
;\AŒ#Ú≤JêO<ê†Kue
&—√n‡]⁄KØ;û
‡;ruôeÙH§•
å·;ˆ÷hÆNóıÓŸƒq±∞¸
 —<;?h™Môç•ØZüòU˛
;†Dò¬◊˚f™+û
˛´T“@õÜ;˘TÑq™.
\Ày`AçÇZ≥Ñ˙;±/
å·;ˆ÷hÆNóıÓŸƒq±∞<
 —<;?h™Môç•ØZüòU>
x´;Bé§í‡Òä`ÊA
‰g;•†0MÜQ:âıπº^C
K;Óñ‰ﬁT
DÅ)¯P√}i;Z
;˙/¯Xc
˛´T“@õÜ;˘TÑq™y
\Ày`AçÇZ≥Ñ˙;±z
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
˘aûª;D°Oá
å·;ˆ÷hÆNóıÓŸƒq±∞ë
 —<;?h™Môç•ØZüòUì
x´;Bé§í‡Òä`Êñ
‰g;•†0MÜQ:âıπº^ò
DÅ)¯P√}i;Ø
;˙/¯X∏
˛´T“@õÜ;˘TÑq™Œ
\Ày`AçÇZ≥Ñ˙;±œ
å·;ˆ÷hÆNóıÓŸƒq±∞Ê
 —<;?h™Môç•ØZüòUË
x´;Bé§í‡Òä`ÊÎ
‰g;•†0MÜQ:âıπº^Ì
K;Óñ‰ﬁ˛
˛´T“@õÜ;˘TÑq™#
\Ày`AçÇZ≥Ñ˙;±$
aß¸¸–;
å·;ˆ÷hÆNóıÓŸƒq±∞;
 —<;?h™Môç•ØZüòU=
x´;Bé§í‡Òä`Ê@
‰g;•†0MÜQ:âıπº^B
K;Óñ‰ﬁS
DÅ)¯P√}i;Y
;˙/¯Xb
˛´T“@õÜ;˘TÑq™x
\Ày`AçÇZ≥Ñ˙;±y
å·;ˆ÷hÆNóıÓŸƒq±∞ê
 —<;?h™Môç•ØZüòUí
x´;Bé§í‡Òä`Êï
‰g;•†0MÜQ:âıπº^ó
^q‹OL≠;`
DÅ)¯P√}i;Æ
‘!„Ñ;≈
;˙/¯X∑
˛´T“@õÜ;˘TÑq™œ
\Ày`AçÇZ≥Ñ˙;±–
;X^5@ü
êÑ”7X;KªGûﬁV±ë˙¯
êÑ”7X;KªGûﬁV±ë˙1
ºf√qÎrJ]Ç…4Ê¯o;5˘öÈh
æ;¡l,{3K¸V]ù˚
HdÓï;ÑÏÅz™z±«h
‰;óHæeﬁh
——6¸'…;`
ÿˇR:˘≤zñy;Ÿ
†ÓKŸ»Œm/Åw6;ª
O©;êˇ˛åõ˙h
ÑËK1;≤‘h
// Shader generated by Niagara HLSL Translator
// SimStage[0] = ParticleSpawnUpdate
// SimStage[1] = Build Kernel Array
// SimStage[2] = Init Temporary Grid
// SimStage[3] = Initialize StartVelocity Grid
// SimStage[4] = Rasterize Particles
// SimStage[5] = Compute Boundary
// SimStage[6] = Extrapolate Velocity
// SimStage[7] = Compute Divergence
// SimStage[8] = Solve Pressure
// SimStage[9] = Project Pressure
// SimStage[10] = Extrapolate Velocities Again
// SimStage[11] = FLIP / PIC force
// SimStage[12] = Fill Rasterization Grid
// SimStage[13] = Smooth in X
// SimStage[14] = Smooth in Y
// SimStage[15] = Smooth in Z and Output
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
float4x4 Emitter_WorldToUnit;
float4x4 Emitter_WorldToLocal;
float4x4 Emitter_UnitToWorld;
float4x4 Emitter_LocalToWorld;
float3 Emitter_SimGrid_Velocity;
float Constants_Emitter_Grid3D_SetRTValues_Alpha;
float3 Constants_Emitter_Grid3D_ComputeBoundary_OffsetSamplePosition;
float Constants_Emitter_Grid3D_SetRTValues_Blue;
float3 Constants_Emitter_SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_StartVelocityGrid_StartVelocity;
float Constants_Emitter_Grid3D_SetRTValues_Green;
float3 Emitter_StartVelocityGrid_StartVelocity;
int Constants_Emitter_Grid3D_ConvolveAxis002_AttributeIndex;
float3 Constants_Emitter_Grid3D_FLIP_IntegrateParticleVelocity_Gravity;
int Constants_Emitter_Grid3D_ConvolveAxis_AttributeIndex;
float Emitter_dx;
float Emitter_DeltaTime;
int Emitter_Grid3D_InitializeConvolutionKernel_Radius;
float Emitter_TemporaryGrid_SimFloat;
float Constants_Emitter_SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_TemporaryGrid_SimFloat;
int Emitter_SimGrid_SimFloatIndex;
float Constants_Emitter_Grid3D_ComputeBoundary_dt;
int Constants_Emitter_Grid3D_ExtrapolateVelocity_ExtrapolationHalfWidth;
int Emitter_SimGrid_VelocityIndex;
float Constants_Emitter_SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_PressureGrid_Pressure;
float Emitter_PressureGrid_Pressure;
float Constants_Emitter_Grid3D_PressureIteration_Relaxation;
int Emitter_SimGrid_PressureIndex;
int Emitter_SimGrid_BoundaryIndex;
int Constants_Emitter_Grid3D_ExtrapolateVelocity001_ExtrapolationHalfWidth;
float Constants_Emitter_Grid3D_FLIP_ParticleUpdate_PicOrFlip;
float Emitter_RasterizationGrid3D_Initialize_dx;
int Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
float Constants_Emitter_RasterizationGrid_ParticleSource_RadiusMult;
int Constants_Emitter_Grid3D_ConvolveAxis001_AttributeIndex;
float Emitter_SDFGrid_SDF;
float Value;
float Boundary;
float BoundarySignedDistance;
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
float2 SpriteSize;
FParamMap0_SetVariables_4405CB544D551592967D60972962E8B8_Particles Particles;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter Emitter;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B_Transient Transient;
float dx;
int HalfBandwidth;
bool SourceIsLocalSpace;
float4x4 WorldToUnit;
float3 Position;
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
FParamMap0_OUTPUT_VAR_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_OUTPUT_VAR_Grid3D_ProjectPressure Grid3D_ProjectPressure;
float4 Value;
bool Resample;
float3 Unit;
float3 UnitPosition;
float3 WorldPos;
FParamMap0_Local_Grid3D_ComputeBoundary Grid3D_ComputeBoundary;
FParamMap0_Local_Grid3D_GetFluidAttribute Grid3D_GetFluidAttribute;
FParamMap0_Local_Grid3D_GetFluidAttribute001 Grid3D_GetFluidAttribute001;
FParamMap0_Local_Grid3D_GetFluidAttribute002 Grid3D_GetFluidAttribute002;
FParamMap0_Local_Grid3D_GetFluidAttribute003 Grid3D_GetFluidAttribute003;
FParamMap0_Local_Grid3D_GetFluidAttribute004 Grid3D_GetFluidAttribute004;
FParamMap0_Local_Grid3D_GetFluidAttribute005 Grid3D_GetFluidAttribute005;
FParamMap0_Local_Grid3D_SetRTValues Grid3D_SetRTValues;
bool KillParticles;
float Red;
float3 StartVelocity;
float dt;
float3 PressureGradient;
float Divergence;
int BoundaryIndex;
float4x4 WorldToLocal;
float4x4 LocalToWorld;
int VelocityIndex;
int Radius;
int ScalarIndex;
int VectorIndex;
bool OpenBoundaryASC43X;
bool OpenBoundaryASC43Y;
bool OpenBoundaryASC43Z;
bool OpenBoundaryASC45X;
bool OpenBoundaryASC45Y;
bool OpenBoundaryASC45Z;
float4x4 UnitToWorld;
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
FParamMap0_Grid3D_CreateConvolutionKernel Grid3D_CreateConvolutionKernel;
FParamMap0_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_Grid3D_FLIP_IntegrateParticleVelocity Grid3D_FLIP_IntegrateParticleVelocity;
FParamMap0_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
FParamMap0_Grid3D_FLIP_RasterizeParticles Grid3D_FLIP_RasterizeParticles;
FParamMap0_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_Grid3D_SetFluidAttribute Grid3D_SetFluidAttribute;
FParamMap0_Grid3D_SetFluidAttribute001 Grid3D_SetFluidAttribute001;
FParamMap0_Grid3D_SetFluidAttribute004 Grid3D_SetFluidAttribute004;
FParamMap0_Grid3D_SetRTValues Grid3D_SetRTValues;
FParamMap0_KillParticles KillParticles;
FParamMap0_Local Local;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_Particles Particles;
FParamMap0_RasterizationGrid_ParticleSource RasterizationGrid_ParticleSource;
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
#if ((SimulationStageIndex == 6)) // MapSimStage6_ExtrapolateVelocity
FParamMap0 MapSimStage6_ExtrapolateVelocity;
#endif // MapSimStage6_ExtrapolateVelocity
#if ((SimulationStageIndex == 7)) // MapSimStage7_ComputeDivergence
FParamMap0 MapSimStage7_ComputeDivergence;
#endif // MapSimStage7_ComputeDivergence
#if ((SimulationStageIndex == 8)) // MapSimStage8_SolvePressure
FParamMap0 MapSimStage8_SolvePressure;
#endif // MapSimStage8_SolvePressure
#if ((SimulationStageIndex == 9)) // MapSimStage9_ProjectPressure
FParamMap0 MapSimStage9_ProjectPressure;
#endif // MapSimStage9_ProjectPressure
#if ((SimulationStageIndex == 10)) // MapSimStage10_ExtrapolateVelocitiesAgain
FParamMap0 MapSimStage10_ExtrapolateVelocitiesAgain;
#endif // MapSimStage10_ExtrapolateVelocitiesAgain
#if ((SimulationStageIndex == 11)) // MapSimStage11_FLIP_PICforce
FParamMap0 MapSimStage11_FLIP_PICforce;
#endif // MapSimStage11_FLIP_PICforce
#if ((SimulationStageIndex == 12)) // MapSimStage12_FillRasterizationGrid
FParamMap0 MapSimStage12_FillRasterizationGrid;
#endif // MapSimStage12_FillRasterizationGrid
#if ((SimulationStageIndex == 13)) // MapSimStage13_SmoothinX
FParamMap0 MapSimStage13_SmoothinX;
#endif // MapSimStage13_SmoothinX
#if ((SimulationStageIndex == 14)) // MapSimStage14_SmoothinY
FParamMap0 MapSimStage14_SmoothinY;
#endif // MapSimStage14_SmoothinY
#if ((SimulationStageIndex == 15)) // MapSimStage15_SmoothinZandOutput
FParamMap0 MapSimStage15_SmoothinZandOutput;
#endif // MapSimStage15_SmoothinZandOutput
static float HackSpawnInterp = 1.0;
void Vector2DFromFloat_Emitter_Func(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func(inout FSimulationContext Context);
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func(inout FSimulationContext Context);
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_IndexX, int In_IndexY, float In_Value);
void CustomHlsl8E429BEDA6FFDF6616646834695C7AFFB789A28EEmitter_KernelGrid_Func(int In_Radius, inout FSimulationContext Context);
void Grid3D_CreateConvolutionKernel_Emitter_Func(inout FSimulationContext Context);
void SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TemporaryGrid(float3 In_Unit, out float3 Out_Index);
void Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SetGridValue_Emitter_TemporaryGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslAE1B01C8D56C8E591E2E00F56D05AA0612343857Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void CustomHlsl13139F734763FFDB244E46F448D8FCB56953C2AE_Func(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void CustomHlslD84F0F32C6F905105D36404BFE471C864441E3E4_Func(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute004_Emitter_Func(inout FSimulationContext Context);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void Grid3D_GetFluidAttribute001_Emitter_Func(inout FSimulationContext Context);
void SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_RasterizationGrid_velocity(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetFloatGridValue_Emitter_RasterizationGrid_velocity(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslE6C3AD36AB27769000AB8A30B8E6640719BB32B9Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity_Emitter_Func(inout FSimulationContext Context);
void SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute001_Emitter_Func(inout FSimulationContext Context);
void SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl6D87339BB8C619A275097EE5DB4C0F285C1D002BEmitter_SimGrid_Func(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
void Grid3D_ComputeDivergence_Emitter_Func(inout FSimulationContext Context);
void SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void Grid3D_GetFluidAttribute004_Emitter_Func(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void Grid3D_GetFluidAttribute005_Emitter_Func(inout FSimulationContext Context);
void CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_Func(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_Func(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl77EBA0E70519CA7D80C1148780A46DCB8AB97BE8_Func(float In_InFloat, out float Out_OutFloat);
void SaturateFloat_1TDCH1Q056DN8M0OQ7AXYXMQS_Func(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_Func(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_Func(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl397FEDD2D643B656C5F97273985D273FC6339AC3Emitter_PressureGridEmitter_TransientGrid_Func(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
void Grid3D_PressureIteration_Emitter_Func(inout FSimulationContext Context);
void SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl119C8635A167F49C532A68445D3482DD1ABC9309Emitter_PressureGrid_Func(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func(inout FSimulationContext Context);
void CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_Func(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_Func(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlsl15F3E9D225033AA589802B1846F2C8A0F4D41967Emitter_TransientGrid_Func(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
void Grid3D_ProjectPressure_Emitter_Func(inout FSimulationContext Context);
void SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute002_Emitter_Func(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute003_Emitter_Func(inout FSimulationContext Context);
void SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func(inout FSimulationContext Context);
void CustomHlslC84A2A6188386906804B2EE49E6D6BF381C2DC03Emitter_SimGridEmitter_TransientGrid_Func(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity001_Emitter_Func(inout FSimulationContext Context);
void SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func(inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TransientGrid(float3 In_Unit, out float3 Out_Index);
void CustomHlsl3BB0CF98FD181BC6D841384FB3D348E7DF02B4FF_Func(float In_Mask, out bool Out_IsInside);
void CustomHlslA5BAC85C74223CF12921FC47037CBC27ED899ACF_Func(float3 In_UnitPos, out float Out_ret);
void CustomHlslE53362504ED344D6493FF3727FB95C8D898ADAAA_Func(float In_Mask, out bool Out_IsInside);
void CustomHlsl4D6195C1C32D7632816D90101301C126692A3219_Func(float In_Mask, out bool Out_IsInside);
void SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_Emitter_Func(inout FSimulationContext Context);
void KillParticles_Emitter_Func(inout FSimulationContext Context);
void GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void TransformPosition_v2_0_73S8RKB1IAQWR7G6MGLDKUL3T_Func(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(int In_ParticleIndex, out bool Out_Valid, out float2 Out_Value);
void UnitToFloatIndex_Emitter_RasterizationGrid(float3 In_Unit, out float3 Out_Index);
void GetNumCells_Emitter_RasterizationGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void InterlockedMinFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslFCE55A9865D9ECBD68F142AA5A3925463D64673FEmitter_RasterizationGrid_Func(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
void RasterizationGrid_ParticleSource_Emitter_Func(inout FSimulationContext Context);
void GetNumCells_Emitter_KernelGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetFloatGridValue_Emitter_RasterizationGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void GetPreviousFloatValue_Emitter_KernelGrid_Attributek(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlslE32BA7C9FE24C1376C9BFAEC0D57B545BB613523Emitter_RasterizationGridEmitter_KernelGrid_Func(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis001_Emitter_Func(inout FSimulationContext Context);
void SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SDFGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(int In_IndexX, int In_IndexY, int In_IndexZ, float In_Value);
void GetNumCells_Emitter_SDFGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_Func(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
void Grid3D_ConvolveAxis_Emitter_Func(inout FSimulationContext Context);
void SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func(inout FSimulationContext Context);
void Grid3D_ConvolveAxis002_Emitter_Func(inout FSimulationContext Context);
void ExecToIndex_Emitter_SimRT(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetRTValues_Emitter_Func(inout FSimulationContext Context);
float GetSpawnInterpolation();
float2 Output1;
Output1.x = Context.MapSpawn.Vector2DFromFloat.Value;
Output1.y = Context.MapSpawn.Vector2DFromFloat.Value;
Out_Vec2 = Output1;
Context.MapSpawn.Particles.SpriteSize = Context.MapSpawn.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize;
float3 Result = Context.MapUpdate.Transient.PhysicsForce + Constants_Emitter_Grid3D_FLIP_IntegrateParticleVelocity_Gravity;
float3 Result1 = Result * Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result2 = Context.MapUpdate.Particles.Velocity + Result1;
Context.MapUpdate.Particles.Velocity = Result2;
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
int Constant4 = 0;
CustomHlsl8E429BEDA6FFDF6616646834695C7AFFB789A28EEmitter_KernelGrid_Func(Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius, Context);
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Constants_Emitter_SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_TemporaryGrid_SimFloat;
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Constants_Emitter_SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_StartVelocityGrid_StartVelocity;
// TransformBase
// Input - [ENiagaraCoordinateSpace Source Space;ENiagaraCoordinateSpace Destination Space;NiagaraMatrix LocalToWorldTransform;NiagaraMatrix WorldToLocalTransform;NiagaraBool bLocalSpace;]
// Output - [NiagaraBool bUseOriginal;NiagaraMatrix OutTransform;NiagaraBool LocalToWorld;]
int Constant10 = 0;
bool Result3 = NiagaraAll(In_SourceSpace == Constant10);
int Constant11 = 0;
bool Result4 = NiagaraAll(In_DestinationSpace == Constant11);
bool Result5 = Result3 && Result4;
int Constant12 = 1;
bool Result6 = NiagaraAll(In_SourceSpace == Constant12);
int Constant13 = 1;
bool Result7 = NiagaraAll(In_DestinationSpace == Constant13);
bool Result8 = Result6 && Result7;
bool Result9 = Result5 || Result8;
int Constant14 = 2;
bool Result10 = NiagaraAll(In_SourceSpace == Constant14);
int Constant15 = 2;
bool Result11 = NiagaraAll(In_DestinationSpace == Constant15);
bool Result12 = Result10 && Result11;
bool Result13 = Result9 || Result12;
bool Result14 = Result3 && Result11;
bool Result15 = Result10 && Result4;
bool Result16 = Result14 || Result15;
bool Result17 = In_bLocalSpace && Result16;
bool Result18 = Result13 || Result17;
bool Result19 = !In_bLocalSpace;
bool Result20 = Result3 && Result7;
bool Result21 = Result6 && Result4;
bool Result22 = Result20 || Result21;
bool Result23 = Result19 && Result22;
bool Result24 = Result18 || Result23;
bool Result25 = In_bLocalSpace && Result20;
bool Result26 = Result10 && Result7;
bool Result27 = Result25 || Result26;
bool Result28 = Result19 && Result15;
bool Result29 = Result27 || Result28;
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result24;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result29;
bool Constant9 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant9, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld, Context);
float3 Result30 = mul(float4(In_InPosition,1.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InPosition;
Vector_IfResult = Result30;
Out_OutPosition = Vector_IfResult;
bool Constant19 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal1;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform1;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld1;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant19, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal1, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform1, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld1, Context);
float3 Result32 = mul(float4(In_InVector,0.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result32;
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
int Constant6 = 0;
int Constant7 = 1;
bool Constant8 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_FuncOutput_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func(Context.MapSimStage4_RasterizeParticles.Particles.Position, Constant6, Constant7, Constant8, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_FuncOutput_OutPosition, Context);
float3 Result31 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_FuncOutput_OutPosition,1.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(Result31, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant16 = 0;
int Constant17 = 1;
bool Constant18 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_FuncOutput_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func(Context.MapSimStage4_RasterizeParticles.Particles.Velocity, Constant16, Constant17, Constant18, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_FuncOutput_OutVector, Context);
float3 Result33 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_FuncOutput_OutVector,0.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlslAE1B01C8D56C8E591E2E00F56D05AA0612343857Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result33, Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
int Constant20 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant21 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
int Constant22 = 0;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Resample = Constant22;
float3 Constant23 = float3(0,0,0);
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Unit = Constant23;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
Context.MapSimStage5_ComputeBoundary.Transient.SimFloat = Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
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
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float3 Output11;
Output11.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output11.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output11.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result34 = Output11 + Constants_Emitter_Grid3D_ComputeBoundary_OffsetSamplePosition;
float X;
float Y;
float Z;
X = Result34.x;
Y = Result34.y;
Z = Result34.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Constant30 = float3(0,0,0);
float3 Output12;
Output12.x = IndexToUnit_Emitter_SimGridOutput_Unit.x;
Output12.y = IndexToUnit_Emitter_SimGridOutput_Unit.y;
Output12.z = IndexToUnit_Emitter_SimGridOutput_Unit.z;
float3 Result35 = mul(float4(Output12,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Constant30;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos = Result35;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
int Constant31 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
float CustomHlsl13139F734763FFDB244E46F448D8FCB56953C2AE_FuncOutput_Boundary;
CustomHlsl13139F734763FFDB244E46F448D8FCB56953C2AE_Func(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant31, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlsl13139F734763FFDB244E46F448D8FCB56953C2AE_FuncOutput_Boundary);
float CustomHlslD84F0F32C6F905105D36404BFE471C864441E3E4_FuncOutput_RetBoundary;
CustomHlslD84F0F32C6F905105D36404BFE471C864441E3E4_Func(CustomHlsl13139F734763FFDB244E46F448D8FCB56953C2AE_FuncOutput_Boundary, Context.MapSimStage5_ComputeBoundary.Transient.Boundary, CustomHlslD84F0F32C6F905105D36404BFE471C864441E3E4_FuncOutput_RetBoundary);
float Constant32 = 1e+17;
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = CustomHlslD84F0F32C6F905105D36404BFE471C864441E3E4_FuncOutput_RetBoundary;
Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance = Constant32;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float X1;
float Y1;
float Z1;
X1 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.x;
Y1 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.y;
Z1 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.z;
float4 Output13;
Output13.x = X1;
Output13.y = Y1;
Output13.z = Z1;
Output13.w = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output13);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample To Another Grid"
int Constant33 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant34 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Logic OR (Static)/Logic OR (Static)->Result"
int Constant35 = 0;
Context.MapSimStage6_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Resample = Constant35;
float3 Constant36 = float3(0,0,0);
Context.MapSimStage6_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Unit = Constant36;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float3 Output14;
Output14.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Output14.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Output14.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Output15;
Output15 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity = Output14;
Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary = Output15;
Context.MapSimStage6_ExtrapolateVelocity.Transient.SolidVelocity = Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.SolidVelocity;
Context.MapSimStage6_ExtrapolateVelocity.Transient.Boundary = Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
Context.MapSimStage6_ExtrapolateVelocity.Transient.Boundary = Context.MapSimStage6_ExtrapolateVelocity.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary;
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
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlslE6C3AD36AB27769000AB8A30B8E6640719BB32B9Emitter_RasterizationGrid_velocityEmitter_TransientGrid_FuncOutput_OutVelocity;
CustomHlslE6C3AD36AB27769000AB8A30B8E6640719BB32B9Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constants_Emitter_Grid3D_ExtrapolateVelocity_ExtrapolationHalfWidth, Context.MapSimStage6_ExtrapolateVelocity.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.MapSimStage6_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlslE6C3AD36AB27769000AB8A30B8E6640719BB32B9Emitter_RasterizationGrid_velocityEmitter_TransientGrid_FuncOutput_OutVelocity);
Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlslE6C3AD36AB27769000AB8A30B8E6640719BB32B9Emitter_RasterizationGrid_velocityEmitter_TransientGrid_FuncOutput_OutVelocity;
Context.MapSimStage6_ExtrapolateVelocity.Emitter.SimGrid.Velocity = Context.MapSimStage6_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ);
SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_StartVelocityGridOutput_IndexZ, Context.MapSimStage6_ExtrapolateVelocity.Grid3D_SetFluidAttribute001.StartVelocity);
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
float CustomHlsl6D87339BB8C619A275097EE5DB4C0F285C1D002BEmitter_SimGrid_FuncOutput_Div;
CustomHlsl6D87339BB8C619A275097EE5DB4C0F285C1D002BEmitter_SimGrid_Func(Context.MapSimStage7_ComputeDivergence.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Context.MapSimStage7_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl6D87339BB8C619A275097EE5DB4C0F285C1D002BEmitter_SimGrid_FuncOutput_Div);
Context.MapSimStage7_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl6D87339BB8C619A275097EE5DB4C0F285C1D002BEmitter_SimGrid_FuncOutput_Div;
Context.MapSimStage7_ComputeDivergence.Emitter.PressureGrid.Pressure = Constants_Emitter_SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_PressureGrid_Pressure;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ1, Context.MapSimStage7_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample To Another Grid"
int Constant37 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant38 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Logic OR (Static)/Logic OR (Static)->Result"
int Constant39 = 0;
Context.MapSimStage8_SolvePressure.Local.Grid3D_GetFluidAttribute004.Resample = Constant39;
float3 Constant40 = float3(0,0,0);
Context.MapSimStage8_SolvePressure.Local.Grid3D_GetFluidAttribute004.Unit = Constant40;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1);
Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value1;
Context.MapSimStage8_SolvePressure.Transient.SimFloat = Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample To Another Grid"
int Constant41 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant42 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Logic OR (Static)/Logic OR (Static)->Result"
int Constant43 = 0;
Context.MapSimStage8_SolvePressure.Local.Grid3D_GetFluidAttribute005.Resample = Constant43;
float3 Constant44 = float3(0,0,0);
Context.MapSimStage8_SolvePressure.Local.Grid3D_GetFluidAttribute005.Unit = Constant44;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ3, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
Context.MapSimStage8_SolvePressure.Transient.Velocity = Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
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
// SimulationStageIterationInfo
// Output - [NiagaraInt32 Iteration Index;NiagaraInt32 Max Iterations;NiagaraFloat Normalized Iteration Index;NiagaraInt32 Loop Index;NiagaraInt32 Number Of Loops;NiagaraFloat Normalized Loop Index;]
int CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_IterationIndex;
int CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_MaxIterations;
float CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NormalizedIterationIndex;
int CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_LoopIndex;
int CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NumberOfLoops;
float CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NormalizedLoopIndex;
CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_Func(CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_IterationIndex, CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_MaxIterations, CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NormalizedIterationIndex, CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_LoopIndex, CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NumberOfLoops, CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NormalizedLoopIndex);
Out_IterationIndex = CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_IterationIndex;
Out_MaxIterations = CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_MaxIterations;
Out_NormalizedIterationIndex = CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NormalizedIterationIndex;
Out_LoopIndex = CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_LoopIndex;
Out_NumberOfLoops = CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlsl428D82E9D2A1116D5C547598CECB160AE6FC595C_FuncOutput_NormalizedLoopIndex;
Out_OutFloat = saturate (In_InFloat);
// SaturateFloat
// Emitter.SimulationTarget=1
// Script.Context=2
// Input - [NiagaraFloat Value;]
// Output - [NiagaraFloat Clamped Value;]
float CustomHlsl77EBA0E70519CA7D80C1148780A46DCB8AB97BE8_FuncOutput_OutFloat;
CustomHlsl77EBA0E70519CA7D80C1148780A46DCB8AB97BE8_Func(In_Value, CustomHlsl77EBA0E70519CA7D80C1148780A46DCB8AB97BE8_FuncOutput_OutFloat);
Out_ClampedValue = CustomHlsl77EBA0E70519CA7D80C1148780A46DCB8AB97BE8_FuncOutput_OutFloat;
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
int Constant45 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4);
int SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_IterationIndex;
int SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_MaxIterations;
float SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_NormalizedIterationIndex;
int SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_LoopIndex;
int SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_NumberOfLoops;
float SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_NormalizedLoopIndex;
SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_Func(SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_IterationIndex, SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_MaxIterations, SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_NormalizedIterationIndex, SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_LoopIndex, SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_NumberOfLoops, SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_NormalizedLoopIndex, Context);
float SaturateFloat_1TDCH1Q056DN8M0OQ7AXYXMQS_FuncOutput_ClampedValue;
SaturateFloat_1TDCH1Q056DN8M0OQ7AXYXMQS_Func(Constants_Emitter_Grid3D_PressureIteration_Relaxation, SaturateFloat_1TDCH1Q056DN8M0OQ7AXYXMQS_FuncOutput_ClampedValue, Context);
float4 CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_right;
float4 CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_left;
float4 CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_up;
float4 CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_down;
float4 CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_front;
float4 CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_back;
CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_Func(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_right, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_left, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_up, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_down, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_front, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_back);
float CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_right;
float CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_left;
float CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_up;
float CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_down;
float CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_front;
float CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_back;
CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_Func(CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_right, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_left, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_up, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_down, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_front, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_back, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_right, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_left, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_up, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_down, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_front, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_back);
float CustomHlsl397FEDD2D643B656C5F97273985D273FC6339AC3Emitter_PressureGridEmitter_TransientGrid_FuncOutput_Pressure;
CustomHlsl397FEDD2D643B656C5F97273985D273FC6339AC3Emitter_PressureGridEmitter_TransientGrid_Func(Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.dx, Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.Divergence, SimulationStageIterationInfo_5GI3PIGEWCBNQUGLHOOGIHQPJ_FuncOutput_IterationIndex, SaturateFloat_1TDCH1Q056DN8M0OQ7AXYXMQS_FuncOutput_ClampedValue, Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.Velocity, Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.Pressure, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_right, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_left, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_up, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_down, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_front, CustomHlslF3FC2134F23A43FC846592FCA4617C3D0ABA7D0C_FuncOutput_F_back, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_right, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_left, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_up, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_down, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_front, CustomHlsl82BC66ECB00BF9608BE4FD29132FA6CA92E3CADAEmitter_TransientGrid_FuncOutput_B_back, CustomHlsl397FEDD2D643B656C5F97273985D273FC6339AC3Emitter_PressureGridEmitter_TransientGrid_FuncOutput_Pressure);
Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlsl397FEDD2D643B656C5F97273985D273FC6339AC3Emitter_PressureGridEmitter_TransientGrid_FuncOutput_Pressure;
Context.MapSimStage8_SolvePressure.Emitter.PressureGrid.Pressure = Context.MapSimStage8_SolvePressure.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure;
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
float3 CustomHlsl119C8635A167F49C532A68445D3482DD1ABC9309Emitter_PressureGrid_FuncOutput_Grad;
CustomHlsl119C8635A167F49C532A68445D3482DD1ABC9309Emitter_PressureGrid_Func(Context.MapSimStage9_ProjectPressure.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.MapSimStage9_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex, CustomHlsl119C8635A167F49C532A68445D3482DD1ABC9309Emitter_PressureGrid_FuncOutput_Grad);
Context.MapSimStage9_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlsl119C8635A167F49C532A68445D3482DD1ABC9309Emitter_PressureGrid_FuncOutput_Grad;
Out_F_right = (int) round(In_B_right.w) == SOLID_CELL ? 1 : 0;
Out_F_left = (int) round(In_B_left.w) == SOLID_CELL ? 1 : 0;
Out_F_up = (int) round(In_B_up.w) == SOLID_CELL ? 1 : 0;
Out_F_down = (int) round(In_B_down.w) == SOLID_CELL ? 1 : 0;
Out_F_front = (int) round(In_B_front.w) == SOLID_CELL ? 1 : 0;
Out_F_back = (int) round(In_B_back.w) == SOLID_CELL ? 1 : 0;
Out_VelocityOut = In_Velocity;
int CellType_right = (int) round(In_B_right.w);
int CellType_left = (int) round(In_B_left.w);
Out_VelocityOut.x = lerp(Out_VelocityOut.x, In_B_left.x, In_F_left);
Out_VelocityOut.x = lerp(Out_VelocityOut.x, In_B_right.x, In_F_right);
int CellType_up  = (int) round(In_B_up.w);
int CellType_down  = (int) round(In_B_down.w);
Out_VelocityOut.y = lerp(Out_VelocityOut.y, In_B_down.y, In_F_down);
Out_VelocityOut.y = lerp(Out_VelocityOut.y, In_B_up.y, In_F_up);
int CellType_front  = (int) round(In_B_front.w);
int CellType_back  = (int) round(In_B_back.w);
Out_VelocityOut.z = lerp(Out_VelocityOut.z, In_B_front.z, In_F_front);
Out_VelocityOut.z = lerp(Out_VelocityOut.z, In_B_back.z, In_F_back);
    Out_VelocityOut = B_center.xyz;
//SetConstantByStaticVariable "/Grid 3D Project Pressure/Map Get/Map Get->Module.Use High Precision Collisions"
int Constant46 = 0;
float3 Result36 = Context.MapSimStage9_ProjectPressure.Grid3D_ProjectPressure.PressureGradient * Context.MapSimStage9_ProjectPressure.Grid3D_ProjectPressure.dt;
float3 Result37 = Context.MapSimStage9_ProjectPressure.Grid3D_ProjectPressure.Velocity - Result36;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5);
float4 CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_right;
float4 CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_left;
float4 CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_up;
float4 CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_down;
float4 CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_front;
float4 CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_back;
CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_Func(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_right, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_left, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_up, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_down, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_front, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_back);
float CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_right;
float CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_left;
float CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_up;
float CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_down;
float CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_front;
float CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_back;
CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_Func(CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_right, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_left, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_up, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_down, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_front, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_back, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_right, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_left, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_up, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_down, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_front, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_back);
float3 CustomHlsl15F3E9D225033AA589802B1846F2C8A0F4D41967Emitter_TransientGrid_FuncOutput_VelocityOut;
CustomHlsl15F3E9D225033AA589802B1846F2C8A0F4D41967Emitter_TransientGrid_Func(Result37, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_right, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_left, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_up, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_down, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_front, CustomHlslD4600C87131723D557EF18C037EE9302253B80B6_FuncOutput_F_back, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_right, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_left, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_up, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_down, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_front, CustomHlslD151D6C4E7194233F72DF54949CAEB377658567AEmitter_TransientGrid_FuncOutput_B_back, CustomHlsl15F3E9D225033AA589802B1846F2C8A0F4D41967Emitter_TransientGrid_FuncOutput_VelocityOut);
Context.MapSimStage9_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlsl15F3E9D225033AA589802B1846F2C8A0F4D41967Emitter_TransientGrid_FuncOutput_VelocityOut;
Context.MapSimStage9_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage9_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample To Another Grid"
int Constant47 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant48 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Logic OR (Static)/Logic OR (Static)->Result"
int Constant49 = 0;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Resample = Constant49;
float3 Constant50 = float3(0,0,0);
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Unit = Constant50;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1);
float3 Output16;
Output16.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.x;
Output16.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.y;
Output16.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.z;
float Output17;
Output17 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value1.w;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity = Output16;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary = Output17;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Transient.SolidVelocity = Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample To Another Grid"
int Constant51 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant52 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Logic OR (Static)/Logic OR (Static)->Result"
int Constant53 = 0;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Resample = Constant53;
float3 Constant54 = float3(0,0,0);
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Unit = Constant54;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ6, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1);
Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value1;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Transient.Velocity = Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage10_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Transient.Velocity = Context.MapSimStage10_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity;
Out_OutVelocity = In_Velocity;
            GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);
            Out_OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7);
int GetNumCells_Emitter_SimGridOutput_NumCellsX1;
int GetNumCells_Emitter_SimGridOutput_NumCellsY1;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ1;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float3 CustomHlslC84A2A6188386906804B2EE49E6D6BF381C2DC03Emitter_SimGridEmitter_TransientGrid_FuncOutput_OutVelocity;
CustomHlslC84A2A6188386906804B2EE49E6D6BF381C2DC03Emitter_SimGridEmitter_TransientGrid_Func(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7, Constants_Emitter_Grid3D_ExtrapolateVelocity001_ExtrapolationHalfWidth, Context.MapSimStage10_ExtrapolateVelocitiesAgain.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.MapSimStage10_ExtrapolateVelocitiesAgain.Transient.Velocity, Context.MapSimStage10_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.MapSimStage10_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlslC84A2A6188386906804B2EE49E6D6BF381C2DC03Emitter_SimGridEmitter_TransientGrid_FuncOutput_OutVelocity);
Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlslC84A2A6188386906804B2EE49E6D6BF381C2DC03Emitter_SimGridEmitter_TransientGrid_FuncOutput_OutVelocity;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity = Context.MapSimStage10_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
int Constant60 = 0;
bool Result38 = NiagaraAll(In_SourceSpace == Constant60);
int Constant61 = 0;
bool Result39 = NiagaraAll(In_DestinationSpace == Constant61);
bool Result40 = Result38 && Result39;
int Constant62 = 1;
bool Result41 = NiagaraAll(In_SourceSpace == Constant62);
int Constant63 = 1;
bool Result42 = NiagaraAll(In_DestinationSpace == Constant63);
bool Result43 = Result41 && Result42;
bool Result44 = Result40 || Result43;
int Constant64 = 2;
bool Result45 = NiagaraAll(In_SourceSpace == Constant64);
int Constant65 = 2;
bool Result46 = NiagaraAll(In_DestinationSpace == Constant65);
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
float4x4 Matrix_IfResult4;
Matrix_IfResult4 = In_LocalToWorldTransform;
Matrix_IfResult4 = In_WorldToLocalTransform;
Out_bUseOriginal = Result59;
Out_OutTransform = Matrix_IfResult4;
Out_LocalToWorld = Result64;
bool Constant59 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal2;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform2;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld2;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant59, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal2, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform2, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld2, Context);
float3 Result65 = mul(float4(In_InPosition,1.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InPosition;
Vector_IfResult2 = Result65;
Out_OutPosition = Vector_IfResult2;
Out_IsInside = round(In_Mask) ==2;
  In_UnitPos.z >= 0 && In_UnitPos.x <= 1 && 
In_UnitPos.y <= 1 && In_UnitPos.z <= 1;
Out_IsInside = In_Mask > 1e-7;
Out_IsInside = round(In_Mask) == 1;
bool Constant70 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult3;
Matrix_IfResult5 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal3;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform3;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld3;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult3, Constant70, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal3, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform3, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld3, Context);
float3 Result76 = mul(float4(In_InPosition,1.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InPosition;
Vector_IfResult3 = Result76;
Out_OutPosition = Vector_IfResult3;
bool Constant74 = false;
float4x4 Matrix_IfResult6;
float4x4 Matrix001_IfResult4;
Matrix_IfResult6 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal4;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform4;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld4;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult4, Constant74, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal4, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform4, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld4, Context);
float3 Result79 = mul(float4(In_InVector,0.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InVector;
Vector_IfResult4 = Result79;
Out_OutVector = Vector_IfResult4;
bool Constant78 = false;
float4x4 Matrix_IfResult7;
float4x4 Matrix001_IfResult5;
Matrix_IfResult7 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult7 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal5;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform5;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld5;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, Matrix_IfResult7, Matrix001_IfResult5, Constant78, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal5, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform5, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld5, Context);
float3 Result82 = mul(float4(In_InVector,0.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InVector;
Vector_IfResult5 = Result82;
Out_OutVector = Vector_IfResult5;
int Constant56 = 0;
int Constant57 = 1;
bool Constant58 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_FuncOutput_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func(Context.MapSimStage11_FLIP_PICforce.Particles.Position, Constant56, Constant57, Constant58, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_FuncOutput_OutPosition, Context);
float3 Output18;
Output18.x = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_FuncOutput_OutPosition.x;
Output18.y = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_FuncOutput_OutPosition.y;
Output18.z = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_FuncOutput_OutPosition.z;
float3 Result66 = mul(float4(((float3)Output18),1.0),Context.MapSimStage11_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TransientGridOutput_Index;
UnitToFloatIndex_Emitter_TransientGrid(Result66, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result67 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float X2;
float Y2;
float Z2;
X2 = Result67.x;
Y2 = Result67.y;
Z2 = Result67.z;
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(X2, Y2, Z2, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2);
float X3;
float Y3;
float Z3;
float W;
X3 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.x;
Y3 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.y;
Z3 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.z;
W = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.w;
bool CustomHlsl3BB0CF98FD181BC6D841384FB3D348E7DF02B4FF_FuncOutput_IsInside;
CustomHlsl3BB0CF98FD181BC6D841384FB3D348E7DF02B4FF_Func(W, CustomHlsl3BB0CF98FD181BC6D841384FB3D348E7DF02B4FF_FuncOutput_IsInside);
float3 Result68 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_FuncOutput_OutPosition,1.0),Context.MapSimStage11_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlslA5BAC85C74223CF12921FC47037CBC27ED899ACF_FuncOutput_ret;
CustomHlslA5BAC85C74223CF12921FC47037CBC27ED899ACF_Func(Result68, CustomHlslA5BAC85C74223CF12921FC47037CBC27ED899ACF_FuncOutput_ret);
bool CustomHlslE53362504ED344D6493FF3727FB95C8D898ADAAA_FuncOutput_IsInside;
CustomHlslE53362504ED344D6493FF3727FB95C8D898ADAAA_Func(CustomHlslA5BAC85C74223CF12921FC47037CBC27ED899ACF_FuncOutput_ret, CustomHlslE53362504ED344D6493FF3727FB95C8D898ADAAA_FuncOutput_IsInside);
bool Result69 = !CustomHlslE53362504ED344D6493FF3727FB95C8D898ADAAA_FuncOutput_IsInside;
bool Result70 = CustomHlsl3BB0CF98FD181BC6D841384FB3D348E7DF02B4FF_FuncOutput_IsInside || Result69;
float3 Result71 = Context.MapSimStage11_FLIP_PICforce.Particles.Velocity * Context.MapSimStage11_FLIP_PICforce.Engine.DeltaTime;
float3 Result72 = Context.MapSimStage11_FLIP_PICforce.Particles.Position + Result71;
bool CustomHlsl4D6195C1C32D7632816D90101301C126692A3219_FuncOutput_IsInside;
CustomHlsl4D6195C1C32D7632816D90101301C126692A3219_Func(W, CustomHlsl4D6195C1C32D7632816D90101301C126692A3219_FuncOutput_IsInside);
float3 Constant66 = float3(0,0,0);
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(Result68, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result73 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.MapSimStage11_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result74 = Result73 * Context.MapSimStage11_FLIP_PICforce.Engine.DeltaTime;
float3 Result75 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_FuncOutput_OutPosition + Result74;
int Constant67 = 1;
int Constant68 = 0;
bool Constant69 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_FuncOutput_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func(Result75, Constant67, Constant68, Constant69, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_FuncOutput_OutPosition, Context);
float3 SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(Result68, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result77 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.MapSimStage11_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result78 = Result73 - Result77;
int Constant71 = 0;
int Constant72 = 1;
bool Constant73 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_FuncOutput_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func(Context.MapSimStage11_FLIP_PICforce.Particles.Velocity, Constant71, Constant72, Constant73, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_FuncOutput_OutVector, Context);
float3 Result80 = Result78 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_FuncOutput_OutVector;
float3 Result81 = lerp(Result73,Result80,Constants_Emitter_Grid3D_FLIP_ParticleUpdate_PicOrFlip);
int Constant75 = 1;
int Constant76 = 0;
bool Constant77 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_FuncOutput_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func(Result81, Constant75, Constant76, Constant77, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_FuncOutput_OutVector, Context);
float3 Constant79 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult = Constant79;
float3 Constant80 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult = Constant80;
Position_SelectResult = Context.MapSimStage11_FLIP_PICforce.Particles.Position;
Velocity_SelectResult = Constant66;
Position_SelectResult = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_FuncOutput_OutPosition;
Velocity_SelectResult = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_FuncOutput_OutVector;
float3 Constant81 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult1 = Constant81;
float3 Constant82 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult1 = Constant82;
Position_SelectResult1 = Result72;
Velocity_SelectResult1 = Context.MapSimStage11_FLIP_PICforce.Particles.Velocity;
Position_SelectResult1 = Position_SelectResult;
Velocity_SelectResult1 = Velocity_SelectResult;
Context.MapSimStage11_FLIP_PICforce.Particles.Position = Position_SelectResult1;
Context.MapSimStage11_FLIP_PICforce.Particles.Velocity = Velocity_SelectResult1;
Context.MapSimStage11_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlslE53362504ED344D6493FF3727FB95C8D898ADAAA_FuncOutput_IsInside;
Context.MapSimStage11_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl4D6195C1C32D7632816D90101301C126692A3219_FuncOutput_IsInside;
bool Constant84 = false;
bool bool_IfResult;
bool_IfResult = Constant84;
bool_IfResult = Context.MapSimStage11_FLIP_PICforce.DataInstance.Alive;
Context.MapSimStage11_FLIP_PICforce.DataInstance.Alive = bool_IfResult;
int Constant98 = 0;
bool Result84 = NiagaraAll(In_SourceSpace == Constant98);
int Constant99 = 0;
bool Result85 = NiagaraAll(In_DestinationSpace == Constant99);
bool Result86 = Result84 && Result85;
int Constant100 = 1;
bool Result87 = NiagaraAll(In_SourceSpace == Constant100);
int Constant101 = 1;
bool Result88 = NiagaraAll(In_DestinationSpace == Constant101);
bool Result89 = Result87 && Result88;
bool Result90 = Result86 || Result89;
int Constant102 = 2;
bool Result91 = NiagaraAll(In_SourceSpace == Constant102);
int Constant103 = 2;
bool Result92 = NiagaraAll(In_DestinationSpace == Constant103);
bool Result93 = Result91 && Result92;
bool Result94 = Result90 || Result93;
bool Result95 = Result84 && Result92;
bool Result96 = Result91 && Result85;
bool Result97 = Result95 || Result96;
bool Result98 = In_bLocalSpace && Result97;
bool Result99 = Result94 || Result98;
bool Result100 = !In_bLocalSpace;
bool Result101 = Result84 && Result88;
bool Result102 = Result87 && Result85;
bool Result103 = Result101 || Result102;
bool Result104 = Result100 && Result103;
bool Result105 = Result99 || Result104;
bool Result106 = In_bLocalSpace && Result101;
bool Result107 = Result91 && Result88;
bool Result108 = Result106 || Result107;
bool Result109 = Result100 && Result96;
bool Result110 = Result108 || Result109;
float4x4 Matrix_IfResult8;
Matrix_IfResult8 = In_LocalToWorldTransform;
Matrix_IfResult8 = In_WorldToLocalTransform;
Out_bUseOriginal = Result105;
Out_OutTransform = Matrix_IfResult8;
Out_LocalToWorld = Result110;
// TransformPosition_v2_0
// Usage=Particle
// Emitter.Localspace_false
// Input - [NiagaraPosition Position;ENiagaraCoordinateSpace Source Space;ENiagaraCoordinateSpace Destination Space;NiagaraBool Apply Scale;NiagaraMatrix Engine.Owner.SystemLocalToWorld;NiagaraMatrix Engine.Owner.SystemWorldToLocal;NiagaraMatrix Engine.Owner.SystemLocalToWorldNoScale;NiagaraMatrix Engine.Owner.SystemWorldToLocalNoScale;]
// Output - [NiagaraPosition Position;]
float4x4 Constant95 = (float4x4)0;
float4x4 LocalToWorld_SelectResult2 = Constant95;
float4x4 Constant96 = (float4x4)0;
float4x4 WorldToLocal_SelectResult2 = Constant96;
LocalToWorld_SelectResult2 = Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult2 = Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult2 = Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult2 = Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant97 = false;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal6;
float4x4 TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform6;
bool TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld6;
TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_Func(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult2, WorldToLocal_SelectResult2, Constant97, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_bUseOriginal6, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform6, TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_LocalToWorld6, Context);
float3 Result111 = mul(float4(In_Position,1.0),TransformBase_DTMA6J3NWNLJD9A9PCEDWU9YX_FuncOutput_OutTransform6).xyz;
float3 Constant104 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult3 = Constant104;
NiagaraPosition_SelectResult3 = In_Position;
NiagaraPosition_SelectResult3 = Result111;
Out_Position = NiagaraPosition_SelectResult3;
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
int Constant86 = 0;
int Result83 = ExecIndex();
bool GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(Result83, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
int Constant87 = 2;
int Constant88 = 1;
bool Constant89 = false;
float4x4 Constant90 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant91 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant92 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant93 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant94 = false;
float3 TransformPosition_v2_0_73S8RKB1IAQWR7G6MGLDKUL3T_FuncOutput_Position;
TransformPosition_v2_0_73S8RKB1IAQWR7G6MGLDKUL3T_Func(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant87, Constant88, Constant89, Constant90, Constant91, Constant92, Constant93, TransformPosition_v2_0_73S8RKB1IAQWR7G6MGLDKUL3T_FuncOutput_Position, Context);
float3 Constant105 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult4 = Constant105;
NiagaraPosition_SelectResult4 = TransformPosition_v2_0_73S8RKB1IAQWR7G6MGLDKUL3T_FuncOutput_Position;
NiagaraPosition_SelectResult4 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
float3 Result112 = mul(float4(NiagaraPosition_SelectResult4,1.0),Context.MapSimStage12_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
float3 Output19;
Output19.x = Result112.x;
Output19.y = Result112.y;
Output19.z = Result112.z;
bool GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid;
float2 GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(Result83, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 UnitToFloatIndex_Emitter_RasterizationGridOutput_Index;
UnitToFloatIndex_Emitter_RasterizationGrid(Output19, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlslFCE55A9865D9ECBD68F142AA5A3925463D64673FEmitter_RasterizationGrid_Func(Output19, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.MapSimStage12_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx, Context.MapSimStage12_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth, Constants_Emitter_RasterizationGrid_ParticleSource_RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
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
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 001/Map Get/Map Get->Module.Axis"
int Constant106 = 0;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX, GetNumCells_Emitter_KernelGridOutput_NumCellsY);
int Constant107 = 1;
int Result113 = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant107;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1);
float3 Constant108 = float3(1,0,0);
float CustomHlslE32BA7C9FE24C1376C9BFAEC0D57B545BB613523Emitter_RasterizationGridEmitter_KernelGrid_FuncOutput_ConvolvedValue;
CustomHlslE32BA7C9FE24C1376C9BFAEC0D57B545BB613523Emitter_RasterizationGridEmitter_KernelGrid_Func(Result113, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1, Constant108, Constants_Emitter_Grid3D_ConvolveAxis001_AttributeIndex, CustomHlslE32BA7C9FE24C1376C9BFAEC0D57B545BB613523Emitter_RasterizationGridEmitter_KernelGrid_FuncOutput_ConvolvedValue);
Context.MapSimStage13_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlslE32BA7C9FE24C1376C9BFAEC0D57B545BB613523Emitter_RasterizationGridEmitter_KernelGrid_FuncOutput_ConvolvedValue;
Context.MapSimStage13_SmoothinX.Emitter.SDFGrid.SDF = Context.MapSimStage13_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
#if ((SimulationStageIndex == 14) || (SimulationStageIndex == 15)) // Multiple stages
  GetPreviousFloatValueAtIndex_Emitter_SDFGrid(CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
#endif // Multiple stages
//SetConstantByStaticVariable "/Grid 3D Convolve Axis/Map Get/Map Get->Module.Axis"
int Constant109 = 1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY1;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX1, GetNumCells_Emitter_KernelGridOutput_NumCellsY1);
int Constant110 = 1;
int Result114 = GetNumCells_Emitter_KernelGridOutput_NumCellsX1 - Constant110;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant111 = float3(0,1,0);
float CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_FuncOutput_ConvolvedValue;
CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_Func(Result114, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant111, Constants_Emitter_Grid3D_ConvolveAxis_AttributeIndex, CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_FuncOutput_ConvolvedValue);
Context.MapSimStage14_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_FuncOutput_ConvolvedValue;
Context.MapSimStage14_SmoothinY.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 002/Map Get/Map Get->Module.Axis"
int Constant112 = 2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY2;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX2, GetNumCells_Emitter_KernelGridOutput_NumCellsY2);
int Constant113 = 1;
int Result115 = GetNumCells_Emitter_KernelGridOutput_NumCellsX2 - Constant113;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ1;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1);
float3 Constant114 = float3(0,0,1);
float CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_FuncOutput_ConvolvedValue1;
CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_Func(Result115, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1, GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1, Constant114, Constants_Emitter_Grid3D_ConvolveAxis002_AttributeIndex, CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_FuncOutput_ConvolvedValue1);
Context.MapSimStage15_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl37AA544E58AB1084A71BCAA0CB79292DD56ED097Emitter_SDFGridEmitter_KernelGrid_FuncOutput_ConvolvedValue1;
float4 Output110;
Output110.r = Context.MapSimStage15_SmoothinZandOutput.Grid3D_SetRTValues.Red;
Output110.g = Constants_Emitter_Grid3D_SetRTValues_Green;
Output110.b = Constants_Emitter_Grid3D_SetRTValues_Blue;
Output110.a = Constants_Emitter_Grid3D_SetRTValues_Alpha;
Context.MapSimStage15_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value = Output110;
bool Constant115 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int Constant116 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant115, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.MapSimStage15_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
//Begin Spawn Script!
//Begin Initialize Parameter Map Defaults
float2 Constant = float2(0.0, 0.0);
Context.MapSpawn.Particles.SpriteSize = Constant;
float3 Constant1 = float3(0,0,0);
Context.MapSpawn.Particles.Velocity = Constant1;
//End Initialize Parameter Map Defaults
Context.MapSpawn.Vector2DFromFloat.Value = Context.MapSpawn.Emitter.dx;
float2 Vector2DFromFloat_Emitter_FuncOutput_Vec2;
Vector2DFromFloat_Emitter_Func(Vector2DFromFloat_Emitter_FuncOutput_Vec2, Context);
Context.MapSpawn.SetVariables_4405CB544D551592967D60972962E8B8.Particles.SpriteSize = Vector2DFromFloat_Emitter_FuncOutput_Vec2;
EnterStatScope(1 /**SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func*/);
SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func(Context);
ExitStatScope(/**SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func*/);
//End Spawn Script!
//Handle resetting previous values at the end of spawn so that they match outputs! (Needed for motion blur/etc)
HandlePreviousValuesForSpawn(Context);
// Begin HandleMissingDefaultValues
float3 Constant2 = float3(0,0,0);
Context.MapSpawn.Particles.Position = Constant2;
// End HandleMissingDefaultValues
//Begin Update Script!
RandomCounterDeterministic = 0;
Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt = Context.MapUpdate.Emitter.DeltaTime;
float3 Constant3 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant3;
EnterStatScope(2 /**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func*/);
Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func(Context);
ExitStatScope(/**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func*/);
//End Update Script!
//Begin Stage Script: MapSimStage1_BuildKernelArray!
Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius = Context.MapSimStage1_BuildKernelArray.Emitter.Grid3D_InitializeConvolutionKernel.Radius;
EnterStatScope(3 /**Grid3D_CreateConvolutionKernel_Emitter_Func*/);
Grid3D_CreateConvolutionKernel_Emitter_Func(Context);
ExitStatScope(/**Grid3D_CreateConvolutionKernel_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage1_BuildKernelArray
//Begin Stage Script: MapSimStage2_InitTemporaryGrid!
EnterStatScope(4 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage2_InitTemporaryGrid
//Begin Stage Script: MapSimStage3_InitializeStartVelocityGrid!
EnterStatScope(5 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage3_InitializeStartVelocityGrid
//Begin Stage Script: MapSimStage4_RasterizeParticles!
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToUnit;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToLocal;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_SimFloatIndex;
bool Constant5 = false;
EnterStatScope(6 /**Grid3D_FLIP_RasterizeParticles_Emitter_Func*/);
Grid3D_FLIP_RasterizeParticles_Emitter_Func(Context);
ExitStatScope(/**Grid3D_FLIP_RasterizeParticles_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage4_RasterizeParticles
//Begin Stage Script: MapSimStage5_ComputeBoundary!
EnterStatScope(7 /**Grid3D_GetFluidAttribute_Emitter_Func*/);
Grid3D_GetFluidAttribute_Emitter_Func(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute_Emitter_Func*/);
Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.SimFloat;
EnterStatScope(8 /**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func*/);
SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func(Context);
ExitStatScope(/**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func*/);
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld = Context.MapSimStage5_ComputeBoundary.Emitter.UnitToWorld;
bool Constant24 = false;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X = Constant24;
bool Constant25 = false;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X = Constant25;
bool Constant26 = false;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z = Constant26;
bool Constant27 = false;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z = Constant27;
bool Constant28 = false;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y = Constant28;
bool Constant29 = false;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y = Constant29;
EnterStatScope(9 /**Grid3D_ComputeBoundary_Emitter_Func*/);
Grid3D_ComputeBoundary_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ComputeBoundary_Emitter_Func*/);
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.Boundary;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
EnterStatScope(10 /**Grid3D_SetFluidAttribute004_Emitter_Func*/);
Grid3D_SetFluidAttribute004_Emitter_Func(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage5_ComputeBoundary
//Begin Stage Script: MapSimStage6_ExtrapolateVelocity!
EnterStatScope(11 /**Grid3D_GetFluidAttribute001_Emitter_Func*/);
Grid3D_GetFluidAttribute001_Emitter_Func(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute001_Emitter_Func*/);
Context.MapSimStage6_ExtrapolateVelocity.SetVariables_C70B065E4ACA60099D622884219EB2AC.Transient.Boundary = Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_GetFluidAttribute001.Boundary;
EnterStatScope(12 /**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func*/);
SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func(Context);
ExitStatScope(/**SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func*/);
Context.MapSimStage6_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex = Context.MapSimStage6_ExtrapolateVelocity.Emitter.SimGrid_SimFloatIndex;
EnterStatScope(13 /**Grid3D_ExtrapolateVelocity_Emitter_Func*/);
Grid3D_ExtrapolateVelocity_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity_Emitter_Func*/);
Context.MapSimStage6_ExtrapolateVelocity.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity = Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(14 /**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func*/);
SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func(Context);
ExitStatScope(/**SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_Func*/);
Context.MapSimStage6_ExtrapolateVelocity.Grid3D_SetFluidAttribute001.StartVelocity = Context.MapSimStage6_ExtrapolateVelocity.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity;
EnterStatScope(15 /**Grid3D_SetFluidAttribute001_Emitter_Func*/);
Grid3D_SetFluidAttribute001_Emitter_Func(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute001_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage6_ExtrapolateVelocity
//Begin Stage Script: MapSimStage7_ComputeDivergence!
Context.MapSimStage7_ComputeDivergence.Grid3D_ComputeDivergence.dx = Context.MapSimStage7_ComputeDivergence.Emitter.dx;
Context.MapSimStage7_ComputeDivergence.Grid3D_ComputeDivergence.VectorIndex = Context.MapSimStage7_ComputeDivergence.Emitter.SimGrid_VelocityIndex;
EnterStatScope(16 /**Grid3D_ComputeDivergence_Emitter_Func*/);
Grid3D_ComputeDivergence_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ComputeDivergence_Emitter_Func*/);
EnterStatScope(17 /**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func*/);
SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func(Context);
ExitStatScope(/**SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_Func*/);
Context.MapSimStage7_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat = Context.MapSimStage7_ComputeDivergence.OUTPUT_VAR.Grid3D_ComputeDivergence.Div;
EnterStatScope(18 /**Grid3D_SetFluidAttribute_Emitter_Func*/);
Grid3D_SetFluidAttribute_Emitter_Func(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage7_ComputeDivergence
//Begin Stage Script: MapSimStage8_SolvePressure!
EnterStatScope(19 /**Grid3D_GetFluidAttribute004_Emitter_Func*/);
Grid3D_GetFluidAttribute004_Emitter_Func(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute004_Emitter_Func*/);
EnterStatScope(20 /**Grid3D_GetFluidAttribute005_Emitter_Func*/);
Grid3D_GetFluidAttribute005_Emitter_Func(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute005_Emitter_Func*/);
Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.dx = Context.MapSimStage8_SolvePressure.Emitter.dx;
Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.dt = Context.MapSimStage8_SolvePressure.Emitter.DeltaTime;
Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.Divergence = Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.Pressure = Context.MapSimStage8_SolvePressure.Emitter.PressureGrid.Pressure;
Context.MapSimStage8_SolvePressure.Grid3D_PressureIteration.Velocity = Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity;
EnterStatScope(21 /**Grid3D_PressureIteration_Emitter_Func*/);
Grid3D_PressureIteration_Emitter_Func(Context);
ExitStatScope(/**Grid3D_PressureIteration_Emitter_Func*/);
Context.MapSimStage8_SolvePressure.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure = Context.MapSimStage8_SolvePressure.OUTPUT_VAR.Grid3D_PressureIteration.Pressure;
EnterStatScope(22 /**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func*/);
SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func(Context);
ExitStatScope(/**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage8_SolvePressure
//Begin Stage Script: MapSimStage9_ProjectPressure!
Context.MapSimStage9_ProjectPressure.Grid3D_ComputeGradient.dx = Context.MapSimStage9_ProjectPressure.Emitter.dx;
Context.MapSimStage9_ProjectPressure.Grid3D_ComputeGradient.ScalarIndex = Context.MapSimStage9_ProjectPressure.Emitter.SimGrid_PressureIndex;
EnterStatScope(23 /**Grid3D_ComputeGradient_Emitter_Func*/);
Grid3D_ComputeGradient_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ComputeGradient_Emitter_Func*/);
Context.MapSimStage9_ProjectPressure.Grid3D_ProjectPressure.PressureGradient = Context.MapSimStage9_ProjectPressure.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.MapSimStage9_ProjectPressure.Grid3D_ProjectPressure.dt = Context.MapSimStage9_ProjectPressure.Emitter.DeltaTime;
Context.MapSimStage9_ProjectPressure.Grid3D_ProjectPressure.Velocity = Context.MapSimStage9_ProjectPressure.Emitter.SimGrid.Velocity;
EnterStatScope(24 /**Grid3D_ProjectPressure_Emitter_Func*/);
Grid3D_ProjectPressure_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ProjectPressure_Emitter_Func*/);
Context.MapSimStage9_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity = Context.MapSimStage9_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity;
EnterStatScope(25 /**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func*/);
SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func(Context);
ExitStatScope(/**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage9_ProjectPressure
//Begin Stage Script: MapSimStage10_ExtrapolateVelocitiesAgain!
EnterStatScope(26 /**Grid3D_GetFluidAttribute002_Emitter_Func*/);
Grid3D_GetFluidAttribute002_Emitter_Func(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute002_Emitter_Func*/);
EnterStatScope(27 /**Grid3D_GetFluidAttribute003_Emitter_Func*/);
Grid3D_GetFluidAttribute003_Emitter_Func(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute003_Emitter_Func*/);
Context.MapSimStage10_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary = Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity = Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
EnterStatScope(28 /**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func*/);
SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func(Context);
ExitStatScope(/**SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func*/);
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.MapSimStage10_ExtrapolateVelocitiesAgain.Emitter.SimGrid_BoundaryIndex;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.MapSimStage10_ExtrapolateVelocitiesAgain.Emitter.SimGrid_VelocityIndex;
EnterStatScope(29 /**Grid3D_ExtrapolateVelocity001_Emitter_Func*/);
Grid3D_ExtrapolateVelocity001_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity001_Emitter_Func*/);
Context.MapSimStage10_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity = Context.MapSimStage10_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity;
EnterStatScope(30 /**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func*/);
SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func(Context);
ExitStatScope(/**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage10_ExtrapolateVelocitiesAgain
//Begin Stage Script: MapSimStage11_FLIP_PICforce!
Context.MapSimStage11_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.MapSimStage11_FLIP_PICforce.Emitter.LocalToWorld;
Context.MapSimStage11_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.MapSimStage11_FLIP_PICforce.Emitter.WorldToUnit;
bool Constant55 = false;
EnterStatScope(31 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func*/);
Context.MapSimStage11_FLIP_PICforce.KillParticles.KillParticles = Context.MapSimStage11_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant83 = true;
Context.MapSimStage11_FLIP_PICforce.DataInstance.Alive = Constant83;
EnterStatScope(32 /**KillParticles_Emitter_Func*/);
KillParticles_Emitter_Func(Context);
ExitStatScope(/**KillParticles_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage11_FLIP_PICforce
//Begin Stage Script: MapSimStage12_FillRasterizationGrid!
Context.MapSimStage12_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx = Context.MapSimStage12_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.dx;
Context.MapSimStage12_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth = Context.MapSimStage12_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.MapSimStage12_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit = Context.MapSimStage12_FillRasterizationGrid.Emitter.WorldToUnit;
bool Constant85 = false;
Context.MapSimStage12_FillRasterizationGrid.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant85;
EnterStatScope(33 /**RasterizationGrid_ParticleSource_Emitter_Func*/);
RasterizationGrid_ParticleSource_Emitter_Func(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage12_FillRasterizationGrid
//Begin Stage Script: MapSimStage13_SmoothinX!
EnterStatScope(34 /**Grid3D_ConvolveAxis001_Emitter_Func*/);
Grid3D_ConvolveAxis001_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func*/);
Context.MapSimStage13_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.MapSimStage13_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(35 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage13_SmoothinX
//Begin Stage Script: MapSimStage14_SmoothinY!
EnterStatScope(36 /**Grid3D_ConvolveAxis_Emitter_Func*/);
Grid3D_ConvolveAxis_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func*/);
Context.MapSimStage14_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(37 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage14_SmoothinY
//Begin Stage Script: MapSimStage15_SmoothinZandOutput!
EnterStatScope(38 /**Grid3D_ConvolveAxis002_Emitter_Func*/);
Grid3D_ConvolveAxis002_Emitter_Func(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func*/);
Context.MapSimStage15_SmoothinZandOutput.Grid3D_SetRTValues.Red = Context.MapSimStage15_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
EnterStatScope(39 /**Grid3D_SetRTValues_Emitter_Func*/);
Grid3D_SetRTValues_Emitter_Func(Context);
ExitStatScope(/**Grid3D_SetRTValues_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage15_SmoothinZandOutput
int2 Emitter_KernelGrid_NumCells;
float2 Emitter_KernelGrid_UnitToUV;
float2 Emitter_KernelGrid_CellSize;
float2 Emitter_KernelGrid_WorldBBoxSize;
Texture2DArray<float> Emitter_KernelGrid_Grid;
RWTexture2DArray<float> Emitter_KernelGrid_OutputGrid;
SamplerState Emitter_KernelGrid_GridSampler;
int4 Emitter_KernelGrid_AttributeIndices[1];
int Emitter_KernelGrid_NumAttributes;
// Copyright Epic Games, Inc. All Rights Reserved.
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
// identify the lower-left-hand corner of the cell
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
float3 GridPos = float3(TotalDim[0] * UVW[0] - 0.5,  TotalDim[1] * UVW[1] - 0.5, TotalDim[2] * UVW[2] - 0.5f);
int3 GridCell = floor(GridPos);
float3 delta = float3( GridPos[0] - GridCell[0], GridPos[1] - GridCell[1], GridPos[2] - GridCell[2]);
// local values
float4 F; 
// bottom face
F[0] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
// bottom value
float BV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// top face
F[0] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_TemporaryGrid_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
// top value
float TV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// interp between bottom and top
return TV * delta.z + BV * (1.-delta.z);
int3 LocalCell = GridCell % Emitter_TemporaryGrid_NumCells;
const int3 MaxCell = Emitter_TemporaryGrid_NumCells - int3(2,2,2);
// revert to trilinear hardware sampling at the boundary cells.
return Emitter_TemporaryGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
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
DataInX[xi] = Emitter_TemporaryGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
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
float4x3 DataInZ;
float3 minv = 3.402823466e+38;
float3 maxv = -3.402823466e+38;
float4x3  DataInY;
float4x3 DataInX;
DataInX[xi] = Emitter_StartVelocityGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
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
DataInX[xi] = Emitter_SimGrid_Grid.Load(int4(col, row, plane, MipLevel)); 
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
int4 Emitter_TransientGrid_AttributeIndices[1];
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
int In_AttributeIndex = 0;
Emitter_KernelGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Out_NumCellsX = Emitter_KernelGrid_NumCells.x;
Out_NumCellsY = Emitter_KernelGrid_NumCells.y;
Out_Val = Emitter_KernelGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
Out_IndexX = GDispatchThreadId.x;
Out_IndexY = GDispatchThreadId.y;
Out_IndexZ = GDispatchThreadId.z;
const uint Linear = GLinearThreadId;
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
Emitter_RasterizationGrid_velocity_OutputIntGrid[Index] = NewValue;
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
Out_IndexX = Linear % Emitter_SimGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_SimGrid_NumCells.x) % Emitter_SimGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_SimGrid_NumCells.x * Emitter_SimGrid_NumCells.y);
Out_Unit = (float3(In_IndexX, In_IndexY, In_IndexZ) + .5) * Emitter_SimGrid_UnitToUV;
Out_NumCellsX = Emitter_SimGrid_NumCells.x;
Out_NumCellsY = Emitter_SimGrid_NumCells.y;
Out_NumCellsZ = Emitter_SimGrid_NumCells.z;
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
Out_IndexX = Linear % Emitter_TransientGrid_NumCells.x;
Out_IndexY = (Linear / Emitter_TransientGrid_NumCells.x) % Emitter_TransientGrid_NumCells.y;
Out_IndexZ = Linear / (Emitter_TransientGrid_NumCells.x * Emitter_TransientGrid_NumCells.y);
Emitter_TransientGrid_OutputGrid[float3(IndexX, IndexY, IndexZ)].rgba = Value;
Value = Emitter_TransientGrid_Grid.Load(int4(IndexX, IndexY, IndexZ, 0)).rgba;
Out_Index = In_Unit * Emitter_TransientGrid_NumCells - .5;
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
SetupFromIterationSource_MapSimStage1_BuildKernelArray_GeneratedSetup_Func(Context);
//Generated by UNiagaraDataInterfaceGrid2DCollection::GenerateTeardownHLSL
TeardownFromIterationSource_MapSimStage1_BuildKernelArray_GeneratedTeardown_Func(Context);
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateSetupHLSL
// Argument Name "TargetDataInterface" Type "NiagaraDataInterfaceGrid3DCollection"
SetupFromIterationSource_MapSimStage2_InitTemporaryGrid_GeneratedSetup_Func(Context);
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateTeardownHLSL
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateIterationSourceNamespaceWriteAttributesHLSL
int CurrAttributeIndex;
int X, Y, Z;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(X, Y, Z);
// Name "Emitter.TemporaryGrid.SimFloat" Type "NiagaraFloat" Var "Map.Emitter.TemporaryGrid.SimFloat"
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(X, Y, Z,  Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat);
TeardownFromIterationSource_MapSimStage2_InitTemporaryGrid_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage2_InitTemporaryGrid_GeneratedWriteAttributesEmitter_TemporaryGrid_Func(Context);
SetupFromIterationSource_MapSimStage3_InitializeStartVelocityGrid_GeneratedSetup_Func(Context);
ExecutionIndexToGridIndex_Emitter_StartVelocityGrid(X, Y, Z);
// Name "Emitter.StartVelocityGrid.StartVelocity" Type "Vector3f" Var "Map.Emitter.StartVelocityGrid.StartVelocity"
SetVectorValue_Emitter_StartVelocityGrid_UEImpureCall_AttributeStartVelocity(X, Y, Z,  Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity);
TeardownFromIterationSource_MapSimStage3_InitializeStartVelocityGrid_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage3_InitializeStartVelocityGrid_GeneratedWriteAttributesEmitter_StartVelocityGrid_Func(Context);
SetupFromIterationSource_MapSimStage5_ComputeBoundary_GeneratedSetup_Func(Context);
TeardownFromIterationSource_MapSimStage5_ComputeBoundary_GeneratedTeardown_Func(Context);
SetupFromIterationSource_MapSimStage6_ExtrapolateVelocity_GeneratedSetup_Func(Context);
ExecutionIndexToGridIndex_Emitter_SimGrid(X, Y, Z);
// Name "Emitter.SimGrid.Velocity" Type "Vector3f" Var "Map.Emitter.SimGrid.Velocity"
SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Z,  Context.MapSimStage6_ExtrapolateVelocity.Emitter.SimGrid.Velocity);
TeardownFromIterationSource_MapSimStage6_ExtrapolateVelocity_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage6_ExtrapolateVelocity_GeneratedWriteAttributesEmitter_SimGrid_Func(Context);
SetupFromIterationSource_MapSimStage7_ComputeDivergence_GeneratedSetup_Func(Context);
ExecutionIndexToGridIndex_Emitter_PressureGrid(X, Y, Z);
// Name "Emitter.PressureGrid.Pressure" Type "NiagaraFloat" Var "Map.Emitter.PressureGrid.Pressure"
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(X, Y, Z,  Context.MapSimStage7_ComputeDivergence.Emitter.PressureGrid.Pressure);
TeardownFromIterationSource_MapSimStage7_ComputeDivergence_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage7_ComputeDivergence_GeneratedWriteAttributesEmitter_PressureGrid_Func(Context);
//Generated by UNiagaraDataInterfaceGrid3DCollection::GenerateIterationSourceNamespaceReadAttributesHLSL
// Variable Name "Emitter.PressureGrid.Pressure" Type "NiagaraFloat" Var "Map.Emitter.PressureGrid.Pressure"
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(X, Y, Z, Context.MapSimStage8_SolvePressure.Emitter.PressureGrid.Pressure);
SetupFromIterationSource_MapSimStage8_SolvePressure_GeneratedSetup_Func(Context);
SetupFromIterationSource_MapSimStage8_SolvePressure_GeneratedReadAttributesEmitter_PressureGrid_Func(Context);
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(X, Y, Z,  Context.MapSimStage8_SolvePressure.Emitter.PressureGrid.Pressure);
TeardownFromIterationSource_MapSimStage8_SolvePressure_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage8_SolvePressure_GeneratedWriteAttributesEmitter_PressureGrid_Func(Context);
// Variable Name "Emitter.SimGrid.Velocity" Type "Vector3f" Var "Map.Emitter.SimGrid.Velocity"
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(X, Y, Z, Context.MapSimStage9_ProjectPressure.Emitter.SimGrid.Velocity);
SetupFromIterationSource_MapSimStage9_ProjectPressure_GeneratedSetup_Func(Context);
SetupFromIterationSource_MapSimStage9_ProjectPressure_GeneratedReadAttributesEmitter_SimGrid_Func(Context);
SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Z,  Context.MapSimStage9_ProjectPressure.Emitter.SimGrid.Velocity);
TeardownFromIterationSource_MapSimStage9_ProjectPressure_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage9_ProjectPressure_GeneratedWriteAttributesEmitter_SimGrid_Func(Context);
SetupFromIterationSource_MapSimStage10_ExtrapolateVelocitiesAgain_GeneratedSetup_Func(Context);
SetVectorValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Z,  Context.MapSimStage10_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity);
TeardownFromIterationSource_MapSimStage10_ExtrapolateVelocitiesAgain_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage10_ExtrapolateVelocitiesAgain_GeneratedWriteAttributesEmitter_SimGrid_Func(Context);
SetupFromIterationSource_MapSimStage13_SmoothinX_GeneratedSetup_Func(Context);
ExecutionIndexToGridIndex_Emitter_SDFGrid(X, Y, Z);
// Name "Emitter.SDFGrid.SDF" Type "NiagaraFloat" Var "Map.Emitter.SDFGrid.SDF"
SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(X, Y, Z,  Context.MapSimStage13_SmoothinX.Emitter.SDFGrid.SDF);
TeardownFromIterationSource_MapSimStage13_SmoothinX_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage13_SmoothinX_GeneratedWriteAttributesEmitter_SDFGrid_Func(Context);
SetupFromIterationSource_MapSimStage14_SmoothinY_GeneratedSetup_Func(Context);
SetFloatValue_Emitter_SDFGrid_UEImpureCall_AttributeSDF(X, Y, Z,  Context.MapSimStage14_SmoothinY.Emitter.SDFGrid.SDF);
TeardownFromIterationSource_MapSimStage14_SmoothinY_GeneratedTeardown_Func(Context);
TeardownFromIterationSource_MapSimStage14_SmoothinY_GeneratedWriteAttributesEmitter_SDFGrid_Func(Context);
Context.MapSpawn.Emitter.dx = Emitter_dx;
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
Context.MapSimStage6_ExtrapolateVelocity.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.MapSimStage7_ComputeDivergence.Emitter.dx = Emitter_dx;
Context.MapSimStage7_ComputeDivergence.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage7_ComputeDivergence.Emitter.PressureGrid.Pressure = Emitter_PressureGrid_Pressure;
Context.MapSimStage8_SolvePressure.Emitter.dx = Emitter_dx;
Context.MapSimStage8_SolvePressure.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage8_SolvePressure.Emitter.PressureGrid.Pressure = Emitter_PressureGrid_Pressure;
Context.MapSimStage9_ProjectPressure.Emitter.dx = Emitter_dx;
Context.MapSimStage9_ProjectPressure.Emitter.SimGrid_PressureIndex = Emitter_SimGrid_PressureIndex;
Context.MapSimStage9_ProjectPressure.Emitter.DeltaTime = Emitter_DeltaTime;
Context.MapSimStage9_ProjectPressure.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Emitter.SimGrid_BoundaryIndex = Emitter_SimGrid_BoundaryIndex;
Context.MapSimStage10_ExtrapolateVelocitiesAgain.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage11_FLIP_PICforce.Emitter.LocalToWorld = Emitter_LocalToWorld;
Context.MapSimStage11_FLIP_PICforce.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapSimStage11_FLIP_PICforce.Engine.DeltaTime = Engine_DeltaTime;
Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSimStage11_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSimStage12_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.dx = Emitter_RasterizationGrid3D_Initialize_dx;
Context.MapSimStage12_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth = Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
Context.MapSimStage12_FillRasterizationGrid.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSimStage12_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSimStage13_SmoothinX.Emitter.SDFGrid.SDF = Emitter_SDFGrid_SDF;
Context.MapSimStage14_SmoothinY.Emitter.SDFGrid.SDF = Emitter_SDFGrid_SDF;
Context.MapSimStage15_SmoothinZandOutput.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapSimStage15_SmoothinZandOutput.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSimStage15_SmoothinZandOutput.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapSimStage15_SmoothinZandOutput.Engine.System.RandomSeed = Engine_System_RandomSeed;
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
#elif ((SimulationStageIndex == 6)) // MapSimStage6_ExtrapolateVelocity
SetupFromIterationSource_MapSimStage6_ExtrapolateVelocity(Context);
#elif ((SimulationStageIndex == 7)) // MapSimStage7_ComputeDivergence
SetupFromIterationSource_MapSimStage7_ComputeDivergence(Context);
#elif ((SimulationStageIndex == 8)) // MapSimStage8_SolvePressure
SetupFromIterationSource_MapSimStage8_SolvePressure(Context);
#elif ((SimulationStageIndex == 9)) // MapSimStage9_ProjectPressure
SetupFromIterationSource_MapSimStage9_ProjectPressure(Context);
#elif ((SimulationStageIndex == 10)) // MapSimStage10_ExtrapolateVelocitiesAgain
SetupFromIterationSource_MapSimStage10_ExtrapolateVelocitiesAgain(Context);
#elif ((SimulationStageIndex == 11)) // MapSimStage11_FLIP_PICforce
Context.MapSimStage11_FLIP_PICforce.Array.Position = 0;
Context.MapSimStage11_FLIP_PICforce.Particles.Position.x = InputDataFloat(0, 0, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Particles.Position.y = InputDataFloat(0, 1, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Particles.Position.z = InputDataFloat(0, 2, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Array.SpriteSize = 3;
Context.MapSimStage11_FLIP_PICforce.Particles.SpriteSize.x = InputDataFloat(0, 3, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Particles.SpriteSize.y = InputDataFloat(0, 4, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Array.UniqueID = 0;
Context.MapSimStage11_FLIP_PICforce.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Array.Velocity = 5;
Context.MapSimStage11_FLIP_PICforce.Particles.Velocity.x = InputDataFloat(0, 5, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Particles.Velocity.y = InputDataFloat(0, 6, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.Particles.Velocity.z = InputDataFloat(0, 7, InstanceIdx);
Context.MapSimStage11_FLIP_PICforce.DataInstance.Alive=true;
Context.MapSimStage11_FLIP_PICforce.Engine.Emitter.ID.ID = 0;
#elif ((SimulationStageIndex == 12)) // MapSimStage12_FillRasterizationGrid
Context.MapSimStage12_FillRasterizationGrid.Array.Position = 0;
Context.MapSimStage12_FillRasterizationGrid.Particles.Position.x = InputDataFloat(0, 0, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Particles.Position.y = InputDataFloat(0, 1, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Particles.Position.z = InputDataFloat(0, 2, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Array.SpriteSize = 3;
Context.MapSimStage12_FillRasterizationGrid.Particles.SpriteSize.x = InputDataFloat(0, 3, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Particles.SpriteSize.y = InputDataFloat(0, 4, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Array.UniqueID = 0;
Context.MapSimStage12_FillRasterizationGrid.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Array.Velocity = 5;
Context.MapSimStage12_FillRasterizationGrid.Particles.Velocity.x = InputDataFloat(0, 5, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Particles.Velocity.y = InputDataFloat(0, 6, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.Particles.Velocity.z = InputDataFloat(0, 7, InstanceIdx);
Context.MapSimStage12_FillRasterizationGrid.DataInstance.Alive=true;
Context.MapSimStage12_FillRasterizationGrid.Engine.Emitter.ID.ID = 0;
#elif ((SimulationStageIndex == 13)) // MapSimStage13_SmoothinX
SetupFromIterationSource_MapSimStage13_SmoothinX(Context);
#elif ((SimulationStageIndex == 14)) // MapSimStage14_SmoothinY
SetupFromIterationSource_MapSimStage14_SmoothinY(Context);
Context.MapUpdate.Particles = Context.MapSpawn.Particles;
#elif ((SimulationStageIndex == 15)) // MapSimStage15_SmoothinZandOutput
const bool bValid = bIsValidInstance;
const int WriteIndex = OutputIndex(0, false, bValid);
OutputDataFloat(0, 0, WriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 1, WriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 2, WriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 3, WriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 4, WriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataInt(0, 0, WriteIndex, Context.MapUpdate.Particles.UniqueID);
OutputDataFloat(0, 5, WriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 6, WriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 7, WriteIndex, Context.MapUpdate.Particles.Velocity.z);
// If a stage doesn't kill particles, StoreUpdateVariables() never calls AcquireIndex(), so the
// count isn't updated. In that case we must manually copy the original count here.
RWInstanceCounts[WriteInstanceCountOffset] = GSpawnStartInstance + NumSpawnedInstances; 
TeardownFromIterationSource_MapSimStage1_BuildKernelArray(Context);
TeardownFromIterationSource_MapSimStage2_InitTemporaryGrid(Context);
TeardownFromIterationSource_MapSimStage3_InitializeStartVelocityGrid(Context);
TeardownFromIterationSource_MapSimStage5_ComputeBoundary(Context);
TeardownFromIterationSource_MapSimStage6_ExtrapolateVelocity(Context);
TeardownFromIterationSource_MapSimStage7_ComputeDivergence(Context);
TeardownFromIterationSource_MapSimStage8_SolvePressure(Context);
TeardownFromIterationSource_MapSimStage9_ProjectPressure(Context);
TeardownFromIterationSource_MapSimStage10_ExtrapolateVelocitiesAgain(Context);
const bool bValid = bIsValidInstance && Context.MapSimStage11_FLIP_PICforce.DataInstance.Alive;
const int WriteIndex = OutputIndex(0, true, bValid);
OutputDataFloat(0, 0, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.Position.x);
OutputDataFloat(0, 1, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.Position.y);
OutputDataFloat(0, 2, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.Position.z);
OutputDataFloat(0, 3, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.SpriteSize.x);
OutputDataFloat(0, 4, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.SpriteSize.y);
OutputDataInt(0, 0, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.UniqueID);
OutputDataFloat(0, 5, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.Velocity.x);
OutputDataFloat(0, 6, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.Velocity.y);
OutputDataFloat(0, 7, WriteIndex, Context.MapSimStage11_FLIP_PICforce.Particles.Velocity.z);
TeardownFromIterationSource_MapSimStage13_SmoothinX(Context);
TeardownFromIterationSource_MapSimStage14_SmoothinY(Context);
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
#elif SimulationStageIndex == 6 // MapSimStage6_ExtrapolateVelocity
SimulateMapSimStage6_ExtrapolateVelocity(Context);
#elif SimulationStageIndex == 7 // MapSimStage7_ComputeDivergence
SimulateMapSimStage7_ComputeDivergence(Context);
#elif SimulationStageIndex == 8 // MapSimStage8_SolvePressure
SimulateMapSimStage8_SolvePressure(Context);
#elif SimulationStageIndex == 9 // MapSimStage9_ProjectPressure
SimulateMapSimStage9_ProjectPressure(Context);
#elif SimulationStageIndex == 10 // MapSimStage10_ExtrapolateVelocitiesAgain
SimulateMapSimStage10_ExtrapolateVelocitiesAgain(Context);
#elif SimulationStageIndex == 11 // MapSimStage11_FLIP_PICforce
SimulateMapSimStage11_FLIP_PICforce(Context);
#elif SimulationStageIndex == 12 // MapSimStage12_FillRasterizationGrid
SimulateMapSimStage12_FillRasterizationGrid(Context);
#elif SimulationStageIndex == 13 // MapSimStage13_SmoothinX
SimulateMapSimStage13_SmoothinX(Context);
#elif SimulationStageIndex == 14 // MapSimStage14_SmoothinY
SimulateMapSimStage14_SmoothinY(Context);
#elif SimulationStageIndex == 15 // MapSimStage15_SmoothinZandOutput
SimulateMapSimStage15_SmoothinZandOutput(Context);
ˇ†LœZ;Ár
%∞2Çø;
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(h
_\õ=õ):;l˙<
ñ6sôRsHüeß;ÄÃSá
ñ6sôRsHüeß;ÄÃSá@
T5`;BºÎ8
‰S∫Ì=M9O†<ù.Ü;mî
ád˘Ôn;…G¶ﬁ=m˙ÄD(h
ád˘Ôn;…G¶ﬁ=m˙ÄD(
ád˘Ôn;…G¶ﬁ=m˙ÄD(¨
Z◊;∫Äc
Z◊;∫Äc@
é∆"B—˛#C¨®»¿HE;9h
 i≠•⁄VHÅ
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„Eh
€@Ç8{;¸¡´âh
A6¨A@ä≈s∫Èœ;Bh
—}FVéBÖ&;æo,ô0h
l;ÆPåq
xì;ö©\?Nñ∫/hÑ
m¢òË7à;O±ÆzÔVÄ
¡É*ûóˆ•Ä.;ƒ—


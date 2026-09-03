Ãjg\–0%DãÕÕ¸˝;
o¿†∫øÓAΩç;
’+8≤÷B≥7;Ω´
[lƒ^ºô;F∑È…Dü=F‰±
Hep:FIûe;EœÁ€!±
p;!2*N´Hó7
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
∞J‰0µjXZnµ;0±
ò&;Xq"£±
ˇú;oF%1Cûl
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
;®Âl‰˚D¨è\•—Yß€/a<eE±
€v·;˝ÏÔæV ⁄-ªﬁj90dê
£es;¢+¸D≥üw:Uâ¶o˘
£es;¢+¸D≥üw:Uâ¶o¯
8ö«Õ>;L
‹;ÇøÅZTEÆóÙi∏r‡
 ‚ÖL£;âŸ*f@
/9$¸;Ü‰AÑ¢Ñ©6
O;ijaxKj¶ Í
 a´õRÍ
Ìú[x{;9ô@±
π?Åv⁄-;á~°J
∂©;èÖ∞¶JãseÜ?è"ç˘
∂©;èÖ∞¶JãseÜ?è"ç¯
;Ø§€>y
™JCÄ(;=…
»}Oc P;Lãt?-ì◊BÍL
‰‹C¥Á¯∏;p
¡∂Ká;¸L
ú?;R9L
ÎÎ≠V;:Âﬂ¸
K®˛Ú‚(;Gâ±≥iƒ
˝Üp;Æ∑
mx±;gWªJêR
ôÎE∂ê$]ﬂ;sT¯í˘I
-° 4È}è;∞
f¥≤˙ªÆ;o
⁄*tD<;úEì&É
fπ∏NêX´;M°˛Ω±
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊7
·Ä;2Kx+J≤Bè§]â‹#Á
s;Mi”DÅéÄµó«RËÁ
öc,„( ÒCí;˙™gÊN1Á
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
cMäI#í;…Ï£‘
—Xd°JeG∏;(
¶Kôv›9;Ûÿ‡Æ
GºïEçq5¶wqû›;
Â;NiÈaûMâ¿
;[Ç‚&ñGå;íã-÷(W
Â;µ•‹Mßqè‹
SWµÀ]g√Lß$;
˝Æw˚Ê©˘GèÀ¡}AXl;
≠J;P∞„Dó∞-˘ˇ)≥j
úÚ…˘KfÃK´‡·ªis≤;
;ÄÁË…—KJô
ﬁJΩu&ÑkU„;&
ﬁJΩu&ÑkU„;
—Ì7;GΩ
ﬁJΩu&ÑkU„;Ö
‡gYßÖ¯Hê");rÆ◊\
‡gYßÖ¯Hê");rÆ◊\ﬂ
ﬁJΩu&ÑkU„;$
‡gYßÖ¯Hê");rÆ◊\%
ﬁJΩu&ÑkU„;*
‡gYßÖ¯Hê");rÆ◊\+
ﬁJΩu&ÑkU„;0
‡gYßÖ¯Hê");rÆ◊\1
ﬁJΩu&ÑkU„;6
‡gYßÖ¯Hê");rÆ◊\7
„Q1yﬂ‘;
r6¢{¶BçŒ!¿ùÅö.;
ﬁJΩu&ÑkU„;<
‡gYßÖ¯Hê");rÆ◊\=
ﬁJΩu&ÑkU„;B
‡gYßÖ¯Hê");rÆ◊\C
ﬁJΩu&ÑkU„;H
‡gYßÖ¯Hê");rÆ◊\I
ﬁJΩu&ÑkU„;N
‡gYßÖ¯Hê");rÆ◊\O
ﬁJΩu&ÑkU„;T
‡gYßÖ¯Hê");rÆ◊\U
ﬁJΩu&ÑkU„;Z
‡gYßÖ¯Hê");rÆ◊\[
ﬁJΩu&ÑkU„;`
‡gYßÖ¯Hê");rÆ◊\a
ﬁJΩu&ÑkU„;f
‡gYßÖ¯Hê");rÆ◊\g
ﬁJΩu&ÑkU„;l
‡gYßÖ¯Hê");rÆ◊\m
ﬁJΩu&ÑkU„;r
‡gYßÖ¯Hê");rÆ◊\s
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
W`Äd˘å°B≥t¥÷;ƒk|Æ
nÂ¢q“qMâ;}tk
;W/Ë¿]Ω
;W/Ë¿]∏
Â√˙»S;ÅD†ò
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3|
ãsL≥L©j;Ö®¨¶ºE
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿E
>Â;N™Õ)vãh.ZE
b\^ÇPÛEü;±
”5oU;Já±±@†®%9x
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™Ú
K˜ZC ö;Mòïs
;Iò£+1
TA±;ãÒ¢!Áy—
TA±;ãÒ¢!Áy·
87ô5¶3Në;
Ñq;dœDÿJë`†à]ÀÁÆ7
ó∆t‚"î±@Ö;i∞∑û6ÏÆ
¸ëØNµ‹P%Náw;ë
EÉ©N}í.;œr
ãß;ÂR@ø©àm¯êúJ.
÷ÎÜ˚õAé;¿Ùc.ó∑i
Ò≈;ªO≠lÜ••˙C≥E
Æ;IN:ˆ
˝í;ÎÈi
;≠ã£πÏ™G•'∆5
ˇÚEì;Ú"∑
*J;œ’$ÓI¥ÒƒƒÚo‘~
Oö;P2π¸Æ*-
!;ÌBÔΩ«@†À<Ç*
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^
mk†;$û•O´ÜáVóIø¥.
OÆÎi;^¡ò
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;.
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.Èp
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í p
†HæÂ˛†’H-;8
;Ô“].º
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Û8
Y{3;FçûRô®<NC-
 DÄ÷bûYPc7
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Ó’
xH;A˘q-
˜cKª‰´˛;‡ÚˇK
 iÈJÜ-g$ûZH⁄8
7uù¬‘RçKô'î£lÅ;k-
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿Ç„
:Ã;3ËBqM£<Y)ôfH$K
AÉ%F;XOÖ6x‡jæÊ\±
xùù⁄€HH≠cç;[*Y>ﬂ
xùù⁄€HH≠cç;[*Y>·
Ñq;dœDÿJë`†à]ÀÁÆ;
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
;|ã´Îø
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>mE
Dó0¿¯;ÑOæE
 l;æNÉÒÌ‡~ 4=x
ÑÒ`@ºèS;<»Zöx
%wäJÄ‚+“;Eh
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜Õ
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
I ;qÚKí
\∏Aä;!ô-¬€¡±
;+¯OOûû7>
TA±;ãÒ¢!Áy#
xùù⁄€HH≠cç;[*Y>1
πbÏ"¢≥;
´[±6Ë;
aÆ§"E°;
Lç"æ†dÈ‰Ö;
G≤⁄ˆ±bTò8;
;W/Ë¿]a
TA±;ãÒ¢!Áyu
xùù⁄€HH≠cç;[*Y>É
S~Îe≤Ï∫Aó;>h≠
;W/Ë¿]¥
;†Dò¬◊˚f™+û∆
;†Dò¬◊˚f™+û·
π◊;u NI¶e∏…
òpØOπõl&ë›;@‘
∞C¥5;ÅKßQã˙Cæº
3 yZ;Í]N∂m
xùù⁄€HH≠cç;[*Y>–
¯;º!1Í’@Ø
âH;ñS„-
;W/Ë¿]ˇ
¢Bçªòù‹E;∑4
¢Bçªòù‹E;∑6
¢Bçªòù‹E;∑U
¢Bçªòù‹E;∑8
xùù⁄€HH≠cç;[*Y>
êÙÎÔΩc;
;W/Ë¿]J
TA±;ãÒ¢!Áy^
xùù⁄€HH≠cç;[*Y>m
;W/Ë¿]ó
TA±;ãÒ¢!Áy´
xùù⁄€HH≠cç;[*Y>π
πsÏ^;Æ
;W/Ë¿]Í
;W/Ë¿]8
¸ò∫q;
aAøï˙7∂n≤∑;
;W/Ë¿]`
;W/Ë¿]ä
;W/Ë¿]±
;W/Ë¿]◊
;W/Ë¿]˝
;†Dò¬◊˚f™+û
z;›˜™O†lÏwêäNVÆ
hHâä˛é∑∏z;
xùù⁄€HH≠cç;[*Y> 
b;òÑ‘w¬DµÛ†
ûPº;ÄØ±N¥<∑
NÄG≠:;¿‘–H
NÄG≠:;¿‘–È
xùù⁄€HH≠cç;[*Y>L
ı;*HPµ•GÉ.˙ô%
TA±;ãÒ¢!Áyi
¡L<f◊¬cHü>˚‚¯“';
xùù⁄€HH≠cç;[*Y>y
¡L<f◊¬cHü>˚‚¯“';{
¡L<f◊¬cHü>˚‚¯“';·
™u0Ï˘ò]Nû†hÊ;œuh
˝ÖCàOô∞Oç§åÛ≠;ªV
TA±;ãÒ¢!Áyò
xùù⁄€HH≠cç;[*Y>®
ØÜHòh∞'Ãﬁ;å∞
ØÜHòh∞'Ãﬁ;å—
TA±;ãÒ¢!Áy‘
xùù⁄€HH≠cç;[*Y>‰
˛_ÊÚƒY;@óJ
};«qPÁgG¨î∏‡õ·ªi
)¿ËREêë;é
7PJ¢§o>Gô;Ÿ$ÿQ
Ø∞´°EH´?;P’Ã!*
TA±;ãÒ¢!Áy
g©z¥òæ;L£Vü4æ9∏
P˙6MªﬁO;p-0˘0
P˙6MªﬁO;p-0˘·
TA±;ãÒ¢!Áy?
.-+¨”K’A¨;T
xùù⁄€HH≠cç;[*Y>O
;ïÁMéﬁHz„å
TA±;ãÒ¢!Áy{
xùù⁄€HH≠cç;[*Y>ã
ØÜHòh∞'Ãﬁ;åì
∂ÙµO≥;3Yx‘(ÇÆ
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†æ
;aJΩzO ?∆+†ﬁ
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;F≠
Ä~E;ﬁÂ
B≥%Îë;
;?%¶f\
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
Ü;‚{v¡!JéDY†a
∆M±\Oå;µxK
¨•;ª´Ê“Kß√t
Ö∏:“)¢ŒOò;æíÖ√„õ
Ö∏:“)¢ŒOò;æíÖ√„õﬁ
;aJΩzO ?∆+†
N™éˆÔ·BMºN)CÂÉh‘;
Ö∏:“)¢ŒOò;æíÖ√„õb
;aJΩzO ?∆+†z
Ö∏:“)¢ŒOò;æíÖ√„õ¿
;aJΩzO ?∆+†ÿ
;aJΩzO ?∆+†!
;aJΩzO ?∆+†s
Ö∏:“)¢ŒOò;æíÖ√
;ı≥Kn™I±~ö†V∂ŸQ
;aJΩzO ?∆+†«
;aJΩzO ?∆+†Ö
Lñ;˙Ã%B.
;aJΩzO ?∆+†ƒ
¢YÂı∑cïDà÷"Õ`›;
ÛÔMMnÒ;
Ö∏:“)¢ŒOò;æíÖ√„õJ
;aJΩzO ?∆+†V
{tïuQ2PD∏≥ô∫∂%;Õ
;aJΩzO ?∆+†Æ
Ö∏:“)¢ŒOò;æíÖ√„õÚ
ôí≠∆+â;EÜW
Ö∏:“)¢ŒOò;æíÖ√„õF
;aJΩzO ?∆+†W
ÇFÑw±cô–@;±
;aJΩzO ?∆+†≠
Ö∏:“)¢ŒOò;æíÖ√„õÒ
z;O∫kÉ^˝öËTÆ
≤´;à‘ÿ
NáÔTSg†÷E;
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;
XûEøEø;bÒ1°k
XûEøEø;bÒ1°È
XûEøEø;bÒ1°†
XûEøEø;bÒ1°’
#;Mà;Ä4
XûEøEø;bÒ1°
XûEøEø;bÒ1°0
KÑtúÇ“~ÒÃ;
XûEøEø;bÒ1°^
XûEøEø;bÒ1°ê
XûEøEø;bÒ1°@
NÄG≠:;¿‘–
XûEøEø;bÒ1°c
Lø;z˛rLWO±
XûEøEø;bÒ1°ã
XûEøEø;bÒ1°∂
XûEøEø;bÒ1°‡
XûEøEø;bÒ1°5
¥A=EY!‹@ëü¡Y†8Uc;
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;Æ
q‘ı;EûuCdﬁ&5›P
q‘ı;EûuCdﬁ&5
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
£í;Cä˘G¥
@™ÛlØ,;
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]]
Aì;˝ˇ\∑Ç]1
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_d
É∆:JóÑƒ—;Tá_¸
9á‚ s‘]MäSr;˚±µ`≠
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNım
9;˛π$J»Añ{C8·åNı±
ùY˝;BEî¢
Ò¢;•BˆCî
(MÜ;∏Ç
4Øˇ;oö˚Gú°ò
áŸJ∫î;
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€ƒv
Ω.BπYÎ;k7Î˜É
Ω.BπYÎ;k7Î˜¸
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Gò;ä∆…±
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“Aô
 ZSiBº´AéÓ—lÜ∆“A±
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
 C®ØHŸ˜ÎR
––˙»H™;[á}zŒBÆ
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
;ªÑê*%≠
;ªÑê*%
N´†;zXã
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
&≠,ÿ;´§Oª‚œ
H;Îw‹_MKØ˚µ2Z‘Á‰æ
H;Îw‹_MKØ˚µ2Z‘Á‰ú
∆M±\Oå;µxKø
∆M±\Oå;µxK¸
8—d≤G©G¡`Q;◊HÆ
Íi+;<’Nö±w
Û]¯;¨òïBá
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9ﬂ
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;v
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
ı‰®I¶;
¨3êC?D´Ü∂v;“%1Û
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆˆ
ùΩ;Bêa¢óoÆóˆ¸
 A´KUTFöR!¯
 A´KUTFöR!±
DH;Eêé$,*H‹–˝
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡ˇ
GåÁÂé-;Ë‡ç
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;v
;YÂLË±
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQb±
©ÁI°Q-¸;_◊
q‘ı;EûuCdﬁ&5›
Aì;˝ˇ\∑Ç]%
É∆:JóÑƒ—;Tá_,
9;˛π$J»Añ{C8·åNı5
#E£é‚MÉ¬<"∆UOÄ;
DÑÿy. e Ò;
Ω.BπYÎ;k7Î˜K
 ZSiBº´AéÓ—lÜ∆“Aa
;ªÑê*%u
H;Îw‹_MKØ˚µ2Z‘Á‰Ü
∆M±\Oå;µxKá
oi∑;_Aå¢õÜ‘ÃÈ9ß
¨3êC?D´Ü∂v;“%1ª
ùΩ;Bêa¢óoÆóˆæ
 A´KUTFöR!¿
DH;Eêé$,*H‹–≈
GåÁÂé-;Ë‡«
q‘ı;EûuCdﬁ&5›‡
Aì;˝ˇ\∑Ç]Ì
É∆:JóÑƒ—;Tá_Ù
9;˛π$J»Añ{C8·åNı˝
 ZSiBº´AéÓ—lÜ∆“A)
HòNëµfŒhE;
qP=öπ;
;ªÑê*%=
H;Îw‹_MKØ˚µ2Z‘Á‰N
∆M±\Oå;µxKO
oi∑;_Aå¢õÜ‘ÃÈ9o
¨3êC?D´Ü∂v;“%1É
ùΩ;Bêa¢óoÆóˆÜ
 A´KUTFöR!à
DH;Eêé$,*H‹
GåÁÂé-;Ë‡è
Aì;˝ˇ\∑Ç]µ
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ
9;˛π$J»Añ{C8·åNıø
U;7@ÆM¢2ÑC°˛v
U;7@ÆM¢2ÑC°˛
Ω.BπYÎ;k7Î˜Õ
 ZSiBº´AéÓ—lÜ∆“Aﬂ
;ªÑê*%Î
;—JˇèCà
H;Îw‹_MKØ˚µ2Z‘Á‰Ù
0∂Kπ;ö
¸jÜò∑#;JÉ9_ßÁ°qbÆ
{;ÂîJçÂ-'3‘
“˜*A;÷Lòo„ì
e{K®Zˆ-˝M;¿v
e{K®Zˆ-˝M;¿
DH;Eêé$,*H‹–1
GåÁÂé-;Ë‡3
¯JãòOÌ[ÿ˛´;
q‘ı;EûuCdﬁ&5›K
Aì;˝ˇ\∑Ç]X
É∆:JóÑƒ—;Tá__
9;˛π$J»Añ{C8·åNıh
Ω.BπYÎ;k7Î˜x
zÍHõ˘ÛﬁFÉæî;LÔ~ÏQr{ÏÛ/DE±
zÍHõ˘ÛﬁFÉæî;LÔ~Ï
‹˙ÍäÓÑHæ;˚˛°0»
‹˙ÍäÓÑHæ;˚˛°0»—
 ZSiBº´AéÓ—lÜ∆“Aç
/Ø£q;çØ
;#ˇMò’
Dzp;"!ò
Dzp;"!±
jz+‚ R¥GÅ;/≤Güß¶ô
jz+‚ R¥GÅ;/≤Güß¶
;ªÑê*%ù
H;Îw‹_MKØ˚µ2Z‘Á‰¶
oi∑;_Aå¢õÜ‘ÃÈ9∆
É<^âFΩ9‹'Œe;`Æ
6l;#˜µ¥O™
DH;Eêé$,*H‹–‰
GåÁÂé-;Ë‡Ê
Aì;˝ˇ\∑Ç]
9;˛π$J»Añ{C8·åNı
Ω.BπYÎ;k7Î˜.
;ı≥Kn™I±~ö†V∂ŸQ1
;ı≥Kn™I±~ö†V∂ŸQ¸
J≈mÏ¡;
GÔã|?ÊNM™°dp¥zÅ3;
 ZSiBº´AéÓ—lÜ∆“AA
;ªÑê*%V
H;Îw‹_MKØ˚µ2Z‘Á‰^
¨3êC?D´Ü∂v;“%1í
ùΩ;Bêa¢óoÆóˆï
 A´KUTFöR!ó
GåÁÂé-;Ë‡ù
Aì;˝ˇ\∑Ç]ƒ
É∆:JóÑƒ—;Tá_À
9;˛π$J»Añ{C8·åNı‘
Ω.BπYÎ;k7Î˜Í
 ZSiBº´AéÓ—lÜ∆“A˛
@&UIïóÿ;Â
H;Îw‹_MKØ˚µ2Z‘Á‰'
oi∑;_Aå¢õÜ‘ÃÈ9E
¨3êC?D´Ü∂v;“%1Y
ùΩ;Bêa¢óoÆóˆ\
 A´KUTFöR!^
DH;Eêé$,*H‹–c
GåÁÂé-;Ë‡e
q‘ı;EûuCdﬁ&5› 
q‘ı;EûuCdﬁ&5›÷
q‘ı;EûuCdﬁ&5›‚
Aì;˝ˇ\∑Ç]
9;˛π$J»Añ{C8·åNı˙
 ZSiBº´AéÓ—lÜ∆“A
hú?D®;Ó˙#v\Ò2 
hú?D®;Ó˙#v\Ò±
iyH≠T‘;0
;ªÑê*%8 
s;fÇÿ9 
s;fÇÿ0
£πç'ˇåEHÑ.f∆{Å5/; 
Gâ@¶±™∫;µˆ±v
Gâ@¶±™∫;µˆ±
;‹DúÆ´<O≤“D9
´;4"≤ÁM´
ìﬁA;C¥mb„œŸ
Fò-‚LÆ;
;[Ç‚&ñGå;íã-÷(WQ 
;[Ç‚&ñGå;íã-÷(W¸
·˘á|ÙUÓIæò;åÓlŸIQ 
·˘á|ÙUÓIæò;åÓlŸI¥
;õ‚˜ö+3GÇª^‹
H;Îw‹_MKØ˚µ2Z‘Á‰Y 
oi∑;_Aå¢õÜ‘ÃÈ9z 
V<•;ó 
GåÁÂé-;Ë‡ö 
é…;∞≥ 
Aì;˝ˇ\∑Ç]∑ 
É∆:JóÑƒ—;Tá_æ 
9;˛π$J»Añ{C8·åNı« 
Ω.BπYÎ;k7Î˜◊ 
F;ˇ»#ıFLìÎd
‹˙ÍäÓÑHæ;˚˛°0»—Í 
 ZSiBº´AéÓ—lÜ∆“AÌ 
Ù$KÑ@±§JºNI;
Dzp;"!˙ 
jz+‚ R¥GÅ;/≤Güß¶˚ 
ÿ|S_;ı¸B∏
ΩKÔD=9;8M:<x
;8M:<x
¯≤)ıÑPtAä–;[oÿ˙RÆ
Û;K,8*vFî‰:ﬁlè*fv
â—˜õ;âGûs
EñC‡w@¸k;±
Û;K,8*vFî‰:ﬁlè*f
]¸p·RDü;~3µ¨
¡JªCaFÙúf˛Tì∂≤;πâE£
Tì∂≤;πâE£
DD%Kú›˝†íõI;
DD%Kú›˝†íõI;û
Eù#˝;RXø
∂@ø!/Õ;aYûv
∂@ø!/Õ;aYû
.◊0„§Bß;!ï€/˛|
.◊0„§Bß;!ï€/˛|±
8wF∞;˘g2ç"†Æ
Dè˚©d;ùIà1ã
;‹ÛfıΩaKπr$A‰_5
r¨b;£Cú{S#Ãx˜ˇ
-;;Né2‚*BΩòá:1˜˙Rv
;;Né2‚*BΩòá:1˜˙R
%Eéá¨—‚öÈ;Æ
6xÑ≈’eƒBë;h
⁄Õ%“;oÖJÖ5:
Y;ãJéêvÖDHöI4!
Y;ãJéêvÖDHöIf
ä˙⁄I∏∞;≤~
H;Îw‹_MKØ˚µ2Z‘Á‰6!
Çm∏Cãò#]©î⁄∆;!
oi∑;_Aå¢õÜ‘ÃÈ9W!
:3;áıcUM†aû
V<•;t!
DH;Eêé$,*H‹–u!
GåÁÂé-;Ë‡w!
é…;∞ê!
Aì;˝ˇ\∑Ç]î!
É∆:JóÑƒ—;Tá_õ!
9;˛π$J»Añ{C8·åNı§!
Ω.BπYÎ;k7Î˜¥!
;ı≥Kn™I±~ö†V∂ŸQ∑!
¸Ω|ÔV;±˜‚∂Nßo{0ÎÎ
ÔV;±˜‚∂Nßo{0ÎÎ
Cô;úÎ8¨h˘Æ
 ZSiBº´AéÓ—lÜ∆“A !
;eF˘⁄!
7ÛF;Iæy
;ªÑê*%‰!
˚Ú¸B€:JD∂≠ﬁÁ;ê¨ñÍ!
˚Ú¸B€:JD∂≠ﬁÁ;ê¨ñD
ú^;%Í1Zë@¨©îß,˜OÇv
^;%Í1Zë@¨©îß,˜OÇ
˚È^rt1áFºN``ﬂ`;|π0˝Ω
˚È^rt1áFºN``ﬂ`;|
¡â˛|¶¡ˆFí= ;hÙ≠·˛!
¡â˛|¶¡ˆFí= ;hÙ≠·
æ;ñ"åã
Ó…˛ªÇUZCØ;˛X"
πúÌÎ;KΩ
⁄z∂éÊ;Kò„
⁄œK¯JÜ°;I
Ó&,ú·Ñ…Lµe]ÒÛz!;
Ó&,ú·Ñ…Lµe]ÒÛz!;±
H;Îw‹_MKØ˚µ2Z‘Á‰
oi∑;_Aå¢õÜ‘ÃÈ94"
÷h¥µññ;"
·_´„∏|;"
¨3êC?D´Ü∂v;“%1H"
ùΩ;Bêa¢óoÆóˆK"
 A´KUTFöR!M"
DH;Eêé$,*H‹–R"
GåÁÂé-;Ë‡T"
é…;∞m"
Aì;˝ˇ\∑Ç]q"
É∆:JóÑƒ—;Tá_x"
9;˛π$J»Añ{C8·åNıÅ"
Ω.BπYÎ;k7Î˜ô"
 ZSiBº´AéÓ—lÜ∆“AØ"
Q;öÎ™I
;ªÑê*%…"
;8K¨VA`O¶rKü†J
j°Dîv;
‹ÒW¡¬9G®T©·˚[É;œ"
‹ÒW¡¬9G®T©·˚[É;±
¯∂7…›”¡Aü‹–;(ˇ
◊#¯IâDb;Ùﬁ
>bÉ/y;<@éÎ
Ìó!;mJÅá˝#À/~/·
Ìó!;mJÅá˝#À/~/
πhM∫Ù-;Ö¥≠Iv
˘';hPNû
;2Zñ5bmE∞\|ÿ
 r±'ÂL´¢
πhM∫Ù-;Ö¥≠I
sÔ◊;ü€
ﬂJÁÊﬁ‹;O∞ºπ
 OöLke˙Ãˇ!˘"
 OöLke˙Ãˇ!R
;g∆<ksÕIß:«œ[ $tÆ
∆ÀI;∫ä'L™
ë∏û/ï%MAµ#ƒZ7t;Ÿ
≠¥pÊ1Eê;á˝Ô
Dú#˛;bã⁄
∞L˙>{Ò¿@¥d8Á;
{tïuQ2PD∏≥ô∫∂%;Õ¸
¯;·€J_UD®9&Ÿ
@ø™ﬁEôF»;
Q;û:ƒÓGA≤î
îê∫âã!’O∑˙ª æ;˙Ù
îê∫âã!’O∑˙ª æ;˙Ù±
\;ÖI•*ÊÑ
˘5D;Ö¯-AÖUß„à]1§±
oi∑;_Aå¢õÜ‘ÃÈ9?#
¨3êC?D´Ü∂v;“%1S#
ùΩ;Bêa¢óoÆóˆV#
 A´KUTFöR!X#
DH;Eêé$,*H‹–]#
GåÁÂé-;Ë‡_#
¿PBÄ}å;¯›zÊÆ
é…;∞x#
Aì;˝ˇ\∑Ç]|#
É∆:JóÑƒ—;Tá_É#
9;˛π$J»Añ{C8·åNıå#
Ω.BπYÎ;k7Î˜¢#
µ]≠U;®¿OªzêÆ
 ZSiBº´AéÓ—lÜ∆“A∏#
ÌFú;˚ã˜H§Ω¢MÓŸ
;ªÑê*%“#
Ø∞´°EH´?;P’Ã!*ﬂ#
Ø∞´°EH´?;P’Ã!*¸
G^KÑ;ú≈6!
˝Æw˚Ê©˘GèÀ¡}AXl;Â#
˝Æw˚Ê©˘GèÀ¡}AXl;¸
úQÍ];ÛhNü
2MÆ~{Rîu^®ä–-Eu±˚Fº;
ä–-Eu±˚Fº;
oi∑;_Aå¢õÜ‘ÃÈ9'$
”Âwˆ—;$
¨3êC?D´Ü∂v;“%1;$
' ÌÜ;$
ùΩ;Bêa¢óoÆóˆ>$
 A´KUTFöR!@$
DH;Eêé$,*H‹–E$
GåÁÂé-;Ë‡G$
[©†Óÿa_J´M;˘ë
V»"}ïï≥Oø;G«˚o<ôW$
V»"}ïï≥Oø;G«˚o<ôb
é…;∞`$
Aì;˝ˇ\∑Ç]d$
É∆:JóÑƒ—;Tá_k$
9;˛π$J»Añ{C8·åNıt$
ÁΩq;‹ˆñ@çgÿ%2ÇÊ&Ñ$
ÁΩq;‹ˆñ@çgÿ%2ÇÊ&±
Œ‹6ß#ë;J¢ˆ
Ω.BπYÎ;k7Î˜ä$
 ZSiBº´AéÓ—lÜ∆“A†$
;äFî≠åm™3
;ªÑê*%∫$
M•®f.Ó÷N¶iÉ;PG»
ô;M∞‘&˛Lè∆(
∂+ÉIæ·‹V;
≠J;P∞„Dó∞-˘ˇ)≥j◊$
≠J;P∞„Dó∞-˘ˇ)≥j¸
PÁ;‘≈ˇí
; &|N8ÚM∫èGzq
áoÁ~•wF≥U;gç\+}v
áoÁ~•wF≥U;gç\+}
|^LÚ^p;D≠Ü2V¢m‚
sˇóAöo©;
±B◊ÏS1GÉb;M¥©Û;È$
±B◊ÏS1GÉb;M¥©Û;
;-#√»Î$
;-#√»S
Ì]Çè˙;áOÉ∆
~ë;†ägìMóÇ
H;Îw‹_MKØ˚µ2Z‘Á‰˙$
∆M±\Oå;µxK˚$
;aˇv◊EÁJíKŒˆ}ÖÜyÆ
¨3êC?D´Ü∂v;“%1/%
ùΩ;Bêa¢óoÆóˆ2%
 A´KUTFöR!4%
DH;Eêé$,*H‹–9%
GåÁÂé-;Ë‡;%
é…;∞T%
Aì;˝ˇ\∑Ç]X%
É∆:JóÑƒ—;Tá__%
9;˛π$J»Añ{C8·åNıh%
 jÁ•/í~é≥
Ω.BπYÎ;k7Î˜~%
 ZSiBº´AéÓ—lÜ∆“Aî%
«O¨h;≠Øöbi§%
«O¨h;≠Øöbif
™HF∞;PıEá‚ä‡'#™
˙Lµæ?Ú;¢"
˙Lµæ?Ú;¢" 
;ªÑê*%Æ%
LjëÓÚt;BÆK
b;[~±B≤Æh@á)π‡¿%
b;[~±B≤Æh@á)π‡
¥;˚LàdÒ
Øï;CNºØIë√
bHCF™WÁs£b;≠v
bHCF™WÁs£b;≠
@©ªﬂk∆;ä8
NpBÁëÁ;MÅÉRìENä
`b@Ä;øqºªÕŸ%
`b@Ä;øqºªÕ4
; ≤"C0:BÅ…ÿ0_~Öq‹%
; ≤"C0:BÅ…ÿ0_~Öq±
"¶L†^öÉT;2o‰%
"¶L†^öÉT;2o]
Ç=û7±Ë»Oã’Ó/Úv;SÊ%
Ç=û7±Ë»Oã’Ó/Úv;S
©R≥^≤;~Aë\BƒE⁄JìÆ
>Tíï#!ëM†ÿÚI∞;
H;Îw‹_MKØ˚µ2Z‘Á‰%
∆M±\Oå;µxKÒ%
Ÿ»iâ¡);ûT”N±"π˘+ÁÆ=v
â¡);ûT”N±"π˘+ÁÆ=
\0O†O√&ß;
ö@∞"ê¯’Mî+Rìt;ˇ?
oi∑;_Aå¢õÜ‘ÃÈ9$&
¨3êC?D´Ü∂v;“%18&
ùΩ;Bêa¢óoÆóˆ;&
+à˝¯w@ú}~p'ùµM;&
ªi(¯íX;&
 A´KUTFöR!=&
DH;Eêé$,*H‹–B&
GåÁÂé-;Ë‡D&
Wvä≤;®^O£
é…;∞]&
Aì;˝ˇ\∑Ç]a&
É∆:JóÑƒ—;Tá_h&
9;˛π$J»Añ{C8·åNıq&
Ω.BπYÎ;k7Î˜á&
 ZSiBº´AéÓ—lÜ∆“Aù&
;ªÑê*%∑&
‹ÒW¡¬9G®T©·˚[É;Ω&
 OöLke˙Ãˇ!Á&
H;Îw‹_MKØ˚µ2Z‘Á‰˘&
∆M±\Oå;µxK˙&
oi∑;_Aå¢õÜ‘ÃÈ9-'
Ωü\h’zuFïÛ6≤Ú˝I);'
1ÖŸNè;'
¨3êC?D´Ü∂v;“%1A'
ùΩ;Bêa¢óoÆóˆD'
 A´KUTFöR!F'
DH;Eêé$,*H‹–K'
GåÁÂé-;Ë‡M'
;©†˚(ÊÂFêç
 —<;?h™Môç•ØZüòUi'
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•±
x´;Bé§í‡Òä`Êl'
x´;Bé§í‡Òä`Êz
‰g;•†0MÜQ:âıπº^n'
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
;‡ÑØj.8JôÄ
)%;¸<≥◊L™
K;Óñ‰ﬁ
&HÚ´;R
DÅ)¯P√}i;Ö'
DÅ)¯P√}i;ù
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
Úh;|}}
qi;;¥E∂o>2e
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯Xé'
;˙/¯X6
ıR9ÿ"D¨Úq;Ã
g‹I∏xü;Ü
%îh;˘Ä_G∑
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
GåÁÂé-;Ë‡
ìáï∆)K;Mà±≠/˜˜ùöÆ
;M¸è¿sK£ﬁ»u8q„e±
˛´T“@õÜ;˘TÑq™§'
˛´T“@õÜ;˘TÑq™¢
\Ày`AçÇZ≥Ñ˙;±•'
\Ày`AçÇZ≥Ñ˙;±%
;\AŒ#Ú≤JêO<ê†Kue
kgÉÄ§DÅPŒrq1;Ô
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
&—√n‡]⁄KØ;û
˘aûª;D°Oá
 Cã˛¡î
å·;ˆ÷hÆNóıÓŸƒq±∞º'
å·;ˆ÷hÆNóıÓŸƒq±∞
 —<;?h™Môç•ØZüòU√'
x´;Bé§í‡Òä`Ê∆'
‰g;•†0MÜQ:âıπº^»'
K;Óñ‰ﬁŸ'
DÅ)¯P√}i;ﬂ'
;˙/¯XË'
˛´T“@õÜ;˘TÑq™˛'
\Ày`AçÇZ≥Ñ˙;±ˇ'
x´;Bé§í‡Òä`Ê (
‰g;•†0MÜQ:âıπº^"(
K;Óñ‰ﬁ3(
DÅ)¯P√}i;9(
y≈ÕŒU√;(
®>]≠8;(
;˙/¯XB(
˛´T“@õÜ;˘TÑq™X(
\Ày`AçÇZ≥Ñ˙;±Y(
å·;ˆ÷hÆNóıÓŸƒq±∞p(
 —<;?h™Môç•ØZüòUw(
x´;Bé§í‡Òä`Êz(
‰g;•†0MÜQ:âıπº^{(
;_Çóù3†Câ#
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ}(
˜¸n⁄ P5Cî∑r;Ÿ‡7
DÅ)¯P√}i;å(
;˙/¯Xî(
˛´T“@õÜ;˘TÑq™ß(
\Ày`AçÇZ≥Ñ˙;±®(
å·;ˆ÷hÆNóıÓŸƒq±∞µ(
 —<;?h™Môç•ØZüòUº(
x´;Bé§í‡Òä`Êø(
‰g;•†0MÜQ:âıπº^¡(
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ≈(
K;Óñ‰ﬁœ(
DÅ)¯P√}i;’(
;˙/¯Xﬁ(
˛´T“@õÜ;˘TÑq™ˆ(
\Ày`AçÇZ≥Ñ˙;±˜(
DÅ)¯P√}i;")
;˙/¯X+)
øVK∞ÜsòA◊|Ó;)
ò~Û\Ï±≈Bë°<˘¶VC;)
(tÄ“_;)
˛´T“@õÜ;˘TÑq™B)
\Ày`AçÇZ≥Ñ˙;±C)
‡;ruôeÙH§•
å·;ˆ÷hÆNóıÓŸƒq±∞Q)
 —<;?h™Môç•ØZüòUX)
x´;Bé§í‡Òä`Ê[)
‰g;•†0MÜQ:âıπº^])
K;Óñ‰ﬁn)
DÅ)¯P√}i;t)
;˙/¯X})
˛´T“@õÜ;˘TÑq™ì)
\Ày`AçÇZ≥Ñ˙;±î)
å·;ˆ÷hÆNóıÓŸƒq±∞´)
 —<;?h™Môç•ØZüòU›)
x´;Bé§í‡Òä`Ê‡)
‰g;•†0MÜQ:âıπº^·)
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ„)
K;Óñ‰ﬁÏ)
DÅ)¯P√}i;Ú)
;˙/¯X˚)
-å˜∑≈CÆDØ‰mDB;
í2¿I±;c‚Vô◊
·˘á|ÙUÓIæò;åÓlŸI
=C…¿Cå;
Ø<m1ÅT;@õÕ^ÕWG
å·;ˆ÷hÆNóıÓŸƒq±∞!*
 —<;?h™Môç•ØZüòU#*
x´;Bé§í‡Òä`Ê&*
‰g;•†0MÜQ:âıπº^(*
˜¸n⁄ P5Cî∑r;Ÿ‡7ƒ,*
K;Óñ‰ﬁ6*
TYû©∫[˝LüfcpQ\‘”;*
DÅ)¯P√}i;<*
∫A;ë,±HFñΩ
;˙/¯XE*
Y;ãJéêvÖDHöI
r¨b;£Cú{S#Ãx˜ˇX*
r¨b;£Cú{S#Ãx˜ˇJ
˛´T“@õÜ;˘TÑq™]*
\Ày`AçÇZ≥Ñ˙;±^*
˛~;¬6˝àOåï˝eHÙ´SÆ
å·;ˆ÷hÆNóıÓŸƒq±∞p*
 —<;?h™Môç•ØZüòUr*
x´;Bé§í‡Òä`Êu*
‰g;•†0MÜQ:âıπº^w*
DÅ)¯P√}i;ã*
;˙/¯Xî*
N≤Golä˜;WÆ
˛´T“@õÜ;˘TÑq™¨*
\Ày`AçÇZ≥Ñ˙;±≠*
‡’…f2Oô¯⁄‚ h;
9CÀ˜ªEöi};õ∂R
˚Ú¸B€:JD∂≠ﬁÁ;ê¨ñ
√M¥ªèˆ;hÛP
 qæsà¨Hú°D±¡˜>º
™u0Ï˘ò]Nû†hÊ;œuhª*
™u0Ï˘ò]Nû†hÊ;œuh¸
¶K≥¯òh;äR‡
äË;dª*
˝ÖCàOô∞Oç§åÛ≠;ªVø*
˝ÖCàOô∞Oç§åÛ≠;ªV%
å·;ˆ÷hÆNóıÓŸƒq±∞¡*
 —<;?h™Môç•ØZüòU√*
x´;Bé§í‡Òä`Ê∆*
‰g;•†0MÜQ:âıπº^»*
4´;Éù≠
zC∏ª;D◊Û2o
K;Óñ‰ﬁ⁄*
DÅ)¯P√}i;‡*
g;MåÌ\£RÒB“
:ı„ÂÒ“;F¢Gâ0=√2A
;˙/¯XÈ*
ØÜHòh∞'Ãﬁ;å
ì◊rÒ®ETEá¥éM;∂
 OöLke˙Ãˇ!
∞*º:˚A;DÇµ
SHπ–F;{
;M}g≥oiD•Â6¬ˆE
t{#3ë; Iµ
…˜;çLØ
¢åE∂∞;LÄ¯ÅƒyÔq;
î;‚_ã
;√Ë’@®$+*u˘˝Œ
å·;ˆ÷hÆNóıÓŸƒq±∞&+
 —<;?h™Môç•ØZüòU(+
x´;Bé§í‡Òä`Ê++
‰g;•†0MÜQ:âıπº^-+
}Æáâ≤;+
¡Çö¡;+
˜Õ–“;+
’t≠z;+
É≤pZ;+
ÒÌﬂ5;+
%¡Ú∫çc;+
K;Óñ‰ﬁ>+
DÅ)¯P√}i;D+
;˙/¯XM+
};«qPÁgG¨î∏‡õ·ªiO+
};«qPÁgG¨î∏‡õ·ªi¸
V»"}ïï≥Oø;G«˚o<ô
‹/;¯“o∞HÆVøMÒ´§
;gWN®Ä˚7b≥ó.`+
;gWN®Ä˚7b≥ó.O
˛´T“@õÜ;˘TÑq™e+
\Ày`AçÇZ≥Ñ˙;±f+
¨Ÿ¡.@àd@öŸu•ÿv;@
ÏJ8≤m;lLähıºñQêw
6ƒ;È¨,àMµ˝¸PG‚-≈
'Ò;Açn®˛Ü
å·;ˆ÷hÆNóıÓŸƒq±∞Ç+
 —<;?h™Môç•ØZüòUÑ+
x´;Bé§í‡Òä`Êá+
‰g;•†0MÜQ:âıπº^â+
eDm‚Ï;9@Çl
7Ø;ìÇó+
7Ø;ìÇØ
DÅ)¯P√}i;†+
;˙/¯X©+
ìªè%Å€ÀFºÙ;R?Åa
˛´T“@õÜ;˘TÑq™¡+
\Ày`AçÇZ≥Ñ˙;±¬+
‰êƒKæ¢Òc¿;©JÆ
ﬂ“3#;]Mòè
‘;≈>m»
P˙6MªﬁO;p-0˘
≠•ab≤mõC∏k;∑w1ç
å·;ˆ÷hÆNóıÓŸƒq±∞·+
 —<;?h™Môç•ØZüòU„+
x´;Bé§í‡Òä`ÊÊ+
‰g;•†0MÜQ:âıπº^Ë+
I∫Y›1};EΩXsíà†N–ˆ+
I∫Y›1};EΩXsíà†N–
K;Óñ‰ﬁ˘+
DÅ)¯P√}i;ˇ+
"¶L†^öÉT;2o
˛´T“@õÜ;˘TÑq™ ,
\Ày`AçÇZ≥Ñ˙;±!,
‡®;Ä@Ø‡\VãrΩË
«O¨h;≠Øöbi
r@ú˝;ßõ#
ÂOû˚_;†ÌF„
©E∂B°\;,
]IØ*ó_Up¸°;,
˜^Ê¯˙;,
≥Ù\!t;,
ˇ]H•êX7Y‹mk;,
@©ªﬂk∆;ä8;,
ã!«GOGáÖL]0ÿ<Æ;,
)‹T◊‘.N£’ı˛7ï¯~;,
¯ÅôÌ™;,
`b@Ä;øqºªÕ
;sƒˆJ¶∏xL
úÚ…˘KfÃK´‡·ªis≤;@,
úÚ…˘KfÃK´‡·ªis≤;¸
D§£‹›€@ØÇ„Ï;
FÄ4ŸA#Œ%;
PZ;πë-•JùÑÂ©Íø
ö@∞"ê¯’Mî+Rìt;ˇ?D,
ö@∞"ê¯’Mî+Rìt;ˇ?x
å·;ˆ÷hÆNóıÓŸƒq±∞E,
 —<;?h™Môç•ØZüòUG,
x´;Bé§í‡Òä`ÊJ,
‰g;•†0MÜQ:âıπº^L,
K;Óñ‰ﬁ],
DÅ)¯P√}i;c,
;˙/¯Xl,
˛´T“@õÜ;˘TÑq™Ñ,
\Ày`AçÇZ≥Ñ˙;±Ö,
å·;ˆ÷hÆNóıÓŸƒq±∞©,
NæÆÄqæ∫;*ç
ó±√;ÚM¢°
NæÆÄqæ∫;*
õ…;ÔÙ∞NíDK∫O6Ë¿Ã,
õ…;ÔÙ∞NíDK∫O6Ë¿
õ…;ÔÙ∞NíDK∫O6Ë¿–,
v†S]¶Æ"Kª;ò_YItoç
v†S]¶Æ"Kª;ò_YIto
õ…;ÔÙ∞NíDK∫O6Ë¿’,
õ…;ÔÙ∞NíDK∫O6Ë¿ÿ,
ºf√qÎrJ]Ç…4Ê¯o;5˘öÈ±
HdÓï;ÑÏÅz™z±
æ;¡l,{3K¸V]ù˚
‰;óHæe
;ßx*ÇÅ¨
%∞2Çø;
ˇ†LœZ;Ár
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(±
_\õ=õ):;l˙<
ñ6sôRsHüeß;ÄÃSáp
ñ6sôRsHüeß;ÄÃSáB
T5`;BºÎ8
ád˘Ôn;…G¶ﬁ=m˙ÄD(±
ád˘Ôn;…G¶ﬁ=m˙ÄD(
‰S∫Ì=M9O†<ù.Ü;mî
>·-ˇ^;zÂ_
;©spŸ4◊≈QìX&p
;©spŸ4◊≈QìX&B
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
void CustomHlsl07FCE32A670B6737C5DAB2A3B1D59DE47BE79D94Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
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
CustomHlsl07FCE32A670B6737C5DAB2A3B1D59DE47BE79D94Emitter_KernelGrid_Func_(Context.Map.Grid3D_CreateConvolutionKernel.Radius, Context);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
EnterStatScope(0 /**SimulationStage_2_0*/);
//Begin Initialize Parameter Map Defaults
//End Initialize Parameter Map Defaults
Context.Map.Grid3D_CreateConvolutionKernel.Radius = Context.Map.Emitter.Grid3D_InitializeConvolutionKernel.Radius;
EnterStatScope(1 /**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
Grid3D_CreateConvolutionKernel_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
ExitStatScope(/**SimulationStage_2_0*/);
EnterStatScope(2 /**SimulationStage_2_0_Main*/);
FSimulationContext Context = (FSimulationContext)0;
Context.Map.Emitter.Grid3D_InitializeConvolutionKernel.Radius = Emitter_Grid3D_InitializeConvolutionKernel_Radius;
Context.Map.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.Map.Emitter.RandomSeed = Emitter_RandomSeed;
Context.Map.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.Map.Engine.System.RandomSeed = Engine_System_RandomSeed;
ReadDataSets(Context);
Context.Map.Engine.ExecIndex = ExecIndex();
Context.Map.Engine.Emitter.ID.ID = 0;
EnterStatScope(3 /**SimulationStage_2_0_MapMain*/);
Simulate(Context);
ExitStatScope(/**SimulationStage_2_0_MapMain*/);
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
ExitStatScope(/**SimulationStage_2_0_Main*/);
float SimFloat;
FParamMap0_Emitter_TemporaryGrid TemporaryGrid;
void SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(inout FSimulationContext Context);
float Constant1 = 0;
Context.Map.Emitter.TemporaryGrid.SimFloat = Constant1;
float Constant = 0;
EnterStatScope(1 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
float Emitter_dx;
int Emitter_SimGrid_PressureIndex;
float Emitter_DeltaTime;
float3 Emitter_SimGrid_Velocity;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter Emitter;
float3 Grad;
FParamMap0_OUTPUT_VAR_Grid3D_ComputeGradient Grid3D_ComputeGradient;
FParamMap0_OUTPUT_VAR_Grid3D_ProjectPressure Grid3D_ProjectPressure;
float dt;
float3 PressureGradient;
bool UseHighPrecisionCollisions;
float dx;
int ScalarIndex;
FParamMap0_Emitter_SimGrid SimGrid;
int SimGrid_PressureIndex;
FParamMap0_Grid3D_ComputeGradient Grid3D_ComputeGradient;
FParamMap0_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686 SetVariables_F07AF7D941D725DF04BE00AD577F0686;
void ExecutionIndexToGridIndex_Emitter_PressureGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetGridValue_Emitter_PressureGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
void CustomHlslB6B606DAD41A266BAF37DB2A616E42C21E3974DFEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl561D890CB3D115B3867D12E9BCF1A0769B6E8196_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void CustomHlsl264C2E5E15FCCC94CC70092FC88AB71B1660E52EEmitter_TransientGrid_Func_(float3 In_Velocity, int In_IndexX, int In_IndexY, int In_IndexZ, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float3 Out_VelocityOut);
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
float3 CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_Output_Grad;
CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_(Context.Map.Grid3D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexZ, Context.Map.Grid3D_ComputeGradient.ScalarIndex, CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_Output_Grad);
Context.Map.OUTPUT_VAR.Grid3D_ComputeGradient.Grad = CustomHlslE3BF9348E753BD3BDA61FFD0FDB1A04DA4B61D26Emitter_PressureGrid_Func_Output_Grad;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
const int FLUID_CELL = 0;
const int SOLID_CELL = 1;
const int EMPTY_CELL = 2;
Out_F_right = round(In_B_right.w) == SOLID_CELL ? 1 : 0;
Out_F_left = round(In_B_left.w) == SOLID_CELL ? 1 : 0;
Out_F_up = round(In_B_up.w) == SOLID_CELL ? 1 : 0;
Out_F_down = round(In_B_down.w) == SOLID_CELL ? 1 : 0;
Out_F_front = round(In_B_front.w) == SOLID_CELL ? 1 : 0;
Out_F_back = round(In_B_back.w) == SOLID_CELL ? 1 : 0;
Out_VelocityOut = In_Velocity;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
float4 B_center;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ, B_center);
int CellType = round(B_center.w);
int CellType_right = round(In_B_right.w);
int CellType_left = round(In_B_left.w);
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
int Constant1 = 0;
float3 Result = Context.Map.Grid3D_ProjectPressure.PressureGradient * Context.Map.Grid3D_ProjectPressure.dt;
float3 Result1 = Context.Map.Grid3D_ProjectPressure.Velocity - Result;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
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
Grid3D_ComputeGradient_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeGradient_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use High Precision Collisions"
Context.Map.Grid3D_ProjectPressure.PressureGradient = Context.Map.OUTPUT_VAR.Grid3D_ComputeGradient.Grad;
Context.Map.Grid3D_ProjectPressure.dt = Context.Map.Emitter.DeltaTime;
Context.Map.Grid3D_ProjectPressure.Velocity = Context.Map.Emitter.SimGrid.Velocity;
Context.Map.Grid3D_ProjectPressure.UseHighPrecisionCollisions = Constant;
EnterStatScope(2 /**Grid3D_ProjectPressure_Emitter_Func_*/);
Grid3D_ProjectPressure_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ProjectPressure_Emitter_Func_*/);
Context.Map.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity;
EnterStatScope(3 /**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_F07AF7D941D725DF04BE00AD577F0686_Emitter_Func_*/);
EnterStatScope(4 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.dx = Emitter_dx;
Context.Map.Emitter.SimGrid_PressureIndex = Emitter_SimGrid_PressureIndex;
Context.Map.Emitter.DeltaTime = Emitter_DeltaTime;
Context.Map.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
EnterStatScope(5 /**SimulationStage_2_0_MapMain*/);
float4x4 Emitter_UnitToWorld;
int Emitter_SimGrid_BoundaryIndex;
int Emitter_SimGrid_VelocityIndex;
float Boundary;
float3 SolidVelocity;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48_Emitter Emitter;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B_Transient Transient;
float3 ExtrapolatedVelocity;
FParamMap0_OUTPUT_VAR_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute002 Grid3D_GetFluidAttribute002;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute003 Grid3D_GetFluidAttribute003;
bool Drawable;
int IndexX;
int IndexY;
int IndexZ;
bool Resample;
float3 Unit;
FParamMap0_Local_Grid3D_GetFluidAttribute002 Grid3D_GetFluidAttribute002;
FParamMap0_Local_Grid3D_GetFluidAttribute003 Grid3D_GetFluidAttribute003;
FParamMap0_Local_Grid3D_Visualize_VectorField Grid3D_Visualize_VectorField;
float4x4 UnitToWorld;
float3 VectorValue;
int BoundaryIndex;
int VelocityIndex;
int SimGrid_BoundaryIndex;
int SimGrid_VelocityIndex;
FParamMap0_Grid3D_ExtrapolateVelocity001 Grid3D_ExtrapolateVelocity001;
FParamMap0_Grid3D_Visualize_VectorField Grid3D_Visualize_VectorField;
FParamMap0_Local Local;
FParamMap0_SetVariables_196415D64713B26D008A18AD62DEAC4B SetVariables_196415D64713B26D008A18AD62DEAC4B;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48 SetVariables_C7A11F704885D153E91991B58A269A48;
FParamMap0_Transient Transient;
void ExecutionIndexToGridIndex_Emitter_TransientGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void Grid3D_GetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void Grid3D_GetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_196415D64713B26D008A18AD62DEAC4B_Emitter_Func_(inout FSimulationContext Context);
void GetNumCells_Emitter_SimGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_PlaneOffset, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_Plane, int In_PlaneMax, out bool Out_Execute);
void Grid3D_Visualize_VectorField_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_Velocity, int In_VelocityIndex, int In_BoundaryIndex, out float3 Out_OutVelocity);
void Grid3D_ExtrapolateVelocity001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Enable"
int Constant = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant2 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Logic OR (Static)/Logic OR (Static)->Result"
int Constant3 = 0;
Context.Map.Local.Grid3D_GetFluidAttribute002.Resample = Constant3;
int Constant4 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Local.Module.Resample"
int Constant5 = 0;
float3 Constant6 = float3(0,0,0);
Context.Map.Local.Grid3D_GetFluidAttribute002.Unit = Constant6;
int Constant7 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Attribute"
int Constant8 = 7;
int Constant9 = 0;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TransientGrid(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(0, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float3 Output1;
Output1.x = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.x;
Output1.y = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.y;
Output1.z = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.z;
float Output11;
Output11 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value.w;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity = Output1;
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary = Output11;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Write To Transient"
int Constant10 = 1;
Context.Map.Transient.SolidVelocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.Map.Transient.Boundary = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Enable"
int Constant11 = 1;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample To Another Grid"
int Constant12 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant13 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Logic OR (Static)/Logic OR (Static)->Result"
int Constant14 = 0;
Context.Map.Local.Grid3D_GetFluidAttribute003.Resample = Constant14;
int Constant15 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Local.Module.Resample"
int Constant16 = 0;
float3 Constant17 = float3(0,0,0);
Context.Map.Local.Grid3D_GetFluidAttribute003.Unit = Constant17;
int Constant18 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Attribute"
int Constant19 = 4;
int Constant20 = 0;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float3 GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Write To Transient"
int Constant21 = 1;
Context.Map.Transient.Velocity = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute003.Velocity;
Context.Map.Transient.Boundary = Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Boundary;
Context.Map.Transient.Velocity = Context.Map.SetVariables_196415D64713B26D008A18AD62DEAC4B.Transient.Velocity;
Out_Execute = In_Plane == clamp(In_PlaneMax / 2 + In_PlaneOffset, 0, In_PlaneMax - 1);
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
Context.Map.Local.Grid3D_Visualize_VectorField.IndexX = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
Context.Map.Local.Grid3D_Visualize_VectorField.IndexY = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
Context.Map.Local.Grid3D_Visualize_VectorField.IndexZ = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
int Constant23 = 0;
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ;
GetNumCells_Emitter_SimGrid(1, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
bool CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_Output_Execute;
CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_(Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, Context.Map.Local.Grid3D_Visualize_VectorField.IndexY, Context.Map.Local.Grid3D_Visualize_VectorField.IndexZ, Constant23, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, GetNumCells_Emitter_SimGridOutput_NumCellsX, CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_Output_Execute);
Context.Map.Local.Grid3D_Visualize_VectorField.Drawable = CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_Output_Execute;
//SetConstantByStaticVariable "/Grid 3D Visualize Vector Field/Map Get/Map Get->Module.Draw Visualizer"
int Constant24 = 0;
Out_OutVelocity = In_Velocity;
int CellType = round(In_Boundary);
float TotalWeight = 0;
// if we have a boundary cell, then gather value from closest neighbor cell
    Out_OutVelocity = float3(0,0,0);
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
            GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocity(1, TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);
            Out_OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
    if (TotalWeight > 1e-5)
        Out_OutVelocity /= TotalWeight;
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity 001/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant26 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2);
int Constant27 = 1;
int GetNumCells_Emitter_SimGridOutput_NumCellsX1;
int GetNumCells_Emitter_SimGridOutput_NumCellsY1;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ1;
GetNumCells_Emitter_SimGrid(1, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float3 CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Constant27, Context.Map.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.Map.Transient.Velocity, Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
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
Context.Map.Grid3D_Visualize_VectorField.UnitToWorld = Context.Map.Emitter.UnitToWorld;
Context.Map.Grid3D_Visualize_VectorField.VectorValue = Context.Map.Emitter.SimGrid.Velocity;
int Constant22 = 0;
EnterStatScope(4 /**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Grid3D_Visualize_VectorField_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_Visualize_VectorField_Emitter_Func_*/);
Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex = Context.Map.Emitter.SimGrid_BoundaryIndex;
Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
int Constant25 = 1;
EnterStatScope(5 /**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Grid3D_ExtrapolateVelocity001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ExtrapolateVelocity001_Emitter_Func_*/);
Context.Map.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity;
EnterStatScope(6 /**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C7A11F704885D153E91991B58A269A48_Emitter_Func_*/);
EnterStatScope(7 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.Map.Emitter.SimGrid_BoundaryIndex = Emitter_SimGrid_BoundaryIndex;
Context.Map.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
EnterStatScope(8 /**SimulationStage_2_0_MapMain*/);
ÿˇR:˘≤zñy;Ÿ
float4x4 Emitter_LocalToWorld;
float4x4 Emitter_WorldToUnit;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_PICFLIPRatio;
bool IsInsideBoundary;
bool IsInsideDomain;
FParamMap0_OUTPUT_VAR_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
bool KillParticles;
float4x4 LocalToWorld;
float PicOrFlip;
float4x4 WorldToUnit;
float PICFLIPRatio;
FParamMap0_Emitter_Grid3D_FLIP_FLUID_CONTROLS Grid3D_FLIP_FLUID_CONTROLS;
bool Alive;
FParamMap0_DataInstance DataInstance;
FParamMap0_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
FParamMap0_KillParticles KillParticles;
void NiagaraScript_785_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TransientGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void CustomHlsl7D4A0578E3963D141C37C58BC87F117D793284B5_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlslCE07342C0072B2EE0412A0F9F923174B8C520878_Func_(float3 In_UnitPos, out float Out_ret);
void CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_(float In_Mask, out bool Out_IsInside);
void CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_(float In_Mask, out bool Out_IsInside);
void SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(int In_InstanceData, float3 In_Unit, out float3 Out_Value);
void Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Grid3D_FLIP_ParticleUpdate_Emitter_Func_(inout FSimulationContext Context);
void KillParticles_Emitter_Func_(inout FSimulationContext Context);
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
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result21;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result26;
bool Constant4 = false;
float4x4 Matrix_IfResult;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_785_Func_Output_bUseOriginal;
float4x4 NiagaraScript_785_Func_Output_OutTransform;
bool NiagaraScript_785_Func_Output_LocalToWorld;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant4, NiagaraScript_785_Func_Output_bUseOriginal, NiagaraScript_785_Func_Output_OutTransform, NiagaraScript_785_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_785_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InPosition;
Vector_IfResult = Result27;
Out_OutPosition = Vector_IfResult;
Out_IsInside = round(In_Mask) ==2;
  In_UnitPos.z >= 0 && In_UnitPos.x <= 1 && 
In_UnitPos.y <= 1 && In_UnitPos.z <= 1;
Out_IsInside = In_Mask > 1e-7;
Out_IsInside = round(In_Mask) == 1;
bool Constant15 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.Map.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.Map.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_785_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_785_Func_Output_OutTransform1;
bool NiagaraScript_785_Func_Output_LocalToWorld1;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant15, NiagaraScript_785_Func_Output_bUseOriginal1, NiagaraScript_785_Func_Output_OutTransform1, NiagaraScript_785_Func_Output_LocalToWorld1, Context);
float3 Result38 = mul(float4(In_InPosition,1.0),NiagaraScript_785_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
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
bool NiagaraScript_785_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_785_Func_Output_OutTransform2;
bool NiagaraScript_785_Func_Output_LocalToWorld2;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant19, NiagaraScript_785_Func_Output_bUseOriginal2, NiagaraScript_785_Func_Output_OutTransform2, NiagaraScript_785_Func_Output_LocalToWorld2, Context);
float3 Result41 = mul(float4(In_InVector,0.0),NiagaraScript_785_Func_Output_OutTransform2).xyz;
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
bool NiagaraScript_785_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_785_Func_Output_OutTransform3;
bool NiagaraScript_785_Func_Output_LocalToWorld3;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant23, NiagaraScript_785_Func_Output_bUseOriginal3, NiagaraScript_785_Func_Output_OutTransform3, NiagaraScript_785_Func_Output_LocalToWorld3, Context);
float3 Result44 = mul(float4(In_InVector,0.0),NiagaraScript_785_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InVector;
Vector_IfResult3 = Result44;
Out_OutVector = Vector_IfResult3;
int Constant2 = 1;
bool Constant3 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.Map.Particles.Position, Constant1, Constant2, Constant3, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
Output1.x = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.x;
Output1.y = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.y;
Output1.z = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.z;
float3 Result28 = mul(float4(((float3)Output1),1.0),Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TransientGridOutput_Index;
UnitToFloatIndex_Emitter_TransientGrid(1, Result28, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result29 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float X;
float Y;
float Z;
X = Result29.x;
Y = Result29.y;
Z = Result29.z;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, X, Y, Z, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value);
float X1;
float Y1;
float Z1;
float W;
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
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(0, Result30, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result35 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result36 = Result35 * Context.Map.Engine.DeltaTime;
float3 Result37 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result36;
int Constant12 = 1;
bool Constant14 = false;
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
float3 Result43 = lerp(Result35,Result42,Context.Map.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant20 = 1;
int Constant21 = 0;
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
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl770D47F70A41265D040B0351C90F1F322CEEDBC3_Func_Output_IsInside;
Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl9660BA6CE876AFCD185E88682919D3BDC7BBA3F0_Func_Output_IsInside;
bool Constant29 = false;
bool bool_IfResult;
bool_IfResult = Constant29;
bool_IfResult = Context.Map.DataInstance.Alive;
Context.Map.DataInstance.Alive = bool_IfResult;
Context.Map.Grid3D_FLIP_ParticleUpdate.LocalToWorld = Context.Map.Emitter.LocalToWorld;
Context.Map.Grid3D_FLIP_ParticleUpdate.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_FLIP_ParticleUpdate.PicOrFlip = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PICFLIPRatio;
bool Constant = false;
EnterStatScope(1 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.Map.KillParticles.KillParticles = Context.Map.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant28 = true;
Context.Map.DataInstance.Alive = Constant28;
EnterStatScope(2 /**KillParticles_Emitter_Func_*/);
KillParticles_Emitter_Func_(Context);
ExitStatScope(/**KillParticles_Emitter_Func_*/);
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
float Emitter_RasterizationGrid3D_Initialize_dx;
int Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_SDFParticleSizeMult;
int HalfBandwidth;
float RadiusMult;
bool SourceIsLocalSpace;
float SDFParticleSizeMult;
FParamMap0_Emitter_RasterizationGrid3D_Initialize RasterizationGrid3D_Initialize;
FParamMap0_RasterizationGrid_ParticleSource RasterizationGrid_ParticleSource;
void GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void NiagaraScript_805_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float2 Out_Value);
void UnitToFloatIndex_Emitter_RasterizationGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void GetNumCells_Emitter_RasterizationGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void InterlockedMinFloatGridValue_Emitter_RasterizationGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslB544A9E538432FF18AEF98B568B5655BE5F20F30Emitter_RasterizationGrid_Func_(float3 In_Position, float2 In_SpriteSize, float3 In_Index, float In_dx, int In_HalfBandwidth, float In_RadiusMult, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, inout FSimulationContext Context);
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
bool Constant12 = false;
NiagaraScript_785_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant12, NiagaraScript_785_Func_Output_bUseOriginal, NiagaraScript_785_Func_Output_OutTransform, NiagaraScript_785_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_785_Func_Output_OutTransform).xyz;
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
CustomHlslB544A9E538432FF18AEF98B568B5655BE5F20F30Emitter_RasterizationGrid_Func_(Output1, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.Map.RasterizationGrid_ParticleSource.dx, Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth, Context.Map.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
Context.Map.RasterizationGrid_ParticleSource.dx = Context.Map.Emitter.RasterizationGrid3D_Initialize.dx;
Context.Map.RasterizationGrid_ParticleSource.HalfBandwidth = Context.Map.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.Map.RasterizationGrid_ParticleSource.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.RasterizationGrid_ParticleSource.RadiusMult = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult;
Context.Map.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant;
EnterStatScope(1 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
RasterizationGrid_ParticleSource_Emitter_Func_(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func_*/);
Context.Map.Emitter.RasterizationGrid3D_Initialize.dx = Emitter_RasterizationGrid3D_Initialize_dx;
Context.Map.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth = Emitter_RasterizationGrid3D_Initialize_HalfBandwidth;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult = Emitter_Grid3D_FLIP_FLUID_CONTROLS_SDFParticleSizeMult;
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
void CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
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
int Result = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant3;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(0, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
float3 Constant4 = float3(1,0,0);
float CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Constant4, Constant1, CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.Map.Emitter.SDFGrid.SDF = Context.Map.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
EnterStatScope(1 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Grid3D_ConvolveAxis001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.Map.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(2 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter Emitter;
FParamMap0_OUTPUT_VAR_Grid3D_ConvolveAxis Grid3D_ConvolveAxis;
FParamMap0_SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7 SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7;
void ExecutionIndexToGridIndex_Emitter_SDFGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_SDFGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetPreviousFloatValueAtIndex_Emitter_SDFGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_(int In_Radius, int In_IndexX, int In_IndexY, int In_IndexZ, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, float3 In_ConvAxis, int In_AttributeIndex, out float Out_ConvolvedValue);
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
float3 Constant4 = float3(0,1,0);
float CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant4, Constant1, CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.Map.Emitter.SDFGrid.SDF = Context.Map.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
EnterStatScope(1 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Grid3D_ConvolveAxis_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.Map.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(2 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
2£;íy–¬
ád˘Ôn;…G¶ﬁ=m˙ÄD(Í
‰S∫Ì=M9O†<ù.Ü;mîË
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
float3 Constant4 = float3(0,0,1);
Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.SetFromVector"
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
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(2, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(2, Constant13, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.Map.Local.Grid3D_SetRTValues.Value);
EnterStatScope(1 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Grid3D_ConvolveAxis002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Context.Map.Grid3D_SetRTValues.Red = Context.Map.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
float Constant5 = 0;
float Constant6 = 0;
float Constant7 = 0;
EnterStatScope(2 /**Grid3D_SetRTValues_Emitter_Func_*/);
Grid3D_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues_Emitter_Func_*/);
float3 StartVelocity;
FParamMap0_Emitter_StartVelocityGrid StartVelocityGrid;
void SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(inout FSimulationContext Context);
float3 Constant1 = float3(0,0,0);
Context.Map.Emitter.StartVelocityGrid.StartVelocity = Constant1;
float3 Constant = float3(0,0,0);
EnterStatScope(1 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
float4x4 Emitter_WorldToLocal;
int Emitter_SimGrid_SimFloatIndex;
bool UseRasterizationGrid;
float4x4 WorldToLocal;
int SimGrid_SimFloatIndex;
FParamMap0_Grid3D_FLIP_RasterizeParticles Grid3D_FLIP_RasterizeParticles;
void Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void UnitToFloatIndex_Emitter_TemporaryGrid(int In_InstanceData, float3 In_Unit, out float3 Out_Index);
void Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SetGridValue_Emitter_TemporaryGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void InterlockedAddFloatGridValueSafe_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IsSafe);
void InterlockedAddFloatGridValue_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslB7AFD42C69DDE685BF5C57E72A28C76C3C0EF335Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func_(inout FSimulationContext Context);
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
int Constant4 = 1;
bool Constant5 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.Map.Particles.Position, Constant3, Constant4, Constant5, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result28 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(2, Result28, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant14 = 1;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.Map.Particles.Velocity, Constant13, Constant14, Constant15, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result30 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlslB7AFD42C69DDE685BF5C57E72A28C76C3C0EF335Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result30, Context.Map.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use Rasterization Grid For P2G"
Context.Map.Grid3D_FLIP_RasterizeParticles.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.Map.Emitter.WorldToUnit;
Context.Map.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.Map.Emitter.WorldToLocal;
Context.Map.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.Map.Emitter.SimGrid_SimFloatIndex;
Context.Map.Grid3D_FLIP_RasterizeParticles.UseRasterizationGrid = Constant;
bool Constant1 = false;
EnterStatScope(1 /**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Grid3D_FLIP_RasterizeParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Context.Map.Emitter.WorldToLocal = Emitter_WorldToLocal;
Context.Map.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
p˙∫‹[üE”;˘Öéä°*
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_CollisionVelocityMult;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryUp;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryLeft;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryRight;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryDown;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryFront;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryBack;
float BoundarySignedDistance;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704_Transient Transient;
bool UseHighPrecision;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute Grid3D_GetFluidAttribute;
float3 UnitPosition;
float3 WorldPos;
FParamMap0_Local_Grid3D_ComputeBoundary Grid3D_ComputeBoundary;
FParamMap0_Local_Grid3D_GetFluidAttribute Grid3D_GetFluidAttribute;
bool Enable;
float3 OffsetSamplePosition;
bool OpenBoundaryASC43X;
bool OpenBoundaryASC43Y;
bool OpenBoundaryASC43Z;
bool OpenBoundaryASC45X;
bool OpenBoundaryASC45Y;
bool OpenBoundaryASC45Z;
bool UseLandscapeCollisions;
float VelocityScale;
float CollisionVelocityMult;
bool OpenBoundaryBack;
bool OpenBoundaryDown;
bool OpenBoundaryFront;
bool OpenBoundaryLeft;
bool OpenBoundaryRight;
bool OpenBoundaryUp;
FParamMap0_Grid3D_ComputeBoundary Grid3D_ComputeBoundary;
FParamMap0_Grid3D_SetFluidAttribute003 Grid3D_SetFluidAttribute003;
FParamMap0_Grid3D_SetFluidAttribute004 Grid3D_SetFluidAttribute004;
FParamMap0_ScratchDynamicInput_01 ScratchDynamicInput_01;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704 SetVariables_A6C8B03743BE41C39A693F9918B79704;
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_01_Emitter_Func_(out float3 Out_Output, inout FSimulationContext Context);
void IndexToUnit_Emitter_SimGrid(int In_InstanceData, float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(int In_InstanceData, float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, float In_MaxDistance, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestVelocity);
void GetHeight_User_LandscapeCollisions(int In_InstanceData, float3 In_WorldPos, out float Out_Value, out bool Out_IsValid);
void CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func_(inout FSimulationContext Context);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
Context.Map.Local.Grid3D_GetFluidAttribute.Resample = Constant3;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Local.Module.Resample"
Context.Map.Local.Grid3D_GetFluidAttribute.Unit = Constant6;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant8 = 3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Write To Transient"
Context.Map.Transient.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.Map.Transient.Boundary = Context.Map.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
//SetConstantByStaticVariable "/Scratch Dynamic Input 01/Map Get/Map Get->Module.Use High Precision"
float3 Constant14 = float3(0,0,0);
Out_Output = Constant14;
Out_Boundary = 0;
  Out_Boundary = In_OpenBoundaryRight ? 2 : 1;
  Out_Boundary = In_OpenBoundaryLeft ? 2 : 1;
  Out_Boundary = In_OpenBoundaryDown ? 2 : 1;
  Out_Boundary = In_OpenBoundaryUp ? 2 : 1;
  Out_Boundary = In_OpenBoundaryBack ? 2 : 1;
  Out_Boundary = In_OpenBoundaryFront ? 2 : 1;
const  int RASTERIZED_FLUID_CELL = 3;
Out_RetBoundary = EMPTY_CELL;
  Out_RetBoundary = FLUID_CELL;
  Out_RetBoundary = In_SolidValue;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Landscape Collisions"
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Particle Collisions"
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Geometry Collection Collisions"
int Constant17 = 0;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Collisions"
int Constant18 = 1;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Mesh Distance Fields"
int Constant19 = 1;
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Depth Map Collisions"
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Global Distance Field Collisions"
Output1.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output1.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output1.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result = Output1 + Context.Map.Grid3D_ComputeBoundary.OffsetSamplePosition;
X = Result.x;
Y = Result.y;
Z = Result.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(1, X, Y, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Constant22 = float3(0,0,0);
float3 Output11;
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
float3 Output12;
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
//SetConstantByStaticVariable "/Grid 3D Compute Boundary/Map Get/Map Get->Module.Use Free Surface"
int Constant34 = 1;
float CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary;
CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_(NiagaraFloat_SelectResult1, Context.Map.Transient.Boundary, CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary);
Context.Map.Transient.Boundary = CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary;
Context.Map.Transient.BoundarySignedDistance = NiagaraFloat001_SelectResult1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Enable"
int Constant36 = 1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 004/Map Get/Map Get->Module.Attribute"
int Constant37 = 7;
ExecutionIndexToGridIndex_Emitter_TransientGrid(5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float X2;
float Y2;
float Z2;
X2 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.x;
Y2 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.y;
Z2 = Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity.z;
float4 Output13;
Output13.x = X2;
Output13.y = Y2;
Output13.z = Z2;
Output13.w = Context.Map.Grid3D_SetFluidAttribute004.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(5, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output13);
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 003/Map Get/Map Get->Module.Enable"
int Constant39 = 0;
EnterStatScope(1 /**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Grid3D_GetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Context.Map.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary = Context.Map.Transient.SimFloat;
EnterStatScope(2 /**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
int Constant11 = 0;
Context.Map.ScratchDynamicInput_01.UseHighPrecision = Constant11;
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use Landscape Collisions"
float3 ScratchDynamicInput_01_Emitter_Func_Output_Output;
ScratchDynamicInput_01_Emitter_Func_(ScratchDynamicInput_01_Emitter_Func_Output_Output, Context);
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
Grid3D_ComputeBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeBoundary_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Not Use High Precision Collisions"
int Constant35 = 1;
Context.Map.Grid3D_SetFluidAttribute004.Boundary = Context.Map.Transient.Boundary;
Context.Map.Grid3D_SetFluidAttribute004.SolidVelocity = Context.Map.Transient.SolidVelocity;
Context.Map.Grid3D_SetFluidAttribute004.Enable = Constant35;
EnterStatScope(4 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Grid3D_SetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
int Constant38 = 0;
Context.Map.Grid3D_SetFluidAttribute003.Boundary = Context.Map.Transient.BoundarySignedDistance;
Context.Map.Grid3D_SetFluidAttribute003.SolidVelocity = Context.Map.Transient.SolidVelocity;
Context.Map.Grid3D_SetFluidAttribute003.Enable = Constant38;
EnterStatScope(5 /**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
Grid3D_SetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
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
float Emitter_dt;
float3 FaceFraction;
float3 FaceVals;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute006 Grid3D_GetFluidAttribute006;
FParamMap0_Local_Grid3D_ComputeHighPrecisionBoundary Grid3D_ComputeHighPrecisionBoundary;
FParamMap0_Local_Grid3D_GetFluidAttribute006 Grid3D_GetFluidAttribute006;
FParamMap0_Grid3D_ComputeHighPrecisionBoundary Grid3D_ComputeHighPrecisionBoundary;
FParamMap0_Grid3D_SetFluidAttribute002 Grid3D_SetFluidAttribute002;
FParamMap0_ScratchModule_02 ScratchModule_02;
void Grid3D_GetFluidAttribute006_Emitter_Func_(inout FSimulationContext Context);
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
void Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(float In_dt, out float Out_XFace, out float Out_YFace, out float Out_ZFace, out bool Out_IsFullyInsideBoundary, out float3 Out_SolidVelocity, inout FSimulationContext Context);
void CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_(float3 In_Face, float In_MinFaceFraction, out float3 Out_FaceFraction);
void GetNumCells_Emitter_TransientGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute002_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_FaceGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, float3 In_Value);
void ScratchModule_02_Emitter_Func_(inout FSimulationContext Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample To Another Grid"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample From Previous Frame"
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Logic OR (Static)/Logic OR (Static)->Result"
Context.Map.Local.Grid3D_GetFluidAttribute006.Resample = Constant3;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Local.Module.Resample"
Context.Map.Local.Grid3D_GetFluidAttribute006.Unit = Constant6;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Attribute"
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Write To Transient"
Context.Map.Transient.SimFloat = Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute006.SimFloat;
float4 TmpSolidVelocity_Boundary;
Out_AverageSolidVelocity = float3(0,0,0);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ, TmpSolidVelocity_Boundary);
Out_AverageSolidVelocity += TmpSolidVelocity_Boundary.xyz;
Out_theta_ppp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY, In_IndexZ-1, TmpSolidVelocity_Boundary);
Out_theta_ppn = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY-1, In_IndexZ-1, TmpSolidVelocity_Boundary);
Out_theta_pnn = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX, In_IndexY-1, In_IndexZ, TmpSolidVelocity_Boundary);
Out_theta_pnp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY-1, In_IndexZ, TmpSolidVelocity_Boundary);
Out_theta_nnp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY, In_IndexZ, TmpSolidVelocity_Boundary);
Out_theta_npp = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY, In_IndexZ-1, TmpSolidVelocity_Boundary);
Out_theta_npn = TmpSolidVelocity_Boundary.w;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(1, In_IndexX-1, In_IndexY-1, In_IndexZ-1, TmpSolidVelocity_Boundary);
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
float CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_Output_AreaFraction;
CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_(In_INPUT_VAR, CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_Output_AreaFraction);
Out_AreaFraction = CustomHlsl09E4C5A5E3F70755DAD4F8E7B0B25959631EAF10_Func_Output_AreaFraction;
Out_Avg = .25 * (In_A+In_B+In_C+In_D);
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
    In_theta_ppp < 1e-20 && 
    In_theta_ppn < 1e-20 && 
    In_theta_pnn < 1e-20 && 
    In_theta_pnp < 1e-20 && 
    In_theta_nnp < 1e-20 && 
    In_theta_npp < 1e-20 && 
    In_theta_npn < 1e-20 && 
    In_theta_nnn < 1e-20;
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
Out_FaceFraction.x = In_Face.x > 1e-20 ? max(In_Face.x, In_MinFaceFraction) : 0;
Out_FaceFraction.y = In_Face.y > 1e-20 ? max(In_Face.y, In_MinFaceFraction) : 0;
Out_FaceFraction.z = In_Face.z > 1e-20 ? max(In_Face.z, In_MinFaceFraction) : 0;
Out_FaceFraction = saturate(Out_FaceFraction);
float3 ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
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
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
bool Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary;
float3 Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(Context.Map.Grid3D_ComputeHighPrecisionBoundary.dt, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity, Context);
Output12.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output12.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output12.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
float3 CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_Output_FaceFraction;
CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_(Output12, Constant13, CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_Output_FaceFraction);
Context.Map.Transient.FaceFraction = CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_Output_FaceFraction;
Context.Map.Transient.SolidVelocity = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
//SetConstantByStaticVariable "/Grid 3D Compute High Precision Boundary/Map Get/Map Get->Module.Use Free Surface"
float Constant15 = 1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_TransientGrid(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1);
int Constant16 = 2;
int GetNumCells_Emitter_TransientGridOutput_NumCellsX;
int GetNumCells_Emitter_TransientGridOutput_NumCellsY;
int GetNumCells_Emitter_TransientGridOutput_NumCellsZ;
GetNumCells_Emitter_TransientGrid(1, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ);
CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, Constant16, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_Output_Boundary);
float Constant17 = (0.0);
float NiagaraFloat_SelectResult = Constant17;
NiagaraFloat_SelectResult = Constant15;
CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_(NiagaraFloat_SelectResult, Context.Map.Transient.SimFloat, CustomHlsl11F3E339A9F56D0E00D2030428974195230889E9_Func_Output_RetBoundary);
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 002/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 002/Map Get/Map Get->Module.Attribute"
int Constant19 = 7;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TransientGrid(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2);
X1 = Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity.x;
Y1 = Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity.y;
Z1 = Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity.z;
Output13.x = X1;
Output13.y = Y1;
Output13.z = Z1;
Output13.w = Context.Map.Grid3D_SetFluidAttribute002.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, Output13);
//SetConstantByStaticVariable "/Scratch Module 02/Map Get/Map Get->Module.Use High Precision Collisions"
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_FaceGrid(2, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ);
SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(2, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, Context.Map.ScratchModule_02.FaceVals);
EnterStatScope(1 /**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Grid3D_GetFluidAttribute006_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
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
Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeHighPrecisionBoundary_Emitter_Func_*/);
Context.Map.Grid3D_SetFluidAttribute002.Boundary = Context.Map.Transient.Boundary;
Context.Map.Grid3D_SetFluidAttribute002.SolidVelocity = Context.Map.Transient.SolidVelocity;
EnterStatScope(3 /**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Grid3D_SetFluidAttribute002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute002_Emitter_Func_*/);
Context.Map.ScratchModule_02.FaceVals = Context.Map.Transient.FaceFraction;
EnterStatScope(4 /**ScratchModule_02_Emitter_Func_*/);
ScratchModule_02_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_02_Emitter_Func_*/);
EnterStatScope(5 /**SimulationStage_2_0_Main*/);
Context.Map.Emitter.dt = Emitter_dt;
EnterStatScope(6 /**SimulationStage_2_0_MapMain*/);
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC_Transient Transient;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB_Emitter Emitter;
FParamMap0_OUTPUT_VAR_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute001 Grid3D_GetFluidAttribute001;
FParamMap0_Local_Grid3D_GetFluidAttribute001 Grid3D_GetFluidAttribute001;
FParamMap0_Grid3D_ExtrapolateVelocity Grid3D_ExtrapolateVelocity;
FParamMap0_Grid3D_SetFluidAttribute001 Grid3D_SetFluidAttribute001;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB SetVariables_A802BB404624ACFB5C9C96987F3207AB;
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC SetVariables_C70B065E4ACA60099D622884219EB2AC;
void Grid3D_GetFluidAttribute001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C70B065E4ACA60099D622884219EB2AC_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(int In_InstanceData, out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetNumCells_Emitter_RasterizationGrid_velocity(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void GetFloatGridValue_Emitter_RasterizationGrid_velocity(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_ExtrapolationHalfWidth, float In_Boundary, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, int In_BoundaryIndex, out float3 Out_OutVelocity);
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
//SetConstantByStaticVariable "/Grid 3D Extrapolate Velocity/Map Get/Map Get->Module.Use Rasterization Grid"
int Constant13 = 1;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocity(2, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(2, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant14, Context.Map.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
Context.Map.OUTPUT_VAR.Grid3D_ExtrapolateVelocity.ExtrapolatedVelocity = CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_A802BB404624ACFB5C9C96987F3207AB.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute 001/Map Get/Map Get->Module.Attribute"
int Constant16 = 9;
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
Context.Map.Grid3D_ExtrapolateVelocity.UseRasterizationGrid = Constant11;
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
float Div;
FParamMap0_OUTPUT_VAR_Grid3D_ComputeDivergence Grid3D_ComputeDivergence;
int VectorIndex;
float Pressure;
FParamMap0_Emitter_PressureGrid PressureGrid;
FParamMap0_Grid3D_ComputeDivergence Grid3D_ComputeDivergence;
FParamMap0_Grid3D_SetFluidAttribute Grid3D_SetFluidAttribute;
void GetGridValue_Emitter_SimGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_VectorIndex, out float Out_Div);
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
float CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_Output_Div;
CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_(Context.Map.Grid3D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ, Context.Map.Grid3D_ComputeDivergence.VectorIndex, CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_Output_Div);
Context.Map.OUTPUT_VAR.Grid3D_ComputeDivergence.Div = CustomHlsl733BDBDBE74EC66716A8929CD65F94D22B72835AEmitter_SimGrid_Func_Output_Div;
Context.Map.Emitter.PressureGrid.Pressure = Constant1;
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Enable"
//SetConstantByStaticVariable "/Grid 3D Set Fluid Attribute/Map Get/Map Get->Module.Attribute"
int Constant3 = 3;
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
EnterStatScope(0 /**SimulationStage_2_1*/);
ExitStatScope(/**SimulationStage_2_1*/);
EnterStatScope(2 /**SimulationStage_2_1_Main*/);
EnterStatScope(3 /**SimulationStage_2_1_MapMain*/);
ExitStatScope(/**SimulationStage_2_1_MapMain*/);
ExitStatScope(/**SimulationStage_2_1_Main*/);
float Constants_Emitter_SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_TemporaryGrid_SimFloat;
Context.Map.Emitter.TemporaryGrid.SimFloat = Constants_Emitter_SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_TemporaryGrid_SimFloat;
float3 Constants_Emitter_SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_StartVelocityGrid_StartVelocity;
Context.Map.Emitter.StartVelocityGrid.StartVelocity = Constants_Emitter_SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_StartVelocityGrid_StartVelocity;
void NiagaraScript_7_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
bool NiagaraScript_7_Func_Output_bUseOriginal;
float4x4 NiagaraScript_7_Func_Output_OutTransform;
bool NiagaraScript_7_Func_Output_LocalToWorld;
NiagaraScript_7_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant6, NiagaraScript_7_Func_Output_bUseOriginal, NiagaraScript_7_Func_Output_OutTransform, NiagaraScript_7_Func_Output_LocalToWorld, Context);
float3 Result27 = mul(float4(In_InPosition,1.0),NiagaraScript_7_Func_Output_OutTransform).xyz;
bool NiagaraScript_7_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_7_Func_Output_OutTransform1;
bool NiagaraScript_7_Func_Output_LocalToWorld1;
NiagaraScript_7_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant16, NiagaraScript_7_Func_Output_bUseOriginal1, NiagaraScript_7_Func_Output_OutTransform1, NiagaraScript_7_Func_Output_LocalToWorld1, Context);
float3 Result29 = mul(float4(In_InVector,0.0),NiagaraScript_7_Func_Output_OutTransform1).xyz;
EnterStatScope(6 /**SimulationStage_2_1_Main*/);
EnterStatScope(7 /**SimulationStage_2_1_MapMain*/);
int Constants_Emitter_Grid3D_ExtrapolateVelocity_ExtrapolationHalfWidth;
CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constants_Emitter_Grid3D_ExtrapolateVelocity_ExtrapolationHalfWidth, Context.Map.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.Map.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl23EA40C2DD439A20861B345009860BBB550A7687Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
int Constant14 = 9;
float Constants_Emitter_SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_PressureGrid_Pressure;
Context.Map.Emitter.PressureGrid.Pressure = Constants_Emitter_SetVariables_90FC1D2343C06AAC946BEF88CB8F6BCB_Emitter_PressureGrid_Pressure;
int Constant1 = 3;
EnterStatScope(4 /**SimulationStage_2_1_Main*/);
EnterStatScope(5 /**SimulationStage_2_1_MapMain*/);
float Emitter_PressureGrid_Pressure;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_PressureRelaxation;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_PressureGrid PressureGrid;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter Emitter;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute004 Grid3D_GetFluidAttribute004;
FParamMap0_OUTPUT_VAR_Grid3D_GetFluidAttribute005 Grid3D_GetFluidAttribute005;
FParamMap0_OUTPUT_VAR_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_Local_Grid3D_GetFluidAttribute004 Grid3D_GetFluidAttribute004;
FParamMap0_Local_Grid3D_GetFluidAttribute005 Grid3D_GetFluidAttribute005;
float Divergence;
float Relaxation;
float PressureRelaxation;
FParamMap0_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4 SetVariables_9DBFE6D34A13F2D4792275A8C97387E4;
void Grid3D_GetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute005_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslF40400A64965C0312634C0BF5C71BA9F828D6ADB_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void NiagaraScript_12_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_(float In_InFloat, out float Out_OutFloat);
void NiagaraScript_13_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
void CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_InstanceData, int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
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
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Logic OR (Static)/Logic OR (Static)->Result"
Context.Map.Local.Grid3D_GetFluidAttribute005.Resample = Constant14;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Local.Module.Resample"
Context.Map.Local.Grid3D_GetFluidAttribute005.Unit = Constant17;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Attribute"
Context.Map.OUTPUT_VAR.Grid3D_GetFluidAttribute005.Velocity = GetPreviousVectorValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Write To Transient"
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
Out_OutFloat = saturate (In_InFloat);
float CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_Output_OutFloat;
CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_(In_Value, CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_Output_OutFloat);
Out_ClampedValue = CustomHlsl58CF55DE9BF2749F10424C8E8CB29B58F0189B31_Func_Output_OutFloat;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX+1, In_IndexY, In_IndexZ, Out_B_right);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX-1, In_IndexY, In_IndexZ, Out_B_left);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY+1, In_IndexZ, Out_B_up);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY-1, In_IndexZ, Out_B_down);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ+1, Out_B_front);
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ-1, Out_B_back);
Out_Pressure = 0;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(2, In_IndexX, In_IndexY, In_IndexZ, B_center);
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
   P_right = 0;
    FluidCellCount -= lerp(0, 1, In_F_right);
    BoundaryAdd += lerp(0, Scale * (In_Velocity.x - In_B_right.x), In_F_right);
    P_right = lerp(P_right, 0, In_F_right);
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
int NiagaraScript_12_Func_Output_IterationIndex;
int NiagaraScript_12_Func_Output_MaxIterations;
float NiagaraScript_12_Func_Output_NormalizedIterationIndex;
int NiagaraScript_12_Func_Output_LoopIndex;
int NiagaraScript_12_Func_Output_NumberOfLoops;
float NiagaraScript_12_Func_Output_NormalizedLoopIndex;
NiagaraScript_12_Func_(NiagaraScript_12_Func_Output_IterationIndex, NiagaraScript_12_Func_Output_MaxIterations, NiagaraScript_12_Func_Output_NormalizedIterationIndex, NiagaraScript_12_Func_Output_LoopIndex, NiagaraScript_12_Func_Output_NumberOfLoops, NiagaraScript_12_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_13_Particle_Func_Output_ClampedValue;
NiagaraScript_13_Particle_Func_(Context.Map.Grid3D_PressureIteration.Relaxation, NiagaraScript_13_Particle_Func_Output_ClampedValue, Context);
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
CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_(Context.Map.Grid3D_PressureIteration.dx, Context.Map.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Context.Map.Grid3D_PressureIteration.Divergence, NiagaraScript_12_Func_Output_IterationIndex, NiagaraScript_13_Particle_Func_Output_ClampedValue, Context.Map.Grid3D_PressureIteration.Velocity, Context.Map.Grid3D_PressureIteration.Pressure, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_right, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_left, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_up, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_down, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_front, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_back, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_right, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_left, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_up, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_down, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_front, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_back, CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
Context.Map.OUTPUT_VAR.Grid3D_PressureIteration.Pressure = CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
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
Context.Map.Grid3D_PressureIteration.UseHighPrecisionCollisions = Constant22;
Context.Map.Grid3D_PressureIteration.Relaxation = Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation;
EnterStatScope(3 /**Grid3D_PressureIteration_Emitter_Func_*/);
Grid3D_PressureIteration_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_PressureIteration_Emitter_Func_*/);
Context.Map.SetVariables_9DBFE6D34A13F2D4792275A8C97387E4.Emitter.PressureGrid.Pressure = Context.Map.OUTPUT_VAR.Grid3D_PressureIteration.Pressure;
EnterStatScope(4 /**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_*/);
EnterStatScope(5 /**SimulationStage_2_1_Main*/);
Context.Map.Emitter.PressureGrid.Pressure = Emitter_PressureGrid_Pressure;
Context.Map.Emitter.Grid3D_FLIP_FLUID_CONTROLS.PressureRelaxation = Emitter_Grid3D_FLIP_FLUID_CONTROLS_PressureRelaxation;
EnterStatScope(6 /**SimulationStage_2_1_MapMain*/);
void NiagaraScript_790_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void NiagaraScript_791_Particle_Func_(float In_Value, out float Out_ClampedValue, inout FSimulationContext Context);
int NiagaraScript_790_Func_Output_IterationIndex;
int NiagaraScript_790_Func_Output_MaxIterations;
float NiagaraScript_790_Func_Output_NormalizedIterationIndex;
int NiagaraScript_790_Func_Output_LoopIndex;
int NiagaraScript_790_Func_Output_NumberOfLoops;
float NiagaraScript_790_Func_Output_NormalizedLoopIndex;
NiagaraScript_790_Func_(NiagaraScript_790_Func_Output_IterationIndex, NiagaraScript_790_Func_Output_MaxIterations, NiagaraScript_790_Func_Output_NormalizedIterationIndex, NiagaraScript_790_Func_Output_LoopIndex, NiagaraScript_790_Func_Output_NumberOfLoops, NiagaraScript_790_Func_Output_NormalizedLoopIndex, Context);
float NiagaraScript_791_Particle_Func_Output_ClampedValue;
NiagaraScript_791_Particle_Func_(Context.Map.Grid3D_PressureIteration.Relaxation, NiagaraScript_791_Particle_Func_Output_ClampedValue, Context);
CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_(Context.Map.Grid3D_PressureIteration.dx, Context.Map.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Context.Map.Grid3D_PressureIteration.Divergence, NiagaraScript_790_Func_Output_IterationIndex, NiagaraScript_791_Particle_Func_Output_ClampedValue, Context.Map.Grid3D_PressureIteration.Velocity, Context.Map.Grid3D_PressureIteration.Pressure, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_right, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_left, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_up, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_down, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_front, CustomHlsl4D54B658744B31B0EC2D818FB6AD049461C1DC21_Func_Output_F_back, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_right, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_left, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_up, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_down, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_front, CustomHlslA337C7555C717CF79FFD2B75CEA59287CB872E85Emitter_TransientGrid_Func_Output_B_back, CustomHlsl8265B8E95A8E0689F0E3485D976911AA7259B94AEmitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
int Constants_Emitter_Grid3D_Visualize_VectorField_PlaneOffset;
int Constants_Emitter_Grid3D_ExtrapolateVelocity001_ExtrapolationHalfWidth;
CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_(Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, Context.Map.Local.Grid3D_Visualize_VectorField.IndexY, Context.Map.Local.Grid3D_Visualize_VectorField.IndexZ, Constants_Emitter_Grid3D_Visualize_VectorField_PlaneOffset, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.Map.Local.Grid3D_Visualize_VectorField.IndexX, GetNumCells_Emitter_SimGridOutput_NumCellsX, CustomHlsl8189EE46BC699665703DFF59CE3994AF9D23ED55_Func_Output_Execute);
CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ2, Constants_Emitter_Grid3D_ExtrapolateVelocity001_ExtrapolationHalfWidth, Context.Map.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.Map.Transient.Velocity, Context.Map.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.Map.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlslD396E2F48FFA3DDDD7A6A69785558750364FCFFBEmitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
EnterStatScope(7 /**SimulationStage_2_1_Main*/);
EnterStatScope(8 /**SimulationStage_2_1_MapMain*/);
NiagaraScript_7_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant4, NiagaraScript_7_Func_Output_bUseOriginal, NiagaraScript_7_Func_Output_OutTransform, NiagaraScript_7_Func_Output_LocalToWorld, Context);
NiagaraScript_7_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant15, NiagaraScript_7_Func_Output_bUseOriginal1, NiagaraScript_7_Func_Output_OutTransform1, NiagaraScript_7_Func_Output_LocalToWorld1, Context);
float3 Result38 = mul(float4(In_InPosition,1.0),NiagaraScript_7_Func_Output_OutTransform1).xyz;
bool NiagaraScript_7_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_7_Func_Output_OutTransform2;
bool NiagaraScript_7_Func_Output_LocalToWorld2;
NiagaraScript_7_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant19, NiagaraScript_7_Func_Output_bUseOriginal2, NiagaraScript_7_Func_Output_OutTransform2, NiagaraScript_7_Func_Output_LocalToWorld2, Context);
float3 Result41 = mul(float4(In_InVector,0.0),NiagaraScript_7_Func_Output_OutTransform2).xyz;
bool NiagaraScript_7_Func_Output_bUseOriginal3;
float4x4 NiagaraScript_7_Func_Output_OutTransform3;
bool NiagaraScript_7_Func_Output_LocalToWorld3;
NiagaraScript_7_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant23, NiagaraScript_7_Func_Output_bUseOriginal3, NiagaraScript_7_Func_Output_OutTransform3, NiagaraScript_7_Func_Output_LocalToWorld3, Context);
float3 Result44 = mul(float4(In_InVector,0.0),NiagaraScript_7_Func_Output_OutTransform3).xyz;
EnterStatScope(3 /**SimulationStage_2_1_Main*/);
EnterStatScope(4 /**SimulationStage_2_1_MapMain*/);
void NiagaraScript_27_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
NiagaraScript_7_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant12, NiagaraScript_7_Func_Output_bUseOriginal, NiagaraScript_7_Func_Output_OutTransform, NiagaraScript_7_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_7_Func_Output_OutTransform).xyz;
float3 NiagaraScript_27_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_27_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant2, Constant3, Constant4, Constant5, Constant6, Constant7, Constant8, NiagaraScript_27_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
NiagaraPosition_SelectResult2 = NiagaraScript_27_Emitter_Localspace_false_Particle_Func_Output_Position;
int Constants_Emitter_Grid3D_ConvolveAxis001_AttributeIndex;
int Constant1 = 1;
int Result = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant1;
float3 Constant2 = float3(1,0,0);
CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Constant2, Constants_Emitter_Grid3D_ConvolveAxis001_AttributeIndex, CustomHlslF4A301BA4D5BEC3159F61FE9160726E4B009F81CEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
int Constants_Emitter_Grid3D_ConvolveAxis_AttributeIndex;
float3 Constant2 = float3(0,1,0);
CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant2, Constants_Emitter_Grid3D_ConvolveAxis_AttributeIndex, CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
int Constants_Emitter_Grid3D_ConvolveAxis002_AttributeIndex;
float Constants_Emitter_Grid3D_SetRTValues_Green;
float Constants_Emitter_Grid3D_SetRTValues_Blue;
float Constants_Emitter_Grid3D_SetRTValues_Alpha;
int Constant = 2;
float3 Constant2 = float3(0,0,1);
CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_(Result, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant2, Constants_Emitter_Grid3D_ConvolveAxis002_AttributeIndex, CustomHlsl5F845F224DC58F788EEB57CE9B4BD1E55C69ACB1Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Output1.g = Constants_Emitter_Grid3D_SetRTValues_Green;
Output1.b = Constants_Emitter_Grid3D_SetRTValues_Blue;
Output1.a = Constants_Emitter_Grid3D_SetRTValues_Alpha;
bool Constant5 = true;
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(2, Constant5, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.Map.Local.Grid3D_SetRTValues.Value);
float Constants_Emitter_Grid3D_ComputeHighPrecisionBoundary_MinFaceFraction;
void NiagaraScript_35_Func_(float3 In_INPUT_VAR, out float Out_AreaFraction, inout FSimulationContext Context);
void NiagaraScript_34_Func_(float In_ppp, float In_ppn, float In_pnn, float In_pnp, float In_nnp, float In_npp, float In_npn, out float3 Out_FaceFractions, inout FSimulationContext Context);
float NiagaraScript_35_Func_Output_AreaFraction;
NiagaraScript_35_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri0, NiagaraScript_35_Func_Output_AreaFraction, Context);
float NiagaraScript_35_Func_Output_AreaFraction1;
NiagaraScript_35_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri1, NiagaraScript_35_Func_Output_AreaFraction1, Context);
float NiagaraScript_35_Func_Output_AreaFraction2;
NiagaraScript_35_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri2, NiagaraScript_35_Func_Output_AreaFraction2, Context);
float NiagaraScript_35_Func_Output_AreaFraction3;
NiagaraScript_35_Func_(CustomHlsl5DD3A49B460E16BDD5D50B736843FFB83040E87A_Func_Output_Tri3, NiagaraScript_35_Func_Output_AreaFraction3, Context);
CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_(NiagaraScript_35_Func_Output_AreaFraction, NiagaraScript_35_Func_Output_AreaFraction1, NiagaraScript_35_Func_Output_AreaFraction2, NiagaraScript_35_Func_Output_AreaFraction3, CustomHlsl49FE7A90B3AA1B81CEDB526F085E4FA65A4B605B_Func_Output_Avg);
float NiagaraScript_35_Func_Output_AreaFraction4;
NiagaraScript_35_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri0, NiagaraScript_35_Func_Output_AreaFraction4, Context);
float NiagaraScript_35_Func_Output_AreaFraction5;
NiagaraScript_35_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri1, NiagaraScript_35_Func_Output_AreaFraction5, Context);
float NiagaraScript_35_Func_Output_AreaFraction6;
NiagaraScript_35_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri2, NiagaraScript_35_Func_Output_AreaFraction6, Context);
float NiagaraScript_35_Func_Output_AreaFraction7;
NiagaraScript_35_Func_(CustomHlsl2F52CF63E1E8F9FAC59321483863AA68AF0BBA6E_Func_Output_Tri3, NiagaraScript_35_Func_Output_AreaFraction7, Context);
CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_(NiagaraScript_35_Func_Output_AreaFraction4, NiagaraScript_35_Func_Output_AreaFraction5, NiagaraScript_35_Func_Output_AreaFraction6, NiagaraScript_35_Func_Output_AreaFraction7, CustomHlsl55BBAE14F80420859DFF0A7DB0A855CB1A05D11E_Func_Output_Avg);
float NiagaraScript_35_Func_Output_AreaFraction8;
NiagaraScript_35_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri0, NiagaraScript_35_Func_Output_AreaFraction8, Context);
float NiagaraScript_35_Func_Output_AreaFraction9;
NiagaraScript_35_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri1, NiagaraScript_35_Func_Output_AreaFraction9, Context);
float NiagaraScript_35_Func_Output_AreaFraction10;
NiagaraScript_35_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri2, NiagaraScript_35_Func_Output_AreaFraction10, Context);
float NiagaraScript_35_Func_Output_AreaFraction11;
NiagaraScript_35_Func_(CustomHlsl56D5169369C7DA3CFE8F21631E212D4939534C25_Func_Output_Tri3, NiagaraScript_35_Func_Output_AreaFraction11, Context);
CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_(NiagaraScript_35_Func_Output_AreaFraction8, NiagaraScript_35_Func_Output_AreaFraction9, NiagaraScript_35_Func_Output_AreaFraction10, NiagaraScript_35_Func_Output_AreaFraction11, CustomHlsl870A396A01E77D62F9CBF9265D9BC8FBF93E991E_Func_Output_Avg);
float3 NiagaraScript_34_Func_Output_FaceFractions;
NiagaraScript_34_Func_(CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npp, CustomHlsl8FE00AEBF0FBB64B3BAA1CB23524D3FC5E447B94Emitter_TransientGrid_Func_Output_theta_npn, NiagaraScript_34_Func_Output_FaceFractions, Context);
X = NiagaraScript_34_Func_Output_FaceFractions.x;
Y = NiagaraScript_34_Func_Output_FaceFractions.y;
Z = NiagaraScript_34_Func_Output_FaceFractions.z;
Context.Map.Transient.SolidVelocity = Constant11;
CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_(Output12, Constants_Emitter_Grid3D_ComputeHighPrecisionBoundary_MinFaceFraction, CustomHlsl29DE51CAEEAC1982B290C34B8AE7E2113F53E1F2_Func_Output_FaceFraction);
float Constant13 = 1;
int Constant14 = 2;
CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, Constant14, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.Map.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslC81A6FFDE2964E3F24F5D309C57A88469FC2D8AB_Func_Output_Boundary);
float Constant15 = (0.0);
float NiagaraFloat_SelectResult = Constant15;
NiagaraFloat_SelectResult = Constant13;
int Constant17 = 7;
EnterStatScope(0 /**SimulationStage_0*/);
ExitStatScope(/**SimulationStage_0*/);
EnterStatScope(5 /**SimulationStage_0_Main*/);
EnterStatScope(6 /**SimulationStage_0_MapMain*/);
ExitStatScope(/**SimulationStage_0_MapMain*/);
ExitStatScope(/**SimulationStage_0_Main*/);
float3 PhysicsForce;
FParamMap0_Grid3D_FLIP_IntegrateParticleVelocity Grid3D_FLIP_IntegrateParticleVelocity;
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(inout FSimulationContext Context);
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
Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
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
float3 Constants_Emitter_Grid3D_FLIP_IntegrateParticleVelocity_Gravity;
float3 Result = Context.Map.Transient.PhysicsForce + Constants_Emitter_Grid3D_FLIP_IntegrateParticleVelocity_Gravity;
EnterStatScope(0 /**UpdateScript_2_31*/);
ExitStatScope(/**UpdateScript_2_31*/);
EnterStatScope(2 /**UpdateScript_2_31_Main*/);
EnterStatScope(3 /**UpdateScript_2_31_MapMain*/);
ExitStatScope(/**UpdateScript_2_31_MapMain*/);
ExitStatScope(/**UpdateScript_2_31_Main*/);
I¬‰ëgx“Jà;\
é∆"B—˛#C¨®»¿HE;9±
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„E±
xì;ö©\?Nñ∫/hÑ
 i≠•⁄VHÅ
€@Ç8{;¸¡´â±
A6¨A@ä≈s∫Èœ;B±
—}FVéBÖ&;æo,ô0±
l;ÆPåq
m¢òË7à;O±ÆzÔVÄ
@å;w¡@Yá
'Ä¬”Á;ÍCÇï3Qæ
|À¿§5¶ÛJ£b÷;‚∆¬
!(¸·˛;¥E™Õ2-
¡É*ûóˆ•Ä.;ƒ—


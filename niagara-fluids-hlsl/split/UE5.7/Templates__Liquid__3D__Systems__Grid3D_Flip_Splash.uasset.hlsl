€Ú´;W–Rê
(HÄ…VÖïeN0GÃGpH„•Tln;r
7˚£ØÁä[Ë#;Lê<Æ&$≥¶ƒR:ˇ
œ?2Êé[;ÅÊ1Ö-Ûüîdúwˆ¢7\ç˘hÅ
‡qR∆:;≈rVF
"ƒ˜;ë‚ûH¢ŒÌ—#d1
;˜Êíilµ
—uM¡b;
‚ëUÊâ;
Ë;~uIk†Ï^§•¢µ
˘vÓ”ﬁ;Ê
åÇ;Uí·òÏé5-Åÿ
F¸˘Ät¸+öµk;E‹÷1Ói^],w¬‚@£p`
lúı≈eE;
ı5∆ﬁ]…w;I)…?†Ù©qH∏ LÆÌûMs
[€‰nìÚ≠;KÎã&
Ωhç2.Ó‘Î;
â…1Á;s∆}h
Á›;~ûMñ
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
Á‡Háá;ïπ
∞J‰0µjXZnµ;0V
ˇú;oF%1Cûl
Â*'[m4ñ¥'Ê‡·-Å’;·∞?QV
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
;®Âl‰˚D¨è\•—Yß€/a<eEV
Ü;o˝®©V
¯Y¯Õ/‹;EÂ
Ωg\ñŸ˜axVÁ˙è;
CÓHs›Õ˜M°˛Lu2Ë{;V
⁄*tD<;úEì&É
fπ∏NêX´;M°˛ΩV
ÿd¡4C∂°H£=;ø
N]˜ÏO¶;7
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:◊v
·Ä;2Kx+J≤Bè§]â‹#ï
s;Mi”DÅéÄµó«RËï
öc,„( ÒCí;˙™gÊN1ï
9øy;ﬁJñ
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
]9¢(Qb—Dò⁄8ÅU;É
cMäI#í;…
—Xd°JeG∏;(
Œ¯ä¢#;
ﬁJΩu&ÑkU„;∫
ﬁJΩu&ÑkU„;…
—Ì7;GΩ
ﬁJΩu&ÑkU„;W
ﬁJΩu&ÑkU„;·
‡gYßÖ¯Hê");rÆ◊\Ú
‡gYßÖ¯Hê");rÆ◊\…
‡gYßÖ¯Hê");rÆ◊\X
‡gYßÖ¯Hê");rÆ◊\L
ﬁJΩu&ÑkU„;]
‡gYßÖ¯Hê");rÆ◊\^
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
W`Äd˘å°B≥t¥÷;ƒk|R
‡gYßÖ¯Hê");rÆ◊\
nÂ¢q“qMâ;}tk
;W/Ë¿]É
;W/Ë¿]^
Â√˙»S;ÅD†ò
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3ÿ
ãsL≥L©j;Ö®¨¶º*
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿*
>Â;N™Õ)vãh.Z*
b\^ÇPÛEü;±
”5oU;Já±±@†®%9—
x™Má4i=;
n;¨`gFïC∑Yc
o{g”;Âu@Çé_
oµÙ(∫;ŒHºé9ôgÚU™m
K˜ZC ö;Mòïs
;Iò£+1
TA±;ãÒ¢!Áyô
TA±;ãÒ¢!ÁyO
87ô5¶3Në;
Ñq;dœDÿJë`†à]ÀÁÆ¯
¸ëØNµ‹P%Náw;s
EÉ©N}í.;œ
ãß;ÂR@ø©àm¯êúJ≈
÷ÎÜ˚õAé;¿Ùc.ó∑Ω
Ò≈;ªO≠lÜ••˙C≥*
Æ;IN:ˆ
˝í;ÎÈΩ
;≠ã£πÏ™G•'∆5
ˇÚEì;Ú"∑
*J;œ’$ÓI¥ÒƒƒÚo‘~·
Oö;P2π¸Æ*ƒ
!;ÌBÔΩ«@†À<Ç*
†6i ;·
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^‡
mk†;$û•O´ÜáVóIø¥≈
OÆÎi;^¡òŸV
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;≈
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.È8
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í 8
†HæÂ˛†’H-;w
;Ô“].ºﬂ
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Ûw
Y{3;FçûRô®<NCƒ
 DÄ÷bûYPc7ﬂ
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠ÓÇ
xH;A˘qƒ
˜cKª‰´˛;‡Úˇ[
 iÈJÜ-g$ûZH⁄w
7uù¬‘RçKô'î£lÅ;kƒ
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿Ç‘
:Ã;3ËBqM£<Y)ôfH$[
AÉ%F;XOÖ6x‡jæÊ\V
xùù⁄€HH≠cç;[*Y>©
xùù⁄€HH≠cç;[*Y>O
Ñq;dœDÿJë`†à]ÀÁÆ¸
¶;(guˇN£bîÚÿÂ≈U
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
;|ã´Îø
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>m*
Dó0¿¯;ÑOæ*
 l;æNÉÒÌ‡~ 4=—
ÑÒ`@ºèS;<»Zö—
%wäJÄ‚+“;Eh–R
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜z
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
I ;qÚKí
(s±;î`ÏCö6⁄V`6X3
z;›˜™O†lÏwêäNVR
X;hï(óJâ™◊x!rL
Iù≥l;hf
ê˚÷;Oü2mSáÊ{l 
ê˚÷;Oü2mSáÊ{lO
;*≈‹)yOèY_P∑C∞∫¶
o;ƒxVÔFπM4
?g[i;ÏÕEâ>ràP`∂?
‰S∫Ì=M9O†<ù.Ü;mî
úÄˆﬂ&O¢Pÿ¡æƒ;7V
ÛLV‚µc}I≠º;∂c
\∏Aä;!ô-¬€¡V
;+¯OOûû7>
;W/Ë¿]
TA±;ãÒ¢!Áy
xùù⁄€HH≠cç;[*Y>
ê˚÷;Oü2mSáÊ{l5
AΩı”P∂ Lù(-}õ¸;
∆N‡˚ú7—AçÂµ;Ωv·
∂ÙµO≥;3Yx‘(ÇR
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†Z
;aJΩzO ?∆+†K
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;FP
;ïµ%◊7–Eéõﬁs
Ä~E;ﬁÂ
B≥%Îë;
∞@õG;pJÆ'gP
;?%¶f\
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
Ü;‚{v¡!JéDY†a
∆M±\Oå;µxK
¨•;ª´Ê“Kß√t
Ö∏:“)¢ŒOò;æíÖ√
Ö∏:“)¢ŒOò;æíÖ√„õK
;aJΩzO ?∆+† 
Ö∏:“)¢ŒOò;æíÖ√„õ
1yõ_;—yO´Åy˙
ó‚‰z;XUIÄt7a!EÏ
Úó;˝3g.Dì
z;O∫kÉ^˝öËTR
≤´;à‘ÿ
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;”P
iƒGÅZ;
XûEøEø;bÒ1°a
XûEøEø;bÒ1°ò
XûEøEø;bÒ1°†
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;R
q‘ı;EûuCdﬁ&5›¬
q‘ı;EûuCdﬁ&5›V
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
£í;Cä˘G¥
@™ÛlØ,;
;aJΩzO ?∆+†
DºÅïïÏ;
;§á!ôoıCñ
Aì;˝ˇ\∑Ç]‘
Aì;˝ˇ\∑Ç]¿
x´;Bé§í‡Òä`Ê
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_€
É∆:JóÑƒ—;Tá_Ì
9á‚ s‘]MäSr;˚±µ`P
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNı‰
9;˛π$J»Añ{C8·åNıV
ùY˝;BEî¢
;@ß\€È-ï–„Û
;@ß\€È-ï–„
Ò¢;•BˆCî
÷≈'àö;HHÜuUF…7F∑˙
÷≈'àö;HHÜuUF…7F∑V
¸I≈Ga0„C∫*;sÃ
µ¶8ÀÀ|&@ô//„Jπ€
Ω.BπYÎ;k7Î˜Ì
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Gò;ä∆…±
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“A
 ZSiBº´AéÓ—lÜ∆“AV
¿áj;ŸMä⁄*
µ¶ú©®ƒ;Hß
Ø;yb8S.GÜˆ∞—_(/,≥§h
Ø;yb8S.GÜˆ∞—_(/,
 C®ØHŸ˜ÎRﬁV
––˙»H™;[á}zŒBR
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
M°;IÅ_
;ªÑê*%0
;ªÑê*%
N´†;zXã
%fÏ;∫ÆJä?,x
p&’qQéñNáÅ;†
r;Âgi~b˜µgTHxFá
r;Âgi~
I= [h:◊C≥”+°hbg;
©+‡ê—;
jA∏^πΩ—;lıA
jA∏^πΩ—;lıò
EñC‡w@¸k;V
Çõ·;∑G`@ÜóB!‚L
&≠,ÿ;´§Oª‚œ
 r∆◊hK
 r∆◊h‚
Y;k≠dDø®Yù¿h8M
Y;k≠dDø®Yù¿h8V
$ÚÔ⁄Ì;N
$ÚÔ⁄Ì;a
Î;óXS›¬M¨
)∞ºA’;|LÇ˝
’d;ö4 Nò
iyH≠T‘;0
X;hï(óJâ™◊x!rLW
X;hï(óJâ™◊x!rLÌ
î°öª¬H;Cºî≠
é⁄p(‡çQMÜPÕ‰˛;euR
˘';hPNû
ü;Ñ—Jó
∆ÀI;∫ä'L™
Ã58;øQÆHΩQø
H;Îw‹_MKØ˚µ2Z‘Á‰r
H;Îw‹_MKØ˚µ2Z‘Á‰?
∆M±\Oå;µxKs
∆M±\Oå;µxKÌ
=˜ƒ;≠A7Eô≤"}_3Jw
=˜ƒ;≠A7Eô≤"}_3JV
¯;·€J_UD®9&Ÿ
àd∂;ì9êEù&
;˚Óo≠¶≈Nπ¯)äˇôæâ
C˝_;÷p|Cí"
@Â;MÙ„q$Éé¨Jè∂lB˙ë'
8ú˛Q-ºUKé|Kàl;…hR
Oæ≥FGÄÛ}3;`‡ÎÅ
Oæ≥FGÄÛ}3;`‡Î˝
zM;˙JâéLΩ
¬;]O•ª≥Kßg
ÛÆ¸Eg6;@Å÷ﬁW
˘5D;Ö¯-AÖUß„à]1§V
<À$Hò¢aπ¬!Dü;€G’œ¿¸å
Hò¢aπ¬!Dü;€G’œ¿¸
ìlUm‹˚B¥];
nL;^i™
Û;VG‰A´U
?g[i;ÏÕEâ>ràP`∂?õ
?g[i;ÏÕEâ>ràP`∂?Ì
¬;ØgJ∫˝KÄ¯ò
’-Ë@Ö;
8—d≤G©G¡`Q;◊HR
Íi+;<’Nö±w
Û]¯;¨òïBá
 h◊ﬂ+R
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
>?ÆÆ…Dö1÷5∏;
oi∑;_Aå¢õÜ‘ÃÈ9∫
oi∑;_Aå¢õÜ‘ÃÈ9
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;å
B™Ö¯0b.\;
û+˛#∑Œq;Cç
+˛#∑Œq;Cç
ı‰®I¶;
¨3êC?D´Ü∂v;“%1Œ
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆ—
ùΩ;Bêa¢óoÆóˆÌ
 A´KUTFöR!”
 A´KUTFöR!V
DH;Eêé$,*H‹–ÿ
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡⁄
GåÁÂé-;Ë‡.
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;å
;YÂLËV
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQbV
©ÁI°Q-¸;_◊
û∞‘Y§;#BÑJé
q‘ı;EûuCdﬁ&5›˜
Aì;˝ˇ\∑Ç]
9;˛π$J»Añ{C8·åNı
;@ß\€È-ï–„&
÷≈'àö;HHÜuUF…7F∑-
Ω.BπYÎ;k7Î˜3
ÏnÅ ÔJê,πΩ¶Nk4;
ﬁŸFñD~Q@ìÎ+´°>Æì;
 ZSiBº´AéÓ—lÜ∆“AD
;ªÑê*%^
8È+ª;øªGú˜Ë5qπÿ
jA∏^πΩ—;lın
 r∆◊hx
Y;k≠dDø®Yù¿h8z
$ÚÔ⁄Ì;{
X;hï(óJâ™◊x!rLÉ
H;Îw‹_MKØ˚µ2Z‘Á‰ò
∆M±\Oå;µxKô
=˜ƒ;≠A7Eô≤"}_3Jù
Oæ≥FGÄÛ}3;`‡Îß
?g[i;ÏÕEâ>ràP`∂?¡
#;\æ˚§sI™t
J°_ycô‰;
éú/8;4ÁJù¢
ÊªY•?}<CÇf‘…˛¥@;å
ÊªY•?}<CÇf‘…˛¥@;
∂;ΩR\V
⁄`NÈÕ;sCìÕ
®+´c ı„A©W!∑;
ÌUuë.˝~Bï8•9÷ƒwR;
¢:0“;≤ﬂIê_
SPkOî;_2Õ
H^˛;DV
5õ$Ì`Ü‘K∂;<Tè
u™;´$©2Bácr£b∏
oi∑;_Aå¢õÜ‘ÃÈ9˜
 A´KUTFöR!
GåÁÂé-;Ë‡
PYNˆ6N;Oû
ó‚‰z;XUIÄt7a!EÏ0
ó‚‰z;XUIÄt7a!EÏÌ
;©†˚(ÊÂFêç
 —<;?h™Môç•ØZüòU8
 —<;?h™Môç•ØZüòU
ãvx¶∑”;OÖ(Sï!M>•V
ìéËπ¯;
idCÖSMÑ5s˛ ;
x´;Bé§í‡Òä`Ê;
JºKJEpö§Ê;
l,{±é;
‰g;•†0MÜQ:âıπº^=
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
ã≤X¡O®;Ú
XûEøEø;bÒ1°
K;Óñ‰ﬁQ
K;Óñ‰ﬁ
&HÚ´;R
DÅ)¯P√}i;W
DÅ)¯P√}i;Å
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
Úh;|}}
qi;;¥E∂o>2e
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯X`
;˙/¯X˜
ıR9ÿ"D¨Úq;Ã
¶;(guˇN£bîÚÿÂ≈Ub
¶;(guˇN£bîÚÿÂ≈Uπ
 iß§A†ÌMıkÚd;R
g‹I∏xü;Ü
%îh;˘Ä_G∑
H;Îw‹_MKØ˚µ2Z‘Á‰
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
ìáï∆)K;Mà±≠/˜˜ùöR
;M¸è¿sK£ﬁ»u8q„eV
eCSFç_ï˝;6¿J
#9°π™Ö⁄Lß;fRˆ˝Û∂
˛´T“@õÜ;˘TÑq™x
˛´T“@õÜ;˘TÑq™Ò
\Ày`AçÇZ≥Ñ˙;±y
\Ày`AçÇZ≥Ñ˙;±π
;\AŒ#Ú≤JêO<ê†Kue
kgÉÄ§DÅPŒrq1;Ô
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
&—√n‡]⁄KØ;û
˘aûª;D°Oá
 Cã˛¡î
ñt;Nö®√
jA∏^πΩ—;lı
$ÚÔ⁄Ì;
;˚Óo≠¶≈Nπ¯)äˇôæâö
;˚Óo≠¶≈Nπ¯)äˇôæâK
Oæ≥FGÄÛ}3;`‡Î
ê˚÷;Oü2mSáÊ{l
˘¶Mb†;\Lõº≤œÌO˙·
å·;ˆ÷hÆNóıÓŸƒq±∞†
å·;ˆ÷hÆNóıÓŸƒq±∞
nL;^i™¢
nL;^i™#
™UdÛ”˙xEæ;πΩ}B≥ö
 —<;?h™Môç•ØZüòU¨
x´;Bé§í‡Òä`ÊØ
‰g;•†0MÜQ:âıπº^±
K;Óñ‰ﬁ≈
DÅ)¯P√}i;À
;˙/¯X‘
¶;(guˇN£bîÚÿÂ≈U÷
;æ<+Èÿ
;æ<+Èì
˛´T“@õÜ;˘TÑq™Ï
\Ày`AçÇZ≥Ñ˙;±Ì
ó@¨Hs?9M£Õ;Æ{
CDìÆ;.
;√nQml
NæÆÄqæ∫;*V
ó±√;ÚM¢°
NæÆÄqæ∫;*
õ…;ÔÙ∞NíDK∫O6Ë¿(
õ…;ÔÙ∞NíDK∫O6Ë¿
v†S]¶Æ"Kª;ò_YItoV
v†S]¶Æ"Kª;ò_YIto
õ…;ÔÙ∞NíDK∫O6Ë¿+
——6¸'…;`
0m4P≈ﬁA;•K¶ó_Î˛
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
float4x4 Emitter_WorldToUnit;
float4x4 Emitter_WorldToLocal;
float4x4 Emitter_UnitToWorld;
float4x4 Emitter_LocalToWorld;
float3 Emitter_SimGrid_Velocity;
float Emitter_SDF_dx;
float3 Emitter_StartVelocityGrid_StartVelocity;
float Emitter_SDFGrid_SDF;
float Emitter_dx;
float Emitter_DeltaTime;
int Emitter_Grid3D_InitializeConvolutionKernel_Radius;
float Emitter_TemporaryGrid_SimFloat;
int Emitter_SimGrid_SimFloatIndex;
float Emitter_Grid3D_FLIP_FLUID_CONTROLS_CollisionVelocityMult;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryUp;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryDown;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryRight;
bool Emitter_Grid3D_FLIP_FLUID_CONTROLS_OpenBoundaryLeft;
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
float Value;
float Boundary;
float BoundarySignedDistance;
float3 FaceFraction;
float3 PhysicsForce;
float SimFloat;
float3 SolidVelocity;
float3 Velocity;
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
FParamMap0_SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_SDFGrid SDFGrid;
FParamMap0_SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter Emitter;
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
float4x4 WorldToUnit;
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
FParamMap0_OUTPUT_VAR_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_OUTPUT_VAR_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_OUTPUT_VAR_SphereLocation SphereLocation;
int Channel;
float3 VECTOR_VAR;
float4 Value;
bool Resample;
float3 Unit;
float3 UnitPosition;
float3 WorldPos;
float3 ConeVector;
float DotBetweenConeVectorAndAxis;
FParamMap0_Local_AddVelocityInCone AddVelocityInCone;
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
FParamMap0_Local_Grid3D_SetRTValues001 Grid3D_SetRTValues001;
FParamMap0_Local_SphereLocation SphereLocation;
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
FParamMap0_Emitter_Grid3D_InitializeConvolutionKernel Grid3D_InitializeConvolutionKernel;
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
int ConeAxisCoordinateSpace;
bool UseVelocityFalloffOnConeAxis;
float VelocityStrength;
FParamMap0_AddVelocityInCone AddVelocityInCone;
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
FParamMap0_Grid3D_FLIP_IntegrateParticleVelocity Grid3D_FLIP_IntegrateParticleVelocity;
FParamMap0_Grid3D_FLIP_ParticleUpdate Grid3D_FLIP_ParticleUpdate;
FParamMap0_Grid3D_FLIP_RasterizeParticles Grid3D_FLIP_RasterizeParticles;
FParamMap0_Grid3D_GenerateMeshFromDistanceField Grid3D_GenerateMeshFromDistanceField;
FParamMap0_Grid3D_PressureIteration Grid3D_PressureIteration;
FParamMap0_Grid3D_ProjectPressure Grid3D_ProjectPressure;
FParamMap0_Grid3D_SetFluidAttribute Grid3D_SetFluidAttribute;
FParamMap0_Grid3D_SetFluidAttribute001 Grid3D_SetFluidAttribute001;
FParamMap0_Grid3D_SetFluidAttribute002 Grid3D_SetFluidAttribute002;
FParamMap0_Grid3D_SetFluidAttribute004 Grid3D_SetFluidAttribute004;
FParamMap0_Grid3D_SetRTValues Grid3D_SetRTValues;
FParamMap0_Grid3D_SetRTValues001 Grid3D_SetRTValues001;
FParamMap0_KillParticles KillParticles;
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
FParamMap0_SetVariables_4405CB544D551592967D60972962E8B8 SetVariables_4405CB544D551592967D60972962E8B8;
FParamMap0_SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2 SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2;
FParamMap0_SetVariables_9DBFE6D34A13F2D4792275A8C97387E4 SetVariables_9DBFE6D34A13F2D4792275A8C97387E4;
FParamMap0_SetVariables_A6C8B03743BE41C39A693F9918B79704 SetVariables_A6C8B03743BE41C39A693F9918B79704;
FParamMap0_SetVariables_A802BB404624ACFB5C9C96987F3207AB SetVariables_A802BB404624ACFB5C9C96987F3207AB;
FParamMap0_SetVariables_C70B065E4ACA60099D622884219EB2AC SetVariables_C70B065E4ACA60099D622884219EB2AC;
FParamMap0_SetVariables_C7A11F704885D153E91991B58A269A48 SetVariables_C7A11F704885D153E91991B58A269A48;
FParamMap0_SetVariables_E132597143CDBB6A0359E5AE7A16F939 SetVariables_E132597143CDBB6A0359E5AE7A16F939;
FParamMap0_SetVariables_F07AF7D941D725DF04BE00AD577F0686 SetVariables_F07AF7D941D725DF04BE00AD577F0686;
FParamMap0_SphereLocation SphereLocation;
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
#if ((SimulationStageIndex == 17)) // MapSimStage17_Output
FParamMap0 MapSimStage17_Output;
#endif // MapSimStage17_Output
#if ((SimulationStageIndex == 18)) // MapSimStage18_GenerateMesh
FParamMap0 MapSimStage18_GenerateMesh;
#endif // MapSimStage18_GenerateMesh
static float HackSpawnInterp = 1.0;
void Vector2DFromFloat_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_4405CB544D551592967D60972962E8B8_Emitter_Func_(inout FSimulationContext Context);
void SphereLocation_SimulationPosition_Emitter_Func_(out float3 Out_OutPosition, inout FSimulationContext Context);
void GetRandomInfo_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float3 In_Min, float3 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, bool In_FixedOverrideSeed, out float3 Out_Result, inout FSimulationContext Context);
void RandomPointInSphere_Func_(float In_InnerRadius, float In_OuterRadius, int In_RandomnessMode, bool In_OverrideSeed, int In_Seed, bool In_FixedOverrideSeed, out float3 Out_Ouput, inout FSimulationContext Context);
void CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_(bool In_X, bool In_Y, bool In_Z, out float3 Out_Output);
void TransformBase_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void SphereLocation_NF_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_Emitter_Func_(inout FSimulationContext Context);
void CalculateRandomRangeFloat_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat002_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float In_Min, float In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, bool In_FixedOverrideSeed, out float Out_Result, inout FSimulationContext Context);
void PolarToCartesianCoordinates_Func_(float In_Theta, float In_Radius, float In_Period, out float2 Out_XY, out float Out_X, out float Out_Y, out float2 Out_dXdY, out float Out_dX, out float Out_dY, inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_0_Particle_Func_(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void RandomVectorInCone_Func_(float In_ConeAngle, float In_ConePointDistribution, bool In_EnableCurvature, float In_ConeCurvature, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float3 Out_Vector, out float3 Out_NormalizedVector, inout FSimulationContext Context);
void RemapValueRange_Func_(float In_INPUT_VAR, float In_InputLow, float In_InputHigh, float In_TargetLow, float In_TargetHigh, out float Out_Remapped, inout FSimulationContext Context);
void AddVelocityInCone_NF_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_(float3 In_From, float3 In_To, out float4 Out_Result);
void FindQuatBetween_v1_0_Func_(float3 In_From, float3 In_To, out float4 Out_NewOutput, inout FSimulationContext Context);
void MultiplyVectorWithQuaternion_Func_(float3 In_VECTOR_VAR, float4 In_Quaternion, out float3 Out_Vector, inout FSimulationContext Context);
void AddVelocityInCone_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(int In_IndexX, int In_IndexY, float In_Value);
void CustomHlsl7538628959E42A67EF98A7211182191BB2A32CF2Emitter_KernelGrid_Func_(int In_Radius, inout FSimulationContext Context);
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
void CustomHlslAC6AA32E19D571ACCAF1F6D5C21DBA04E251D543Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(float3 In_Index, float3 In_Velocity, int In_BoundaryIndex, inout FSimulationContext Context);
void Grid3D_FLIP_RasterizeParticles_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void Grid3D_GetFluidAttribute_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_01_Emitter_Func_(out float3 Out_Output, inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, float In_IndexZ, out float3 Out_Unit);
void GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(float3 In_WorldPosition, float In_DeltaTime, float In_TimeFraction, float In_MaxDistance, out float Out_ClosestDistance, out float3 Out_ClosestPosition, out float3 Out_ClosestVelocity);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY, out int Out_NumCellsZ);
void CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, int In_NumCellsZ, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, bool In_OpenBoundaryFront, bool In_OpenBoundaryBack, out float Out_Boundary);
void GetHeight_User_LandscapeCollisions(float3 In_WorldPos, out float Out_Value, out bool Out_IsValid);
void CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_(float In_SolidValue, float In_Boundary, out float Out_RetBoundary);
void Grid3D_ComputeBoundary_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TransientGrid(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, float4 In_Value);
void Grid3D_SetFluidAttribute004_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_SetFluidAttribute003_Emitter_Func_(inout FSimulationContext Context);
void Grid3D_GetFluidAttribute006_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_TransientGrid(out float3 Out_Unit);
void GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_Value);
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
void CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, int In_IndexZ, out float Out_Value);
void CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_(float In_dx, float In_dt, int In_IndexX, int In_IndexY, int In_IndexZ, float In_Divergence, int In_IterationIndex, float In_Relaxation, float3 In_Velocity, float In_P_center, float In_F_right, float In_F_left, float In_F_up, float In_F_down, float In_F_front, float In_F_back, float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_Pressure);
void Grid3D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9DBFE6D34A13F2D4792275A8C97387E4_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_IndexZ, int In_ScalarIndex, out float3 Out_Grad);
void Grid3D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_(int In_IndexX, int In_IndexY, int In_IndexZ, out float4 Out_B_right, out float4 Out_B_left, out float4 Out_B_up, out float4 Out_B_down, out float4 Out_B_front, out float4 Out_B_back);
void CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_(float4 In_B_right, float4 In_B_left, float4 In_B_up, float4 In_B_down, float4 In_B_front, float4 In_B_back, out float Out_F_right, out float Out_F_left, out float Out_F_up, out float Out_F_down, out float Out_F_front, out float Out_F_back);
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
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant31, In_OverrideSeed, Constant33, Constant34, In_FixedOverrideSeed, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float3 Result7 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed1;
Seed2 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed2;
Seed3 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed3;
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
float3 RandomRangeFloat_Func_Output_Result;
RandomRangeFloat_Func_(Output11, Output12, In_Seed, In_RandomnessMode, In_OverrideSeed, In_FixedOverrideSeed, RandomRangeFloat_Func_Output_Result, Context);
float Phi;
float CosASC40ThetaASC41;
float RASC943;
Phi = RandomRangeFloat_Func_Output_Result.x;
CosASC40ThetaASC41 = RandomRangeFloat_Func_Output_Result.y;
RASC943 = RandomRangeFloat_Func_Output_Result.z;
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
bool TransformBase_Func_Output_bUseOriginal;
float4x4 TransformBase_Func_Output_OutTransform;
bool TransformBase_Func_Output_LocalToWorld;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant50, TransformBase_Func_Output_bUseOriginal, TransformBase_Func_Output_OutTransform, TransformBase_Func_Output_LocalToWorld, Context);
float3 Result51 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform).xyz;
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
float3 RandomPointInSphere_Func_Output_Ouput;
RandomPointInSphere_Func_(Constant19, Constant20, Mode_IfResult, Override_IfResult, Constant21, Context.MapSpawn.SphereLocation.FixedRandomSeed, RandomPointInSphere_Func_Output_Ouput, Context);
Context.MapSpawn.Local.SphereLocation.SphereVector = RandomPointInSphere_Func_Output_Ouput;
float3 Result20 = abs(Context.MapSpawn.Local.SphereLocation.SphereVector);
float3 CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output;
CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_(Context.MapSpawn.SphereLocation.HemisphereX, Context.MapSpawn.SphereLocation.HemisphereY, Context.MapSpawn.SphereLocation.HemisphereZ, CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output);
float3 Result21 = lerp(Context.MapSpawn.Local.SphereLocation.SphereVector,Result20,CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output);
Context.MapSpawn.Local.SphereLocation.SphereVector = Result21;
float Constant44 = 50;
float3 Constant45 = float3(1,1,1);
float3 Result22 = Constant44 * Context.MapSpawn.Local.SphereLocation.SphereVector * Constant45;
Context.MapSpawn.Local.SphereLocation.SphereVector = Result22;
float3 Constant46 = float3(-150,0,100);
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
bool Constant67 = false;
float Result54 = In_FloatMax - In_FloatMin;
float Result55 = rand_float(Result54);
float Result56 = In_FloatMin + Result55;
Out_RandomFloat = Result56;
Out_IsDeterministic = Constant67;
int Constant60 = (0);
float Constant61 = -300;
float Constant62 = 1500;
int Constant63 = 0;
int Constant64 = 0;
int Constant65 = (0);
int Constant66 = (0);
float CalculateRandomRangeFloat_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
bool CalculateRandomRangeFloat_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRangeFloat_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant60, Constant61, Constant62, Constant63, Constant64, Constant65, Constant66, CalculateRandomRangeFloat_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat, CalculateRandomRangeFloat_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage3_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
int Constant85 = (0);
bool Constant86 = false;
int Constant87 = 0;
int Constant88 = (0);
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant85, In_OverrideSeed, Constant87, Constant88, In_FixedOverrideSeed, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1, Context);
float Result58 = In_Max - In_Min;
int Seed11;
int Seed21;
int Seed31;
Seed11 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed1;
Seed21 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed2;
Seed31 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed3;
float Result59 = rand_float(Result58, Seed11, Seed21, Seed31);
float Result60 = rand_float(Result58);
float Random_IfResult1;
Random_IfResult1 = Result59;
Random_IfResult1 = Result60;
float Result61 = In_Min + Random_IfResult1;
Out_Result = Result61;
float Result68 = cos(In_Theta*(TWO_PI/In_Period));
float Result69 = In_Radius * Result68;
float Result70 = sin(In_Theta*(TWO_PI/In_Period));
float Result71 = In_Radius * Result70;
float2 XY;
XY.x = Result69;
XY.y = Result71;
float Constant101 = -1;
float Result72 = Result70 * Constant101;
float2 dXdY;
dXdY.x = Result72;
dXdY.y = Result68;
Out_XY = XY;
Out_X = Result69;
Out_Y = Result71;
Out_dXdY = dXdY;
Out_dX = Result72;
Out_dY = Result68;
float Result75 = dot(In_V,In_V);
float Result76 = In_Threshold * In_Threshold;
bool Result77 = NiagaraAll(Result75 < Result76);
float Result78 = length(In_Fallback);
float Result79 = rsqrt(Result75);
float3 Result80 = In_V * Result79;
float Result81 = Reciprocal(Result79);
float3 Constant104 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult = Constant104;
float Constant105 = (0.0);
float Length_SelectResult = Constant105;
Direction_SelectResult = In_Fallback;
Length_SelectResult = Result78;
Direction_SelectResult = Result80;
Length_SelectResult = Result81;
Out_Direction = Direction_SelectResult;
Out_Length = Length_SelectResult;
Out_BelowThreshold = Result77;
float Constant82 = 0;
float Constant83 = 1;
bool Constant84 = false;
float RandomRangeFloat_Func_Output_Result1;
RandomRangeFloat_Func_(Constant82, Constant83, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant84, RandomRangeFloat_Func_Output_Result1, Context);
float Constant89 = 0;
float Constant90 = 1;
bool Constant91 = false;
float RandomRangeFloat_Func_Output_Result2;
RandomRangeFloat_Func_(Constant89, Constant90, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant91, RandomRangeFloat_Func_Output_Result2, Context);
float Result62 = pow(max(0, RandomRangeFloat_Func_Output_Result2),In_ConePointDistribution);
float Constant92 = 1e-05;
float Constant93 = 179.875;
float Result63 = clamp(In_ConeAngle,Constant92,Constant93);
float Constant94 = 0.5;
float Result64 = Result63 * Constant94;
float Result65 = tan((PI/180.0f)*Result64);
float Constant95 = 0;
float Constant96 = 1;
bool Constant97 = false;
float RandomRangeFloat_Func_Output_Result3;
RandomRangeFloat_Func_(Constant95, Constant96, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant97, RandomRangeFloat_Func_Output_Result3, Context);
float Constant98 = 0.0001;
float Constant99 = 10;
float Result66 = clamp(In_ConeCurvature,Constant98,Constant99);
float Result67 = pow(max(0, RandomRangeFloat_Func_Output_Result1),Result66);
float float_IfResult;
float_IfResult = Result67;
float_IfResult = RandomRangeFloat_Func_Output_Result1;
float Constant100 = 1;
float2 PolarToCartesianCoordinates_Func_Output_XY;
float PolarToCartesianCoordinates_Func_Output_X;
float PolarToCartesianCoordinates_Func_Output_Y;
float2 PolarToCartesianCoordinates_Func_Output_dXdY;
float PolarToCartesianCoordinates_Func_Output_dX;
float PolarToCartesianCoordinates_Func_Output_dY;
PolarToCartesianCoordinates_Func_(RandomRangeFloat_Func_Output_Result3, float_IfResult, Constant100, PolarToCartesianCoordinates_Func_Output_XY, PolarToCartesianCoordinates_Func_Output_X, PolarToCartesianCoordinates_Func_Output_Y, PolarToCartesianCoordinates_Func_Output_dXdY, PolarToCartesianCoordinates_Func_Output_dX, PolarToCartesianCoordinates_Func_Output_dY, Context);
float2 Result73 = Result65 * PolarToCartesianCoordinates_Func_Output_XY;
float2 Result74 = Result62 * Result73;
float X;
float Y;
X = Result74.x;
Y = Result74.y;
float3 Output15;
Output15.x = RandomRangeFloat_Func_Output_Result1;
Output15.y = X;
Output15.z = Y;
float3 Constant102 = float3(1,0,0);
float Constant103 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold;
DirectionAndLengthSafe_v1_0_Particle_Func_(Output15, Constant102, Constant103, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold, Context);
Out_Vector = Output15;
Out_NormalizedVector = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float Result85 = In_INPUT_VAR - In_InputLow;
float Result86 = In_InputHigh - In_InputLow;
float Result87 = Result85 / Result86;
float Result88 = In_TargetHigh - In_TargetLow;
float Result89 = Result87 * Result88;
float Result90 = Result89 + In_TargetLow;
Out_Remapped = Result90;
bool Constant117 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal1;
float4x4 TransformBase_Func_Output_OutTransform1;
bool TransformBase_Func_Output_LocalToWorld1;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant117, TransformBase_Func_Output_bUseOriginal1, TransformBase_Func_Output_OutTransform1, TransformBase_Func_Output_LocalToWorld1, Context);
float3 Result93 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result93;
Out_OutVector = Vector_IfResult1;
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
float3 Constant118 = float3(1,0,0);
float Constant119 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_From, Constant118, Constant119, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1, Context);
float3 Constant120 = float3(1,0,0);
float Constant121 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_To, Constant120, Constant121, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2, Context);
float4 CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2, CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result);
Out_NewOutput = CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
float3 Output0;
float Output16;
Output0.x = In_Quaternion.x;
Output0.y = In_Quaternion.y;
Output0.z = In_Quaternion.z;
Output16 = In_Quaternion.w;
float Result94 = dot(Output0,In_VECTOR_VAR);
float Constant122 = 2;
float Result95 = Result94 * Constant122;
float3 Result96 = Output0 * Result95;
float Result97 = Output16 * Output16;
float Result98 = dot(Output0,Output0);
float Result99 = Result97 - Result98;
float3 Result100 = Result99 * In_VECTOR_VAR;
float3 Result101 = Result96 + Result100;
float3 Result102 = cross(Output0,In_VECTOR_VAR);
float Constant123 = 2;
float Result103 = Output16 * Constant123;
float3 Result104 = Result102 * Result103;
float3 Result105 = Result101 + Result104;
Out_Vector = Result105;
float Constant74 = 60;
float Constant75 = 0.5;
float Constant76 = 1e-05;
float Result57 = max(Constant74, Constant76);
bool Constant77 = false;
float Constant78 = 1;
int Constant79 = -1;
int Constant80 = 0;
bool Constant81 = false;
float3 RandomVectorInCone_Func_Output_Vector;
float3 RandomVectorInCone_Func_Output_NormalizedVector;
RandomVectorInCone_Func_(Result57, Constant75, Constant77, Constant78, Constant79, Constant80, Constant81, RandomVectorInCone_Func_Output_Vector, RandomVectorInCone_Func_Output_NormalizedVector, Context);
float3 Constant106 = float3(1,0,0);
float Result82 = dot(Constant106,RandomVectorInCone_Func_Output_NormalizedVector);
float Constant107 = 0.5;
float Result83 = Result57 * Constant107;
float Result84 = cos((PI/180.0f)*Result83);
float Constant108 = 1;
float Constant109 = 0;
float Constant110 = 1;
float RemapValueRange_Func_Output_Remapped;
RemapValueRange_Func_(Result82, Result84, Constant108, Constant109, Constant110, RemapValueRange_Func_Output_Remapped, Context);
float Constant111 = 0;
float Constant112 = 1;
float Result91 = clamp(RemapValueRange_Func_Output_Remapped,Constant111,Constant112);
Context.MapSpawn.Local.AddVelocityInCone.ConeVector = RandomVectorInCone_Func_Output_NormalizedVector;
Context.MapSpawn.Local.AddVelocityInCone.DotBetweenConeVectorAndAxis = Result91;
float3 Constant113 = float3(1,0,1);
float3 Constant114 = float3(1,0,0);
float3 Result92 = normalize(Constant113);
int Constant115 = 0;
bool Constant116 = false;
float3 AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector;
AddVelocityInCone_NF_TransformVector_Emitter_Func_(Result92, Context.MapSpawn.AddVelocityInCone.ConeAxisCoordinateSpace, Constant115, Constant116, AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
float4 FindQuatBetween_v1_0_Func_Output_NewOutput;
FindQuatBetween_v1_0_Func_(Constant114, AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector, FindQuatBetween_v1_0_Func_Output_NewOutput, Context);
float3 MultiplyVectorWithQuaternion_Func_Output_Vector;
MultiplyVectorWithQuaternion_Func_(Context.MapSpawn.Local.AddVelocityInCone.ConeVector, FindQuatBetween_v1_0_Func_Output_NewOutput, MultiplyVectorWithQuaternion_Func_Output_Vector, Context);
Context.MapSpawn.Local.AddVelocityInCone.ConeVector = MultiplyVectorWithQuaternion_Func_Output_Vector;
float Constant124 = 0.333;
float Constant125 = 0.0001;
float Result106 = max(Constant124, Constant125);
float Result107 = pow(max(0, Context.MapSpawn.Local.AddVelocityInCone.DotBetweenConeVectorAndAxis),Result106);
float Result108 = Context.MapSpawn.AddVelocityInCone.VelocityStrength * Result107;
float float_IfResult1;
float_IfResult1 = Result108;
float_IfResult1 = Context.MapSpawn.AddVelocityInCone.VelocityStrength;
float3 Result109 = Context.MapSpawn.Local.AddVelocityInCone.ConeVector * float_IfResult1;
float3 Result110 = Context.MapSpawn.Particles.Velocity + Result109;
Context.MapSpawn.Particles.Velocity = Result110;
float3 Constant128 = float3(0,0,-980);
float3 Result111 = Context.MapUpdate.Transient.PhysicsForce + Constant128;
float3 Result112 = Result111 * Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt;
float3 Result113 = Context.MapUpdate.Particles.Velocity + Result112;
Context.MapUpdate.Particles.Velocity = Result113;
   SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(0,0,1);
    float Total = 0;
    int i;
    for (i = 0; i <= In_Radius; ++i)
        float Val = 1. - 1. * i/(In_Radius+1);
        Total += Val;
        // add negative side to total
        if (i > 0)
            Total += Val;
        SetFloatValue_Emitter_KernelGrid_UEImpureCall_Attributek(i, 0, Val/Total);
//SetConstantByStaticVariable "/Grid 3D Create Convolution Kernel/Map Get/Map Get->Module.Smoothing Kernel"
int Constant129 = 2;
CustomHlsl7538628959E42A67EF98A7211182191BB2A32CF2Emitter_KernelGrid_Func_(Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius, Context);
float Constant131 = 0;
Context.MapSimStage2_InitTemporaryGrid.Emitter.TemporaryGrid.SimFloat = Constant131;
float3 Constant133 = float3(0,0,0);
Context.MapSimStage3_InitializeStartVelocityGrid.Emitter.StartVelocityGrid.StartVelocity = Constant133;
int Constant139 = 0;
bool Result114 = NiagaraAll(In_SourceSpace == Constant139);
int Constant140 = 0;
bool Result115 = NiagaraAll(In_DestinationSpace == Constant140);
bool Result116 = Result114 && Result115;
int Constant141 = 1;
bool Result117 = NiagaraAll(In_SourceSpace == Constant141);
int Constant142 = 1;
bool Result118 = NiagaraAll(In_DestinationSpace == Constant142);
bool Result119 = Result117 && Result118;
bool Result120 = Result116 || Result119;
int Constant143 = 2;
bool Result121 = NiagaraAll(In_SourceSpace == Constant143);
int Constant144 = 2;
bool Result122 = NiagaraAll(In_DestinationSpace == Constant144);
bool Result123 = Result121 && Result122;
bool Result124 = Result120 || Result123;
bool Result125 = Result114 && Result122;
bool Result126 = Result121 && Result115;
bool Result127 = Result125 || Result126;
bool Result128 = In_bLocalSpace && Result127;
bool Result129 = Result124 || Result128;
bool Result130 = !In_bLocalSpace;
bool Result131 = Result114 && Result118;
bool Result132 = Result117 && Result115;
bool Result133 = Result131 || Result132;
bool Result134 = Result130 && Result133;
bool Result135 = Result129 || Result134;
bool Result136 = In_bLocalSpace && Result131;
bool Result137 = Result121 && Result118;
bool Result138 = Result136 || Result137;
bool Result139 = Result130 && Result126;
bool Result140 = Result138 || Result139;
float4x4 Matrix_IfResult4;
Matrix_IfResult4 = In_LocalToWorldTransform;
Matrix_IfResult4 = In_WorldToLocalTransform;
Out_bUseOriginal = Result135;
Out_OutTransform = Matrix_IfResult4;
Out_LocalToWorld = Result140;
bool Constant138 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal2;
float4x4 TransformBase_Func_Output_OutTransform2;
bool TransformBase_Func_Output_LocalToWorld2;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant138, TransformBase_Func_Output_bUseOriginal2, TransformBase_Func_Output_OutTransform2, TransformBase_Func_Output_LocalToWorld2, Context);
float3 Result141 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InPosition;
Vector_IfResult2 = Result141;
Out_OutPosition = Vector_IfResult2;
bool Constant148 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult3;
Matrix_IfResult5 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapSimStage4_RasterizeParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal3;
float4x4 TransformBase_Func_Output_OutTransform3;
bool TransformBase_Func_Output_LocalToWorld3;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult3, Constant148, TransformBase_Func_Output_bUseOriginal3, TransformBase_Func_Output_OutTransform3, TransformBase_Func_Output_LocalToWorld3, Context);
float3 Result143 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InVector;
Vector_IfResult3 = Result143;
Out_OutVector = Vector_IfResult3;
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
int Constant135 = 0;
int Constant136 = 1;
bool Constant137 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Position, Constant135, Constant136, Constant137, Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Result142 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TemporaryGridOutput_Index;
UnitToFloatIndex_Emitter_TemporaryGrid(Result142, UnitToFloatIndex_Emitter_TemporaryGridOutput_Index);
int Constant145 = 0;
int Constant146 = 1;
bool Constant147 = false;
float3 Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_(Context.MapSimStage4_RasterizeParticles.Particles.Velocity, Constant145, Constant146, Constant147, Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result144 = mul(float4(Grid3D_FLIP_RasterizeParticles_TransformVector_Emitter_Func_Output_OutVector,0.0),Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal).xyz;
CustomHlslAC6AA32E19D571ACCAF1F6D5C21DBA04E251D543Emitter_TemporaryGridEmitter_RasterizationGrid_velocity_Func_(UnitToFloatIndex_Emitter_TemporaryGridOutput_Index, Result144, Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex, Context);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample To Another Grid"
int Constant149 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant150 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute/Logic OR (Static)/Logic OR (Static)->Result"
int Constant151 = 0;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Resample = Constant151;
float3 Constant152 = float3(0,0,0);
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_GetFluidAttribute.Unit = Constant152;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
Context.MapSimStage5_ComputeBoundary.Transient.SimFloat = Context.MapSimStage5_ComputeBoundary.OUTPUT_VAR.Grid3D_GetFluidAttribute.SimFloat;
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary;
float3 Constant154 = float3(0,0,0);
Out_Output = Constant154;
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
float Constant160 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ);
float3 Output17;
Output17.x = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
Output17.y = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
Output17.z = ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ;
float3 Result145 = Output17 + Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OffsetSamplePosition;
float X1;
float Y1;
float Z;
X1 = Result145.x;
Y1 = Result145.y;
Z = Result145.z;
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(X1, Y1, Z, IndexToUnit_Emitter_SimGridOutput_Unit);
float3 Constant161 = float3(0,0,0);
float3 Output18;
Output18.x = IndexToUnit_Emitter_SimGridOutput_Unit.x;
Output18.y = IndexToUnit_Emitter_SimGridOutput_Unit.y;
Output18.z = IndexToUnit_Emitter_SimGridOutput_Unit.z;
float3 Result146 = mul(float4(Output18,1.0),Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld).xyz;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.UnitPosition = IndexToUnit_Emitter_SimGridOutput_Unit;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Constant161;
Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos = Result146;
float Constant162 = 0.001;
float GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition;
float3 GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity;
GetClosestPointMeshDistanceFieldNoNormal_User_Collide_Meshes(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, Context.MapSimStage5_ComputeBoundary.Engine.WorldDeltaTime, Context.MapSimStage5_ComputeBoundary.Engine.System.TimeStepFraction, Constant162, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestPosition, GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity);
float Constant163 = 0;
bool Result147 = NiagaraAll(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance <= Constant163);
float Constant164 = 1;
float3 Result148 = GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestVelocity * Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale;
float3 Result149 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity + Result148;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1);
int Constant165 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ);
float CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary;
CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ1, Constant165, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, GetNumCells_Emitter_SimGridOutput_NumCellsZ, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z, Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z, CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary);
float Constant166 = (0.0);
float NiagaraFloat_SelectResult1 = Constant166;
float3 Constant167 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult1 = Constant167;
NiagaraFloat_SelectResult1 = Constant164;
Vector3f_SelectResult1 = Result149;
NiagaraFloat_SelectResult1 = CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary;
Vector3f_SelectResult1 = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity = Vector3f_SelectResult1;
float3 Output19;
Output19.x = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.x;
Output19.y = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.y;
Output19.z = Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos.z;
float X2;
float Y2;
float Z1;
X2 = Output19.x;
Y2 = Output19.y;
Z1 = Output19.z;
float GetHeight_User_LandscapeCollisionsOutput_Value;
bool GetHeight_User_LandscapeCollisionsOutput_IsValid;
GetHeight_User_LandscapeCollisions(Context.MapSimStage5_ComputeBoundary.Local.Grid3D_ComputeBoundary.WorldPos, GetHeight_User_LandscapeCollisionsOutput_Value, GetHeight_User_LandscapeCollisionsOutput_IsValid);
bool Result150 = NiagaraAll(Z1 < GetHeight_User_LandscapeCollisionsOutput_Value);
float Constant168 = 1;
float Result151 = Z1 - GetHeight_User_LandscapeCollisionsOutput_Value;
float Constant169 = 1e+17;
float Result152 = min(GetClosestPointMeshDistanceFieldNoNormal_User_Collide_MeshesOutput_ClosestDistance, Constant169);
float Result153 = min(Result151, Result152);
float Constant170 = (0.0);
float NiagaraFloat_SelectResult2 = Constant170;
float Constant171 = (0.0);
float NiagaraFloat001_SelectResult2 = Constant171;
NiagaraFloat_SelectResult2 = Constant168;
NiagaraFloat001_SelectResult2 = Result153;
NiagaraFloat_SelectResult2 = NiagaraFloat_SelectResult1;
NiagaraFloat001_SelectResult2 = Result152;
float CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary;
CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_(NiagaraFloat_SelectResult2, Context.MapSimStage5_ComputeBoundary.Transient.Boundary, CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary);
Context.MapSimStage5_ComputeBoundary.Transient.Boundary = CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary;
Context.MapSimStage5_ComputeBoundary.Transient.BoundarySignedDistance = NiagaraFloat001_SelectResult2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ);
float X3;
float Y3;
float Z2;
X3 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.x;
Y3 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.y;
Z2 = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity.z;
float4 Output110;
Output110.x = X3;
Output110.y = Y3;
Output110.z = Z2;
Output110.w = Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ, Output110);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample To Another Grid"
int Constant172 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant173 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 006/Logic OR (Static)/Logic OR (Static)->Result"
int Constant174 = 0;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Resample = Constant174;
float3 Constant175 = float3(0,0,0);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_GetFluidAttribute006.Unit = Constant175;
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
float3 Output112;
Output112.x = CustomHlslA44BBB265F0C85C41C0B2022D17AAB9EB3B95101_Func_Output_Avg;
Output112.y = CustomHlslAA55C57AA779F1FEBC42024B4E5A83C6DFC37A3C_Func_Output_Avg;
Output112.z = CustomHlsl162B8FBDA44E74CF2A6B1F20F61E119BE51BB43E_Func_Output_Avg;
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
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn;
float CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnn;
float3 CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_AverageSolidVelocity;
CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ1, In_dt, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_AverageSolidVelocity);
float3 ComputeFaceFractions_Func_Output_FaceFractions;
ComputeFaceFractions_Func_(CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn, ComputeFaceFractions_Func_Output_FaceFractions, Context);
float X4;
float Y4;
float Z3;
X4 = ComputeFaceFractions_Func_Output_FaceFractions.x;
Y4 = ComputeFaceFractions_Func_Output_FaceFractions.y;
Z3 = ComputeFaceFractions_Func_Output_FaceFractions.z;
bool CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_Output_IsFullyInsideBoundary;
CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_(CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_ppn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_pnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npp, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_npn, CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_theta_nnn, CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_Output_IsFullyInsideBoundary);
Out_XFace = X4;
Out_YFace = Y4;
Out_ZFace = Z3;
Out_IsFullyInsideBoundary = CustomHlsl0018B333B475EB7FA541382BFF4D9E5A296199CB088_Func_Output_IsFullyInsideBoundary;
Out_SolidVelocity = CustomHlsl21C67102369ECD58C9FA991C9B7A98D6E1768DEAEmitter_TransientGrid_Func_Output_AverageSolidVelocity;
Out_FaceFraction.x = In_Face.x > 1e-20 ? max(In_Face.x, In_MinFaceFraction) : 0;
Out_FaceFraction.y = In_Face.y > 1e-20 ? max(In_Face.y, In_MinFaceFraction) : 0;
Out_FaceFraction.z = In_Face.z > 1e-20 ? max(In_Face.z, In_MinFaceFraction) : 0;
Out_FaceFraction = saturate(Out_FaceFraction);
float Constant178 = 0;
float3 ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
ExecutionIndexToUnit_Emitter_TransientGrid(ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit);
float3 Constant179 = float3(0,0,0);
float3 Output111;
Output111.x = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.x;
Output111.y = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.y;
Output111.z = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit.z;
float3 Result154 = mul(float4(Output111,1.0),Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld).xyz;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.UnitPosition = ExecutionIndexToUnit_Emitter_TransientGridOutput_Unit;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Constant179;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Local.Grid3D_ComputeHighPrecisionBoundary.WorldPos = Result154;
float Constant180 = 0;
float Constant181 = 0.0001;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
float Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
bool Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary;
float3 Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_(Constant180, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_IsFullyInsideBoundary, Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity, Context);
float3 Output113;
Output113.x = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_XFace;
Output113.y = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_YFace;
Output113.z = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_ZFace;
float3 CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_Output_FaceFraction;
CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_(Output113, Constant181, CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_Output_FaceFraction);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.FaceFraction = CustomHlslF09468B8BAF09397DD0B64293E7F74CC73314FD4_Func_Output_FaceFraction;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SolidVelocity = Grid3D_ComputeHighPrecisionBoundary_Grid3D_ComputeFaceFractions_Emitter_Func_Output_SolidVelocity;
float Constant182 = 1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2);
int Constant183 = 2;
int GetNumCells_Emitter_TransientGridOutput_NumCellsX;
int GetNumCells_Emitter_TransientGridOutput_NumCellsY;
int GetNumCells_Emitter_TransientGridOutput_NumCellsZ;
GetNumCells_Emitter_TransientGrid(GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ);
float CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary1;
CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ2, Constant183, GetNumCells_Emitter_TransientGridOutput_NumCellsX, GetNumCells_Emitter_TransientGridOutput_NumCellsY, GetNumCells_Emitter_TransientGridOutput_NumCellsZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z, CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary1);
float Constant184 = (0.0);
float NiagaraFloat_SelectResult3 = Constant184;
NiagaraFloat_SelectResult3 = Constant182;
NiagaraFloat_SelectResult3 = CustomHlslF3C60DF94B19AF6273C51164FEAF7F0D99676C7D_Func_Output_Boundary1;
float CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary1;
CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_(NiagaraFloat_SelectResult3, Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.SimFloat, CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary1);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Transient.Boundary = CustomHlsl4B969B8A2C8B6B13886A74276AE594ED13968D76_Func_Output_RetBoundary1;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TransientGrid(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3);
float X5;
float Y5;
float Z4;
X5 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.x;
Y5 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.y;
Z4 = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.SolidVelocity.z;
float4 Output114;
Output114.x = X5;
Output114.y = Y5;
Output114.z = Z4;
Output114.w = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_SetFluidAttribute002.Boundary;
SetVector4Value_Emitter_TransientGrid_UEImpureCall_AttributeSolidVelocity_Boundary(ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TransientGridOutput_IndexZ3, Output114);
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_FaceGrid(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ);
SetVectorValue_Emitter_FaceGrid_UEImpureCall_AttributeFaceFraction(ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_FaceGridOutput_IndexZ, Context.MapSimStage6_ComputeBoundaryHighPrecision2.ScratchModule_02.FaceVals);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample To Another Grid"
int Constant185 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant186 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 001/Logic OR (Static)/Logic OR (Static)->Result"
int Constant187 = 0;
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Resample = Constant187;
float3 Constant188 = float3(0,0,0);
Context.MapSimStage7_ExtrapolateVelocity.Local.Grid3D_GetFluidAttribute001.Unit = Constant188;
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
int Constant190 = 1;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid_velocity(GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ);
float3 CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGrid_velocityOutput_IndexZ, Constant190, Context.MapSimStage7_ExtrapolateVelocity.Transient.Boundary, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsX, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsY, GetNumCells_Emitter_RasterizationGrid_velocityOutput_NumCellsZ, Context.MapSimStage7_ExtrapolateVelocity.Grid3D_ExtrapolateVelocity.BoundaryIndex, CustomHlsl8F8BDB48782F06D11443BC6BB5F2F062BE87A5D2Emitter_RasterizationGrid_velocityEmitter_TransientGrid_Func_Output_OutVelocity);
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
float Constant192 = 0;
Context.MapSimStage8_ComputeDivergence.Emitter.PressureGrid.Pressure = Constant192;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ2, Context.MapSimStage8_ComputeDivergence.Grid3D_SetFluidAttribute.SimFloat);
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample To Another Grid"
int Constant193 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant194 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 004/Logic OR (Static)/Logic OR (Static)->Result"
int Constant195 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Resample = Constant195;
float3 Constant196 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute004.Unit = Constant196;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexZ3, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2);
Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value2;
Context.MapSimStage9_SolvePressure.Transient.SimFloat = Context.MapSimStage9_SolvePressure.OUTPUT_VAR.Grid3D_GetFluidAttribute004.SimFloat;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample To Another Grid"
int Constant197 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant198 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 005/Logic OR (Static)/Logic OR (Static)->Result"
int Constant199 = 0;
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Resample = Constant199;
float3 Constant200 = float3(0,0,0);
Context.MapSimStage9_SolvePressure.Local.Grid3D_GetFluidAttribute005.Unit = Constant200;
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
int Constant201 = 0;
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
float CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_right;
float CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_left;
float CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_up;
float CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_down;
float CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_front;
float CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_back;
CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_(CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_right, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_left, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_up, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_down, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_front, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_back, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_right, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_left, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_up, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_down, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_front, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_back);
float CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure;
CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_(Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dx, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.dt, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ4, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Divergence, SimulationStageIterationInfo_Func_Output_IterationIndex, SaturateFloat_Particle_Func_Output_ClampedValue, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Velocity, Context.MapSimStage9_SolvePressure.Grid3D_PressureIteration.Pressure, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_right, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_left, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_up, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_down, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_front, CustomHlsl99D007DE42D0E8FB2EE50FE0954E2DA1D5F49C97_Func_Output_F_back, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_right, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_left, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_up, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_down, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_front, CustomHlsl71C176891AF1A8EA104729216410AA1AAB6FD5D6Emitter_TransientGrid_Func_Output_B_back, CustomHlsl9260CE9831636DAB040D01A9A539729B5DB2F8A7Emitter_PressureGridEmitter_TransientGrid_Func_Output_Pressure);
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
int Constant202 = 0;
float3 Result155 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.PressureGradient * Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.dt;
float3 Result156 = Context.MapSimStage10_ProjectPressure.Grid3D_ProjectPressure.Velocity - Result155;
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
float CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_right;
float CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_left;
float CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_up;
float CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_down;
float CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_front;
float CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_back;
CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_(CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_back, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_right, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_left, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_up, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_down, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_front, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_back);
float3 CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_Output_VelocityOut;
CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_(Result156, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ5, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_right, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_left, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_up, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_down, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_front, CustomHlslD12FFDECFEEB66FE1C6DBD35E32FAD805453C589_Func_Output_F_back, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_right, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_left, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_up, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_down, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_front, CustomHlsl8BA0732CD688E91C1E3BD2CC69EB4502136B75E0Emitter_TransientGrid_Func_Output_B_back, CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_Output_VelocityOut);
Context.MapSimStage10_ProjectPressure.OUTPUT_VAR.Grid3D_ProjectPressure.Velocity = CustomHlslB91285540682797FEBC07BE33B5A22DC31B8D5CDEmitter_TransientGrid_Func_Output_VelocityOut;
Context.MapSimStage10_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage10_ProjectPressure.SetVariables_F07AF7D941D725DF04BE00AD577F0686.Emitter.SimGrid.Velocity;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample To Another Grid"
int Constant203 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant204 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 002/Logic OR (Static)/Logic OR (Static)->Result"
int Constant205 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Resample = Constant205;
float3 Constant206 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute002.Unit = Constant206;
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
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.SolidVelocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.SolidVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary = Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_GetFluidAttribute002.Boundary;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample To Another Grid"
int Constant207 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Map Get/Map Get->Module.Resample From Previous Frame"
int Constant208 = 0;
//SetConstantByStaticVariable "/Grid 3D Get Fluid Attribute 003/Logic OR (Static)/Logic OR (Static)->Result"
int Constant209 = 0;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Resample = Constant209;
float3 Constant210 = float3(0,0,0);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Local.Grid3D_GetFluidAttribute003.Unit = Constant210;
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
int Constant212 = 1;
int GetNumCells_Emitter_SimGridOutput_NumCellsX1;
int GetNumCells_Emitter_SimGridOutput_NumCellsY1;
int GetNumCells_Emitter_SimGridOutput_NumCellsZ1;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1);
float3 CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexZ7, Constant212, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Boundary, GetNumCells_Emitter_SimGridOutput_NumCellsX1, GetNumCells_Emitter_SimGridOutput_NumCellsY1, GetNumCells_Emitter_SimGridOutput_NumCellsZ1, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Transient.Velocity, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.VelocityIndex, Context.MapSimStage11_ExtrapolateVelocitiesAgain.Grid3D_ExtrapolateVelocity001.BoundaryIndex, CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity);
Context.MapSimStage11_ExtrapolateVelocitiesAgain.OUTPUT_VAR.Grid3D_ExtrapolateVelocity001.ExtrapolatedVelocity = CustomHlsl764523F3B84C071DB57A61E8D7B7490ED820CE46Emitter_SimGridEmitter_TransientGrid_Func_Output_OutVelocity;
Context.MapSimStage11_ExtrapolateVelocitiesAgain.Emitter.SimGrid.Velocity = Context.MapSimStage11_ExtrapolateVelocitiesAgain.SetVariables_C7A11F704885D153E91991B58A269A48.Emitter.SimGrid.Velocity;
int Constant218 = 0;
bool Result157 = NiagaraAll(In_SourceSpace == Constant218);
int Constant219 = 0;
bool Result158 = NiagaraAll(In_DestinationSpace == Constant219);
bool Result159 = Result157 && Result158;
int Constant220 = 1;
bool Result160 = NiagaraAll(In_SourceSpace == Constant220);
int Constant221 = 1;
bool Result161 = NiagaraAll(In_DestinationSpace == Constant221);
bool Result162 = Result160 && Result161;
bool Result163 = Result159 || Result162;
int Constant222 = 2;
bool Result164 = NiagaraAll(In_SourceSpace == Constant222);
int Constant223 = 2;
bool Result165 = NiagaraAll(In_DestinationSpace == Constant223);
bool Result166 = Result164 && Result165;
bool Result167 = Result163 || Result166;
bool Result168 = Result157 && Result165;
bool Result169 = Result164 && Result158;
bool Result170 = Result168 || Result169;
bool Result171 = In_bLocalSpace && Result170;
bool Result172 = Result167 || Result171;
bool Result173 = !In_bLocalSpace;
bool Result174 = Result157 && Result161;
bool Result175 = Result160 && Result158;
bool Result176 = Result174 || Result175;
bool Result177 = Result173 && Result176;
bool Result178 = Result172 || Result177;
bool Result179 = In_bLocalSpace && Result174;
bool Result180 = Result164 && Result161;
bool Result181 = Result179 || Result180;
bool Result182 = Result173 && Result169;
bool Result183 = Result181 || Result182;
float4x4 Matrix_IfResult7;
Matrix_IfResult7 = In_LocalToWorldTransform;
Matrix_IfResult7 = In_WorldToLocalTransform;
Out_bUseOriginal = Result178;
Out_OutTransform = Matrix_IfResult7;
Out_LocalToWorld = Result183;
bool Constant217 = false;
float4x4 Matrix_IfResult6;
float4x4 Matrix001_IfResult4;
Matrix_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal4;
float4x4 TransformBase_Func_Output_OutTransform4;
bool TransformBase_Func_Output_LocalToWorld4;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult4, Constant217, TransformBase_Func_Output_bUseOriginal4, TransformBase_Func_Output_OutTransform4, TransformBase_Func_Output_LocalToWorld4, Context);
float3 Result184 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InPosition;
Vector_IfResult4 = Result184;
Out_OutPosition = Vector_IfResult4;
Out_IsInside = round(In_Mask) ==2;
  In_UnitPos.z >= 0 && In_UnitPos.x <= 1 && 
In_UnitPos.y <= 1 && In_UnitPos.z <= 1;
Out_IsInside = In_Mask > 1e-7;
Out_IsInside = round(In_Mask) == 1;
bool Constant228 = false;
float4x4 Matrix_IfResult8;
float4x4 Matrix001_IfResult5;
Matrix_IfResult8 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult8 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal5;
float4x4 TransformBase_Func_Output_OutTransform5;
bool TransformBase_Func_Output_LocalToWorld5;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult8, Matrix001_IfResult5, Constant228, TransformBase_Func_Output_bUseOriginal5, TransformBase_Func_Output_OutTransform5, TransformBase_Func_Output_LocalToWorld5, Context);
float3 Result195 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InPosition;
Vector_IfResult5 = Result195;
Out_OutPosition = Vector_IfResult5;
bool Constant232 = false;
float4x4 Matrix_IfResult9;
float4x4 Matrix001_IfResult6;
Matrix_IfResult9 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult9 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult6 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal6;
float4x4 TransformBase_Func_Output_OutTransform6;
bool TransformBase_Func_Output_LocalToWorld6;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult9, Matrix001_IfResult6, Constant232, TransformBase_Func_Output_bUseOriginal6, TransformBase_Func_Output_OutTransform6, TransformBase_Func_Output_LocalToWorld6, Context);
float3 Result198 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform6).xyz;
float3 Vector_IfResult6;
Vector_IfResult6 = In_InVector;
Vector_IfResult6 = Result198;
Out_OutVector = Vector_IfResult6;
bool Constant236 = false;
float4x4 Matrix_IfResult10;
float4x4 Matrix001_IfResult7;
Matrix_IfResult10 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult10 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult7 = Context.MapSimStage12_FLIP_PICforce.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal7;
float4x4 TransformBase_Func_Output_OutTransform7;
bool TransformBase_Func_Output_LocalToWorld7;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult10, Matrix001_IfResult7, Constant236, TransformBase_Func_Output_bUseOriginal7, TransformBase_Func_Output_OutTransform7, TransformBase_Func_Output_LocalToWorld7, Context);
float3 Result201 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform7).xyz;
float3 Vector_IfResult7;
Vector_IfResult7 = In_InVector;
Vector_IfResult7 = Result201;
Out_OutVector = Vector_IfResult7;
int Constant214 = 0;
int Constant215 = 1;
bool Constant216 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Position, Constant214, Constant215, Constant216, Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition, Context);
float3 Output119;
Output119.x = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.x;
Output119.y = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.y;
Output119.z = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition.z;
float3 Result185 = mul(float4(((float3)Output119),1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float3 UnitToFloatIndex_Emitter_TransientGridOutput_Index;
UnitToFloatIndex_Emitter_TransientGrid(Result185, UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float3 Result186 = round(UnitToFloatIndex_Emitter_TransientGridOutput_Index);
float X6;
float Y6;
float Z5;
X6 = Result186.x;
Y6 = Result186.y;
Z5 = Result186.z;
float4 GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2;
GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_Boundary(X6, Y6, Z5, GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2);
float X7;
float Y7;
float Z6;
float W;
X7 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.x;
Y7 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.y;
Z6 = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.z;
W = GetPreviousVector4Value_Emitter_TransientGrid_AttributeSolidVelocity_BoundaryOutput_Value2.w;
bool CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_Output_IsInside;
CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_(W, CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_Output_IsInside);
float3 Result187 = mul(float4(Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition,1.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.WorldToUnit).xyz;
float CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_Output_ret;
CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_(Result187, CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_Output_ret);
bool CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside;
CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_(CustomHlsl98AC4EC353AB77FFC015538F3D1AD3D0F0656729_Func_Output_ret, CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside);
bool Result188 = !CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside;
bool Result189 = CustomHlslD069A91B6D5A13D86ED60495664B83BA1D258D6B_Func_Output_IsInside || Result188;
float3 Result190 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result191 = Context.MapSimStage12_FLIP_PICforce.Particles.Position + Result190;
bool CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_Output_IsInside;
CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_(W, CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_Output_IsInside);
float3 Constant224 = float3(0,0,0);
float3 SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocity(Result187, SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value);
float3 Result192 = mul(float4(SamplePreviousGridVector3Value_Emitter_SimGrid_AttributeVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result193 = Result192 * Context.MapSimStage12_FLIP_PICforce.Engine.DeltaTime;
float3 Result194 = Grid3D_FLIP_ParticleUpdate_TransformPosition_Emitter_Func_Output_OutPosition + Result193;
int Constant225 = 1;
int Constant226 = 0;
bool Constant227 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_(Result194, Constant225, Constant226, Constant227, Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
float3 SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value;
SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocity(Result187, SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value);
float3 Result196 = mul(float4(SamplePreviousGridVector3Value_Emitter_StartVelocityGrid_AttributeStartVelocityOutput_Value,0.0),Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.LocalToWorld).xyz;
float3 Result197 = Result192 - Result196;
int Constant229 = 0;
int Constant230 = 1;
bool Constant231 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_(Context.MapSimStage12_FLIP_PICforce.Particles.Velocity, Constant229, Constant230, Constant231, Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result199 = Result197 + Grid3D_FLIP_ParticleUpdate_TransformVector_Emitter_Func_Output_OutVector;
float3 Result200 = lerp(Result192,Result199,Context.MapSimStage12_FLIP_PICforce.Grid3D_FLIP_ParticleUpdate.PicOrFlip);
int Constant233 = 1;
int Constant234 = 0;
bool Constant235 = false;
float3 Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_(Result200, Constant233, Constant234, Constant235, Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Constant237 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult4 = Constant237;
float3 Constant238 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult4 = Constant238;
Position_SelectResult4 = Context.MapSimStage12_FLIP_PICforce.Particles.Position;
Velocity_SelectResult4 = Constant224;
Position_SelectResult4 = Grid3D_FLIP_ParticleUpdate_TransformPosition001_Emitter_Func_Output_OutPosition;
Velocity_SelectResult4 = Grid3D_FLIP_ParticleUpdate_TransformVector001_Emitter_Func_Output_OutVector;
float3 Constant239 = float3(0.0, 0.0, 0.0);
float3 Position_SelectResult5 = Constant239;
float3 Constant240 = float3(0.0, 0.0, 0.0);
float3 Velocity_SelectResult5 = Constant240;
Position_SelectResult5 = Result191;
Velocity_SelectResult5 = Context.MapSimStage12_FLIP_PICforce.Particles.Velocity;
Position_SelectResult5 = Position_SelectResult4;
Velocity_SelectResult5 = Velocity_SelectResult4;
Context.MapSimStage12_FLIP_PICforce.Particles.Position = Position_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.Particles.Velocity = Velocity_SelectResult5;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideDomain = CustomHlsl68BD3DFD34CA5BE597F1D2B13144C09FFAA98F09_Func_Output_IsInside;
Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary = CustomHlsl24AF70570964E63659E3360D9AEDFA1B61214C0E_Func_Output_IsInside;
bool Constant242 = false;
bool bool_IfResult;
bool_IfResult = Constant242;
bool_IfResult = Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = bool_IfResult;
int Constant256 = 0;
bool Result203 = NiagaraAll(In_SourceSpace == Constant256);
int Constant257 = 0;
bool Result204 = NiagaraAll(In_DestinationSpace == Constant257);
bool Result205 = Result203 && Result204;
int Constant258 = 1;
bool Result206 = NiagaraAll(In_SourceSpace == Constant258);
int Constant259 = 1;
bool Result207 = NiagaraAll(In_DestinationSpace == Constant259);
bool Result208 = Result206 && Result207;
bool Result209 = Result205 || Result208;
int Constant260 = 2;
bool Result210 = NiagaraAll(In_SourceSpace == Constant260);
int Constant261 = 2;
bool Result211 = NiagaraAll(In_DestinationSpace == Constant261);
bool Result212 = Result210 && Result211;
bool Result213 = Result209 || Result212;
bool Result214 = Result203 && Result211;
bool Result215 = Result210 && Result204;
bool Result216 = Result214 || Result215;
bool Result217 = In_bLocalSpace && Result216;
bool Result218 = Result213 || Result217;
bool Result219 = !In_bLocalSpace;
bool Result220 = Result203 && Result207;
bool Result221 = Result206 && Result204;
bool Result222 = Result220 || Result221;
bool Result223 = Result219 && Result222;
bool Result224 = Result218 || Result223;
bool Result225 = In_bLocalSpace && Result220;
bool Result226 = Result210 && Result207;
bool Result227 = Result225 || Result226;
bool Result228 = Result219 && Result215;
bool Result229 = Result227 || Result228;
float4x4 Matrix_IfResult11;
Matrix_IfResult11 = In_LocalToWorldTransform;
Matrix_IfResult11 = In_WorldToLocalTransform;
Out_bUseOriginal = Result224;
Out_OutTransform = Matrix_IfResult11;
Out_LocalToWorld = Result229;
float4x4 Constant253 = (float4x4)0;
float4x4 LocalToWorld_SelectResult6 = Constant253;
float4x4 Constant254 = (float4x4)0;
float4x4 WorldToLocal_SelectResult6 = Constant254;
LocalToWorld_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult6 = Context.MapSimStage13_FillRasterizationGrid.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant255 = false;
bool TransformBase_Func_Output_bUseOriginal8;
float4x4 TransformBase_Func_Output_OutTransform8;
bool TransformBase_Func_Output_LocalToWorld8;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult6, WorldToLocal_SelectResult6, Constant255, TransformBase_Func_Output_bUseOriginal8, TransformBase_Func_Output_OutTransform8, TransformBase_Func_Output_LocalToWorld8, Context);
float3 Result230 = mul(float4(In_Position,1.0),TransformBase_Func_Output_OutTransform8).xyz;
float3 Constant262 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult7 = Constant262;
NiagaraPosition_SelectResult7 = In_Position;
NiagaraPosition_SelectResult7 = Result230;
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
int Constant244 = 0;
int Result202 = ExecIndex();
bool GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePosition(Result202, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value);
int Constant245 = 2;
int Constant246 = 1;
bool Constant247 = false;
float4x4 Constant248 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant249 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant250 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant251 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant252 = false;
float3 TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position;
TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value, Constant245, Constant246, Constant247, Constant248, Constant249, Constant250, Constant251, TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant263 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult8 = Constant263;
NiagaraPosition_SelectResult8 = TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult8 = GetPositionByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributePositionOutput_Value;
float3 Result231 = mul(float4(NiagaraPosition_SelectResult8,1.0),Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit).xyz;
float3 Output120;
Output120.x = Result231.x;
Output120.y = Result231.y;
Output120.z = Result231.z;
bool GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid;
float2 GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value;
GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSize(Result202, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Valid, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value);
float3 UnitToFloatIndex_Emitter_RasterizationGridOutput_Index;
UnitToFloatIndex_Emitter_RasterizationGrid(Output120, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ);
CustomHlsl1F121CE02C1427DEA34B35005FC46D826DAEF815Emitter_RasterizationGrid_Func_(Output120, GetVector2DByIndex_Emitter_RasterizationGrid_ParticleSource_Reader_AttributeSpriteSizeOutput_Value, UnitToFloatIndex_Emitter_RasterizationGridOutput_Index, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth, Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ, Context);
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
int Constant265 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 001/Map Get/Map Get->Module.Axis"
int Constant266 = 0;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX, GetNumCells_Emitter_KernelGridOutput_NumCellsY);
int Constant267 = 1;
int Result232 = GetNumCells_Emitter_KernelGridOutput_NumCellsX - Constant267;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_RasterizationGrid(ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ);
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1;
int GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1;
GetNumCells_Emitter_RasterizationGrid(GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1);
float3 Constant268 = float3(1,0,0);
float CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_(Result232, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_RasterizationGridOutput_IndexZ, GetNumCells_Emitter_RasterizationGridOutput_NumCellsX1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsY1, GetNumCells_Emitter_RasterizationGridOutput_NumCellsZ1, Constant268, Constant265, CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue = CustomHlsl8199713393C2233DAB99CF9760DA784B9B03495DEmitter_RasterizationGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage14_SmoothinX.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF;
#if ((SimulationStageIndex == 15) || (SimulationStageIndex == 16)) // Multiple stages
  GetPreviousFloatValueAtIndex_Emitter_SDFGrid(CurrIndex.x, CurrIndex.y, CurrIndex.z, In_AttributeIndex, Sample);
int Constant270 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis/Map Get/Map Get->Module.Axis"
int Constant271 = 1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX1;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY1;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX1, GetNumCells_Emitter_KernelGridOutput_NumCellsY1);
int Constant272 = 1;
int Result233 = GetNumCells_Emitter_KernelGridOutput_NumCellsX1 - Constant272;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ);
float3 Constant273 = float3(0,1,0);
float CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_(Result233, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ, GetNumCells_Emitter_SDFGridOutput_NumCellsX, GetNumCells_Emitter_SDFGridOutput_NumCellsY, GetNumCells_Emitter_SDFGridOutput_NumCellsZ, Constant273, Constant270, CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue);
Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue = CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue;
Context.MapSimStage15_SmoothinY.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF;
int Constant275 = 0;
//SetConstantByStaticVariable "/Grid 3D Convolve Axis 002/Map Get/Map Get->Module.Axis"
int Constant276 = 2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsX2;
int GetNumCells_Emitter_KernelGridOutput_NumCellsY2;
GetNumCells_Emitter_KernelGrid(GetNumCells_Emitter_KernelGridOutput_NumCellsX2, GetNumCells_Emitter_KernelGridOutput_NumCellsY2);
int Constant277 = 1;
int Result234 = GetNumCells_Emitter_KernelGridOutput_NumCellsX2 - Constant277;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1;
int ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1;
ExecutionIndexToGridIndex_Emitter_SDFGrid(ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1);
int GetNumCells_Emitter_SDFGridOutput_NumCellsX1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsY1;
int GetNumCells_Emitter_SDFGridOutput_NumCellsZ1;
GetNumCells_Emitter_SDFGrid(GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1);
float3 Constant278 = float3(0,0,1);
float CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_(Result234, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ1, GetNumCells_Emitter_SDFGridOutput_NumCellsX1, GetNumCells_Emitter_SDFGridOutput_NumCellsY1, GetNumCells_Emitter_SDFGridOutput_NumCellsZ1, Constant278, Constant275, CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1);
Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue = CustomHlsl1340F50CE4B44A11430CF030445385034FB766C7Emitter_SDFGridEmitter_KernelGrid_Func_Output_ConvolvedValue1;
Context.MapSimStage16_SmoothinZandOutput.Emitter.SDFGrid.SDF = Context.MapSimStage16_SmoothinZandOutput.SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2.Emitter.SDFGrid.SDF;
float Constant282 = 0;
float Constant283 = 0;
float Constant284 = 0;
float4 Output121;
Output121.r = Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red;
Output121.g = Constant282;
Output121.b = Constant283;
Output121.a = Constant284;
Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value = Output121;
bool Constant285 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues/Map Get/Map Get->Module.UseIterationGrid"
int Constant286 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX;
int ExecToIndex_Emitter_SimRTOutput_IndexY;
int ExecToIndex_Emitter_SimRTOutput_IndexZ;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant285, ExecToIndex_Emitter_SimRTOutput_IndexX, ExecToIndex_Emitter_SimRTOutput_IndexY, ExecToIndex_Emitter_SimRTOutput_IndexZ, Context.MapSimStage16_SmoothinZandOutput.Local.Grid3D_SetRTValues.Value);
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
int Constant288 = 0;
float3 CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_Output_Grad;
CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_(Context.MapSimStage17_Output.Grid3D_ComputeGradient001.dx, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexY2, ExecutionIndexToGridIndex_Emitter_SDFGridOutput_IndexZ2, Constant288, CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_Output_Grad);
Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad = CustomHlsl2A4D5E5BE7C582945D14ADEF0975395113CD9840Emitter_SDFGrid_Func_Output_Grad;
float X8;
float Y8;
float Z7;
X8 = In_VECTOR_VAR.x;
Y8 = In_VECTOR_VAR.y;
Z7 = In_VECTOR_VAR.z;
float Constant292 = (0.0);
float NiagaraFloat_SelectResult9 = Constant292;
NiagaraFloat_SelectResult9 = X8;
NiagaraFloat_SelectResult9 = Y8;
NiagaraFloat_SelectResult9 = Z7;
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
float4 Output122;
Output122.r = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Red;
Output122.g = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Green;
Output122.b = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Blue;
Output122.a = Context.MapSimStage17_Output.Grid3D_SetRTValues001.Alpha;
Context.MapSimStage17_Output.Local.Grid3D_SetRTValues001.Value = Output122;
bool Constant293 = true;
//SetConstantByStaticVariable "/Grid 3D Set RTValues 001/Map Get/Map Get->Module.UseIterationGrid"
int Constant294 = 0;
int ExecToIndex_Emitter_SimRTOutput_IndexX1;
int ExecToIndex_Emitter_SimRTOutput_IndexY1;
int ExecToIndex_Emitter_SimRTOutput_IndexZ1;
ExecToIndex_Emitter_SimRT(ExecToIndex_Emitter_SimRTOutput_IndexX1, ExecToIndex_Emitter_SimRTOutput_IndexY1, ExecToIndex_Emitter_SimRTOutput_IndexZ1);
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Constant293, ExecToIndex_Emitter_SimRTOutput_IndexX1, ExecToIndex_Emitter_SimRTOutput_IndexY1, ExecToIndex_Emitter_SimRTOutput_IndexZ1, Context.MapSimStage17_Output.Local.Grid3D_SetRTValues001.Value);
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
float Constant296 = 0.001;
int GetRenderTargetSize_Emitter_SimRTOutput_Width;
int GetRenderTargetSize_Emitter_SimRTOutput_Height;
int GetRenderTargetSize_Emitter_SimRTOutput_Depth;
GetRenderTargetSize_Emitter_SimRT(GetRenderTargetSize_Emitter_SimRTOutput_Width, GetRenderTargetSize_Emitter_SimRTOutput_Height, GetRenderTargetSize_Emitter_SimRTOutput_Depth);
CustomHlslD01B102F45DBB09196AE4A4C3EC9E430AF7674E0Emitter_GeneratedMeshEmitter_SimRT_Func_(Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.CellSize, Context.MapSimStage18_GenerateMesh.Engine.Owner.Position, Constant296, GetRenderTargetSize_Emitter_SimRTOutput_Width, GetRenderTargetSize_Emitter_SimRTOutput_Height, GetRenderTargetSize_Emitter_SimRTOutput_Depth, Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.UnitToWorld, Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.WorldToUnit, Context);
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
float3 Constant15 = float3(-150,0,100);
int Constant16 = 2;
Context.MapSpawn.SphereLocation.CoordinateSpace = Constant16;
int Constant17 = 0;
bool Constant18 = false;
EnterStatScope(2 /**SphereLocation_Emitter_Func_*/);
SphereLocation_Emitter_Func_(Context);
ExitStatScope(/**SphereLocation_Emitter_Func_*/);
float Constant57 = -300;
float Constant58 = 1500;
int Constant59 = 0;
float RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat002_Emitter_Func_(RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat, Context);
bool Constant68 = true;
Context.MapSpawn.AddVelocityInCone.VelocityStrength = RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
Context.MapSpawn.AddVelocityInCone.UseVelocityFalloffOnConeAxis = Constant68;
float Constant69 = 60;
float Constant70 = 0.5;
float3 Constant71 = float3(1,0,1);
int Constant72 = 2;
Context.MapSpawn.AddVelocityInCone.ConeAxisCoordinateSpace = Constant72;
float Constant73 = 0.333;
EnterStatScope(3 /**AddVelocityInCone_Emitter_Func_*/);
AddVelocityInCone_Emitter_Func_(Context);
ExitStatScope(/**AddVelocityInCone_Emitter_Func_*/);
//End Spawn Script!
//Handle resetting previous values at the end of spawn so that they match outputs! (Needed for motion blur/etc)
HandlePreviousValuesForSpawn(Context);
// Begin HandleMissingDefaultValues
// End HandleMissingDefaultValues
//Begin Update Script!
RandomCounterDeterministic = 0;
Context.MapUpdate.Grid3D_FLIP_IntegrateParticleVelocity.dt = Context.MapUpdate.Emitter.DeltaTime;
float3 Constant126 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant126;
float3 Constant127 = float3(0,0,-980);
EnterStatScope(4 /**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_IntegrateParticleVelocity_Emitter_Func_*/);
//End Update Script!
//Begin Stage Script: MapSimStage1_BuildKernelArray!
Context.MapSimStage1_BuildKernelArray.Grid3D_CreateConvolutionKernel.Radius = Context.MapSimStage1_BuildKernelArray.Emitter.Grid3D_InitializeConvolutionKernel.Radius;
EnterStatScope(5 /**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
Grid3D_CreateConvolutionKernel_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_CreateConvolutionKernel_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage1_BuildKernelArray
//Begin Stage Script: MapSimStage2_InitTemporaryGrid!
float Constant130 = 0;
EnterStatScope(6 /**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_846B5A524ABD48F31705A18F24814CE5_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage2_InitTemporaryGrid
//Begin Stage Script: MapSimStage3_InitializeStartVelocityGrid!
float3 Constant132 = float3(0,0,0);
EnterStatScope(7 /**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_84A2A555458F1A74063408A49DA1E741_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage3_InitializeStartVelocityGrid
//Begin Stage Script: MapSimStage4_RasterizeParticles!
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToUnit = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToUnit;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.WorldToLocal = Context.MapSimStage4_RasterizeParticles.Emitter.WorldToLocal;
Context.MapSimStage4_RasterizeParticles.Grid3D_FLIP_RasterizeParticles.BoundaryIndex = Context.MapSimStage4_RasterizeParticles.Emitter.SimGrid_SimFloatIndex;
bool Constant134 = false;
EnterStatScope(8 /**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
Grid3D_FLIP_RasterizeParticles_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_RasterizeParticles_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage4_RasterizeParticles
//Begin Stage Script: MapSimStage5_ComputeBoundary!
EnterStatScope(9 /**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Grid3D_GetFluidAttribute_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute_Emitter_Func_*/);
Context.MapSimStage5_ComputeBoundary.SetVariables_A6C8B03743BE41C39A693F9918B79704.Transient.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.SimFloat;
EnterStatScope(10 /**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_A6C8B03743BE41C39A693F9918B79704_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.Grid3D_FLIP_FLUID_CONTROLS.Use High Precision Collisions"
int Constant153 = 0;
Context.MapSimStage5_ComputeBoundary.ScratchDynamicInput_01.UseHighPrecision = Constant153;
float3 ScratchDynamicInput_01_Emitter_Func_Output_Output;
ScratchDynamicInput_01_Emitter_Func_(ScratchDynamicInput_01_Emitter_Func_Output_Output, Context);
bool Constant155 = true;
bool Constant156 = true;
bool Constant157 = true;
bool Constant158 = true;
bool Constant159 = true;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.UnitToWorld = Context.MapSimStage5_ComputeBoundary.Emitter.UnitToWorld;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.VelocityScale = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.CollisionVelocityMult;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OffsetSamplePosition = ScratchDynamicInput_01_Emitter_Func_Output_Output;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Z = Context.MapSimStage5_ComputeBoundary.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45X = Constant155;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43X = Constant156;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Z = Constant157;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC43Y = Constant158;
Context.MapSimStage5_ComputeBoundary.Grid3D_ComputeBoundary.OpenBoundaryASC45Y = Constant159;
EnterStatScope(11 /**Grid3D_ComputeBoundary_Emitter_Func_*/);
Grid3D_ComputeBoundary_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeBoundary_Emitter_Func_*/);
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.Boundary = Context.MapSimStage5_ComputeBoundary.Transient.Boundary;
Context.MapSimStage5_ComputeBoundary.Grid3D_SetFluidAttribute004.SolidVelocity = Context.MapSimStage5_ComputeBoundary.Transient.SolidVelocity;
EnterStatScope(12 /**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
Grid3D_SetFluidAttribute004_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute004_Emitter_Func_*/);
EnterStatScope(13 /**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
Grid3D_SetFluidAttribute003_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetFluidAttribute003_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage5_ComputeBoundary
//Begin Stage Script: MapSimStage6_ComputeBoundaryHighPrecision2!
EnterStatScope(14 /**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Grid3D_GetFluidAttribute006_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GetFluidAttribute006_Emitter_Func_*/);
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryUp;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Z = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryDown;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryRight;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45X = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryLeft;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC43Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryFront;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.OpenBoundaryASC45Y = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.Grid3D_FLIP_FLUID_CONTROLS.OpenBoundaryBack;
Context.MapSimStage6_ComputeBoundaryHighPrecision2.Grid3D_ComputeHighPrecisionBoundary.UnitToWorld = Context.MapSimStage6_ComputeBoundaryHighPrecision2.Emitter.UnitToWorld;
float Constant176 = 0;
float Constant177 = 0.0001;
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
int Constant189 = 1;
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
float Constant191 = 0;
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
int Constant211 = 1;
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
bool Constant213 = false;
EnterStatScope(39 /**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Grid3D_FLIP_ParticleUpdate_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_FLIP_ParticleUpdate_Emitter_Func_*/);
Context.MapSimStage12_FLIP_PICforce.KillParticles.KillParticles = Context.MapSimStage12_FLIP_PICforce.OUTPUT_VAR.Grid3D_FLIP_ParticleUpdate.IsInsideBoundary;
bool Constant241 = true;
Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive = Constant241;
EnterStatScope(40 /**KillParticles_Emitter_Func_*/);
KillParticles_Emitter_Func_(Context);
ExitStatScope(/**KillParticles_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage12_FLIP_PICforce
//Begin Stage Script: MapSimStage13_FillRasterizationGrid!
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.dx = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.dx;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.HalfBandwidth = Context.MapSimStage13_FillRasterizationGrid.Emitter.RasterizationGrid3D_Initialize.HalfBandwidth;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.WorldToUnit = Context.MapSimStage13_FillRasterizationGrid.Emitter.WorldToUnit;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.RadiusMult = Context.MapSimStage13_FillRasterizationGrid.Emitter.Grid3D_FLIP_FLUID_CONTROLS.SDFParticleSizeMult;
bool Constant243 = false;
Context.MapSimStage13_FillRasterizationGrid.RasterizationGrid_ParticleSource.SourceIsLocalSpace = Constant243;
EnterStatScope(41 /**RasterizationGrid_ParticleSource_Emitter_Func_*/);
RasterizationGrid_ParticleSource_Emitter_Func_(Context);
ExitStatScope(/**RasterizationGrid_ParticleSource_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_FillRasterizationGrid
//Begin Stage Script: MapSimStage14_SmoothinX!
int Constant264 = 0;
EnterStatScope(42 /**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Grid3D_ConvolveAxis001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis001_Emitter_Func_*/);
Context.MapSimStage14_SmoothinX.SetVariables_E132597143CDBB6A0359E5AE7A16F939.Emitter.SDFGrid.SDF = Context.MapSimStage14_SmoothinX.OUTPUT_VAR.Grid3D_ConvolveAxis001.ConvolvedValue;
EnterStatScope(43 /**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E132597143CDBB6A0359E5AE7A16F939_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_SmoothinX
//Begin Stage Script: MapSimStage15_SmoothinY!
int Constant269 = 0;
EnterStatScope(44 /**Grid3D_ConvolveAxis_Emitter_Func_*/);
Grid3D_ConvolveAxis_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis_Emitter_Func_*/);
Context.MapSimStage15_SmoothinY.SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7.Emitter.SDFGrid.SDF = Context.MapSimStage15_SmoothinY.OUTPUT_VAR.Grid3D_ConvolveAxis.ConvolvedValue;
EnterStatScope(45 /**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_21CC34154ADB7A3CB3552198EE7ABEC7_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage15_SmoothinY
//Begin Stage Script: MapSimStage16_SmoothinZandOutput!
int Constant274 = 0;
EnterStatScope(46 /**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Grid3D_ConvolveAxis002_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ConvolveAxis002_Emitter_Func_*/);
Context.MapSimStage16_SmoothinZandOutput.SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2.Emitter.SDFGrid.SDF = Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
EnterStatScope(47 /**SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_Func_*/);
SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_6A578E204C1F2CE7D7121B9ED0C8F0C2_Emitter_Func_*/);
Context.MapSimStage16_SmoothinZandOutput.Grid3D_SetRTValues.Red = Context.MapSimStage16_SmoothinZandOutput.OUTPUT_VAR.Grid3D_ConvolveAxis002.ConvolvedValue;
float Constant279 = 0;
float Constant280 = 0;
float Constant281 = 0;
EnterStatScope(48 /**Grid3D_SetRTValues_Emitter_Func_*/);
Grid3D_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage16_SmoothinZandOutput
//Begin Stage Script: MapSimStage17_Output!
Context.MapSimStage17_Output.Grid3D_ComputeGradient001.dx = Context.MapSimStage17_Output.Emitter.SDF_dx;
int Constant287 = 0;
EnterStatScope(49 /**Grid3D_ComputeGradient001_Emitter_Func_*/);
Grid3D_ComputeGradient001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_ComputeGradient001_Emitter_Func_*/);
int Constant289 = 1;
int Constant290 = 2;
Context.MapSimStage17_Output.MakeFloatFromVector001.Channel = Constant289;
Context.MapSimStage17_Output.MakeFloatFromVector002.Channel = Constant290;
Context.MapSimStage17_Output.MakeFloatFromVector.VECTOR_VAR = Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad;
Context.MapSimStage17_Output.MakeFloatFromVector001.VECTOR_VAR = Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad;
Context.MapSimStage17_Output.MakeFloatFromVector002.VECTOR_VAR = Context.MapSimStage17_Output.OUTPUT_VAR.Grid3D_ComputeGradient001.Grad;
int Constant291 = 0;
Context.MapSimStage17_Output.MakeFloatFromVector.Channel = Constant291;
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
EnterStatScope(50 /**Grid3D_SetRTValues001_Emitter_Func_*/);
Grid3D_SetRTValues001_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_SetRTValues001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage17_Output
//Begin Stage Script: MapSimStage18_GenerateMesh!
Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.CellSize = Context.MapSimStage18_GenerateMesh.Emitter.SDF_dx;
Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.UnitToWorld = Context.MapSimStage18_GenerateMesh.Emitter.UnitToWorld;
Context.MapSimStage18_GenerateMesh.Grid3D_GenerateMeshFromDistanceField.WorldToUnit = Context.MapSimStage18_GenerateMesh.Emitter.WorldToUnit;
float Constant295 = 0.001;
EnterStatScope(51 /**Grid3D_GenerateMeshFromDistanceField_Emitter_Func_*/);
Grid3D_GenerateMeshFromDistanceField_Emitter_Func_(Context);
ExitStatScope(/**Grid3D_GenerateMeshFromDistanceField_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage18_GenerateMesh
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
Context.MapSpawn.Engine.Owner.Position = Engine_Owner_Position;
Context.MapSpawn.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSpawn.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSpawn.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSpawn.Engine.System.TickCount = Engine_System_TickCount;
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
#elif ((SimulationStageIndex == 18)) // MapSimStage18_GenerateMesh
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
TeardownFromIterationSource_MapSimStage6_ComputeBoundaryHighPrecision2(Context);
TeardownFromIterationSource_MapSimStage7_ExtrapolateVelocity(Context);
TeardownFromIterationSource_MapSimStage8_ComputeDivergence(Context);
TeardownFromIterationSource_MapSimStage9_SolvePressure(Context);
TeardownFromIterationSource_MapSimStage10_ProjectPressure(Context);
TeardownFromIterationSource_MapSimStage11_ExtrapolateVelocitiesAgain(Context);
const bool bValid = bIsValidInstance && Context.MapSimStage12_FLIP_PICforce.DataInstance.Alive;
const int WriteIndex = OutputIndex(0, true, bValid);
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
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(V
_\õ=õ):;l˙<
>·-ˇ^;zÂ_
 RÜîÊ%ƒ
 RÜîÊ%S
ñ6sôRsHüeß;ÄÃSáƒ
ñ6sôRsHüeß;ÄÃSáS
T5`;BºÎ8
ád˘Ôn;…G¶ﬁ=m˙ÄD(Ú
ád˘Ôn;…G¶ﬁ=m˙ÄD(e
‰S∫Ì=M9O†<ù.Ü;mîb
;%ûEÆVπÁ\>≠@V
†;ì<÷w◊n%X»s·è
;Ä?Ä@Äˇˇ
| enter_stat_scope();
| R[0] = inputdata_float();
| O[462] = inputdata_float();
| O[170] = inputdata_float();
| O[461] = inputdata_float();
| O[169] = inputdata_int32();
| O[460] = inputdata_int32();
| O[168] = inputdata_int32();
| O[34] = inputdata_int32();
| O[21] = inputdata_float();
| O[45] = inputdata_float();
| O[54] = inputdata_float();
| O[32] = inputdata_float();
| R[0] = acquireindex(C[6]);
| O[461] = mul(I[6], I[1]);
| O[462] = cmpeqi(C[0], C[1]);
| O[170] = b2i(O[462]);
| O[32] = cmpeqi_select(O[170], C[2], I[11], I[11]);
| O[45] = cmpeqi_select(O[170], C[2], C[3], C[3]);
| O[19] = cmpeqi_select(O[170], C[2], I[8], I[8]);
| O[170] = cmpeqi_select(O[170], C[2], I[9], I[10]);
| O[462] = b2i(O[462]);
| O[169] = cmpeqi_select(O[462], C[2], I[10], I[10]);
| exit_stat_scope();
| external_func_call(C[2], C[4], C[5], C[6]R[65535]);
| O[460] = mul(I[5], I[0]);
| O[168] = max(O[460], O[461]);
| O[462] = mul(I[7], I[2]);
| O[34] = max(O[462], O[168]);
| O[168] = maxi(O[19], C[5]);
| O[41] = i2f_div1(O[168], O[34]);
| O[168] = div(O[460], O[41]);
| O[168] = floor(O[168]);
| O[54] = f2i(O[168]);
| O[168] = div(O[461], O[41]);
| O[60] = f2i(O[168]);
| O[168] = div(O[462], O[41]);
| O[21] = f2i(O[168]);
| O[168] = i2f_mul(O[60], O[41]);
| O[168] = sub(O[168], O[461]);
| O[168] = abs(O[168]);
| O[34] = cmpgt(O[460], O[462]);
| O[34] = cmpgt_logic_and(O[460], O[461], O[34]);
| O[168] = cmpgt_logic_and(O[168], C[7], O[34]);
| O[34] = addi(O[60], C[5]);
| O[60] = select(O[168], O[34], O[60]);
| O[168] = i2f_mul(O[21], O[41]);
| O[168] = sub(O[168], O[462]);
| O[34] = addi(O[21], C[5]);
| O[21] = select(O[168], O[34], O[21]);
| O[168] = i2f_mul(O[54], O[41]);
| O[168] = sub(O[168], O[460]);
| O[34] = cmpgt(O[461], O[462]);
| O[34] = cmpgt_logic_and(O[461], O[460], O[34]);
| O[34] = addi(O[54], C[5]);
| O[54] = select(O[168], O[34], O[54]);
| O[168] = select(O[168], O[34], O[21]);
| O[34] = i2f_mul(O[54], O[41]);
| O[34] = sub(O[34], O[460]);
| O[34] = abs(O[34]);
| O[21] = cmpgt(O[462], O[461]);
| O[21] = cmpgt_logic_and(O[462], O[460], O[21]);
| O[34] = cmpgt_logic_and(O[34], C[7], O[21]);
| O[21] = addi(O[54], C[5]);
| O[54] = select(O[34], O[21], O[54]);
| O[34] = i2f_mul(O[60], O[41]);
| O[34] = sub(O[34], O[461]);
| O[21] = addi(O[60], C[5]);
| O[21] = select(O[34], O[21], O[60]);
| O[160] = i2f_mul(O[21], O[41]);
| O[41] = i2f_mul(O[168], O[41]);
| O[54] = i2f(O[54]);
| O[21] = i2f(O[21]);
| O[168] = i2f(O[168]);
| O[60] = f2i(O[54]);
| O[161] = f2i(O[21]);
| O[87] = f2i(O[168]);
| external_func_call(C[8], O[60], O[161], O[87]R[65535]);
| O[60] = div(O[34], O[54]);
| outputdata_float(0, 17, R[0], O[34]);
| outputdata_int32(0, 0, R[0], C[17]);
| O[34] = div(O[160], O[21]);
| outputdata_float(0, 18, R[0], O[160]);
| outputdata_int32(0, 3, R[0], C[6]);
| outputdata_int32(0, 4, R[0], C[6]);
| outputdata_int32(0, 5, R[0], C[6]);
| outputdata_int32(0, 6, R[0], C[6]);
| outputdata_int32(0, 7, R[0], C[6]);
| outputdata_int32(0, 8, R[0], C[6]);
| outputdata_int32(0, 58, R[0], C[6]);
| O[160] = div(O[41], O[168]);
| outputdata_float(0, 0, R[0], C[18]);
| outputdata_float(0, 1, R[0], C[18]);
| outputdata_float(0, 2, R[0], C[18]);
| outputdata_float(0, 3, R[0], C[18]);
| outputdata_float(0, 4, R[0], C[18]);
| outputdata_float(0, 16, R[0], O[160]);
| outputdata_float(0, 56, R[0], C[18]);
| outputdata_float(0, 57, R[0], C[18]);
| outputdata_float(0, 58, R[0], C[18]);
| outputdata_float(0, 59, R[0], C[18]);
| outputdata_float(0, 60, R[0], C[18]);
| outputdata_float(0, 61, R[0], C[18]);
| outputdata_float(0, 63, R[0], C[18]);
| outputdata_float(0, 64, R[0], C[18]);
| outputdata_float(0, 65, R[0], C[18]);
| outputdata_float(0, 66, R[0], C[18]);
| outputdata_float(0, 67, R[0], C[18]);
| outputdata_float(0, 68, R[0], C[18]);
| outputdata_float(0, 69, R[0], C[18]);
| outputdata_float(0, 70, R[0], C[18]);
| outputdata_float(0, 71, R[0], C[18]);
| outputdata_float(0, 72, R[0], C[18]);
| outputdata_float(0, 73, R[0], C[18]);
| outputdata_float(0, 74, R[0], C[18]);
| outputdata_float(0, 75, R[0], C[18]);
| outputdata_float(0, 76, R[0], C[18]);
| outputdata_float(0, 77, R[0], C[18]);
| outputdata_float(0, 78, R[0], C[18]);
| outputdata_float(0, 79, R[0], C[18]);
| outputdata_float(0, 80, R[0], C[18]);
| outputdata_float(0, 81, R[0], C[18]);
| outputdata_float(0, 82, R[0], C[18]);
| outputdata_float(0, 83, R[0], C[18]);
| outputdata_float(0, 84, R[0], C[18]);
| outputdata_float(0, 85, R[0], C[18]);
| outputdata_float(0, 86, R[0], C[18]);
| outputdata_float(0, 87, R[0], C[18]);
| outputdata_float(0, 88, R[0], C[18]);
| outputdata_float(0, 89, R[0], C[18]);
| outputdata_float(0, 90, R[0], C[18]);
| outputdata_float(0, 91, R[0], C[18]);
| outputdata_float(0, 92, R[0], C[18]);
| outputdata_float(0, 93, R[0], C[18]);
| outputdata_float(0, 94, R[0], C[18]);
| outputdata_float(0, 95, R[0], C[18]);
| outputdata_float(0, 96, R[0], C[18]);
| outputdata_float(0, 97, R[0], C[18]);
| outputdata_float(0, 98, R[0], C[18]);
| outputdata_float(0, 99, R[0], C[18]);
| outputdata_float(0, 100, R[0], C[18]);
| outputdata_float(0, 102, R[0], C[18]);
| outputdata_float(0, 103, R[0], C[18]);
| outputdata_float(0, 104, R[0], C[18]);
| outputdata_float(0, 105, R[0], C[18]);
| outputdata_float(0, 106, R[0], C[18]);
| outputdata_float(0, 107, R[0], C[18]);
| outputdata_float(0, 108, R[0], C[18]);
| outputdata_float(0, 109, R[0], C[18]);
| outputdata_float(0, 110, R[0], C[18]);
| outputdata_float(0, 111, R[0], C[18]);
| outputdata_float(0, 126, R[0], C[18]);
| outputdata_float(0, 128, R[0], C[18]);
| outputdata_float(0, 129, R[0], C[18]);
| outputdata_float(0, 130, R[0], C[18]);
| outputdata_float(0, 131, R[0], C[18]);
| outputdata_float(0, 132, R[0], C[18]);
| outputdata_float(0, 133, R[0], C[18]);
| outputdata_float(0, 134, R[0], C[18]);
| outputdata_float(0, 135, R[0], C[18]);
| outputdata_float(0, 136, R[0], C[18]);
| outputdata_float(0, 137, R[0], C[18]);
| outputdata_float(0, 138, R[0], C[18]);
| outputdata_float(0, 139, R[0], C[18]);
| outputdata_float(0, 140, R[0], C[18]);
| outputdata_float(0, 141, R[0], C[18]);
| outputdata_float(0, 142, R[0], C[18]);
| outputdata_float(0, 143, R[0], C[18]);
| outputdata_float(0, 144, R[0], C[18]);
| outputdata_float(0, 145, R[0], C[18]);
| outputdata_float(0, 146, R[0], C[18]);
| outputdata_float(0, 150, R[0], C[18]);
| outputdata_float(0, 151, R[0], C[18]);
| outputdata_float(0, 152, R[0], C[18]);
| outputdata_float(0, 153, R[0], C[18]);
| outputdata_float(0, 154, R[0], C[18]);
| outputdata_float(0, 155, R[0], C[18]);
| outputdata_float(0, 156, R[0], C[18]);
| outputdata_float(0, 157, R[0], C[18]);
| outputdata_float(0, 158, R[0], C[18]);
| outputdata_float(0, 159, R[0], C[18]);
| outputdata_float(0, 160, R[0], C[18]);
| outputdata_float(0, 161, R[0], C[18]);
| outputdata_float(0, 162, R[0], C[18]);
| outputdata_float(0, 163, R[0], C[18]);
| outputdata_float(0, 164, R[0], C[18]);
| outputdata_float(0, 165, R[0], C[18]);
| outputdata_float(0, 166, R[0], C[18]);
| outputdata_float(0, 167, R[0], C[18]);
| outputdata_float(0, 168, R[0], C[18]);
| outputdata_float(0, 169, R[0], C[18]);
| outputdata_float(0, 170, R[0], C[18]);
| outputdata_float(0, 171, R[0], C[18]);
| outputdata_float(0, 172, R[0], C[18]);
| outputdata_float(0, 173, R[0], C[18]);
| outputdata_float(0, 174, R[0], C[18]);
| outputdata_float(0, 175, R[0], C[18]);
| outputdata_float(0, 176, R[0], C[18]);
| outputdata_float(0, 177, R[0], C[18]);
| outputdata_float(0, 178, R[0], C[18]);
| outputdata_float(0, 179, R[0], C[18]);
| outputdata_float(0, 180, R[0], C[18]);
| outputdata_float(0, 181, R[0], C[18]);
| outputdata_float(0, 182, R[0], C[18]);
| outputdata_float(0, 183, R[0], C[18]);
| outputdata_float(0, 184, R[0], C[18]);
| outputdata_float(0, 185, R[0], C[18]);
| outputdata_float(0, 186, R[0], C[18]);
| outputdata_float(0, 187, R[0], C[18]);
| outputdata_float(0, 188, R[0], C[18]);
| outputdata_float(0, 189, R[0], C[18]);
| outputdata_float(0, 190, R[0], C[18]);
| outputdata_float(0, 191, R[0], C[18]);
| outputdata_float(0, 192, R[0], C[18]);
| outputdata_float(0, 193, R[0], C[18]);
| outputdata_float(0, 194, R[0], C[18]);
| outputdata_float(0, 195, R[0], C[18]);
| outputdata_float(0, 196, R[0], C[18]);
| outputdata_float(0, 197, R[0], C[18]);
| outputdata_float(0, 198, R[0], C[18]);
| outputdata_float(0, 199, R[0], C[18]);
| outputdata_float(0, 200, R[0], C[18]);
| outputdata_float(0, 201, R[0], C[18]);
| outputdata_float(0, 202, R[0], C[18]);
| outputdata_float(0, 203, R[0], C[18]);
| outputdata_float(0, 204, R[0], C[18]);
| outputdata_float(0, 205, R[0], C[18]);
| outputdata_float(0, 207, R[0], C[18]);
| outputdata_float(0, 208, R[0], C[18]);
| outputdata_float(0, 209, R[0], C[18]);
| outputdata_float(0, 210, R[0], C[18]);
| outputdata_float(0, 211, R[0], C[18]);
| outputdata_float(0, 212, R[0], C[18]);
| outputdata_float(0, 213, R[0], C[18]);
| outputdata_float(0, 214, R[0], C[18]);
| outputdata_float(0, 215, R[0], C[18]);
| outputdata_float(0, 216, R[0], C[18]);
| outputdata_float(0, 217, R[0], C[18]);
| outputdata_float(0, 218, R[0], C[18]);
| outputdata_float(0, 219, R[0], C[18]);
| outputdata_float(0, 220, R[0], C[18]);
| outputdata_float(0, 221, R[0], C[18]);
| outputdata_float(0, 222, R[0], C[18]);
| outputdata_float(0, 223, R[0], C[18]);
| outputdata_float(0, 224, R[0], C[18]);
| outputdata_float(0, 225, R[0], C[18]);
| outputdata_float(0, 227, R[0], C[18]);
| outputdata_float(0, 228, R[0], C[18]);
| outputdata_float(0, 229, R[0], C[18]);
| outputdata_float(0, 230, R[0], C[18]);
| outputdata_float(0, 232, R[0], C[18]);
| outputdata_float(0, 233, R[0], C[18]);
| outputdata_float(0, 234, R[0], C[18]);
| outputdata_float(0, 235, R[0], C[18]);
| outputdata_float(0, 237, R[0], C[18]);
| outputdata_float(0, 238, R[0], C[18]);
| outputdata_float(0, 239, R[0], C[18]);
| outputdata_float(0, 240, R[0], C[18]);
| outputdata_float(0, 242, R[0], C[18]);
| outputdata_float(0, 243, R[0], C[18]);
| outputdata_float(0, 244, R[0], C[18]);
| outputdata_float(0, 245, R[0], C[18]);
| outputdata_float(0, 246, R[0], C[18]);
| outputdata_float(0, 247, R[0], C[18]);
| outputdata_float(0, 248, R[0], C[18]);
| outputdata_float(0, 249, R[0], C[18]);
| outputdata_float(0, 250, R[0], C[18]);
| outputdata_float(0, 251, R[0], C[18]);
| outputdata_float(0, 252, R[0], C[18]);
| outputdata_float(0, 253, R[0], C[18]);
| outputdata_float(0, 254, R[0], C[18]);
| outputdata_float(0, 255, R[0], C[18]);
| outputdata_float(0, 256, R[0], C[18]);
| outputdata_float(0, 257, R[0], C[18]);
| outputdata_float(0, 258, R[0], C[18]);
| outputdata_float(0, 259, R[0], C[18]);
| outputdata_float(0, 260, R[0], C[18]);
| outputdata_float(0, 261, R[0], C[18]);
| outputdata_float(0, 262, R[0], C[18]);
| outputdata_float(0, 263, R[0], C[18]);
| outputdata_float(0, 264, R[0], C[18]);
| outputdata_float(0, 265, R[0], C[18]);
| outputdata_float(0, 266, R[0], C[18]);
| outputdata_float(0, 267, R[0], C[18]);
| outputdata_float(0, 268, R[0], C[18]);
| outputdata_float(0, 269, R[0], C[18]);
| outputdata_float(0, 270, R[0], C[18]);
| outputdata_float(0, 271, R[0], C[18]);
| outputdata_float(0, 272, R[0], C[18]);
| outputdata_float(0, 273, R[0], C[18]);
| outputdata_float(0, 275, R[0], C[18]);
| outputdata_float(0, 276, R[0], C[18]);
| outputdata_float(0, 277, R[0], C[18]);
| outputdata_float(0, 278, R[0], C[18]);
| outputdata_float(0, 280, R[0], C[18]);
| outputdata_float(0, 281, R[0], C[18]);
| outputdata_float(0, 282, R[0], C[18]);
| outputdata_float(0, 283, R[0], C[18]);
| outputdata_float(0, 285, R[0], C[18]);
| outputdata_float(0, 286, R[0], C[18]);
| outputdata_float(0, 287, R[0], C[18]);
| outputdata_float(0, 288, R[0], C[18]);
| outputdata_float(0, 291, R[0], C[18]);
| outputdata_float(0, 292, R[0], C[18]);
| outputdata_float(0, 293, R[0], C[18]);
| outputdata_float(0, 294, R[0], C[18]);
| outputdata_float(0, 296, R[0], C[18]);
| outputdata_float(0, 297, R[0], C[18]);
| outputdata_float(0, 298, R[0], C[18]);
| outputdata_float(0, 299, R[0], C[18]);
| outputdata_float(0, 301, R[0], C[18]);
| outputdata_float(0, 302, R[0], C[18]);
| outputdata_float(0, 303, R[0], C[18]);
| outputdata_float(0, 304, R[0], C[18]);
| outputdata_float(0, 306, R[0], C[18]);
| outputdata_float(0, 307, R[0], C[18]);
| outputdata_float(0, 308, R[0], C[18]);
| outputdata_float(0, 309, R[0], C[18]);
| outputdata_float(0, 310, R[0], C[18]);
| outputdata_float(0, 311, R[0], C[18]);
| outputdata_float(0, 312, R[0], C[18]);
| outputdata_float(0, 313, R[0], C[18]);
| outputdata_float(0, 314, R[0], C[18]);
| outputdata_float(0, 315, R[0], C[18]);
| outputdata_float(0, 316, R[0], C[18]);
| outputdata_float(0, 317, R[0], C[18]);
| outputdata_float(0, 318, R[0], C[18]);
| outputdata_float(0, 319, R[0], C[18]);
| outputdata_float(0, 320, R[0], C[18]);
| outputdata_float(0, 321, R[0], C[18]);
| outputdata_float(0, 323, R[0], C[18]);
| outputdata_float(0, 324, R[0], C[18]);
| outputdata_float(0, 325, R[0], C[18]);
| outputdata_float(0, 326, R[0], C[18]);
| outputdata_float(0, 328, R[0], C[18]);
| outputdata_float(0, 329, R[0], C[18]);
| outputdata_float(0, 330, R[0], C[18]);
| outputdata_float(0, 331, R[0], C[18]);
| outputdata_float(0, 333, R[0], C[18]);
| outputdata_float(0, 334, R[0], C[18]);
| outputdata_float(0, 335, R[0], C[18]);
| outputdata_float(0, 336, R[0], C[18]);
| outputdata_float(0, 338, R[0], C[18]);
| outputdata_float(0, 339, R[0], C[18]);
| outputdata_float(0, 340, R[0], C[18]);
| outputdata_float(0, 341, R[0], C[18]);
| outputdata_float(0, 342, R[0], C[18]);
| outputdata_float(0, 343, R[0], C[18]);
| outputdata_float(0, 345, R[0], C[18]);
| outputdata_float(0, 346, R[0], C[18]);
| outputdata_float(0, 347, R[0], C[18]);
| outputdata_float(0, 348, R[0], C[18]);
| outputdata_float(0, 349, R[0], C[18]);
| outputdata_float(0, 350, R[0], C[18]);
| outputdata_float(0, 351, R[0], C[18]);
| outputdata_float(0, 352, R[0], C[18]);
| outputdata_float(0, 353, R[0], C[18]);
| outputdata_float(0, 354, R[0], C[18]);
| outputdata_float(0, 355, R[0], C[18]);
| outputdata_float(0, 356, R[0], C[18]);
| outputdata_float(0, 357, R[0], C[18]);
| outputdata_float(0, 358, R[0], C[18]);
| outputdata_float(0, 359, R[0], C[18]);
| outputdata_float(0, 360, R[0], C[18]);
| outputdata_float(0, 361, R[0], C[18]);
| outputdata_float(0, 362, R[0], C[18]);
| outputdata_float(0, 363, R[0], C[18]);
| outputdata_float(0, 364, R[0], C[18]);
| outputdata_float(0, 365, R[0], C[18]);
| outputdata_float(0, 366, R[0], C[18]);
| outputdata_float(0, 367, R[0], C[18]);
| outputdata_float(0, 368, R[0], C[18]);
| outputdata_float(0, 369, R[0], C[18]);
| outputdata_float(0, 370, R[0], C[18]);
| outputdata_float(0, 371, R[0], C[18]);
| outputdata_float(0, 372, R[0], C[18]);
| outputdata_float(0, 373, R[0], C[18]);
| outputdata_float(0, 374, R[0], C[18]);
| outputdata_float(0, 375, R[0], C[18]);
| outputdata_float(0, 376, R[0], C[18]);
| outputdata_float(0, 377, R[0], C[18]);
| outputdata_float(0, 378, R[0], C[18]);
| outputdata_float(0, 379, R[0], C[18]);
| outputdata_float(0, 380, R[0], C[18]);
| outputdata_float(0, 381, R[0], C[18]);
| outputdata_float(0, 382, R[0], C[18]);
| outputdata_float(0, 383, R[0], C[18]);
| outputdata_float(0, 384, R[0], C[18]);
| outputdata_float(0, 385, R[0], C[18]);
| outputdata_float(0, 386, R[0], C[18]);
| outputdata_float(0, 387, R[0], C[18]);
| outputdata_float(0, 388, R[0], C[18]);
| outputdata_float(0, 389, R[0], C[18]);
| outputdata_float(0, 390, R[0], C[18]);
| outputdata_float(0, 391, R[0], C[18]);
| outputdata_float(0, 392, R[0], C[18]);
| outputdata_float(0, 393, R[0], C[18]);
| outputdata_float(0, 394, R[0], C[18]);
| outputdata_float(0, 395, R[0], C[18]);
| outputdata_float(0, 396, R[0], C[18]);
| outputdata_float(0, 397, R[0], C[18]);
| outputdata_float(0, 401, R[0], C[18]);
| outputdata_float(0, 402, R[0], C[18]);
| outputdata_float(0, 403, R[0], C[18]);
| outputdata_float(0, 404, R[0], C[18]);
| outputdata_float(0, 405, R[0], C[18]);
| outputdata_float(0, 406, R[0], C[18]);
| outputdata_float(0, 407, R[0], C[18]);
| outputdata_float(0, 408, R[0], C[18]);
| outputdata_float(0, 409, R[0], C[18]);
| outputdata_float(0, 410, R[0], C[18]);
| outputdata_float(0, 411, R[0], C[18]);
| outputdata_float(0, 412, R[0], C[18]);
| outputdata_float(0, 413, R[0], C[18]);
| outputdata_float(0, 414, R[0], C[18]);
| outputdata_float(0, 415, R[0], C[18]);
| outputdata_float(0, 416, R[0], C[18]);
| outputdata_float(0, 417, R[0], C[18]);
| outputdata_float(0, 418, R[0], C[18]);
| outputdata_float(0, 419, R[0], C[18]);
| outputdata_float(0, 420, R[0], C[18]);
| outputdata_float(0, 421, R[0], C[18]);
| outputdata_float(0, 422, R[0], C[18]);
| outputdata_float(0, 423, R[0], C[18]);
| outputdata_float(0, 424, R[0], C[18]);
| outputdata_float(0, 425, R[0], C[18]);
| outputdata_float(0, 426, R[0], C[18]);
| outputdata_float(0, 427, R[0], C[18]);
| outputdata_float(0, 428, R[0], C[18]);
| outputdata_float(0, 429, R[0], C[18]);
| outputdata_float(0, 430, R[0], C[18]);
| outputdata_float(0, 431, R[0], C[18]);
| outputdata_float(0, 432, R[0], C[18]);
| outputdata_float(0, 433, R[0], C[18]);
| outputdata_float(0, 434, R[0], C[18]);
| outputdata_float(0, 435, R[0], C[18]);
| outputdata_float(0, 436, R[0], C[18]);
| outputdata_float(0, 437, R[0], C[18]);
| outputdata_float(0, 438, R[0], C[18]);
| outputdata_float(0, 439, R[0], C[18]);
| outputdata_float(0, 440, R[0], C[18]);
| outputdata_float(0, 441, R[0], C[18]);
| outputdata_float(0, 442, R[0], C[18]);
| outputdata_float(0, 443, R[0], C[18]);
| outputdata_float(0, 444, R[0], C[18]);
| outputdata_float(0, 445, R[0], C[18]);
| outputdata_float(0, 446, R[0], C[18]);
| outputdata_float(0, 447, R[0], C[18]);
| outputdata_float(0, 448, R[0], C[18]);
| O[54] = f2i(O[54]);
| outputdata_float(0, 6, R[0], C[19]);
| outputdata_float(0, 9, R[0], C[19]);
| outputdata_float(0, 62, R[0], C[19]);
| outputdata_float(0, 206, R[0], C[19]);
| outputdata_float(0, 226, R[0], C[19]);
| outputdata_float(0, 231, R[0], C[19]);
| outputdata_float(0, 236, R[0], C[19]);
| outputdata_float(0, 241, R[0], C[19]);
| outputdata_float(0, 274, R[0], C[19]);
| outputdata_float(0, 279, R[0], C[19]);
| outputdata_float(0, 284, R[0], C[19]);
| outputdata_float(0, 289, R[0], C[19]);
| outputdata_float(0, 290, R[0], C[19]);
| outputdata_float(0, 295, R[0], C[19]);
| outputdata_float(0, 300, R[0], C[19]);
| outputdata_float(0, 305, R[0], C[19]);
| outputdata_float(0, 322, R[0], C[19]);
| outputdata_float(0, 327, R[0], C[19]);
| outputdata_float(0, 332, R[0], C[19]);
| outputdata_float(0, 337, R[0], C[19]);
| outputdata_float(0, 344, R[0], C[19]);
| outputdata_int32(0, 16, R[0], O[54]);
| O[21] = f2i(O[21]);
| outputdata_int32(0, 1, R[0], C[2]);
| outputdata_int32(0, 2, R[0], C[2]);
| outputdata_int32(0, 17, R[0], O[21]);
| outputdata_int32(0, 37, R[0], C[2]);
| outputdata_int32(0, 56, R[0], C[2]);
| outputdata_int32(0, 57, R[0], C[2]);
| outputdata_int32(0, 59, R[0], C[2]);
| outputdata_int32(0, 60, R[0], C[2]);
| outputdata_int32(0, 61, R[0], C[2]);
| external_func_call(C[8]O[160], O[54], O[168]);
| O[160] = i2f(O[160]);
| O[161] = f2i(O[160]);
| O[87] = f2i(O[54]);
| O[88] = f2i(O[168]);
| external_func_call(C[9], O[161], O[87], O[88]R[65535]);
| O[161] = div(O[460], O[160]);
| outputdata_float(0, 8, R[0], C[21]);
| outputdata_float(0, 20, R[0], O[161]);
| O[161] = div(O[461], O[54]);
| outputdata_float(0, 21, R[0], O[161]);
| O[161] = div(O[462], O[168]);
| outputdata_float(0, 22, R[0], O[161]);
| O[160] = f2i(O[160]);
| outputdata_int32(0, 19, R[0], O[160]);
| outputdata_int32(0, 20, R[0], O[54]);
| external_func_call(C[8]O[161], O[160], O[168]);
| O[161] = i2f(O[161]);
| O[87] = f2i(O[161]);
| O[88] = f2i(O[160]);
| O[139] = f2i(O[168]);
| external_func_call(C[1], O[87], O[88], O[139]R[65535]);
| O[87] = div(O[460], O[161]);
| outputdata_float(0, 38, R[0], O[87]);
| O[87] = div(O[461], O[160]);
| outputdata_float(0, 39, R[0], O[87]);
| O[87] = div(O[462], O[168]);
| outputdata_float(0, 40, R[0], O[87]);
| O[161] = f2i(O[161]);
| outputdata_int32(0, 28, R[0], O[161]);
| outputdata_int32(0, 29, R[0], O[160]);
| O[168] = f2i(O[168]);
| outputdata_float(0, 7, R[0], C[20]);
| outputdata_int32(0, 30, R[0], O[168]);
| external_func_call(C[5], O[87], O[88], O[139]R[65535]);
| outputdata_float(0, 26, R[0], O[87]);
| outputdata_float(0, 27, R[0], O[87]);
| outputdata_float(0, 28, R[0], O[87]);
| outputdata_int32(0, 22, R[0], O[161]);
| outputdata_int32(0, 23, R[0], O[160]);
| outputdata_int32(0, 24, R[0], O[168]);
| external_func_call(C[10], O[87], O[88], O[139]R[65535]);
| outputdata_int32(0, 38, R[0], O[19]);
| O[19] = div(O[460], O[161]);
| outputdata_float(0, 44, R[0], O[19]);
| O[19] = div(O[461], O[160]);
| outputdata_float(0, 45, R[0], O[19]);
| O[19] = div(O[462], O[168]);
| outputdata_float(0, 46, R[0], O[19]);
| outputdata_int32(0, 31, R[0], O[161]);
| outputdata_int32(0, 32, R[0], O[160]);
| outputdata_int32(0, 33, R[0], O[168]);
| O[161] = i2f_mul(O[161], C[11]);
| O[160] = i2f_mul(O[160], C[11]);
| O[168] = i2f_mul(O[168], C[11]);
| O[19] = f2i(O[161]);
| O[87] = f2i(O[160]);
| external_func_call(C[12], O[19], O[87], O[88]R[65535]);
| outputdata_float(0, 50, R[0], O[19]);
| outputdata_float(0, 51, R[0], O[19]);
| outputdata_float(0, 52, R[0], O[19]);
| outputdata_int32(0, 34, R[0], O[161]);
| outputdata_int32(0, 35, R[0], O[160]);
| outputdata_int32(0, 36, R[0], O[168]);
| external_func_call(C[8]O[168]);
| outputdata_int32(0, 55, R[0], O[168]);
| external_func_call(C[13]O[168]);
| outputdata_int32(0, 50, R[0], O[168]);
| outputdata_float(0, 14, R[0], O[60]);
| outputdata_int32(0, 54, R[0], O[168]);
| external_func_call(C[9]O[168]);
| outputdata_int32(0, 53, R[0], O[168]);
| outputdata_int32(0, 41, R[0], O[32]);
| outputdata_int32(0, 49, R[0], O[168]);
| external_func_call(C[5]O[168]);
| outputdata_int32(0, 51, R[0], O[168]);
| external_func_call(C[1]O[168]);
| outputdata_int32(0, 52, R[0], O[168]);
| external_func_call(C[8]O[168], O[60], O[32]);
| outputdata_int32(0, 43, R[0], O[168]);
| O[168] = i2f_mul(O[168], O[45]);
| outputdata_int32(0, 44, R[0], O[60]);
| O[60] = i2f_mul(O[60], O[45]);
| outputdata_int32(0, 45, R[0], O[32]);
| O[32] = i2f_mul(O[32], O[45]);
| O[160] = f2i(O[168]);
| O[161] = f2i(O[60]);
| O[19] = f2i(O[32]);
| external_func_call(C[4], O[160], O[161], O[19]R[65535]);
| O[168] = div(O[460], O[168]);
| O[60] = div(O[461], O[60]);
| outputdata_float(0, 114, R[0], O[60]);
| O[32] = div(O[462], O[32]);
| outputdata_float(0, 115, R[0], O[32]);
| outputdata_int32(0, 9, R[0], C[5]);
| outputdata_int32(0, 12, R[0], C[5]);
| outputdata_int32(0, 40, R[0], O[169]);
| O[169] = addi(C[4], C[5]);
| O[169] = i2f_mul(O[169], O[168]);
| outputdata_float(0, 112, R[0], O[168]);
| outputdata_float(0, 113, R[0], O[168]);
| outputdata_float(0, 127, R[0], O[168]);
| external_func_call(C[4], O[169]R[65535]);
| outputdata_int32(0, 11, R[0], C[4]);
| outputdata_int32(0, 39, R[0], O[170]);
| outputdata_int32(0, 42, R[0], C[4]);
| external_func_call(C[8]O[168], O[169], O[170]);
| O[32] = max(O[45], C[11]);
| outputdata_float(0, 19, R[0], O[41]);
| O[168] = i2f_mul(O[168], O[32]);
| O[169] = i2f_mul(O[169], O[32]);
| O[170] = i2f_mul(O[170], O[32]);
| O[32] = f2i(O[168]);
| O[41] = f2i(O[169]);
| O[60] = f2i(O[170]);
| external_func_call(C[14], O[32], O[41], O[60]R[65535]);
| outputdata_int32(0, 21, R[0], O[54]);
| O[54] = div(O[460], O[168]);
| outputdata_float(0, 32, R[0], O[54]);
| O[54] = div(O[461], O[169]);
| outputdata_float(0, 33, R[0], O[54]);
| O[54] = div(O[462], O[170]);
| outputdata_float(0, 34, R[0], O[54]);
| outputdata_int32(0, 25, R[0], O[168]);
| O[169] = f2i(O[169]);
| outputdata_int32(0, 26, R[0], O[169]);
| O[170] = f2i(O[170]);
| outputdata_int32(0, 27, R[0], O[170]);
| O[169] = i2f_mul(O[169], O[45]);
| O[170] = i2f_mul(O[170], O[45]);
| outputdata_float(0, 101, R[0], O[45]);
| outputdata_float(0, 125, R[0], O[45]);
| O[45] = f2i(O[168]);
| O[54] = f2i(O[169]);
| O[32] = f2i(O[170]);
| external_func_call(C[15], O[45], O[54], O[32]R[65535]);
| outputdata_int32(0, 18, R[0], O[21]);
| outputdata_int32(0, 13, R[0], O[168]);
| outputdata_int32(0, 14, R[0], O[169]);
| outputdata_int32(0, 15, R[0], O[170]);
| external_func_call(C[8]O[169], O[170], O[21]);
| O[168] = i2f(O[169]);
| outputdata_int32(0, 46, R[0], O[169]);
| O[169] = i2f(O[170]);
| outputdata_int32(0, 47, R[0], O[170]);
| O[170] = i2f(O[21]);
| outputdata_int32(0, 48, R[0], O[21]);
| O[45] = f2i(O[169]);
| O[54] = f2i(O[170]);
| external_func_call(C[16], O[21], O[45], O[54]R[65535]);
| outputdata_float(0, 15, R[0], O[34]);
| outputdata_float(0, 11, R[0], O[460]);
| outputdata_float(0, 23, R[0], O[460]);
| outputdata_float(0, 29, R[0], O[460]);
| outputdata_float(0, 35, R[0], O[460]);
| outputdata_float(0, 41, R[0], O[460]);
| outputdata_float(0, 47, R[0], O[460]);
| outputdata_float(0, 53, R[0], O[460]);
| outputdata_float(0, 116, R[0], O[460]);
| outputdata_float(0, 119, R[0], O[168]);
| outputdata_float(0, 122, R[0], O[460]);
| outputdata_float(0, 147, R[0], O[460]);
| outputdata_float(0, 398, R[0], O[460]);
| O[169] = div(O[461], O[169]);
| outputdata_float(0, 12, R[0], O[461]);
| outputdata_float(0, 24, R[0], O[461]);
| outputdata_float(0, 30, R[0], O[461]);
| outputdata_float(0, 36, R[0], O[461]);
| outputdata_float(0, 42, R[0], O[461]);
| outputdata_float(0, 48, R[0], O[461]);
| outputdata_float(0, 54, R[0], O[461]);
| outputdata_float(0, 117, R[0], O[461]);
| outputdata_float(0, 120, R[0], O[169]);
| outputdata_float(0, 123, R[0], O[461]);
| outputdata_float(0, 148, R[0], O[461]);
| outputdata_float(0, 399, R[0], O[461]);
| O[170] = div(O[462], O[170]);
| outputdata_float(0, 13, R[0], O[462]);
| outputdata_float(0, 25, R[0], O[462]);
| outputdata_float(0, 31, R[0], O[462]);
| outputdata_float(0, 37, R[0], O[462]);
| outputdata_float(0, 43, R[0], O[462]);
| outputdata_float(0, 49, R[0], O[462]);
| outputdata_float(0, 55, R[0], O[462]);
| outputdata_float(0, 118, R[0], O[462]);
| outputdata_float(0, 121, R[0], O[170]);
| outputdata_float(0, 124, R[0], O[462]);
| outputdata_float(0, 149, R[0], O[462]);
| outputdata_float(0, 400, R[0], O[462]);
| outputdata_int32(0, 10, R[0], C[1]);
| outputdata_float(0, 5, R[0], I[3]);
| outputdata_float(0, 10, R[0], I[4]);
| done();
| O[6] = inputdata_float();
| O[405] = inputdata_float();
| O[404] = inputdata_int32();
| O[403] = inputdata_int32();
| O[402] = inputdata_float();
| O[401] = inputdata_int32();
| O[400] = inputdata_int32();
| O[399] = inputdata_int32();
| O[7] = inputdata_int32();
| O[21] = inputdata_int32();
| O[22] = inputdata_int32();
| O[23] = inputdata_float();
| O[93] = inputdata_float();
| O[94] = inputdata_float();
| O[95] = inputdata_float();
| O[286] = inputdata_int32();
| O[424] = inputdata_float();
| O[27] = inputdata_float();
| O[29] = inputdata_float();
| O[456] = inputdata_float();
| O[200] = inputdata_int32();
| O[450] = inputdata_int32();
| O[449] = inputdata_int32();
| O[448] = inputdata_int32();
| O[143] = inputdata_int32();
| O[188] = inputdata_int32();
| O[335] = inputdata_int32();
| O[444] = inputdata_int32();
| O[487] = inputdata_int32();
| O[486] = inputdata_float();
| O[485] = inputdata_float();
| O[484] = inputdata_float();
| O[483] = inputdata_float();
| O[482] = inputdata_float();
| O[481] = inputdata_float();
| O[480] = inputdata_int32();
| O[479] = inputdata_int32();
| O[117] = inputdata_int32();
| O[316] = inputdata_float();
| O[116] = inputdata_float();
| O[132] = inputdata_float();
| O[315] = inputdata_float();
| O[115] = inputdata_float();
| O[131] = inputdata_float();
| O[308] = inputdata_int32();
| O[307] = inputdata_int32();
| O[505] = inputdata_int32();
| O[504] = inputdata_float();
| O[503] = inputdata_float();
| O[248] = inputdata_float();
| O[502] = inputdata_float();
| O[501] = inputdata_float();
| O[500] = inputdata_float();
| O[499] = inputdata_int32();
| O[244] = inputdata_int32();
| O[498] = inputdata_int32();
| O[497] = inputdata_float();
| O[496] = inputdata_float();
| O[495] = inputdata_float();
| O[240] = inputdata_float();
| O[383] = inputdata_float();
| O[241] = inputdata_float();
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
| R[137] = inputdata_int32();
| R[138] = inputdata_int32();
| R[139] = inputdata_int32();
| R[140] = inputdata_float();
| R[141] = inputdata_int32();
| R[142] = inputdata_float();
| R[143] = inputdata_int32();
| R[144] = inputdata_float();
| R[145] = inputdata_float();
| R[146] = inputdata_float();
| R[147] = inputdata_float();
| R[148] = inputdata_float();
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
| R[0] = acquireindex(C[20]);
| O[404] = cmpeq_select(I[81], C[0], C[1], I[82]);
| O[405] = add(C[2], I[83]);
| O[6] = div_f2i(O[405], O[404]);
| O[6] = maxi(O[6], C[3]);
| O[403] = i2f_mul(O[6], O[404]);
| O[405] = sub(O[405], O[403]);
| O[403] = addi(O[6], I[140]);
| outputdata_int32(0, 61, R[0], O[403]);
| O[403] = add(I[81], C[2]);
| outputdata_float(0, 198, R[0], O[403]);
| O[6] = cmpgti(O[6], C[3]);
| O[404] = select(O[6], O[404], O[404]);
| O[405] = select(O[6], O[405], O[405]);
| O[6] = div(O[405], O[404]);
| outputdata_float(0, 199, R[0], O[404]);
| outputdata_float(0, 364, R[0], O[405]);
| outputdata_float(0, 365, R[0], O[6]);
| O[6] = cmplei(I[139], C[3]);
| O[404] = select(O[6], C[3], I[138]);
| O[405] = select(O[6], C[3], I[139]);
| O[6] = cmpneqi(I[164], C[3]);
| O[6] = cmplei_logic_and(O[405], C[4], O[6]);
| O[335] = select(O[6], I[164], O[404]);
| O[7] = select(O[6], C[4], O[405]);
| O[6] = add(I[150], I[150]);
| O[400] = add(I[151], I[151]);
| O[403] = add(I[152], I[152]);
| O[405] = mul(I[151], O[400]);
| O[404] = mul(I[151], O[403]);
| O[401] = mul(I[152], O[403]);
| O[402] = mul(I[153], O[400]);
| O[399] = mul(I[153], O[403]);
| O[479] = mad_sub1(I[151], O[400], O[401], C[5]);
| O[307] = mul_sub0(I[150], O[400], O[399]);
| O[315] = mad(I[150], O[403], O[402]);
| O[483] = mad(I[150], O[400], O[399]);
| O[115] = mad_sub1(I[150], O[6], O[401], C[5]);
| O[316] = mul_sub1(I[153], O[6], O[404]);
| O[487] = mul_sub0(I[150], O[403], O[402]);
| O[22] = mad(I[153], O[6], O[404]);
| O[6] = mul_add(I[150], O[6], O[405]);
| O[486] = sub(C[5], O[6]);
| O[405] = mul(I[162], I[156]);
| O[402] = mul(C[6], O[405]);
| O[403] = mul(I[160], I[154]);
| O[95] = mul_mad1(C[7], O[403], C[7], C[0]);
| O[404] = mul(I[161], I[155]);
| O[400] = mul_mad1(C[7], C[0], C[7], O[404]);
| O[401] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[6] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[6] = mad_add(C[7], C[0], O[6], C[5]);
| O[94] = mad_add(C[7], C[0], O[400], C[0]);
| O[399] = mad_add(C[7], O[405], O[401], C[0]);
| O[6] = add(O[6], C[0]);
| O[401] = mad(C[0], C[0], O[403]);
| O[93] = add_mad1(C[0], C[0], C[0], C[0]);
| O[200] = add_mad1(C[0], C[0], C[0], O[402]);
| O[23] = add_mad1(O[404], C[0], C[0], C[0]);
| O[448] = add_mad1(C[0], C[0], C[0], O[402]);
| O[400] = add_mad1(C[0], C[0], C[0], C[0]);
| O[21] = add_mad1(O[405], C[0], C[0], O[402]);
| O[444] = mad_mad0(C[7], C[0], O[95], O[6], C[0]);
| O[485] = add_mad1(O[94], C[0], O[6], C[0]);
| O[399] = add_mad1(O[399], C[0], O[6], O[402]);
| O[188] = mul_mad1(O[401], O[479], O[93], O[307]);
| O[424] = mul_mad1(O[401], O[483], O[93], O[115]);
| O[95] = mul_mad1(O[401], O[487], O[93], O[22]);
| O[401] = mul_mad1(O[401], C[0], O[93], C[0]);
| O[93] = mad(C[0], C[5], C[0]);
| O[29] = mad_add(O[200], C[0], O[401], O[93]);
| O[401] = mad(C[0], C[0], C[0]);
| O[143] = mul_mad1(O[401], O[479], O[23], O[307]);
| O[449] = mul_mad1(O[401], O[483], O[23], O[115]);
| O[450] = mul_mad1(O[401], O[487], O[23], O[22]);
| O[401] = mul_mad1(O[401], C[0], O[23], C[0]);
| O[23] = mad(C[0], C[5], C[0]);
| O[456] = mad_add(O[448], C[0], O[401], O[23]);
| O[27] = mul_mad1(O[401], O[479], O[400], O[307]);
| O[23] = mul_mad1(O[401], O[483], O[400], O[115]);
| O[93] = mul_mad1(O[401], O[487], O[400], O[22]);
| O[401] = mul_mad1(O[401], C[0], O[400], C[0]);
| O[400] = mad(C[0], C[5], C[0]);
| O[286] = mad_add(O[21], C[0], O[401], O[400]);
| O[94] = mul_mad1(O[444], O[479], O[485], O[307]);
| O[400] = mul_mad1(O[444], O[483], O[485], O[115]);
| O[401] = mul_mad1(O[444], O[487], O[485], O[22]);
| O[444] = mul_mad1(O[444], C[0], O[485], C[0]);
| O[444] = mad(O[399], C[0], O[444]);
| O[6] = mad_add(O[6], C[5], C[0], O[444]);
| O[424] = mad_add(O[200], O[316], O[424], C[0]);
| O[95] = mad_add(O[200], O[486], O[95], C[0]);
| O[131] = mad(I[143], I[146], I[147]);
| O[200] = mad_mad0(O[200], O[315], O[188], O[29], O[131]);
| O[132] = mad(I[144], I[146], I[148]);
| O[424] = mad(O[29], O[132], O[424]);
| O[117] = mad(I[145], I[146], I[149]);
| O[95] = mad(O[29], O[117], O[95]);
| O[29] = mad(O[29], C[5], C[0]);
| O[449] = mad_add(O[448], O[316], O[449], C[0]);
| O[450] = mad_add(O[448], O[486], O[450], C[0]);
| O[448] = mad_mad0(O[448], O[315], O[143], O[456], O[131]);
| O[449] = mad(O[456], O[132], O[449]);
| O[450] = mad(O[456], O[117], O[450]);
| O[143] = mad(O[456], C[5], C[0]);
| O[23] = mad_add(O[21], O[316], O[23], C[0]);
| O[93] = mad_add(O[21], O[486], O[93], C[0]);
| O[21] = mad_mad0(O[21], O[315], O[27], O[286], O[131]);
| O[23] = mad(O[286], O[132], O[23]);
| O[93] = mad(O[286], O[117], O[93]);
| O[188] = mad(O[286], C[5], C[0]);
| O[400] = mad_add(O[399], O[316], O[400], C[0]);
| O[401] = mad_add(O[399], O[486], O[401], C[0]);
| O[456] = mad_mad0(O[399], O[315], O[94], O[6], O[131]);
| O[286] = mad(O[6], O[132], O[400]);
| O[94] = mad(O[6], O[117], O[401]);
| O[6] = mad(O[6], C[5], C[0]);
| outputdata_float(0, 145, R[0], O[6]);
| outputdata_float(0, 289, R[0], O[6]);
| outputdata_float(0, 397, R[0], O[6]);
| O[6] = neg(O[131]);
| O[482] = neg(O[132]);
| O[399] = neg(O[117]);
| O[480] = rcp(O[403]);
| O[484] = rcp(O[404]);
| O[485] = rcp(O[405]);
| O[401] = neg(O[402]);
| O[400] = mul_mad1(O[6], O[479], O[482], O[483]);
| O[444] = mul_mad1(O[6], O[307], O[482], O[115]);
| O[27] = mul_mad1(O[6], O[315], O[482], O[316]);
| O[481] = mul_mad1(O[6], C[0], O[482], C[0]);
| O[504] = mad_add(O[399], C[0], O[481], C[5]);
| O[248] = mad_add(O[399], O[22], O[444], C[0]);
| O[481] = mad_add(O[399], O[486], O[27], C[0]);
| O[444] = neg(C[0]);
| O[27] = mad_mad0(O[399], O[487], O[400], O[504], O[444]);
| O[400] = neg(C[0]);
| O[505] = add_add(O[307], C[0], C[0]);
| O[495] = add_add(O[315], C[0], C[0]);
| O[308] = add_add(O[115], C[0], C[0]);
| O[499] = add_add(O[316], C[0], C[0]);
| O[116] = add_add(O[22], C[0], C[0]);
| O[503] = add_add(O[486], C[0], C[0]);
| O[241] = mad_add(O[504], O[400], O[248], C[0]);
| O[481] = mad_add(O[504], O[401], O[481], C[0]);
| O[383] = mad_add(O[504], C[5], C[0], C[0]);
| O[240] = mul_mad1(O[479], O[480], O[505], C[0]);
| O[496] = mul_mad1(O[479], C[0], O[505], O[484]);
| O[497] = mul_mad1(O[479], C[0], O[505], C[0]);
| O[505] = mul_mad1(O[479], C[0], O[505], C[0]);
| O[504] = add(C[0], C[0]);
| O[498] = mad_add(O[495], C[0], O[505], O[504]);
| O[244] = mul_mad1(O[483], O[480], O[308], C[0]);
| O[500] = mul_mad1(O[483], C[0], O[308], O[484]);
| O[501] = mul_mad1(O[483], C[0], O[308], C[0]);
| O[308] = mul_mad1(O[483], C[0], O[308], C[0]);
| O[505] = add(C[0], C[0]);
| O[502] = mad_add(O[499], C[0], O[308], O[505]);
| O[248] = mul_mad1(O[487], O[480], O[116], C[0]);
| O[504] = mul_mad1(O[487], C[0], O[116], O[484]);
| O[505] = mul_mad1(O[487], C[0], O[116], C[0]);
| O[116] = mul_mad1(O[487], C[0], O[116], C[0]);
| O[308] = add(C[0], C[0]);
| O[308] = mad_add(O[503], C[0], O[116], O[308]);
| O[480] = mul_mad1(O[27], O[480], O[241], C[0]);
| O[484] = mul_mad1(O[27], C[0], O[241], O[484]);
| O[116] = mul_mad1(O[27], C[0], O[241], C[0]);
| O[27] = mul_mad1(O[27], C[0], O[241], C[0]);
| O[27] = mad_add(O[481], C[0], O[27], O[383]);
| O[496] = mad_add(O[495], C[0], O[496], C[0]);
| O[497] = mad_add(O[495], O[485], O[497], C[0]);
| O[495] = mad_mad0(O[495], C[0], O[240], O[498], C[6]);
| outputdata_float(0, 182, R[0], O[495]);
| outputdata_float(0, 322, R[0], O[495]);
| outputdata_float(0, 433, R[0], O[495]);
| O[496] = mad(O[498], C[6], O[496]);
| outputdata_float(0, 183, R[0], O[496]);
| outputdata_float(0, 323, R[0], O[496]);
| outputdata_float(0, 434, R[0], O[496]);
| O[497] = mad(O[498], C[6], O[497]);
| outputdata_float(0, 184, R[0], O[497]);
| outputdata_float(0, 324, R[0], O[497]);
| outputdata_float(0, 435, R[0], O[497]);
| O[498] = add(O[498], C[0]);
| outputdata_float(0, 185, R[0], O[498]);
| outputdata_float(0, 325, R[0], O[498]);
| outputdata_float(0, 436, R[0], O[498]);
| O[500] = mad_add(O[499], C[0], O[500], C[0]);
| O[501] = mad_add(O[499], O[485], O[501], C[0]);
| O[499] = mad_mad0(O[499], C[0], O[244], O[502], C[6]);
| outputdata_float(0, 186, R[0], O[499]);
| outputdata_float(0, 326, R[0], O[499]);
| outputdata_float(0, 437, R[0], O[499]);
| O[500] = mad(O[502], C[6], O[500]);
| outputdata_float(0, 187, R[0], O[500]);
| outputdata_float(0, 327, R[0], O[500]);
| outputdata_float(0, 438, R[0], O[500]);
| O[501] = mad(O[502], C[6], O[501]);
| outputdata_float(0, 188, R[0], O[501]);
| outputdata_float(0, 328, R[0], O[501]);
| outputdata_float(0, 439, R[0], O[501]);
| O[502] = add(O[502], C[0]);
| outputdata_float(0, 189, R[0], O[502]);
| outputdata_float(0, 329, R[0], O[502]);
| outputdata_float(0, 440, R[0], O[502]);
| O[504] = mad_add(O[503], C[0], O[504], C[0]);
| O[505] = mad_add(O[503], O[485], O[505], C[0]);
| O[503] = mad_mad0(O[503], C[0], O[248], O[308], C[6]);
| outputdata_float(0, 190, R[0], O[503]);
| outputdata_float(0, 330, R[0], O[503]);
| outputdata_float(0, 441, R[0], O[503]);
| O[504] = mad(O[308], C[6], O[504]);
| outputdata_float(0, 191, R[0], O[504]);
| outputdata_float(0, 331, R[0], O[504]);
| outputdata_float(0, 442, R[0], O[504]);
| O[505] = mad(O[308], C[6], O[505]);
| outputdata_float(0, 192, R[0], O[505]);
| outputdata_float(0, 332, R[0], O[505]);
| outputdata_float(0, 443, R[0], O[505]);
| O[308] = add(O[308], C[0]);
| outputdata_float(0, 193, R[0], O[308]);
| outputdata_float(0, 333, R[0], O[308]);
| outputdata_float(0, 444, R[0], O[308]);
| O[484] = mad_add(O[481], C[0], O[484], C[0]);
| O[485] = mad_add(O[481], O[485], O[116], C[0]);
| O[481] = mad_mad0(O[481], C[0], O[480], O[27], C[6]);
| outputdata_float(0, 194, R[0], O[481]);
| outputdata_float(0, 334, R[0], O[481]);
| outputdata_float(0, 445, R[0], O[481]);
| O[484] = mad(O[27], C[6], O[484]);
| outputdata_float(0, 195, R[0], O[484]);
| outputdata_float(0, 335, R[0], O[484]);
| outputdata_float(0, 446, R[0], O[484]);
| O[485] = mad(O[27], C[6], O[485]);
| outputdata_float(0, 196, R[0], O[485]);
| outputdata_float(0, 336, R[0], O[485]);
| outputdata_float(0, 447, R[0], O[485]);
| O[27] = add(O[27], C[0]);
| outputdata_float(0, 197, R[0], O[27]);
| outputdata_float(0, 337, R[0], O[27]);
| outputdata_float(0, 448, R[0], O[27]);
| O[27] = mul_mad1(O[6], O[479], O[482], O[483]);
| O[484] = mul_mad1(O[6], O[307], O[482], O[115]);
| O[485] = mul_mad1(O[6], O[315], O[482], O[316]);
| O[6] = mul_mad1(O[6], C[0], O[482], C[0]);
| O[6] = mad_add(O[399], C[0], O[6], C[5]);
| O[116] = mad_add(O[399], O[22], O[484], C[0]);
| O[482] = mad_add(O[399], O[486], O[485], C[0]);
| O[399] = mad_mad0(O[399], O[487], O[27], O[6], O[444]);
| O[480] = add_add(O[307], C[0], C[0]);
| O[481] = add_add(O[315], C[0], C[0]);
| O[484] = add_add(O[115], C[0], C[0]);
| O[485] = add_add(O[316], C[0], C[0]);
| O[444] = add_add(O[22], C[0], C[0]);
| O[27] = add_add(O[486], C[0], C[0]);
| O[400] = mad_add(O[6], O[400], O[116], C[0]);
| O[401] = mad_add(O[6], O[401], O[482], C[0]);
| O[6] = mad_add(O[6], C[5], C[0], C[0]);
| O[116] = add(O[483], C[0]);
| O[482] = add(O[487], C[0]);
| O[308] = add(O[115], C[0]);
| O[22] = add(O[22], C[0]);
| O[316] = add(O[316], C[0]);
| O[486] = add(O[486], C[0]);
| outputdata_float(0, 67, R[0], O[116]);
| outputdata_float(0, 83, R[0], O[116]);
| outputdata_float(0, 227, R[0], O[116]);
| outputdata_float(0, 243, R[0], O[116]);
| outputdata_float(0, 68, R[0], O[482]);
| outputdata_float(0, 84, R[0], O[482]);
| outputdata_float(0, 228, R[0], O[482]);
| outputdata_float(0, 244, R[0], O[482]);
| O[115] = mul_mad1(C[0], O[479], C[0], O[307]);
| outputdata_float(0, 70, R[0], O[307]);
| outputdata_float(0, 86, R[0], O[307]);
| outputdata_float(0, 230, R[0], O[307]);
| outputdata_float(0, 246, R[0], O[307]);
| O[116] = mul_mad1(C[0], O[116], C[0], O[308]);
| outputdata_float(0, 71, R[0], O[308]);
| outputdata_float(0, 87, R[0], O[308]);
| outputdata_float(0, 231, R[0], O[308]);
| outputdata_float(0, 247, R[0], O[308]);
| O[482] = mul_mad1(C[0], O[482], C[0], O[22]);
| outputdata_float(0, 72, R[0], O[22]);
| outputdata_float(0, 88, R[0], O[22]);
| outputdata_float(0, 232, R[0], O[22]);
| outputdata_float(0, 248, R[0], O[22]);
| O[22] = mul_mad1(C[0], C[0], C[0], C[0]);
| outputdata_float(0, 74, R[0], O[315]);
| outputdata_float(0, 90, R[0], O[315]);
| outputdata_float(0, 234, R[0], O[315]);
| outputdata_float(0, 250, R[0], O[315]);
| outputdata_float(0, 75, R[0], O[316]);
| outputdata_float(0, 91, R[0], O[316]);
| outputdata_float(0, 235, R[0], O[316]);
| outputdata_float(0, 251, R[0], O[316]);
| outputdata_float(0, 76, R[0], O[486]);
| outputdata_float(0, 92, R[0], O[486]);
| outputdata_float(0, 236, R[0], O[486]);
| outputdata_float(0, 252, R[0], O[486]);
| O[315] = mad_add(O[402], O[315], O[115], O[131]);
| outputdata_float(0, 78, R[0], O[315]);
| outputdata_float(0, 94, R[0], O[315]);
| outputdata_float(0, 238, R[0], O[315]);
| outputdata_float(0, 254, R[0], O[315]);
| O[316] = mad_add(O[402], O[316], O[116], O[132]);
| outputdata_float(0, 79, R[0], O[316]);
| outputdata_float(0, 95, R[0], O[316]);
| outputdata_float(0, 239, R[0], O[316]);
| outputdata_float(0, 255, R[0], O[316]);
| O[486] = mad_add(O[402], O[486], O[482], O[117]);
| outputdata_float(0, 80, R[0], O[486]);
| outputdata_float(0, 96, R[0], O[486]);
| outputdata_float(0, 240, R[0], O[486]);
| outputdata_float(0, 256, R[0], O[486]);
| O[402] = mad_add(O[402], C[0], O[22], C[5]);
| outputdata_float(0, 81, R[0], O[402]);
| outputdata_float(0, 97, R[0], O[402]);
| outputdata_float(0, 241, R[0], O[402]);
| outputdata_float(0, 257, R[0], O[402]);
| O[482] = mul_mad1(C[7], O[403], C[7], C[0]);
| O[486] = mul_mad1(C[7], C[0], C[7], O[404]);
| O[22] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[402] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[482] = mad(C[7], C[0], O[482]);
| outputdata_float(0, 270, R[0], O[482]);
| outputdata_float(0, 378, R[0], O[482]);
| O[486] = mad(C[7], C[0], O[486]);
| outputdata_float(0, 271, R[0], O[486]);
| outputdata_float(0, 379, R[0], O[486]);
| O[22] = mad(C[7], O[405], O[22]);
| outputdata_float(0, 272, R[0], O[22]);
| outputdata_float(0, 380, R[0], O[22]);
| outputdata_int32(0, 3, R[0], I[86]);
| O[402] = mad_add(C[7], C[0], O[402], C[5]);
| outputdata_float(0, 273, R[0], O[402]);
| outputdata_float(0, 381, R[0], O[402]);
| O[402] = rcp(O[403]);
| outputdata_float(0, 210, R[0], O[402]);
| outputdata_float(0, 258, R[0], O[403]);
| outputdata_float(0, 348, R[0], O[402]);
| outputdata_float(0, 366, R[0], O[403]);
| outputdata_float(0, 398, R[0], O[403]);
| O[403] = rcp(O[404]);
| outputdata_float(0, 215, R[0], O[403]);
| outputdata_float(0, 263, R[0], O[404]);
| outputdata_float(0, 353, R[0], O[403]);
| outputdata_float(0, 371, R[0], O[404]);
| outputdata_float(0, 399, R[0], O[404]);
| O[404] = rcp(O[405]);
| outputdata_float(0, 220, R[0], O[404]);
| outputdata_float(0, 268, R[0], O[405]);
| outputdata_float(0, 358, R[0], O[404]);
| outputdata_float(0, 376, R[0], O[405]);
| outputdata_float(0, 400, R[0], O[405]);
| O[486] = add(C[0], C[0]);
| O[482] = add(C[0], C[0]);
| O[22] = add(C[0], C[0]);
| external_func_call(O[479], O[480], O[481], O[482], O[483], O[484], O[485], O[486], O[487], O[444], O[27], O[22], O[399], O[400], O[401], O[6]O[402], O[403], O[404], O[405]);
| outputdata_float(0, 66, R[0], O[479]);
| outputdata_float(0, 82, R[0], O[479]);
| outputdata_float(0, 150, R[0], O[479]);
| outputdata_float(0, 151, R[0], O[480]);
| outputdata_float(0, 152, R[0], O[481]);
| outputdata_float(0, 153, R[0], O[482]);
| outputdata_float(0, 154, R[0], O[483]);
| outputdata_float(0, 155, R[0], O[484]);
| outputdata_float(0, 156, R[0], O[485]);
| outputdata_float(0, 157, R[0], O[486]);
| outputdata_float(0, 158, R[0], O[487]);
| outputdata_float(0, 159, R[0], O[444]);
| outputdata_float(0, 160, R[0], O[27]);
| outputdata_float(0, 161, R[0], O[22]);
| outputdata_float(0, 162, R[0], O[399]);
| outputdata_float(0, 163, R[0], O[400]);
| outputdata_float(0, 164, R[0], O[401]);
| outputdata_float(0, 165, R[0], O[6]);
| outputdata_float(0, 166, R[0], O[479]);
| outputdata_float(0, 167, R[0], O[480]);
| outputdata_float(0, 168, R[0], O[481]);
| outputdata_float(0, 169, R[0], O[482]);
| outputdata_float(0, 170, R[0], O[483]);
| outputdata_float(0, 171, R[0], O[484]);
| outputdata_float(0, 172, R[0], O[485]);
| outputdata_float(0, 173, R[0], O[486]);
| outputdata_float(0, 174, R[0], O[487]);
| outputdata_float(0, 175, R[0], O[444]);
| outputdata_float(0, 176, R[0], O[27]);
| outputdata_float(0, 177, R[0], O[22]);
| outputdata_float(0, 178, R[0], O[399]);
| outputdata_float(0, 179, R[0], O[400]);
| outputdata_float(0, 180, R[0], O[401]);
| outputdata_float(0, 181, R[0], O[6]);
| outputdata_float(0, 226, R[0], O[479]);
| outputdata_float(0, 242, R[0], O[479]);
| outputdata_float(0, 290, R[0], O[479]);
| outputdata_float(0, 291, R[0], O[480]);
| outputdata_float(0, 292, R[0], O[481]);
| outputdata_float(0, 293, R[0], O[482]);
| outputdata_float(0, 294, R[0], O[483]);
| outputdata_float(0, 295, R[0], O[484]);
| outputdata_float(0, 296, R[0], O[485]);
| outputdata_float(0, 297, R[0], O[486]);
| outputdata_float(0, 298, R[0], O[487]);
| outputdata_float(0, 299, R[0], O[444]);
| outputdata_float(0, 300, R[0], O[27]);
| outputdata_float(0, 301, R[0], O[22]);
| outputdata_float(0, 302, R[0], O[399]);
| outputdata_float(0, 303, R[0], O[400]);
| outputdata_float(0, 304, R[0], O[401]);
| outputdata_float(0, 305, R[0], O[6]);
| outputdata_float(0, 306, R[0], O[479]);
| outputdata_float(0, 307, R[0], O[480]);
| outputdata_float(0, 308, R[0], O[481]);
| outputdata_float(0, 309, R[0], O[482]);
| outputdata_float(0, 310, R[0], O[483]);
| outputdata_float(0, 311, R[0], O[484]);
| outputdata_float(0, 312, R[0], O[485]);
| outputdata_float(0, 313, R[0], O[486]);
| outputdata_float(0, 314, R[0], O[487]);
| outputdata_float(0, 315, R[0], O[444]);
| outputdata_float(0, 316, R[0], O[27]);
| outputdata_float(0, 317, R[0], O[22]);
| outputdata_float(0, 318, R[0], O[399]);
| outputdata_float(0, 319, R[0], O[400]);
| outputdata_float(0, 320, R[0], O[401]);
| outputdata_float(0, 321, R[0], O[6]);
| outputdata_float(0, 401, R[0], O[479]);
| outputdata_float(0, 402, R[0], O[480]);
| outputdata_float(0, 403, R[0], O[481]);
| outputdata_float(0, 404, R[0], O[482]);
| outputdata_float(0, 405, R[0], O[483]);
| outputdata_float(0, 406, R[0], O[484]);
| outputdata_float(0, 407, R[0], O[485]);
| outputdata_float(0, 408, R[0], O[486]);
| outputdata_float(0, 409, R[0], O[487]);
| outputdata_float(0, 410, R[0], O[444]);
| outputdata_float(0, 411, R[0], O[27]);
| outputdata_float(0, 412, R[0], O[22]);
| outputdata_float(0, 413, R[0], O[399]);
| outputdata_float(0, 414, R[0], O[400]);
| outputdata_float(0, 415, R[0], O[401]);
| outputdata_float(0, 416, R[0], O[6]);
| outputdata_float(0, 417, R[0], O[479]);
| outputdata_float(0, 418, R[0], O[480]);
| outputdata_float(0, 419, R[0], O[481]);
| outputdata_float(0, 420, R[0], O[482]);
| outputdata_float(0, 421, R[0], O[483]);
| outputdata_float(0, 422, R[0], O[484]);
| outputdata_float(0, 423, R[0], O[485]);
| outputdata_float(0, 424, R[0], O[486]);
| outputdata_float(0, 425, R[0], O[487]);
| outputdata_float(0, 426, R[0], O[444]);
| outputdata_float(0, 427, R[0], O[27]);
| outputdata_float(0, 428, R[0], O[22]);
| outputdata_float(0, 429, R[0], O[399]);
| outputdata_float(0, 430, R[0], O[400]);
| outputdata_float(0, 431, R[0], O[401]);
| outputdata_float(0, 432, R[0], O[6]);
| O[400] = mul_mad1(O[200], C[6], O[448], C[6]);
| O[401] = mul_mad1(O[424], C[6], O[449], C[6]);
| O[6] = mul_mad1(O[95], C[6], O[450], C[6]);
| O[400] = mad_add(O[21], C[6], O[400], O[456]);
| O[401] = mad_add(O[23], C[6], O[401], O[286]);
| O[6] = mad_add(O[93], C[6], O[6], O[94]);
| O[405] = mul(O[405], C[8]);
| O[399] = mad(I[143], I[146], O[400]);
| O[400] = mad(I[144], I[146], O[401]);
| O[401] = mad(I[145], I[146], O[6]);
| O[6] = cmpeq_select(I[0], C[0], C[9], I[1]);
| outputdata_float(0, 1, R[0], O[6]);
| outputdata_int32(0, 5, R[0], I[88]);
| O[6] = add(I[0], C[2]);
| outputdata_float(0, 0, R[0], O[6]);
| outputdata_int32(0, 6, R[0], I[89]);
| O[6] = cmpneqi(I[84], C[11]);
| O[6] = cmpnei_logic_and(I[84], C[12], O[6]);
| O[6] = cmpeqi_logic_and(O[7], C[3], O[6]);
| O[22] = cmplei_logic_and(I[85], O[7], O[6]);
| O[6] = cmpeqi(I[84], C[13]);
| O[6] = cmpeqi_logic_or(I[84], C[4], O[6]);
| O[6] = cmpeqi_logic_and(O[335], C[4], O[6]);
| O[6] = b2i(O[6]);
| O[6] = cmpeqi_select(O[6], C[3], O[335], C[13]);
| O[6] = select(O[22], O[6], I[84]);
| O[22] = select(O[22], O[7], I[85]);
| O[27] = cmpneqi(O[335], C[3]);
| outputdata_int32(0, 59, R[0], O[335]);
| outputdata_int32(0, 60, R[0], O[7]);
| O[7] = cmpeqi_logic_and(O[7], C[4], O[27]);
| O[27] = cmpneqi(O[6], C[12]);
| O[27] = cmpnei_logic_and(O[6], C[11], O[27]);
| O[7] = logic_and(O[7], O[27]);
| O[7] = cmplei_logic_and(O[22], C[13], O[7]);
| O[6] = select(O[7], C[13], O[6]);
| O[22] = select(O[7], C[13], O[22]);
| O[7] = cmpneqi(O[6], C[3]);
| O[7] = cmpnei_logic_and(O[22], C[3], O[7]);
| O[7] = cmpeqi_logic_and(I[163], C[3], O[7]);
| outputdata_int32(0, 8, R[0], I[91]);
| O[7] = cmplei_logic_and(O[22], C[11], O[7]);
| O[6] = select(O[7], C[11], O[6]);
| O[7] = select(O[7], C[11], O[22]);
| O[22] = mul(I[158], C[2]);
| O[27] = mul(I[157], C[2]);
| O[27] = mul_mad1(O[22], O[22], O[27], O[27]);
| O[22] = mul(I[159], C[2]);
| O[22] = mad_sqrt(O[22], O[22], O[27]);
| outputdata_float(0, 7, R[0], I[5]);
| O[22] = fmod_add(I[2], C[14], O[22]);
| external_func_call(C[3]O[27], R[65535], R[65535]);
| O[27] = i2f_div1(O[27], I[78]);
| outputdata_float(0, 4, R[0], O[27]);
| outputdata_float(0, 109, R[0], I[78]);
| outputdata_float(0, 147, R[0], I[78]);
| O[27] = mul_mad1(O[424], O[424], O[200], O[200]);
| O[27] = mad_mad0(O[95], O[95], O[27], O[29], O[29]);
| outputdata_float(0, 133, R[0], O[29]);
| outputdata_float(0, 277, R[0], O[29]);
| outputdata_float(0, 385, R[0], O[29]);
| O[27] = sqrt(O[27]);
| O[29] = mul_mad1(O[449], O[449], O[448], O[448]);
| O[29] = mad_mad0(O[450], O[450], O[29], O[143], O[143]);
| outputdata_float(0, 137, R[0], O[143]);
| outputdata_float(0, 281, R[0], O[143]);
| outputdata_float(0, 389, R[0], O[143]);
| O[143] = sqrt(O[29]);
| O[29] = mul_mad1(O[23], O[23], O[21], O[21]);
| O[29] = mad_mad0(O[93], O[93], O[29], O[188], O[188]);
| outputdata_float(0, 141, R[0], O[188]);
| outputdata_float(0, 285, R[0], O[188]);
| outputdata_float(0, 393, R[0], O[188]);
| O[29] = sqrt(O[29]);
| O[27] = mul(O[27], C[6]);
| O[444] = mul(O[143], C[6]);
| O[29] = mul(O[29], C[6]);
| O[143] = mul_mad1(O[200], C[6], O[448], C[6]);
| O[188] = mul_mad1(O[424], C[6], O[449], C[6]);
| O[335] = mul_mad1(O[95], C[6], O[450], C[6]);
| O[143] = mad_add(O[21], C[6], O[143], O[456]);
| O[188] = mad_add(O[23], C[6], O[188], O[286]);
| O[335] = mad_add(O[93], C[6], O[335], O[94]);
| external_func_call(C[13], I[123], O[143], O[188], O[335], I[150], I[151], I[152], I[153], O[27], O[444], O[29], C[5], C[0], C[0], C[5]);
| outputdata_int32(0, 41, R[0], I[123]);
| outputdata_float(0, 130, R[0], O[200]);
| outputdata_float(0, 274, R[0], O[200]);
| outputdata_float(0, 382, R[0], O[200]);
| outputdata_float(0, 131, R[0], O[424]);
| outputdata_float(0, 275, R[0], O[424]);
| outputdata_float(0, 383, R[0], O[424]);
| outputdata_float(0, 132, R[0], O[95]);
| outputdata_float(0, 276, R[0], O[95]);
| outputdata_float(0, 384, R[0], O[95]);
| O[200] = mul_mad1(O[200], C[6], O[448], C[6]);
| outputdata_float(0, 134, R[0], O[448]);
| outputdata_float(0, 278, R[0], O[448]);
| outputdata_float(0, 386, R[0], O[448]);
| O[424] = mul_mad1(O[424], C[6], O[449], C[6]);
| outputdata_float(0, 135, R[0], O[449]);
| outputdata_float(0, 279, R[0], O[449]);
| outputdata_float(0, 387, R[0], O[449]);
| O[95] = mul_mad1(O[95], C[6], O[450], C[6]);
| outputdata_float(0, 136, R[0], O[450]);
| outputdata_float(0, 280, R[0], O[450]);
| outputdata_float(0, 388, R[0], O[450]);
| outputdata_float(0, 138, R[0], O[21]);
| outputdata_float(0, 282, R[0], O[21]);
| outputdata_float(0, 390, R[0], O[21]);
| outputdata_float(0, 139, R[0], O[23]);
| outputdata_float(0, 283, R[0], O[23]);
| outputdata_float(0, 391, R[0], O[23]);
| outputdata_float(0, 140, R[0], O[93]);
| outputdata_float(0, 284, R[0], O[93]);
| outputdata_float(0, 392, R[0], O[93]);
| O[21] = mad_add(O[21], C[6], O[200], O[456]);
| outputdata_float(0, 142, R[0], O[456]);
| outputdata_float(0, 286, R[0], O[456]);
| outputdata_float(0, 394, R[0], O[456]);
| O[23] = mad_add(O[23], C[6], O[424], O[286]);
| outputdata_float(0, 143, R[0], O[286]);
| outputdata_float(0, 287, R[0], O[286]);
| outputdata_float(0, 395, R[0], O[286]);
| O[93] = mad_add(O[93], C[6], O[95], O[94]);
| outputdata_float(0, 8, R[0], I[6]);
| outputdata_float(0, 9, R[0], I[7]);
| outputdata_float(0, 144, R[0], O[94]);
| outputdata_float(0, 288, R[0], O[94]);
| outputdata_float(0, 396, R[0], O[94]);
| O[94] = mul(I[150], C[16]);
| O[94] = mul_add(I[153], C[15], O[94]);
| O[95] = mul(I[150], C[15]);
| O[424] = mul_mad1(I[153], C[16], O[95], C[8]);
| O[95] = mul(I[151], C[16]);
| O[95] = mad_add(C[0], C[8], C[0], O[95]);
| O[286] = mul(I[151], C[15]);
| O[286] = add_mad1(C[0], C[0], O[286], C[8]);
| O[94] = add_mad1(C[0], O[94], C[0], C[8]);
| O[95] = mul_add(I[152], C[15], O[95]);
| O[286] = mul_add(I[152], C[16], O[286]);
| O[424] = mad_mad0(C[0], C[8], O[424], C[0], C[8]);
| outputdata_int32(0, 4, R[0], I[87]);
| external_func_call(C[13], C[17], O[21], O[23], O[93], O[94], O[95], O[286], O[424], O[27], O[29], I[96], I[98], C[6], C[0], C[0], C[5]);
| outputdata_float(0, 225, R[0], C[5]);
| outputdata_float(0, 363, R[0], C[5]);
| outputdata_int32(0, 13, R[0], I[96]);
| outputdata_int32(0, 15, R[0], I[98]);
| O[23] = add(C[2], I[61]);
| O[21] = sub(O[23], C[2]);
| outputdata_float(0, 2, R[0], C[2]);
| outputdata_float(0, 3, R[0], O[22]);
| O[21] = sub(C[18], O[21]);
| outputdata_float(0, 128, R[0], O[21]);
| O[22] = sub(C[18], O[23]);
| outputdata_float(0, 10, R[0], I[8]);
| outputdata_float(0, 98, R[0], O[23]);
| outputdata_float(0, 146, R[0], I[8]);
| O[22] = cmplt(O[22], C[0]);
| O[21] = cmpge_logic_and(O[21], C[0], O[22]);
| O[22] = mul(C[19], I[141]);
| O[22] = f2i_maxi(O[22], C[13]);
| outputdata_float(0, 6, R[0], I[4]);
| O[21] = b2i(O[21]);
| O[21] = cmpeqi_select(O[21], C[3], C[3], O[22]);
| outputdata_int32(0, 56, R[0], O[21]);
| O[23] = neg(C[6]);
| O[21] = mad(I[160], O[23], C[0]);
| O[22] = mad(I[161], O[23], C[0]);
| O[93] = mul(I[162], C[6]);
| O[23] = mad(I[162], O[23], O[93]);
| O[94] = mad(I[161], C[6], C[0]);
| outputdata_float(0, 63, R[0], C[0]);
| outputdata_float(0, 64, R[0], C[0]);
| outputdata_float(0, 69, R[0], C[0]);
| outputdata_float(0, 73, R[0], C[0]);
| outputdata_float(0, 77, R[0], C[0]);
| outputdata_float(0, 85, R[0], C[0]);
| outputdata_float(0, 89, R[0], C[0]);
| outputdata_float(0, 93, R[0], C[0]);
| outputdata_float(0, 99, R[0], C[0]);
| O[95] = clamp(I[142], C[0], C[10]);
| outputdata_float(0, 126, R[0], O[95]);
| outputdata_float(0, 129, R[0], C[0]);
| outputdata_float(0, 207, R[0], C[0]);
| outputdata_float(0, 208, R[0], C[0]);
| outputdata_float(0, 211, R[0], C[0]);
| outputdata_float(0, 212, R[0], C[0]);
| outputdata_float(0, 213, R[0], C[0]);
| outputdata_float(0, 214, R[0], C[0]);
| outputdata_float(0, 216, R[0], C[0]);
| outputdata_float(0, 217, R[0], C[0]);
| outputdata_float(0, 218, R[0], C[0]);
| outputdata_float(0, 219, R[0], C[0]);
| outputdata_float(0, 221, R[0], C[0]);
| outputdata_float(0, 229, R[0], C[0]);
| outputdata_float(0, 233, R[0], C[0]);
| outputdata_float(0, 237, R[0], C[0]);
| outputdata_float(0, 245, R[0], C[0]);
| outputdata_float(0, 249, R[0], C[0]);
| outputdata_float(0, 253, R[0], C[0]);
| outputdata_float(0, 259, R[0], C[0]);
| outputdata_float(0, 260, R[0], C[0]);
| outputdata_float(0, 261, R[0], C[0]);
| outputdata_float(0, 262, R[0], C[0]);
| outputdata_float(0, 264, R[0], C[0]);
| outputdata_float(0, 265, R[0], C[0]);
| outputdata_float(0, 266, R[0], C[0]);
| outputdata_float(0, 267, R[0], C[0]);
| outputdata_float(0, 269, R[0], C[0]);
| outputdata_float(0, 345, R[0], C[0]);
| outputdata_float(0, 346, R[0], C[0]);
| outputdata_float(0, 349, R[0], C[0]);
| outputdata_float(0, 350, R[0], C[0]);
| outputdata_float(0, 351, R[0], C[0]);
| outputdata_float(0, 352, R[0], C[0]);
| outputdata_float(0, 354, R[0], C[0]);
| outputdata_float(0, 355, R[0], C[0]);
| outputdata_float(0, 356, R[0], C[0]);
| outputdata_float(0, 357, R[0], C[0]);
| outputdata_float(0, 359, R[0], C[0]);
| outputdata_float(0, 367, R[0], C[0]);
| outputdata_float(0, 368, R[0], C[0]);
| outputdata_float(0, 369, R[0], C[0]);
| outputdata_float(0, 370, R[0], C[0]);
| outputdata_float(0, 372, R[0], C[0]);
| outputdata_float(0, 373, R[0], C[0]);
| outputdata_float(0, 374, R[0], C[0]);
| outputdata_float(0, 375, R[0], C[0]);
| outputdata_float(0, 377, R[0], C[0]);
| O[95] = mad(I[162], C[6], O[93]);
| outputdata_float(0, 65, R[0], C[6]);
| outputdata_float(0, 209, R[0], C[6]);
| outputdata_float(0, 222, R[0], C[6]);
| outputdata_float(0, 223, R[0], C[6]);
| outputdata_float(0, 224, R[0], C[6]);
| outputdata_float(0, 347, R[0], C[6]);
| outputdata_float(0, 360, R[0], C[6]);
| outputdata_float(0, 361, R[0], C[6]);
| outputdata_float(0, 362, R[0], C[6]);
| O[93] = mad(I[160], C[6], C[0]);
| external_func_call(C[4], C[20], C[20], O[21], O[22], O[23], O[93], O[94], O[95]);
| outputdata_int32(0, 2, R[0], O[7]);
| external_func_call(C[11], O[399], O[400], O[401], O[402], O[403], O[404], O[405], I[9], I[10], I[11], C[3], C[17]R[65535]);
| outputdata_float(0, 11, R[0], I[9]);
| outputdata_float(0, 12, R[0], I[10]);
| outputdata_float(0, 13, R[0], I[11]);
| outputdata_float(0, 56, R[0], O[399]);
| outputdata_float(0, 57, R[0], O[400]);
| outputdata_float(0, 58, R[0], O[401]);
| outputdata_float(0, 59, R[0], O[402]);
| outputdata_float(0, 60, R[0], O[403]);
| outputdata_float(0, 61, R[0], O[404]);
| outputdata_float(0, 62, R[0], O[405]);
| outputdata_float(0, 200, R[0], O[399]);
| outputdata_float(0, 201, R[0], O[400]);
| outputdata_float(0, 202, R[0], O[401]);
| outputdata_float(0, 203, R[0], O[402]);
| outputdata_float(0, 204, R[0], O[403]);
| outputdata_float(0, 205, R[0], O[404]);
| outputdata_float(0, 206, R[0], O[405]);
| outputdata_float(0, 338, R[0], O[399]);
| outputdata_float(0, 339, R[0], O[400]);
| outputdata_float(0, 340, R[0], O[401]);
| outputdata_float(0, 341, R[0], O[402]);
| outputdata_float(0, 342, R[0], O[403]);
| outputdata_float(0, 343, R[0], O[404]);
| outputdata_float(0, 344, R[0], O[405]);
| outputdata_int32(0, 0, R[0], C[21]);
| outputdata_int32(0, 1, R[0], O[6]);
| outputdata_int32(0, 7, R[0], I[90]);
| outputdata_int32(0, 9, R[0], I[92]);
| outputdata_int32(0, 37, R[0], C[3]);
| outputdata_int32(0, 57, R[0], C[3]);
| outputdata_int32(0, 58, R[0], C[20]);
| outputdata_float(0, 14, R[0], I[12]);
| outputdata_float(0, 15, R[0], I[13]);
| outputdata_float(0, 16, R[0], I[14]);
| outputdata_float(0, 17, R[0], I[15]);
| outputdata_float(0, 18, R[0], I[16]);
| outputdata_float(0, 19, R[0], I[17]);
| outputdata_float(0, 20, R[0], I[18]);
| outputdata_float(0, 21, R[0], I[19]);
| outputdata_float(0, 22, R[0], I[20]);
| outputdata_float(0, 23, R[0], I[21]);
| outputdata_float(0, 24, R[0], I[22]);
| outputdata_float(0, 25, R[0], I[23]);
| outputdata_float(0, 26, R[0], I[24]);
| outputdata_float(0, 27, R[0], I[25]);
| outputdata_float(0, 28, R[0], I[26]);
| outputdata_float(0, 29, R[0], I[27]);
| outputdata_float(0, 30, R[0], I[28]);
| outputdata_float(0, 31, R[0], I[29]);
| outputdata_float(0, 32, R[0], I[30]);
| outputdata_float(0, 33, R[0], I[31]);
| outputdata_float(0, 34, R[0], I[32]);
| outputdata_float(0, 35, R[0], I[33]);
| outputdata_float(0, 36, R[0], I[34]);
| outputdata_float(0, 37, R[0], I[35]);
| outputdata_float(0, 38, R[0], I[36]);
| outputdata_float(0, 39, R[0], I[37]);
| outputdata_float(0, 40, R[0], I[38]);
| outputdata_float(0, 41, R[0], I[39]);
| outputdata_float(0, 42, R[0], I[40]);
| outputdata_float(0, 43, R[0], I[41]);
| outputdata_float(0, 44, R[0], I[42]);
| outputdata_float(0, 45, R[0], I[43]);
| outputdata_float(0, 46, R[0], I[44]);
| outputdata_float(0, 47, R[0], I[45]);
| outputdata_float(0, 48, R[0], I[46]);
| outputdata_float(0, 49, R[0], I[47]);
| outputdata_float(0, 50, R[0], I[48]);
| outputdata_float(0, 51, R[0], I[49]);
| outputdata_float(0, 52, R[0], I[50]);
| outputdata_float(0, 53, R[0], I[51]);
| outputdata_float(0, 54, R[0], I[52]);
| outputdata_float(0, 55, R[0], I[53]);
| outputdata_float(0, 100, R[0], C[22]);
| outputdata_float(0, 101, R[0], I[62]);
| outputdata_float(0, 102, R[0], I[54]);
| outputdata_float(0, 103, R[0], I[55]);
| outputdata_float(0, 104, R[0], I[56]);
| outputdata_float(0, 105, R[0], I[57]);
| outputdata_float(0, 106, R[0], I[58]);
| outputdata_float(0, 107, R[0], I[59]);
| outputdata_float(0, 108, R[0], I[60]);
| outputdata_float(0, 110, R[0], I[79]);
| outputdata_float(0, 111, R[0], I[80]);
| outputdata_float(0, 112, R[0], I[63]);
| outputdata_float(0, 113, R[0], I[64]);
| outputdata_float(0, 114, R[0], I[65]);
| outputdata_float(0, 115, R[0], I[66]);
| outputdata_float(0, 116, R[0], I[67]);
| outputdata_float(0, 117, R[0], I[68]);
| outputdata_float(0, 118, R[0], I[69]);
| outputdata_float(0, 119, R[0], I[70]);
| outputdata_float(0, 120, R[0], I[71]);
| outputdata_float(0, 121, R[0], I[72]);
| outputdata_float(0, 122, R[0], I[73]);
| outputdata_float(0, 123, R[0], I[74]);
| outputdata_float(0, 124, R[0], I[75]);
| outputdata_float(0, 125, R[0], I[76]);
| outputdata_float(0, 127, R[0], I[77]);
| outputdata_float(0, 148, R[0], I[79]);
| outputdata_float(0, 149, R[0], I[80]);
| outputdata_int32(0, 10, R[0], I[93]);
| outputdata_int32(0, 11, R[0], I[94]);
| outputdata_int32(0, 12, R[0], I[95]);
| outputdata_int32(0, 14, R[0], I[97]);
| outputdata_int32(0, 16, R[0], I[99]);
| outputdata_int32(0, 17, R[0], I[100]);
| outputdata_int32(0, 18, R[0], I[101]);
| outputdata_int32(0, 19, R[0], I[102]);
| outputdata_int32(0, 20, R[0], I[103]);
| outputdata_int32(0, 21, R[0], I[104]);
| outputdata_int32(0, 22, R[0], I[105]);
| outputdata_int32(0, 23, R[0], I[106]);
| outputdata_int32(0, 24, R[0], I[107]);
| outputdata_int32(0, 25, R[0], I[108]);
| outputdata_int32(0, 26, R[0], I[109]);
| outputdata_int32(0, 27, R[0], I[110]);
| outputdata_int32(0, 28, R[0], I[111]);
| outputdata_int32(0, 29, R[0], I[112]);
| outputdata_int32(0, 30, R[0], I[113]);
| outputdata_int32(0, 31, R[0], I[114]);
| outputdata_int32(0, 32, R[0], I[115]);
| outputdata_int32(0, 33, R[0], I[116]);
| outputdata_int32(0, 34, R[0], I[117]);
| outputdata_int32(0, 35, R[0], I[118]);
| outputdata_int32(0, 36, R[0], I[119]);
| outputdata_int32(0, 38, R[0], I[120]);
| outputdata_int32(0, 39, R[0], I[121]);
| outputdata_int32(0, 40, R[0], I[122]);
| outputdata_int32(0, 42, R[0], I[124]);
| outputdata_int32(0, 43, R[0], I[125]);
| outputdata_int32(0, 44, R[0], I[126]);
| outputdata_int32(0, 45, R[0], I[127]);
| outputdata_int32(0, 46, R[0], I[128]);
| outputdata_int32(0, 47, R[0], I[129]);
| outputdata_int32(0, 48, R[0], I[130]);
| outputdata_int32(0, 49, R[0], I[131]);
| outputdata_int32(0, 50, R[0], I[132]);
| outputdata_int32(0, 51, R[0], I[133]);
| outputdata_int32(0, 52, R[0], I[134]);
| outputdata_int32(0, 53, R[0], I[135]);
| outputdata_int32(0, 54, R[0], I[136]);
| outputdata_int32(0, 55, R[0], I[137]);
I¬‰ëgx“Jà;\
@å;w¡@Yá
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„EV
xì;ö©\?Nñ∫/hÑ
PD‹;é„üHåÊ»5÷·˝˛V
ı≥Ûü¸;%Eº<=]˜›≤V
 MΩ¶]Ï
ˇNè≤YΩ;Q
aó|l˝U;Cö©ßRÎ·¶ÍV
¡É*ûóˆ•Ä.;ƒ—


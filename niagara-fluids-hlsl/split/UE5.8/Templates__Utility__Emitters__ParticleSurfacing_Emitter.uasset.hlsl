íc;µ:f
ã„ùC¤Œ…G˜;²´À´
s;çÉn`=K¤
eLÎX•½D$³kai™-ÍÇÔÙÀ;
£es;¢+üD³Ÿw:U‰¦o`
£es;¢+üD³Ÿw:U‰¦o_
0˜Ç;5ÞH¬MTøyJ
UÝ;Ô]êO¶/ÿg
òÎâˆ;…¥¤e
âL«Ü:¢;m1†
—Hºœì;
 h[’|F¨—÷7øM 8†
æCÑg;È
;…}«Jèû×m„bq˜¨g
®×;XBŠ¸Å
*;³zfÁk
VJl·;†
’æ";’Q
Ô}(^;–aHµ“
ú-­E;‘
Ìl;3æ¸
¼ºü–M©;fW
B˜Ê%Ì#ó†Ž;
G¢^>i;I±
oG<eóì;K©P<i£ „
²2xF”(B;÷Nïj
ÞJ½u&„kUã;ø
ÞJ½u&„kUã;ƒ
Ñí7;G½
ÞJ½u&„kUã;È
ÞJ½u&„kUã;²
àgY§…øH");r®×\H
àgY§…øH");r®×\ƒ
àgY§…øH");r®×\É
àgY§…øH");r®×\M
ÞJ½u&„kUã;Î
àgY§…øH");r®×\Ï
ÞJ½u&„kUã;Ô
àgY§…øH");r®×\Õ
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
;W/èÀ]
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
float Total = 0;
for (int i = 0; i <= Radius; ++i)
    float Val = 1. - 1. * i/(Radius+1);
    Total += Val;
    KernelArray.SetArrayElem(false, i, .5*Val / Total);
ïF«øt);0
float Total = 0.0;
    Total += Coeff * exp(-1. * (1.*i/Radius) / (TwoSigmaSquared)); 
    float Val = Coeff * exp(-1. * (1.*i/Radius) / (TwoSigmaSquared)); 
    KernelArray.SetArrayElem(false, i, .5*Val/Total);
float BoxVal = 1./(2.0 * Radius + 1.0);
    KernelArray.SetArrayElem(false, i, BoxVal);
£;n4äEfC°í
S~ëe²ìºA—;>h­
±qœ©#N7Oª»;eß
àgY§…øH");r®×\
nå¢qÒqM‰;ð}tk
;W/èÀ]ú
åÃúÈS;D ˜
W`€dùŒ¡B³t´Ö;Äk|
Ú9;ÝD°‚y
;W/èÀ]$
;Ç8“éžO­Dì
;W/èÀ]Q
àH;÷*õI
„q;dÏDØJ‘` ˆ]Ë
;¦?ë@g‹C‰$
x;˜@ŽA’‡ž5&6
ÚT–{¢ŒðO¯®HZ;
ü´gqÔò™O’;
j£;Þj¯Fƒ¥4N^
‰H;–SãÐ
\¸AŠ;!™-ÂÛÁ
.‘3evýý@¯Ù;ù÷âbÛt
.‘3evýý@¯Ù;ù÷âbÛO
pwh;'v
pwh;'O
;*ÅÜ)yOY_P·C°º
q³7üuÕ;C–=
óLVâµc}I­¼;¶c
Z¾ÀQb•ªKª;aôÄ
äSºí=M9O <.†;m”2
ù~ôé<€;M¥
;5Hd6ö*F®¥êKóL
C¢ŠèG2ÝA«Áú;
äSºí=M9O <.†;m”+
ï°õy®ß;O¼•¡ãÎ÷ýõ
¶ôµO³;3YxÔ(‚
¾=À¤;0-F³
;aJ½zOÊ?Æ+ Í
;aJ½zOÊ?Æ+ L
I¦dvƒ;
¦;žwKóÆ
q$ó;â˜ÆO–
;aJ½zOÊ?Æ+ ä
Nº²;ñ"_†
à;»—X
ˆ½ð€C˜Œ’Ë;Ž×Ï
fh×ïùƒÊM£;©‡ì«Eñ
.S.; N‡Ð=ÿ¶Ì
;aJ½zOÊ?Æ+ 
çw;¹5¡
z;Oºkƒ^ýšèT
²«;ˆÔØ
œ`I\ÞïµB›[ñ5¶ƒœ¦;
¼ÊN€;+
A¦º ô€;­Z‹ŠEGÀåN²z
A¦º ô€;­Z
ƒ;L§A^%Ùü»
Hd;} #
4¾˜°b;ºƒém@‹›
°b;ºƒém@‹›
RÞõ;M¨
qÔõ;EžuCdÞ&5ÝÄ
qÔõ;EžuCdÞ&5Ý
†kûF‹¢¥¾V;·@k
†kûF‹¢¥¾V;·@
qÔõ;EžuCdÞ&5ÝÔ
qÔõ;EžuCdÞ&5Ýç
D¼••ì;
;¤‡!™oõC–
A“;ýÿ\·‚]ì
A“;ýÿ\·‚]œ
x«;BŽ¤’àñŠ`æ
N« ;zX‹
x;˜@ŽA’‡ž5&6C
[;¤øGw²A’¦K
ó]ø;¬˜•B‡
U_Ã{ÛNíFš*þœ;í¶u
³$„;M ÷¬
®ýDŸçLÂCÈPµ;
ŽƒºS˜zS)E¦sË;
M®/æç¤õ(•cµ|N„c"•“¡w;¶ÔÝ1
8¢¶;õD¼
ºS˜zS)E¦sË;
aéOp;M
ˆ;ø`>ÿ}H˜íÞ_
0†îœ5;
à;»—X.
à;»—XC
r}@½åéÆC^V>ÿ;
OT';ågËD¾
ÖöÊ5u;
<€ÝB[Ë;
Î>6K†;»¢D
x;˜@ŽA’‡ž5&6Y
;w0°µM©0r
;EØÕ4Cªp
cš‰ItH„¤;(·
0†;±LD¢WMPœMfU½Ò
0†;±LD¢WMPœMfU
ºz;ÌI·ÓÆ?¸WàE
ê€HµX;¬D¼Øg“ï{
'2ÀØ;·•Hˆi¿œ63#&
ê2ÊÉ_,nGºó©»f5;As
ê2ÊÉ_,nGºó©»f5;A
+M;yÕG³»e|·;¶õk
ž;E/¼E•
+M;yÕG³»e|·;¶õ
Ìi”k;Ù
ö6ƒj)š´O…†(ÆÇ;Úg|
ö6ƒj)š´O…†(ÆÇ;Úg
Šó;$„¨
œ;6ÖÞvEE¥
ˆ½ð€C˜Œ’Ë;Ž×
ˆ½ð€C˜Œ’Ë;Ž×ÏC
¯%ô„ürWEœ{ù½;ï
†½;SõF´
;ƒ$ýë¡
þ=ÍÊFèNO–¯#÷;è
Ð?¾¹¦ŽCŒ²·;+I
ªÐñËo ;I*js\òÒ@
ªÐñËo ;I*js\òÒ@
A“;ýÿ\·‚]™
x;˜@ŽA’‡ž5&6É
;© û(æåF
A¢;Qƒ¢f
A“;ýÿ\·‚]
x«;BŽ¤’àñŠ`æþ
x«;BŽ¤’àñŠ`æ6
«ëFû;ºÙK²ðà•‘…_
;ú/øXª
gÜI¸xŸ;†
­´C%ï&ÖJ•;
åkY—ÙJš;ÄbÕ
¸õ°DÆ;@˜¦>õ
UVÀ´A„+Š»¥z;§
¬;M"D0
.‘3evýý@¯Ù;ù÷âbÛ
å;Ë-§”
ôZ²A;E
 tÕ(¾MŸhNw+D‘$
 tÕ(¾MŸhNw+D‘
Kž\;—&
Kž\;—'
ºz;ÌI·ÓÆ?¸WàE'
ºz;ÌI·ÓÆ?¸WàE¹
'2ÀØ;·•Hˆi¿œ63#&'
'2ÀØ;·•Hˆi¿œ63#&¶
;ú/øX+
R±Tÿ; 
•E¥£ûH;…X
U_Ã{ÛNíFš*þœ;í¶u/
‘èàr;è-A§ÒÄ
fh×ïùƒÊM£;©‡ì«Eñ0
fh×ïùƒÊM£;©‡ì«Eñ4
Ãb]8…J’§¾ ;—„S
^Ûç¼?£YC¢µøºÏïM9;
x«;BŽ¤’àñŠ`æA
 tÕ(¾MŸhNw+D‘N
;ú/øXS
U_Ã{ÛNíFš*þœ;í¶uT
öeÞmœ1;J¼ßö
;ûîçåH
{P3ã},;c×
ä;—H¾eÞ
;*ÅÜ)yOY_P·C°ºŸ
¼fÃqërJ]‚É4æøo;5ùšé
Hdî•;„ìzªz±Ç
C;ñGŽ–K
äSºí=M9O <.†;m”­
ÿ LÏZ;çr
%°2‚¿;
Q;!ëô2Ø4CW{åkVÄ9¸Ý(
_\›=›):;lú<
;%žE®V¹ç\>­@²
‡dùïn;ÉG¦Þ=mú€D(Ê
‡dùïn;ÉG¦Þ=mú€D(²
‡dùïn;ÉG¦Þ=mú€D(±
dl7dJÊß@5’Ž;pgP
 i­¥ÚVH
à;ÜOŒúRF
;hš€L°œ(TX
lµ=nJˆNû;s”ãE
z€úE¦Sy;7=
º3~åè)tO®+;g"ñ
.B7qU5ûI¸†;qX
*BìÛì;
 y÷wºI¬ê{qöm“^
Áƒ*ž—ö¥€.;ÄÑ


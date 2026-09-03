^^V®];#
·)"ü;´5C
Ö!8¨Á;z÷‘ÿ
ò¡Ë;’∆
êHÇ;hÚY∫öG`íåvßF|¬q
¡Æ™;ªãÂd≥µí^Ÿ
n;0¡§é7ïÇ
©WdÆàrª∏Æ¶;T‘Ù»
*À{;LÍ°
7`;RØ:s÷(äQ©
;ÇµoÈ°_FªV}ÅX1>
eí⁄l±√&FEr7R;‚·èŒÌöÎt
wWçV6ì=x;´ó¸$Ì{%
ÃEUìê‹f∏´¯÷;
U∏ÆOQÇ;{˘#è;
4GrëK~Øs¢Grá2t`;
™;[˜µæéd
Rﬂ·€p∞î˚;y{áBHÎı≈rÛƒC
—‰ºYv¸â…&∫;î€
„Öaï∫¢∏K™ëU;ç√
3∑Ë;qLµ
}!Ï;¡H©V÷Ù¯8
Ä?≠–Ê;≠¸F9
Ä?ûz«=—¯+;
Ä?4RÊ=§èF;
Ä?Hÿ0>|uò;
D@>Ê¿•;
_>πW¿;
Ä?rán>#£Õ;
Ä?DÛ}>ìÓ⁄;
Ä?áØÜ>¸9Ë;
Ä?oeé>kÖı;
Ä?hÄ€>…;=<
;?g¬ﬂ=
-?%I2?n€6?∑m;?
“;>B•Xv¯}Úˆã—
“;>B•Xv¯}Úˆãd
ﬂ\ŸEû;˝¬
.;óÚ€ré®äe˛8
ôÎj_ïqÉNªgq;Ω>
J;˜|I+¢I∞ô°
É_%X¯VaÎ£;AO&,
!œ:Ñßy+xÑÍ;z
\)ê;˚ÔÜ‚3”Zo
Z|agO}ï3ävS¶hLs;ùˆ9
LLú/ë±M‘Ë;›
LLú/ë±M‘Ë;
≤ˇ£]Ï;l…X‡œG0
npOÄ£k;•åUÁø
Ë∆=KñÈ6»/ÌÙéK;
[m≤9NôÊ!D>;€ﬁ
N∞…"`ØAá;
;A±ÀŒ|aﬁ_^6
Ω$”;~Ò5í:´Öí◊
;¥WC<€˝É
≈"úÌ;äÉ€
K∫ßK¥ˇ‘47ö˙õå);¶E∑
˝˚Jºt;‚÷
;á≤¢–C¢û»(®M
˘<[lLØPs;Tb¶o
À‚})H¶¶ÖbÁ…;˝
Ÿ‚=©n¬7Iü•Î;Ô¡
ÖÎ7∂°;DCøU4Ôpã£8
¥FOÑ@;(Öfï
ÀÙnÓJ†;”
Fó\ã`Ò;WØ
w;º,Jë
.;@ëØ˙Oô»
XÚ;ÿO£[ Ÿ$^ëH-
XÚ;ÿO£[ Ÿ$^ëHÙ
;¢¶/âH™K≤
Mœ?rr;ƒKß≠Í∑
BåÄ-û;-m3M
N∞…"`ØAá;„
åZoùÖKàä;X¸"å®L
/PƒBç[õ7;Fp£7
/PƒBç[õ7;Fp£Ù
`^õÇsLôÆöDÛ’q›;
Æ¢•´ˇ;
XÚ;ÿO£[ Ÿ$^ëHE
/PƒBç[õ7;Fp£O
!’Ì)°ÅGÉ;¥
int Ignore;
int numCellsX;
int numCellsY;
LightingGrid.GetNumCells(numCellsX, numCellsY);
float length = (1.0 / (float)numCellsX)*6.0;
UnitCoordinates.xy = clamp(UnitCoordinates.xy,0.0,1.0);
float multipleScattering =  0.0;
LightGridDownsample.SampleGrid(UnitCoordinates.x,  UnitCoordinates.y,  0,  multipleScattering);
float ms1 = 0.0;
float ms2 = 0.0;
float ms3 = 0.0;
float ms4 = 0.0;
LightGridDownsample.SampleGrid(UnitCoordinates.x+length,  UnitCoordinates.y,  0,  ms1);
LightGridDownsample.SampleGrid(UnitCoordinates.x-length,  UnitCoordinates.y,  0,  ms2);
LightGridDownsample.SampleGrid(UnitCoordinates.x,  UnitCoordinates.y+length,  0,  ms3);
LightGridDownsample.SampleGrid(UnitCoordinates.x,  UnitCoordinates.y-length,  0,  ms4);
multipleScattering+=ms1+ms2+ms3+ms4;
multipleScattering/= 5.0;
int IndexX;
int IndexY;
LightingGrid.UnitToIndex(UnitCoordinates.xy, IndexX, IndexY);
LightingGrid.SetGridValue(IndexX, IndexY, 2, multipleScattering, Ignore);
float OutTransmission = 0.0;
float samples = Samples;
float length = RayLength / (float)numCellsX;
float transmittance = 1.0;
float neighborDensity = 0.0;
   float d =  0.0;
   DensityGrid.SampleGrid(UnitCoordinates.x,  UnitCoordinates.y,  2,  d);
   for (float i = 0.0; i < samples; i++){
       float2 directionalOffset = Direction.xy * length * (.01+i/samples);
       float2 coordinates = UnitCoordinates.xy + (directionalOffset) * i/samples;
       DensityGrid.SampleGrid(coordinates.x,  coordinates.y,  2,  neighborDensity);
       transmittance *= exp(-neighborDensity *(length/samples)  *ShadowDensity *RayLength) ;
   OutTransmission = clamp(transmittance ,0.0,100000.0);
   int IndexX;
   int IndexY;
   LightingGrid.UnitToIndex(UnitCoordinates.xy, IndexX, IndexY);
   LightingGrid.SetGridValue(IndexX, IndexY, LightingIndex, OutTransmission, Ignore);
V = dot(TmpVelocity, TmpVelocity) > dot(Velocity, Velocity) ? TmpVelocity : Velocity;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
int CellType = round(B_center);
IsBoundary = CellType == SOLID_CELL || CellType == EMPTY_CELL;
SV_x_right = 0;
SV_x_left = 0;
SV_y_up = 0;
SV_y_down = 0;
PressureGrid.GetGridValue(IndexX+1, IndexY, SolidVelocityIndex, SV_x_right);
PressureGrid.GetGridValue(IndexX-1, IndexY, SolidVelocityIndex, SV_x_left);
PressureGrid.GetGridValue(IndexX, IndexY+1, SolidVelocityIndex+1, SV_y_up);
PressureGrid.GetGridValue(IndexX, IndexY-1, SolidVelocityIndex+1, SV_y_down);
float CellSize = max(WorldGridExtents.x, WorldGridExtents.y) / NumCellsMaxAxis;
NumCellsX = floor(WorldGridExtents.x / CellSize);
NumCellsY = floor(WorldGridExtents.y / CellSize);
    NumCellsY++;
    NumCellsX++;
Out_WorldGridExtents = float2(NumCellsX, NumCellsY) * CellSize;
WorldGridExtents = MaxAxisWorldExtents;
    WorldGridExtents.x = MaxAxisWorldExtents;
    WorldGridExtents.y = MaxAxisWorldExtents * float(1. * ResY / ResX);
    WorldGridExtents.y = MaxAxisWorldExtents;
    WorldGridExtents.x = MaxAxisWorldExtents * float(1. * ResX / ResY);
Output = Velocity * (Boundary < 1e-5);
m/©;c@ò
Output = Density * (Boundary < 1e-5);
SimGrid_VelocityX = 0;
SimGrid_VelocityY = 0;
SimGrid_Density = 0;
float2 idxF = float2(IndexX, IndexY);
float2 cen = float2(64, 64);
float rad = 20;
 SimGrid_Density = 1;
M;L√Hå´A¢Ñû"V¥-x
êŸ]Ê¥HzI¶ä;ç
VC_Force = float2(0,0);
float grad_curl_length = length(grad_curl);
  VC_Force = vorticity * dx * grad_curl / grad_curl_length;
ÂÍò˘ºR Gµ©;
k‰¸!•;Mõ1«^ïΩC
Hì7-ë;ﬂ
¥ã;H´?Çê2¶§˜x
¥ã;H´?Çê2¶§˜·
÷ÍPg;/)Dûg
;^’OÇfÁÓçw+r
£;n4‰EfC∞Ì
W`Äd˘å°B≥t¥÷;ƒk|
â%ΩmîkØAîIä;@|D≠è
â%ΩmîkØAîIä;@|D≠
ÁrÔª’WO¥_ÇŒ¸W;
¶o$Dó8?"&;e
;≠éO™ødOÜÁ
;3ÜKê/ª[lÖjò
;3ÜKê/ª[lÖj
 V™¥Ä≥jOò
∆;|óºL¨î¢†∞%µ?°
∆;|óºL¨î¢†∞%µ?‡
;äB%ΩáUD±
∆;|óºL¨î¢†∞%µ?
Ë"t;Cü
≤‰≤Tè8;E∫ùT&êó){
"$ƒÏkUXIóäÛ;o∫Àƒ
J±„}SÁ;ﬁÎ
T]G`—⁄;Fèe•ˆœŒÍ‹
Îz6Îí‰;
™;ïu£¥(EëÛ˜áù
g`ä;ÅKπ
åZoùÖKàä;X¸"å®√
Pª÷;ıãıMè
\ò¿Mã·xºg;ˆ¶v
G°‰Ì';
Gæ≤]Ú;ÏÁ.Õ
Gæ≤]Ú;ÏÁ.ô
ÕÕÌÿN í‚—m„Ü Ã˘;„
=≥È˘≠;úF¶˘Ñ˛
;ÒJåBB
;F••¯pa∆+
∆√œŒNæ&;ΩH#˘u„
˘<[lLØPs;Tb¶o?
À‚})H¶¶ÖbÁ…;˝@
;Ké˚å5ôAö
¸¥gq‘ÚôOí;
y¬ƒ;√¿
'¨BÅ:;¯
ËM” ?∫∞JÖLË7§;(∂
Fó\ã`Ò;WØ‚
Fó\ã`Ò;WØÙ
  z·8Cµ∑
ª˚\∫;∑ﬂB°àÈ…Àr
˙nzú;%
∆;|óºL¨î¢†∞%µ?,
≠ÛÂµLA;
%ÀJ¢º∑óÒˇ7â;
Gæ≤]Ú;ÏÁ.G
Fó\ã`Ò;WØ\
∆;|óºL¨î¢†∞%µ?|
;˘-∞iC®Vœ‰ëI
e´äõ6Ô‹EÇFVØÊ;’\
àÁŸ…;ÈD≥
*M† `;
M†báêå;†8â
M†báêå;†8u
[ê;$ÿÙ¡GèkÄuÙûÑm
i—|R;@õ…ÈΩ$Ù=(è
i—|R;@õ…ÈΩ$Ù=(Ù
·[]I•©ı;¯ﬂJ^í
·[]I•©ı;¯ﬂJ^Ù
Ω(∑häAµ;ÜµNÓ‚¸î
Ω(∑häAµ;ÜµNÓ‚¸Ô
DªÉ`;!»(à
;p∞˝Ô∆ 
UÂ.IÇ!;€qã≈÷
i—|R;@õ…ÈΩ$Ù=(©
ÿ[–wWØ´KÇ≤“;¢
0∑L;ìE∑
·[]I•©ı;¯ﬂJ^Æ
Ω(∑häAµ;ÜµNÓ‚¸Ø
∂ÙµO≥;3Yx‘(Ç
Oæv8;fnz†
Oá-Òº;?ì≤Ê
Oá-Òº;?ì≤
I≠;GñmOº|:•gÁ
I≠;GñmOº|:•g
;&Ω5˙Î
;&Ω5˙
;µCHÛ;
·cT˜11 Gì#ÃCw;©W
˝Å+;>D»KëîÂ
∞À;ºO∑
ïô—j•;E´°Úa÷$Ω>
‹;îÄNºs:
HãÜ;D”&îG
Näøû—;ù≈Ô
Näøû—;ù≈Ô
;ñJªãGâ›K°,ïîX
v;P@Äﬁ√
O≠ø¯˙;
˙ﬂ8áFÚ^JÖ=û;@
5?fXPEΩ~;
júXêL±•=;
ÏfVÉÛ˘;L¨pqÓ\∞ﬁ
lâOö;™Ù(§+∫
w\ Kâ⁄"ü;Eß˛
Oá-Òº;?ì≤_
I≠;GñmOº|:•g`
;&Ω5˙d
Näøû—;ù≈ÔÅ
∞bI≤ ;jMìsπO
G∂;PÅûË©
jK´É˚VL;’⁄…
jK´É˚VL;’⁄=
õ∏ä;ΩNhLì„OY˘
jK´É˚VL;’⁄ 
~æ£O;ˆ∑B∞ÿqvK≤âm
çô;<zŒ@É"ô:Ç¡y{
◊œ-%ïlTE∏;}
≤≥º];EÌ@≤fÇ
jK´É˚VL;’⁄·
jK´É˚VL;’⁄‚
;ô^Ã[ÅC¨à¿6
9,ÁÀ¿IIKßÍ;ˇ
;®√„¡Bî∂(ﬂ…
E®;fVynÔ∫
–œÌ(;8fGô!vk\>
npOÄ£k;•åUÁ°
î¨•±{Ü@@úÀ˛N;¶
q‘ı;EûuCdﬁ&5
q‘ı;EûuCdﬁ&5›
ø@ô-‘…˙C™;DŒJQ
÷K´;pü0
SÍ;A®t
å®;®HÛ¸GáìW-c
'QD¥m;,°
¸â{éòEæ°Éæ{;yLƒ
¸â{éòEæ°Éæ{;yL
óÖ–;å1gBú
q‘ı;EûuCdﬁ&5›—
Oá-Òº;?ì≤
 Jí‰˚‡i¥ïr
⁄>ùJ!∂;IÅ
I≠;GñmOº|:•g
˝cñL;g°^b'
°Ehñ;q°
°Ehñ;q
˝2˚ëüúÜ@âÇÏE˘⁄&;ƒ/ãp:!^A©˘®
l@ùÙ;Ä
°™O±ñ9ö;Œ
˝2˚ëüúÜ@âÇÏE˘⁄&;
ZLı;~¯Ó
ZLı;~¯
·cT˜11 Gì#ÃCw;©WÒ
·cT˜11 Gì#ÃCw;©W‡
êÙX;‹–#N¶
ŸÚ≈Ï}sz;´
Lïs‚«œ%/;
Ï}sz;´
;ñJªãGâ›K°,ïîX‡
p5%Iü;´êOöÕ2
˙ﬁ]¢;;Oã¬Áº
y;iDÉ12
Î˙"ñ∂û#B∏-r#;5≤‡
oﬂ˙ëgÚÈG£Ëa;
Â;ÔuJ¢ˇ
NèÎ<#i∑;±
jTjj⁄0¸I¥;[Ñ/˙&„
ÁFû8È\ê“,[;[
L;A£Eü»mV°k
…;ÄMã3v&Ê'
m;4S:Hßöu≠
 FD±¡Oπ∂
’N™˛'WØ';Ã
àÜU!;Ç"O∏m∫yÅ
è?˚;Dù°
è?˚;Dù
q{¢|œÙ;Iè|ä
 Vmu’]¸C¶ﬂ=«7‡?˝
zÎ8(ƒ1ØB¶‰;<n‡÷
q;x¬jÀGC†D?¿
Ç;·@åAï>?dûÚ
¯Nc5 ;
-LØ…;Ó¡a
ÖÎ7∂°;DCøU4Ôpã£8A
ÖÎ7∂°;DCøU4Ôpã£8‡
©;Øõ|{)A°b)ìÈ=≥HB
©;Øõ|{)A°b)ìÈ=≥H
ˆ˚#EçNØ€;–
p√Op◊;[Iöä
Ì[y6LòÓDÆä¡;lÊd"G
Ì[y6LòÓDÆä¡;lÊd"Ù
“;>u\±J£›“
å¸…ıH;áHå
@6á|èh’Kö≠D!O¢†f{“Í…Rƒ8Fó‡'†N;º
{“Í…Rƒ8Fó‡'†N;º◊
Úz;ë ≤F´PÀ≈:~4ë°
åÚz;ë ≤F´PÀ≈:~4ë
Än;∆PnõN¨#l5.¢áëU
Än;∆PnõN¨#l5.¢áë
Y;€XW€'Kõj©fM%~≥V
Y;€XW€'Kõj©fM%~≥
BJ∑'-k;//ª
∑ÏÄE´;fØ”⁄_
yò@©º;å0
∑ÏÄE´;fØ”⁄_Ÿ
vCûÏÂê]?Å†lxﬁ”;
¡†æ®∞A;N£
;0¨†Gµ
I¢8;§y‹D∂
lâOö;™Ù(§+∫j
lâOö;™Ù(§+∫‡
èG¶v??;
ø@Õ;˝7L©≥ııg‘tô
M¨;BßBv,=
=BûVFè[:;°u
i;®Û¨O
=BûVFè[:;°
n˝∑:c¿”Nû“∆—;^TÖy
n˝∑:c¿”Nû“∆—;^TÖ®
'dM©’fï;Å9Ÿ|
'dM©’fï;Å9ŸË
Tèﬁ;Iä
9∏y¸8ÛLÅ`Ì;©ÎB
∂F≤gj;ãvòq
˛ΩOïãÕÃˆ‚;“
<G;•Îˆ
ŸF//îı°
ŸF//îı
ÌÏñJñ‹.M´;úÓs
ó;è(Œ⁄GÑ
Êb`Ö?6ÑHí;X/
„;\UÁwœFπ
;Hà˛ËÒ
Fì∂≠X∂û;±°
J±„}SÁ;ﬁÎ¶
J±„}SÁ;ﬁÎ‡
Fì∂≠X∂û;±
 _à6r°
?˚Æ¥ø;DB§Ê-¯Ú/cÁaÒàÙ&ù|KΩÓöCÏ
?˚Æ¥ø;DB§Ê-¯Ú/cÁ
o–8;ÈiæO®§Eü∑ø
Î;“,~n¿jO´Í|¬
;“,~n¿jO´Í|¬
p=Î;Mã*ïã
_;ãîDM∑≥ù-e
§©NÆ;OJ
Rm&;@µ,Õp€Ljê
-2;.«»
–QiynIhEëX;
;HßñÆ/L7Îiª
;HßñÆ/L7Îi
põ;/ H}IîòrL
"$ƒÏkUXIóäÛ;o∫Àƒ√
"$ƒÏkUXIóäÛ;o∫Àƒ‡
â;Lûn≤º+6.!
v‰êPÑÑPGñ;‹c4ÚT“
#Üs;‡¯
ü√l£NÏ›MÖjÏˇ;¨
™9*–QÙLå≠Rµ+_k‚;
¡⁄;*QÛíKì˚
îO6Cõ;1^
≥ãŒV;`3eNÇ
ãŒV;`3eNÇ
ßh2ƒ6;+ù„ADæY
Ä%;Wfi‚H¢l
ƒ6;+ù„ADæY
¸â{éòEæ°Éæ{;yL‡
q‘ı;EûuCdﬁ&5›Û
ZLı;~¯%
·cT˜11 Gì#ÃCw;©W(
;ñJªãGâ›K°,ïîX;
NèÎ<#i∑;±J
ÖÎ7∂°;DCøU4Ôpã£8x
©;Øõ|{)A°b)ìÈ=≥Hy
Ì[y6LòÓDÆä¡;lÊd"~
Än;∆PnõN¨#l5.¢áëå
Y;€XW€'Kõj©fM%~≥ç
lâOö;™Ù(§+∫°
n˝∑:c¿”Nû“∆—;^TÖ∞
'dM©’fï;Å9
J±„}SÁ;ﬁÎ›
;HßñÆ/L7ÎiÚ
"$ƒÏkUXIóäÛ;o∫Àƒ˙
˙Ωê≤N≠;»‘¸LØîz
Nalñ;sãmI◊«xLÇÊÿ
˙Ωê≤N≠;»‘¸LØî
;^’OÇfÁÓçw+r(
;^’OÇfÁÓçw+rG
Q/*<±åwKìB;…ˆ0Zá
f;:ú|äF≤
 YS"ísÇO∞˛@YV…A+
Dô«;ı+0/>
0ÖûÊ;S{Aâí1QJ
WKé∏u;÷Q“"8
WKé∏u;÷Q“"
‡FcL™Ebf˙†A©;
ÕF´∏•;‰aÚ∞
··Nª;2MÆ¥ù
äGÉ¯æ ;yˇ]
¨;EHª≥ì·a!
æU∞BÌ1YGâ;≠N8-
ÍJõP≠;•Bñ÷9(π]-¡M
ÍJõP≠;•Bñ÷9(π]-¡
mß;J\H$D†˙%åÚtF
≥pπ;ÏV
;{oûLª«A¶å
GM7˜›ÃvF∑;øO˜ïÉÏ
 Vmu’]¸C¶ﬂ=«7‡?˝[
 Vmu’]¸C¶ﬂ=«7‡?˝ò
 BØ˘ÜˆIå7JW]Fiù
8;ÏéEø"Y<
IïòŒkñÅD£>Óg$D];
Á°;·◊ﬁHK∂6
|ÓΩ‰;d
|ÓΩ‰;¬
˛nO‘D©r≤‡k6o;
/PƒBç[õ7;Fp£
Î˙"ñ∂û#B∏-r#;5≤‡h
Î˙"ñ∂û#B∏-r#;5≤‡ 
w\ Kâ⁄"ü;Eß˛m
w\ Kâ⁄"ü;Eß˛®
˙ˆ”@Ω;∂lI,;U
Gänf*≥¯FôÖ;L
5¸òC];H©
o?™;ªªs
o?™;ªª
Rm&;@µ,Õp€Ljêx
Rm&;@µ,Õp€LjêÖ
•1{ÈDµ’h=+˜;ö
Ôâ^öŸr;AüÊ“rÕO
XÚ;ÿO£[ Ÿ$^ëH
ø@Õ;˝7L©≥ııg‘tôÄ
ø@Õ;˝7L©≥ııg‘tôŒ
n˝∑:c¿”Nû“∆—;^TÖ
'dM©’fï;Å9Ÿ
π,;XU∑µL¨DTÿ6¶·
 frëD<€D¨Òy*·{K
Ì[y6LòÓDÆä¡;lÊd"
jTjj⁄0¸I¥;[Ñ/˙&„ä
jTjj⁄0¸I¥;[Ñ/˙&„?
∂F≤gj;ãvòqä
∂F≤gj;ãvòqA
BFiÛ;K≤Fô!
UŸOò$K`;LÂ6é
UŸOò$K`;LÂ6
˛ΩOïãÕÃˆ‚;
;ÄnL#„⁄I∂
N88w∆UB≤™^Ω´Œ;
w˘M; }˝Oï$
üE;*óú
üE;*ó`
&D∞BÈx≥;Ë‹
BJ∑'-k;//ªû
BJ∑'-k;//ªå
WKé∏u;÷Q“"§
;^’OÇfÁÓçw+rß
ÍJõP≠;•Bñ÷9(π]-¡ 
≥pπ;Ï”
 Vmu’]¸C¶ﬂ=«7‡?˝ÿ
|ÓΩ‰;·
Î˙"ñ∂û#B∏-r#;5≤‡Â
w\ Kâ⁄"ü;Eß˛Í
o?™;ªª
Rm&;@µ,Õp€Ljêı
ø@Õ;˝7L©≥ııg‘tô˝
;^’OÇfÁÓçw+r!
¿,;‡ìe√Fõ
·[]I•©ı;¯ﬂJ^
å5ò≤L°ïπ˜o≠;
[ê;$ÿÙ¡GèkÄuÙûÑm.
[ê;$ÿÙ¡GèkÄuÙûÑmf
¬;Hò™]B7≈xc
M†báêå;†8
i—|R;@õ…ÈΩ$Ù=(
ÈBôC7¿˙b…;
  ;nmC\EÉô{ß`%Ñû
•àé&;OƒG•¸˙°jE[Õ
˝wŸ’¬;
jìuÊ';
[ê;$ÿÙ¡GèkÄuÙûÑm=
ç∏®-;ë
Bà;r‚=µç¶‰
<õ;vHMUË–N™
// Shader generated by Niagara HLSL Translator
// SimStage[0] = ParticleSpawnUpdate
// SimStage[1] = Init
// SimStage[2] = Rasterize NDC Source Particles
// SimStage[3] = Rasterize Source Particles
// SimStage[4] = Pre Sim
// SimStage[5] = Advect Velocity
// SimStage[6] = Compute Divergence
// SimStage[7] = Solve Pressure
// SimStage[8] = Solve Pressure (  Sin FFT in Y)
// SimStage[9] = Solve Pressure ( Sin FFT in X )
// SimStage[10] = Solve Pressure (Inv Sin FFT in X)
// SimStage[11] = Solve Pressure (Inv Sin FFT in Y)
// SimStage[12] = Project Pressure
// SimStage[13] = Advect Scalars and Post Sim
// SimStage[14] = LightingPrePass
// SimStage[15] = ComputeLighting
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
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_WorldToUnit;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_UnitToWorld;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_LocalToWorldRotation;
float3 Emitter_fluids_lighting_environmentDirection;
float Emitter_ShadowDensityMult;
float3 Emitter_fluids_lighting_sunDirection;
float Emitter_fluids_solver_dissipationTemperature;
float3 Emitter_g;
float Emitter_fluids_solver_dissipationDensity;
float2 Emitter_SimGrid_Velocity;
int Emitter_SimGrid_TemperatureIndex;
int Emitter_SimGrid_DensityIndex;
float Emitter_SimGrid_Density;
float Emitter_SimGrid_Temperature;
float Emitter_SimGrid_Boundary;
float Emitter_dt;
float Emitter_dx;
float Emitter_SourceCore;
float Emitter_SourceDensityMult;
float Emitter_SourceFalloff;
int Emitter_SourceMaxStreakSamples;
float Emitter_RadiusScale;
float Emitter_SourceStreakDensity;
float Emitter_SourceTemperatureMult;
float Emitter_SourceVelocityMult;
bool Emitter_SourceIsLocalSpace;
int Emitter_SimGrid_SimFloatIndex;
float Emitter_fluids_solver_vorticityConfinement;
float Emitter_fluids_solver_densityBouyancy;
float Emitter_fluids_solver_temperatureBouyancy;
int Emitter_SimGrid_VelocityIndex;
float Emitter_fluids_solver_velocityDissipation;
float Emitter_fluids_solver_pressureRelaxation;
int Emitter_PressureGrid_PressureIndex;
float dx;
float2 GradCurl;
float VorticityMult;
float Boundary;
float Divergence;
float2 PhysicsForce;
float3 PhysicsForceWorld;
float TmpDensity;
float TmpTemperature;
float2 TmpVelocity;
float Pressure;
FParamMap0_SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_PressureGrid PressureGrid;
FParamMap0_SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter Emitter;
float SimFloat;
FParamMap0_SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_TemporaryGrid TemporaryGrid;
FParamMap0_SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter Emitter;
FParamMap0_SetVariables_CE3F24D742499C1EFA32EB978D87038A_Transient Transient;
float2 Velocity;
FParamMap0_SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter Emitter;
FParamMap0_SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter Emitter;
FParamMap0_SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter Emitter;
float Density;
float Temperature;
FParamMap0_SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter Emitter;
FParamMap0_SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Transient Transient;
FParamMap0_SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter Emitter;
FParamMap0_SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter Emitter;
float Div;
float dt;
float Value;
float2 PressureGradient;
int UniqueID;
float2 NewVelocity;
float3 Lighting;
float2 Grad;
float Curl;
float AdvectedScalar;
float2 DissipatedVector2D;
float DissipatedFloat;
FParamMap0_OUTPUT_VAR_ComputeBoundaryGrid2D ComputeBoundaryGrid2D;
FParamMap0_OUTPUT_VAR_DissipateFloat DissipateFloat;
FParamMap0_OUTPUT_VAR_DissipateFloat001 DissipateFloat001;
FParamMap0_OUTPUT_VAR_DissipateVector2D DissipateVector2D;
FParamMap0_OUTPUT_VAR_Grid2D_AdvectScalar Grid2D_AdvectScalar;
FParamMap0_OUTPUT_VAR_Grid2D_AdvectScalar001 Grid2D_AdvectScalar001;
FParamMap0_OUTPUT_VAR_Grid2D_AdvectScalar002 Grid2D_AdvectScalar002;
FParamMap0_OUTPUT_VAR_Grid2D_AdvectScalar003 Grid2D_AdvectScalar003;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeCurl Grid2D_ComputeCurl;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeDivergence Grid2D_ComputeDivergence;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeGradient Grid2D_ComputeGradient;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeGradient001 Grid2D_ComputeGradient001;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeLighting Grid2D_ComputeLighting;
FParamMap0_OUTPUT_VAR_Grid2D_IntegrateForces Grid2D_IntegrateForces;
FParamMap0_OUTPUT_VAR_Grid2D_PressureIteration Grid2D_PressureIteration;
FParamMap0_OUTPUT_VAR_ProjectPressureGrid2D ProjectPressureGrid2D;
FParamMap0_OUTPUT_VAR_ScratchModule001 ScratchModule001;
float B;
float FloatValue;
int Channel;
float3 VECTOR_VAR;
float density;
FParamMap0_Local_ProjectPressureGrid2D ProjectPressureGrid2D;
float4x4 UnitToWorld;
float4x4 WorldToLocal;
float Relaxation;
float Blue;
bool Enabled;
float Green;
float Red;
float Core;
float DensityMult;
float Falloff;
int MaxStreakSamples;
float RadiusScale;
float StreakDensity;
float TemperatureMult;
bool UseColor;
bool UseStreaking;
float VelocityMult;
float4x4 WorldToUnit;
bool SourceIsLocalSpace;
float DensityBuoyancy;
float3 g;
float TemperatureBuoyancy;
int HighResolutionAttribute;
int DensityIndex;
float3 EnvironmentDirection;
float ShadowStrengthEnvironment;
float ShadowStrengthSun;
float3 SunDirection;
int ScalarIndex;
bool bPoissonSolver;
bool Inverse;
bool XDirecton;
int VectorIndex;
int InterpolationMethod;
int VelocityIndex;
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
float3 Position;
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
float3 Velocity;
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
float4x4 LocalToWorldRotation;
float3 fluids_lighting_environmentDirection;
float3 fluids_lighting_sunDirection;
float fluids_solver_densityBouyancy;
float fluids_solver_dissipationDensity;
float fluids_solver_dissipationTemperature;
float fluids_solver_pressureRelaxation;
float fluids_solver_temperatureBouyancy;
float fluids_solver_velocityDissipation;
float fluids_solver_vorticityConfinement;
FParamMap0_Emitter_Grid2D_CreateUnitToWorldTransform Grid2D_CreateUnitToWorldTransform;
FParamMap0_Emitter_PressureGrid PressureGrid;
int PressureGrid_PressureIndex;
float ShadowDensityMult;
FParamMap0_Emitter_SimGrid SimGrid;
int SimGrid_DensityIndex;
int SimGrid_SimFloatIndex;
int SimGrid_TemperatureIndex;
int SimGrid_VelocityIndex;
float SourceCore;
float SourceDensityMult;
float SourceFalloff;
int SourceMaxStreakSamples;
float SourceStreakDensity;
float SourceTemperatureMult;
float SourceVelocityMult;
FParamMap0_Emitter_TemporaryGrid TemporaryGrid;
float DissipationRate;
float2 VectorValue;
bool OpenBoundaryDown;
bool OpenBoundaryLeft;
bool OpenBoundaryRight;
bool OpenBoundaryUp;
float X;
float Y;
int A;
FParamMap0_Add_Integer001 Add_Integer001;
FParamMap0_Array Array;
FParamMap0_BreakVector2D BreakVector2D;
FParamMap0_ComputeBoundaryGrid2D ComputeBoundaryGrid2D;
FParamMap0_DissipateFloat DissipateFloat;
FParamMap0_DissipateFloat001 DissipateFloat001;
FParamMap0_DissipateVector2D DissipateVector2D;
FParamMap0_Emitter Emitter;
FParamMap0_Engine Engine;
FParamMap0_Grid2D_AdvectScalar Grid2D_AdvectScalar;
FParamMap0_Grid2D_AdvectScalar001 Grid2D_AdvectScalar001;
FParamMap0_Grid2D_AdvectScalar002 Grid2D_AdvectScalar002;
FParamMap0_Grid2D_AdvectScalar003 Grid2D_AdvectScalar003;
FParamMap0_Grid2D_ComputeCurl Grid2D_ComputeCurl;
FParamMap0_Grid2D_ComputeDivergence Grid2D_ComputeDivergence;
FParamMap0_Grid2D_ComputeFFT Grid2D_ComputeFFT;
FParamMap0_Grid2D_ComputeFFT001 Grid2D_ComputeFFT001;
FParamMap0_Grid2D_ComputeFFT002 Grid2D_ComputeFFT002;
FParamMap0_Grid2D_ComputeFFT003 Grid2D_ComputeFFT003;
FParamMap0_Grid2D_ComputeGradient Grid2D_ComputeGradient;
FParamMap0_Grid2D_ComputeGradient001 Grid2D_ComputeGradient001;
FParamMap0_Grid2D_ComputeLighting Grid2D_ComputeLighting;
FParamMap0_Grid2D_DownsampleScalar Grid2D_DownsampleScalar;
FParamMap0_Grid2D_Gas_3DBuoyancy Grid2D_Gas_3DBuoyancy;
FParamMap0_Grid2D_Gas_ParticleScatterSource Grid2D_Gas_ParticleScatterSource;
FParamMap0_Grid2D_Gas_ParticleScatterSource001 Grid2D_Gas_ParticleScatterSource001;
FParamMap0_Grid2D_Gas_SetRTValues Grid2D_Gas_SetRTValues;
FParamMap0_Grid2D_Gas_SetRTValues001 Grid2D_Gas_SetRTValues001;
FParamMap0_Grid2D_IntegrateForces Grid2D_IntegrateForces;
FParamMap0_Grid2D_PressureIteration Grid2D_PressureIteration;
FParamMap0_Grid2D_TurbulenceForce Grid2D_TurbulenceForce;
FParamMap0_Grid2D_WindForce Grid2D_WindForce;
FParamMap0_Local Local;
FParamMap0_MakeFloatFromVector MakeFloatFromVector;
FParamMap0_MakeFloatFromVector001 MakeFloatFromVector001;
FParamMap0_MakeFloatFromVector002 MakeFloatFromVector002;
FParamMap0_MaskFloatByBoundary MaskFloatByBoundary;
FParamMap0_MaskFloatByBoundary001 MaskFloatByBoundary001;
FParamMap0_Multiply_Float001 Multiply_Float001;
FParamMap0_Multiply_Float008 Multiply_Float008;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_Particles Particles;
FParamMap0_ProjectPressureGrid2D ProjectPressureGrid2D;
FParamMap0_ScratchModule_02001 ScratchModule_02001;
FParamMap0_ScratchModule_04 ScratchModule_04;
FParamMap0_ScratchModule_06 ScratchModule_06;
FParamMap0_SetVariables_196F739F414428A690D86C8CECB0FE2B SetVariables_196F739F414428A690D86C8CECB0FE2B;
FParamMap0_SetVariables_47EB198B4D26ACB745967FA215BE495B SetVariables_47EB198B4D26ACB745967FA215BE495B;
FParamMap0_SetVariables_49366F1C4BCFBA536A86108A2DBB4F43 SetVariables_49366F1C4BCFBA536A86108A2DBB4F43;
FParamMap0_SetVariables_612FD801416D76B392FD168A3D29BE00 SetVariables_612FD801416D76B392FD168A3D29BE00;
FParamMap0_SetVariables_9A5606CD480032B7102900A8757C50F2 SetVariables_9A5606CD480032B7102900A8757C50F2;
FParamMap0_SetVariables_9E282C7845E37D6B386476BE13A71330 SetVariables_9E282C7845E37D6B386476BE13A71330;
FParamMap0_SetVariables_C54322844BB05B548FF0B8B0DC931DEE SetVariables_C54322844BB05B548FF0B8B0DC931DEE;
FParamMap0_SetVariables_CE3F24D742499C1EFA32EB978D87038A SetVariables_CE3F24D742499C1EFA32EB978D87038A;
FParamMap0_SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118 SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118;
FParamMap0_SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91 SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91;
FParamMap0_Transient Transient;
FParamMap0_VorticityConfinementForceGrid2D VorticityConfinementForceGrid2D;
#if ((SimulationStageIndex == 0)) // MapSpawn
FParamMap0 MapSpawn;
#endif // MapSpawn
#if ((SimulationStageIndex == 0)) // MapUpdate
FParamMap0 MapUpdate;
#endif // MapUpdate
#if ((SimulationStageIndex == 1)) // MapSimStage1_Init
FParamMap0 MapSimStage1_Init;
#endif // MapSimStage1_Init
#if ((SimulationStageIndex == 2)) // MapSimStage2_RasterizeNDCSourceParticles
FParamMap0 MapSimStage2_RasterizeNDCSourceParticles;
#endif // MapSimStage2_RasterizeNDCSourceParticles
#if ((SimulationStageIndex == 3)) // MapSimStage3_RasterizeSourceParticles
FParamMap0 MapSimStage3_RasterizeSourceParticles;
#endif // MapSimStage3_RasterizeSourceParticles
#if ((SimulationStageIndex == 4)) // MapSimStage4_PreSim
FParamMap0 MapSimStage4_PreSim;
#endif // MapSimStage4_PreSim
#if ((SimulationStageIndex == 5)) // MapSimStage5_AdvectVelocity
FParamMap0 MapSimStage5_AdvectVelocity;
#endif // MapSimStage5_AdvectVelocity
#if ((SimulationStageIndex == 6)) // MapSimStage6_ComputeDivergence
FParamMap0 MapSimStage6_ComputeDivergence;
#endif // MapSimStage6_ComputeDivergence
#if ((SimulationStageIndex == 7)) // MapSimStage7_SolvePressure
FParamMap0 MapSimStage7_SolvePressure;
#endif // MapSimStage7_SolvePressure
#if ((SimulationStageIndex == 8)) // MapSimStage8_SolvePressureASC40SinFFTinYASC41
FParamMap0 MapSimStage8_SolvePressureASC40SinFFTinYASC41;
#endif // MapSimStage8_SolvePressureASC40SinFFTinYASC41
#if ((SimulationStageIndex == 9)) // MapSimStage9_SolvePressureASC40SinFFTinXASC41
FParamMap0 MapSimStage9_SolvePressureASC40SinFFTinXASC41;
#endif // MapSimStage9_SolvePressureASC40SinFFTinXASC41
#if ((SimulationStageIndex == 10)) // MapSimStage10_SolvePressureASC40InvSinFFTinXASC41
FParamMap0 MapSimStage10_SolvePressureASC40InvSinFFTinXASC41;
#endif // MapSimStage10_SolvePressureASC40InvSinFFTinXASC41
#if ((SimulationStageIndex == 11)) // MapSimStage11_SolvePressureASC40InvSinFFTinYASC41
FParamMap0 MapSimStage11_SolvePressureASC40InvSinFFTinYASC41;
#endif // MapSimStage11_SolvePressureASC40InvSinFFTinYASC41
#if ((SimulationStageIndex == 12)) // MapSimStage12_ProjectPressure
FParamMap0 MapSimStage12_ProjectPressure;
#endif // MapSimStage12_ProjectPressure
#if ((SimulationStageIndex == 13)) // MapSimStage13_AdvectScalarsandPostSim
FParamMap0 MapSimStage13_AdvectScalarsandPostSim;
#endif // MapSimStage13_AdvectScalarsandPostSim
#if ((SimulationStageIndex == 14)) // MapSimStage14_LightingPrePass
FParamMap0 MapSimStage14_LightingPrePass;
#endif // MapSimStage14_LightingPrePass
#if ((SimulationStageIndex == 15)) // MapSimStage15_ComputeLighting
FParamMap0 MapSimStage15_ComputeLighting;
#endif // MapSimStage15_ComputeLighting
static float HackSpawnInterp = 1.0;
void SetVariables_81ACE1264B908D5B723D16B4EF93249D_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGrid(out int Out_IndexX, out int Out_IndexY);
void GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(int In_IndexX, int In_IndexY, out float2 Out_Value);
void GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(int In_IndexX, int In_IndexY, out float Out_Value);
void SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(int In_IndexX, int In_IndexY, float In_Value);
void SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, float2 In_Value);
void SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(int In_IndexX, int In_IndexY, float In_Value);
void SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(int In_IndexX, int In_IndexY, float In_Value);
void Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColor(int In_Index, out bool Out_Success, out float3 Out_Position, out float3 Out_Velocity, out float Out_Radius, out float Out_PreviousRadius, out float Out_Density, out float Out_Temperature, out float Out_Divergence, out float4 Out_Color);
void UnitToFloatIndex_Emitter_SourceGrid(float2 In_Unit, out float2 Out_Index);
void GetNumCells_Emitter_SourceGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeDensity(int In_IndexX, int In_IndexY, float In_Value);
void SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeTemperature(int In_IndexX, int In_IndexY, float In_Value);
void SetVector2DValue_Emitter_SourceGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, float2 In_Value);
void SetVector4Value_Emitter_SourceGrid_UEImpureCall_AttributeColor(int In_IndexX, int In_IndexY, float4 In_Value);
void CustomHlsl972BF63F281C7B34A20B3801B8A6C9D4C83ABC06Emitter_SourceGrid_Func_(float2 In_ParticleCenterFloatIndex, float3 In_ParticlePos, float3 In_ParticleVel, float In_ParticleDensity, float In_ParticleTemperature, float In_Radius, float4 In_ParticleColor, int In_ParticleRadiusIndex, float In_VelocityMult, float In_DensityMult, float In_TemperatureMult, float In_Falloff, float In_Core, float In_RadiusScale, int In_NumCellsX, int In_NumCellsY, float In_dx, int In_MaxStreakSamples, float In_StreakDensity, bool In_UseStreaking, float In_dt, float4x4 In_WorldToLocal, bool In_UseColor, inout FSimulationContext Context);
void Grid2D_Gas_ParticleScatterSource001_Emitter_Func_(inout FSimulationContext Context);
void GetPositionByIndex_Emitter_ParticleSource_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void TransformBase_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocity(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_density(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperature(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radius(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void Grid2D_Gas_ParticleScatterSource_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_SimGrid(out float2 Out_Unit);
void UnitToSimulation_Emitter_SimGrid(float3 In_Unit, float4x4 In_UnitToSimulationTransform, out float3 Out_Simulation);
void QuerySceneDepthGPU_Emitter_CollisionQuery(float3 In_DepthSamplePosWorld, out float Out_SceneDepth, out float3 Out_CameraPosWorld, out bool Out_IsInsideView, out float3 Out_SamplePosWorld, out float3 Out_SampleWorldNormal);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void CustomHlsl0D3CF3E2014C956CEE3EF5B688E5251873EF37A7_Func_(int In_IndexX, int In_IndexY, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, out float Out_Boundary);
void ComputeBoundaryGrid2D_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SourceGrid(out int Out_IndexX, out int Out_IndexY);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensity(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperature(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocity(int In_IndexX, int In_IndexY, out float2 Out_Value);
void ScratchModule001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_32_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void CustomHlslF16787DA752F5EB249B9DEF0596F981ED7C7AE26_Func_(float2 In_TmpVelocity, float2 In_Velocity, out float2 Out_V);
void ScratchDynamicInput001_Emitter_Func_(out float2 Out_Output, inout FSimulationContext Context);
void ScratchDynamicInput002_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_TemporaryGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_TemporaryGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_ScalarIndex, out float2 Out_Grad);
void Grid2D_ComputeGradient001_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl2BED2A90B53ECDE17AB2DD5C7BC8F6EEE30ABEC9_Func_(float In_dx, float2 In_GradCurl, float In_VorticityMult, out float2 Out_VC_Force);
void VorticityConfinementForceGrid2D_Emitter_Func_(inout FSimulationContext Context);
void Multiply_Float001_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void Multiply_Float008_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void CustomHlslE3C86B9CDECB856557D5C39AE198A465825CCCEB_Func_(float In_DensityBuoyancy, float In_SimGrid_Density, float In_TemperatureBuoyancy, float In_SimGrid_Temperature, float3 In_g, out float3 Out_Force);
void Grid2D_Gas_3DBuoyancy_Emitter_Func_(inout FSimulationContext Context);
void TurbulenceForce68257DFCA9CB8D3ABEAD6BCCD62AF7D1F3F8453D_Func_(float In_NoiseIntensity, float In_NoiseScale, float3 In_CellPos, float In_Time, out float2 Out_TurbulenceForce);
void Grid2D_TurbulenceForce_Emitter_Func_(inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_0_Particle_Func_(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void WindForce095AE38EC4A3801BD0CA58FB54EEF17CE799339C_Func_(float3 In_CellPos, float3 In_WDirection, float In_dx, float In_WSpeed, out float2 Out_WindForce2D);
void Grid2D_WindForce_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_IntegrateForces_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_(inout FSimulationContext Context);
void LinearToIndex_Emitter_SimGrid(int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, out float3 Out_Unit);
void CubicSamplePreviousGridAtIndex_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void SamplePreviousGridAtIndex_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_(int In_VelocityIndex, int In_ScalarIndex, float In_dx, float In_dt, int In_IndexX, int In_IndexY, float In_AdvectionVelocityMult, int In_InterpolationMethod, out float Out_AdvectedScalar);
void Grid2D_AdvectScalar_Emitter_Func_(inout FSimulationContext Context);
void Add_Integer001_Emitter_Func_(out int Out_NewOutput, inout FSimulationContext Context);
void Grid2D_AdvectScalar001_Emitter_Func_(inout FSimulationContext Context);
void BreakVector2D_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_(inout FSimulationContext Context);
void DissipateVector2D_Fn_Func_(float In_dt, float In_DissipationRate, float2 In_Vector2DValue, out float2 Out_DissipatedVector2D, inout FSimulationContext Context);
void DissipateVector2D_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl61E7FA02776A7311144FEF53BF67B7D91CCB1B18_Func_(float In_B_center, out bool Out_IsBoundary);
void ScratchModule_06_Emitter_Func_(inout FSimulationContext Context);
void CopyPreviousToCurrentForCell_Emitter_SimGrid_UEImpureCall(int In_IndexX, int In_IndexY);
void CustomHlsl4CBD5903F81915E5F7E339C00EDEF984D3B2EB74Emitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_VectorIndex, out float Out_Div);
void Grid2D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, float In_Value);
void ScratchModule_04_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_IndexX, int In_IndexY, float In_Value);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, out float Out_Value);
void GetDivergence_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslA95FAA64F0668BBF1660E0427EFEF22309EA9AE1_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void SimulationStageIterationInfo_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void GetFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_(int In_IndexX, int In_IndexY, out float Out_P_right, out float Out_P_left, out float Out_P_up, out float Out_P_down);
void GetFloatValue_Emitter_SimGrid_AttributeBoundary(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_(int In_IndexX, int In_IndexY, out float Out_B_right, out float Out_B_left, out float Out_B_up, out float Out_B_down);
void CustomHlsl77E7EFCF673F5DD6D752AB62C3CEB80AAA00A14A_Func_(float In_dx, float In_dt, float In_density, int In_IndexX, int In_IndexY, float In_Divergence, float2 In_Velocity, int In_IterationIndex, float In_Relaxation, float In_P_center, float In_B_center, float In_P_right, float In_P_left, float In_P_up, float In_P_down, float In_B_right, float In_B_left, float In_B_up, float In_B_down, float In_SV_x_right, float In_SV_x_left, float In_SV_y_up, float In_SV_y_down, out float Out_Pressure);
void Grid2D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, out float Out_Value);
void GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_(out int Out_GroupID, out int Out_GroupThreadID);
void GetNumCells_Emitter_PressureGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void CustomHlsl001BA8D955B032277827021978B99CBAC9D21C3B3D7Emitter_PressureGrid_Func_(float In_GridSpaceDX, bool In_bIsInverse, bool In_bTransformX, int In_ScanlineIdx, int In_ThreadIdx, float In_Pi, bool In_bPoissonSolver, inout FSimulationContext Context);
void Grid2D_ComputeFFT_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT001_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT002_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT003_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_ScalarIndex, out float2 Out_Grad);
void Grid2D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl6277BAEAE8E985AB0714912540859827256FD702Emitter_SimGrid_Func_(float2 In_Velocity, int In_IndexX, int In_IndexY, float In_B_center, float In_SV_x_center, float In_SV_y_center, float In_SV_x_right, float In_SV_x_left, float In_SV_y_up, float In_SV_y_down, out float2 Out_VelocityOut);
void ProjectPressureGrid2D_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_AdvectScalar002_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_AdvectScalar003_Emitter_Func_(inout FSimulationContext Context);
void DissipateFloat_Fn_Func_(float In_dt, float In_DissipationRate, float In_SubtractionAmount, float In_FloatValue, out float Out_DissipatedFloat, inout FSimulationContext Context);
void DissipateFloat_Emitter_Func_(inout FSimulationContext Context);
void DissipateFloat001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_(float In_Density, float In_Boundary, out float Out_Output);
void MaskFloatByBoundary_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void MaskFloatByBoundary001_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl9D168E289DC079F182B7B3E4EFEDC1B900CDF148Emitter_SimGrid_Func_(float In_dx, int In_VectorIndex, int In_IndexX, int In_IndexY, out float Out_curl);
void Grid2D_ComputeCurl_Emitter_Func_(inout FSimulationContext Context);
void ScratchModule_02001_Emitter_Func_(inout FSimulationContext Context);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, float4 In_Value);
void Grid2D_Gas_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_LightingGridDownsample(out float2 Out_Unit);
void SampleGrid_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void GetNumCells_Emitter_LightingGridDownsample(out int Out_NumCellsX, out int Out_NumCellsY);
void UnitToIndex_Emitter_LightingGridDownsample(float2 In_Unit, out int Out_IndexX, out int Out_IndexY);
void SetGridValue_Emitter_LightingGridDownsample(int In_IndexX, int In_IndexY, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void DownsampleSimGrid8AC522E026ABFCB0AD5441007E30492D678622C4Emitter_SimGridEmitter_LightingGridDownsample_Func_(float2 In_UnitCoordinates, int In_HighResAttribute, int In_LowResAttribute, inout FSimulationContext Context);
void Grid2D_DownsampleScalar_Emitter_Func_(inout FSimulationContext Context);
void GetViewSpaceTransformsGPU_Emitter_CameraQuery(out float4x4 Out_TranslatedWorldToViewTransform, out float4x4 Out_ViewToTranslatedWorldTransform, out float4x4 Out_TranslatedWorldToCameraViewTransform, out float4x4 Out_CameraViewToTranslatedWorldTransform, out float4x4 Out_ViewToClipTransform, out float4x4 Out_ViewToClipNoAATransform);
void Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_(float3 In_WorldDirection, out float2 Out_TangentDirectionVector2d, out float3 Out_TangentDirectionVector, inout FSimulationContext Context);
void ComputeLightingSun022AB4701E355EEE4B0E878B1CF8E58C022DDD78Emitter_SimGridEmitter_SimGrid_Func_(float In_Samples, float In_RayLength, float2 In_UnitCoordinates, float2 In_Direction, float In_ShadowDensity, int In_LightingIndex, int In_DensityIndex, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_(float3 In_WorldDirection, out float2 Out_TangentDirectionVector2d, out float3 Out_TangentDirectionVector, inout FSimulationContext Context);
void ComputeLightingEnvironment970D20B03E3A024CA140270FAC7E87F27DFE02FFEmitter_SimGridEmitter_SimGrid_Func_(float In_Samples, float In_RayLength, float2 In_UnitCoordinates, float2 In_Direction, float In_ShadowDensity, int In_LightingIndex, int In_DensityIndex, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void SampleGrid_Emitter_LightingGridDownsample(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void ComputeLightingTemperature8C8B35B36B6B341754BD0BEBF3A80DBDB57211DDEmitter_SimGridEmitter_LightingGridDownsample_Func_(float2 In_UnitCoordinates, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void Grid2D_ComputeLighting_Emitter_Func_(inout FSimulationContext Context);
void SelectV3Channel_Particle_Func_(float3 In_VECTOR_VAR, int In_TargetChannel, out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector001_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector002_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void SetRenderTargetValue_Emitter_LightingRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, float4 In_Value);
void Grid2D_Gas_SetRTValues001_Emitter_Func_(inout FSimulationContext Context);
float GetSpawnInterpolation();
float Constant2 = 0;
float2 Constant3 = float2(0,0);
Context.MapSimStage1_Init.Emitter.SimGrid.Density = Constant2;
Context.MapSimStage1_Init.Emitter.SimGrid.Velocity = Constant3;
#if ((SimulationStageIndex == 2) || (SimulationStageIndex == 3)) // Multiple stages
int NumStreakParticles = 1;
float3 Velocity = mul(float4(In_ParticleVel, 0.), In_WorldToLocal).xyz;  
const float3 IndexVelocity = In_dt * Velocity / In_dx;
const float IndexVelocityMagnitude = length(IndexVelocity);
Velocity *= In_VelocityMult;
    NumStreakParticles = min(In_MaxStreakSamples, max(1, In_StreakDensity * IndexVelocityMagnitude / (2. * In_ParticleRadiusIndex)));
In_ParticleDensity /= NumStreakParticles;
In_ParticleTemperature /= NumStreakParticles;
In_ParticlePos = mul(float4(In_ParticlePos, 1.), In_WorldToLocal).xyz;
float ParticleRadius = In_Radius * In_RadiusScale;
const float Density = In_ParticleDensity * In_DensityMult;
const float Temperature = In_ParticleTemperature * In_TemperatureMult;
for (int ww = 0; ww < NumStreakParticles; ++ww)
    const float StreakPosition = 1.0 * ww / NumStreakParticles;
    const float2 FloatIndexToUse = In_ParticleCenterFloatIndex - StreakPosition * IndexVelocity.xy;
    for (int y = -In_ParticleRadiusIndex; y < In_ParticleRadiusIndex; ++y) {
    for (int x = -In_ParticleRadiusIndex; x < In_ParticleRadiusIndex; ++x) {
        int2 CellIndex = int2(x,y) + FloatIndexToUse;
        float Dist = length(FloatIndexToUse - float2(CellIndex.x, CellIndex.y));
        if (Dist <= In_ParticleRadiusIndex && 
             CellIndex.x >= 0 && CellIndex.x < In_NumCellsX &&
             CellIndex.y >= 0 && CellIndex.y < In_NumCellsY)
            float FalloffMult = 1. - pow(smoothstep(ParticleRadius * In_Core, ParticleRadius, Dist), In_Falloff);
            SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeDensity(CellIndex.x,CellIndex.y, Density * FalloffMult);
            SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeTemperature(CellIndex.x,CellIndex.y, Temperature * FalloffMult);
            SetVector2DValue_Emitter_SourceGrid_UEImpureCall_AttributeVelocity(CellIndex.x,CellIndex.y, Velocity.xy * FalloffMult);
            if (In_UseColor)
                SetVector4Value_Emitter_SourceGrid_UEImpureCall_AttributeColor(CellIndex.x, CellIndex.y, In_ParticleColor);
#endif // Multiple stages
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.UseStreaking"
int Constant6 = 0;
int Result = ExecIndex();
bool Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Success;
float3 Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position;
float3 Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Velocity;
float Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius;
float Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_PreviousRadius;
float Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Density;
float Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Temperature;
float Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Divergence;
float4 Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Color;
Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColor(Result, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Success, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Velocity, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_PreviousRadius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Density, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Temperature, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Divergence, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Color);
float3 Result1 = mul(float4(Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position,1.0),Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.WorldToUnit).xyz;
float3 Output1;
Output1.x = Result1.x;
Output1.y = Result1.y;
Output1.z = Result1.z;
float2 Output11;
Output11.x = Output1.x;
Output11.y = Output1.y;
float2 UnitToFloatIndex_Emitter_SourceGridOutput_Index;
UnitToFloatIndex_Emitter_SourceGrid(Output11, UnitToFloatIndex_Emitter_SourceGridOutput_Index);
float3 Output12;
Output12.x = Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position.x;
Output12.y = Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position.y;
Output12.z = Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position.z;
float Result2 = Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius * Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.RadiusScale;
float Result3 = Result2 / Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dx;
float Result4 = ceil(Result3);
float Constant7 = 1;
float Result5 = Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.DensityMult * Constant7;
float Constant8 = 1;
float Result6 = Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.TemperatureMult * Constant8;
int GetNumCells_Emitter_SourceGridOutput_NumCellsX;
int GetNumCells_Emitter_SourceGridOutput_NumCellsY;
GetNumCells_Emitter_SourceGrid(GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY);
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.Use NDC"
int Constant9 = 1;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.UseColor"
int Constant10 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.ScaleEmissionByDt"
int Constant11 = 0;
CustomHlsl972BF63F281C7B34A20B3801B8A6C9D4C83ABC06Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index, Output12, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Velocity, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Density, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Temperature, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Color, Result4, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.VelocityMult, Result5, Result6, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Falloff, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Core, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dx, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.MaxStreakSamples, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.StreakDensity, Constant6, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dt, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.WorldToLocal, Constant10, Context);
int Constant26 = 0;
bool Result8 = NiagaraAll(In_SourceSpace == Constant26);
int Constant27 = 0;
bool Result9 = NiagaraAll(In_DestinationSpace == Constant27);
bool Result10 = Result8 && Result9;
int Constant28 = 1;
bool Result11 = NiagaraAll(In_SourceSpace == Constant28);
int Constant29 = 1;
bool Result12 = NiagaraAll(In_DestinationSpace == Constant29);
bool Result13 = Result11 && Result12;
bool Result14 = Result10 || Result13;
int Constant30 = 2;
bool Result15 = NiagaraAll(In_SourceSpace == Constant30);
int Constant31 = 2;
bool Result16 = NiagaraAll(In_DestinationSpace == Constant31);
bool Result17 = Result15 && Result16;
bool Result18 = Result14 || Result17;
bool Result19 = Result8 && Result16;
bool Result20 = Result15 && Result9;
bool Result21 = Result19 || Result20;
bool Result22 = In_bLocalSpace && Result21;
bool Result23 = Result18 || Result22;
bool Result24 = !In_bLocalSpace;
bool Result25 = Result8 && Result12;
bool Result26 = Result11 && Result9;
bool Result27 = Result25 || Result26;
bool Result28 = Result24 && Result27;
bool Result29 = Result23 || Result28;
bool Result30 = In_bLocalSpace && Result25;
bool Result31 = Result15 && Result12;
bool Result32 = Result30 || Result31;
bool Result33 = Result24 && Result20;
bool Result34 = Result32 || Result33;
float4x4 Matrix_IfResult;
Matrix_IfResult = In_LocalToWorldTransform;
Matrix_IfResult = In_WorldToLocalTransform;
Out_bUseOriginal = Result29;
Out_OutTransform = Matrix_IfResult;
Out_LocalToWorld = Result34;
float4x4 Constant23 = (float4x4)0;
float4x4 LocalToWorld_SelectResult = Constant23;
float4x4 Constant24 = (float4x4)0;
float4x4 WorldToLocal_SelectResult = Constant24;
LocalToWorld_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant25 = false;
bool TransformBase_Func_Output_bUseOriginal;
float4x4 TransformBase_Func_Output_OutTransform;
bool TransformBase_Func_Output_LocalToWorld;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant25, TransformBase_Func_Output_bUseOriginal, TransformBase_Func_Output_OutTransform, TransformBase_Func_Output_LocalToWorld, Context);
float3 Result35 = mul(float4(In_Position,1.0),TransformBase_Func_Output_OutTransform).xyz;
float3 Constant32 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult1 = Constant32;
NiagaraPosition_SelectResult1 = In_Position;
NiagaraPosition_SelectResult1 = Result35;
Out_Position = NiagaraPosition_SelectResult1;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.UseStreaking"
int Constant14 = 0;
int Result7 = ExecIndex();
bool GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_ParticleSource_AttributePosition(Result7, GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value);
int Constant15 = 2;
int Constant16 = 1;
bool Constant17 = false;
float4x4 Constant18 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant19 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant20 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant21 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant22 = false;
float3 TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position;
TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value, Constant15, Constant16, Constant17, Constant18, Constant19, Constant20, Constant21, TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant33 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult2 = Constant33;
NiagaraPosition_SelectResult2 = TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult2 = GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value;
float3 Result36 = mul(float4(NiagaraPosition_SelectResult2,1.0),Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.WorldToUnit).xyz;
float3 Output13;
Output13.x = Result36.x;
Output13.y = Result36.y;
Output13.z = Result36.z;
float2 Output14;
Output14.x = Output13.x;
Output14.y = Output13.y;
float2 UnitToFloatIndex_Emitter_SourceGridOutput_Index1;
UnitToFloatIndex_Emitter_SourceGrid(Output14, UnitToFloatIndex_Emitter_SourceGridOutput_Index1);
float3 Output15;
Output15.x = NiagaraPosition_SelectResult2.x;
Output15.y = NiagaraPosition_SelectResult2.y;
Output15.z = NiagaraPosition_SelectResult2.z;
bool GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Valid;
float3 GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value;
GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocity(Result7, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Valid, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value);
bool GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Valid;
float GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value;
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_density(Result7, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value);
bool GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Valid;
float GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value;
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperature(Result7, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value);
bool GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Valid;
float GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value;
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radius(Result7, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value);
float4 Constant34 = float4(0,0,0,1);
float Result37 = GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value * Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.RadiusScale;
float Result38 = Result37 / Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dx;
float Result39 = ceil(Result38);
float Constant35 = 1;
float Result40 = Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.DensityMult * Constant35;
float Constant36 = 1;
float Result41 = Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.TemperatureMult * Constant36;
int GetNumCells_Emitter_SourceGridOutput_NumCellsX1;
int GetNumCells_Emitter_SourceGridOutput_NumCellsY1;
GetNumCells_Emitter_SourceGrid(GetNumCells_Emitter_SourceGridOutput_NumCellsX1, GetNumCells_Emitter_SourceGridOutput_NumCellsY1);
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.Use NDC"
int Constant37 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.UseColor"
int Constant38 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.ScaleEmissionByDt"
int Constant39 = 0;
CustomHlsl972BF63F281C7B34A20B3801B8A6C9D4C83ABC06Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index1, Output15, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value, Constant34, Result39, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.VelocityMult, Result40, Result41, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Falloff, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Core, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX1, GetNumCells_Emitter_SourceGridOutput_NumCellsY1, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dx, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.MaxStreakSamples, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.StreakDensity, Constant14, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dt, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.WorldToLocal, Constant38, Context);
Out_Boundary = 0;
  Out_Boundary = In_OpenBoundaryRight ? 2 : 1;
  Out_Boundary = In_OpenBoundaryLeft ? 2 : 1;
  Out_Boundary = In_OpenBoundaryDown ? 2 : 1;
  Out_Boundary = In_OpenBoundaryUp ? 2 : 1;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit);
float Constant45 = 0;
float3 Output16;
Output16.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.x;
Output16.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.y;
Output16.z = Constant45;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation;
UnitToSimulation_Emitter_SimGrid(Output16, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation);
float QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SceneDepth;
float3 QuerySceneDepthGPU_Emitter_CollisionQueryOutput_CameraPosWorld;
bool QuerySceneDepthGPU_Emitter_CollisionQueryOutput_IsInsideView;
float3 QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld;
float3 QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SampleWorldNormal;
QuerySceneDepthGPU_Emitter_CollisionQuery(UnitToSimulation_Emitter_SimGridOutput_Simulation, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SceneDepth, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_CameraPosWorld, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_IsInsideView, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SampleWorldNormal);
float3 Output17;
Output17.x = UnitToSimulation_Emitter_SimGridOutput_Simulation.x;
Output17.y = UnitToSimulation_Emitter_SimGridOutput_Simulation.y;
Output17.z = UnitToSimulation_Emitter_SimGridOutput_Simulation.z;
float3 Result42 = QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld - Output17;
float Result43 = length(Result42);
float Constant46 = 15;
bool Result44 = NiagaraAll(Result43 < Constant46);
float Constant47 = 1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY);
int Constant48 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY);
float CustomHlsl0D3CF3E2014C956CEE3EF5B688E5251873EF37A7_Func_Output_Boundary;
CustomHlsl0D3CF3E2014C956CEE3EF5B688E5251873EF37A7_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, Constant48, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryRight, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryLeft, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryUp, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryDown, CustomHlsl0D3CF3E2014C956CEE3EF5B688E5251873EF37A7_Func_Output_Boundary);
float float_IfResult;
float_IfResult = Constant47;
float_IfResult = CustomHlsl0D3CF3E2014C956CEE3EF5B688E5251873EF37A7_Func_Output_Boundary;
Context.MapSimStage4_PreSim.OUTPUT_VAR.ComputeBoundaryGrid2D.Boundary = float_IfResult;
int ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_SourceGrid(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY);
float GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value;
GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensity(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY, GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value);
float GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value;
GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperature(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY, GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value);
float2 GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value;
GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY, GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value);
Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Density = GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value;
Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Temperature = GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value;
Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Velocity = GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value;
Context.MapSimStage4_PreSim.Transient.TmpVelocity = Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpVelocity;
Context.MapSimStage4_PreSim.Transient.TmpDensity = Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpDensity;
Context.MapSimStage4_PreSim.Transient.TmpTemperature = Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpTemperature;
float Result45 = max(Context.MapSimStage4_PreSim.Transient.TmpDensity, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
Out_Output = Result45;
Out_V = dot(In_TmpVelocity, In_TmpVelocity) > dot(In_Velocity, In_Velocity) ? In_TmpVelocity : In_Velocity;
float2 CustomHlslF16787DA752F5EB249B9DEF0596F981ED7C7AE26_Func_Output_V;
CustomHlslF16787DA752F5EB249B9DEF0596F981ED7C7AE26_Func_(Context.MapSimStage4_PreSim.Transient.TmpVelocity, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity, CustomHlslF16787DA752F5EB249B9DEF0596F981ED7C7AE26_Func_Output_V);
Out_Output = CustomHlslF16787DA752F5EB249B9DEF0596F981ED7C7AE26_Func_Output_V;
float Result46 = max(Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature, Context.MapSimStage4_PreSim.Transient.TmpTemperature);
Out_Output = Result46;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity = Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Velocity;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Density = Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Density;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature = Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Temperature;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Boundary = Context.MapSimStage4_PreSim.SetVariables_9A5606CD480032B7102900A8757C50F2.Emitter.SimGrid.Boundary;
float S_right;
GetGridValue_Emitter_TemporaryGrid(In_IndexX+1, In_IndexY, In_ScalarIndex, S_right);
float S_left;
GetGridValue_Emitter_TemporaryGrid(In_IndexX-1, In_IndexY, In_ScalarIndex, S_left);
float S_up;
GetGridValue_Emitter_TemporaryGrid(In_IndexX, In_IndexY+1, In_ScalarIndex, S_up);
float S_down;
GetGridValue_Emitter_TemporaryGrid(In_IndexX, In_IndexY-1, In_ScalarIndex, S_down);
Out_Grad = float2(S_right - S_left, S_up - S_down) / (2.0 * In_dx);
Out_Grad = float2(0.0, 0.0);
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY);
float2 CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_TemporaryGrid_Func_Output_Grad;
CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_TemporaryGrid_Func_(Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.dx, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.ScalarIndex, CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_TemporaryGrid_Func_Output_Grad);
Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad = CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_TemporaryGrid_Func_Output_Grad;
Out_VC_Force = float2(0,0);
float GradCurlLength = length(In_GradCurl);
  Out_VC_Force = In_VorticityMult * In_dx * cross(float3(In_GradCurl / GradCurlLength, 0), float3(0,0,1)).xy;
float2 CustomHlsl2BED2A90B53ECDE17AB2DD5C7BC8F6EEE30ABEC9_Func_Output_VC_Force;
CustomHlsl2BED2A90B53ECDE17AB2DD5C7BC8F6EEE30ABEC9_Func_(Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.dx, Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.GradCurl, Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.VorticityMult, CustomHlsl2BED2A90B53ECDE17AB2DD5C7BC8F6EEE30ABEC9_Func_Output_VC_Force);
float2 Result47 = Context.MapSimStage4_PreSim.Transient.PhysicsForce + CustomHlsl2BED2A90B53ECDE17AB2DD5C7BC8F6EEE30ABEC9_Func_Output_VC_Force;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result47;
float Constant51 = 1;
float Result48 = Constant51 * Context.MapSimStage4_PreSim.Multiply_Float001.B;
Out_Result = Result48;
float Constant53 = -1;
float Result49 = Constant53 * Context.MapSimStage4_PreSim.Multiply_Float008.B;
Out_Result = Result49;
Out_Force = (In_DensityBuoyancy * In_SimGrid_Density - In_TemperatureBuoyancy * In_SimGrid_Temperature) * In_g;
float3 CustomHlslE3C86B9CDECB856557D5C39AE198A465825CCCEB_Func_Output_Force;
CustomHlslE3C86B9CDECB856557D5C39AE198A465825CCCEB_Func_(Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.DensityBuoyancy, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density, Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature, Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.g, CustomHlslE3C86B9CDECB856557D5C39AE198A465825CCCEB_Func_Output_Force);
float3 Result50 = Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld + CustomHlslE3C86B9CDECB856557D5C39AE198A465825CCCEB_Func_Output_Force;
Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld = Result50;
Out_TurbulenceForce= float2(0.0,0.0);
    float noiseScale = .05 * In_NoiseScale;
    float noiseIntensity = 100.0 * In_NoiseIntensity;
    float noiseX = FastGradientPerlinNoise3D_TEX(float3(In_CellPos.xy+ In_Time.xx,.0)*noiseScale).x *noiseIntensity;
    float noiseY = FastGradientPerlinNoise3D_TEX(float3(In_CellPos.xy-+ In_Time.xx+ 842.212,0.0)*noiseScale).x *noiseIntensity;
    Out_TurbulenceForce = float2(noiseX,noiseY);
float Constant58 = 1;
float Constant59 = 1;
float Constant60 = 1;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1);
float Constant61 = 0;
float3 Output18;
Output18.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output18.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output18.z = Constant61;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation1;
UnitToSimulation_Emitter_SimGrid(Output18, Context.MapSimStage4_PreSim.Grid2D_TurbulenceForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation1);
float Result51 = Context.MapSimStage4_PreSim.Engine.Time * Constant60;
float2 TurbulenceForce68257DFCA9CB8D3ABEAD6BCCD62AF7D1F3F8453D_Func_Output_TurbulenceForce;
TurbulenceForce68257DFCA9CB8D3ABEAD6BCCD62AF7D1F3F8453D_Func_(Constant58, Constant59, UnitToSimulation_Emitter_SimGridOutput_Simulation1, Result51, TurbulenceForce68257DFCA9CB8D3ABEAD6BCCD62AF7D1F3F8453D_Func_Output_TurbulenceForce);
float2 Result52 = TurbulenceForce68257DFCA9CB8D3ABEAD6BCCD62AF7D1F3F8453D_Func_Output_TurbulenceForce + Context.MapSimStage4_PreSim.Transient.PhysicsForce;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result52;
float Result54 = dot(In_V,In_V);
float Result55 = In_Threshold * In_Threshold;
bool Result56 = NiagaraAll(Result54 < Result55);
float Result57 = length(In_Fallback);
float Result58 = rsqrt(Result54);
float3 Result59 = In_V * Result58;
float Result60 = Reciprocal(Result58);
float3 Constant69 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult3 = Constant69;
float Constant70 = (0.0);
float Length_SelectResult3 = Constant70;
Direction_SelectResult3 = In_Fallback;
Length_SelectResult3 = Result57;
Direction_SelectResult3 = Result59;
Length_SelectResult3 = Result60;
Out_Direction = Direction_SelectResult3;
Out_Length = Length_SelectResult3;
Out_BelowThreshold = Result56;
Out_WindForce2D= float2(0.0,0.0);
        Out_WindForce2D = In_WDirection.xy*In_WSpeed * In_dx * 60.0;
float3 Constant64 = float3(1,1,0);
float Constant65 = 0.2;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2);
float Constant66 = 0;
float3 Output19;
Output19.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2.x;
Output19.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2.y;
Output19.z = Constant66;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation2;
UnitToSimulation_Emitter_SimGrid(Output19, Context.MapSimStage4_PreSim.Grid2D_WindForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation2);
float3 Result53 = mul(float4(UnitToSimulation_Emitter_SimGridOutput_Simulation2,1.0),Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal).xyz;
float3 Constant67 = float3(0,0,1);
float Constant68 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold;
DirectionAndLengthSafe_v1_0_Particle_Func_(Constant64, Constant67, Constant68, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold, Context);
float3 Result61 = mul(float4(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction,0.0),Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal).xyz;
float2 WindForce095AE38EC4A3801BD0CA58FB54EEF17CE799339C_Func_Output_WindForce2D;
WindForce095AE38EC4A3801BD0CA58FB54EEF17CE799339C_Func_(Result53, Result61, Context.MapSimStage4_PreSim.Grid2D_WindForce.dx, Constant65, WindForce095AE38EC4A3801BD0CA58FB54EEF17CE799339C_Func_Output_WindForce2D);
float2 Result62 = WindForce095AE38EC4A3801BD0CA58FB54EEF17CE799339C_Func_Output_WindForce2D + Context.MapSimStage4_PreSim.Transient.PhysicsForce;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result62;
float4x4 Result63 = transpose(Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.WorldToLocal);
float3 Result64 = mul(float4(Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld,0.0),Result63).xyz;
float2 Output110;
Output110.x = Result64.x;
Output110.y = Result64.y;
float2 Result65 = Context.MapSimStage4_PreSim.Transient.PhysicsForce + Output110;
float2 Result66 = Result65 * Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.dt;
float2 Result67 = Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.Velocity + Result66;
Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_IntegrateForces.NewVelocity = Result67;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity = Context.MapSimStage4_PreSim.SetVariables_C54322844BB05B548FF0B8B0DC931DEE.Emitter.SimGrid.Velocity;
#if ((SimulationStageIndex == 5) || (SimulationStageIndex == 13)) // Multiple stages
float Scale = In_dt/In_dx * In_AdvectionVelocityMult;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY, In_VelocityIndex, Velocity.x);
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY, In_VelocityIndex + 1, Velocity.y);
float2 Index = float2(In_IndexX, In_IndexY);
float2 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
IndexToUnit_Emitter_SimGrid(SampleIndex.x, SampleIndex.y, SampleUnit);
    CubicSamplePreviousGridAtIndex_Emitter_SimGrid(SampleUnit.x, SampleUnit.y, In_ScalarIndex, Out_AdvectedScalar);
    SamplePreviousGridAtIndex_Emitter_SimGrid(SampleUnit.x, SampleUnit.y, In_ScalarIndex, Out_AdvectedScalar);
float Constant73 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar/Map Get/Map Get->Module.Interpolation Method"
int Constant74 = 1;
int Result68 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX;
int LinearToIndex_Emitter_SimGridOutput_IndexY;
LinearToIndex_Emitter_SimGrid(Result68, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY);
float CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.VelocityIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.ScalarIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dx, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dt, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, Constant73, Constant74, CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar.AdvectedScalar = CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
int Constant76 = 1;
int Result69 = Context.MapSimStage5_AdvectVelocity.Add_Integer001.A + Constant76;
Out_NewOutput = Result69;
float Constant79 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 001/Map Get/Map Get->Module.Interpolation Method"
int Constant80 = 1;
int Result70 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX1;
int LinearToIndex_Emitter_SimGridOutput_IndexY1;
LinearToIndex_Emitter_SimGrid(Result70, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1);
float CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.VelocityIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.ScalarIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dx, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dt, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1, Constant79, Constant80, CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar001.AdvectedScalar = CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
float2 Output111;
Output111.x = Context.MapSimStage5_AdvectVelocity.BreakVector2D.X;
Output111.y = Context.MapSimStage5_AdvectVelocity.BreakVector2D.Y;
Out_Vec2 = Output111;
Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity = Context.MapSimStage5_AdvectVelocity.SetVariables_47EB198B4D26ACB745967FA215BE495B.Emitter.SimGrid.Velocity;
float Result71 = In_dt * In_DissipationRate;
float Constant81 = 1;
float Result72 = Result71 + Constant81;
float2 Result73 = In_Vector2DValue / Result72;
Out_DissipatedVector2D = Result73;
float2 DissipateVector2D_Fn_Func_Output_DissipatedVector2D;
DissipateVector2D_Fn_Func_(Context.MapSimStage5_AdvectVelocity.DissipateVector2D.dt, Context.MapSimStage5_AdvectVelocity.DissipateVector2D.DissipationRate, Context.MapSimStage5_AdvectVelocity.DissipateVector2D.VectorValue, DissipateVector2D_Fn_Func_Output_DissipatedVector2D, Context);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.DissipateVector2D.DissipatedVector2D = DissipateVector2D_Fn_Func_Output_DissipatedVector2D;
int CellType = round(In_B_center);
Out_IsBoundary = CellType == SOLID_CELL || CellType == EMPTY_CELL;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1);
float GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value;
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value);
bool CustomHlsl61E7FA02776A7311144FEF53BF67B7D91CCB1B18_Func_Output_IsBoundary;
CustomHlsl61E7FA02776A7311144FEF53BF67B7D91CCB1B18_Func_(GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value, CustomHlsl61E7FA02776A7311144FEF53BF67B7D91CCB1B18_Func_Output_IsBoundary);
float2 Constant82 = float2(0,0);
float2 Constant83 = float2(0.0, 0.0);
float2 Vector2f_SelectResult4 = Constant83;
Vector2f_SelectResult4 = Constant82;
Vector2f_SelectResult4 = Context.MapSimStage5_AdvectVelocity.ScratchModule_06.Velocity;
Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity = Vector2f_SelectResult4;
float Vx_right;
GetGridValue_Emitter_SimGrid(In_IndexX+1, In_IndexY, In_VectorIndex, Vx_right);
float Vx_left;
GetGridValue_Emitter_SimGrid(In_IndexX-1, In_IndexY, In_VectorIndex, Vx_left);
float Vy_up;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY+1, In_VectorIndex+1, Vy_up);
float Vy_down;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY-1, In_VectorIndex+1, Vy_down);
Out_Div = (Vx_right - Vx_left + Vy_up - Vy_down) / (2. * In_dx);
Out_Div = 0.0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2);
float CustomHlsl4CBD5903F81915E5F7E339C00EDEF984D3B2EB74Emitter_SimGrid_Func_Output_Div;
CustomHlsl4CBD5903F81915E5F7E339C00EDEF984D3B2EB74Emitter_SimGrid_Func_(Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.VectorIndex, CustomHlsl4CBD5903F81915E5F7E339C00EDEF984D3B2EB74Emitter_SimGrid_Func_Output_Div);
Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div = CustomHlsl4CBD5903F81915E5F7E339C00EDEF984D3B2EB74Emitter_SimGrid_Func_Output_Div;
Context.MapSimStage6_ComputeDivergence.Emitter.TemporaryGrid.SimFloat = Context.MapSimStage6_ComputeDivergence.SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118.Emitter.TemporaryGrid.SimFloat;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY);
float Result74 = Context.MapSimStage6_ComputeDivergence.ScratchModule_04.Div / Context.MapSimStage6_ComputeDivergence.ScratchModule_04.dt;
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, Result74);
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1);
float GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY1, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.MapSimStage7_SolvePressure.Transient.Divergence = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
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
Out_P_right = 0;
Out_P_left = 0;
Out_P_up = 0;
Out_P_down = 0;
GetFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX+1, In_IndexY, Out_P_right);
GetFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX-1, In_IndexY, Out_P_left);
GetFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX, In_IndexY+1, Out_P_up);
GetFloatValue_Emitter_PressureGrid_AttributePressure(In_IndexX, In_IndexY-1, Out_P_down);
Out_B_right = 0;
Out_B_left = 0;
Out_B_up = 0;
Out_B_down = 0;
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX+1, In_IndexY, Out_B_right);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX-1, In_IndexY, Out_B_left);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX, In_IndexY+1, Out_B_up);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX, In_IndexY-1, Out_B_down);
Out_Pressure = 0;
int FluidCellCount = 4;
float BoundaryAdd = 0.0;
int RowParity = (In_IndexY + In_IterationIndex) %2;
int CellParity = (In_IndexX + RowParity )%2;
float Weight;
    // same as regular jacobi
    Weight = 1;
    // will do red-black SOR
    // add 1 since we want to expose a 0-1 parameter
    Weight = CellParity * min(1.93, In_Relaxation + 1);
int CellType_right = round(In_B_right);
    FluidCellCount--;
    BoundaryAdd += In_density * In_dx * (In_Velocity.x - In_SV_x_right) / In_dt;
    In_P_right = 0;
   In_P_right = 0;
int CellType_left = round(In_B_left);
    BoundaryAdd -= In_density *  In_dx *(In_Velocity.x - In_SV_x_left) / In_dt;
    In_P_left = 0;
   In_P_left = 0;
int CellType_up = round(In_B_up);
    BoundaryAdd += In_density *  In_dx * (In_Velocity.y - In_SV_y_up) / In_dt;
    In_P_up = 0;
   In_P_up = 0;
int CellType_down = round(In_B_down);
    BoundaryAdd -= In_density *  In_dx * (In_Velocity.y - In_SV_y_down) / In_dt;
    In_P_down = 0;
   In_P_down = 0;
float JacobiPressure; 
    JacobiPressure = (In_P_right + In_P_left + In_P_up + In_P_down - In_density * In_dx * In_dx * In_Divergence / In_dt + BoundaryAdd) / FluidCellCount;
    Out_Pressure = (1.f - Weight) * In_P_center + Weight * JacobiPressure;
//SetConstantByStaticVariable "/Grid 2D Pressure Iteration/Map Get/Map Get->Module.Use Solid Velocity"
int Constant84 = 0;
float Constant85 = 1;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1);
float2 GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
int SimulationStageIterationInfo_Func_Output_IterationIndex;
int SimulationStageIterationInfo_Func_Output_MaxIterations;
float SimulationStageIterationInfo_Func_Output_NormalizedIterationIndex;
int SimulationStageIterationInfo_Func_Output_LoopIndex;
int SimulationStageIterationInfo_Func_Output_NumberOfLoops;
float SimulationStageIterationInfo_Func_Output_NormalizedLoopIndex;
SimulationStageIterationInfo_Func_(SimulationStageIterationInfo_Func_Output_IterationIndex, SimulationStageIterationInfo_Func_Output_MaxIterations, SimulationStageIterationInfo_Func_Output_NormalizedIterationIndex, SimulationStageIterationInfo_Func_Output_LoopIndex, SimulationStageIterationInfo_Func_Output_NumberOfLoops, SimulationStageIterationInfo_Func_Output_NormalizedLoopIndex, Context);
float GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value1;
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value1);
float CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_right;
float CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_left;
float CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_up;
float CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_down;
CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_right, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_left, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_up, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_down);
float CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_right;
float CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_left;
float CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_up;
float CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_down;
CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_right, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_left, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_up, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_down);
float Constant86 = 0;
float Constant87 = 0;
float Constant88 = 0;
float Constant89 = 0;
float CustomHlsl77E7EFCF673F5DD6D752AB62C3CEB80AAA00A14A_Func_Output_Pressure;
CustomHlsl77E7EFCF673F5DD6D752AB62C3CEB80AAA00A14A_Func_(Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dx, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dt, Constant85, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Divergence, GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value, SimulationStageIterationInfo_Func_Output_IterationIndex, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Relaxation, Context.MapSimStage7_SolvePressure.Emitter.PressureGrid.Pressure, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value1, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_right, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_left, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_up, CustomHlsl70B2AB4F8DDD50BE16B173B7298ED248479B06F8Emitter_PressureGrid_Func_Output_P_down, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_right, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_left, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_up, CustomHlsl6AFEC32B1454EA2B1E1D958D23C4915FF3A8CEB4Emitter_SimGrid_Func_Output_B_down, Constant86, Constant87, Constant88, Constant89, CustomHlsl77E7EFCF673F5DD6D752AB62C3CEB80AAA00A14A_Func_Output_Pressure);
Context.MapSimStage7_SolvePressure.OUTPUT_VAR.Grid2D_PressureIteration.Pressure = CustomHlsl77E7EFCF673F5DD6D752AB62C3CEB80AAA00A14A_Func_Output_Pressure;
Context.MapSimStage7_SolvePressure.Emitter.PressureGrid.Pressure = Context.MapSimStage7_SolvePressure.SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91.Emitter.PressureGrid.Pressure;
#if ((SimulationStageIndex == 8) || (SimulationStageIndex == 9) || (SimulationStageIndex == 10) || (SimulationStageIndex == 11)) // Multiple stages
// Indices for which thread group a compute shader is executing in
// -- GGroupId
Out_GroupID = GGroupId.x;
// ID of this thread in the group.  
// Assumes Dispatch is linear i.e. Dispatch( NumGroups, 1, 1);
Out_GroupThreadID = GGroupThreadId.x;
// discrete sine transform using FFT.
//   defined as :
//               F_k = Sum_{n=1}^{M-1} f_n Sin(Pi k n / M)
//               f_n = (2/M) Sum_{k=1}^{M-1} F_k Sin(Pi k n / M)
//  Requirement. Lenght of input is M-1, where M is a power of two.
//   Dispatch: 
//      with M/2 threads.
//   Grid2D:
//     The grid2d must have a channel with name "Real"
// Idea.  Input. Real Array of  length M -1   
//            {f_i}  with i in [1, M-1] 
//         i.e. {f_i} = { f1, f2, .. f_{M-1} }.    
//  Step 1) 
//     odd extension is applied creating {g_i} with i in [0,2M-1]
//     i.e. {g_i} = { 0, f1, f2.. f_{M-1}, 0, -f_{M-1}...-f2 -f1 } 
//  Step 2) 
//    pack pairs of terms in {g_i} as complex array {h_i} of length M
//     {h_i} = {g_{2i} + i g_{2 i +1 }
//  Step 3) 
//    FFT the complex array {h_i} 
//   H_k = FFT(h_i)
//  Step 4) 
//   unpack the H_k to get G_k
//   G_k = (H_k + Conjugate(H_{M-k}) - i/2 (H_k - Conjugate(H_{M-k))Exp(i pi k / M)
//  Step 5)
//   construct coefficeints of Sin Transform from
//    F^{sin}_k = -i/2 F_k.
//   Note: this is purely real, so F_k is pure imaginary.
//         also F^sin_0 = 0.  
//  Step 6)
//    store output as real array lenght M-1 
//   { F^sin_1, F^sin_2 ... F^sin_{M-1} }
int2 NumCells;
GetNumCells_Emitter_PressureGrid(NumCells.x, NumCells.y);
int Mx =  (In_bTransformX) ?  NumCells.x + 1 : NumCells.y + 1;
int NumCols = Mx / 2; // requires a dispatch such that NumCols = THREADGROUP_SIZE
int My = (In_bTransformX) ? NumCells.y + 1 : NumCells.x + 1;
// constants.
float TwoPi = 2.0 * In_Pi;
// assume the domain is size 1x1
float L = In_GridSpaceDX * Mx;
float dx = 1; //GridSpaceDX;
// This assumes we have already done the sin-transform in Y
// and now we are doing it in X - to be followed by inv in Y inv in X
bool bApplyPoissonConvolution =  (In_bPoissonSolver) && (In_bTransformX) && (In_bIsInverse == false);
bool bCorrectDim = (Mx / 2 == THREADGROUP_SIZE);
bool bValidSetUp = bCorrectDim;
float RScale = 1. / In_GridSpaceDX;
float WScale = (In_GridSpaceDX * In_GridSpaceDX ) * 1./RScale; 
bool bFirstRead = ((In_bTransformX == false)&&(In_bIsInverse == false));
bool bLastWrite = ((In_bTransformX == false)&&(In_bIsInverse == true));
// local scratch of complex numbers. ( V.x+ I V.y is a complex number)
float2 V[2];
// load data into scratch. "j" is threadid
//    V[0] = h_j
//    V[1] = h_{M/2 +j}
    // load V[0] = h_j
    //           = float2(g_{2j}, g_{2j +1})
    //           = float2(data[2j-1], data[2j])   // offset in data
    //
    //      V[1] = h_{M/2 + j}
    //           = float2(g_{M + 2j}, g_{M + 2j + 1})
    //           = -float2(g_{M-2j},  g_{M-2j-1} )        // odd sym. 
    //           = -float2( data[M-2j-1], data[M-2j -2])  // offset in data
    // loads the data, extended as odd, and packs it into M complex numbers.
        int j = In_ThreadIdx; // j in [0, M/2-1]
        // holds h_j
        int2 pxl = int2(2 * j - 1, In_ScanlineIdx);
        int2 off = int2(1, 0);
        // holds h_{M/2 +j}
        int2 pxl2 = int2(Mx - 2* j -1, In_ScanlineIdx);
        if (In_bTransformX == false )
            pxl.xy = pxl.yx;
            off.xy = off.yx;
            pxl2.xy = pxl2.yx;
        // boundary are zero, i.e. data[-1], and data[M].
        if (j == 0) 
            V[0].x = 0; // g_0 = f_0 = 0
            V[1].x = 0; // g_m = 0
        else
            // g_{2j} ( = f_2j )
            GetFloatValue_Emitter_PressureGrid_AttributePressure(pxl.x, pxl.y, V[0].x);
            // g_{M-2j}   
            GetFloatValue_Emitter_PressureGrid_AttributePressure(pxl2.x, pxl2.y, V[1].x);
        // g_{2j + 1} 
        GetFloatValue_Emitter_PressureGrid_AttributePressure(pxl.x + off.x, pxl.y + off.y, V[0].y);
        // g_{M - 2j - 1} 
        GetFloatValue_Emitter_PressureGrid_AttributePressure(pxl2.x - off.x, pxl2.y - off.y, V[1].y);
        // make values odd 
        // g_{M + 2j} = -g_{M-2j}
        // g_{M + 2j+1} = -g_{M-2j-1}
        V[1] *= -1.;
    V[0] *= RScale;
    V[1] *= RScale;
// Scale.  The forward and inverse scale should have the product 2/Mx
// note, this scale was chosen because the pressure values were so high
// that doing two forward transforms (e.g. x and y) would generate garbage
// most likely by exceeding the max value for the grid storage. 
    float Scale = rsqrt(float(NumCols));
    V[0] *= Scale;
    V[1] *= Scale; 
// compute FFT
// This is a sequence of Radix-2 FFTs and data exchanges.
    int IdxS = In_ThreadIdx;
    for (int Ns = 1 ; Ns < Mx; Ns *= 2)
        //IdxD = Expand(ThreadIdx, Ns, RADIX);
        int IdxD = (In_ThreadIdx / Ns) * Ns * 2 + (In_ThreadIdx % Ns);
        // Apply the Twiddle
        float Theta = TwoPi * float( In_ThreadIdx % Ns) / float(Ns * 2);
            float2 Twiddle;
            sincos(Theta, Twiddle.y, Twiddle.x); 
            V[1] = ComplexMultEqs(V[1], Twiddle);    
        // Radix(2) FFT
            float2 Vo = V[0];
            V[0] = Vo + V[1];
            V[1] = Vo - V[1];
        // Exchange data with other threads
            GroupMemoryBarrierWithGroupSync();
            // write to group shared
            for (int r = 0, j = IdxD; r < 2; ++r, j += Ns)
                FFTGroupShared[j] = V[r];
           GroupMemoryBarrierWithGroupSync();
            // read from group shared
            for (int r = 0, j = IdxS; r < 2; ++r, j += NumCols)
                V[r] = FFTGroupShared[j];
    } // end loop
} // end FFT
// group shared memory now hold H[0]...H[M-1].  
// note: H[M] = H[0]
// and in the local scratch:
//   H_j       = V[0]
//   H_{j+M/2} = V[1]
    // Use this thread to write F^sin_{M/2} 
    int k = NumCols; // =  M/2
    int2 GridIdx = int2(k-1, In_ScanlineIdx);
    if (In_bTransformX == false)
        GridIdx.xy = GridIdx.yx;
    // unpacking this frequency has a simplified form.
    // G_{M/2} = H_{M/2}
    // F^Sin_k = -i/2 G_{k}
    float Val = 0.5 * V[1].y;
    if (bApplyPoissonConvolution )
        int kx = k;
        int ky = In_ScanlineIdx + 1;
        Val /=  EigenValue(kx, ky, Mx, My, In_Pi, dx);
    if (bLastWrite)
        Val *= WScale;
    SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(GridIdx.x, GridIdx.y, Val);
// Need to rebuild the FSin_k coefficients.
// F_k = (1/2) (H_k + Conjugate(H_{M-k)) + (1/2i) ( H_k - Conjugate(H_{M-k}) * Exp(i pi k/M)
// FSin_k = (1/2i) F_k
// note F_k is pure imaginary.  FSin_k is pure real.  FSin_0 = 0
// Recall; number of threads = M / 2.  Each thread should write 2 slots.
// read H_{M-k} from group shared.
    int j = (In_ThreadIdx != 0)? Mx - In_ThreadIdx : 0; // H_{M} = H_{0}
    V[1] = FFTGroupShared[j];
// unpack the F_{k} and F_{M-k} coefficients of the transform of the 
// odd extension of the original data. 
// threadIdx should be [0,M/2-1]  
float2 Fk; 
float2 FMminusk;
    int k = In_ThreadIdx;
    float2 Apart = V[0] + ComplexCon(V[1]);
    float2 Bpart; // i ( V[0] - ComplexCon(V[1])) Exp(i pi k / M)
        Bpart = V[0] - ComplexCon(V[1]);
        float2 Twiddle;
        float Angle = In_Pi *float(k) / float(Mx);
        sincos(Angle, Twiddle.y, Twiddle.x);
        Bpart = ComplexMultEqs(Bpart, Twiddle);     
        Bpart = float2(-Bpart.y, Bpart.x);
    Fk = 0.5 * ( Apart - Bpart );
    FMminusk = 0.5 * ( ComplexCon(Apart) + ComplexCon(Bpart) );
float FsinK   = 0.5 * Fk.y;
float FsinMmK = 0.5 * FMminusk.y;
// Also due to symmetry, F^sin_0 will be zero.  We don't record it. 
// Copy the results to the output buffer, But shift the data
// so [0] holds F^sin_1,  [1] holds F^sin_2.. etc
// write F^sin_k 
        FsinK /=  EigenValue(kx, ky, Mx, My, In_Pi, dx);
        FsinK *= WScale;
   SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(GridIdx.x, GridIdx.y, FsinK);
// write F^sin_{M-k}
    int MminusK = Mx - In_ThreadIdx;
    int2 GridIdx = int2(MminusK-1, In_ScanlineIdx);
    if ( bApplyPoissonConvolution )
        int kx = MminusK;
        FsinMmK /=  EigenValue(kx, ky, Mx, My, In_Pi, dx);
        FsinMmK *= WScale;
    SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(GridIdx.x, GridIdx.y, FsinMmK);
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID;
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID;
GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_(GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID);
float Result75 = PI;
CustomHlsl001BA8D955B032277827021978B99CBAC9D21C3B3D7Emitter_PressureGrid_Func_(Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.dx, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.Inverse, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.XDirecton, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID, Result75, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.bPoissonSolver, Context);
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID1;
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID1;
GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_(GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID1, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID1);
float Result76 = PI;
CustomHlsl001BA8D955B032277827021978B99CBAC9D21C3B3D7Emitter_PressureGrid_Func_(Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.dx, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.Inverse, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.XDirecton, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID1, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID1, Result76, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.bPoissonSolver, Context);
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID2;
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID2;
GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_(GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID2, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID2);
float Result77 = PI;
CustomHlsl001BA8D955B032277827021978B99CBAC9D21C3B3D7Emitter_PressureGrid_Func_(Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.dx, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.Inverse, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.XDirecton, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID2, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID2, Result77, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.bPoissonSolver, Context);
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID3;
int GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID3;
GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_(GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID3, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID3);
float Result78 = PI;
CustomHlsl001BA8D955B032277827021978B99CBAC9D21C3B3D7Emitter_PressureGrid_Func_(Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.dx, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.Inverse, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.XDirecton, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupID3, GetGroupID529290F8251E454A15D477B2425B9666728FB1B4_Func_Output_GroupThreadID3, Result78, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.bPoissonSolver, Context);
GetGridValue_Emitter_PressureGrid(In_IndexX+1, In_IndexY, In_ScalarIndex, S_right);
GetGridValue_Emitter_PressureGrid(In_IndexX-1, In_IndexY, In_ScalarIndex, S_left);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY+1, In_ScalarIndex, S_up);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY-1, In_ScalarIndex, S_down);
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2);
float2 CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_PressureGrid_Func_Output_Grad;
CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_PressureGrid_Func_(Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2, Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.ScalarIndex, CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_PressureGrid_Func_Output_Grad);
Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.Grid2D_ComputeGradient.Grad = CustomHlsl7A2E00DDA82B6A54B92D4FAF19FFF971572A4A49Emitter_PressureGrid_Func_Output_Grad;
Out_VelocityOut = float2(0,0);
float B_right;
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX+1, In_IndexY, B_right);
int CellType_right = round(B_right);
float B_left;
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX-1, In_IndexY, B_left);
int CellType_left = round(B_left);
    Out_VelocityOut.x = In_SV_x_left;
    Out_VelocityOut.x = In_SV_x_right;
    Out_VelocityOut.x = In_Velocity.x;
float B_up;
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX, In_IndexY+1, B_up);
int CellType_up  = round(B_up);
float B_down;
GetFloatValue_Emitter_SimGrid_AttributeBoundary(In_IndexX, In_IndexY-1, B_down);
int CellType_down  = round(B_down);
    Out_VelocityOut.y = In_SV_y_down;
    Out_VelocityOut.y = In_SV_y_up;
    Out_VelocityOut.y = In_Velocity.y;
    Out_VelocityOut.x = In_SV_x_center;
    Out_VelocityOut.y = In_SV_y_center;
//SetConstantByStaticVariable "/Project Pressure Grid 2D/Map Get/Map Get->Module.Use Solid Velocity"
int Constant103 = 0;
float2 Result79 = Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.PressureGradient * Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.dt;
float2 Result80 = Result79 / Context.MapSimStage12_ProjectPressure.Local.ProjectPressureGrid2D.density;
float2 Result81 = Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity - Result80;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3);
float Constant104 = 0;
float Constant105 = 0;
float Constant106 = 0;
float Constant107 = 0;
float Constant108 = 0;
float Constant109 = 0;
float2 CustomHlsl6277BAEAE8E985AB0714912540859827256FD702Emitter_SimGrid_Func_Output_VelocityOut;
CustomHlsl6277BAEAE8E985AB0714912540859827256FD702Emitter_SimGrid_Func_(Result81, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Boundary, Constant104, Constant105, Constant106, Constant107, Constant108, Constant109, CustomHlsl6277BAEAE8E985AB0714912540859827256FD702Emitter_SimGrid_Func_Output_VelocityOut);
Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.ProjectPressureGrid2D.Velocity = CustomHlsl6277BAEAE8E985AB0714912540859827256FD702Emitter_SimGrid_Func_Output_VelocityOut;
Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage12_ProjectPressure.SetVariables_9E282C7845E37D6B386476BE13A71330.Emitter.SimGrid.Velocity;
float Constant112 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 002/Map Get/Map Get->Module.Interpolation Method"
int Constant113 = 1;
int Result82 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX2;
int LinearToIndex_Emitter_SimGridOutput_IndexY2;
LinearToIndex_Emitter_SimGrid(Result82, LinearToIndex_Emitter_SimGridOutput_IndexX2, LinearToIndex_Emitter_SimGridOutput_IndexY2);
float CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2;
CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.VelocityIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.ScalarIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dt, LinearToIndex_Emitter_SimGridOutput_IndexX2, LinearToIndex_Emitter_SimGridOutput_IndexY2, Constant112, Constant113, CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar = CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2;
float Constant116 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 003/Map Get/Map Get->Module.Interpolation Method"
int Constant117 = 1;
int Result83 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX3;
int LinearToIndex_Emitter_SimGridOutput_IndexY3;
LinearToIndex_Emitter_SimGrid(Result83, LinearToIndex_Emitter_SimGridOutput_IndexX3, LinearToIndex_Emitter_SimGridOutput_IndexY3);
float CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3;
CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.VelocityIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.ScalarIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dt, LinearToIndex_Emitter_SimGridOutput_IndexX3, LinearToIndex_Emitter_SimGridOutput_IndexY3, Constant116, Constant117, CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar = CustomHlsl198136EB1996A34ADBD870CCF82D845C60D0AD23Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3;
float Result84 = In_dt * In_DissipationRate;
float Constant120 = 1;
float Result85 = Result84 + Constant120;
float Result86 = In_FloatValue / Result85;
float Result87 = In_SubtractionAmount * In_dt;
float Result88 = Result86 - Result87;
float Constant121 = 0;
float Constant122 = 1e+09;
float Result89 = clamp(Result88,Constant121,Constant122);
Out_DissipatedFloat = Result89;
float Constant119 = 0;
float DissipateFloat_Fn_Func_Output_DissipatedFloat;
DissipateFloat_Fn_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.dt, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.DissipationRate, Constant119, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.FloatValue, DissipateFloat_Fn_Func_Output_DissipatedFloat, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat.DissipatedFloat = DissipateFloat_Fn_Func_Output_DissipatedFloat;
float Constant124 = 0;
float DissipateFloat_Fn_Func_Output_DissipatedFloat1;
DissipateFloat_Fn_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.dt, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.DissipationRate, Constant124, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.FloatValue, DissipateFloat_Fn_Func_Output_DissipatedFloat1, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat001.DissipatedFloat = DissipateFloat_Fn_Func_Output_DissipatedFloat1;
Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Boundary = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_49366F1C4BCFBA536A86108A2DBB4F43.Transient.Boundary;
Out_Output = In_Density * (In_Boundary < 1e-5);
float CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_Output_Output;
CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary.FloatValue, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary, CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_Output_Output);
Out_Output = CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_Output_Output;
float CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_Output_Output1;
CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary001.FloatValue, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary, CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_Output_Output1);
Out_Output = CustomHlslD60BB0D11D63F60A355B508E6133949E42CF6DC9_Func_Output_Output1;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Density;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Temperature;
float Vy_right;
GetGridValue_Emitter_SimGrid(In_IndexX+1, In_IndexY, In_VectorIndex+1, Vy_right);
float Vy_left;
GetGridValue_Emitter_SimGrid(In_IndexX-1, In_IndexY, In_VectorIndex+1, Vy_left);
float Vx_up;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY+1, In_VectorIndex, Vx_up);
float Vx_down;
GetGridValue_Emitter_SimGrid(In_IndexX, In_IndexY-1, In_VectorIndex, Vx_down);
Out_curl = ((Vy_right-Vy_left) - (Vx_up-Vx_down)) / (2. * In_dx);
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4);
float CustomHlsl9D168E289DC079F182B7B3E4EFEDC1B900CDF148Emitter_SimGrid_Func_Output_curl;
CustomHlsl9D168E289DC079F182B7B3E4EFEDC1B900CDF148Emitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.VectorIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, CustomHlsl9D168E289DC079F182B7B3E4EFEDC1B900CDF148Emitter_SimGrid_Func_Output_curl);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_ComputeCurl.Curl = CustomHlsl9D168E289DC079F182B7B3E4EFEDC1B900CDF148Emitter_SimGrid_Func_Output_curl;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, Context.MapSimStage13_AdvectScalarsandPostSim.ScratchModule_02001.Value);
float Constant128 = 0;
float Constant129 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5);
float4 Output112;
Output112.r = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Red;
Output112.g = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Green;
Output112.b = Constant128;
Output112.a = Constant129;
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Enabled, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, Output112);
GetNumCells_Emitter_LightingGridDownsample(numCellsX, numCellsY);
float2 length = (1.0 / float2(numCellsX, numCellsY))*.85;
float t1 = 0.0;
float t2 = 0.0;
float t3 = 0.0;
float t4 = 0.0;
SampleGrid_Emitter_SimGrid(In_UnitCoordinates.x+length.x,  In_UnitCoordinates.y,  In_HighResAttribute,  t1);
SampleGrid_Emitter_SimGrid(In_UnitCoordinates.x-length.x,  In_UnitCoordinates.y,  In_HighResAttribute,  t2);
SampleGrid_Emitter_SimGrid(In_UnitCoordinates.x,  In_UnitCoordinates.y+length.y,  In_HighResAttribute,  t3);
SampleGrid_Emitter_SimGrid(In_UnitCoordinates.x,  In_UnitCoordinates.y-length.y,  In_HighResAttribute,  t4);
const float temperature = (t1+t2+t3+t4)/4.0;
UnitToIndex_Emitter_LightingGridDownsample(In_UnitCoordinates.xy, IndexX, IndexY);
SetGridValue_Emitter_LightingGridDownsample(IndexX, IndexY, In_LowResAttribute, temperature, Ignore);
int Constant131 = 0;
float2 ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit;
ExecutionIndexToUnit_Emitter_LightingGridDownsample(ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit);
DownsampleSimGrid8AC522E026ABFCB0AD5441007E30492D678622C4Emitter_SimGridEmitter_LightingGridDownsample_Func_(ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit, Context.MapSimStage14_LightingPrePass.Grid2D_DownsampleScalar.HighResolutionAttribute, Constant131, Context);
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform;
GetViewSpaceTransformsGPU_Emitter_CameraQuery(GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform);
float Z;
X = In_WorldDirection.x;
Y = In_WorldDirection.y;
Z = In_WorldDirection.z;
float Constant134 = 0;
float4 Output114;
Output114.x = X;
Output114.y = Y;
Output114.z = Z;
Output114.w = Constant134;
float4 Result90 = mul(Output114,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform);
float Constant135 = 1;
float4 Result91 = Result90 * Constant135;
float X1;
float Y1;
float Z1;
float W;
X1 = Result91.x;
Y1 = Result91.y;
Z1 = Result91.z;
W = Result91.w;
float2 Output115;
Output115.x = X1;
Output115.y = Y1;
float3 Output116;
Output116.x = X1;
Output116.y = Y1;
Output116.z = Z1;
Out_TangentDirectionVector2d = Output115;
Out_TangentDirectionVector = Output116;
GetNumCells_Emitter_SimGrid(numCellsX, numCellsY);
float samples = In_Samples;
float length = In_RayLength / (float)numCellsX;
In_UnitCoordinates.xy = clamp(In_UnitCoordinates.xy,0.0,1.0);
   SampleGrid_Emitter_SimGrid(In_UnitCoordinates.x,  In_UnitCoordinates.y,  In_DensityIndex,  d);
       float2 directionalOffset = In_Direction.xy * length * (.01+i/samples);
       float2 coordinates = In_UnitCoordinates.xy + (directionalOffset) * i/samples;
       SampleGrid_Emitter_SimGrid(coordinates.x,  coordinates.y,  In_DensityIndex,  neighborDensity);
       transmittance *= exp(-neighborDensity *(length/samples)  *In_ShadowDensity *In_RayLength) ;
   Out_Value = clamp(transmittance ,0.0,100000.0);
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform1;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform1;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform1;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform1;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform1;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform1;
GetViewSpaceTransformsGPU_Emitter_CameraQuery(GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform1);
float X2;
float Y2;
float Z2;
X2 = In_WorldDirection.x;
Y2 = In_WorldDirection.y;
Z2 = In_WorldDirection.z;
float Constant140 = 0;
float4 Output117;
Output117.x = X2;
Output117.y = Y2;
Output117.z = Z2;
Output117.w = Constant140;
float4 Result93 = mul(Output117,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform1);
float Constant141 = 1;
float4 Result94 = Result93 * Constant141;
float X3;
float Y3;
float Z3;
float W1;
X3 = Result94.x;
Y3 = Result94.y;
Z3 = Result94.z;
W1 = Result94.w;
float2 Output118;
Output118.x = X3;
Output118.y = Y3;
float3 Output119;
Output119.x = X3;
Output119.y = Y3;
Output119.z = Z3;
Out_TangentDirectionVector2d = Output118;
Out_TangentDirectionVector = Output119;
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y,  0,  multipleScattering);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x+length,  In_UnitCoordinates.y,  0,  ms1);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x-length,  In_UnitCoordinates.y,  0,  ms2);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y+length,  0,  ms3);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y-length,  0,  ms4);
Out_Value = multipleScattering;
float Constant132 = 16;
float Constant133 = 60;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6);
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, IndexToUnit_Emitter_SimGridOutput_Unit);
float2 Output113;
Output113.x = IndexToUnit_Emitter_SimGridOutput_Unit.x;
Output113.y = IndexToUnit_Emitter_SimGridOutput_Unit.y;
float2 Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d;
float3 Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector;
Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_(Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.SunDirection, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector, Context);
float Constant136 = 1;
float Result92 = Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthSun * Constant136;
int Constant137 = 0;
float ComputeLightingSun022AB4701E355EEE4B0E878B1CF8E58C022DDD78Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
ComputeLightingSun022AB4701E355EEE4B0E878B1CF8E58C022DDD78Emitter_SimGridEmitter_SimGrid_Func_(Constant132, Constant133, Output113, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d, Result92, Constant137, Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingSun022AB4701E355EEE4B0E878B1CF8E58C022DDD78Emitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
float Constant138 = 8;
float Constant139 = 32;
float2 Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d;
float3 Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector;
Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_(Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.EnvironmentDirection, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector, Context);
float Constant142 = 1;
float Result95 = Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthEnvironment * Constant142;
int Constant143 = 1;
float ComputeLightingEnvironment970D20B03E3A024CA140270FAC7E87F27DFE02FFEmitter_SimGridEmitter_SimGrid_Func_Output_Value;
ComputeLightingEnvironment970D20B03E3A024CA140270FAC7E87F27DFE02FFEmitter_SimGridEmitter_SimGrid_Func_(Constant138, Constant139, Output113, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Result95, Constant143, Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingEnvironment970D20B03E3A024CA140270FAC7E87F27DFE02FFEmitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
float ComputeLightingTemperature8C8B35B36B6B341754BD0BEBF3A80DBDB57211DDEmitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value;
ComputeLightingTemperature8C8B35B36B6B341754BD0BEBF3A80DBDB57211DDEmitter_SimGridEmitter_LightingGridDownsample_Func_(Output113, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingTemperature8C8B35B36B6B341754BD0BEBF3A80DBDB57211DDEmitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value, Context);
float3 Output120;
Output120.x = ComputeLightingSun022AB4701E355EEE4B0E878B1CF8E58C022DDD78Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output120.y = ComputeLightingEnvironment970D20B03E3A024CA140270FAC7E87F27DFE02FFEmitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output120.z = ComputeLightingTemperature8C8B35B36B6B341754BD0BEBF3A80DBDB57211DDEmitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value;
Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting = Output120;
float X4;
float Y4;
float Z4;
X4 = In_VECTOR_VAR.x;
Y4 = In_VECTOR_VAR.y;
Z4 = In_VECTOR_VAR.z;
float Constant147 = (0.0);
float NiagaraFloat_SelectResult5 = Constant147;
NiagaraFloat_SelectResult5 = X4;
NiagaraFloat_SelectResult5 = Y4;
NiagaraFloat_SelectResult5 = Z4;
Out_Float = NiagaraFloat_SelectResult5;
float SelectV3Channel_Particle_Func_Output_Float;
SelectV3Channel_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.Channel, SelectV3Channel_Particle_Func_Output_Float, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float;
float SelectV3Channel_Particle_Func_Output_Float1;
SelectV3Channel_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.Channel, SelectV3Channel_Particle_Func_Output_Float1, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float1;
float SelectV3Channel_Particle_Func_Output_Float2;
SelectV3Channel_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.Channel, SelectV3Channel_Particle_Func_Output_Float2, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float2;
float Constant150 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7);
float4 Output121;
Output121.r = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Red;
Output121.g = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Green;
Output121.b = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Blue;
Output121.a = Constant150;
SetRenderTargetValue_Emitter_LightingRT_UEImpureCall(Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Enabled, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, Output121);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
//Begin Spawn Script!
//Begin Initialize Parameter Map Defaults
//End Initialize Parameter Map Defaults
//End Spawn Script!
//Handle resetting previous values at the end of spawn so that they match outputs! (Needed for motion blur/etc)
HandlePreviousValuesForSpawn(Context);
// Begin HandleMissingDefaultValues
// End HandleMissingDefaultValues
//Begin Update Script!
RandomCounterDeterministic = 0;
//End Update Script!
//Begin Stage Script: MapSimStage1_Init!
float Constant = 0;
float2 Constant1 = float2(0,0);
EnterStatScope(1 /**SetVariables_81ACE1264B908D5B723D16B4EF93249D_Emitter_Func_*/);
SetVariables_81ACE1264B908D5B723D16B4EF93249D_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_81ACE1264B908D5B723D16B4EF93249D_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage1_Init
//Begin Stage Script: MapSimStage2_RasterizeNDCSourceParticles!
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.SourceUseStreaking"
int Constant4 = 0;
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.SourceUseColor"
int Constant5 = 0;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dt = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.dt;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dx = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.dx;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.WorldToLocal = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.WorldToUnit = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Core = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceCore;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.DensityMult = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceDensityMult;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Falloff = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceFalloff;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.MaxStreakSamples = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceMaxStreakSamples;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.RadiusScale = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.RadiusScale;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.StreakDensity = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceStreakDensity;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.TemperatureMult = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceTemperatureMult;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.UseStreaking = Constant4;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.VelocityMult = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceVelocityMult;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.UseColor = Constant5;
EnterStatScope(2 /**Grid2D_Gas_ParticleScatterSource001_Emitter_Func_*/);
Grid2D_Gas_ParticleScatterSource001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_ParticleScatterSource001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage2_RasterizeNDCSourceParticles
//Begin Stage Script: MapSimStage3_RasterizeSourceParticles!
int Constant12 = 0;
int Constant13 = 0;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Core = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceCore;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.DensityMult = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceDensityMult;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dt = Context.MapSimStage3_RasterizeSourceParticles.Emitter.dt;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dx = Context.MapSimStage3_RasterizeSourceParticles.Emitter.dx;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Falloff = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceFalloff;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.MaxStreakSamples = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceMaxStreakSamples;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.RadiusScale = Context.MapSimStage3_RasterizeSourceParticles.Emitter.RadiusScale;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.SourceIsLocalSpace = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceIsLocalSpace;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.StreakDensity = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceStreakDensity;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.TemperatureMult = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceTemperatureMult;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.UseStreaking = Constant12;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.VelocityMult = Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceVelocityMult;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.WorldToLocal = Context.MapSimStage3_RasterizeSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.WorldToUnit = Context.MapSimStage3_RasterizeSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit;
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.UseColor = Constant13;
EnterStatScope(3 /**Grid2D_Gas_ParticleScatterSource_Emitter_Func_*/);
Grid2D_Gas_ParticleScatterSource_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_ParticleScatterSource_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage3_RasterizeSourceParticles
//Begin Stage Script: MapSimStage4_PreSim!
bool Constant40 = true;
bool Constant41 = false;
bool Constant42 = false;
bool Constant43 = false;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryUp = Constant40;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryRight = Constant41;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryDown = Constant42;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryLeft = Constant43;
float Constant44 = 15;
EnterStatScope(4 /**ComputeBoundaryGrid2D_Emitter_Func_*/);
ComputeBoundaryGrid2D_Emitter_Func_(Context);
ExitStatScope(/**ComputeBoundaryGrid2D_Emitter_Func_*/);
EnterStatScope(5 /**ScratchModule001_Emitter_Func_*/);
ScratchModule001_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule001_Emitter_Func_*/);
Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpDensity = Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Density;
Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpTemperature = Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Temperature;
Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpVelocity = Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Velocity;
EnterStatScope(6 /**SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_*/);
SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_*/);
float ScratchDynamicInput_32_Emitter_Func_Output_Output;
ScratchDynamicInput_32_Emitter_Func_(ScratchDynamicInput_32_Emitter_Func_Output_Output, Context);
float2 ScratchDynamicInput001_Emitter_Func_Output_Output;
ScratchDynamicInput001_Emitter_Func_(ScratchDynamicInput001_Emitter_Func_Output_Output, Context);
float ScratchDynamicInput002_Emitter_Func_Output_Output;
ScratchDynamicInput002_Emitter_Func_(ScratchDynamicInput002_Emitter_Func_Output_Output, Context);
Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Density = ScratchDynamicInput_32_Emitter_Func_Output_Output;
Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Velocity = ScratchDynamicInput001_Emitter_Func_Output_Output;
Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Temperature = ScratchDynamicInput002_Emitter_Func_Output_Output;
EnterStatScope(7 /**SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_*/);
SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_*/);
Context.MapSimStage4_PreSim.SetVariables_9A5606CD480032B7102900A8757C50F2.Emitter.SimGrid.Boundary = Context.MapSimStage4_PreSim.OUTPUT_VAR.ComputeBoundaryGrid2D.Boundary;
EnterStatScope(8 /**SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_*/);
SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.dx = Context.MapSimStage4_PreSim.Emitter.dx;
Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.ScalarIndex = Context.MapSimStage4_PreSim.Emitter.SimGrid_SimFloatIndex;
EnterStatScope(9 /**Grid2D_ComputeGradient001_Emitter_Func_*/);
Grid2D_ComputeGradient001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeGradient001_Emitter_Func_*/);
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.dx = Context.MapSimStage4_PreSim.Emitter.dx;
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.GradCurl = Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad;
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.VorticityMult = Context.MapSimStage4_PreSim.Emitter.fluids_solver_vorticityConfinement;
float2 Constant49 = float2(0,0);
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Constant49;
EnterStatScope(10 /**VorticityConfinementForceGrid2D_Emitter_Func_*/);
VorticityConfinementForceGrid2D_Emitter_Func_(Context);
ExitStatScope(/**VorticityConfinementForceGrid2D_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Multiply_Float001.B = Context.MapSimStage4_PreSim.Emitter.fluids_solver_densityBouyancy;
Context.MapSimStage4_PreSim.Multiply_Float008.B = Context.MapSimStage4_PreSim.Emitter.fluids_solver_temperatureBouyancy;
float Constant50 = 1;
float Multiply_Float001_Emitter_Func_Output_Result;
Multiply_Float001_Emitter_Func_(Multiply_Float001_Emitter_Func_Output_Result, Context);
float Constant52 = -1;
float Multiply_Float008_Emitter_Func_Output_Result;
Multiply_Float008_Emitter_Func_(Multiply_Float008_Emitter_Func_Output_Result, Context);
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.DensityBuoyancy = Multiply_Float001_Emitter_Func_Output_Result;
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.g = Context.MapSimStage4_PreSim.Emitter.g;
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy = Multiply_Float008_Emitter_Func_Output_Result;
float3 Constant54 = float3(0,0,0);
Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld = Constant54;
EnterStatScope(11 /**Grid2D_Gas_3DBuoyancy_Emitter_Func_*/);
Grid2D_Gas_3DBuoyancy_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_3DBuoyancy_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_TurbulenceForce.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
float Constant55 = 1;
float Constant56 = 1;
float Constant57 = 1;
EnterStatScope(12 /**Grid2D_TurbulenceForce_Emitter_Func_*/);
Grid2D_TurbulenceForce_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_TurbulenceForce_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_WindForce.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.MapSimStage4_PreSim.Grid2D_WindForce.dx = Context.MapSimStage4_PreSim.Emitter.dx;
float3 Constant62 = float3(1,1,0);
float Constant63 = 0.2;
EnterStatScope(13 /**Grid2D_WindForce_Emitter_Func_*/);
Grid2D_WindForce_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_WindForce_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.Velocity = Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity;
Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.dt = Context.MapSimStage4_PreSim.Emitter.dt;
Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.WorldToLocal = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.LocalToWorldRotation;
EnterStatScope(14 /**Grid2D_IntegrateForces_Emitter_Func_*/);
Grid2D_IntegrateForces_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_IntegrateForces_Emitter_Func_*/);
Context.MapSimStage4_PreSim.SetVariables_C54322844BB05B548FF0B8B0DC931DEE.Emitter.SimGrid.Velocity = Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_IntegrateForces.NewVelocity;
EnterStatScope(15 /**SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_*/);
SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage4_PreSim
//Begin Stage Script: MapSimStage5_AdvectVelocity!
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.VelocityInterpolationMethod"
int Constant71 = 1;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dx = Context.MapSimStage5_AdvectVelocity.Emitter.dx;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.ScalarIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.VelocityIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.InterpolationMethod = Constant71;
float Constant72 = 1;
EnterStatScope(16 /**Grid2D_AdvectScalar_Emitter_Func_*/);
Grid2D_AdvectScalar_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.Add_Integer001.A = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
int Constant75 = 1;
int Add_Integer001_Emitter_Func_Output_NewOutput;
Add_Integer001_Emitter_Func_(Add_Integer001_Emitter_Func_Output_NewOutput, Context);
int Constant77 = 1;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dx = Context.MapSimStage5_AdvectVelocity.Emitter.dx;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.ScalarIndex = Add_Integer001_Emitter_Func_Output_NewOutput;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.VelocityIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.InterpolationMethod = Constant77;
float Constant78 = 1;
EnterStatScope(17 /**Grid2D_AdvectScalar001_Emitter_Func_*/);
Grid2D_AdvectScalar001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar001_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.BreakVector2D.X = Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar.AdvectedScalar;
Context.MapSimStage5_AdvectVelocity.BreakVector2D.Y = Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar001.AdvectedScalar;
float2 BreakVector2D_Emitter_Func_Output_Vec2;
BreakVector2D_Emitter_Func_(BreakVector2D_Emitter_Func_Output_Vec2, Context);
Context.MapSimStage5_AdvectVelocity.SetVariables_47EB198B4D26ACB745967FA215BE495B.Emitter.SimGrid.Velocity = BreakVector2D_Emitter_Func_Output_Vec2;
EnterStatScope(18 /**SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_*/);
SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.DissipateVector2D.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.DissipateVector2D.DissipationRate = Context.MapSimStage5_AdvectVelocity.Emitter.fluids_solver_velocityDissipation;
Context.MapSimStage5_AdvectVelocity.DissipateVector2D.VectorValue = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity;
EnterStatScope(19 /**DissipateVector2D_Emitter_Func_*/);
DissipateVector2D_Emitter_Func_(Context);
ExitStatScope(/**DissipateVector2D_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.ScratchModule_06.Velocity = Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.DissipateVector2D.DissipatedVector2D;
EnterStatScope(20 /**ScratchModule_06_Emitter_Func_*/);
ScratchModule_06_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_06_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage5_AdvectVelocity
//Begin Stage Script: MapSimStage6_ComputeDivergence!
Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.dx = Context.MapSimStage6_ComputeDivergence.Emitter.dx;
Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.VectorIndex = Context.MapSimStage6_ComputeDivergence.Emitter.SimGrid_VelocityIndex;
EnterStatScope(21 /**Grid2D_ComputeDivergence_Emitter_Func_*/);
Grid2D_ComputeDivergence_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeDivergence_Emitter_Func_*/);
Context.MapSimStage6_ComputeDivergence.SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118.Emitter.TemporaryGrid.SimFloat = Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div;
EnterStatScope(22 /**SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_*/);
SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_*/);
Context.MapSimStage6_ComputeDivergence.ScratchModule_04.Div = Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div;
Context.MapSimStage6_ComputeDivergence.ScratchModule_04.dt = Context.MapSimStage6_ComputeDivergence.Emitter.dt;
EnterStatScope(23 /**ScratchModule_04_Emitter_Func_*/);
ScratchModule_04_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_04_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage6_ComputeDivergence
//Begin Stage Script: MapSimStage7_SolvePressure!
EnterStatScope(24 /**GetDivergence_Emitter_Func_*/);
GetDivergence_Emitter_Func_(Context);
ExitStatScope(/**GetDivergence_Emitter_Func_*/);
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dt = Context.MapSimStage7_SolvePressure.Emitter.dt;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dx = Context.MapSimStage7_SolvePressure.Emitter.dx;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Divergence = Context.MapSimStage7_SolvePressure.Transient.Divergence;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Relaxation = Context.MapSimStage7_SolvePressure.Emitter.fluids_solver_pressureRelaxation;
EnterStatScope(25 /**Grid2D_PressureIteration_Emitter_Func_*/);
Grid2D_PressureIteration_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_PressureIteration_Emitter_Func_*/);
Context.MapSimStage7_SolvePressure.SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91.Emitter.PressureGrid.Pressure = Context.MapSimStage7_SolvePressure.OUTPUT_VAR.Grid2D_PressureIteration.Pressure;
EnterStatScope(26 /**SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_*/);
SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage7_SolvePressure
//Begin Stage Script: MapSimStage8_SolvePressureASC40SinFFTinYASC41!
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.dx = Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Emitter.dx;
bool Constant90 = false;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.XDirecton = Constant90;
bool Constant91 = false;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.Inverse = Constant91;
bool Constant92 = true;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.bPoissonSolver = Constant92;
EnterStatScope(27 /**Grid2D_ComputeFFT_Emitter_Func_*/);
Grid2D_ComputeFFT_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage8_SolvePressureASC40SinFFTinYASC41
//Begin Stage Script: MapSimStage9_SolvePressureASC40SinFFTinXASC41!
bool Constant93 = true;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.dx = Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Emitter.dx;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.XDirecton = Constant93;
bool Constant94 = false;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.Inverse = Constant94;
bool Constant95 = true;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.bPoissonSolver = Constant95;
EnterStatScope(28 /**Grid2D_ComputeFFT001_Emitter_Func_*/);
Grid2D_ComputeFFT001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage9_SolvePressureASC40SinFFTinXASC41
//Begin Stage Script: MapSimStage10_SolvePressureASC40InvSinFFTinXASC41!
bool Constant96 = true;
bool Constant97 = true;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.dx = Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Emitter.dx;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.Inverse = Constant96;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.XDirecton = Constant97;
bool Constant98 = true;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.bPoissonSolver = Constant98;
EnterStatScope(29 /**Grid2D_ComputeFFT002_Emitter_Func_*/);
Grid2D_ComputeFFT002_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT002_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage10_SolvePressureASC40InvSinFFTinXASC41
//Begin Stage Script: MapSimStage11_SolvePressureASC40InvSinFFTinYASC41!
bool Constant99 = true;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.dx = Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Emitter.dx;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.Inverse = Constant99;
bool Constant100 = false;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.XDirecton = Constant100;
bool Constant101 = true;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.bPoissonSolver = Constant101;
EnterStatScope(30 /**Grid2D_ComputeFFT003_Emitter_Func_*/);
Grid2D_ComputeFFT003_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT003_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage11_SolvePressureASC40InvSinFFTinYASC41
//Begin Stage Script: MapSimStage12_ProjectPressure!
Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.dx = Context.MapSimStage12_ProjectPressure.Emitter.dx;
Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.ScalarIndex = Context.MapSimStage12_ProjectPressure.Emitter.PressureGrid_PressureIndex;
EnterStatScope(31 /**Grid2D_ComputeGradient_Emitter_Func_*/);
Grid2D_ComputeGradient_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeGradient_Emitter_Func_*/);
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.dt = Context.MapSimStage12_ProjectPressure.Emitter.dt;
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.PressureGradient = Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.Grid2D_ComputeGradient.Grad;
float Constant102 = 1;
Context.MapSimStage12_ProjectPressure.Local.ProjectPressureGrid2D.density = Constant102;
EnterStatScope(32 /**ProjectPressureGrid2D_Emitter_Func_*/);
ProjectPressureGrid2D_Emitter_Func_(Context);
ExitStatScope(/**ProjectPressureGrid2D_Emitter_Func_*/);
Context.MapSimStage12_ProjectPressure.SetVariables_9E282C7845E37D6B386476BE13A71330.Emitter.SimGrid.Velocity = Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.ProjectPressureGrid2D.Velocity;
EnterStatScope(33 /**SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_*/);
SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage12_ProjectPressure
//Begin Stage Script: MapSimStage13_AdvectScalarsandPostSim!
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.ScalarInterpolationMethod"
int Constant110 = 1;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.ScalarIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_DensityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.VelocityIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.InterpolationMethod = Constant110;
float Constant111 = 1;
EnterStatScope(34 /**Grid2D_AdvectScalar002_Emitter_Func_*/);
Grid2D_AdvectScalar002_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar002_Emitter_Func_*/);
int Constant114 = 1;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.ScalarIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_TemperatureIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.VelocityIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.InterpolationMethod = Constant114;
float Constant115 = 1;
EnterStatScope(35 /**Grid2D_AdvectScalar003_Emitter_Func_*/);
Grid2D_AdvectScalar003_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar003_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.DissipationRate = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationDensity;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar;
float Constant118 = 0;
EnterStatScope(36 /**DissipateFloat_Emitter_Func_*/);
DissipateFloat_Emitter_Func_(Context);
ExitStatScope(/**DissipateFloat_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.DissipationRate = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationTemperature;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar;
float Constant123 = 0;
EnterStatScope(37 /**DissipateFloat001_Emitter_Func_*/);
DissipateFloat001_Emitter_Func_(Context);
ExitStatScope(/**DissipateFloat001_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_49366F1C4BCFBA536A86108A2DBB4F43.Transient.Boundary = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary;
EnterStatScope(38 /**SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_*/);
SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat.DissipatedFloat;
Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary001.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat001.DissipatedFloat;
float MaskFloatByBoundary_Emitter_Func_Output_Output;
MaskFloatByBoundary_Emitter_Func_(MaskFloatByBoundary_Emitter_Func_Output_Output, Context);
float MaskFloatByBoundary001_Emitter_Func_Output_Output;
MaskFloatByBoundary001_Emitter_Func_(MaskFloatByBoundary001_Emitter_Func_Output_Output, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Density = MaskFloatByBoundary_Emitter_Func_Output_Output;
Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Temperature = MaskFloatByBoundary001_Emitter_Func_Output_Output;
EnterStatScope(39 /**SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_*/);
SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.VectorIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
EnterStatScope(40 /**Grid2D_ComputeCurl_Emitter_Func_*/);
Grid2D_ComputeCurl_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeCurl_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.ScratchModule_02001.Value = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_ComputeCurl.Curl;
EnterStatScope(41 /**ScratchModule_02001_Emitter_Func_*/);
ScratchModule_02001_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_02001_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Red = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Green = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature;
float Constant125 = 0;
float Constant126 = 0;
bool Constant127 = true;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Enabled = Constant127;
EnterStatScope(42 /**Grid2D_Gas_SetRTValues_Emitter_Func_*/);
Grid2D_Gas_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_SetRTValues_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_AdvectScalarsandPostSim
//Begin Stage Script: MapSimStage14_LightingPrePass!
Context.MapSimStage14_LightingPrePass.Grid2D_DownsampleScalar.HighResolutionAttribute = Context.MapSimStage14_LightingPrePass.Emitter.SimGrid_TemperatureIndex;
int Constant130 = 0;
EnterStatScope(43 /**Grid2D_DownsampleScalar_Emitter_Func_*/);
Grid2D_DownsampleScalar_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_DownsampleScalar_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_LightingPrePass
//Begin Stage Script: MapSimStage15_ComputeLighting!
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.SunDirection = Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_sunDirection;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.EnvironmentDirection = Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_environmentDirection;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthEnvironment = Context.MapSimStage15_ComputeLighting.Emitter.ShadowDensityMult;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthSun = Context.MapSimStage15_ComputeLighting.Emitter.ShadowDensityMult;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex = Context.MapSimStage15_ComputeLighting.Emitter.SimGrid_DensityIndex;
EnterStatScope(44 /**Grid2D_ComputeLighting_Emitter_Func_*/);
Grid2D_ComputeLighting_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeLighting_Emitter_Func_*/);
int Constant144 = 1;
int Constant145 = 2;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.Channel = Constant144;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.Channel = Constant145;
int Constant146 = 0;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.Channel = Constant146;
float MakeFloatFromVector_Emitter_Func_Output_Float;
MakeFloatFromVector_Emitter_Func_(MakeFloatFromVector_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector001_Emitter_Func_Output_Float;
MakeFloatFromVector001_Emitter_Func_(MakeFloatFromVector001_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector002_Emitter_Func_Output_Float;
MakeFloatFromVector002_Emitter_Func_(MakeFloatFromVector002_Emitter_Func_Output_Float, Context);
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Red = MakeFloatFromVector_Emitter_Func_Output_Float;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Green = MakeFloatFromVector001_Emitter_Func_Output_Float;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Blue = MakeFloatFromVector002_Emitter_Func_Output_Float;
float Constant148 = 0;
bool Constant149 = true;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Enabled = Constant149;
EnterStatScope(45 /**Grid2D_Gas_SetRTValues001_Emitter_Func_*/);
Grid2D_Gas_SetRTValues001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_SetRTValues001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage15_ComputeLighting
int2 Emitter_SimGrid_NumCells;
float2 Emitter_SimGrid_UnitToUV;
float2 Emitter_SimGrid_CellSize;
float2 Emitter_SimGrid_WorldBBoxSize;
Texture2DArray<float> Emitter_SimGrid_Grid;
RWTexture2DArray<float> Emitter_SimGrid_OutputGrid;
SamplerState Emitter_SimGrid_GridSampler;
int4 Emitter_SimGrid_AttributeIndices[5];
int Emitter_SimGrid_NumAttributes;
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
const float2 GridPos = UVW.xy * Emitter_SimGrid_NumCells.xy - .5;
// identify the lower-left-hand corner of the cell
const int2 GridCell = floor(GridPos);
const int2 MaxCell = Emitter_SimGrid_NumCells - int2(3,3);
// revert to bilinear hardware sampling at the boundary cells.
return Emitter_SimGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float2 t = frac(GridPos);
float4 GridVals;
float minv = 3.402823466e+38;
float maxv = -3.402823466e+38;
float4 InterpInX;
for (int j = 0; j < 4; ++j)
for (int i = 0; i < 4; ++i)
const float CurrValue = Emitter_SimGrid_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
GridVals[i] = CurrValue;
minv = min(CurrValue, minv);
maxv = max(CurrValue, maxv);
InterpInX[j] = Basic1DCubic_Emitter_SimGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_SimGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return BiCubicValue;
const int2 MaxCell = Emitter_SimGrid_NumCells - int2(2,2);
const float2 t = GridPos - GridCell;
InterpInX[j] = Monotonic1DCubic_Emitter_SimGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Monotonic1DCubic_Emitter_SimGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return Basic2DCubic_Emitter_SimGrid(Sampler, UVW, MipLevel);
int2 Emitter_SourceGrid_NumCells;
float2 Emitter_SourceGrid_UnitToUV;
float2 Emitter_SourceGrid_CellSize;
float2 Emitter_SourceGrid_WorldBBoxSize;
Texture2DArray<float> Emitter_SourceGrid_Grid;
RWTexture2DArray<float> Emitter_SourceGrid_OutputGrid;
SamplerState Emitter_SourceGrid_GridSampler;
int4 Emitter_SourceGrid_AttributeIndices[3];
int Emitter_SourceGrid_NumAttributes;
const float2 GridPos = UVW.xy * Emitter_SourceGrid_NumCells.xy - .5;
const int2 MaxCell = Emitter_SourceGrid_NumCells - int2(3,3);
return Emitter_SourceGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float CurrValue = Emitter_SourceGrid_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
InterpInX[j] = Basic1DCubic_Emitter_SourceGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_SourceGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
const int2 MaxCell = Emitter_SourceGrid_NumCells - int2(2,2);
InterpInX[j] = Monotonic1DCubic_Emitter_SourceGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Monotonic1DCubic_Emitter_SourceGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return Basic2DCubic_Emitter_SourceGrid(Sampler, UVW, MipLevel);
//Offset of each parameter accessed by this script.
//Indices for accessing this table are embeded directly into the HLSL and we generate the table on the CPU accordingly.
//TODO: Can probably pack this into a single global buffer rather than one per DI.
Buffer<uint> Emitter_NDCParticleSource_ParamOffsetTable;
int Emitter_NDCParticleSource_ParameterOffsetTableIndex;
int Emitter_NDCParticleSource_FloatStride;
int Emitter_NDCParticleSource_Int32Stride;
//TODO: Half Support | int Emitter_NDCParticleSource_HalfStride;
// Outputs the starting offset of each component in the channel data for a partiuclar parameter.
bool GetParameterLayoutInfo_Emitter_NDCParticleSource(uint ParameterIndex, out uint OutFloatRegister, out uint OutInt32Register)//TODO: Half Support | , out uint OutHalfRegister)
int ParameterTableStart = Emitter_NDCParticleSource_ParameterOffsetTableIndex;
const int NumComponents = 2;
uint ParamLayoutStart = ParameterTableStart + NumComponents * ParameterIndex;
OutFloatRegister = Emitter_NDCParticleSource_ParamOffsetTable[ParamLayoutStart];
OutInt32Register = Emitter_NDCParticleSource_ParamOffsetTable[ParamLayoutStart + 1];
//TODO: Half Support | OutHalfRegister = Emitter_NDCParticleSource_ParamOffsetTable[ParamLayoutStart + 2];
return OutFloatRegister != -1 || OutInt32Register != -1;//If we have no valid mappings then this parameter is not valid.
OutFloatRegister = -1;
OutInt32Register = -1;
//TODO: Half Support | OutHalfRegister = -1;
return false;
Buffer<float> Emitter_NDCParticleSource_DataFloat;
Buffer<int> Emitter_NDCParticleSource_DataInt32;
//TODO: Half Support | Buffer<half> Emitter_NDCParticleSource_DataHalf;
//Instance count offset for the buffer we're reading.
//Must be done via an instance count slot as data can come from CPU and GPU.
int Emitter_NDCParticleSource_InstanceCountOffset;
//Instance count offset for tracking consume calls.
int Emitter_NDCParticleSource_ConsumeInstanceCountOffset;
int Emitter_NDCParticleSource_BufferSize;
int Emitter_NDCParticleSource_NDCElementCountAtSpawn;
//Buffer containing back mapping from spawn particle exec index to the NDC index that spawned that particle.
//Arraged into power of two buckets so that we can avoid an entry per particle.
Buffer<int> Emitter_NDCParticleSource_NDCSpawnDataBuffer;
//Helper struct with various info needed for reading that can be passed around more easily in generated code.
bool bValidParameter;
bool bValidReadIndex;
//Index at which to read data.
int ReadIndex;
//Component start offests for the current parameter.
int ParameterComponentStart_Float;
int ParameterComponentStart_Int32;
//TODO: Half Support | int ParameterComponentStart_Half;
//Current registe indices for each of the GPU write buffers
int Register_Float;
int Register_Int32;
//TODO: Half Support | int Register_Half;
int GetFloatStride() { return Emitter_NDCParticleSource_FloatStride; }
int GetIntStride() { return Emitter_NDCParticleSource_Int32Stride; }
//TODO: Half Support | int GetHalfStride() { return Emitter_NDCParticleSource_HalfStride; }
Buffer<float> GetBuffer_Float() { return Emitter_NDCParticleSource_DataFloat; }
Buffer<int> GetBuffer_Int32() { return Emitter_NDCParticleSource_DataInt32; }
//TODO: Half Support | Buffer<half> GetBuffer_Half() { return Emitter_NDCParticleSource_DataHalf; }
//Instance count used for the written number of elements in the NDC buffers.
int GetInstanceCountOffset() { return Emitter_NDCParticleSource_InstanceCountOffset; }
//Instance count used to get a read index when calling Consume().
int GetConsumeInstanceCountOffset() { return Emitter_NDCParticleSource_ConsumeInstanceCountOffset; }
//Return the actual buffer size allocated.
int GetBufferSize() { return Emitter_NDCParticleSource_BufferSize; }
//Actual number of NDC items in the buffers. Must come from an indirect instance count instead of a uniform as the GPU could have written to this buffer.
int Num() { return RWInstanceCounts[ GetInstanceCountOffset() ]; }
//TODO: Add GS and Wave op path to reduce atomic contention.
//TODO: Right now doing the simple dumb thing.
int OutIndex = -1;
uint OrigVal = 0;
InterlockedAdd(RWInstanceCounts[GetConsumeInstanceCountOffset()], 1U, OrigVal);
int MaxSize = min(Num(), GetBufferSize());
OutIndex = (int)OrigVal;
OutIndex = -1;
InterlockedMin(RWInstanceCounts[GetConsumeInstanceCountOffset()], (uint)MaxSize);
return OutIndex;
ReadIndex = InReadIndex;
bValidReadIndex = ReadIndex >= 0 && ReadIndex < Num() && ReadIndex < GetBufferSize();
return bValidReadIndex;
ReadIndex = GetConsumeIndex();
bValidParameter = GetParameterLayoutInfo_Emitter_NDCParticleSource(ParameterIndex, ParameterComponentStart_Float, ParameterComponentStart_Int32);//TODO: Half Support | ParameterComponentStart_Half);
Register_Float = ParameterComponentStart_Float;
Register_Int32 = ParameterComponentStart_Int32;
//TODO: Half Support | Register_Half = ParameterComponentStart_Half;
return bValidParameter;
void Read_Float(out float Value){ NiagaraDataChannelRead_Float(GetBuffer_Float(), GetFloatStride(), Register_Float, ReadIndex, Value); }
void Read_Float(out float2 Value){ NiagaraDataChannelRead_Float(GetBuffer_Float(), GetFloatStride(), Register_Float, ReadIndex, Value); }
void Read_Float(out float3 Value){ NiagaraDataChannelRead_Float(GetBuffer_Float(), GetFloatStride(), Register_Float, ReadIndex, Value); }
void Read_Float(out float4 Value){ NiagaraDataChannelRead_Float(GetBuffer_Float(), GetFloatStride(), Register_Float, ReadIndex, Value); }
void Read_Int32(out int Value){ NiagaraDataChannelRead_Int32(GetBuffer_Int32(), GetIntStride(), Register_Int32, ReadIndex, Value); }
void Read_Int32(out int2 Value){ NiagaraDataChannelRead_Int32(GetBuffer_Int32(), GetIntStride(), Register_Int32, ReadIndex, Value); }
void Read_Int32(out int3 Value){ NiagaraDataChannelRead_Int32(GetBuffer_Int32(), GetIntStride(), Register_Int32, ReadIndex, Value); }
void Read_Int32(out int4 Value){ NiagaraDataChannelRead_Int32(GetBuffer_Int32(), GetIntStride(), Register_Int32, ReadIndex, Value); }
void Read_Bool(out bool Value){ NiagaraDataChannelRead_Bool(GetBuffer_Int32(), GetIntStride(), Register_Int32, ReadIndex, Value); }
//TODO: Half Support | void Read_Half(out half Value){ NiagaraDataChannelRead_Half(GetBuffer_Half(), GetHalfStride(), Register_Half, ReadIndex, Value); }
//TODO: Half Support | void Read_Half(out half2 Value){ NiagaraDataChannelRead_Half(GetBuffer_Half(), GetHalfStride(), Register_Half, ReadIndex, Value); }
//TODO: Half Support | void Read_Half(out half3 Value){ NiagaraDataChannelRead_Half(GetBuffer_Half(), GetHalfStride(), Register_Half, ReadIndex, Value); }
//TODO: Half Support | void Read_Half(out half4 Value){ NiagaraDataChannelRead_Half(GetBuffer_Half(), GetHalfStride(), Register_Half, ReadIndex, Value); }
OutNum = RWInstanceCounts[Emitter_NDCParticleSource_InstanceCountOffset];
OutNum = 0;
OutNDCIndex = -1;
OutNDCSpawnIndex = -1;
OutNDCSpawnCount = -1;
return;
uint ExecIdx = (uint)InExecIndex;
int NumNDCEntries = Emitter_NDCParticleSource_NDCElementCountAtSpawn;
//First part of the buffer is the per emitter offsets into the data.
//Grab the right base offset for this emitter.
uint NDCSpawnDataOffset = Emitter_NDCParticleSource_NDCSpawnDataBuffer[InEmitterID.ID];
OutNDCSpawnCount = 0;
uint NDCSpawnData_BucketSizeStart = NDCSpawnDataOffset;
uint NDCSpawnData_NDCCountsStart = NDCSpawnData_BucketSizeStart + 16;
uint NDCSPawnData_NDCIndexBucketsStart = NDCSpawnData_NDCCountsStart + NumNDCEntries;
uint MaxBucketExecIndex = 0;
uint BucketEntryStart = NDCSPawnData_NDCIndexBucketsStart;
for(int BucketIdx = 0; BucketIdx < 16; ++BucketIdx)
uint BucketSize = (1U << 15U) >> BucketIdx;
uint NumEntriesInBucket = Emitter_NDCParticleSource_NDCSpawnDataBuffer[NDCSpawnData_BucketSizeStart + BucketIdx];
uint MinBucketExecIndex = MaxBucketExecIndex; 
MaxBucketExecIndex += BucketSize * NumEntriesInBucket;
//We found our bucket.
//Find our NDC entry. There is one entry for each bucket load of instances. So we divide our current adjusted exec index in this bucket by the bucket size.
//As buckets are power of 2 we can do this faster by just shifting down.
uint NDCIndexEntry = (ExecIdx - MinBucketExecIndex) >> (15U - BucketIdx);
OutNDCIndex = Emitter_NDCParticleSource_NDCSpawnDataBuffer[BucketEntryStart + NDCIndexEntry];
break;
BucketEntryStart += NumEntriesInBucket;
//Pull the NDC Spawn count from the first part of the buffer.
OutNDCSpawnCount = Emitter_NDCParticleSource_NDCSpawnDataBuffer[NDCSpawnData_NDCCountsStart + OutNDCIndex];
//Do another pass to calculate our SpawnIndex for this NDC within the total count for this NDC.
OutNDCSpawnIndex = 0;
MaxBucketExecIndex = 0;
uint Count = OutNDCSpawnCount;
uint Mask = (0xFFFFU >> (BucketIdx + 1U));
uint CountMasked = Count & ~Mask;
Count &= Mask;
uint NumNDCEntriesInBucket = CountMasked >> (15U - BucketIdx);
uint NumNDCInstancesInBucket = NumNDCEntriesInBucket * BucketSize;
uint MinBucketExecIndex = MaxBucketExecIndex;
uint MinNDCBucketExecIndex = MinBucketExecIndex + (BucketSize * NDCIndexEntry);
OutNDCSpawnIndex += (ExecIdx - MinNDCBucketExecIndex);
OutNDCSpawnIndex += NumNDCInstancesInBucket;
Context.Read_Float(Color);
bSuccess = false;
Context.Read_Float(Density);
Context.Read_Float(Divergence);
Context.Read_Float(Position);
Context.Read_Float(PreviousRadius);
Context.Read_Float(Radius);
Context.Read_Float(Temperature);
Context.Read_Float(Velocity);
//Default outputs in case of failure.
Color = float4(1.0, 1.0, 1.0, 1.0);
Density = (0.0);
Divergence = (0.0);
Position = float3(0.0, 0.0, 0.0);
PreviousRadius = (0.0);
Radius = (0.0);
Temperature = (0.0);
Velocity = float3(0.0, 0.0, 0.0);
bOutSuccess = false;
FNDCAccessContext_Emitter_NDCParticleSource Context;
bOutSuccess = true;
//This is generated in the DI Cpp depending on the function parameters.
Read_Position_Emitter_NDCParticleSource(Context, bOutSuccess, Position);
Read_Velocity_Emitter_NDCParticleSource(Context, bOutSuccess, Velocity);
Read_Radius_Emitter_NDCParticleSource(Context, bOutSuccess, Radius);
Read_PreviousRadius_Emitter_NDCParticleSource(Context, bOutSuccess, PreviousRadius);
Read_Density_Emitter_NDCParticleSource(Context, bOutSuccess, Density);
Read_Temperature_Emitter_NDCParticleSource(Context, bOutSuccess, Temperature);
Read_Divergence_Emitter_NDCParticleSource(Context, bOutSuccess, Divergence);
Read_Color_Emitter_NDCParticleSource(Context, bOutSuccess, Color);
Emitter_ParticleSource_IsLocalSpace;int
Emitter_ParticleSource_NumSpawnedParticles;int
Emitter_ParticleSource_SpawnedParticlesAcquireTag;uint
Emitter_ParticleSource_InstanceCountOffset;uint
Emitter_ParticleSource_ParticleStrideFloat;uint
Emitter_ParticleSource_ParticleStrideInt;uint
Emitter_ParticleSource_ParticleStrideHalf;int
Emitter_ParticleSource_AcquireTagRegisterIndex;Buffer<int>
Emitter_ParticleSource_SpawnedIDsBuffer;Buffer<int>
Emitter_ParticleSource_IDToIndexTable;Buffer<float>
Emitter_ParticleSource_InputFloatBuffer;Buffer<int>
Emitter_ParticleSource_InputIntBuffer;Buffer<half>
Emitter_ParticleSource_InputHalfBuffer;int4
Emitter_ParticleSource_AttributeIndices[2];int4
Emitter_ParticleSource_AttributeCompressed[2];// Copyright Epic Games, Inc. All Rights Reserved.
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
int2 Emitter_TemporaryGrid_NumCells;
float2 Emitter_TemporaryGrid_UnitToUV;
float2 Emitter_TemporaryGrid_CellSize;
float2 Emitter_TemporaryGrid_WorldBBoxSize;
Texture2DArray<float> Emitter_TemporaryGrid_Grid;
RWTexture2DArray<float> Emitter_TemporaryGrid_OutputGrid;
SamplerState Emitter_TemporaryGrid_GridSampler;
int4 Emitter_TemporaryGrid_AttributeIndices[1];
int Emitter_TemporaryGrid_NumAttributes;
const float2 GridPos = UVW.xy * Emitter_TemporaryGrid_NumCells.xy - .5;
const int2 MaxCell = Emitter_TemporaryGrid_NumCells - int2(3,3);
return Emitter_TemporaryGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float CurrValue = Emitter_TemporaryGrid_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
InterpInX[j] = Basic1DCubic_Emitter_TemporaryGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_TemporaryGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
const int2 MaxCell = Emitter_TemporaryGrid_NumCells - int2(2,2);
InterpInX[j] = Monotonic1DCubic_Emitter_TemporaryGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Monotonic1DCubic_Emitter_TemporaryGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return Basic2DCubic_Emitter_TemporaryGrid(Sampler, UVW, MipLevel);
int2 Emitter_PressureGrid_NumCells;
float2 Emitter_PressureGrid_UnitToUV;
float2 Emitter_PressureGrid_CellSize;
float2 Emitter_PressureGrid_WorldBBoxSize;
Texture2DArray<float> Emitter_PressureGrid_Grid;
RWTexture2DArray<float> Emitter_PressureGrid_OutputGrid;
SamplerState Emitter_PressureGrid_GridSampler;
int4 Emitter_PressureGrid_AttributeIndices[2];
int Emitter_PressureGrid_NumAttributes;
const float2 GridPos = UVW.xy * Emitter_PressureGrid_NumCells.xy - .5;
const int2 MaxCell = Emitter_PressureGrid_NumCells - int2(3,3);
return Emitter_PressureGrid_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float CurrValue = Emitter_PressureGrid_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
InterpInX[j] = Basic1DCubic_Emitter_PressureGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_PressureGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
const int2 MaxCell = Emitter_PressureGrid_NumCells - int2(2,2);
InterpInX[j] = Monotonic1DCubic_Emitter_PressureGrid(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Monotonic1DCubic_Emitter_PressureGrid(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return Basic2DCubic_Emitter_PressureGrid(Sampler, UVW, MipLevel);
Emitter_SimRT_TextureSize;
Emitter_SimRT_MipLevels;
Emitter_SimRT_RWTexture;
Emitter_SimRT_Texture;
Emitter_SimRT_TextureSampler;
Emitter_SimRT_RWTexture[int2(IndexX, IndexY)] = Value;
Value = Emitter_SimRT_Texture.Load(int3(IndexX, IndexY, 0));
Value = Emitter_SimRT_Texture.Load(int3(IndexX, IndexY, MipLevel));
Value = Emitter_SimRT_Texture.SampleLevel(Emitter_SimRT_TextureSampler, UV, MipLevel);
Width = Emitter_SimRT_TextureSize.x;
Height = Emitter_SimRT_TextureSize.y;
OutMipLevels = Emitter_SimRT_MipLevels;
IndexX = Linear % Emitter_SimRT_TextureSize.x;
IndexY = Linear / Emitter_SimRT_TextureSize.x;
LinearToIndex_Emitter_SimRT(ExecIndex(), IndexX, IndexY);
int2 Texel;
LinearToIndex_Emitter_SimRT(ExecIndex(), Texel.x, Texel.y);
Unit.x = (float(Texel.x) + 0.5f) / float(Emitter_SimRT_TextureSize.x);
Unit.y = (float(Texel.y) + 0.5f) / float(Emitter_SimRT_TextureSize.y);
int2 Emitter_LightingGridDownsample_NumCells;
float2 Emitter_LightingGridDownsample_UnitToUV;
float2 Emitter_LightingGridDownsample_CellSize;
float2 Emitter_LightingGridDownsample_WorldBBoxSize;
Texture2DArray<float> Emitter_LightingGridDownsample_Grid;
RWTexture2DArray<float> Emitter_LightingGridDownsample_OutputGrid;
SamplerState Emitter_LightingGridDownsample_GridSampler;
int4 Emitter_LightingGridDownsample_AttributeIndices[2];
int Emitter_LightingGridDownsample_NumAttributes;
const float2 GridPos = UVW.xy * Emitter_LightingGridDownsample_NumCells.xy - .5;
const int2 MaxCell = Emitter_LightingGridDownsample_NumCells - int2(3,3);
return Emitter_LightingGridDownsample_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float CurrValue = Emitter_LightingGridDownsample_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
InterpInX[j] = Basic1DCubic_Emitter_LightingGridDownsample(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_LightingGridDownsample(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
const int2 MaxCell = Emitter_LightingGridDownsample_NumCells - int2(2,2);
InterpInX[j] = Monotonic1DCubic_Emitter_LightingGridDownsample(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Monotonic1DCubic_Emitter_LightingGridDownsample(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return Basic2DCubic_Emitter_LightingGridDownsample(Sampler, UVW, MipLevel);
int Emitter_CameraQuery_SplitscreenMode;
Out_FieldOfViewAngle = degrees(View.FieldOfViewWideAngles.x);
Out_CurrentSplitscreenMode = Emitter_CameraQuery_SplitscreenMode;
Out_CurrentJitter = View.TemporalAAJitter.xy;
Out_PreviousJitter = View.TemporalAAJitter.zw;
FLWCVector3 CameraPos = PrimaryView.TileOffset.WorldCameraOrigin;
LWCSetTile(CameraPos, LWCGetTile(CameraPos) - GetEngineOwnerLWCTile()); // convert to simulation space
Out_CameraPositionWorld = LWCToFloat(CameraPos);
Out_ViewForwardVector = View.ViewForward;
Out_ViewUpVector = View.ViewUp;
Out_ViewRightVector = View.ViewRight;
FLWCVector3 ViewPos = PrimaryView.TileOffset.WorldViewOrigin;
LWCSetTile(ViewPos, LWCGetTile(ViewPos) - GetEngineOwnerLWCTile()); // convert to simulation space
Out_ViewPositionWorld.xyz = LWCToFloat(ViewPos);
Out_ViewSizeAndInverseSize = View.ViewSizeAndInvSize;
Out_ScreenToViewSpace = View.ScreenToViewSpace;
Out_Current_TAAJitter = View.TemporalAAJitter.xy;
Out_Previous_TAAJitter = View.TemporalAAJitter.zw;
Out_PreViewTranslation = DFHackToFloat(PrimaryView.PreViewTranslation);
Out_BufferSizeAndInverseSize = View.BufferSizeAndInvSize;
Out_ViewportOffset = View.ViewRectMin.xy;
Out_NearPlane = View.NearPlane;
Out_FOVCurrent = View.FieldOfViewWideAngles.xy;
Out_FOVPrevious = View.PrevFieldOfViewWideAngles.xy;
Out_WorldToClipTransform = DFHackToFloat(PrimaryView.WorldToClip);
Out_TranslatedWorldToClipTransform = View.TranslatedWorldToClip;
Out_ClipToWorldTransform = DFHackToFloat(PrimaryView.ClipToWorld);
Out_ClipToViewTransform = View.ClipToView;
Out_ClipToTranslatedWorldTransform = View.ClipToTranslatedWorld;
Out_ScreenToWorldTransform = DFHackToFloat(PrimaryView.ScreenToWorld);
Out_ScreenToTranslatedWorldTransform = View.ScreenToTranslatedWorld;
Out_ClipToPreviousClipTransform = View.ClipToPrevClip;
Out_TranslatedWorldToViewTransform = View.TranslatedWorldToView;
Out_ViewToTranslatedWorldTransform = View.ViewToTranslatedWorld;
Out_TranslatedWorldToCameraViewTransform = View.TranslatedWorldToCameraView;
Out_CameraViewToTranslatedWorldTransform = View.CameraViewToTranslatedWorld;
Out_ViewToClipTransform = View.ViewToClip;
Out_ViewToClipNoAATransform = View.ViewToClipNoAA;
FLWCVector3 LwcPos = MakeLWCVector3(GetEngineOwnerLWCTile(), In_WorldPosition);
float3 ResolvedLwcPos = LWCToFloat(LWCAdd(LwcPos, PrimaryView.TileOffset.PreViewTranslation));
Out_TranslatedPosition = float4(ResolvedLwcPos, 1);
FLWCVector3 TranslatedPos = LWCPromote(In_TranslatedPosition.xyz / In_TranslatedPosition.w);
FLWCVector3 WorldPos = LWCSubtract(TranslatedPos, PrimaryView.TileOffset.PreViewTranslation);
WorldPos.Tile -= GetEngineOwnerLWCTile();
Out_WorldPosition = LWCToFloat(WorldPos);
Emitter_LightingRT_TextureSize;
Emitter_LightingRT_MipLevels;
Emitter_LightingRT_RWTexture;
Emitter_LightingRT_Texture;
Emitter_LightingRT_TextureSampler;
Emitter_LightingRT_RWTexture[int2(IndexX, IndexY)] = Value;
Value = Emitter_LightingRT_Texture.Load(int3(IndexX, IndexY, 0));
Value = Emitter_LightingRT_Texture.Load(int3(IndexX, IndexY, MipLevel));
Value = Emitter_LightingRT_Texture.SampleLevel(Emitter_LightingRT_TextureSampler, UV, MipLevel);
Width = Emitter_LightingRT_TextureSize.x;
Height = Emitter_LightingRT_TextureSize.y;
OutMipLevels = Emitter_LightingRT_MipLevels;
IndexX = Linear % Emitter_LightingRT_TextureSize.x;
IndexY = Linear / Emitter_LightingRT_TextureSize.x;
LinearToIndex_Emitter_LightingRT(ExecIndex(), IndexX, IndexY);
LinearToIndex_Emitter_LightingRT(ExecIndex(), Texel.x, Texel.y);
Unit.x = (float(Texel.x) + 0.5f) / float(Emitter_LightingRT_TextureSize.x);
Unit.y = (float(Texel.y) + 0.5f) / float(Emitter_LightingRT_TextureSize.y);
Out_IndexX = GDispatchThreadId.x;
Out_IndexY = GDispatchThreadId.y;
const uint Linear = GLinearThreadId;
Out_IndexX = Linear % Emitter_SimGrid_NumCells.x;
Out_IndexY = Linear / Emitter_SimGrid_NumCells.x;
int In_AttributeIndex = 0;
Out_Val = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
int In_AttributeIndex = 1;
Out_Val.r = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 0, 0)); 
Out_Val.g = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 1, 0)); 
int In_AttributeIndex = 3;
int In_AttributeIndex = 4;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 0)] = In_Value.r;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 1)] = In_Value.g;
Out_Unit = (float2(GDispatchThreadId.x, GDispatchThreadId.y) + .5) * rcp(Emitter_SimGrid_NumCells);
const uint IndexX = Linear % Emitter_SimGrid_NumCells.x;
const uint IndexY = Linear / Emitter_SimGrid_NumCells.x;
Out_Unit = (float2(IndexX, IndexY) + .5) * Emitter_SimGrid_UnitToUV;
Out_Simulation = mul(float4(In_Unit, 1.0), In_UnitToSimulationTransform).xyz;
Out_NumCellsX = Emitter_SimGrid_NumCells.x;
Out_NumCellsY = Emitter_SimGrid_NumCells.y;
Out_IndexX = In_Linear % Emitter_SimGrid_NumCells.x;
Out_IndexY = In_Linear / Emitter_SimGrid_NumCells.x;
Out_Unit = float3((float2(In_IndexX, In_IndexY) + .5) * Emitter_SimGrid_UnitToUV, 0);
float3 UVW = float3(In_UnitX, In_UnitY, In_AttributeIndex);
Out_Val = SampleBiCubic_Emitter_SimGrid(Emitter_SimGrid_GridSampler, UVW, 0);
Out_Val = Emitter_SimGrid_Grid.SampleLevel(Emitter_SimGrid_GridSampler, UVW, 0);
for (int AttributeIndex = 0; AttributeIndex < Emitter_SimGrid_NumAttributes.x; AttributeIndex++)
float Val = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, AttributeIndex, 0));
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, AttributeIndex)] = Val;
Out_Index = In_Unit * float2(Emitter_SourceGrid_NumCells)  - .5;
Out_NumCellsX = Emitter_SourceGrid_NumCells.x;
Out_NumCellsY = Emitter_SourceGrid_NumCells.y;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
int In_AttributeIndex = 2;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 0)] = In_Value.r;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 1)] = In_Value.g;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 2)] = In_Value.b;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 3)] = In_Value.a;
Out_IndexX = Linear % Emitter_SourceGrid_NumCells.x;
Out_IndexY = Linear / Emitter_SourceGrid_NumCells.x;
Out_Val = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
Out_Val.r = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 0, 0)); 
Out_Val.g = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 1, 0)); 
    int RegisterIndex = Emitter_ParticleSource_AttributeIndices[0].x;
    int NumParticles = Emitter_ParticleSource_InstanceCountOffset != 0xffffffff ? RWInstanceCounts[Emitter_ParticleSource_InstanceCountOffset] : 0;
    if(RegisterIndex != -1 && ParticleIndex >= 0 && ParticleIndex < NumParticles)
        Out_Valid = true;
        BRANCH
        if (Emitter_ParticleSource_AttributeCompressed[0].x)
                Out_Value.x = float(Emitter_ParticleSource_InputHalfBuffer[(RegisterIndex + 0)*Emitter_ParticleSource_ParticleStrideHalf + ParticleIndex]);
                Out_Value.y = float(Emitter_ParticleSource_InputHalfBuffer[(RegisterIndex + 1)*Emitter_ParticleSource_ParticleStrideHalf + ParticleIndex]);
                Out_Value.z = float(Emitter_ParticleSource_InputHalfBuffer[(RegisterIndex + 2)*Emitter_ParticleSource_ParticleStrideHalf + ParticleIndex]);
#endif //NIAGARA_COMPRESSED_ATTRIBUTES_ENABLED
                Out_Value.x = float(Emitter_ParticleSource_InputFloatBuffer[(RegisterIndex + 0)*Emitter_ParticleSource_ParticleStrideFloat + ParticleIndex]);
                Out_Value.y = float(Emitter_ParticleSource_InputFloatBuffer[(RegisterIndex + 1)*Emitter_ParticleSource_ParticleStrideFloat + ParticleIndex]);
                Out_Value.z = float(Emitter_ParticleSource_InputFloatBuffer[(RegisterIndex + 2)*Emitter_ParticleSource_ParticleStrideFloat + ParticleIndex]);
    else
        Out_Valid = false;
        Out_Value = (float3)0;
    int RegisterIndex = Emitter_ParticleSource_AttributeIndices[0].y;
        if (Emitter_ParticleSource_AttributeCompressed[0].y)
    int RegisterIndex = Emitter_ParticleSource_AttributeIndices[0].z;
        if (Emitter_ParticleSource_AttributeCompressed[0].z)
                Out_Value = float(Emitter_ParticleSource_InputHalfBuffer[(RegisterIndex + 0)*Emitter_ParticleSource_ParticleStrideHalf + ParticleIndex]);
                Out_Value = float(Emitter_ParticleSource_InputFloatBuffer[(RegisterIndex + 0)*Emitter_ParticleSource_ParticleStrideFloat + ParticleIndex]);
        Out_Value = (float)0;
    int RegisterIndex = Emitter_ParticleSource_AttributeIndices[0].w;
        if (Emitter_ParticleSource_AttributeCompressed[0].w)
    int RegisterIndex = Emitter_ParticleSource_AttributeIndices[1].x;
        if (Emitter_ParticleSource_AttributeCompressed[1].x)
Out_IndexX = Linear % Emitter_TemporaryGrid_NumCells.x;
Out_IndexY = Linear / Emitter_TemporaryGrid_NumCells.x;
Out_Val = Emitter_TemporaryGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
Emitter_TemporaryGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Out_IndexX = Linear % Emitter_PressureGrid_NumCells.x;
Out_IndexY = Linear / Emitter_PressureGrid_NumCells.x;
Emitter_PressureGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Out_Val = Emitter_PressureGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
Out_NumCellsX = Emitter_PressureGrid_NumCells.x;
Out_NumCellsY = Emitter_PressureGrid_NumCells.y;
Out_Unit = (float2(GDispatchThreadId.x, GDispatchThreadId.y) + .5) * rcp(Emitter_LightingGridDownsample_NumCells);
const uint IndexX = Linear % Emitter_LightingGridDownsample_NumCells.x;
const uint IndexY = Linear / Emitter_LightingGridDownsample_NumCells.x;
Out_Unit = (float2(IndexX, IndexY) + .5) * Emitter_LightingGridDownsample_UnitToUV;
Out_NumCellsX = Emitter_LightingGridDownsample_NumCells.x;
Out_NumCellsY = Emitter_LightingGridDownsample_NumCells.y;
int2 Out_IndexTmp = round(In_Unit * float2(Emitter_LightingGridDownsample_NumCells)  - .5);
Out_IndexX = Out_IndexTmp.x;
Out_IndexY = Out_IndexTmp.y;
val = 0;
Emitter_LightingGridDownsample_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Out_Val = Emitter_LightingGridDownsample_Grid.SampleLevel(Emitter_LightingGridDownsample_GridSampler, UVW, 0);
//Generated by UNiagaraDataInterfaceGrid2DCollection::GenerateSetupHLSL
// Argument Name "Map" Type "NiagaraParameterMap"
// Argument Name "TargetDataInterface" Type "NiagaraDataInterfaceGrid2DCollection"
//Generated by UNiagaraDataInterfaceGrid2DCollection::GenerateIterationSourceNamespaceReadAttributesHLSL
int X, Y;
ExecutionIndexToGridIndex_Emitter_SimGrid(X, Y);
// Variable Name "Emitter.SimGrid.Density" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Density"
GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Density);
// Variable Name "Emitter.SimGrid.Velocity" Type "Vector2f" Var "Map.Emitter.SimGrid.Velocity"
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Velocity);
// Variable Name "Emitter.SimGrid.Temperature" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Temperature"
GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Temperature);
// Variable Name "Emitter.SimGrid.Boundary" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Boundary"
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Boundary);
SetupFromIterationSource_MapSimStage1_Init_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage1_Init_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
//Generated by UNiagaraDataInterfaceGrid2DCollection::GenerateTeardownHLSL
//Generated by UNiagaraDataInterfaceGrid2DCollection::GenerateIterationSourceNamespaceWriteAttributesHLSL
// Name "Emitter.SimGrid.Density" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Density"
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Density);
// Name "Emitter.SimGrid.Velocity" Type "Vector2f" Var "Map.Emitter.SimGrid.Velocity"
SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Velocity);
// Name "Emitter.SimGrid.Temperature" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Temperature"
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Temperature);
// Name "Emitter.SimGrid.Boundary" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Boundary"
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Boundary);
TeardownFromIterationSource_MapSimStage1_Init_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage1_Init_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity);
GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature);
SetupFromIterationSource_MapSimStage4_PreSim_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage4_PreSim_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Boundary);
TeardownFromIterationSource_MapSimStage4_PreSim_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage4_PreSim_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(X, Y, Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity);
SetupFromIterationSource_MapSimStage5_AdvectVelocity_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage5_AdvectVelocity_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
// We need to copy from previous to current first thing, because other functions afterwards may just set values on the local grid.
CopyPreviousToCurrentForCell_Emitter_SimGrid_UEImpureCall(X,Y);
SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity);
TeardownFromIterationSource_MapSimStage5_AdvectVelocity_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage5_AdvectVelocity_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
SetupFromIterationSource_MapSimStage6_ComputeDivergence_GeneratedSetup_Func_(Context);
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(X, Y);
// Name "Emitter.TemporaryGrid.SimFloat" Type "NiagaraFloat" Var "Map.Emitter.TemporaryGrid.SimFloat"
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(X, Y, Context.MapSimStage6_ComputeDivergence.Emitter.TemporaryGrid.SimFloat);
TeardownFromIterationSource_MapSimStage6_ComputeDivergence_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage6_ComputeDivergence_GeneratedWriteAttributesEmitter_TemporaryGrid_Func_(Context);
ExecutionIndexToGridIndex_Emitter_PressureGrid(X, Y);
// Variable Name "Emitter.PressureGrid.Pressure" Type "NiagaraFloat" Var "Map.Emitter.PressureGrid.Pressure"
GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(X, Y, Context.MapSimStage7_SolvePressure.Emitter.PressureGrid.Pressure);
SetupFromIterationSource_MapSimStage7_SolvePressure_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage7_SolvePressure_GeneratedReadAttributesEmitter_PressureGrid_Func_(Context);
// Name "Emitter.PressureGrid.Pressure" Type "NiagaraFloat" Var "Map.Emitter.PressureGrid.Pressure"
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(X, Y, Context.MapSimStage7_SolvePressure.Emitter.PressureGrid.Pressure);
TeardownFromIterationSource_MapSimStage7_SolvePressure_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage7_SolvePressure_GeneratedWriteAttributesEmitter_PressureGrid_Func_(Context);
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(X, Y, Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity);
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(X, Y, Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Boundary);
SetupFromIterationSource_MapSimStage12_ProjectPressure_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage12_ProjectPressure_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(X, Y, Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Boundary);
TeardownFromIterationSource_MapSimStage12_ProjectPressure_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage12_ProjectPressure_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary);
GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density);
GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature);
SetupFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature);
TeardownFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
SetupFromIterationSource_MapSimStage14_LightingPrePass_GeneratedSetup_Func_(Context);
TeardownFromIterationSource_MapSimStage14_LightingPrePass_GeneratedTeardown_Func_(Context);
Context.MapSimStage1_Init.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
Context.MapSimStage1_Init.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage1_Init.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
Context.MapSimStage1_Init.Emitter.SimGrid.Boundary = Emitter_SimGrid_Boundary;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.dt = Emitter_dt;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.dx = Emitter_dx;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToUnit;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceCore = Emitter_SourceCore;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceDensityMult = Emitter_SourceDensityMult;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceFalloff = Emitter_SourceFalloff;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceMaxStreakSamples = Emitter_SourceMaxStreakSamples;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.RadiusScale = Emitter_RadiusScale;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceStreakDensity = Emitter_SourceStreakDensity;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceTemperatureMult = Emitter_SourceTemperatureMult;
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceVelocityMult = Emitter_SourceVelocityMult;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceCore = Emitter_SourceCore;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceDensityMult = Emitter_SourceDensityMult;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.dt = Emitter_dt;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.dx = Emitter_dx;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceFalloff = Emitter_SourceFalloff;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceMaxStreakSamples = Emitter_SourceMaxStreakSamples;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.RadiusScale = Emitter_RadiusScale;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceIsLocalSpace = Emitter_SourceIsLocalSpace;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceStreakDensity = Emitter_SourceStreakDensity;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceTemperatureMult = Emitter_SourceTemperatureMult;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.SourceVelocityMult = Emitter_SourceVelocityMult;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
Context.MapSimStage3_RasterizeSourceParticles.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToUnit;
Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld = Emitter_Grid2D_CreateUnitToWorldTransform_UnitToWorld;
Context.MapSimStage4_PreSim.Emitter.dx = Emitter_dx;
Context.MapSimStage4_PreSim.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_vorticityConfinement = Emitter_fluids_solver_vorticityConfinement;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_densityBouyancy = Emitter_fluids_solver_densityBouyancy;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_temperatureBouyancy = Emitter_fluids_solver_temperatureBouyancy;
Context.MapSimStage4_PreSim.Emitter.g = Emitter_g;
Context.MapSimStage4_PreSim.Engine.Time = Engine_Time;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage4_PreSim.Emitter.dt = Emitter_dt;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.LocalToWorldRotation = Emitter_Grid2D_CreateUnitToWorldTransform_LocalToWorldRotation;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Boundary = Emitter_SimGrid_Boundary;
Context.MapSimStage5_AdvectVelocity.Emitter.dt = Emitter_dt;
Context.MapSimStage5_AdvectVelocity.Emitter.dx = Emitter_dx;
Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Emitter.fluids_solver_velocityDissipation = Emitter_fluids_solver_velocityDissipation;
Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage6_ComputeDivergence.Emitter.dx = Emitter_dx;
Context.MapSimStage6_ComputeDivergence.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage6_ComputeDivergence.Emitter.dt = Emitter_dt;
Context.MapSimStage7_SolvePressure.Emitter.dt = Emitter_dt;
Context.MapSimStage7_SolvePressure.Emitter.dx = Emitter_dx;
Context.MapSimStage7_SolvePressure.Emitter.fluids_solver_pressureRelaxation = Emitter_fluids_solver_pressureRelaxation;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage12_ProjectPressure.Emitter.dx = Emitter_dx;
Context.MapSimStage12_ProjectPressure.Emitter.PressureGrid_PressureIndex = Emitter_PressureGrid_PressureIndex;
Context.MapSimStage12_ProjectPressure.Emitter.dt = Emitter_dt;
Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Boundary = Emitter_SimGrid_Boundary;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt = Emitter_dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx = Emitter_dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_DensityIndex = Emitter_SimGrid_DensityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_TemperatureIndex = Emitter_SimGrid_TemperatureIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationDensity = Emitter_fluids_solver_dissipationDensity;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationTemperature = Emitter_fluids_solver_dissipationTemperature;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary = Emitter_SimGrid_Boundary;
Context.MapSimStage14_LightingPrePass.Emitter.SimGrid_TemperatureIndex = Emitter_SimGrid_TemperatureIndex;
Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_sunDirection = Emitter_fluids_lighting_sunDirection;
Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_environmentDirection = Emitter_fluids_lighting_environmentDirection;
Context.MapSimStage15_ComputeLighting.Emitter.ShadowDensityMult = Emitter_ShadowDensityMult;
Context.MapSimStage15_ComputeLighting.Emitter.SimGrid_DensityIndex = Emitter_SimGrid_DensityIndex;
Context.MapSimStage15_ComputeLighting.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapSimStage15_ComputeLighting.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSimStage15_ComputeLighting.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapSimStage15_ComputeLighting.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.MapSpawn.Particles.UniqueID = 0;
Context.MapSpawn.Engine.Emitter.ID.ID = 1;
Context.MapUpdate.Array.UniqueID = 0;
Context.MapUpdate.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapUpdate.Engine.Emitter.ID.ID = 1;
#elif ((SimulationStageIndex == 1)) // MapSimStage1_Init
SetupFromIterationSource_MapSimStage1_Init(Context);
#elif ((SimulationStageIndex == 4)) // MapSimStage4_PreSim
SetupFromIterationSource_MapSimStage4_PreSim(Context);
#elif ((SimulationStageIndex == 5)) // MapSimStage5_AdvectVelocity
SetupFromIterationSource_MapSimStage5_AdvectVelocity(Context);
#elif ((SimulationStageIndex == 6)) // MapSimStage6_ComputeDivergence
SetupFromIterationSource_MapSimStage6_ComputeDivergence(Context);
#elif ((SimulationStageIndex == 7)) // MapSimStage7_SolvePressure
SetupFromIterationSource_MapSimStage7_SolvePressure(Context);
#elif ((SimulationStageIndex == 8)) // MapSimStage8_SolvePressureASC40SinFFTinYASC41
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Array.UniqueID = 0;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Engine.Emitter.ID.ID = 1;
#elif ((SimulationStageIndex == 9)) // MapSimStage9_SolvePressureASC40SinFFTinXASC41
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Array.UniqueID = 0;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Engine.Emitter.ID.ID = 1;
#elif ((SimulationStageIndex == 10)) // MapSimStage10_SolvePressureASC40InvSinFFTinXASC41
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Array.UniqueID = 0;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Engine.Emitter.ID.ID = 1;
#elif ((SimulationStageIndex == 11)) // MapSimStage11_SolvePressureASC40InvSinFFTinYASC41
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Array.UniqueID = 0;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Particles.UniqueID = InputDataInt(0, 0, InstanceIdx);
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Engine.Emitter.ID.ID = 1;
#elif ((SimulationStageIndex == 12)) // MapSimStage12_ProjectPressure
SetupFromIterationSource_MapSimStage12_ProjectPressure(Context);
#elif ((SimulationStageIndex == 13)) // MapSimStage13_AdvectScalarsandPostSim
SetupFromIterationSource_MapSimStage13_AdvectScalarsandPostSim(Context);
#elif ((SimulationStageIndex == 14)) // MapSimStage14_LightingPrePass
SetupFromIterationSource_MapSimStage14_LightingPrePass(Context);
Context.MapUpdate.Particles = Context.MapSpawn.Particles;
#elif ((SimulationStageIndex == 2)) // MapSimStage2_RasterizeNDCSourceParticles
#elif ((SimulationStageIndex == 3)) // MapSimStage3_RasterizeSourceParticles
#elif ((SimulationStageIndex == 15)) // MapSimStage15_ComputeLighting
const bool bValid = bIsValidInstance;
const int WriteIndex = OutputIndex(0, false, bValid);
OutputDataInt(0, 0, WriteIndex, Context.MapUpdate.Particles.UniqueID);
// If a stage doesn't kill particles, StoreUpdateVariables() never calls AcquireIndex(), so the
// count isn't updated. In that case we must manually copy the original count here.
RWInstanceCounts[WriteInstanceCountOffset] = GSpawnStartInstance + NumSpawnedInstances; 
TeardownFromIterationSource_MapSimStage1_Init(Context);
TeardownFromIterationSource_MapSimStage4_PreSim(Context);
TeardownFromIterationSource_MapSimStage5_AdvectVelocity(Context);
TeardownFromIterationSource_MapSimStage6_ComputeDivergence(Context);
TeardownFromIterationSource_MapSimStage7_SolvePressure(Context);
TeardownFromIterationSource_MapSimStage12_ProjectPressure(Context);
TeardownFromIterationSource_MapSimStage13_AdvectScalarsandPostSim(Context);
TeardownFromIterationSource_MapSimStage14_LightingPrePass(Context);
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
#elif SimulationStageIndex == 1 // MapSimStage1_Init
const uint MaxInstances = SimulationStage_GetInstanceCount();
GLinearThreadId = all(GDispatchThreadId < DispatchThreadIdBounds) ? GLinearThreadId : MaxInstances;
GSpawnStartInstance = MaxInstances;
const bool bRunUpdateLogic = (GLinearThreadId < GSpawnStartInstance) && (SimStart != 1);
const bool bRunSpawnLogic = (GLinearThreadId < GSpawnStartInstance) && (SimStart == 1);
SimulateMapSimStage1_Init(Context);
#elif SimulationStageIndex == 2 // MapSimStage2_RasterizeNDCSourceParticles
SimulateMapSimStage2_RasterizeNDCSourceParticles(Context);
#elif SimulationStageIndex == 3 // MapSimStage3_RasterizeSourceParticles
SimulateMapSimStage3_RasterizeSourceParticles(Context);
#elif SimulationStageIndex == 4 // MapSimStage4_PreSim
SimulateMapSimStage4_PreSim(Context);
#elif SimulationStageIndex == 5 // MapSimStage5_AdvectVelocity
SimulateMapSimStage5_AdvectVelocity(Context);
#elif SimulationStageIndex == 6 // MapSimStage6_ComputeDivergence
SimulateMapSimStage6_ComputeDivergence(Context);
#elif SimulationStageIndex == 7 // MapSimStage7_SolvePressure
SimulateMapSimStage7_SolvePressure(Context);
#elif SimulationStageIndex == 8 // MapSimStage8_SolvePressureASC40SinFFTinYASC41
const bool bValidInstance = all(GDispatchThreadId < DispatchThreadIdBounds);
const bool bRunUpdateLogic = true;
const bool bRunSpawnLogic = false;
GLinearThreadId = bValidInstance ? GLinearThreadId : MaxInstances;
SimulateMapSimStage8_SolvePressureASC40SinFFTinYASC41(Context);
#elif SimulationStageIndex == 9 // MapSimStage9_SolvePressureASC40SinFFTinXASC41
SimulateMapSimStage9_SolvePressureASC40SinFFTinXASC41(Context);
#elif SimulationStageIndex == 10 // MapSimStage10_SolvePressureASC40InvSinFFTinXASC41
SimulateMapSimStage10_SolvePressureASC40InvSinFFTinXASC41(Context);
#elif SimulationStageIndex == 11 // MapSimStage11_SolvePressureASC40InvSinFFTinYASC41
SimulateMapSimStage11_SolvePressureASC40InvSinFFTinYASC41(Context);
#elif SimulationStageIndex == 12 // MapSimStage12_ProjectPressure
SimulateMapSimStage12_ProjectPressure(Context);
#elif SimulationStageIndex == 13 // MapSimStage13_AdvectScalarsandPostSim
SimulateMapSimStage13_AdvectScalarsandPostSim(Context);
#elif SimulationStageIndex == 14 // MapSimStage14_LightingPrePass
SimulateMapSimStage14_LightingPrePass(Context);
#elif SimulationStageIndex == 15 // MapSimStage15_ComputeLighting
SimulateMapSimStage15_ComputeLighting(Context);
Í;Eao>°◊K∑ZàõûT⁄OC
ˇ†LœZ;Ár
ƒC†‹;©
èW;˙99
Wö;‡@¶Œ`
>˙∆;7L˚JÜ¥Êstçˆ[—
>˙∆;7L˚JÜ¥Êstçˆ[d
„~IäLb»I∂;!Éö
0ûíÍÉ'ÔåG;‘;l2J"—
0ûíÍÉ'ÔåG;‘;l2J"d
npOÄ£k;•åUÁ¥
æ iyM0›Bñ,;{Z˙É∆—
æ iyM0›Bñ,;{Z˙É∆d
npOÄ£k;•åUÁM
0m4P≈ﬁA;•K¶ó_Î˛
?f;ì<c⁄
hd‚;Y¬≈
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
float Emitter_SpawnRate;
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
float4 ParticleColorScaleFactor;
float PhysicsDeltaTime;
float PhysicsDrag;
float3 PhysicsForce;
float PhysicsRotationalDrag;
float3 PhysicsRotationalForce;
bool HemisphereX;
bool HemisphereY;
bool HemisphereZ;
bool NormalizeThickness;
int OffsetCoordinateSpace;
int SphereCoordinateSpace;
float3 SphereOrigin;
int SurfaceExpansionMode;
float3 Force;
float Mass;
bool WritetoIntrinsicProperties;
float2 SpriteSize;
FParamMap0_SetVariables_BDEC693D447651B764B3B6BBF3065841_Particles Particles;
float4 ColorValueToScale;
float ScaleAlpha;
float Lifetime;
float SpriteRotation;
float4 Color;
int CollisionID;
FParamMap0_Particles_Collision001_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Particles_Collision001_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
float OffscreenCounter;
float3 SafeCombinedCollisionNormal;
FParamMap0_Particles_Collision001 Collision001;
float DistanceTraveled;
float fluids_source_density;
float fluids_source_divergence;
float fluids_source_falloff;
float fluids_source_noiseIntensity;
float fluids_source_noiseScale;
float fluids_source_radius;
float fluids_source_temperature;
float3 fluids_source_velocity;
float fluids_source_velocityScale;
bool HasCollided;
FParamMap0_Particles_Initial Initial;
float MaterialRandom;
float NormalizedAge;
int NumberOfCollisions;
FParamMap0_Particles_Presolve Presolve;
FParamMap0_Particles_Previous Previous;
float RestCounter;
float RotationalInertia;
float3 RotationalVelocity;
float3 SphereNormal;
float3 SphereVector;
float IncomingPhysicsDrag;
float3 IncomingPhysicsForce;
float3 CurlNoiseForce;
float CollisionPenetrationDistance;
bool ModuleDepthBasedCollisionParticleOccluded;
bool ParticleOnScreen;
bool PhysicsCollidesThisFrame;
FParamMap0_OUTPUT_VAR_Collision001_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_OUTPUT_VAR_Collision001_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
float3 CombinedCollisionNormal;
float3 IncomingCollisionVelocity;
float3 ModuleCollision1Normal;
bool ModuleCollision1Valid;
float3 ModuleCollision2Normal;
bool ModuleCollision2Valid;
float3 ModuleCombinedCollisionNormal;
float3 IncomingPhysicsRotationalForce;
FParamMap0_OUTPUT_VAR_ApplyInitialForces ApplyInitialForces;
FParamMap0_OUTPUT_VAR_Collision001 Collision001;
FParamMap0_OUTPUT_VAR_CurlNoiseForce001 CurlNoiseForce001;
FParamMap0_OUTPUT_VAR_ParticleState ParticleState;
FParamMap0_OUTPUT_VAR_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_OUTPUT_VAR_SphereLocation001 SphereLocation001;
float A;
float3 DragVelocity;
float InverseMass;
float AgeAdvancement;
float DeterministicOffset;
float3 SampledNoise;
float3 SamplePosition;
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
FParamMap0_Local_Collision001_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Local_Collision001_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
bool DebugCollided1;
bool DebugCollided2;
float3 DebugCollisionNormal1;
float3 DebugCollisionNormal2;
float3 DebugCollisionPosition1;
float3 DebugCollisionPosition2;
float3 InputForcePassthrough_NeededForSimStageExecution;
float3 InputPositionPassthrough_NeededForSimStageExecution;
float3 InputVelocityPassthrough_NeededForSimStageExecution;
bool ManuallyEnterRest;
float ModuleParticleRadius;
float3 ModuleTraceWorldEnd1;
float3 ModuleTraceWorldEnd2;
float3 ModuleTraceWorldStart1;
float3 ModuleTraceWorldStart2;
bool UpdateMeshRotation;
float3 ConeVector;
float DotBetweenConeVectorAndAxis;
FParamMap0_Local_AddVelocityInCone AddVelocityInCone;
FParamMap0_Local_Collision001 Collision001;
FParamMap0_Local_CurlNoiseForce001 CurlNoiseForce001;
FParamMap0_Local_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_Local_SphereLocation001 SphereLocation001;
float Emitter_InterpSpawnStartDt;
int Emitter_SpawnGroup;
float Emitter_SpawnInterval;
int InterpSpawn_Index;
float InterpSpawn_InvSpawnTime;
float InterpSpawn_InvUpdateTime;
float InterpSpawn_SpawnTime;
float InterpSpawn_UpdateTime;
float SpawnInterp;
bool WriteColor;
bool WriteLifetime;
bool WriteMass;
bool WriteMaterialRandom;
bool WritePosition;
bool WriteScale;
bool WriteSpriteRotation;
bool WriteSpriteSize;
float Radius;
float CurveIndex;
int ExecutionCount;
float SpawnRate;
bool Alive;
float CurlNoiseConeMaskAngle;
float3 CurlNoiseConeMaskAxis;
float CurlNoiseConeMaskFalloffAngle;
bool AllowOffscreenDepthBufferParticlesToLive;
float BounceCollisionFriction;
bool CollisionEnabled;
float CollisionNormalRandomizationPercentage;
int CPUFrictionMergeType;
float DepthBufferBackfaceThickness;
float DynamicFrictionCoefficient;
bool KillOccludedParticles;
float MaxIntersectionCorrectionDistance;
float MaxSceneDepthCollisionDistance;
float MaxTraceLength;
float ParticleRadius;
float ParticleRestitutionCoeffiecient;
bool RandomizeCollisionNormal;
float StaticFrictionCoefficient;
float StaticFrictionEngagementSpeed;
float TraceVectorLengthMultiplier;
bool UpdateRotationalVelocity;
float AdvancedAgingRate;
bool AllowOffscreenDepthBufferCollisionParticlesToLiveAfteraBounce;
FParamMap0_Collision001_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Collision001_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
bool ControlRestStateViaSurfaceNormal;
bool CorrectInterpenetration;
bool EnableMaxCollisionCount;
bool EnableRestState;
float ParticleMass;
bool RandomizeCollisionNormalVector;
int Position;
int SpriteRotation;
int SpriteSize;
int Velocity;
int PhysicsForce;
int Color;
FParamMap0_Array_Collision001_CollisionQueryAndResponse CollisionQueryAndResponse;
FParamMap0_Array_Collision001_CollisionQueryAndResponse001 CollisionQueryAndResponse001;
int OffscreenCounter;
int SafeCombinedCollisionNormal;
int Age;
FParamMap0_Array_Collision001 Collision001;
int DistanceTraveled;
int fluids_source_density;
int fluids_source_divergence;
int fluids_source_falloff;
int fluids_source_noiseIntensity;
int fluids_source_noiseScale;
int fluids_source_radius;
int fluids_source_temperature;
int fluids_source_velocity;
int fluids_source_velocityScale;
int HasCollided;
FParamMap0_Array_Initial Initial;
int Lifetime;
int Mass;
int MaterialRandom;
int NormalizedAge;
FParamMap0_Array_Presolve Presolve;
FParamMap0_Array_Previous Previous;
int RestCounter;
int RotationalInertia;
int RotationalVelocity;
int Scale;
bool ApplyForcetoPosition;
bool ApplyForcetoVelocity;
bool ApplyRotationalForcetoRotationalVelocity;
int ConeAxisCoordinateSpace;
bool UseVelocityFalloffOnConeAxis;
float VelocityStrength;
FParamMap0_AddVelocityInCone AddVelocityInCone;
FParamMap0_ApplyInitialForces ApplyInitialForces;
FParamMap0_Collision001 Collision001;
FParamMap0_CurlNoiseForce001 CurlNoiseForce001;
FParamMap0_DataInstance DataInstance;
FParamMap0_FloatFromCurve FloatFromCurve;
FParamMap0_FloatFromCurve004 FloatFromCurve004;
FParamMap0_Fluids_Gas_Source Fluids_Gas_Source;
FParamMap0_InitializeParticle InitializeParticle;
FParamMap0_Interpolation Interpolation;
FParamMap0_Multiply_Float Multiply_Float;
FParamMap0_ParticleState ParticleState;
FParamMap0_ScaleColor ScaleColor;
FParamMap0_SetVariables_BDEC693D447651B764B3B6BBF3065841 SetVariables_BDEC693D447651B764B3B6BBF3065841;
FParamMap0_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_SphereLocation001 SphereLocation001;
FParamMap0_Vector2DFromFloat Vector2DFromFloat;
FParamMap0_Vector2DFromFloat001 Vector2DFromFloat001;
void CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat003_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat001_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void Vector2DFromFloat_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void RandomRangeFloat_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void GetRandomInfo_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float In_Min, float In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float Out_Result, inout FSimulationContext Context);
void InitializeParticle_SimulationPosition_Emitter_Func_(out float3 Out_OutPosition, inout FSimulationContext Context);
void InitializeParticle_Emitter_Func_(inout FSimulationContext Context);
void RandomRangeFloat002_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float In_Min, float In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, bool In_FixedOverrideSeed, out float Out_Result, inout FSimulationContext Context);
void PolarToCartesianCoordinates_Func_(float In_Theta, float In_Radius, float In_Period, out float2 Out_XY, out float Out_X, out float Out_Y, out float2 Out_dXdY, out float Out_dX, out float Out_dY, inout FSimulationContext Context);
void RandomVectorInCone_Func_(float In_ConeAngle, float In_ConePointDistribution, bool In_EnableCurvature, float In_ConeCurvature, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float3 Out_Vector, out float3 Out_NormalizedVector, inout FSimulationContext Context);
void RemapValueRange_Func_(float In_INPUT_VAR, float In_InputLow, float In_InputHigh, float In_TargetLow, float In_TargetHigh, out float Out_Remapped, inout FSimulationContext Context);
void AddVelocityInCone_NF_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_(float3 In_From, float3 In_To, out float4 Out_Result);
void FindQuatBetween_v1_0_Func_(float3 In_From, float3 In_To, out float4 Out_NewOutput, inout FSimulationContext Context);
void MultiplyVectorWithQuaternion_Func_(float3 In_VECTOR_VAR, float4 In_Quaternion, out float3 Out_Vector, inout FSimulationContext Context);
void AddVelocityInCone_Emitter_Func_(inout FSimulationContext Context);
void ApplyInitialForces_Emitter_Func_(inout FSimulationContext Context);
void CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(float In_InnerRadius, float In_OuterRadius, int In_Seed, out float3 Out_Ouput, inout FSimulationContext Context);
void CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_(bool In_X, bool In_Y, bool In_Z, out float3 Out_Output);
void SphereLocation001_NF_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation001_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation001_Emitter_Func_(inout FSimulationContext Context);
void ParticleState_Emitter_Func_(inout FSimulationContext Context);
void SampleField_Emitter_VectorField32(float3 In_SamplePoint, out float3 Out_SampledValue);
void CurlNoiseForce001_Emitter_Func_(int In_Emitter_RandomSeed, inout FSimulationContext Context);
void GravityForce_Emitter_Func_(inout FSimulationContext Context);
void Drag_Emitter_Func_(inout FSimulationContext Context);
void SampleCurve_Emitter_ScaleAlpha_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void ScaleColor_Emitter_Func_(inout FSimulationContext Context);
void Collision001_TransformPosition007_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void Collision001_TransformVector009_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision001_TransformVector010_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_(float2 In_SpriteSize, out float Out_Radius, inout FSimulationContext Context);
void DragVelocity_Particle_Func_(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_Query(float3 In_DepthSamplePosWorld, out float Out_SceneDepth, out float3 Out_CameraPosWorld, out bool Out_IsInsideView, out float3 Out_SamplePosWorld, out float3 Out_SampleWorldNormal);
void Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_(float In_ParticleRadius, float3 In_ParticlePosition, float3 In_StartTrace, float3 In_EndTrace, bool In_KillOccludedParticles, float In_MaximumCollisionDistance, out float3 Out_ImpactPosition, out float3 Out_ImpactNormal, out bool Out_Occluded, out bool Out_Collides, out bool Out_Onscreentest, out bool Out_KillBecauseofOcclusion, inout FSimulationContext Context);
void PlaneSphereCollisionDetection_Func_(float3 In_PlaneNormal, float3 In_PlanePivotPoint, float3 In_InitialSphereLocation, float3 In_SpherePositionDelta, float In_CollisionRadius, float In_PhysicsDeltaTime, float In_MaxCorrectiondistance, out bool Out_Collides, out float3 Out_IntersectionLocation, out float3 Out_PreASC45IntersectionSphereCenterLocation, out float3 Out_InitialPositionRelativeCollisionLocation, out float Out_TimeElapsedToCollision, out float Out_RemainingTimePostCollision, out float Out_PercentageofTimeUsedToPerformCollision, out float Out_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, out float Out_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float2 In_Min, float2 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float2 Out_Result, inout FSimulationContext Context);
void RandomizeCollisionNormals_Func_(float3 In_ConeAxis, float In_Scale, float In_Spread, out float3 Out_Ouput, inout FSimulationContext Context);
void ReflectVector_Func_(float3 In_InVector, float3 In_Normal, out float3 Out_Reflected, inout FSimulationContext Context);
void CentimeterMeterConversion_Func_(float3 In_INPUT_VAR, out float3 Out_CentimeterstoMeters, out float3 Out_MeterstoCentimeters, inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_1_Particle_Func_(float3 In_VECTOR_VAR, float3 In_FallbackVector, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void ProjectVectorOnPlane_Particle_Func_(float3 In_VECTOR_VAR, float3 In_Normal, bool In_NormalizeNormal, out float3 Out_Ouput, inout FSimulationContext Context);
void Collision001_CollisionQueryAndResponse_Emitter_Func_(out float3 Out_ModuleTraceWorldStart, out float3 Out_ModuleTraceWorldEnd, out float3 Out_CollisionPosition, out float3 Out_CollisionNormal, out bool Out_Collided, inout FSimulationContext Context);
void QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_Query(float3 In_DepthSamplePosWorld, out float Out_SceneDepth, out float3 Out_CameraPosWorld, out bool Out_IsInsideView, out float3 Out_SamplePosWorld, out float3 Out_SampleWorldNormal);
void Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_(float In_ParticleRadius, float3 In_ParticlePosition, float3 In_StartTrace, float3 In_EndTrace, bool In_KillOccludedParticles, float In_MaximumCollisionDistance, out float3 Out_ImpactPosition, out float3 Out_ImpactNormal, out bool Out_Occluded, out bool Out_Collides, out bool Out_Onscreentest, out bool Out_KillBecauseofOcclusion, inout FSimulationContext Context);
void Collision001_CollisionQueryAndResponse001_Emitter_Func_(out float3 Out_ModuleTraceWorldStart, out float3 Out_ModuleTraceWorldEnd, out float3 Out_CollisionPosition, out float3 Out_CollisionNormal, out bool Out_Collided, inout FSimulationContext Context);
void Collision001_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision001_TransformPosition001_Emitter_Func_(float3 In_InPosition, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutPosition, inout FSimulationContext Context);
void Collision001_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void Collision001_Emitter_Func_(inout FSimulationContext Context);
void SolveForcesAndVelocity_Emitter_Func_(inout FSimulationContext Context);
void SampleCurve_Emitter_Radius_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve004_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void Fluids_Gas_Source_Emitter_Func_(inout FSimulationContext Context);
void Multiply_Float_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void Vector2DFromFloat001_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_BDEC693D447651B764B3B6BBF3065841_Emitter_Func_(inout FSimulationContext Context);
float Result = In_FloatMax - In_FloatMin;
float Result1 = rand_float(Result);
float Result2 = In_FloatMin + Result1;
Out_RandomFloat = Result2;
Out_IsDeterministic = Constant43;
int Constant36 = (0);
float Constant37 = 12;
float Constant38 = 250;
int Constant40 = 0;
int Constant41 = (0);
int Constant42 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant36, Constant37, Constant38, Constant39, Constant40, Constant41, Constant42, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
int Constant47 = (0);
float Constant48 = 0.75;
float Constant49 = 1;
int Constant50 = 0;
int Constant51 = 0;
int Constant52 = (0);
int Constant53 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant47, Constant48, Constant49, Constant50, Constant51, Constant52, Constant53, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
float2 Output1;
Output1.x = Context.MapSpawn.Vector2DFromFloat.Value;
Output1.y = Context.MapSpawn.Vector2DFromFloat.Value;
Out_Vec2 = Output1;
int Constant60 = (0);
float Constant61 = 0.2;
float Constant62 = 1.6;
int Constant63 = 0;
int Constant64 = 0;
int Constant65 = (0);
int Constant66 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat2;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic2;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant60, Constant61, Constant62, Constant63, Constant64, Constant65, Constant66, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat2, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic2, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat2;
#if ((SimulationStageIndex == 0) || (SimulationStageIndex == 0)) // Multiple stages
bool Constant78 = false;
int Constant79 = 0;
bool Result3 = NiagaraAll(In_RandomnessMode == Constant79);
bool Result4 = Constant78 && Result3;
bool Result5 = NiagaraAll(In_RandomnessMode == Constant80);
bool Result6 = Result4 || Result5;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapSpawn.Emitter.RandomSeed;
int Constant81 = 0;
int Constant82 = 0;
int Seed1_IfResult;
int Seed2_IfResult;
int Seed3_IfResult;
Seed1_IfResult = Seed_IfResult;
Seed2_IfResult = Constant81;
Seed3_IfResult = Constant82;
Seed1_IfResult = Context.MapSpawn.Particles.UniqueID;
Seed2_IfResult = Context.MapSpawn.Engine.System.TickCount;
Seed3_IfResult = Seed_IfResult;
int Constant83 = -1;
int Constant84 = -1;
int Constant85 = -1;
int Seed1_IfResult1;
int Seed2_IfResult1;
int Seed3_IfResult1;
Seed1_IfResult1 = Seed1_IfResult;
Seed2_IfResult1 = Seed2_IfResult;
Seed3_IfResult1 = Seed3_IfResult;
Seed1_IfResult1 = Constant83;
Seed2_IfResult1 = Constant84;
Seed3_IfResult1 = Constant85;
NiagaraRandInfo Output11;
Output11.Seed1 = Seed1_IfResult1;
Output11.Seed2 = Seed2_IfResult1;
Output11.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output11;
Out_UseDeterministicRandoms = Result6;
int Constant73 = (0);
bool Constant74 = false;
int Constant75 = 0;
int Constant76 = (0);
bool Constant77 = false;
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant73, In_OverrideSeed, Constant75, Constant76, Constant77, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float Result7 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed1;
Seed2 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed2;
Seed3 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed3;
float Result8 = rand_float(Result7, Seed1, Seed2, Seed3);
float Result9 = rand_float(Result7);
float Random_IfResult;
Random_IfResult = Result8;
Random_IfResult = Result9;
float Result10 = In_Min + Random_IfResult;
Out_Result = Result10;
Out_OutPosition = Context.MapSpawn.Engine.Owner.Position;
float MaterialRandom_IfResult;
MaterialRandom_IfResult = Context.MapSpawn.InitializeParticle.MaterialRandom;
MaterialRandom_IfResult = Context.MapSpawn.Particles.MaterialRandom;
Context.MapSpawn.Particles.MaterialRandom = MaterialRandom_IfResult;
float Lifetime_IfResult;
Lifetime_IfResult = Context.MapSpawn.InitializeParticle.Lifetime;
Lifetime_IfResult = Context.MapSpawn.Particles.Lifetime;
Context.MapSpawn.Particles.Lifetime = Lifetime_IfResult;
float4 Constant93 = float4(1111,13.6009,0,1);
float4 Color_IfResult;
Color_IfResult = Constant93;
Color_IfResult = Context.MapSpawn.Particles.Color;
Context.MapSpawn.Particles.Color = Color_IfResult;
float Mass_IfResult;
Mass_IfResult = Context.MapSpawn.InitializeParticle.Mass;
Mass_IfResult = Context.MapSpawn.Particles.Mass;
Context.MapSpawn.Particles.Mass = Mass_IfResult;
float2 SpriteSize_IfResult;
SpriteSize_IfResult = Context.MapSpawn.InitializeParticle.SpriteSize;
SpriteSize_IfResult = Context.MapSpawn.Particles.SpriteSize;
Context.MapSpawn.Particles.SpriteSize = SpriteSize_IfResult;
float Constant94 = 0;
float SpriteRotation_IfResult;
SpriteRotation_IfResult = Constant94;
SpriteRotation_IfResult = Context.MapSpawn.Particles.SpriteRotation;
Context.MapSpawn.Particles.SpriteRotation = SpriteRotation_IfResult;
float3 Constant95 = float3(1,1,1);
float3 Scale_IfResult;
Scale_IfResult = Constant95;
Scale_IfResult = Context.MapSpawn.Particles.Scale;
Context.MapSpawn.Particles.Scale = Scale_IfResult;
float3 Position_IfResult;
Position_IfResult = Context.MapSpawn.InitializeParticle.Position;
Position_IfResult = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Position = Position_IfResult;
int Constant101 = (0);
float Constant102 = -300;
float Constant103 = 1100;
int Constant104 = 0;
int Constant105 = 0;
int Constant106 = (0);
int Constant107 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat3;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic3;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant101, Constant102, Constant103, Constant104, Constant105, Constant106, Constant107, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat3, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic3, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat3;
int Constant124 = (0);
bool Constant125 = false;
int Constant126 = 0;
int Constant127 = (0);
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant124, In_OverrideSeed, Constant126, Constant127, In_FixedOverrideSeed, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1, Context);
float Result12 = In_Max - In_Min;
int Seed11;
int Seed21;
int Seed31;
Seed11 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed1;
Seed21 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed2;
Seed31 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed3;
float Result13 = rand_float(Result12, Seed11, Seed21, Seed31);
float Result14 = rand_float(Result12);
float Random_IfResult1;
Random_IfResult1 = Result13;
Random_IfResult1 = Result14;
float Result15 = In_Min + Random_IfResult1;
Out_Result = Result15;
float Result22 = cos(In_Theta*(TWO_PI/In_Period));
float Result23 = In_Radius * Result22;
float Result24 = sin(In_Theta*(TWO_PI/In_Period));
float Result25 = In_Radius * Result24;
float2 XY;
XY.x = Result23;
XY.y = Result25;
float Constant140 = -1;
float Result26 = Result24 * Constant140;
float2 dXdY;
dXdY.x = Result26;
dXdY.y = Result22;
Out_XY = XY;
Out_X = Result23;
Out_Y = Result25;
Out_dXdY = dXdY;
Out_dX = Result26;
Out_dY = Result22;
float Result29 = dot(In_V,In_V);
float Result30 = In_Threshold * In_Threshold;
bool Result31 = NiagaraAll(Result29 < Result30);
float Result32 = length(In_Fallback);
float Result33 = rsqrt(Result29);
float3 Result34 = In_V * Result33;
float Result35 = Reciprocal(Result33);
float3 Constant143 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult = Constant143;
float Constant144 = (0.0);
float Length_SelectResult = Constant144;
Direction_SelectResult = In_Fallback;
Length_SelectResult = Result32;
Direction_SelectResult = Result34;
Length_SelectResult = Result35;
Out_Direction = Direction_SelectResult;
Out_Length = Length_SelectResult;
Out_BelowThreshold = Result31;
float Constant122 = 1;
bool Constant123 = false;
float RandomRangeFloat_Func_Output_Result1;
RandomRangeFloat_Func_(Constant121, Constant122, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant123, RandomRangeFloat_Func_Output_Result1, Context);
float Constant129 = 1;
bool Constant130 = false;
float RandomRangeFloat_Func_Output_Result2;
RandomRangeFloat_Func_(Constant128, Constant129, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant130, RandomRangeFloat_Func_Output_Result2, Context);
float Result16 = pow(max(0, RandomRangeFloat_Func_Output_Result2),In_ConePointDistribution);
float Constant131 = 1e-05;
float Constant132 = 179.875;
float Result17 = clamp(In_ConeAngle,Constant131,Constant132);
float Constant133 = 0.5;
float Result18 = Result17 * Constant133;
float Result19 = tan((PI/180.0f)*Result18);
bool Constant136 = false;
float RandomRangeFloat_Func_Output_Result3;
RandomRangeFloat_Func_(Constant134, Constant135, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant136, RandomRangeFloat_Func_Output_Result3, Context);
float Constant137 = 0.0001;
float Constant138 = 10;
float Result20 = clamp(In_ConeCurvature,Constant137,Constant138);
float Result21 = pow(max(0, RandomRangeFloat_Func_Output_Result1),Result20);
float_IfResult = Result21;
float_IfResult = RandomRangeFloat_Func_Output_Result1;
float Constant139 = 1;
float2 PolarToCartesianCoordinates_Func_Output_XY;
float PolarToCartesianCoordinates_Func_Output_X;
float PolarToCartesianCoordinates_Func_Output_Y;
float2 PolarToCartesianCoordinates_Func_Output_dXdY;
float PolarToCartesianCoordinates_Func_Output_dX;
float PolarToCartesianCoordinates_Func_Output_dY;
PolarToCartesianCoordinates_Func_(RandomRangeFloat_Func_Output_Result3, float_IfResult, Constant139, PolarToCartesianCoordinates_Func_Output_XY, PolarToCartesianCoordinates_Func_Output_X, PolarToCartesianCoordinates_Func_Output_Y, PolarToCartesianCoordinates_Func_Output_dXdY, PolarToCartesianCoordinates_Func_Output_dX, PolarToCartesianCoordinates_Func_Output_dY, Context);
float2 Result27 = Result19 * PolarToCartesianCoordinates_Func_Output_XY;
float2 Result28 = Result16 * Result27;
X = Result28.x;
Y = Result28.y;
Output12.x = RandomRangeFloat_Func_Output_Result1;
Output12.y = X;
Output12.z = Y;
float3 Constant141 = float3(1,0,0);
float Constant142 = 1e-05;
DirectionAndLengthSafe_v1_0_Particle_Func_(Output12, Constant141, Constant142, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold, Context);
Out_Vector = Output12;
Out_NormalizedVector = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float Result39 = In_INPUT_VAR - In_InputLow;
float Result40 = In_InputHigh - In_InputLow;
float Result41 = Result39 / Result40;
float Result42 = In_TargetHigh - In_TargetLow;
float Result43 = Result41 * Result42;
float Result44 = Result43 + In_TargetLow;
Out_Remapped = Result44;
int Constant157 = 0;
bool Result47 = NiagaraAll(In_SourceSpace == Constant157);
int Constant158 = 0;
bool Result48 = NiagaraAll(In_DestinationSpace == Constant158);
bool Result49 = Result47 && Result48;
int Constant159 = 1;
bool Result50 = NiagaraAll(In_SourceSpace == Constant159);
int Constant160 = 1;
bool Result51 = NiagaraAll(In_DestinationSpace == Constant160);
bool Result52 = Result50 && Result51;
bool Result53 = Result49 || Result52;
int Constant161 = 2;
bool Result54 = NiagaraAll(In_SourceSpace == Constant161);
int Constant162 = 2;
bool Result55 = NiagaraAll(In_DestinationSpace == Constant162);
bool Result56 = Result54 && Result55;
bool Result57 = Result53 || Result56;
bool Result58 = Result47 && Result55;
bool Result59 = Result54 && Result48;
bool Result60 = Result58 || Result59;
bool Result61 = In_bLocalSpace && Result60;
bool Result62 = Result57 || Result61;
bool Result63 = !In_bLocalSpace;
bool Result64 = Result47 && Result51;
bool Result65 = Result50 && Result48;
bool Result66 = Result64 || Result65;
bool Result67 = Result63 && Result66;
bool Result68 = Result62 || Result67;
bool Result69 = In_bLocalSpace && Result64;
bool Result70 = Result54 && Result51;
bool Result71 = Result69 || Result70;
bool Result72 = Result63 && Result59;
bool Result73 = Result71 || Result72;
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result68;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result73;
bool Constant156 = false;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant156, TransformBase_Func_Output_bUseOriginal, TransformBase_Func_Output_OutTransform, TransformBase_Func_Output_LocalToWorld, Context);
float3 Result74 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InVector;
Vector_IfResult = Result74;
Out_OutVector = Vector_IfResult;
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
float3 Constant163 = float3(1,0,0);
float Constant164 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_From, Constant163, Constant164, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1, Context);
float3 Constant165 = float3(1,0,0);
float Constant166 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_To, Constant165, Constant166, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2, Context);
float4 CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2, CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result);
Out_NewOutput = CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
float3 Output0;
float Output13;
Output0.x = In_Quaternion.x;
Output0.y = In_Quaternion.y;
Output0.z = In_Quaternion.z;
Output13 = In_Quaternion.w;
float Result75 = dot(Output0,In_VECTOR_VAR);
float Constant167 = 2;
float Result76 = Result75 * Constant167;
float3 Result77 = Output0 * Result76;
float Result78 = Output13 * Output13;
float Result79 = dot(Output0,Output0);
float Result80 = Result78 - Result79;
float3 Result81 = Result80 * In_VECTOR_VAR;
float3 Result82 = Result77 + Result81;
float3 Result83 = cross(Output0,In_VECTOR_VAR);
float Constant168 = 2;
float Result84 = Output13 * Constant168;
float3 Result85 = Result83 * Result84;
float3 Result86 = Result82 + Result85;
Out_Vector = Result86;
float Constant113 = 45;
float Constant114 = 0;
float Constant115 = 1e-05;
float Result11 = max(Constant113, Constant115);
bool Constant116 = false;
float Constant117 = 1;
int Constant118 = -1;
int Constant119 = 0;
bool Constant120 = false;
float3 RandomVectorInCone_Func_Output_Vector;
float3 RandomVectorInCone_Func_Output_NormalizedVector;
RandomVectorInCone_Func_(Result11, Constant114, Constant116, Constant117, Constant118, Constant119, Constant120, RandomVectorInCone_Func_Output_Vector, RandomVectorInCone_Func_Output_NormalizedVector, Context);
float3 Constant145 = float3(1,0,0);
float Result36 = dot(Constant145,RandomVectorInCone_Func_Output_NormalizedVector);
float Constant146 = 0.5;
float Result37 = Result11 * Constant146;
float Result38 = cos((PI/180.0f)*Result37);
float Constant147 = 1;
float Constant149 = 1;
float RemapValueRange_Func_Output_Remapped;
RemapValueRange_Func_(Result36, Result38, Constant147, Constant148, Constant149, RemapValueRange_Func_Output_Remapped, Context);
float Constant151 = 1;
float Result45 = clamp(RemapValueRange_Func_Output_Remapped,Constant150,Constant151);
Context.MapSpawn.Local.AddVelocityInCone.ConeVector = RandomVectorInCone_Func_Output_NormalizedVector;
Context.MapSpawn.Local.AddVelocityInCone.DotBetweenConeVectorAndAxis = Result45;
float3 Constant152 = float3(0,0,1);
float3 Constant153 = float3(1,0,0);
float3 Result46 = normalize(Constant152);
int Constant154 = 0;
bool Constant155 = false;
float3 AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector;
AddVelocityInCone_NF_TransformVector_Emitter_Func_(Result46, Context.MapSpawn.AddVelocityInCone.ConeAxisCoordinateSpace, Constant154, Constant155, AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
float4 FindQuatBetween_v1_0_Func_Output_NewOutput;
FindQuatBetween_v1_0_Func_(Constant153, AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector, FindQuatBetween_v1_0_Func_Output_NewOutput, Context);
float3 MultiplyVectorWithQuaternion_Func_Output_Vector;
MultiplyVectorWithQuaternion_Func_(Context.MapSpawn.Local.AddVelocityInCone.ConeVector, FindQuatBetween_v1_0_Func_Output_NewOutput, MultiplyVectorWithQuaternion_Func_Output_Vector, Context);
Context.MapSpawn.Local.AddVelocityInCone.ConeVector = MultiplyVectorWithQuaternion_Func_Output_Vector;
float Constant169 = 0;
float Constant170 = 0.0001;
float Result87 = max(Constant169, Constant170);
float Result88 = pow(max(0, Context.MapSpawn.Local.AddVelocityInCone.DotBetweenConeVectorAndAxis),Result87);
float Result89 = Context.MapSpawn.AddVelocityInCone.VelocityStrength * Result88;
float float_IfResult1;
float_IfResult1 = Result89;
float_IfResult1 = Context.MapSpawn.AddVelocityInCone.VelocityStrength;
float3 Result90 = Context.MapSpawn.Local.AddVelocityInCone.ConeVector * float_IfResult1;
float3 Result91 = Context.MapSpawn.Particles.Velocity + Result90;
Context.MapSpawn.Particles.Velocity = Result91;
float Constant177 = 1;
float Constant178 = 1e-06;
float Result92 = max(Context.MapSpawn.Particles.Mass, Constant178);
float3 Result93 = Context.MapSpawn.Transient.PhysicsForce / Result92;
float3 Result94 = Result93 + Context.MapSpawn.Particles.Velocity;
float3 Velocity_IfResult;
Velocity_IfResult = Result94;
Velocity_IfResult = Context.MapSpawn.Particles.Velocity;
float Constant179 = 1e-06;
float Result95 = max(Context.MapSpawn.Particles.RotationalInertia, Constant179);
float3 Result96 = Context.MapSpawn.Transient.PhysicsRotationalForce / Result95;
float3 Result97 = Context.MapSpawn.Particles.RotationalVelocity + Result96;
float3 Constant180 = float3(0,0,0);
float3 RotVelocity_IfResult;
float3 RotationalForce_IfResult;
RotVelocity_IfResult = Result97;
RotationalForce_IfResult = Constant180;
RotVelocity_IfResult = Context.MapSpawn.Particles.RotationalVelocity;
RotationalForce_IfResult = Context.MapSpawn.Transient.PhysicsRotationalForce;
float3 Result98 = Context.MapSpawn.Transient.PhysicsForce * Constant177;
float3 Result99 = Context.MapSpawn.Particles.Position + Result98;
float3 Position_IfResult1;
Position_IfResult1 = Result99;
Position_IfResult1 = Context.MapSpawn.Particles.Position;
bool Result100 = Context.MapSpawn.ApplyInitialForces.ApplyForcetoVelocity || Context.MapSpawn.ApplyInitialForces.ApplyForcetoPosition;
float3 Constant181 = float3(0,0,0);
float3 Force_IfResult;
Force_IfResult = Constant181;
Force_IfResult = Context.MapSpawn.Transient.PhysicsForce;
Context.MapSpawn.Particles.Velocity = Velocity_IfResult;
Context.MapSpawn.Particles.RotationalVelocity = RotVelocity_IfResult;
Context.MapSpawn.Particles.Position = Position_IfResult1;
Context.MapSpawn.Transient.PhysicsForce = Force_IfResult;
Context.MapSpawn.Transient.PhysicsRotationalForce = RotationalForce_IfResult;
Context.MapSpawn.OUTPUT_VAR.ApplyInitialForces.IncomingPhysicsForce = Context.MapSpawn.Transient.PhysicsForce;
Context.MapSpawn.OUTPUT_VAR.ApplyInitialForces.IncomingPhysicsRotationalForce = Context.MapSpawn.Transient.PhysicsRotationalForce;
bool Constant210 = false;
float3 Result105 = In_RangeMax - In_RangeMin;
float3 Result106 = rand(Result105);
float3 Result107 = In_RangeMin + Result106;
Out_RandomValue = Result107;
Out_IsDeterministic = Constant210;
int Constant201 = (0);
float Constant202 = 0;
float Constant203 = -1;
float Constant204 = 3;
float Result102 = pow(max(0, In_InnerRadius),Constant204);
float3 Output14;
Output14.x = Constant202;
Output14.y = Constant203;
Output14.z = Result102;
float Result103 = TWO_PI;
float Constant205 = 1;
float Constant206 = 3;
float Result104 = pow(max(0, In_OuterRadius),Constant206);
Output15.x = Result103;
Output15.y = Constant205;
Output15.z = Result104;
int Constant207 = 0;
int Constant208 = (0);
int Constant209 = (0);
float3 CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue;
bool CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant201, Output14, Output15, In_Seed, Constant207, Constant208, Constant209, CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue, CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
float Phi;
float CosASC40ThetaASC41;
float RASC943;
Phi = CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue.x;
CosASC40ThetaASC41 = CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue.y;
RASC943 = CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue.z;
float Result108 = cos(Phi);
float Result109 = CosASC40ThetaASC41 * CosASC40ThetaASC41;
float Result110 = 1 - Result109;
float Result111 = sqrt(Result110);
float Result112 = Result108 * Result111;
float Result113 = sin(Phi);
float Result114 = Result113 * Result111;
Output16.x = Result112;
Output16.y = Result114;
Output16.z = CosASC40ThetaASC41;
float Constant211 = 0.333333;
float Result115 = pow(max(0, RASC943),Constant211);
float3 Result116 = Output16 * Result115;
Out_Ouput = Result116;
Out_Output = float3(In_X, In_Y, In_Z);
bool Constant219 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal1;
float4x4 TransformBase_Func_Output_OutTransform1;
bool TransformBase_Func_Output_LocalToWorld1;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant219, TransformBase_Func_Output_bUseOriginal1, TransformBase_Func_Output_OutTransform1, TransformBase_Func_Output_LocalToWorld1, Context);
float3 Result120 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result120;
Out_OutVector = Vector_IfResult1;
bool Constant225 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal2;
float4x4 TransformBase_Func_Output_OutTransform2;
bool TransformBase_Func_Output_LocalToWorld2;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant225, TransformBase_Func_Output_bUseOriginal2, TransformBase_Func_Output_OutTransform2, TransformBase_Func_Output_LocalToWorld2, Context);
float3 Result127 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result127;
Out_OutVector = Vector_IfResult2;
int Constant196 = 0;
float Constant197 = 0;
float Constant198 = 4;
float Constant199 = 0;
float Result101 = Constant197 * Constant199;
float Constant200 = 1;
float3 CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput;
CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Result101, Constant200, Constant196, CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput, Context);
Context.MapSpawn.Local.SphereLocation001.SphereVector = CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput;
float3 Result117 = abs(Context.MapSpawn.Local.SphereLocation001.SphereVector);
float3 CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output;
CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_(Context.MapSpawn.SphereLocation001.HemisphereX, Context.MapSpawn.SphereLocation001.HemisphereY, Context.MapSpawn.SphereLocation001.HemisphereZ, CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output);
float3 Result118 = lerp(Context.MapSpawn.Local.SphereLocation001.SphereVector,Result117,CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output);
Context.MapSpawn.Local.SphereLocation001.SphereVector = Result118;
float Constant212 = 4;
float3 Constant213 = float3(1,1,1);
float3 Result119 = Constant212 * Context.MapSpawn.Local.SphereLocation001.SphereVector;
Context.MapSpawn.Local.SphereLocation001.SphereVector = Result119;
float3 Constant214 = float3(1,0,0);
Context.MapSpawn.Local.SphereLocation001.SphereVector = Context.MapSpawn.Local.SphereLocation001.SphereVector;
float3 Constant215 = float3(0,0,0);
int Constant216 = 0;
int Constant217 = 0;
bool Constant218 = true;
float3 SphereLocation001_NF_TransformVector_Emitter_Func_Output_OutVector;
SphereLocation001_NF_TransformVector_Emitter_Func_(Context.MapSpawn.Local.SphereLocation001.SphereVector, Context.MapSpawn.SphereLocation001.SphereCoordinateSpace, Constant217, Constant218, SphereLocation001_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result121 = Context.MapSpawn.SphereLocation001.SphereOrigin + SphereLocation001_NF_TransformVector_Emitter_Func_Output_OutVector;
float Constant220 = 1;
float3 Constant221 = float3(1,1,1);
float3 Result122 = Constant221 * Context.MapSpawn.Engine.Owner.Scale;
float3 Result123 = abs(Result122);
float3 Constant222 = float3(0.0001,0.0001,0.0001);
float3 Result124 = max(Result123, Constant222);
float3 Result125 = Constant220 / Result124;
float3 Result126 = Context.MapSpawn.Local.SphereLocation001.SphereVector * Result125;
int Constant223 = 0;
bool Constant224 = true;
float3 SphereLocation001_TransformVector001_Emitter_Func_Output_OutVector;
SphereLocation001_TransformVector001_Emitter_Func_(Result126, Context.MapSpawn.SphereLocation001.SphereCoordinateSpace, Constant223, Constant224, SphereLocation001_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Result128 = normalize(SphereLocation001_TransformVector001_Emitter_Func_Output_OutVector);
Context.MapSpawn.OUTPUT_VAR.SphereLocation001.Position = Result121;
Context.MapSpawn.OUTPUT_VAR.SphereLocation001.SphereVector = SphereLocation001_NF_TransformVector_Emitter_Func_Output_OutVector;
Context.MapSpawn.OUTPUT_VAR.SphereLocation001.SphereNormal = Result128;
Context.MapSpawn.Particles.Position = Context.MapSpawn.OUTPUT_VAR.SphereLocation001.Position;
bool Result129 = NiagaraAll(Context.MapUpdate.Particles.Age <= Context.MapUpdate.Engine.DeltaTime);
Context.MapUpdate.OUTPUT_VAR.ParticleState.FirstFrame = Result129;
Context.MapUpdate.Transient.FirstFrame = Result129;
float Result130 = Context.MapUpdate.Particles.Age + Context.MapUpdate.ParticleState.DeltaTime;
float Constant228 = 1e-05;
float Result131 = max(Context.MapUpdate.ParticleState.Lifetime, Constant228);
float Constant229 = 0.0001;
float Result132 = Result131 - Constant229;
bool Result133 = NiagaraAll(Result130 < Result132);
bool Constant230 = false;
bool bool_IfResult;
bool_IfResult = Context.MapUpdate.DataInstance.Alive;
bool_IfResult = Constant230;
float Result134 = Result130 / Result131;
Context.MapUpdate.DataInstance.Alive = bool_IfResult;
Context.MapUpdate.Particles.Age = Result130;
Context.MapUpdate.Particles.NormalizedAge = Result134;
bool Constant231 = false;
bool Constant232 = true;
bool Constant242 = false;
int Constant243 = 0;
float AgeAdvancement_IfResult;
AgeAdvancement_IfResult = Context.MapUpdate.Emitter.Age;
AgeAdvancement_IfResult = Context.MapUpdate.Engine.Time;
float Constant244 = 4096;
int Constant245 = 0;
float Result135 = rand_float(Constant244, Constant243, Context.MapUpdate.Emitter.RandomSeed, Constant245);
Context.MapUpdate.Local.CurlNoiseForce001.AgeAdvancement = AgeAdvancement_IfResult;
Context.MapUpdate.Local.CurlNoiseForce001.DeterministicOffset = Result135;
Context.MapUpdate.Local.CurlNoiseForce001.SamplePosition = Context.MapUpdate.CurlNoiseForce001.SamplePosition;
float Constant246 = 0.05;
float3 Constant247 = float3(0.1,0.5,0.2);
float3 Result136 = Context.MapUpdate.Local.CurlNoiseForce001.DeterministicOffset + Context.MapUpdate.Local.CurlNoiseForce001.SamplePosition;
float3 Result137 = Result136 * Constant246;
float3 Result138 = Constant247 * Context.MapUpdate.Local.CurlNoiseForce001.AgeAdvancement;
float3 Result139 = Result137 - Result138;
float Constant248 = 125;
float3 Result140 = Result139 * Constant248;
float3 SampleField_Emitter_VectorField32Output_SampledValue;
SampleField_Emitter_VectorField32(Result140, SampleField_Emitter_VectorField32Output_SampledValue);
Context.MapUpdate.Local.CurlNoiseForce001.SampledNoise = SampleField_Emitter_VectorField32Output_SampledValue;
float Constant249 = 1;
float Constant250 = 0;
float Constant251 = 0;
Context.MapUpdate.Local.CurlNoiseForce001.Falloff = Constant249;
Context.MapUpdate.CurlNoiseForce001.CurlNoiseConeMaskAngle = Constant250;
Context.MapUpdate.CurlNoiseForce001.CurlNoiseConeMaskFalloffAngle = Constant251;
Context.MapUpdate.CurlNoiseForce001.CurlNoiseConeMaskAxis = Context.MapUpdate.CurlNoiseForce001.CurlNoiseConeMaskAxis;
float Constant252 = 300;
float3 Result141 = Context.MapUpdate.Local.CurlNoiseForce001.SampledNoise * Constant252;
float3 Result142 = Context.MapUpdate.Transient.PhysicsForce + Result141;
Context.MapUpdate.Transient.PhysicsForce = Result142;
Context.MapUpdate.OUTPUT_VAR.CurlNoiseForce001.CurlNoiseForce = Result141;
float3 Constant254 = float3(0,0,-980);
float3 Result143 = Constant254 * Context.MapUpdate.Particles.Mass;
float3 Result144 = Context.MapUpdate.Transient.PhysicsForce + Result143;
Context.MapUpdate.Transient.PhysicsForce = Result144;
float Constant259 = 1;
float Result145 = Constant259 + Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsDrag = Result145;
float Constant260 = 1;
Context.MapUpdate.Transient.PhysicsRotationalDrag = Context.MapUpdate.Transient.PhysicsRotationalDrag;
float Constant262 = 1;
float SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value;
SampleCurve_Emitter_ScaleAlpha_FloatCurve(Context.MapUpdate.FloatFromCurve.CurveIndex, SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value);
float Result146 = SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value * Constant262;
Out_Value = Result146;
float3 Constant265 = float3(1,1,1);
float4 Output01;
Output01.r = Constant265.x;
Output01.g = Constant265.y;
Output01.b = Constant265.z;
Output01.a = Context.MapUpdate.ScaleColor.ScaleAlpha;
float4 Result147 = Context.MapUpdate.Transient.ParticleColorScaleFactor * Output01;
float4 Result148 = Context.MapUpdate.ScaleColor.ColorValueToScale * Result147;
Context.MapUpdate.Particles.Color = Result148;
Context.MapUpdate.Transient.ParticleColorScaleFactor = Result147;
bool Constant302 = false;
float4x4 Matrix_IfResult4;
float4x4 Matrix001_IfResult3;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal3;
float4x4 TransformBase_Func_Output_OutTransform3;
bool TransformBase_Func_Output_LocalToWorld3;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant302, TransformBase_Func_Output_bUseOriginal3, TransformBase_Func_Output_OutTransform3, TransformBase_Func_Output_LocalToWorld3, Context);
float3 Result154 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InPosition;
Vector_IfResult3 = Result154;
Out_OutPosition = Vector_IfResult3;
bool Constant306 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult4;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal4;
float4x4 TransformBase_Func_Output_OutTransform4;
bool TransformBase_Func_Output_LocalToWorld4;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult4, Constant306, TransformBase_Func_Output_bUseOriginal4, TransformBase_Func_Output_OutTransform4, TransformBase_Func_Output_LocalToWorld4, Context);
float3 Result155 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InVector;
Vector_IfResult4 = Result155;
Out_OutVector = Vector_IfResult4;
bool Constant310 = false;
float4x4 Matrix_IfResult6;
float4x4 Matrix001_IfResult5;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal5;
float4x4 TransformBase_Func_Output_OutTransform5;
bool TransformBase_Func_Output_LocalToWorld5;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult5, Constant310, TransformBase_Func_Output_bUseOriginal5, TransformBase_Func_Output_OutTransform5, TransformBase_Func_Output_LocalToWorld5, Context);
float3 Result156 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InVector;
Vector_IfResult5 = Result156;
Out_OutVector = Vector_IfResult5;
float Result157 = length(In_SpriteSize);
float Constant312 = 0.5;
float Result158 = Result157 * Constant312;
Out_Radius = Result158;
float3 Result165 = In_Velocity - In_AdvectionVelocity;
float Result166 = In_Drag * In_InverseMass;
float Constant328 = (0.0);
float NiagaraFloat_SelectResult2 = Constant328;
NiagaraFloat_SelectResult2 = In_Drag;
NiagaraFloat_SelectResult2 = Result166;
float Constant329 = 0;
float Result167 = max(NiagaraFloat_SelectResult2, Constant329);
float Result168 = Result167 * In_DeltaTime;
float Constant330 = 1;
float Result169 = Result168 + Constant330;
float3 Result170 = Result165 / Result169;
float3 Result171 = Result170 + In_AdvectionVelocity;
Out_Output = Result171;
float QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SceneDepth;
float3 QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_CameraPosWorld;
bool QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_IsInsideView;
float3 QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SamplePosWorld;
float3 QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SampleWorldNormal;
QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_Query(In_ParticlePosition, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SceneDepth, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_CameraPosWorld, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_IsInsideView, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SamplePosWorld, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SampleWorldNormal);
float3 Result178 = In_ParticlePosition - QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_CameraPosWorld;
float Result179 = length(Result178);
float Result180 = Result179 - In_ParticleRadius;
float3 Result181 = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SamplePosWorld - QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_CameraPosWorld;
float Result182 = length(Result181);
float Result183 = Result180 - Result182;
float Constant336 = 0;
bool Result184 = NiagaraAll(Result183 >= Constant336);
float3 Result185 = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SamplePosWorld - In_ParticlePosition;
float Result186 = length(Result185);
bool Result187 = NiagaraAll(Result186 <= In_MaximumCollisionDistance);
float Result188 = dot(In_ParticlePosition,QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SampleWorldNormal);
float Result189 = Result188 + In_ParticleRadius;
float Result190 = dot(QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SamplePosWorld,QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SampleWorldNormal);
float Result191 = Result189 - Result190;
float Constant337 = 0;
bool Result192 = NiagaraAll(Result191 >= Constant337);
float Result193 = dot(QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SampleWorldNormal,In_EndTrace);
float Result194 = Result193 - Result190 - In_ParticleRadius;
float Constant338 = 0;
bool Result195 = NiagaraAll(Result194 <= Constant338);
float3 Result196 = In_EndTrace - In_StartTrace;
float Result197 = dot(QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SampleWorldNormal,Result196);
float Constant339 = 0;
bool Result198 = NiagaraAll(Result197 < Constant339);
bool Result199 = Result187 && Result192 && Result195 && Result198;
float Constant340 = 0;
bool Result200 = NiagaraAll(Result183 > Constant340);
bool Result201 = In_KillOccludedParticles && Result200;
Out_ImpactPosition = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SamplePosWorld;
Out_ImpactNormal = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_SampleWorldNormal;
Out_Occluded = Result184;
Out_Collides = Result199;
Out_Onscreentest = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse_QueryOutput_IsInsideView;
Out_KillBecauseofOcclusion = Result201;
float3 Result209 = -(In_PlaneNormal);
float3 Result210 = In_PlanePivotPoint - In_InitialSphereLocation;
float Result211 = dot(Result209,Result210);
float Result212 = Result211 - In_CollisionRadius;
float Constant344 = 0;
bool Result213 = NiagaraAll(Result212 < Constant344);
bool Constant345 = true;
float3 Result214 = Result209 * Result211;
float3 Result215 = Result214 + In_InitialSphereLocation;
float Result216 = max(In_MaxCorrectiondistance, Result212);
float3 Result217 = Result216 * Result209;
float3 Result218 = Result217 + In_InitialSphereLocation;
float Constant346 = 0;
float Constant347 = 0;
float3 Result219 = In_InitialSphereLocation + In_SpherePositionDelta;
float3 Result220 = In_PlanePivotPoint - Result219;
float Result221 = dot(Result209,Result220);
float Result222 = Result221 - In_CollisionRadius;
float Constant348 = 0;
bool Result223 = NiagaraAll(Result222 <= Constant348);
float Result224 = abs(Result222);
float Result225 = Result212 - Result222;
float Result226 = abs(Result225);
float Constant349 = 1e-06;
float Result227 = max(Result226, Constant349);
float Result228 = Result224 / Result227;
float Constant350 = 0;
bool Result229 = NiagaraAll(Result228 == Constant350);
bool Result230 = Result213 || Result229;
float Constant351 = 1;
float float_IfResult2;
float_IfResult2 = Constant351;
float_IfResult2 = Result228;
float Result231 = 1 - float_IfResult2;
float3 Result232 = Result231 * In_SpherePositionDelta;
float3 Result233 = In_InitialSphereLocation + Result232;
float3 Result234 = Result209 * In_CollisionRadius;
float3 Result235 = Result233 + Result234;
float3 Result236 = Result235 - Result233;
float Result237 = In_PhysicsDeltaTime * Result231;
float Result238 = In_PhysicsDeltaTime * float_IfResult2;
bool Collides_IfResult;
float3 IntersectionLocation_IfResult;
float3 PreASC45IntersectionSphereCenterLocation_IfResult;
float3 InitialPositionRelativeCollisionLocation_IfResult;
float TimeElapsedToCollision_IfResult;
float RemainingTimePostCollision_IfResult;
float PercentageofTimeUsedToPerformCollision_IfResult;
float InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision_IfResult;
float UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane_IfResult;
Collides_IfResult = Constant345;
IntersectionLocation_IfResult = Result215;
PreASC45IntersectionSphereCenterLocation_IfResult = Result218;
InitialPositionRelativeCollisionLocation_IfResult = Result214;
TimeElapsedToCollision_IfResult = Constant346;
RemainingTimePostCollision_IfResult = In_PhysicsDeltaTime;
PercentageofTimeUsedToPerformCollision_IfResult = Constant347;
InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision_IfResult = Result212;
UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane_IfResult = Result222;
Collides_IfResult = Result223;
IntersectionLocation_IfResult = Result235;
PreASC45IntersectionSphereCenterLocation_IfResult = Result233;
InitialPositionRelativeCollisionLocation_IfResult = Result236;
TimeElapsedToCollision_IfResult = Result237;
RemainingTimePostCollision_IfResult = Result238;
PercentageofTimeUsedToPerformCollision_IfResult = Result231;
Out_Collides = Collides_IfResult;
Out_IntersectionLocation = IntersectionLocation_IfResult;
Out_PreASC45IntersectionSphereCenterLocation = PreASC45IntersectionSphereCenterLocation_IfResult;
Out_InitialPositionRelativeCollisionLocation = InitialPositionRelativeCollisionLocation_IfResult;
Out_TimeElapsedToCollision = TimeElapsedToCollision_IfResult;
Out_RemainingTimePostCollision = RemainingTimePostCollision_IfResult;
Out_PercentageofTimeUsedToPerformCollision = PercentageofTimeUsedToPerformCollision_IfResult;
Out_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision = InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision_IfResult;
Out_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane = UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane_IfResult;
int Constant362 = (0);
bool Constant363 = false;
int Constant364 = 0;
int Constant365 = (0);
bool Constant366 = false;
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo2;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms2;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant362, In_OverrideSeed, Constant364, Constant365, Constant366, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo2, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms2, Context);
float2 Result254 = In_Max - In_Min;
int Seed12;
int Seed22;
int Seed32;
Seed12 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo2.Seed1;
Seed22 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo2.Seed2;
Seed32 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo2.Seed3;
float2 Result255 = rand_float(Result254, Seed12, Seed22, Seed32);
float2 Result256 = rand_float(Result254);
float2 Random_IfResult2;
Random_IfResult2 = Result255;
Random_IfResult2 = Result256;
float2 Result257 = In_Min + Random_IfResult2;
Out_Result = Result257;
float Constant356 = 0;
float Constant357 = 1;
float Result252 = clamp(In_Spread,Constant356,Constant357);
float Constant358 = -1;
float Result253 = Result252 * Constant358;
float2 Output17;
Output17.x = Result253;
Output17.y = Result253;
float2 Output18;
Output18.x = Result252;
Output18.y = Result252;
int Constant359 = -1;
int Constant360 = 0;
bool Constant361 = false;
float2 RandomRangeFloat_Func_Output_Result4;
RandomRangeFloat_Func_(Output17, Output18, Constant359, Constant360, Constant361, RandomRangeFloat_Func_Output_Result4, Context);
X1 = RandomRangeFloat_Func_Output_Result4.x;
Y1 = RandomRangeFloat_Func_Output_Result4.y;
float3 Constant367 = float3(1,0,0);
float3 Result258 = X1 * Constant367;
float3 Constant368 = float3(0,1,0);
float3 Result259 = Y1 * Constant368;
float3 Result260 = Result258 + Result259;
float Result261 = abs(X1);
float Result262 = abs(Y1);
float Result263 = max(Result261, Result262);
float Result264 = 1 - Result263;
float3 Constant369 = float3(0,0,1);
float3 Result265 = Result264 * Constant369;
float3 Result266 = Result260 + Result265;
float3 Result267 = normalize(Result266);
float3 Result268 = Result267 * In_Scale;
float3 Constant370 = float3(0,0,1);
float3 Constant371 = float3(0,0,1);
float Constant372 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction5;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length5;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold5;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_ConeAxis, Constant371, Constant372, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction5, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length5, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold5, Context);
float4 FindQuatBetween_v1_0_Func_Output_NewOutput1;
FindQuatBetween_v1_0_Func_(Constant370, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction5, FindQuatBetween_v1_0_Func_Output_NewOutput1, Context);
float3 MultiplyVectorWithQuaternion_Func_Output_Vector1;
MultiplyVectorWithQuaternion_Func_(Result268, FindQuatBetween_v1_0_Func_Output_NewOutput1, MultiplyVectorWithQuaternion_Func_Output_Vector1, Context);
Out_Ouput = MultiplyVectorWithQuaternion_Func_Output_Vector1;
float Result269 = dot(In_InVector,In_Normal);
float Result270 = Result269 + Result269;
float3 Result271 = Result270 * In_Normal;
float3 Result272 = In_InVector - Result271;
Out_Reflected = Result272;
float Constant373 = 0.01;
float3 Result273 = In_INPUT_VAR * Constant373;
float Constant374 = 100;
float3 Result274 = In_INPUT_VAR * Constant374;
Out_CentimeterstoMeters = Result273;
Out_MeterstoCentimeters = Result274;
float Result279 = dot(In_VECTOR_VAR,In_VECTOR_VAR);
float Result280 = In_Threshold * In_Threshold;
bool Result281 = NiagaraAll(Result279 < Result280);
float Result282 = length(In_FallbackVector);
float Result283 = rsqrt(Result279);
float3 Result284 = In_VECTOR_VAR * Result283;
float Result285 = Reciprocal(Result283);
float3 Constant379 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult3 = Constant379;
float Constant380 = (0.0);
float Length_SelectResult3 = Constant380;
Direction_SelectResult3 = In_FallbackVector;
Length_SelectResult3 = Result282;
Direction_SelectResult3 = Result284;
Length_SelectResult3 = Result285;
Out_BelowThreshold = Result281;
float Result278 = dot(In_VECTOR_VAR,In_Normal);
float3 Constant377 = float3(0,0,0);
float Constant378 = 1e-05;
float3 DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction;
float DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length;
bool DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold;
DirectionAndLengthSafe_v1_1_Particle_Func_(In_Normal, Constant377, Constant378, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold, Context);
float3 Constant381 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult4 = Constant381;
Vector3f_SelectResult4 = DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction;
Vector3f_SelectResult4 = In_Normal;
float3 Result286 = Result278 * Vector3f_SelectResult4;
float3 Result287 = In_VECTOR_VAR - Result286;
Out_Ouput = Result287;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleInitialDataInstanceAlive = Context.MapUpdate.DataInstance.Alive;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_PredictedParticlePositionForSimStages = Context.MapUpdate.Transient.Collision_PredictedParticlePositionForSimStages;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime = Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime;
float Result161 = Reciprocal(Context.MapUpdate.Transient.Collision_ParticleMassReplacement);
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement;
Context.MapUpdate.Transient.Collision_ParticleMassReplacement = Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement = Result161;
float3 Result162 = Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 Result163 = Result162 * Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime;
float3 Result164 = Result163 + Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
float3 DragVelocity_Particle_Func_Output_Output;
DragVelocity_Particle_Func_(Result164, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, DragVelocity_Particle_Func_Output_Output, Context);
float3 Result172 = DragVelocity_Particle_Func_Output_Output * Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleInitialForceDividedByMass = Result162;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleForceContribution = Result163;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate = Result172;
float3 Constant331 = float3(0,0,-1);
float Constant332 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction3;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length3;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold3;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleForceContribution, Constant331, Constant332, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction3, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length3, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold3, Context);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceVector = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleForceContribution;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceDirection = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction3;
float3 Result173 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction3 * Context.MapUpdate.Collision001.CollisionQueryAndResponse.ParticleRadius;
float3 Result174 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceOrigin - Result173;
float3 Result175 = Result173 + Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleForceContribution;
float3 Constant333 = float3(0,0,-1);
float Constant334 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction4;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length4;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold4;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result175, Constant333, Constant334, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction4, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length4, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold4, Context);
float3 Result176 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction4 * DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length4;
float3 Result177 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceOrigin + Result176;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceWorldStart = Result174;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceWorldEnd = Result177;
int Constant335 = 0;
float3 Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_ImpactPosition;
float3 Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_ImpactNormal;
bool Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Occluded;
bool Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Collides;
bool Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Onscreentest;
bool Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_KillBecauseofOcclusion;
Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_(Context.MapUpdate.Collision001.CollisionQueryAndResponse.ParticleRadius, Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceWorldEnd, Context.MapUpdate.Collision001.CollisionQueryAndResponse.KillOccludedParticles, Context.MapUpdate.Collision001.CollisionQueryAndResponse.MaxSceneDepthCollisionDistance, Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_ImpactPosition, Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_ImpactNormal, Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Occluded, Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Collides, Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Onscreentest, Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_KillBecauseofOcclusion, Context);
float Constant341 = 0;
bool Result202 = !Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Onscreentest;
bool Result203 = Result202 && Context.MapUpdate.Particles.HasCollided;
bool Result204 = !Result203;
bool Result205 = Context.MapUpdate.Collision001.CollisionQueryAndResponse.AllowOffscreenDepthBufferParticlesToLive || Result204;
bool Result206 = Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Onscreentest && Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_KillBecauseofOcclusion;
bool Result207 = !Result206;
bool Result208 = Context.MapUpdate.DataInstance.Alive && Result205 && Result207;
Context.MapUpdate.Particles.Collision001.CollisionQueryAndResponse.CollisionID = Constant335;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedCollisionValidBool = Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Collides;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition = Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_ImpactPosition;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedCollisionNormal = Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_ImpactNormal;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedFriction = Constant341;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedRestitution = Context.MapUpdate.Collision001.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient;
Context.MapUpdate.DataInstance.Alive = Result208;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.ModuleDepthBasedCollisionParticleOccluded = Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Occluded;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.ParticleOnScreen = Collision001_CollisionQueryAndResponse_SceneDepthTest003_Emitter_Func_Output_Onscreentest;
float3 Constant342 = float3(0,0,1);
float3 Constant343 = float3(0,0,-1e+16);
float3 PlaneNormal_IfResult;
float3 PlanePivotPoint_IfResult;
PlaneNormal_IfResult = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult = Constant342;
PlanePivotPoint_IfResult = Constant343;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePlaneNormal = PlaneNormal_IfResult;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePlanePivotPoint = PlanePivotPoint_IfResult;
bool PlaneSphereCollisionDetection_Func_Output_Collides;
float3 PlaneSphereCollisionDetection_Func_Output_IntersectionLocation;
float3 PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation;
float3 PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation;
float PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision;
float PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision;
float PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision;
float PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
float PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
PlaneSphereCollisionDetection_Func_(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePlaneNormal, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceOrigin, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision001.CollisionQueryAndResponse.ParticleRadius, Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime, Context.MapUpdate.Collision001.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance, PlaneSphereCollisionDetection_Func_Output_Collides, PlaneSphereCollisionDetection_Func_Output_IntersectionLocation, PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation, PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation, PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision, PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision, PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision, PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision, PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = PlaneSphereCollisionDetection_Func_Output_IntersectionLocation;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTickDeltaForThisCollisionUpdate = PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePhysicsDeltaTime = PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePercentageOfTickDedicatedToUpdatingPosition = PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.CollisionPenetrationDistance = PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision;
Context.MapUpdate.Transient.CollisionDistanceToCollision = PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane;
float Constant352 = 0;
bool Result239 = NiagaraAll(Context.MapUpdate.Transient.CollisionDistanceToCollision <= Constant352);
bool Result240 = Context.MapUpdate.Collision001.CollisionQueryAndResponse.CollisionEnabled && Result239;
bool Result241 = Result240 || Context.MapUpdate.Particles.HasCollided;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.PhysicsCollidesThisFrame = Result240;
Context.MapUpdate.Particles.HasCollided = Result241;
float3 Result242 = -(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePlaneNormal);
float Result243 = dot(Result242,Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate);
float Result244 = Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime * Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime;
float3 Result245 = Result244 * Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleInitialForceDividedByMass;
float Result246 = dot(Result242,Result245);
float Result247 = Result243 - Result246;
float Constant353 = 0.1;
bool Result248 = NiagaraAll(Result247 < Constant353);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleRemoveRestitution = Result248;
float3 Result249 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleAttemptedMovementThisUpdate / Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime;
float float_IfResult3;
float_IfResult3 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePhysicsDeltaTime;
float_IfResult3 = Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime;
float Constant354 = 0;
float float_IfResult4;
float_IfResult4 = Constant354;
float_IfResult4 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedRestitution;
Context.MapUpdate.Transient.CollisionValid = Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.PhysicsCollidesThisFrame;
Context.MapUpdate.Transient.CollisionSize = Context.MapUpdate.Collision001.CollisionQueryAndResponse.ParticleRadius;
Context.MapUpdate.Transient.CollisionNormal = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModulePlaneNormal;
Context.MapUpdate.Transient.CollisionVelocity = Result249;
Context.MapUpdate.Transient.CollisionFriction = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReturnedFriction;
Context.MapUpdate.Transient.PhysicsDeltaTime = float_IfResult3;
Context.MapUpdate.Transient.CollisionRestitution = float_IfResult4;
bool Result250 = !Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleRemoveRestitution;
bool Result251 = Result250 && Context.MapUpdate.Collision001.CollisionQueryAndResponse.RandomizeCollisionNormal;
float Constant355 = 1;
float3 RandomizeCollisionNormals_Func_Output_Ouput;
RandomizeCollisionNormals_Func_(Context.MapUpdate.Transient.CollisionNormal, Constant355, Context.MapUpdate.Collision001.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage, RandomizeCollisionNormals_Func_Output_Ouput, Context);
float3 Vector_IfResult6;
Vector_IfResult6 = RandomizeCollisionNormals_Func_Output_Ouput;
Vector_IfResult6 = Context.MapUpdate.Transient.CollisionNormal;
float3 ReflectVector_Func_Output_Reflected;
ReflectVector_Func_(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult6, ReflectVector_Func_Output_Reflected, Context);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReflectedVelocity = ReflectVector_Func_Output_Reflected;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters;
CentimeterMeterConversion_Func_(Context.MapUpdate.Transient.CollisionVelocity, CentimeterMeterConversion_Func_Output_CentimeterstoMeters, CentimeterMeterConversion_Func_Output_MeterstoCentimeters, Context);
float3 Result275 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * CentimeterMeterConversion_Func_Output_CentimeterstoMeters;
float Constant375 = -1;
float3 Result276 = Result275 * Constant375;
float Result277 = dot(Result276,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleNormalForceInNewtons = Result277;
bool Constant376 = false;
float3 ProjectVectorOnPlane_Particle_Func_Output_Ouput;
ProjectVectorOnPlane_Particle_Func_(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant376, ProjectVectorOnPlane_Particle_Func_Output_Ouput, Context);
float3 Constant382 = float3(0,0,0);
float Constant383 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length6;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold6;
DirectionAndLengthSafe_v1_0_Particle_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput, Constant382, Constant383, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length6, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold6, Context);
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters1;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters1;
CentimeterMeterConversion_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput, CentimeterMeterConversion_Func_Output_CentimeterstoMeters1, CentimeterMeterConversion_Func_Output_MeterstoCentimeters1, Context);
float3 Result288 = CentimeterMeterConversion_Func_Output_CentimeterstoMeters1 * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float float_IfResult5;
float_IfResult5 = Context.MapUpdate.Collision001.CollisionQueryAndResponse.DynamicFrictionCoefficient;
float_IfResult5 = Context.MapUpdate.Collision001.CollisionQueryAndResponse.BounceCollisionFriction;
float3 Result289 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6 * float_IfResult5 * Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleNormalForceInNewtons;
float3 Result290 = Result288 - Result289;
float3 Constant384 = float3(0,0,0);
float Constant385 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction7;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length7;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold7;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result290, Constant384, Constant385, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction7, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length7, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold7, Context);
float Result291 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction6,DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction7);
float Constant386 = 0;
bool Result292 = NiagaraAll(Result291 <= Constant386);
float3 Vector_IfResult7;
Vector_IfResult7 = Result288;
Vector_IfResult7 = Result289;
float Constant387 = -1;
float3 Result293 = Vector_IfResult7 * Constant387;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons = Result293;
float3 Result294 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters2;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters2;
CentimeterMeterConversion_Func_(Result294, CentimeterMeterConversion_Func_Output_CentimeterstoMeters2, CentimeterMeterConversion_Func_Output_MeterstoCentimeters2, Context);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector = CentimeterMeterConversion_Func_Output_MeterstoCentimeters2;
float3 Result295 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReflectedVelocity + Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleFrictionForceVelocityVector;
float Result296 = dot(Context.MapUpdate.Transient.CollisionNormal,Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReflectedVelocity);
float3 Result297 = Context.MapUpdate.Transient.CollisionNormal * Result296;
float Result298 = 1 - Context.MapUpdate.Transient.CollisionRestitution;
float3 Result299 = Result297 * Result298;
float3 Result300 = Result295 - Result299;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReflectedVelocityWithFrictionApplied = Result300;
float3 Particleposition_IfResult;
Particleposition_IfResult = Context.MapUpdate.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult;
float3 Constant388 = float3(0,0,1);
float Constant389 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction8;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length8;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold8;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant388, Constant389, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction8, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length8, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold8, Context);
float Result301 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction8,Context.MapUpdate.Transient.CollisionNormal);
float Constant390 = 0;
bool Result302 = NiagaraAll(Result301 < Constant390);
bool Result303 = Result302 && Context.MapUpdate.Transient.CollisionValid;
float3 Constant391 = float3(0,0,0);
float3 physicsforce_IfResult;
float3 Velocity_IfResult1;
physicsforce_IfResult = Constant391;
Velocity_IfResult1 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleReflectedVelocityWithFrictionApplied;
physicsforce_IfResult = Context.MapUpdate.Transient.PhysicsForce;
Velocity_IfResult1 = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Velocity_IfResult1;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = physicsforce_IfResult;
Out_ModuleTraceWorldStart = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceWorldStart;
Out_ModuleTraceWorldEnd = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse.ModuleTraceWorldEnd;
Out_CollisionPosition = Context.MapUpdate.Transient.CollisionWorldPosition;
Out_CollisionNormal = Context.MapUpdate.Transient.CollisionNormal;
Out_Collided = Context.MapUpdate.Transient.CollisionValid;
float QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SceneDepth;
float3 QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_CameraPosWorld;
bool QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_IsInsideView;
float3 QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SamplePosWorld;
float3 QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SampleWorldNormal;
QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_Query(In_ParticlePosition, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SceneDepth, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_CameraPosWorld, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_IsInsideView, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SamplePosWorld, QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SampleWorldNormal);
float3 Result314 = In_ParticlePosition - QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_CameraPosWorld;
float Result315 = length(Result314);
float Result316 = Result315 - In_ParticleRadius;
float3 Result317 = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SamplePosWorld - QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_CameraPosWorld;
float Result318 = length(Result317);
float Result319 = Result316 - Result318;
float Constant401 = 0;
bool Result320 = NiagaraAll(Result319 >= Constant401);
float3 Result321 = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SamplePosWorld - In_ParticlePosition;
float Result322 = length(Result321);
bool Result323 = NiagaraAll(Result322 <= In_MaximumCollisionDistance);
float Result324 = dot(In_ParticlePosition,QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SampleWorldNormal);
float Result325 = Result324 + In_ParticleRadius;
float Result326 = dot(QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SamplePosWorld,QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SampleWorldNormal);
float Result327 = Result325 - Result326;
float Constant402 = 0;
bool Result328 = NiagaraAll(Result327 >= Constant402);
float Result329 = dot(QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SampleWorldNormal,In_EndTrace);
float Result330 = Result329 - Result326 - In_ParticleRadius;
float Constant403 = 0;
bool Result331 = NiagaraAll(Result330 <= Constant403);
float3 Result332 = In_EndTrace - In_StartTrace;
float Result333 = dot(QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SampleWorldNormal,Result332);
float Constant404 = 0;
bool Result334 = NiagaraAll(Result333 < Constant404);
bool Result335 = Result323 && Result328 && Result331 && Result334;
float Constant405 = 0;
bool Result336 = NiagaraAll(Result319 > Constant405);
bool Result337 = In_KillOccludedParticles && Result336;
Out_ImpactPosition = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SamplePosWorld;
Out_ImpactNormal = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_SampleWorldNormal;
Out_Occluded = Result320;
Out_Collides = Result335;
Out_Onscreentest = QuerySceneDepthGPU_Collision001_CollisionQueryAndResponse001_QueryOutput_IsInsideView;
Out_KillBecauseofOcclusion = Result337;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleInitialDataInstanceAlive = Context.MapUpdate.DataInstance.Alive;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime;
float Result304 = Reciprocal(Context.MapUpdate.Transient.Collision_ParticleMassReplacement);
Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement = Result304;
float3 Result305 = Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 Result306 = Result305 * Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime;
float3 Result307 = Result306 + Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
float3 DragVelocity_Particle_Func_Output_Output1;
DragVelocity_Particle_Func_(Result307, Context.MapUpdate.Transient.AdvectionVelocity, Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement, Context.MapUpdate.Transient.PhysicsDrag, Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Transient.DragIgnoreMass, DragVelocity_Particle_Func_Output_Output1, Context);
float3 Result308 = DragVelocity_Particle_Func_Output_Output1 * Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceOrigin = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass = Result305;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleForceContribution = Result306;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate = Result308;
float3 Constant396 = float3(0,0,-1);
float Constant397 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length9;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold9;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Constant396, Constant397, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length9, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold9, Context);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceVector = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceDirection = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9;
float3 Result309 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction9 * Context.MapUpdate.Collision001.CollisionQueryAndResponse001.ParticleRadius;
float3 Result310 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceOrigin - Result309;
float3 Result311 = Result309 + Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate;
float3 Constant398 = float3(0,0,-1);
float Constant399 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction10;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length10;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold10;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result311, Constant398, Constant399, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction10, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length10, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold10, Context);
float3 Result312 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction10 * DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length10;
float3 Result313 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceOrigin + Result312;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceWorldStart = Result310;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceWorldEnd = Result313;
int Constant400 = 0;
float3 Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_ImpactPosition;
float3 Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_ImpactNormal;
bool Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Occluded;
bool Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Collides;
bool Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Onscreentest;
bool Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_KillBecauseofOcclusion;
Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_(Context.MapUpdate.Collision001.CollisionQueryAndResponse001.ParticleRadius, Context.MapUpdate.Transient.Collision_ParticlePositionReplacement, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceWorldStart, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceWorldEnd, Context.MapUpdate.Collision001.CollisionQueryAndResponse001.KillOccludedParticles, Context.MapUpdate.Collision001.CollisionQueryAndResponse001.MaxSceneDepthCollisionDistance, Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_ImpactPosition, Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_ImpactNormal, Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Occluded, Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Collides, Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Onscreentest, Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_KillBecauseofOcclusion, Context);
float Constant406 = 0;
bool Result338 = !Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Onscreentest;
bool Result339 = Result338 && Context.MapUpdate.Particles.HasCollided;
bool Result340 = !Result339;
bool Result341 = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.AllowOffscreenDepthBufferParticlesToLive || Result340;
bool Result342 = Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Onscreentest && Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_KillBecauseofOcclusion;
bool Result343 = !Result342;
bool Result344 = Context.MapUpdate.DataInstance.Alive && Result341 && Result343;
Context.MapUpdate.Particles.Collision001.CollisionQueryAndResponse001.CollisionID = Constant400;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedCollisionValidBool = Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Collides;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition = Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_ImpactPosition;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal = Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_ImpactNormal;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedFriction = Constant406;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedRestitution = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient;
Context.MapUpdate.DataInstance.Alive = Result344;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.ModuleDepthBasedCollisionParticleOccluded = Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Occluded;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.ParticleOnScreen = Collision001_CollisionQueryAndResponse001_SceneDepthTest003_Emitter_Func_Output_Onscreentest;
float3 Constant407 = float3(0,0,1);
float3 Constant408 = float3(0,0,-1e+16);
float3 PlaneNormal_IfResult1;
float3 PlanePivotPoint_IfResult1;
PlaneNormal_IfResult1 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedCollisionNormal;
PlanePivotPoint_IfResult1 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedCollisionWorldPosition;
PlaneNormal_IfResult1 = Constant407;
PlanePivotPoint_IfResult1 = Constant408;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePlaneNormal = PlaneNormal_IfResult1;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePlanePivotPoint = PlanePivotPoint_IfResult1;
bool PlaneSphereCollisionDetection_Func_Output_Collides1;
float3 PlaneSphereCollisionDetection_Func_Output_IntersectionLocation1;
float3 PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation1;
float3 PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation1;
float PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision1;
float PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision1;
float PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision1;
float PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
float PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
PlaneSphereCollisionDetection_Func_(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePlaneNormal, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePlanePivotPoint, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceOrigin, Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate, Context.MapUpdate.Collision001.CollisionQueryAndResponse001.ParticleRadius, Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime, Context.MapUpdate.Collision001.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance, PlaneSphereCollisionDetection_Func_Output_Collides1, PlaneSphereCollisionDetection_Func_Output_IntersectionLocation1, PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation1, PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation1, PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision1, PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision1, PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision1, PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1, PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1, Context);
Context.MapUpdate.Transient.CollisionWorldPosition = PlaneSphereCollisionDetection_Func_Output_IntersectionLocation1;
Context.MapUpdate.Transient.CollisionParticleWorldPosition = PlaneSphereCollisionDetection_Func_Output_PreASC45IntersectionSphereCenterLocation1;
Context.MapUpdate.Transient.CollisionParticleRelativeCollisionLocation = PlaneSphereCollisionDetection_Func_Output_InitialPositionRelativeCollisionLocation1;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTickDeltaForThisCollisionUpdate = PlaneSphereCollisionDetection_Func_Output_TimeElapsedToCollision1;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePhysicsDeltaTime = PlaneSphereCollisionDetection_Func_Output_RemainingTimePostCollision1;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePercentageOfTickDedicatedToUpdatingPosition = PlaneSphereCollisionDetection_Func_Output_PercentageofTimeUsedToPerformCollision1;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.CollisionPenetrationDistance = PlaneSphereCollisionDetection_Func_Output_InitialDistanceBetweenTheSphereASC39sSurfaceandtheCollision1;
Context.MapUpdate.Transient.CollisionDistanceToCollision = PlaneSphereCollisionDetection_Func_Output_UninterruptedAnimatedSphereASC39sDistancetoCollisionPlane1;
float Constant409 = 0;
bool Result345 = NiagaraAll(Context.MapUpdate.Transient.CollisionDistanceToCollision <= Constant409);
bool Result346 = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.CollisionEnabled && Result345;
bool Result347 = Result346 || Context.MapUpdate.Particles.HasCollided;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.PhysicsCollidesThisFrame = Result346;
Context.MapUpdate.Particles.HasCollided = Result347;
float3 Result348 = -(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePlaneNormal);
float Result349 = dot(Result348,Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate);
float Result350 = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime * Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime;
float3 Result351 = Result350 * Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleInitialForceDividedByMass;
float Result352 = dot(Result348,Result351);
float Result353 = Result349 - Result352;
float Constant410 = 0.1;
bool Result354 = NiagaraAll(Result353 < Constant410);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleRemoveRestitution = Result354;
float3 Result355 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleAttemptedMovementThisUpdate / Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime;
float float_IfResult6;
float_IfResult6 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePhysicsDeltaTime;
float_IfResult6 = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime;
float Constant411 = 0;
float float_IfResult7;
float_IfResult7 = Constant411;
float_IfResult7 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedRestitution;
Context.MapUpdate.Transient.CollisionValid = Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.PhysicsCollidesThisFrame;
Context.MapUpdate.Transient.CollisionSize = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.ParticleRadius;
Context.MapUpdate.Transient.CollisionNormal = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModulePlaneNormal;
Context.MapUpdate.Transient.CollisionVelocity = Result355;
Context.MapUpdate.Transient.CollisionFriction = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReturnedFriction;
Context.MapUpdate.Transient.PhysicsDeltaTime = float_IfResult6;
Context.MapUpdate.Transient.CollisionRestitution = float_IfResult7;
bool Result356 = !Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleRemoveRestitution;
bool Result357 = Result356 && Context.MapUpdate.Collision001.CollisionQueryAndResponse001.RandomizeCollisionNormal;
float Constant412 = 1;
float3 RandomizeCollisionNormals_Func_Output_Ouput1;
RandomizeCollisionNormals_Func_(Context.MapUpdate.Transient.CollisionNormal, Constant412, Context.MapUpdate.Collision001.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage, RandomizeCollisionNormals_Func_Output_Ouput1, Context);
float3 Vector_IfResult8;
Vector_IfResult8 = RandomizeCollisionNormals_Func_Output_Ouput1;
Vector_IfResult8 = Context.MapUpdate.Transient.CollisionNormal;
float3 ReflectVector_Func_Output_Reflected1;
ReflectVector_Func_(Context.MapUpdate.Transient.CollisionVelocity, Vector_IfResult8, ReflectVector_Func_Output_Reflected1, Context);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReflectedVelocity = ReflectVector_Func_Output_Reflected1;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters3;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters3;
CentimeterMeterConversion_Func_(Context.MapUpdate.Transient.CollisionVelocity, CentimeterMeterConversion_Func_Output_CentimeterstoMeters3, CentimeterMeterConversion_Func_Output_MeterstoCentimeters3, Context);
float3 Result358 = Context.MapUpdate.Transient.Collision_ParticleMassReplacement * CentimeterMeterConversion_Func_Output_CentimeterstoMeters3;
float Constant413 = -1;
float3 Result359 = Result358 * Constant413;
float Result360 = dot(Result359,Context.MapUpdate.Transient.CollisionNormal);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleNormalForceInNewtons = Result360;
bool Constant414 = false;
float3 ProjectVectorOnPlane_Particle_Func_Output_Ouput1;
ProjectVectorOnPlane_Particle_Func_(Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReflectedVelocity, Context.MapUpdate.Transient.CollisionNormal, Constant414, ProjectVectorOnPlane_Particle_Func_Output_Ouput1, Context);
float3 Constant415 = float3(0,0,0);
float Constant416 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length11;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold11;
DirectionAndLengthSafe_v1_0_Particle_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput1, Constant415, Constant416, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length11, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold11, Context);
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters4;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters4;
CentimeterMeterConversion_Func_(ProjectVectorOnPlane_Particle_Func_Output_Ouput1, CentimeterMeterConversion_Func_Output_CentimeterstoMeters4, CentimeterMeterConversion_Func_Output_MeterstoCentimeters4, Context);
float3 Result361 = CentimeterMeterConversion_Func_Output_CentimeterstoMeters4 * Context.MapUpdate.Transient.Collision_ParticleMassReplacement;
float float_IfResult8;
float_IfResult8 = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DynamicFrictionCoefficient;
float_IfResult8 = Context.MapUpdate.Collision001.CollisionQueryAndResponse001.BounceCollisionFriction;
float3 Result362 = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11 * float_IfResult8 * Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleNormalForceInNewtons;
float3 Result363 = Result361 - Result362;
float3 Constant417 = float3(0,0,0);
float Constant418 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction12;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length12;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold12;
DirectionAndLengthSafe_v1_0_Particle_Func_(Result363, Constant417, Constant418, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction12, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length12, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold12, Context);
float Result364 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction11,DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction12);
float Constant419 = 0;
bool Result365 = NiagaraAll(Result364 <= Constant419);
float3 Vector_IfResult9;
Vector_IfResult9 = Result361;
Vector_IfResult9 = Result362;
float Constant420 = -1;
float3 Result366 = Vector_IfResult9 * Constant420;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons = Result366;
float3 Result367 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleFrictionForceVectorInNewtons * Context.MapUpdate.Transient.Collision_ParticleInverseMassReplacement;
float3 CentimeterMeterConversion_Func_Output_CentimeterstoMeters5;
float3 CentimeterMeterConversion_Func_Output_MeterstoCentimeters5;
CentimeterMeterConversion_Func_(Result367, CentimeterMeterConversion_Func_Output_CentimeterstoMeters5, CentimeterMeterConversion_Func_Output_MeterstoCentimeters5, Context);
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector = CentimeterMeterConversion_Func_Output_MeterstoCentimeters5;
float3 Result368 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReflectedVelocity + Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleFrictionForceVelocityVector;
float Result369 = dot(Context.MapUpdate.Transient.CollisionNormal,Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReflectedVelocity);
float3 Result370 = Context.MapUpdate.Transient.CollisionNormal * Result369;
float Result371 = 1 - Context.MapUpdate.Transient.CollisionRestitution;
float3 Result372 = Result370 * Result371;
float3 Result373 = Result368 - Result372;
Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied = Result373;
float3 Particleposition_IfResult1;
Particleposition_IfResult1 = Context.MapUpdate.Transient.CollisionParticleWorldPosition;
Particleposition_IfResult1 = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Particleposition_IfResult1;
float3 Constant421 = float3(0,0,1);
float Constant422 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction13;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length13;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold13;
DirectionAndLengthSafe_v1_0_Particle_Func_(Context.MapUpdate.Transient.CollisionVelocity, Constant421, Constant422, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction13, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length13, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold13, Context);
float Result374 = dot(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction13,Context.MapUpdate.Transient.CollisionNormal);
float Constant423 = 0;
bool Result375 = NiagaraAll(Result374 < Constant423);
bool Result376 = Result375 && Context.MapUpdate.Transient.CollisionValid;
float3 Constant424 = float3(0,0,0);
float3 physicsforce_IfResult1;
float3 Velocity_IfResult2;
physicsforce_IfResult1 = Constant424;
Velocity_IfResult2 = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleReflectedVelocityWithFrictionApplied;
physicsforce_IfResult1 = Context.MapUpdate.Transient.PhysicsForce;
Velocity_IfResult2 = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Velocity_IfResult2;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = physicsforce_IfResult1;
Out_ModuleTraceWorldStart = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceWorldStart;
Out_ModuleTraceWorldEnd = Context.MapUpdate.Local.Collision001.CollisionQueryAndResponse001.ModuleTraceWorldEnd;
bool Constant458 = false;
float4x4 Matrix_IfResult7;
float4x4 Matrix001_IfResult6;
Matrix_IfResult7 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult6 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult7 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult6 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal6;
float4x4 TransformBase_Func_Output_OutTransform6;
bool TransformBase_Func_Output_LocalToWorld6;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult7, Matrix001_IfResult6, Constant458, TransformBase_Func_Output_bUseOriginal6, TransformBase_Func_Output_OutTransform6, TransformBase_Func_Output_LocalToWorld6, Context);
float3 Result408 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform6).xyz;
float3 Vector_IfResult12;
Vector_IfResult12 = In_InVector;
Vector_IfResult12 = Result408;
Out_OutVector = Vector_IfResult12;
bool Constant463 = false;
float4x4 Matrix_IfResult8;
float4x4 Matrix001_IfResult7;
Matrix_IfResult8 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult7 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult8 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult7 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal7;
float4x4 TransformBase_Func_Output_OutTransform7;
bool TransformBase_Func_Output_LocalToWorld7;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult8, Matrix001_IfResult7, Constant463, TransformBase_Func_Output_bUseOriginal7, TransformBase_Func_Output_OutTransform7, TransformBase_Func_Output_LocalToWorld7, Context);
float3 Result411 = mul(float4(In_InPosition,1.0),TransformBase_Func_Output_OutTransform7).xyz;
float3 Vector_IfResult13;
Vector_IfResult13 = In_InPosition;
Vector_IfResult13 = Result411;
Out_OutPosition = Vector_IfResult13;
bool Constant467 = false;
float4x4 Matrix_IfResult9;
float4x4 Matrix001_IfResult8;
Matrix_IfResult9 = Context.MapUpdate.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult8 = Context.MapUpdate.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult9 = Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult8 = Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal8;
float4x4 TransformBase_Func_Output_OutTransform8;
bool TransformBase_Func_Output_LocalToWorld8;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult9, Matrix001_IfResult8, Constant467, TransformBase_Func_Output_bUseOriginal8, TransformBase_Func_Output_OutTransform8, TransformBase_Func_Output_LocalToWorld8, Context);
float3 Result412 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform8).xyz;
float3 Vector_IfResult14;
Vector_IfResult14 = In_InVector;
Vector_IfResult14 = Result412;
Out_OutVector = Vector_IfResult14;
int Constant296 = 1;
int Constant297 = 1;
int Result149 = max(Constant296, Constant297);
bool Result150 = NiagaraAll(Context.MapUpdate.Particles.NumberOfCollisions >= Result149);
bool Result151 = Result150 && Context.MapUpdate.Collision001.EnableRestState && Context.MapUpdate.Collision001.EnableMaxCollisionCount;
bool Result152 = Result151 || Context.MapUpdate.Transient.CollisionIsResting || Context.MapUpdate.Collision001.ManuallyEnterRest;
Context.MapUpdate.Local.Collision001.ManuallyEnterRest = Result152;
float Constant298 = 0.001;
float Result153 = max(Context.MapUpdate.Collision001.ParticleMass, Constant298);
Context.MapUpdate.Transient.Collision_ParticleMassReplacement = Result153;
Context.MapUpdate.OUTPUT_VAR.Collision001.IncomingCollisionVelocity = Context.MapUpdate.Particles.Velocity;
int Constant299 = 0;
int Constant300 = 1;
bool Constant301 = false;
float3 Collision001_TransformPosition007_Emitter_Func_Output_OutPosition;
Collision001_TransformPosition007_Emitter_Func_(Context.MapUpdate.Particles.Position, Constant299, Constant300, Constant301, Collision001_TransformPosition007_Emitter_Func_Output_OutPosition, Context);
int Constant303 = 0;
int Constant304 = 1;
bool Constant305 = false;
float3 Collision001_TransformVector009_Emitter_Func_Output_OutVector;
Collision001_TransformVector009_Emitter_Func_(Context.MapUpdate.Particles.Velocity, Constant303, Constant304, Constant305, Collision001_TransformVector009_Emitter_Func_Output_OutVector, Context);
int Constant307 = 0;
int Constant308 = 1;
bool Constant309 = false;
float3 Collision001_TransformVector010_Emitter_Func_Output_OutVector;
Collision001_TransformVector010_Emitter_Func_(Context.MapUpdate.Collision001.PhysicsForce, Constant307, Constant308, Constant309, Collision001_TransformVector010_Emitter_Func_Output_OutVector, Context);
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision001_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Local.Collision001.InputPositionPassthrough_NeededForSimStageExecution = Collision001_TransformPosition007_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision001_TransformVector009_Emitter_Func_Output_OutVector;
Context.MapUpdate.Local.Collision001.InputVelocityPassthrough_NeededForSimStageExecution = Collision001_TransformVector009_Emitter_Func_Output_OutVector;
Context.MapUpdate.Transient.Collision_ParticlePhysicsForceReplacement = Collision001_TransformVector010_Emitter_Func_Output_OutVector;
Context.MapUpdate.Local.Collision001.InputForcePassthrough_NeededForSimStageExecution = Collision001_TransformVector010_Emitter_Func_Output_OutVector;
float Constant311 = 1;
float CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_Output_Radius;
CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_(Context.MapUpdate.Particles.SpriteSize, CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_Output_Radius, Context);
float Result159 = Constant311 * CalculateRadiusFromSpriteSize_Method_NewEnumerator0_Func_Output_Radius;
float Constant313 = 1e-06;
float Result160 = max(Result159, Constant313);
Context.MapUpdate.Local.Collision001.ModuleParticleRadius = Result160;
float Constant314 = 0.2;
float Constant315 = 0.5;
float Constant316 = 1;
float Constant317 = 0.2;
float Constant318 = 0.1;
float Constant319 = 0.3;
float Constant320 = -1e+07;
float Constant321 = 0;
float Constant322 = (0.0);
float NiagaraFloat_SelectResult1 = Constant322;
NiagaraFloat_SelectResult1 = Constant320;
NiagaraFloat_SelectResult1 = Constant321;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.DynamicFrictionCoefficient = Constant314;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DynamicFrictionCoefficient = Constant314;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.StaticFrictionCoefficient = Constant315;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.StaticFrictionCoefficient = Constant315;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.StaticFrictionEngagementSpeed = Constant316;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.StaticFrictionEngagementSpeed = Constant316;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.ParticleRadius = Context.MapUpdate.Local.Collision001.ModuleParticleRadius;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.ParticleRadius = Context.MapUpdate.Local.Collision001.ModuleParticleRadius;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.ParticleRestitutionCoeffiecient = Constant317;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.ParticleRestitutionCoeffiecient = Constant317;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.CollisionNormalRandomizationPercentage = Constant318;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.CollisionNormalRandomizationPercentage = Constant318;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.CollisionEnabled = Context.MapUpdate.Collision001.CollisionEnabled;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.CollisionEnabled = Context.MapUpdate.Collision001.CollisionEnabled;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.RandomizeCollisionNormal = Context.MapUpdate.Collision001.RandomizeCollisionNormalVector;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.RandomizeCollisionNormal = Context.MapUpdate.Collision001.RandomizeCollisionNormalVector;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.UpdateRotationalVelocity = Context.MapUpdate.Local.Collision001.UpdateMeshRotation;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.UpdateRotationalVelocity = Context.MapUpdate.Local.Collision001.UpdateMeshRotation;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.BounceCollisionFriction = Constant319;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.BounceCollisionFriction = Constant319;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.MaxIntersectionCorrectionDistance = NiagaraFloat_SelectResult1;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.MaxIntersectionCorrectionDistance = NiagaraFloat_SelectResult1;
float Constant323 = 1e+07;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.AllowOffscreenDepthBufferParticlesToLive = Context.MapUpdate.Collision001.AllowOffscreenDepthBufferCollisionParticlesToLiveAfteraBounce;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.AllowOffscreenDepthBufferParticlesToLive = Context.MapUpdate.Collision001.AllowOffscreenDepthBufferCollisionParticlesToLiveAfteraBounce;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.KillOccludedParticles = Context.MapUpdate.Collision001.KillOccludedParticles;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.KillOccludedParticles = Context.MapUpdate.Collision001.KillOccludedParticles;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.MaxSceneDepthCollisionDistance = Constant323;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.MaxSceneDepthCollisionDistance = Constant323;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float Constant324 = 1;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.TraceVectorLengthMultiplier = Constant324;
float Constant325 = 1e+10;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.MaxTraceLength = Constant325;
float Constant326 = 50;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.DepthBufferBackfaceThickness = Constant326;
int Constant327 = 0;
Context.MapUpdate.Collision001.CollisionQueryAndResponse.CPUFrictionMergeType = Constant327;
float3 Collision001_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldStart;
float3 Collision001_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldEnd;
float3 Collision001_CollisionQueryAndResponse_Emitter_Func_Output_CollisionPosition;
float3 Collision001_CollisionQueryAndResponse_Emitter_Func_Output_CollisionNormal;
bool Collision001_CollisionQueryAndResponse_Emitter_Func_Output_Collided;
Collision001_CollisionQueryAndResponse_Emitter_Func_(Collision001_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldStart, Collision001_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldEnd, Collision001_CollisionQueryAndResponse_Emitter_Func_Output_CollisionPosition, Collision001_CollisionQueryAndResponse_Emitter_Func_Output_CollisionNormal, Collision001_CollisionQueryAndResponse_Emitter_Func_Output_Collided, Context);
Context.MapUpdate.Local.Collision001.ModuleTraceWorldStart1 = Collision001_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldStart;
Context.MapUpdate.Local.Collision001.ModuleTraceWorldEnd1 = Collision001_CollisionQueryAndResponse_Emitter_Func_Output_ModuleTraceWorldEnd;
Context.MapUpdate.Local.Collision001.DebugCollisionPosition1 = Collision001_CollisionQueryAndResponse_Emitter_Func_Output_CollisionPosition;
Context.MapUpdate.Local.Collision001.DebugCollisionNormal1 = Collision001_CollisionQueryAndResponse_Emitter_Func_Output_CollisionNormal;
Context.MapUpdate.Local.Collision001.DebugCollided1 = Collision001_CollisionQueryAndResponse_Emitter_Func_Output_Collided;
Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision1Valid = Context.MapUpdate.Transient.CollisionValid;
Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision1Normal = Context.MapUpdate.Transient.CollisionNormal;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float Constant392 = 1;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.TraceVectorLengthMultiplier = Constant392;
float Constant393 = 1e+10;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.MaxTraceLength = Constant393;
float Constant394 = 50;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.DepthBufferBackfaceThickness = Constant394;
int Constant395 = 0;
Context.MapUpdate.Collision001.CollisionQueryAndResponse001.CPUFrictionMergeType = Constant395;
float3 Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldStart;
float3 Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldEnd;
float3 Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionPosition;
float3 Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionNormal;
bool Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_Collided;
Collision001_CollisionQueryAndResponse001_Emitter_Func_(Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldStart, Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldEnd, Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionPosition, Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionNormal, Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_Collided, Context);
Context.MapUpdate.Local.Collision001.ModuleTraceWorldStart2 = Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldStart;
Context.MapUpdate.Local.Collision001.ModuleTraceWorldEnd2 = Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_ModuleTraceWorldEnd;
Context.MapUpdate.Local.Collision001.DebugCollisionPosition2 = Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionPosition;
Context.MapUpdate.Local.Collision001.DebugCollisionNormal2 = Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_CollisionNormal;
Context.MapUpdate.Local.Collision001.DebugCollided2 = Collision001_CollisionQueryAndResponse001_Emitter_Func_Output_Collided;
Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision2Valid = Context.MapUpdate.Transient.CollisionValid;
Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision2Normal = Context.MapUpdate.Transient.CollisionNormal;
bool Result377 = Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.ParticleOnScreen || Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.ParticleOnScreen;
float Constant425 = 0;
float Result378 = Context.MapUpdate.Particles.Collision001.OffscreenCounter + Context.MapUpdate.Engine.DeltaTime;
float float_IfResult9;
float_IfResult9 = Constant425;
float_IfResult9 = Result378;
Context.MapUpdate.Particles.Collision001.OffscreenCounter = float_IfResult9;
float Constant426 = 99;
bool Result379 = NiagaraAll(Context.MapUpdate.Particles.Collision001.OffscreenCounter < Constant426);
bool Result380 = Context.MapUpdate.DataInstance.Alive && Result379;
Context.MapUpdate.DataInstance.Alive = Result380;
bool Result381 = Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision1Valid || Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision2Valid;
int Constant427 = 1;
int Result382 = Context.MapUpdate.Particles.NumberOfCollisions + Constant427;
int int32_IfResult;
int32_IfResult = Result382;
int32_IfResult = Context.MapUpdate.Particles.NumberOfCollisions;
Context.MapUpdate.Transient.CollisionValid = Result381;
Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionValid = Result381;
Context.MapUpdate.Particles.NumberOfCollisions = int32_IfResult;
float Constant428 = 1;
float Constant429 = 0.5;
float Constant430 = 0.5;
float3 Constant431 = float3(0,0,1);
float Constant432 = 0.5;
float Constant433 = 0;
bool Result383 = NiagaraAll(Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.CollisionPenetrationDistance < Constant433);
float Constant434 = 0;
bool Result384 = NiagaraAll(Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.CollisionPenetrationDistance < Constant434);
bool Result385 = Result383 && Result384;
float Constant435 = 0.5;
float Constant436 = 0;
float Constant437 = (0.0);
float NiagaraFloat_SelectResult5 = Constant437;
NiagaraFloat_SelectResult5 = Constant435;
NiagaraFloat_SelectResult5 = Constant436;
float Constant438 = 0.5;
float Constant439 = 0;
float Constant440 = (0.0);
float NiagaraFloat_SelectResult6 = Constant440;
NiagaraFloat_SelectResult6 = Constant438;
NiagaraFloat_SelectResult6 = Constant439;
float Result386 = NiagaraFloat_SelectResult5 + NiagaraFloat_SelectResult6;
float Result387 = Context.MapUpdate.Engine.DeltaTime * Constant429;
float Result388 = lerp(Context.MapUpdate.Particles.RestCounter,Result386,Result387);
bool Result389 = NiagaraAll(Result388 > Constant428);
float Constant441 = -1;
float Result390 = Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse.CollisionPenetrationDistance * Constant441;
bool Result391 = NiagaraAll(Result390 > Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.CollisionPenetrationDistance);
float Constant442 = -1;
float Result392 = Constant430 * Constant442;
bool Result393 = NiagaraAll(Result392 > Context.MapUpdate.OUTPUT_VAR.Collision001.CollisionQueryAndResponse001.CollisionPenetrationDistance);
bool Result394 = Result391 || Result393;
bool Result395 = Result385 || Result389 || Result394;
float3 Constant443 = float3(0,0,0);
float3 Vector_IfResult10;
Vector_IfResult10 = Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision1Normal;
Vector_IfResult10 = Constant443;
float3 Constant444 = float3(0,0,0);
float3 Vector_IfResult11;
Vector_IfResult11 = Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCollision2Normal;
Vector_IfResult11 = Constant444;
float3 Result396 = Vector_IfResult10 + Vector_IfResult11;
float3 Constant445 = float3(0,0,1);
float Constant446 = 1e-05;
float3 DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1;
float DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length1;
bool DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold1;
DirectionAndLengthSafe_v1_1_Particle_Func_(Result396, Constant445, Constant446, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_1_Particle_Func_Output_Length1, DirectionAndLengthSafe_v1_1_Particle_Func_Output_BelowThreshold1, Context);
float Result397 = dot(DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1,Constant431);
float Constant447 = 0.5;
float Result398 = Constant432 - Constant447;
float Constant448 = 2;
float Result399 = Result398 * Constant448;
bool Result400 = NiagaraAll(Result397 > Result399);
bool Result401 = Result395 && Result400;
bool bool_IfResult1;
bool_IfResult1 = Result401;
bool_IfResult1 = Result395;
bool Result402 = Context.MapUpdate.Collision001.EnableRestState && bool_IfResult1 && Context.MapUpdate.Collision001.CollisionEnabled;
bool Result403 = Result402 || Context.MapUpdate.Local.Collision001.ManuallyEnterRest;
float3 Constant449 = float3(0,0,0);
float3 Constant450 = float3(0,0,0);
float3 Constant451 = float3(0,0,0);
float Result404 = dot(Context.MapUpdate.Transient.AdvectionVelocity,DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1);
float Constant452 = 0;
bool Result405 = NiagaraAll(Result404 > Constant452);
float3 Result406 = DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1 * Result404;
float3 Result407 = Context.MapUpdate.Transient.AdvectionVelocity - Result406;
float3 Constant453 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult7 = Constant453;
Vector3f_SelectResult7 = Context.MapUpdate.Transient.AdvectionVelocity;
Vector3f_SelectResult7 = Result407;
float3 Position_IfResult2;
float3 Velocity_IfResult3;
float3 Force_IfResult1;
float deltatime_IfResult;
float3 AdvectionVelocity_IfResult;
Position_IfResult2 = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult3 = Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement;
Force_IfResult1 = Constant451;
deltatime_IfResult = Context.MapUpdate.Transient.PhysicsDeltaTime;
AdvectionVelocity_IfResult = Vector3f_SelectResult7;
Position_IfResult2 = Context.MapUpdate.Local.Collision001.InputPositionPassthrough_NeededForSimStageExecution;
Velocity_IfResult3 = Context.MapUpdate.Local.Collision001.InputVelocityPassthrough_NeededForSimStageExecution;
Force_IfResult1 = Context.MapUpdate.Local.Collision001.InputForcePassthrough_NeededForSimStageExecution;
deltatime_IfResult = Context.MapUpdate.Engine.DeltaTime;
AdvectionVelocity_IfResult = Context.MapUpdate.Transient.AdvectionVelocity;
float3 Constant454 = float3(0,0,0);
float3 Position_IfResult3;
float3 Velocity_IfResult4;
float3 Force_IfResult2;
float deltatime_IfResult1;
float3 AdvectionVelocity_IfResult1;
Position_IfResult3 = Context.MapUpdate.Transient.Collision_ParticlePositionReplacement;
Velocity_IfResult4 = Constant449;
Force_IfResult2 = Constant450;
deltatime_IfResult1 = deltatime_IfResult;
AdvectionVelocity_IfResult1 = Constant454;
Position_IfResult3 = Position_IfResult2;
Velocity_IfResult4 = Velocity_IfResult3;
Force_IfResult2 = Force_IfResult1;
AdvectionVelocity_IfResult1 = AdvectionVelocity_IfResult;
int Constant455 = 1;
int Constant456 = 0;
bool Constant457 = false;
float3 Collision001_TransformVector_Emitter_Func_Output_OutVector;
Collision001_TransformVector_Emitter_Func_(Force_IfResult2, Constant455, Constant456, Constant457, Collision001_TransformVector_Emitter_Func_Output_OutVector, Context);
bool Result409 = Result389 && Context.MapUpdate.Collision001.CollisionEnabled;
bool Result410 = Context.MapUpdate.Local.Collision001.ManuallyEnterRest || Result409;
float3 Constant459 = float3(0.0, 0.0, 0.0);
float3 Vector3f_SelectResult8 = Constant459;
Vector3f_SelectResult8 = DirectionAndLengthSafe_v1_1_Particle_Func_Output_Direction1;
Vector3f_SelectResult8 = Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal;
int Constant460 = 1;
int Constant461 = 0;
bool Constant462 = false;
float3 Collision001_TransformPosition001_Emitter_Func_Output_OutPosition;
Collision001_TransformPosition001_Emitter_Func_(Position_IfResult3, Constant460, Constant461, Constant462, Collision001_TransformPosition001_Emitter_Func_Output_OutPosition, Context);
int Constant464 = 1;
int Constant465 = 0;
bool Constant466 = false;
float3 Collision001_TransformVector001_Emitter_Func_Output_OutVector;
Collision001_TransformVector001_Emitter_Func_(Velocity_IfResult4, Constant464, Constant465, Constant466, Collision001_TransformVector001_Emitter_Func_Output_OutVector, Context);
Context.MapUpdate.Transient.PhysicsForce = Collision001_TransformVector_Emitter_Func_Output_OutVector;
Context.MapUpdate.Transient.PhysicsDeltaTime = deltatime_IfResult1;
Context.MapUpdate.Transient.CollisionIsResting = Result410;
Context.MapUpdate.Particles.RestCounter = Result388;
Context.MapUpdate.OUTPUT_VAR.Collision001.ModuleCombinedCollisionNormal = Vector3f_SelectResult8;
Context.MapUpdate.Transient.Collision_ParticlePositionReplacement = Collision001_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.MapUpdate.Transient.Collision_ParticleVelocityReplacement = Collision001_TransformVector001_Emitter_Func_Output_OutVector;
Context.MapUpdate.Particles.Velocity = Collision001_TransformVector001_Emitter_Func_Output_OutVector;
Context.MapUpdate.Particles.Position = Collision001_TransformPosition001_Emitter_Func_Output_OutPosition;
Context.MapUpdate.OUTPUT_VAR.Collision001.CombinedCollisionNormal = Vector3f_SelectResult8;
Context.MapUpdate.Transient.AdvectionVelocity = AdvectionVelocity_IfResult1;
Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal = Vector3f_SelectResult8;
float Constant468 = 0;
Context.MapUpdate.Collision001.AdvancedAgingRate = Constant468;
Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime = Context.MapUpdate.SolveForcesAndVelocity.DeltaTime;
float Constant473 = 1e-05;
float Result413 = max(Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime, Constant473);
float Result414 = Reciprocal(Result413);
Context.MapUpdate.Local.SolveForcesAndVelocity.InverseDeltaTime = Result414;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce = Context.MapUpdate.SolveForcesAndVelocity.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce = Context.MapUpdate.SolveForcesAndVelocity.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.MapUpdate.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.Local.SolveForcesAndVelocity.Mass = Context.MapUpdate.SolveForcesAndVelocity.Mass;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position = Context.MapUpdate.SolveForcesAndVelocity.Position;
Context.MapUpdate.Particles.Presolve.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.Particles.Presolve.Position = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.MapUpdate.Particles.Presolve.PhysicsForce = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce;
float Constant474 = 1e-06;
float Result415 = max(Context.MapUpdate.Local.SolveForcesAndVelocity.Mass, Constant474);
float Result416 = Reciprocal(Result415);
float3 Result417 = Result416 * Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce = Result417;
Context.MapUpdate.Local.SolveForcesAndVelocity.InverseMass = Result416;
float3 Result418 = Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce * Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Result418;
Context.MapUpdate.Local.SolveForcesAndVelocity.AdvectionVelocity = Context.MapUpdate.Transient.AdvectionVelocity;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Local.SolveForcesAndVelocity.DragIgnoreMass = Context.MapUpdate.Transient.DragIgnoreMass;
float3 DragVelocity_Particle_Func_Output_Output2;
DragVelocity_Particle_Func_(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity.DragIgnoreMass, DragVelocity_Particle_Func_Output_Output2, Context);
float3 Result419 = DragVelocity_Particle_Func_Output_Output2 - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = DragVelocity_Particle_Func_Output_Output2;
Context.MapUpdate.Local.SolveForcesAndVelocity.DragVelocity = Result419;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsDrag = Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag;
float Constant475 = 1000;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
float3 Constant476 = float3(0,0,0);
float Constant477 = 9999;
float3 Result420 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity * Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime;
float3 Result421 = Result420 + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position = Result421;
float3 Position_IfResult4;
float3 Velocity_IfResult5;
Position_IfResult4 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Velocity_IfResult5 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Position_IfResult4 = Context.MapUpdate.Particles.Position;
Velocity_IfResult5 = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.Particles.Position = Position_IfResult4;
Context.MapUpdate.Particles.Velocity = Velocity_IfResult5;
float3 Constant478 = float3(0,0,0);
float Constant479 = 0;
float3 ForceVector_IfResult;
float Drag_IfResult;
ForceVector_IfResult = Constant478;
Drag_IfResult = Constant479;
ForceVector_IfResult = Context.MapUpdate.Transient.PhysicsForce;
Drag_IfResult = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsForce = ForceVector_IfResult;
Context.MapUpdate.Transient.PhysicsDrag = Drag_IfResult;
float3 Result422 = Context.MapUpdate.Particles.Position - Context.MapUpdate.Particles.Previous.Position;
float Result423 = length(Result422);
float Constant480 = 0.3333;
float Result424 = Result423 * Constant480;
float Constant481 = 1e+08;
float Result425 = Modulo(Context.MapUpdate.Particles.DistanceTraveled, Constant481);
float Result426 = Result424 + Result425;
Context.MapUpdate.Particles.DistanceTraveled = Result426;
float Constant483 = 5;
float SampleCurve_Emitter_Radius_FloatCurveOutput_Value;
SampleCurve_Emitter_Radius_FloatCurve(Context.MapUpdate.FloatFromCurve004.CurveIndex, SampleCurve_Emitter_Radius_FloatCurveOutput_Value);
float Result427 = SampleCurve_Emitter_Radius_FloatCurveOutput_Value * Constant483;
Out_Value = Result427;
float Constant491 = 2;
float Constant492 = 1;
float Constant493 = 1;
float Constant494 = 1;
float Constant495 = 1;
float Constant496 = 1;
float Constant497 = 1;
Context.MapUpdate.Particles.fluids_source_density = Constant491;
Context.MapUpdate.Particles.fluids_source_falloff = Constant492;
Context.MapUpdate.Particles.fluids_source_noiseIntensity = Constant493;
Context.MapUpdate.Particles.fluids_source_noiseScale = Constant494;
Context.MapUpdate.Particles.fluids_source_radius = Context.MapUpdate.Fluids_Gas_Source.Radius;
Context.MapUpdate.Particles.fluids_source_temperature = Constant495;
Context.MapUpdate.Particles.fluids_source_velocityScale = Constant496;
Context.MapUpdate.Particles.fluids_source_velocity = Context.MapUpdate.Fluids_Gas_Source.Velocity;
Context.MapUpdate.Particles.fluids_source_divergence = Constant497;
float Constant499 = 2;
float Result428 = Context.MapUpdate.Multiply_Float.A * Constant499;
Out_Result = Result428;
float2 Output19;
Output19.x = Context.MapUpdate.Vector2DFromFloat001.Value;
Output19.y = Context.MapUpdate.Vector2DFromFloat001.Value;
Out_Vec2 = Output19;
Context.MapUpdate.Particles.SpriteSize = Context.MapUpdate.SetVariables_BDEC693D447651B764B3B6BBF3065841.Particles.SpriteSize;
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
Context.MapUpdate.Engine.DeltaTime = InterpSpawn_UpdateTime;
Context.MapUpdate.Engine.InverseDeltaTime = InterpSpawn_InvUpdateTime;
Context.MapSpawn.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Previous.SpriteRotation = Context.MapSpawn.Particles.SpriteRotation;
Context.MapSpawn.Particles.Previous.SpriteSize = Context.MapSpawn.Particles.SpriteSize;
Context.MapSpawn.Particles.Previous.Velocity = Context.MapSpawn.Particles.Velocity;
//Begin Interpolated Spawn Script!
Context.MapSpawn.Particles.MaterialRandom = Constant;
float Constant1 = 1;
Context.MapSpawn.Particles.Lifetime = Constant1;
float4 Constant2 = float4(1,1,1,1);
Context.MapSpawn.Particles.Color = Constant2;
float Constant3 = 1;
Context.MapSpawn.Particles.Mass = Constant3;
float2 Constant4 = float2(10,10);
Context.MapSpawn.Particles.SpriteSize = Constant4;
float Constant5 = 0;
Context.MapSpawn.Particles.SpriteRotation = Constant5;
float3 Constant6 = float3(1,1,1);
Context.MapSpawn.Particles.Scale = Constant6;
float3 Constant7 = float3(0,0,0);
Context.MapSpawn.Particles.Velocity = Constant7;
float3 Constant8 = float3(0,0,0);
Context.MapSpawn.Particles.RotationalVelocity = Constant8;
float Constant9 = 1;
Context.MapSpawn.Particles.RotationalInertia = Constant9;
float Constant10 = 0;
Context.MapSpawn.Particles.Age = Constant10;
float Constant11 = (0.0);
Context.MapSpawn.Particles.NormalizedAge = Constant11;
Context.MapSpawn.Particles.NumberOfCollisions = Constant12;
bool Constant13 = false;
Context.MapSpawn.Particles.HasCollided = Constant13;
Context.MapSpawn.Particles.Collision001.CollisionQueryAndResponse.CollisionID = Constant14;
int Constant15 = 0;
Context.MapSpawn.Particles.Collision001.CollisionQueryAndResponse001.CollisionID = Constant15;
float Constant16 = 0;
Context.MapSpawn.Particles.Collision001.OffscreenCounter = Constant16;
float Constant17 = 0;
Context.MapSpawn.Particles.RestCounter = Constant17;
float3 Constant18 = float3(0,0,0);
Context.MapSpawn.Particles.Collision001.SafeCombinedCollisionNormal = Constant18;
float3 Constant19 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Velocity = Constant19;
float3 Constant20 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Position = Constant20;
float3 Constant21 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.PhysicsForce = Constant21;
float3 Constant22 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Position = Constant22;
float Constant23 = 0;
Context.MapSpawn.Particles.DistanceTraveled = Constant23;
float Constant24 = (0.0);
Context.MapSpawn.Particles.fluids_source_density = Constant24;
float Constant25 = (0.0);
Context.MapSpawn.Particles.fluids_source_falloff = Constant25;
float Constant26 = (0.0);
Context.MapSpawn.Particles.fluids_source_noiseIntensity = Constant26;
float Constant27 = (0.0);
Context.MapSpawn.Particles.fluids_source_noiseScale = Constant27;
float Constant28 = (0.0);
Context.MapSpawn.Particles.fluids_source_radius = Constant28;
float Constant29 = (0.0);
Context.MapSpawn.Particles.fluids_source_temperature = Constant29;
float Constant30 = (0.0);
Context.MapSpawn.Particles.fluids_source_velocityScale = Constant30;
float3 Constant31 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.fluids_source_velocity = Constant31;
float Constant32 = (0.0);
Context.MapSpawn.Particles.fluids_source_divergence = Constant32;
float Constant33 = 12;
float Constant34 = 250;
int Constant35 = 0;
float RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat003_Emitter_Func_(RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.Vector2DFromFloat.Value = RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
float Constant44 = 0.75;
float Constant45 = 1;
int Constant46 = 0;
float RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat001_Emitter_Func_(RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat, Context);
bool Constant54 = true;
bool Constant55 = false;
bool Constant56 = true;
float2 Vector2DFromFloat_Emitter_Func_Output_Vec2;
Vector2DFromFloat_Emitter_Func_(Vector2DFromFloat_Emitter_Func_Output_Vec2, Context);
float Constant57 = 0.2;
float Constant58 = 1.6;
int Constant59 = 0;
float RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat_Emitter_Func_(RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.InitializeParticle.Mass = RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
Context.MapSpawn.InitializeParticle.WriteColor = Constant54;
Context.MapSpawn.InitializeParticle.WritePosition = Constant55;
Context.MapSpawn.InitializeParticle.WriteSpriteSize = Constant56;
Context.MapSpawn.InitializeParticle.SpriteSize = Vector2DFromFloat_Emitter_Func_Output_Vec2;
Context.MapSpawn.InitializeParticle.Lifetime = RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
bool Constant67 = true;
Context.MapSpawn.InitializeParticle.WriteMaterialRandom = Constant67;
float Constant68 = 0;
float Constant69 = 1;
int Constant70 = -1;
int Constant71 = 0;
bool Constant72 = false;
float RandomRangeFloat_Func_Output_Result;
RandomRangeFloat_Func_(Constant68, Constant69, Constant70, Constant71, Constant72, RandomRangeFloat_Func_Output_Result, Context);
Context.MapSpawn.InitializeParticle.MaterialRandom = RandomRangeFloat_Func_Output_Result;
bool Constant86 = true;
Context.MapSpawn.InitializeParticle.WriteLifetime = Constant86;
float4 Constant87 = float4(1111,13.6009,0,1);
bool Constant88 = true;
Context.MapSpawn.InitializeParticle.WriteMass = Constant88;
bool Constant89 = false;
Context.MapSpawn.InitializeParticle.WriteSpriteRotation = Constant89;
float Constant90 = 0;
Context.MapSpawn.InitializeParticle.WriteScale = Constant91;
float3 Constant92 = float3(1,1,1);
float3 InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
InitializeParticle_SimulationPosition_Emitter_Func_(InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition, Context);
Context.MapSpawn.InitializeParticle.Position = InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
Context.MapSpawn.Particles.Position = InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
EnterStatScope(1 /**InitializeParticle_Emitter_Func_*/);
InitializeParticle_Emitter_Func_(Context);
ExitStatScope(/**InitializeParticle_Emitter_Func_*/);
int Constant97 = 1;
float Constant98 = -300;
float Constant99 = 1100;
int Constant100 = 0;
float RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat002_Emitter_Func_(RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.AddVelocityInCone.UseVelocityFalloffOnConeAxis = Constant96;
Context.MapSpawn.AddVelocityInCone.ConeAxisCoordinateSpace = Constant97;
Context.MapSpawn.AddVelocityInCone.VelocityStrength = RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
float Constant108 = 45;
float3 Constant110 = float3(0,0,1);
bool Constant111 = false;
float Constant112 = 0;
EnterStatScope(2 /**AddVelocityInCone_Emitter_Func_*/);
AddVelocityInCone_Emitter_Func_(Context);
ExitStatScope(/**AddVelocityInCone_Emitter_Func_*/);
bool Constant171 = true;
Context.MapSpawn.ApplyInitialForces.ApplyForcetoVelocity = Constant171;
bool Constant172 = false;
Context.MapSpawn.ApplyInitialForces.ApplyForcetoPosition = Constant172;
bool Constant173 = true;
Context.MapSpawn.ApplyInitialForces.ApplyRotationalForcetoRotationalVelocity = Constant173;
float3 Constant174 = float3(0,0,0);
Context.MapSpawn.Transient.PhysicsForce = Constant174;
float3 Constant175 = float3(0,0,0);
Context.MapSpawn.Transient.PhysicsRotationalForce = Constant175;
float Constant176 = 1;
EnterStatScope(3 /**ApplyInitialForces_Emitter_Func_*/);
ApplyInitialForces_Emitter_Func_(Context);
ExitStatScope(/**ApplyInitialForces_Emitter_Func_*/);
int Constant182 = 0;
bool Constant183 = true;
Context.MapSpawn.SphereLocation001.NormalizeThickness = Constant183;
float Constant184 = 0;
float Constant185 = 4;
int Constant186 = 0;
Context.MapSpawn.SphereLocation001.SurfaceExpansionMode = Constant186;
bool Constant187 = false;
Context.MapSpawn.SphereLocation001.HemisphereX = Constant187;
bool Constant188 = false;
Context.MapSpawn.SphereLocation001.HemisphereY = Constant188;
bool Constant189 = false;
Context.MapSpawn.SphereLocation001.HemisphereZ = Constant189;
float3 Constant190 = float3(1,1,1);
float3 Constant191 = float3(1,0,0);
Context.MapSpawn.SphereLocation001.SphereOrigin = Context.MapSpawn.Particles.Position;
float3 Constant192 = float3(0,0,0);
int Constant193 = 2;
Context.MapSpawn.SphereLocation001.OffsetCoordinateSpace = Constant193;
int Constant194 = 2;
Context.MapSpawn.SphereLocation001.SphereCoordinateSpace = Constant194;
int Constant195 = 0;
EnterStatScope(4 /**SphereLocation001_Emitter_Func_*/);
SphereLocation001_Emitter_Func_(Context);
ExitStatScope(/**SphereLocation001_Emitter_Func_*/);
Context.MapSpawn.Particles.Initial.Color = Context.MapSpawn.Particles.Color;
bool Constant226 = (false);
Context.MapUpdate.Transient.FirstFrame = Constant226;
bool Constant227 = true;
Context.MapUpdate.DataInstance.Alive = Constant227;
Context.MapUpdate.ParticleState.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
EnterStatScope(5 /**ParticleState_Emitter_Func_*/);
ParticleState_Emitter_Func_(Context);
ExitStatScope(/**ParticleState_Emitter_Func_*/);
bool Constant233 = false;
int Constant234 = (0);
int Constant235 = 0;
Context.MapUpdate.CurlNoiseForce001.SamplePosition = Context.MapUpdate.Particles.Position;
float Constant236 = 0.05;
float3 Constant237 = float3(0.1,0.5,0.2);
float Constant238 = 0;
float Constant239 = 0;
Context.MapUpdate.CurlNoiseForce001.CurlNoiseConeMaskAxis = Context.MapUpdate.Particles.Velocity;
float3 Constant240 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant240;
float Constant241 = 300;
EnterStatScope(6 /**CurlNoiseForce001_Emitter_Func_*/);
CurlNoiseForce001_Emitter_Func_(Constant234, Context);
ExitStatScope(/**CurlNoiseForce001_Emitter_Func_*/);
float3 Constant253 = float3(0,0,-980);
EnterStatScope(7 /**GravityForce_Emitter_Func_*/);
GravityForce_Emitter_Func_(Context);
ExitStatScope(/**GravityForce_Emitter_Func_*/);
float Constant255 = 1;
float Constant256 = 0;
Context.MapUpdate.Transient.PhysicsDrag = Constant256;
float Constant257 = 1;
float Constant258 = 0;
Context.MapUpdate.Transient.PhysicsRotationalDrag = Constant258;
EnterStatScope(8 /**Drag_Emitter_Func_*/);
Drag_Emitter_Func_(Context);
ExitStatScope(/**Drag_Emitter_Func_*/);
Context.MapUpdate.FloatFromCurve.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float Constant261 = 1;
float FloatFromCurve_Emitter_Func_Output_Value;
FloatFromCurve_Emitter_Func_(FloatFromCurve_Emitter_Func_Output_Value, Context);
Context.MapUpdate.ScaleColor.ScaleAlpha = FloatFromCurve_Emitter_Func_Output_Value;
Context.MapUpdate.ScaleColor.ColorValueToScale = Context.MapUpdate.Particles.Initial.Color;
float4 Constant263 = float4(1,1,1,1);
Context.MapUpdate.Transient.ParticleColorScaleFactor = Constant263;
float3 Constant264 = float3(1,1,1);
EnterStatScope(9 /**ScaleColor_Emitter_Func_*/);
ScaleColor_Emitter_Func_(Context);
ExitStatScope(/**ScaleColor_Emitter_Func_*/);
bool Constant266 = false;
Context.MapUpdate.Collision001.EnableRestState = Constant266;
int Constant267 = 1;
bool Constant268 = false;
Context.MapUpdate.Transient.CollisionIsResting = Constant268;
bool Constant269 = false;
Context.MapUpdate.Collision001.ManuallyEnterRest = Constant269;
bool Constant270 = false;
Context.MapUpdate.Collision001.EnableMaxCollisionCount = Constant270;
Context.MapUpdate.Collision001.ParticleMass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.Collision001.PhysicsForce = Context.MapUpdate.Transient.PhysicsForce;
bool Constant271 = false;
float Constant272 = 1;
float Constant273 = 0.2;
float Constant274 = 0.5;
float Constant275 = 1;
float Constant276 = 0.2;
float Constant277 = 0.1;
bool Constant278 = true;
Context.MapUpdate.Collision001.CollisionEnabled = Constant278;
bool Constant279 = false;
Context.MapUpdate.Collision001.RandomizeCollisionNormalVector = Constant279;
bool Constant280 = false;
Context.MapUpdate.Local.Collision001.UpdateMeshRotation = Constant280;
float Constant281 = 0.3;
Context.MapUpdate.Collision001.CorrectInterpenetration = Context.MapUpdate.Transient.FirstFrame;
bool Constant282 = false;
Context.MapUpdate.Collision001.AllowOffscreenDepthBufferCollisionParticlesToLiveAfteraBounce = Constant282;
bool Constant283 = true;
Context.MapUpdate.Collision001.KillOccludedParticles = Constant283;
float Constant284 = 1e+07;
float3 Constant285 = float3(0,0,0);
Context.MapUpdate.Transient.Collision_PredictedParticlePositionForSimStages = Constant285;
Context.MapUpdate.Transient.PhysicsDeltaTime = Context.MapUpdate.Engine.DeltaTime;
float3 Constant286 = float3(0,0,0);
Context.MapUpdate.Transient.AdvectionVelocity = Constant286;
bool Constant287 = true;
Context.MapUpdate.Transient.DragIgnoreMass = Constant287;
float Constant288 = 99;
float Constant289 = 1;
float Constant290 = 0.5;
float Constant291 = 0.5;
float3 Constant292 = float3(0,0,1);
bool Constant293 = false;
Context.MapUpdate.Collision001.ControlRestStateViaSurfaceNormal = Constant293;
float Constant294 = 0.5;
float Constant295 = 0;
EnterStatScope(10 /**Collision001_Emitter_Func_*/);
Collision001_Emitter_Func_(Context);
ExitStatScope(/**Collision001_Emitter_Func_*/);
Context.MapUpdate.SolveForcesAndVelocity.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
Context.MapUpdate.SolveForcesAndVelocity.Force = Context.MapUpdate.Transient.PhysicsForce;
Context.MapUpdate.SolveForcesAndVelocity.Velocity = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.SolveForcesAndVelocity.Mass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.SolveForcesAndVelocity.Position = Context.MapUpdate.Particles.Position;
float Constant469 = 1000;
float3 Constant470 = float3(0,0,0);
float Constant471 = 9999;
bool Constant472 = true;
Context.MapUpdate.SolveForcesAndVelocity.WritetoIntrinsicProperties = Constant472;
EnterStatScope(11 /**SolveForcesAndVelocity_Emitter_Func_*/);
SolveForcesAndVelocity_Emitter_Func_(Context);
ExitStatScope(/**SolveForcesAndVelocity_Emitter_Func_*/);
Context.MapUpdate.FloatFromCurve004.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float Constant482 = 5;
float FloatFromCurve004_Emitter_Func_Output_Value;
FloatFromCurve004_Emitter_Func_(FloatFromCurve004_Emitter_Func_Output_Value, Context);
Context.MapUpdate.Fluids_Gas_Source.Radius = FloatFromCurve004_Emitter_Func_Output_Value;
float Constant484 = 2;
float Constant485 = 1;
float Constant486 = 1;
float Constant487 = 1;
float Constant488 = 1;
float Constant489 = 1;
Context.MapUpdate.Fluids_Gas_Source.Velocity = Context.MapUpdate.Particles.Velocity;
float Constant490 = 1;
EnterStatScope(12 /**Fluids_Gas_Source_Emitter_Func_*/);
Fluids_Gas_Source_Emitter_Func_(Context);
ExitStatScope(/**Fluids_Gas_Source_Emitter_Func_*/);
Context.MapUpdate.Multiply_Float.A = Context.MapUpdate.Particles.fluids_source_radius;
float Constant498 = 2;
float Multiply_Float_Emitter_Func_Output_Result;
Multiply_Float_Emitter_Func_(Multiply_Float_Emitter_Func_Output_Result, Context);
Context.MapUpdate.Vector2DFromFloat001.Value = Multiply_Float_Emitter_Func_Output_Result;
float2 Vector2DFromFloat001_Emitter_Func_Output_Vec2;
Vector2DFromFloat001_Emitter_Func_(Vector2DFromFloat001_Emitter_Func_Output_Vec2, Context);
Context.MapUpdate.SetVariables_BDEC693D447651B764B3B6BBF3065841.Particles.SpriteSize = Vector2DFromFloat001_Emitter_Func_Output_Vec2;
EnterStatScope(13 /**SetVariables_BDEC693D447651B764B3B6BBF3065841_Emitter_Func_*/);
SetVariables_BDEC693D447651B764B3B6BBF3065841_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_BDEC693D447651B764B3B6BBF3065841_Emitter_Func_*/);
float3 Emitter_VectorField32_TilingAxes;
float3 Emitter_VectorField32_Dimensions;
float3 Emitter_VectorField32_MinBounds;
float3 Emitter_VectorField32_MaxBounds;
Texture3D Emitter_VectorField32_Texture;
SamplerState Emitter_VectorField32_Sampler;
Emitter_ScaleAlpha_FloatCurve_MinTime;
Emitter_ScaleAlpha_FloatCurve_MaxTime;
Emitter_ScaleAlpha_FloatCurve_InvTimeRange;
Emitter_ScaleAlpha_FloatCurve_CurveLUTNumMinusOne;
Emitter_ScaleAlpha_FloatCurve_LUTOffset;
Emitter_ScaleAlpha_FloatCurve_CurveLUT;
float RemappedTime = saturate((Time - Emitter_ScaleAlpha_FloatCurve_MinTime) * Emitter_ScaleAlpha_FloatCurve_InvTimeRange) * float(Emitter_ScaleAlpha_FloatCurve_CurveLUTNumMinusOne);
IndexA = floor(RemappedTime);
IndexB = min(IndexA + 1, Emitter_ScaleAlpha_FloatCurve_CurveLUTNumMinusOne);
Fraction = frac(RemappedTime);
return Emitter_ScaleAlpha_FloatCurve_CurveLUT[index];
return StaticInputFloat[Emitter_ScaleAlpha_FloatCurve_LUTOffset + index];
uint IndexA, IndexB;
float Fraction;
GetCurveLUTIndices_Emitter_ScaleAlpha_FloatCurve(Time, IndexA, IndexB, Fraction);
IndexA *= 1;
IndexB *= 1;
for ( int i=0; i < 1; ++i )
Value = lerp(SampleCurveLUT_Emitter_ScaleAlpha_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_ScaleAlpha_FloatCurve(IndexB + i), Fraction);
Value[i] = lerp(SampleCurveLUT_Emitter_ScaleAlpha_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_ScaleAlpha_FloatCurve(IndexB + i), Fraction);
Emitter_Radius_FloatCurve_MinTime;
Emitter_Radius_FloatCurve_MaxTime;
Emitter_Radius_FloatCurve_InvTimeRange;
Emitter_Radius_FloatCurve_CurveLUTNumMinusOne;
Emitter_Radius_FloatCurve_LUTOffset;
Emitter_Radius_FloatCurve_CurveLUT;
float RemappedTime = saturate((Time - Emitter_Radius_FloatCurve_MinTime) * Emitter_Radius_FloatCurve_InvTimeRange) * float(Emitter_Radius_FloatCurve_CurveLUTNumMinusOne);
IndexB = min(IndexA + 1, Emitter_Radius_FloatCurve_CurveLUTNumMinusOne);
return Emitter_Radius_FloatCurve_CurveLUT[index];
return StaticInputFloat[Emitter_Radius_FloatCurve_LUTOffset + index];
GetCurveLUTIndices_Emitter_Radius_FloatCurve(Time, IndexA, IndexB, Fraction);
Value = lerp(SampleCurveLUT_Emitter_Radius_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_Radius_FloatCurve(IndexB + i), Fraction);
Value[i] = lerp(SampleCurveLUT_Emitter_Radius_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_Radius_FloatCurve(IndexB + i), Fraction);
float3 SamplePoint = (In_SamplePoint - Emitter_VectorField32_MinBounds) / (Emitter_VectorField32_MaxBounds - Emitter_VectorField32_MinBounds);
Out_Sample = Texture3DSample(Emitter_VectorField32_Texture, Emitter_VectorField32_Sampler, SamplePoint).xyz;
Context.MapSpawn.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSpawn.Engine.System.TickCount = Engine_System_TickCount;
Context.MapSpawn.Engine.Owner.Position = Engine_Owner_Position;
Context.MapSpawn.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSpawn.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSpawn.Engine.Owner.Scale = Engine_Owner_Scale;
Context.MapUpdate.Engine.DeltaTime = Engine_DeltaTime;
Context.MapUpdate.Emitter.Age = Emitter_Age;
Context.MapUpdate.Engine.Time = Engine_Time;
Context.MapUpdate.Engine.Owner.Position = Engine_Owner_Position;
Context.MapUpdate.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapUpdate.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapUpdate.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapUpdate.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapUpdate.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapUpdate.Engine.WorldDeltaTime = Engine_WorldDeltaTime;
Context.MapUpdate.Engine.InverseDeltaTime = Engine_InverseDeltaTime;
Context.MapUpdate.Engine.ExecutionCount = Engine_ExecutionCount;
Context.MapUpdate.Emitter.SpawnRate = Emitter_SpawnRate;
Context.MapUpdate.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapUpdate.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapUpdate.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.MapSpawn.Particles.Age = 0.0f;
Context.MapSpawn.Particles.Collision001.CollisionQueryAndResponse.CollisionID = 0;
Context.MapSpawn.Particles.Collision001.CollisionQueryAndResponse001.CollisionID = 0;
Context.MapSpawn.Particles.Collision001.OffscreenCounter = 0.0f;
Context.MapSpawn.Particles.Collision001.SafeCombinedCollisionNormal.x = 0.0f;
Context.MapSpawn.Particles.Collision001.SafeCombinedCollisionNormal.y = 0.0f;
Context.MapSpawn.Particles.Collision001.SafeCombinedCollisionNormal.z = 0.0f;
Context.MapSpawn.Particles.Color.r = 0.0f;
Context.MapSpawn.Particles.Color.g = 0.0f;
Context.MapSpawn.Particles.Color.b = 0.0f;
Context.MapSpawn.Particles.Color.a = 0.0f;
Context.MapSpawn.Particles.DistanceTraveled = 0.0f;
Context.MapSpawn.Particles.fluids_source_density = 0.0f;
Context.MapSpawn.Particles.fluids_source_divergence = 0.0f;
Context.MapSpawn.Particles.fluids_source_falloff = 0.0f;
Context.MapSpawn.Particles.fluids_source_noiseIntensity = 0.0f;
Context.MapSpawn.Particles.fluids_source_noiseScale = 0.0f;
Context.MapSpawn.Particles.fluids_source_radius = 0.0f;
Context.MapSpawn.Particles.fluids_source_temperature = 0.0f;
Context.MapSpawn.Particles.fluids_source_velocity.x = 0.0f;
Context.MapSpawn.Particles.fluids_source_velocity.y = 0.0f;
Context.MapSpawn.Particles.fluids_source_velocity.z = 0.0f;
Context.MapSpawn.Particles.fluids_source_velocityScale = 0.0f;
Context.MapSpawn.Particles.HasCollided = false;
Context.MapSpawn.Particles.Initial.Color.r = 0.0f;
Context.MapSpawn.Particles.Initial.Color.g = 0.0f;
Context.MapSpawn.Particles.Initial.Color.b = 0.0f;
Context.MapSpawn.Particles.Initial.Color.a = 0.0f;
Context.MapSpawn.Particles.Lifetime = 0.0f;
Context.MapSpawn.Particles.Mass = 0.0f;
Context.MapSpawn.Particles.MaterialRandom = 0.0f;
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
Context.MapSpawn.Particles.Previous.Position.x = 0.0f;
Context.MapSpawn.Particles.Previous.Position.y = 0.0f;
Context.MapSpawn.Particles.Previous.Position.z = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteRotation = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.z = 0.0f;
Context.MapSpawn.Particles.RestCounter = 0.0f;
Context.MapSpawn.Particles.RotationalInertia = 0.0f;
Context.MapSpawn.Particles.RotationalVelocity.x = 0.0f;
Context.MapSpawn.Particles.RotationalVelocity.y = 0.0f;
Context.MapSpawn.Particles.RotationalVelocity.z = 0.0f;
Context.MapSpawn.Particles.Scale.x = 0.0f;
Context.MapSpawn.Particles.Scale.y = 0.0f;
Context.MapSpawn.Particles.Scale.z = 0.0f;
Context.MapSpawn.Particles.SpriteRotation = 0.0f;
Context.MapSpawn.Particles.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Velocity.z = 0.0f;
Context.MapSpawn.DataInstance.Alive=true;
Context.MapSpawn.Engine.Emitter.ID.ID = 0;
Context.MapUpdate.Array.Age = 0;
Context.MapUpdate.Particles.Age = InputDataFloat(0, 0, InstanceIdx);
Context.MapUpdate.Array.Collision001.CollisionQueryAndResponse.CollisionID = 0;
Context.MapUpdate.Particles.Collision001.CollisionQueryAndResponse.CollisionID = InputDataInt(0, 0, InstanceIdx);
Context.MapUpdate.Array.Collision001.CollisionQueryAndResponse001.CollisionID = 1;
Context.MapUpdate.Particles.Collision001.CollisionQueryAndResponse001.CollisionID = InputDataInt(0, 1, InstanceIdx);
Context.MapUpdate.Array.Collision001.OffscreenCounter = 1;
Context.MapUpdate.Particles.Collision001.OffscreenCounter = InputDataFloat(0, 1, InstanceIdx);
Context.MapUpdate.Array.Collision001.SafeCombinedCollisionNormal = 2;
Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal.x = InputDataFloat(0, 2, InstanceIdx);
Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal.y = InputDataFloat(0, 3, InstanceIdx);
Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal.z = InputDataFloat(0, 4, InstanceIdx);
Context.MapUpdate.Array.Color = 5;
Context.MapUpdate.Particles.Color.r = InputDataFloat(0, 5, InstanceIdx);
Context.MapUpdate.Particles.Color.g = InputDataFloat(0, 6, InstanceIdx);
Context.MapUpdate.Particles.Color.b = InputDataFloat(0, 7, InstanceIdx);
Context.MapUpdate.Particles.Color.a = InputDataFloat(0, 8, InstanceIdx);
Context.MapUpdate.Array.DistanceTraveled = 9;
Context.MapUpdate.Particles.DistanceTraveled = InputDataFloat(0, 9, InstanceIdx);
Context.MapUpdate.Array.fluids_source_density = 10;
Context.MapUpdate.Particles.fluids_source_density = InputDataFloat(0, 10, InstanceIdx);
Context.MapUpdate.Array.fluids_source_divergence = 11;
Context.MapUpdate.Particles.fluids_source_divergence = InputDataFloat(0, 11, InstanceIdx);
Context.MapUpdate.Array.fluids_source_falloff = 12;
Context.MapUpdate.Particles.fluids_source_falloff = InputDataFloat(0, 12, InstanceIdx);
Context.MapUpdate.Array.fluids_source_noiseIntensity = 13;
Context.MapUpdate.Particles.fluids_source_noiseIntensity = InputDataFloat(0, 13, InstanceIdx);
Context.MapUpdate.Array.fluids_source_noiseScale = 14;
Context.MapUpdate.Particles.fluids_source_noiseScale = InputDataFloat(0, 14, InstanceIdx);
Context.MapUpdate.Array.fluids_source_radius = 15;
Context.MapUpdate.Particles.fluids_source_radius = InputDataFloat(0, 15, InstanceIdx);
Context.MapUpdate.Array.fluids_source_temperature = 16;
Context.MapUpdate.Particles.fluids_source_temperature = InputDataFloat(0, 16, InstanceIdx);
Context.MapUpdate.Array.fluids_source_velocity = 17;
Context.MapUpdate.Particles.fluids_source_velocity.x = InputDataFloat(0, 17, InstanceIdx);
Context.MapUpdate.Particles.fluids_source_velocity.y = InputDataFloat(0, 18, InstanceIdx);
Context.MapUpdate.Particles.fluids_source_velocity.z = InputDataFloat(0, 19, InstanceIdx);
Context.MapUpdate.Array.fluids_source_velocityScale = 20;
Context.MapUpdate.Particles.fluids_source_velocityScale = InputDataFloat(0, 20, InstanceIdx);
Context.MapUpdate.Array.HasCollided = 2;
Context.MapUpdate.Particles.HasCollided = InputDataBool(0, 2, InstanceIdx);
Context.MapUpdate.Array.Initial.Color = 21;
Context.MapUpdate.Particles.Initial.Color.r = InputDataFloat(0, 21, InstanceIdx);
Context.MapUpdate.Particles.Initial.Color.g = InputDataFloat(0, 22, InstanceIdx);
Context.MapUpdate.Particles.Initial.Color.b = InputDataFloat(0, 23, InstanceIdx);
Context.MapUpdate.Particles.Initial.Color.a = InputDataFloat(0, 24, InstanceIdx);
Context.MapUpdate.Array.Lifetime = 25;
Context.MapUpdate.Particles.Lifetime = InputDataFloat(0, 25, InstanceIdx);
Context.MapUpdate.Array.Mass = 26;
Context.MapUpdate.Particles.Mass = InputDataFloat(0, 26, InstanceIdx);
Context.MapUpdate.Array.MaterialRandom = 27;
Context.MapUpdate.Particles.MaterialRandom = InputDataFloat(0, 27, InstanceIdx);
Context.MapUpdate.Array.NormalizedAge = 28;
Context.MapUpdate.Particles.NormalizedAge = InputDataFloat(0, 28, InstanceIdx);
Context.MapUpdate.Array.NumberOfCollisions = 3;
Context.MapUpdate.Particles.NumberOfCollisions = InputDataInt(0, 3, InstanceIdx);
Context.MapUpdate.Array.Position = 29;
Context.MapUpdate.Particles.Position.x = InputDataFloat(0, 29, InstanceIdx);
Context.MapUpdate.Particles.Position.y = InputDataFloat(0, 30, InstanceIdx);
Context.MapUpdate.Particles.Position.z = InputDataFloat(0, 31, InstanceIdx);
Context.MapUpdate.Array.Presolve.PhysicsForce = 32;
Context.MapUpdate.Particles.Presolve.PhysicsForce.x = InputDataFloat(0, 32, InstanceIdx);
Context.MapUpdate.Particles.Presolve.PhysicsForce.y = InputDataFloat(0, 33, InstanceIdx);
Context.MapUpdate.Particles.Presolve.PhysicsForce.z = InputDataFloat(0, 34, InstanceIdx);
Context.MapUpdate.Array.Presolve.Position = 35;
Context.MapUpdate.Particles.Presolve.Position.x = InputDataFloat(0, 35, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Position.y = InputDataFloat(0, 36, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Position.z = InputDataFloat(0, 37, InstanceIdx);
Context.MapUpdate.Array.Presolve.Velocity = 38;
Context.MapUpdate.Particles.Presolve.Velocity.x = InputDataFloat(0, 38, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Velocity.y = InputDataFloat(0, 39, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Velocity.z = InputDataFloat(0, 40, InstanceIdx);
Context.MapUpdate.Array.RestCounter = 50;
Context.MapUpdate.Particles.RestCounter = InputDataFloat(0, 50, InstanceIdx);
Context.MapUpdate.Array.RotationalInertia = 51;
Context.MapUpdate.Particles.RotationalInertia = InputDataFloat(0, 51, InstanceIdx);
Context.MapUpdate.Array.RotationalVelocity = 52;
Context.MapUpdate.Particles.RotationalVelocity.x = InputDataFloat(0, 52, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.y = InputDataFloat(0, 53, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.z = InputDataFloat(0, 54, InstanceIdx);
Context.MapUpdate.Array.Scale = 55;
Context.MapUpdate.Particles.Scale.x = InputDataFloat(0, 55, InstanceIdx);
Context.MapUpdate.Particles.Scale.y = InputDataFloat(0, 56, InstanceIdx);
Context.MapUpdate.Particles.Scale.z = InputDataFloat(0, 57, InstanceIdx);
Context.MapUpdate.Array.SpriteRotation = 58;
Context.MapUpdate.Particles.SpriteRotation = InputDataFloat(0, 58, InstanceIdx);
Context.MapUpdate.Array.SpriteSize = 59;
Context.MapUpdate.Particles.SpriteSize.x = InputDataFloat(0, 59, InstanceIdx);
Context.MapUpdate.Particles.SpriteSize.y = InputDataFloat(0, 60, InstanceIdx);
Context.MapUpdate.Array.UniqueID = 4;
Context.MapUpdate.Particles.UniqueID = InputDataInt(0, 4, InstanceIdx);
Context.MapUpdate.Array.Velocity = 61;
Context.MapUpdate.Particles.Velocity.x = InputDataFloat(0, 61, InstanceIdx);
Context.MapUpdate.Particles.Velocity.y = InputDataFloat(0, 62, InstanceIdx);
Context.MapUpdate.Particles.Velocity.z = InputDataFloat(0, 63, InstanceIdx);
Context.MapUpdate.Particles.Position;
Context.MapUpdate.Particles.SpriteRotation;
Context.MapUpdate.Particles.SpriteSize;
Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.DataInstance.Alive=true;
Context.MapUpdate.Engine.Emitter.ID.ID = 0;
InterpolateParameters(Context);
Context.MapUpdate.DataInstance.Alive = true;
Context.MapUpdate.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
const bool bValid = bIsValidInstance && Context.MapUpdate.DataInstance.Alive;
const int WriteIndex = OutputIndex(0, true, bValid);
OutputDataFloat(0, 0, WriteIndex, Context.MapUpdate.Particles.Age);
OutputDataInt(0, 0, WriteIndex, Context.MapUpdate.Particles.Collision001.CollisionQueryAndResponse.CollisionID);
OutputDataInt(0, 1, WriteIndex, Context.MapUpdate.Particles.Collision001.CollisionQueryAndResponse001.CollisionID);
OutputDataFloat(0, 1, WriteIndex, Context.MapUpdate.Particles.Collision001.OffscreenCounter);
OutputDataFloat(0, 2, WriteIndex, Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal.x);
OutputDataFloat(0, 3, WriteIndex, Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal.y);
OutputDataFloat(0, 4, WriteIndex, Context.MapUpdate.Particles.Collision001.SafeCombinedCollisionNormal.z);
OutputDataFloat(0, 5, WriteIndex, Context.MapUpdate.Particles.Color.r);
OutputDataFloat(0, 6, WriteIndex, Context.MapUpdate.Particles.Color.g);
OutputDataFloat(0, 7, WriteIndex, Context.MapUpdate.Particles.Color.b);
OutputDataFloat(0, 8, WriteIndex, Context.MapUpdate.Particles.Color.a);
OutputDataFloat(0, 9, WriteIndex, Context.MapUpdate.Particles.DistanceTraveled);
OutputDataFloat(0, 10, WriteIndex, Context.MapUpdate.Particles.fluids_source_density);
OutputDataFloat(0, 11, WriteIndex, Context.MapUpdate.Particles.fluids_source_divergence);
OutputDataFloat(0, 12, WriteIndex, Context.MapUpdate.Particles.fluids_source_falloff);
OutputDataFloat(0, 13, WriteIndex, Context.MapUpdate.Particles.fluids_source_noiseIntensity);
OutputDataFloat(0, 14, WriteIndex, Context.MapUpdate.Particles.fluids_source_noiseScale);
OutputDataFloat(0, 15, WriteIndex, Context.MapUpdate.Particles.fluids_source_radius);
OutputDataFloat(0, 16, WriteIndex, Context.MapUpdate.Particles.fluids_source_temperature);
OutputDataFloat(0, 17, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.x);
OutputDataFloat(0, 18, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.y);
OutputDataFloat(0, 19, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.z);
OutputDataFloat(0, 20, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocityScale);
OutputDataBool(0, 2, WriteIndex, Context.MapUpdate.Particles.HasCollided);
OutputDataFloat(0, 21, WriteIndex, Context.MapUpdate.Particles.Initial.Color.r);
OutputDataFloat(0, 22, WriteIndex, Context.MapUpdate.Particles.Initial.Color.g);
OutputDataFloat(0, 23, WriteIndex, Context.MapUpdate.Particles.Initial.Color.b);
OutputDataFloat(0, 24, WriteIndex, Context.MapUpdate.Particles.Initial.Color.a);
OutputDataFloat(0, 25, WriteIndex, Context.MapUpdate.Particles.Lifetime);
OutputDataFloat(0, 26, WriteIndex, Context.MapUpdate.Particles.Mass);
OutputDataFloat(0, 27, WriteIndex, Context.MapUpdate.Particles.MaterialRandom);
OutputDataFloat(0, 28, WriteIndex, Context.MapUpdate.Particles.NormalizedAge);
OutputDataInt(0, 3, WriteIndex, Context.MapUpdate.Particles.NumberOfCollisions);
OutputDataFloat(0, 29, WriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 30, WriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 31, WriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 32, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.x);
OutputDataFloat(0, 33, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.y);
OutputDataFloat(0, 34, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.z);
OutputDataFloat(0, 35, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.x);
OutputDataFloat(0, 36, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.y);
OutputDataFloat(0, 37, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.z);
OutputDataFloat(0, 38, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.x);
OutputDataFloat(0, 39, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.y);
OutputDataFloat(0, 40, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.z);
OutputDataFloat(0, 41, WriteIndex, Context.MapUpdate.Particles.Previous.Position.x);
OutputDataFloat(0, 42, WriteIndex, Context.MapUpdate.Particles.Previous.Position.y);
OutputDataFloat(0, 43, WriteIndex, Context.MapUpdate.Particles.Previous.Position.z);
OutputDataFloat(0, 44, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteRotation);
OutputDataFloat(0, 45, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 46, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 47, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.x);
OutputDataFloat(0, 48, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.y);
OutputDataFloat(0, 49, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.z);
OutputDataFloat(0, 50, WriteIndex, Context.MapUpdate.Particles.RestCounter);
OutputDataFloat(0, 51, WriteIndex, Context.MapUpdate.Particles.RotationalInertia);
OutputDataFloat(0, 52, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.x);
OutputDataFloat(0, 53, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.y);
OutputDataFloat(0, 54, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.z);
OutputDataFloat(0, 55, WriteIndex, Context.MapUpdate.Particles.Scale.x);
OutputDataFloat(0, 56, WriteIndex, Context.MapUpdate.Particles.Scale.y);
OutputDataFloat(0, 57, WriteIndex, Context.MapUpdate.Particles.Scale.z);
OutputDataFloat(0, 58, WriteIndex, Context.MapUpdate.Particles.SpriteRotation);
OutputDataFloat(0, 59, WriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 60, WriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataInt(0, 4, WriteIndex, Context.MapUpdate.Particles.UniqueID);
OutputDataFloat(0, 61, WriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 62, WriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 63, WriteIndex, Context.MapUpdate.Particles.Velocity.z);
ØΩyÅBá;ÏUı˙©
 Aöôô>
 AÕÃÃ=
$á'¬IÜYµqDúÃtúÚ;KK¢8
ª°p7¥;÷5÷eñò
| enter_stat_scope();
| R[0] = acquireindex(C[2]);
| external_func_call(C[0], C[1], C[1], C[2]R[65535]);
| exit_stat_scope();
| external_func_call(C[0]O[144], O[202]);
| O[144] = i2f_mul(O[144], C[3]);
| O[202] = i2f_mul(O[202], C[3]);
| O[157] = f2i(O[144]);
| O[165] = f2i(O[202]);
| external_func_call(C[4], O[157], O[165], C[2]R[65535]);
| O[158] = div(C[5], O[144]);
| O[157] = div(C[5], O[202]);
| outputdata_float(0, 147, R[0], O[157]);
| O[144] = f2i(O[144]);
| outputdata_int32(0, 10, R[0], O[144]);
| O[157] = f2i(O[202]);
| O[144] = i2f(O[144]);
| O[202] = i2f(O[202]);
| O[165] = f2i(O[144]);
| O[162] = f2i(O[202]);
| external_func_call(C[6], O[165], O[162], C[2]R[65535]);
| O[164] = div(C[5], O[144]);
| O[165] = div(C[5], O[202]);
| O[162] = f2i(O[144]);
| O[202] = f2i(O[202]);
| outputdata_int32(0, 13, R[0], O[202]);
| O[147] = f2i(O[144]);
| O[146] = f2i(O[202]);
| external_func_call(C[7], O[147], O[146], C[2]R[65535]);
| outputdata_float(0, 28, R[0], C[26]);
| outputdata_float(0, 29, R[0], C[27]);
| O[146] = div(C[5], O[144]);
| O[147] = div(C[5], O[202]);
| external_func_call(C[0]O[150], O[11]);
| O[150] = i2f(O[150]);
| outputdata_float(0, 134, R[0], C[32]);
| outputdata_float(0, 135, R[0], C[32]);
| O[11] = i2f(O[11]);
| outputdata_int32(0, 15, R[0], C[33]);
| outputdata_int32(0, 16, R[0], C[33]);
| O[153] = f2i(O[150]);
| O[152] = f2i(O[11]);
| external_func_call(C[8], O[153], O[152], C[2]R[65535]);
| O[153] = div(C[5], O[150]);
| outputdata_float(0, 142, R[0], O[153]);
| outputdata_int32(0, 0, R[0], C[13]);
| O[153] = div(C[5], O[11]);
| outputdata_float(0, 1, R[0], C[15]);
| outputdata_float(0, 26, R[0], C[15]);
| outputdata_float(0, 143, R[0], O[153]);
| outputdata_float(0, 169, R[0], C[15]);
| O[150] = f2i(O[150]);
| outputdata_float(0, 4, R[0], C[16]);
| outputdata_float(0, 6, R[0], C[16]);
| outputdata_float(0, 11, R[0], C[16]);
| outputdata_float(0, 12, R[0], C[16]);
| outputdata_float(0, 16, R[0], C[16]);
| outputdata_float(0, 19, R[0], C[16]);
| outputdata_float(0, 23, R[0], C[16]);
| outputdata_float(0, 74, R[0], C[16]);
| outputdata_float(0, 155, R[0], C[16]);
| outputdata_float(0, 156, R[0], C[16]);
| outputdata_float(0, 162, R[0], C[16]);
| outputdata_float(0, 164, R[0], C[16]);
| outputdata_float(0, 165, R[0], C[16]);
| outputdata_float(0, 166, R[0], C[16]);
| outputdata_float(0, 167, R[0], C[16]);
| outputdata_float(0, 168, R[0], C[16]);
| outputdata_float(0, 170, R[0], C[16]);
| outputdata_float(0, 171, R[0], C[16]);
| outputdata_float(0, 173, R[0], C[16]);
| outputdata_float(0, 174, R[0], C[16]);
| outputdata_float(0, 176, R[0], C[16]);
| outputdata_int32(0, 8, R[0], O[150]);
| outputdata_int32(0, 31, R[0], C[34]);
| O[11] = f2i(O[11]);
| outputdata_float(0, 0, R[0], C[14]);
| outputdata_float(0, 2, R[0], C[14]);
| outputdata_float(0, 3, R[0], C[14]);
| outputdata_float(0, 5, R[0], C[14]);
| outputdata_float(0, 8, R[0], C[14]);
| outputdata_float(0, 9, R[0], C[14]);
| outputdata_float(0, 17, R[0], C[14]);
| outputdata_float(0, 18, R[0], C[14]);
| outputdata_float(0, 32, R[0], C[14]);
| outputdata_float(0, 34, R[0], C[14]);
| outputdata_float(0, 35, R[0], C[14]);
| outputdata_float(0, 37, R[0], C[14]);
| outputdata_float(0, 38, R[0], C[14]);
| outputdata_float(0, 39, R[0], C[14]);
| outputdata_float(0, 40, R[0], C[14]);
| outputdata_float(0, 41, R[0], C[14]);
| outputdata_float(0, 42, R[0], C[14]);
| outputdata_float(0, 43, R[0], C[14]);
| outputdata_float(0, 44, R[0], C[14]);
| outputdata_float(0, 45, R[0], C[14]);
| outputdata_float(0, 46, R[0], C[14]);
| outputdata_float(0, 47, R[0], C[14]);
| outputdata_float(0, 48, R[0], C[14]);
| outputdata_float(0, 49, R[0], C[14]);
| outputdata_float(0, 50, R[0], C[14]);
| outputdata_float(0, 51, R[0], C[14]);
| outputdata_float(0, 52, R[0], C[14]);
| outputdata_float(0, 53, R[0], C[14]);
| outputdata_float(0, 54, R[0], C[14]);
| outputdata_float(0, 55, R[0], C[14]);
| outputdata_float(0, 56, R[0], C[14]);
| outputdata_float(0, 57, R[0], C[14]);
| outputdata_float(0, 58, R[0], C[14]);
| outputdata_float(0, 59, R[0], C[14]);
| outputdata_float(0, 60, R[0], C[14]);
| outputdata_float(0, 61, R[0], C[14]);
| outputdata_float(0, 62, R[0], C[14]);
| outputdata_float(0, 63, R[0], C[14]);
| outputdata_float(0, 64, R[0], C[14]);
| outputdata_float(0, 65, R[0], C[14]);
| outputdata_float(0, 66, R[0], C[14]);
| outputdata_float(0, 67, R[0], C[14]);
| outputdata_float(0, 68, R[0], C[14]);
| outputdata_float(0, 69, R[0], C[14]);
| outputdata_float(0, 70, R[0], C[14]);
| outputdata_float(0, 71, R[0], C[14]);
| outputdata_float(0, 72, R[0], C[14]);
| outputdata_float(0, 73, R[0], C[14]);
| outputdata_float(0, 75, R[0], C[14]);
| outputdata_float(0, 76, R[0], C[14]);
| outputdata_float(0, 77, R[0], C[14]);
| outputdata_float(0, 78, R[0], C[14]);
| outputdata_float(0, 79, R[0], C[14]);
| outputdata_float(0, 80, R[0], C[14]);
| outputdata_float(0, 81, R[0], C[14]);
| outputdata_float(0, 82, R[0], C[14]);
| outputdata_float(0, 83, R[0], C[14]);
| outputdata_float(0, 84, R[0], C[14]);
| outputdata_float(0, 85, R[0], C[14]);
| outputdata_float(0, 86, R[0], C[14]);
| outputdata_float(0, 87, R[0], C[14]);
| outputdata_float(0, 88, R[0], C[14]);
| outputdata_float(0, 89, R[0], C[14]);
| outputdata_float(0, 90, R[0], C[14]);
| outputdata_float(0, 91, R[0], C[14]);
| outputdata_float(0, 92, R[0], C[14]);
| outputdata_float(0, 93, R[0], C[14]);
| outputdata_float(0, 94, R[0], C[14]);
| outputdata_float(0, 95, R[0], C[14]);
| outputdata_float(0, 96, R[0], C[14]);
| outputdata_float(0, 97, R[0], C[14]);
| outputdata_float(0, 98, R[0], C[14]);
| outputdata_float(0, 99, R[0], C[14]);
| outputdata_float(0, 100, R[0], C[14]);
| outputdata_float(0, 101, R[0], C[14]);
| outputdata_float(0, 102, R[0], C[14]);
| outputdata_float(0, 103, R[0], C[14]);
| outputdata_float(0, 104, R[0], C[14]);
| outputdata_float(0, 105, R[0], C[14]);
| outputdata_float(0, 106, R[0], C[14]);
| outputdata_float(0, 107, R[0], C[14]);
| outputdata_float(0, 108, R[0], C[14]);
| outputdata_float(0, 109, R[0], C[14]);
| outputdata_float(0, 110, R[0], C[14]);
| outputdata_float(0, 111, R[0], C[14]);
| outputdata_float(0, 112, R[0], C[14]);
| outputdata_float(0, 113, R[0], C[14]);
| outputdata_float(0, 114, R[0], C[14]);
| outputdata_float(0, 115, R[0], C[14]);
| outputdata_float(0, 116, R[0], C[14]);
| outputdata_float(0, 117, R[0], C[14]);
| outputdata_float(0, 118, R[0], C[14]);
| outputdata_float(0, 119, R[0], C[14]);
| outputdata_float(0, 120, R[0], C[14]);
| outputdata_float(0, 121, R[0], C[14]);
| outputdata_float(0, 122, R[0], C[14]);
| outputdata_float(0, 123, R[0], C[14]);
| outputdata_float(0, 124, R[0], C[14]);
| outputdata_float(0, 125, R[0], C[14]);
| outputdata_float(0, 126, R[0], C[14]);
| outputdata_float(0, 127, R[0], C[14]);
| outputdata_float(0, 128, R[0], C[14]);
| outputdata_float(0, 129, R[0], C[14]);
| outputdata_float(0, 130, R[0], C[14]);
| outputdata_float(0, 131, R[0], C[14]);
| outputdata_float(0, 132, R[0], C[14]);
| outputdata_float(0, 133, R[0], C[14]);
| outputdata_float(0, 154, R[0], C[14]);
| outputdata_float(0, 157, R[0], C[14]);
| outputdata_float(0, 158, R[0], C[14]);
| outputdata_float(0, 159, R[0], C[14]);
| outputdata_float(0, 160, R[0], C[14]);
| outputdata_float(0, 161, R[0], C[14]);
| outputdata_float(0, 163, R[0], C[14]);
| outputdata_float(0, 175, R[0], C[14]);
| outputdata_float(0, 179, R[0], C[14]);
| outputdata_float(0, 180, R[0], C[14]);
| outputdata_float(0, 181, R[0], C[14]);
| outputdata_float(0, 182, R[0], C[14]);
| outputdata_float(0, 183, R[0], C[14]);
| outputdata_float(0, 184, R[0], C[14]);
| outputdata_float(0, 185, R[0], C[14]);
| outputdata_float(0, 186, R[0], C[14]);
| outputdata_float(0, 187, R[0], C[14]);
| outputdata_float(0, 188, R[0], C[14]);
| outputdata_float(0, 189, R[0], C[14]);
| outputdata_float(0, 190, R[0], C[14]);
| outputdata_int32(0, 9, R[0], O[11]);
| external_func_call(C[0]O[11], R[65535]);
| O[11] = i2f_div1(O[11], C[5]);
| outputdata_float(0, 10, R[0], O[11]);
| outputdata_float(0, 136, R[0], C[5]);
| outputdata_float(0, 137, R[0], C[5]);
| outputdata_float(0, 140, R[0], C[5]);
| outputdata_float(0, 141, R[0], C[5]);
| outputdata_float(0, 144, R[0], C[5]);
| outputdata_float(0, 145, R[0], C[5]);
| outputdata_float(0, 148, R[0], C[5]);
| outputdata_float(0, 149, R[0], C[5]);
| outputdata_float(0, 150, R[0], O[164]);
| outputdata_float(0, 152, R[0], C[5]);
| outputdata_float(0, 153, R[0], C[5]);
| outputdata_float(0, 177, R[0], C[5]);
| outputdata_float(0, 178, R[0], C[5]);
| outputdata_int32(0, 4, R[0], C[1]);
| outputdata_int32(0, 5, R[0], C[1]);
| outputdata_int32(0, 18, R[0], C[1]);
| outputdata_int32(0, 19, R[0], C[1]);
| external_func_call(C[9], C[10], C[10], C[2]R[65535]);
| outputdata_float(0, 30, R[0], C[28]);
| outputdata_float(0, 138, R[0], O[146]);
| external_func_call(C[11], C[10], C[10], C[2]R[65535]);
| outputdata_float(0, 31, R[0], C[29]);
| outputdata_float(0, 36, R[0], C[31]);
| outputdata_float(0, 139, R[0], O[147]);
| outputdata_float(0, 146, R[0], O[158]);
| outputdata_int32(0, 3, R[0], C[2]);
| outputdata_int32(0, 7, R[0], O[202]);
| outputdata_int32(0, 14, R[0], C[2]);
| outputdata_int32(0, 20, R[0], C[10]);
| outputdata_int32(0, 21, R[0], C[10]);
| outputdata_int32(0, 37, R[0], C[2]);
| external_func_call(C[0]O[202]);
| outputdata_float(0, 7, R[0], C[17]);
| outputdata_int32(0, 29, R[0], O[202]);
| outputdata_float(0, 13, R[0], C[18]);
| outputdata_int32(0, 25, R[0], O[202]);
| external_func_call(C[8]O[202]);
| outputdata_float(0, 14, R[0], C[19]);
| outputdata_int32(0, 12, R[0], O[162]);
| outputdata_int32(0, 26, R[0], O[202]);
| external_func_call(C[7]O[202]);
| outputdata_float(0, 15, R[0], C[20]);
| outputdata_float(0, 151, R[0], O[165]);
| outputdata_int32(0, 22, R[0], O[202]);
| outputdata_float(0, 20, R[0], C[21]);
| outputdata_float(0, 172, R[0], C[21]);
| outputdata_int32(0, 24, R[0], O[202]);
| outputdata_float(0, 21, R[0], C[22]);
| outputdata_int32(0, 23, R[0], O[202]);
| outputdata_float(0, 22, R[0], C[23]);
| outputdata_int32(0, 27, R[0], O[202]);
| outputdata_float(0, 24, R[0], C[24]);
| outputdata_float(0, 25, R[0], C[24]);
| outputdata_int32(0, 1, R[0], C[0]);
| outputdata_int32(0, 2, R[0], C[0]);
| outputdata_int32(0, 11, R[0], O[157]);
| outputdata_int32(0, 17, R[0], C[0]);
| outputdata_int32(0, 28, R[0], O[202]);
| outputdata_int32(0, 32, R[0], C[0]);
| outputdata_int32(0, 33, R[0], C[0]);
| outputdata_int32(0, 34, R[0], C[0]);
| outputdata_int32(0, 35, R[0], C[0]);
| outputdata_int32(0, 36, R[0], C[0]);
| outputdata_int32(0, 38, R[0], C[0]);
| outputdata_int32(0, 39, R[0], C[0]);
| outputdata_int32(0, 40, R[0], C[0]);
| external_func_call(C[12]O[202]);
| outputdata_float(0, 27, R[0], C[25]);
| outputdata_float(0, 33, R[0], C[30]);
| outputdata_int32(0, 6, R[0], O[144]);
| outputdata_int32(0, 30, R[0], O[202]);
| done();
| R[0] = inputdata_float();
| O[220] = inputdata_float();
| O[171] = inputdata_float();
| O[223] = inputdata_float();
| O[176] = inputdata_float();
| O[62] = inputdata_float();
| O[12] = inputdata_float();
| O[214] = inputdata_float();
| O[7] = inputdata_float();
| O[9] = inputdata_float();
| O[228] = inputdata_int32();
| O[19] = inputdata_int32();
| O[40] = inputdata_float();
| O[82] = inputdata_float();
| O[78] = inputdata_float();
| O[77] = inputdata_float();
| O[76] = inputdata_float();
| O[75] = inputdata_float();
| O[61] = inputdata_float();
| O[60] = inputdata_float();
| O[59] = inputdata_float();
| O[48] = inputdata_float();
| O[49] = inputdata_float();
| O[47] = inputdata_float();
| O[14] = inputdata_float();
| O[46] = inputdata_float();
| O[131] = inputdata_float();
| O[130] = inputdata_float();
| O[129] = inputdata_float();
| O[128] = inputdata_float();
| O[127] = inputdata_float();
| O[126] = inputdata_float();
| O[125] = inputdata_float();
| O[124] = inputdata_float();
| O[123] = inputdata_float();
| O[122] = inputdata_float();
| O[132] = inputdata_float();
| O[133] = inputdata_float();
| O[17] = inputdata_int32();
| R[39] = inputdata_int32();
| R[40] = inputdata_float();
| R[41] = inputdata_float();
| R[42] = inputdata_float();
| R[43] = inputdata_float();
| R[44] = inputdata_int32();
| R[45] = inputdata_int32();
| R[46] = inputdata_float();
| R[47] = inputdata_float();
| R[48] = inputdata_float();
| R[49] = inputdata_float();
| R[50] = inputdata_int32();
| R[51] = inputdata_int32();
| R[52] = inputdata_float();
| R[53] = inputdata_float();
| R[54] = inputdata_float();
| R[55] = inputdata_float();
| R[56] = inputdata_int32();
| R[57] = inputdata_int32();
| R[58] = inputdata_float();
| R[59] = inputdata_float();
| R[60] = inputdata_float();
| R[61] = inputdata_float();
| R[62] = inputdata_int32();
| R[63] = inputdata_int32();
| R[64] = inputdata_float();
| R[65] = inputdata_float();
| R[66] = inputdata_float();
| R[67] = inputdata_float();
| R[68] = inputdata_int32();
| R[69] = inputdata_int32();
| R[70] = inputdata_int32();
| R[71] = inputdata_int32();
| R[72] = inputdata_float();
| R[73] = inputdata_float();
| R[74] = inputdata_float();
| R[75] = inputdata_float();
| R[76] = inputdata_int32();
| R[77] = inputdata_int32();
| R[78] = inputdata_int32();
| R[79] = inputdata_int32();
| R[80] = inputdata_int32();
| R[81] = inputdata_float();
| R[82] = inputdata_float();
| R[83] = inputdata_int32();
| R[84] = inputdata_int32();
| R[85] = inputdata_int32();
| R[86] = inputdata_int32();
| R[87] = inputdata_int32();
| R[88] = inputdata_int32();
| R[89] = inputdata_int32();
| R[90] = inputdata_float();
| R[91] = inputdata_float();
| R[92] = inputdata_float();
| R[93] = inputdata_float();
| R[94] = inputdata_float();
| R[95] = inputdata_float();
| R[96] = inputdata_float();
| R[97] = inputdata_int32();
| R[98] = inputdata_int32();
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
| R[109] = inputdata_int32();
| R[110] = inputdata_int32();
| R[111] = inputdata_int32();
| R[112] = inputdata_float();
| R[113] = inputdata_float();
| R[114] = inputdata_float();
| R[115] = inputdata_int32();
| R[116] = inputdata_int32();
| R[117] = inputdata_int32();
| R[118] = inputdata_float();
| R[119] = inputdata_int32();
| R[120] = inputdata_int32();
| R[121] = inputdata_float();
| R[122] = inputdata_float();
| R[123] = inputdata_float();
| R[124] = inputdata_float();
| R[125] = inputdata_float();
| R[126] = inputdata_float();
| R[127] = inputdata_float();
| R[128] = inputdata_int32();
| R[129] = inputdata_float();
| R[0] = acquireindex(C[18]);
| O[223] = cmpeq_select(I[80], C[0], C[1], I[81]);
| O[171] = add(C[2], I[82]);
| O[220] = div_f2i(O[171], O[223]);
| O[220] = maxi(O[220], C[3]);
| O[176] = i2f_mul(O[220], O[223]);
| O[171] = sub(O[171], O[176]);
| O[176] = addi(O[220], I[118]);
| outputdata_int32(0, 40, R[0], O[176]);
| O[176] = add(I[80], C[2]);
| outputdata_float(0, 187, R[0], O[176]);
| O[220] = cmpgti(O[220], C[3]);
| O[223] = select(O[220], O[223], O[223]);
| O[171] = select(O[220], O[171], O[171]);
| O[220] = div(O[171], O[223]);
| outputdata_float(0, 188, R[0], O[223]);
| outputdata_float(0, 189, R[0], O[171]);
| outputdata_float(0, 190, R[0], O[220]);
| O[171] = cmplei(I[117], C[3]);
| O[220] = select(O[171], C[3], I[116]);
| O[223] = select(O[171], C[3], I[117]);
| outputdata_float(0, 2, R[0], I[2]);
| O[171] = cmpneqi(I[128], C[3]);
| O[171] = cmplei_logic_and(O[223], C[4], O[171]);
| O[220] = select(O[171], I[128], O[220]);
| O[228] = select(O[171], C[4], O[223]);
| O[62] = cmpeq_select(I[0], C[0], C[5], I[3]);
| O[171] = add(C[2], I[56]);
| O[223] = div_f2i(O[171], O[62]);
| O[223] = maxi(O[223], C[3]);
| O[176] = i2f_mul(O[223], O[62]);
| O[176] = sub(O[171], O[176]);
| O[171] = addi(O[223], I[98]);
| O[12] = add(I[0], C[2]);
| outputdata_float(0, 0, R[0], O[12]);
| O[223] = cmpgti(O[223], C[3]);
| O[62] = select(O[223], O[62], O[62]);
| O[223] = select(O[223], O[176], O[176]);
| O[176] = div(O[223], O[62]);
| outputdata_float(0, 3, R[0], O[62]);
| outputdata_float(0, 154, R[0], O[223]);
| O[223] = clamp(I[119], C[0], C[6]);
| outputdata_float(0, 163, R[0], O[223]);
| O[223] = cmpneqi(I[83], C[7]);
| O[223] = cmpnei_logic_and(I[83], C[8], O[223]);
| O[223] = cmpeqi_logic_and(O[228], C[3], O[223]);
| O[62] = cmplei_logic_and(I[84], O[228], O[223]);
| O[223] = cmpeqi(I[83], C[9]);
| O[223] = cmpeqi_logic_or(I[83], C[4], O[223]);
| O[223] = cmpeqi_logic_and(O[220], C[4], O[223]);
| O[223] = b2i(O[223]);
| O[223] = cmpeqi_select(O[223], C[3], O[220], C[9]);
| O[223] = select(O[62], O[223], I[83]);
| O[12] = select(O[62], O[228], I[84]);
| O[62] = cmpeqi(O[228], C[4]);
| O[62] = cmpnei_logic_and(O[220], C[3], O[62]);
| O[214] = cmpneqi(O[223], C[8]);
| O[214] = cmpnei_logic_and(O[223], C[7], O[214]);
| O[62] = logic_and(O[62], O[214]);
| O[62] = cmplei_logic_and(O[12], C[9], O[62]);
| O[223] = select(O[62], C[9], O[223]);
| O[12] = select(O[62], C[9], O[12]);
| O[62] = cmpneqi(O[12], C[3]);
| O[62] = cmpnei_logic_and(O[223], C[3], O[62]);
| O[62] = cmpeqi_logic_and(I[127], C[3], O[62]);
| outputdata_float(0, 7, R[0], I[7]);
| O[62] = cmplei_logic_and(O[12], C[7], O[62]);
| O[223] = select(O[62], C[7], O[223]);
| O[62] = select(O[62], C[7], O[12]);
| O[12] = mul(I[124], C[2]);
| O[214] = mul(I[123], C[2]);
| O[214] = mul_mad1(O[12], O[12], O[214], O[214]);
| O[12] = mul(I[125], C[2]);
| O[12] = mad_sqrt(O[12], O[12], O[214]);
| O[9] = fmod_add(I[8], C[10], O[12]);
| external_func_call(C[3]R[65535], R[65535], R[65535], R[65535], R[65535], R[65535], O[7], O[214], O[12], O[78], O[82], O[19]);
| O[40] = mul_mad1(O[82], O[82], O[78], O[78]);
| O[40] = mad(O[19], O[19], O[40]);
| O[40] = rsq(O[40]);
| O[59] = mul(O[78], O[40]);
| O[60] = mul(O[82], O[40]);
| O[61] = mul(O[19], O[40]);
| O[19] = neg(O[7]);
| O[7] = neg(O[214]);
| O[12] = neg(O[12]);
| O[214] = mul_mad1(O[7], O[7], O[19], O[19]);
| O[214] = mad(O[12], O[12], O[214]);
| O[214] = rsq(O[214]);
| O[82] = mul(O[19], O[214]);
| O[40] = mul(O[7], O[214]);
| O[19] = mul(O[12], O[214]);
| O[12] = mul(O[61], O[40]);
| O[7] = mul_sub0(O[60], O[19], O[12]);
| O[12] = mul(O[59], O[19]);
| O[214] = mul_sub0(O[61], O[82], O[12]);
| O[12] = mul(O[60], O[82]);
| O[12] = mul_sub0(O[59], O[40], O[12]);
| O[78] = mul_mad1(O[214], O[214], O[7], O[7]);
| O[78] = mad(O[12], O[12], O[78]);
| O[78] = rsq(O[78]);
| O[7] = mul(O[7], O[78]);
| O[214] = mul(O[214], O[78]);
| O[12] = mul(O[12], O[78]);
| O[76] = mul_mad1(C[11], I[38], C[12], C[0]);
| O[75] = mul_mad1(C[11], C[0], C[12], I[39]);
| O[78] = mul_mad1(C[11], C[0], C[12], C[0]);
| O[77] = mul_mad1(C[11], C[0], C[12], C[0]);
| O[128] = mul_mad1(O[76], C[13], O[75], C[15]);
| O[126] = mul_mad1(O[76], C[14], O[75], C[13]);
| O[78] = add_add(C[12], O[78], C[0]);
| O[127] = add_add(C[5], O[77], C[0]);
| O[77] = mul(I[38], C[13]);
| O[49] = mul(I[38], C[14]);
| O[48] = mul_mad1(O[77], O[59], O[49], O[82]);
| O[75] = mul_mad1(O[77], O[60], O[49], O[40]);
| O[76] = mul_mad1(O[77], O[61], O[49], O[19]);
| O[77] = mul_mad1(O[77], C[0], O[49], C[0]);
| O[129] = mad_mad0(C[0], O[7], O[48], C[0], C[0]);
| O[130] = mad_mad0(C[0], O[214], O[75], C[0], C[0]);
| O[131] = mad_mad0(C[0], O[12], O[76], C[0], C[0]);
| O[46] = mad_mad0(C[0], C[0], O[77], C[0], C[5]);
| O[77] = mul(I[39], C[15]);
| O[49] = mul(I[39], C[13]);
| O[14] = mad_mad0(C[0], O[7], O[48], C[0], C[0]);
| O[47] = mad_mad0(C[0], O[214], O[75], C[0], C[0]);
| O[49] = mad_mad0(C[0], O[12], O[76], C[0], C[0]);
| O[48] = mad_mad0(C[0], C[0], O[77], C[0], C[5]);
| O[75] = mul_mad1(O[128], O[59], O[126], O[82]);
| O[76] = mul_mad1(O[128], O[60], O[126], O[40]);
| O[77] = mul_mad1(O[128], O[61], O[126], O[19]);
| O[128] = mul_mad1(O[128], C[0], O[126], C[0]);
| O[75] = mad_mad0(O[78], O[7], O[75], O[127], C[0]);
| O[76] = mad_mad0(O[78], O[214], O[76], O[127], C[0]);
| O[77] = mad_mad0(O[78], O[12], O[77], O[127], C[0]);
| O[78] = mad_mad0(O[78], C[0], O[128], O[127], C[5]);
| O[129] = mad(O[46], I[120], O[129]);
| outputdata_float(0, 86, R[0], O[129]);
| O[130] = add_mad1(O[130], C[0], O[46], I[121]);
| outputdata_float(0, 87, R[0], O[130]);
| O[131] = add_mad1(O[131], C[0], O[46], I[122]);
| outputdata_float(0, 88, R[0], O[131]);
| O[46] = mad(O[46], C[5], C[0]);
| outputdata_float(0, 89, R[0], O[46]);
| O[14] = mad(O[48], I[120], O[14]);
| outputdata_float(0, 90, R[0], O[14]);
| O[47] = add_mad1(O[47], C[0], O[48], I[121]);
| outputdata_float(0, 91, R[0], O[47]);
| O[49] = add_mad1(O[49], C[0], O[48], I[122]);
| outputdata_float(0, 92, R[0], O[49]);
| O[48] = mad(O[48], C[5], C[0]);
| outputdata_float(0, 93, R[0], O[48]);
| O[48] = mad(C[0], I[120], O[7]);
| outputdata_float(0, 94, R[0], O[48]);
| O[48] = add_mad1(O[214], C[0], C[0], I[121]);
| outputdata_float(0, 95, R[0], O[48]);
| O[48] = add_mad1(O[12], C[0], C[0], I[122]);
| outputdata_float(0, 96, R[0], O[48]);
| O[48] = mad(C[0], C[5], C[0]);
| outputdata_float(0, 97, R[0], O[48]);
| O[75] = mad(O[78], I[120], O[75]);
| outputdata_float(0, 98, R[0], O[75]);
| O[76] = add_mad1(O[76], C[0], O[78], I[121]);
| outputdata_float(0, 99, R[0], O[76]);
| O[77] = add_mad1(O[77], C[0], O[78], I[122]);
| outputdata_float(0, 100, R[0], O[77]);
| O[78] = mad(O[78], C[5], C[0]);
| outputdata_float(0, 101, R[0], O[78]);
| O[48] = neg(I[120]);
| O[49] = neg(I[121]);
| O[75] = mul_mad1(O[48], O[59], O[49], O[60]);
| O[47] = mul_mad1(O[48], O[82], O[49], O[40]);
| O[76] = mul_mad1(O[48], O[7], O[49], O[214]);
| O[77] = mul_mad1(O[48], C[0], O[49], C[0]);
| O[78] = neg(I[122]);
| O[75] = mad_add(O[78], O[61], O[75], C[0]);
| O[47] = mad_add(O[78], O[19], O[47], C[0]);
| O[76] = mad_add(O[78], O[12], O[76], C[0]);
| O[77] = mad_add(O[78], C[0], O[77], C[5]);
| O[131] = mul_mad1(O[59], C[13], O[82], C[14]);
| O[128] = mul_mad1(O[59], C[15], O[82], C[13]);
| O[46] = mul_mad1(O[60], C[13], O[40], C[14]);
| O[130] = mul_mad1(O[60], C[15], O[40], C[13]);
| O[14] = mul_mad1(O[61], C[13], O[19], C[14]);
| O[133] = mul_mad1(O[61], C[15], O[19], C[13]);
| O[132] = mul_mad1(O[75], C[13], O[47], C[14]);
| O[17] = mul_mad1(O[75], C[15], O[47], C[13]);
| O[47] = rcp(I[38]);
| O[122] = mul_mad1(O[131], O[47], O[128], C[0]);
| O[75] = rcp(I[39]);
| O[123] = mul_mad1(O[131], C[0], O[128], O[75]);
| O[129] = mul_mad1(O[131], C[0], O[128], C[0]);
| O[131] = mul_mad1(O[131], C[0], O[128], C[0]);
| O[124] = add_add(O[7], C[0], O[129]);
| O[125] = add_add(C[0], C[0], O[131]);
| O[126] = mul_mad1(O[46], O[47], O[130], C[0]);
| O[127] = mul_mad1(O[46], C[0], O[130], O[75]);
| O[131] = mul_mad1(O[46], C[0], O[130], C[0]);
| O[46] = mul_mad1(O[46], C[0], O[130], C[0]);
| O[128] = add_add(O[214], C[0], O[131]);
| O[129] = add_add(C[0], C[0], O[46]);
| O[130] = mul_mad1(O[14], O[47], O[133], C[0]);
| O[131] = mul_mad1(O[14], C[0], O[133], O[75]);
| O[46] = mul_mad1(O[14], C[0], O[133], C[0]);
| O[14] = mul_mad1(O[14], C[0], O[133], C[0]);
| O[46] = add_add(O[12], C[0], O[46]);
| O[14] = add_add(C[0], C[0], O[14]);
| O[47] = mul_mad1(O[132], O[47], O[17], C[0]);
| O[75] = mul_mad1(O[132], C[0], O[17], O[75]);
| O[133] = mul_mad1(O[132], C[0], O[17], C[0]);
| O[132] = mul_mad1(O[132], C[0], O[17], C[0]);
| O[76] = add_add(O[76], C[0], O[133]);
| O[77] = add_add(O[77], C[0], O[132]);
| O[122] = mad(O[125], C[16], O[122]);
| outputdata_float(0, 118, R[0], O[122]);
| O[123] = add_mad1(O[123], C[0], O[125], C[17]);
| outputdata_float(0, 119, R[0], O[123]);
| O[124] = add_mad1(O[124], C[0], O[125], C[17]);
| outputdata_float(0, 120, R[0], O[124]);
| O[125] = add(O[125], C[0]);
| outputdata_float(0, 121, R[0], O[125]);
| O[126] = mad(O[129], C[16], O[126]);
| outputdata_float(0, 122, R[0], O[126]);
| O[127] = add_mad1(O[127], C[0], O[129], C[17]);
| outputdata_float(0, 123, R[0], O[127]);
| O[128] = add_mad1(O[128], C[0], O[129], C[17]);
| outputdata_float(0, 124, R[0], O[128]);
| O[129] = add(O[129], C[0]);
| outputdata_float(0, 125, R[0], O[129]);
| O[130] = mad(O[14], C[16], O[130]);
| outputdata_float(0, 126, R[0], O[130]);
| O[131] = add_mad1(O[131], C[0], O[14], C[17]);
| outputdata_float(0, 127, R[0], O[131]);
| O[46] = add_mad1(O[46], C[0], O[14], C[17]);
| outputdata_float(0, 128, R[0], O[46]);
| O[14] = add(O[14], C[0]);
| outputdata_float(0, 129, R[0], O[14]);
| O[47] = mad(O[77], C[16], O[47]);
| outputdata_float(0, 14, R[0], I[13]);
| outputdata_float(0, 37, R[0], C[16]);
| outputdata_float(0, 130, R[0], O[47]);
| O[75] = add_mad1(O[75], C[0], O[77], C[17]);
| outputdata_float(0, 131, R[0], O[75]);
| O[76] = add_mad1(O[76], C[0], O[77], C[17]);
| outputdata_float(0, 15, R[0], I[14]);
| outputdata_float(0, 38, R[0], C[17]);
| outputdata_float(0, 132, R[0], O[76]);
| O[77] = add(O[77], C[0]);
| outputdata_float(0, 133, R[0], O[77]);
| O[76] = mul_mad1(O[48], O[59], O[49], O[60]);
| O[75] = mul_mad1(O[48], O[82], O[49], O[40]);
| O[77] = mul_mad1(O[48], O[7], O[49], O[214]);
| O[48] = mul_mad1(O[48], C[0], O[49], C[0]);
| O[76] = mad_add(O[78], O[61], O[76], C[0]);
| O[75] = mad_add(O[78], O[19], O[75], C[0]);
| O[77] = mad_add(O[78], O[12], O[77], C[0]);
| O[78] = mad_add(O[78], C[0], O[48], C[5]);
| O[48] = mul_mad1(O[59], C[13], O[82], C[14]);
| outputdata_float(0, 102, R[0], O[48]);
| O[48] = mul_mad1(O[59], C[15], O[82], C[13]);
| outputdata_float(0, 103, R[0], O[48]);
| O[48] = add(O[7], C[0]);
| outputdata_float(0, 104, R[0], O[48]);
| O[48] = add(C[0], C[0]);
| outputdata_float(0, 105, R[0], O[48]);
| O[48] = mul_mad1(O[60], C[13], O[40], C[14]);
| outputdata_float(0, 106, R[0], O[48]);
| O[48] = mul_mad1(O[60], C[15], O[40], C[13]);
| outputdata_float(0, 107, R[0], O[48]);
| O[48] = add(O[214], C[0]);
| outputdata_float(0, 108, R[0], O[48]);
| outputdata_float(0, 109, R[0], O[48]);
| O[48] = mul_mad1(O[61], C[13], O[19], C[14]);
| outputdata_float(0, 110, R[0], O[48]);
| O[48] = mul_mad1(O[61], C[15], O[19], C[13]);
| outputdata_float(0, 111, R[0], O[48]);
| O[48] = add(O[12], C[0]);
| outputdata_float(0, 112, R[0], O[48]);
| outputdata_float(0, 113, R[0], O[48]);
| O[48] = mul_mad1(O[76], C[13], O[75], C[14]);
| outputdata_float(0, 114, R[0], O[48]);
| O[76] = mul_mad1(O[76], C[15], O[75], C[13]);
| outputdata_float(0, 115, R[0], O[76]);
| outputdata_float(0, 116, R[0], O[77]);
| O[78] = add(O[78], C[0]);
| outputdata_float(0, 117, R[0], O[78]);
| O[47] = mad(C[0], I[120], O[59]);
| O[48] = add_mad1(O[60], C[0], C[0], I[121]);
| O[76] = add_mad1(O[61], C[0], C[0], I[122]);
| O[14] = mad(C[0], I[120], O[82]);
| O[49] = add_mad1(O[40], C[0], C[0], I[121]);
| O[75] = add_mad1(O[19], C[0], C[0], I[122]);
| O[78] = mad(C[0], I[120], O[7]);
| outputdata_float(0, 47, R[0], O[78]);
| O[78] = add_mad1(O[214], C[0], C[0], I[121]);
| outputdata_float(0, 48, R[0], O[78]);
| O[78] = add_mad1(O[12], C[0], C[0], I[122]);
| outputdata_float(0, 49, R[0], O[78]);
| O[78] = mad(C[0], C[5], C[0]);
| outputdata_float(0, 50, R[0], O[78]);
| O[77] = mul_mad1(C[13], O[47], C[14], O[14]);
| outputdata_float(0, 39, R[0], O[77]);
| O[77] = mul_mad1(C[13], O[48], C[14], O[49]);
| outputdata_float(0, 40, R[0], O[77]);
| O[77] = mul_mad1(C[13], O[76], C[14], O[75]);
| outputdata_float(0, 41, R[0], O[77]);
| O[77] = mad(C[0], C[5], C[0]);
| O[46] = mul_mad1(C[13], O[78], C[14], O[77]);
| outputdata_float(0, 12, R[0], I[11]);
| outputdata_float(0, 42, R[0], O[46]);
| outputdata_float(0, 13, R[0], I[12]);
| O[47] = mul_mad1(C[15], O[47], C[13], O[14]);
| outputdata_float(0, 43, R[0], O[47]);
| O[48] = mul_mad1(C[15], O[48], C[13], O[49]);
| outputdata_float(0, 44, R[0], O[48]);
| O[76] = mul_mad1(C[15], O[76], C[13], O[75]);
| outputdata_float(0, 45, R[0], O[76]);
| O[78] = mul_mad1(C[15], O[78], C[13], O[77]);
| outputdata_float(0, 11, R[0], I[10]);
| outputdata_float(0, 46, R[0], O[78]);
| outputdata_float(0, 75, R[0], I[120]);
| outputdata_float(0, 159, R[0], I[120]);
| O[78] = mad(C[5], I[120], C[0]);
| outputdata_float(0, 51, R[0], O[78]);
| O[78] = add_mad1(C[0], C[0], C[5], I[121]);
| outputdata_float(0, 52, R[0], O[78]);
| outputdata_float(0, 76, R[0], I[121]);
| outputdata_float(0, 160, R[0], I[121]);
| O[78] = add_mad1(C[0], C[0], C[5], I[122]);
| outputdata_float(0, 53, R[0], O[78]);
| outputdata_float(0, 77, R[0], I[122]);
| outputdata_float(0, 161, R[0], I[122]);
| O[78] = mad(C[5], C[5], C[0]);
| outputdata_float(0, 54, R[0], O[78]);
| external_func_call(O[59], O[60], O[61], C[0], O[82], O[40], O[19], C[0], O[7], O[214], O[12], C[0], C[0], C[0], C[0], C[5]O[75], O[76], O[77], O[78]);
| outputdata_float(0, 55, R[0], O[59]);
| outputdata_float(0, 56, R[0], O[60]);
| outputdata_float(0, 57, R[0], O[61]);
| outputdata_float(0, 59, R[0], O[82]);
| outputdata_float(0, 60, R[0], O[40]);
| outputdata_float(0, 61, R[0], O[19]);
| outputdata_float(0, 63, R[0], O[7]);
| outputdata_float(0, 64, R[0], O[214]);
| outputdata_float(0, 65, R[0], O[12]);
| outputdata_float(0, 71, R[0], O[75]);
| outputdata_float(0, 72, R[0], O[76]);
| outputdata_float(0, 73, R[0], O[77]);
| outputdata_float(0, 74, R[0], O[78]);
| outputdata_float(0, 78, R[0], O[82]);
| outputdata_float(0, 79, R[0], O[40]);
| outputdata_float(0, 80, R[0], O[19]);
| outputdata_float(0, 81, R[0], O[7]);
| outputdata_float(0, 82, R[0], O[214]);
| outputdata_float(0, 83, R[0], O[12]);
| outputdata_int32(0, 2, R[0], O[62]);
| O[62] = mul(C[11], I[38]);
| O[7] = add(I[38], O[62]);
| O[12] = mul(C[11], I[38]);
| O[19] = add(I[38], O[12]);
| outputdata_float(0, 84, R[0], I[38]);
| outputdata_float(0, 136, R[0], I[38]);
| O[214] = mul(C[12], I[39]);
| O[40] = add(I[39], O[214]);
| outputdata_float(0, 85, R[0], I[39]);
| outputdata_float(0, 137, R[0], I[39]);
| external_func_call(C[9], C[18], C[18], O[62], O[12], O[214], O[7], O[19], O[40]);
| outputdata_float(0, 16, R[0], I[15]);
| outputdata_int32(0, 3, R[0], C[18]);
| outputdata_int32(0, 37, R[0], C[18]);
| external_func_call(C[4], C[9], C[9], C[19]R[65535]);
| external_func_call(C[7], C[9], C[9], C[19]R[65535]);
| external_func_call(C[8], C[9], C[9], C[19]R[65535]);
| external_func_call(C[20], C[9], C[9], C[19]R[65535]);
| outputdata_float(0, 18, R[0], I[17]);
| external_func_call(C[21], C[9], C[9], C[19]R[65535]);
| outputdata_float(0, 19, R[0], I[18]);
| external_func_call(C[22], C[9], C[9], C[19]R[65535]);
| outputdata_float(0, 20, R[0], I[19]);
| external_func_call(C[23], C[9], C[9], C[19]R[65535]);
| outputdata_float(0, 17, R[0], I[16]);
| outputdata_float(0, 21, R[0], I[20]);
| O[214] = cmpeq_select(I[76], C[0], C[24], I[77]);
| outputdata_float(0, 22, R[0], I[21]);
| O[12] = add(C[2], I[79]);
| O[62] = div_f2i(O[12], O[214]);
| O[62] = maxi(O[62], C[3]);
| O[7] = i2f_mul(O[62], O[214]);
| O[12] = sub(O[12], O[7]);
| O[7] = addi(O[62], I[115]);
| outputdata_int32(0, 34, R[0], O[7]);
| O[7] = add(I[76], C[2]);
| outputdata_float(0, 179, R[0], O[7]);
| O[62] = cmpgti(O[62], C[3]);
| O[214] = select(O[62], O[214], O[214]);
| O[62] = select(O[62], O[12], O[12]);
| O[12] = div(O[62], O[214]);
| outputdata_float(0, 180, R[0], O[214]);
| outputdata_float(0, 183, R[0], O[12]);
| O[12] = clamp(I[119], C[0], C[6]);
| outputdata_float(0, 5, R[0], I[5]);
| outputdata_float(0, 184, R[0], O[12]);
| O[12] = cmpneqi(I[113], C[7]);
| O[12] = cmpnei_logic_and(I[113], C[8], O[12]);
| O[12] = cmpeqi_logic_and(O[228], C[3], O[12]);
| O[12] = cmplei_logic_and(I[114], O[228], O[12]);
| O[214] = cmpeqi(I[113], C[9]);
| O[214] = cmpeqi_logic_or(I[113], C[4], O[214]);
| O[214] = cmpeqi_logic_and(O[220], C[4], O[214]);
| O[214] = b2i(O[214]);
| O[214] = cmpeqi_select(O[214], C[3], O[220], C[9]);
| O[214] = select(O[12], O[214], I[113]);
| O[12] = select(O[12], O[228], I[114]);
| outputdata_int32(0, 38, R[0], O[220]);
| O[7] = cmpeqi(O[228], C[4]);
| outputdata_int32(0, 39, R[0], O[228]);
| O[220] = cmpnei_logic_and(O[220], C[3], O[7]);
| O[7] = cmpneqi(O[214], C[8]);
| O[7] = cmpnei_logic_and(O[214], C[7], O[7]);
| O[220] = logic_and(O[220], O[7]);
| O[220] = cmplei_logic_and(O[12], C[9], O[220]);
| O[214] = select(O[220], C[9], O[214]);
| O[12] = select(O[220], C[9], O[12]);
| O[220] = cmpneqi(O[12], C[3]);
| O[220] = cmpnei_logic_and(O[214], C[3], O[220]);
| O[220] = cmpeqi_logic_and(I[129], C[3], O[220]);
| outputdata_float(0, 8, R[0], O[9]);
| O[220] = cmplei_logic_and(O[12], C[7], O[220]);
| O[214] = select(O[220], C[7], O[214]);
| outputdata_int32(0, 32, R[0], O[214]);
| O[220] = select(O[220], C[7], O[12]);
| outputdata_float(0, 6, R[0], I[6]);
| outputdata_int32(0, 33, R[0], O[220]);
| O[220] = mul(I[124], C[2]);
| O[12] = mul(I[123], C[2]);
| O[12] = mul_mad1(O[220], O[220], O[12], O[12]);
| O[220] = mul(I[125], C[2]);
| O[220] = mad_sqrt(O[220], O[220], O[12]);
| outputdata_int32(0, 1, R[0], O[223]);
| O[220] = fmod_add(I[78], C[10], O[220]);
| outputdata_float(0, 181, R[0], O[220]);
| outputdata_float(0, 23, R[0], I[22]);
| O[220] = random(C[25]);
| O[223] = f2i_addi(O[220], C[26]);
| outputdata_float(0, 24, R[0], I[23]);
| outputdata_float(0, 1, R[0], I[1]);
| outputdata_float(0, 9, R[0], C[2]);
| O[220] = sub_neg(O[62], C[2]);
| outputdata_float(0, 185, R[0], O[220]);
| outputdata_float(0, 182, R[0], O[62]);
| O[62] = neg_cmplt(O[62], C[0]);
| O[220] = cmpge_logic_and(O[220], C[0], O[62]);
| O[62] = i2f_mul(O[223], I[126]);
| O[62] = max(O[62], C[5]);
| outputdata_float(0, 4, R[0], I[4]);
| outputdata_float(0, 70, R[0], C[5]);
| O[223] = cmpeqi_select(O[223], C[3], C[0], O[62]);
| outputdata_float(0, 58, R[0], C[0]);
| outputdata_float(0, 62, R[0], C[0]);
| outputdata_float(0, 66, R[0], C[0]);
| outputdata_float(0, 67, R[0], C[0]);
| outputdata_float(0, 68, R[0], C[0]);
| outputdata_float(0, 69, R[0], C[0]);
| outputdata_float(0, 158, R[0], O[176]);
| outputdata_float(0, 186, R[0], C[0]);
| O[220] = f2i_select1(O[220], O[223], C[3]);
| outputdata_int32(0, 17, R[0], O[171]);
| outputdata_int32(0, 35, R[0], O[220]);
| outputdata_int32(0, 36, R[0], C[3]);
| outputdata_float(0, 10, R[0], I[9]);
| outputdata_float(0, 25, R[0], I[24]);
| outputdata_float(0, 26, R[0], I[25]);
| outputdata_float(0, 27, R[0], I[26]);
| outputdata_float(0, 28, R[0], I[27]);
| outputdata_float(0, 29, R[0], I[28]);
| outputdata_float(0, 30, R[0], I[29]);
| outputdata_float(0, 31, R[0], I[30]);
| outputdata_float(0, 32, R[0], I[31]);
| outputdata_float(0, 33, R[0], I[32]);
| outputdata_float(0, 34, R[0], I[33]);
| outputdata_float(0, 35, R[0], I[34]);
| outputdata_float(0, 36, R[0], I[35]);
| outputdata_float(0, 134, R[0], I[36]);
| outputdata_float(0, 135, R[0], I[37]);
| outputdata_float(0, 138, R[0], I[40]);
| outputdata_float(0, 139, R[0], I[41]);
| outputdata_float(0, 140, R[0], I[42]);
| outputdata_float(0, 141, R[0], I[43]);
| outputdata_float(0, 142, R[0], I[44]);
| outputdata_float(0, 143, R[0], I[45]);
| outputdata_float(0, 144, R[0], I[46]);
| outputdata_float(0, 145, R[0], I[47]);
| outputdata_float(0, 146, R[0], I[48]);
| outputdata_float(0, 147, R[0], I[49]);
| outputdata_float(0, 148, R[0], I[50]);
| outputdata_float(0, 149, R[0], I[51]);
| outputdata_float(0, 150, R[0], I[52]);
| outputdata_float(0, 151, R[0], I[53]);
| outputdata_float(0, 152, R[0], I[54]);
| outputdata_float(0, 153, R[0], I[55]);
| outputdata_float(0, 155, R[0], I[57]);
| outputdata_float(0, 156, R[0], I[58]);
| outputdata_float(0, 157, R[0], I[59]);
| outputdata_float(0, 162, R[0], I[60]);
| outputdata_float(0, 164, R[0], I[61]);
| outputdata_float(0, 165, R[0], I[62]);
| outputdata_float(0, 166, R[0], I[63]);
| outputdata_float(0, 167, R[0], I[64]);
| outputdata_float(0, 168, R[0], I[65]);
| outputdata_float(0, 169, R[0], I[66]);
| outputdata_float(0, 170, R[0], I[67]);
| outputdata_float(0, 171, R[0], I[68]);
| outputdata_float(0, 172, R[0], I[69]);
| outputdata_float(0, 173, R[0], I[70]);
| outputdata_float(0, 174, R[0], I[71]);
| outputdata_float(0, 175, R[0], I[72]);
| outputdata_float(0, 176, R[0], I[73]);
| outputdata_float(0, 177, R[0], I[74]);
| outputdata_float(0, 178, R[0], I[75]);
| outputdata_int32(0, 0, R[0], C[27]);
| outputdata_int32(0, 4, R[0], I[85]);
| outputdata_int32(0, 5, R[0], I[86]);
| outputdata_int32(0, 6, R[0], I[87]);
| outputdata_int32(0, 7, R[0], I[88]);
| outputdata_int32(0, 8, R[0], I[89]);
| outputdata_int32(0, 9, R[0], I[90]);
| outputdata_int32(0, 10, R[0], I[91]);
| outputdata_int32(0, 11, R[0], I[92]);
| outputdata_int32(0, 12, R[0], I[93]);
| outputdata_int32(0, 13, R[0], I[94]);
| outputdata_int32(0, 14, R[0], I[95]);
| outputdata_int32(0, 15, R[0], I[96]);
| outputdata_int32(0, 16, R[0], I[97]);
| outputdata_int32(0, 18, R[0], I[99]);
| outputdata_int32(0, 19, R[0], I[100]);
| outputdata_int32(0, 20, R[0], I[101]);
| outputdata_int32(0, 21, R[0], I[102]);
| outputdata_int32(0, 22, R[0], I[103]);
| outputdata_int32(0, 23, R[0], I[104]);
| outputdata_int32(0, 24, R[0], I[105]);
| outputdata_int32(0, 25, R[0], I[106]);
| outputdata_int32(0, 26, R[0], I[107]);
| outputdata_int32(0, 27, R[0], I[108]);
| outputdata_int32(0, 28, R[0], I[109]);
| outputdata_int32(0, 29, R[0], I[110]);
| outputdata_int32(0, 30, R[0], I[111]);
| outputdata_int32(0, 31, R[0], I[112]);
BåÄ-û;-m3
\è^ñzË¿LÇc;
©ï“;ôO∫‡£]Òµ€
øLìr£;
;π„ö¯ü)@¥
ÇÖ∏ŒKr¶Líõ;
U;⁄Gâ4•‚¢
Z;ÍêK’Gô¥æNp
zŸ;#B∂õk
N;~5]Jî+∂ãŒ-˚v
npOÄ£k;•åUÁ
“;>B•Xv¯}ÚˆãM
JÀN§‹—~C¥·;œP≤qµ
©k;ãª≠
¡É*ûóˆ•Ä.;ƒ—
i†¥Më;


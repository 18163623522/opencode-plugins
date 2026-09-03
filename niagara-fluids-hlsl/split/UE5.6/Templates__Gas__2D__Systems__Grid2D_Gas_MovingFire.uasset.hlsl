ı˛ˇˇÙ˛ˇˇ;
;™HÊe5/Ÿ¿ÔMhÇä
∑ÿU‘d)Êπ;KVê6¡Ö^X
W;c7ó(œC]=≠‡P
"ò‹1=Ö=§&U¿;HŒEaiu
3‹gﬁ˘u;Dê
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
@?∂m;?m€6?$I2?
$ËMÎÖ;œNÄhy^õY{€H
Üb;DûîûÑ£F…÷H
?¡ÛÏ2x'CØº;&òj
>^Rª;¯
ﬂ\ŸEû;˝¬
.;óÚ€ré®äe˛8
ôÎj_ïqÉNªgq;Ω>
J;˜|I+¢I∞ô°
!œ:Ñßy+xÑÍ;z
\)ê;˚ÔÜ‚3”Zo
Z|agO}ï3ävS¶hLs;ùˆ9H
k3«i¶;_Û
≤ˇ£]Ï;l…X‡œG0H
npOÄ£k;•åUÁ∏
{â∏L;T~9n∑Ä
[m≤9NôÊ!D>;€ﬁ
HM_À[≤ïzıΩ;VP
â4;  H
;A±ÀŒ|aﬁ_^6
ÿ;ÄΩfYY˙F‚ïPntE9
LÄçô’Gã—ˇ;\
K∫ßK¥ˇ‘47ö˙õå);¶E∑
˝˚Jºt;‚÷
„Öaï∫¢∏K™ëU;ç√
3∑Ë;qLµ
;á≤¢–C¢û»(®M
˘<[lLØPs;Tb¶oH
À‚})H¶¶ÖbÁ…;˝H
m}øI/ëáFü†°;Ù'2™H
ÖÎ7∂°;DCøU4Ôpã£8
¥FOÑ@;(Öfï
ÀÙnÓJ†;”
Fó\ã`Ò;WØ
w;º,Jë
.Ë⁄‚<ò;
.;@ëØ˙Oô»
XÚ;ÿO£[ Ÿ$^ëH=
XÚ;ÿO£[ Ÿ$^ëH9
;¢¶/âH™K≤
Mœ?rr;ƒKß≠Í∑
BåÄ-û;-m3â
åZoùÖKàä;X¸"å®à
/PƒBç[õ7;Fp£F
/PƒBç[õ7;Fp£9
XÚ;ÿO£[ Ÿ$^ëHT
/PƒBç[õ7;Fp£]
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
M;L√Hå´A¢Ñû"V¥-xC
êŸ]Ê¥HzI¶ä;ç
VC_Force = float2(0,0);
float grad_curl_length = length(grad_curl);
  VC_Force = vorticity * dx * grad_curl / grad_curl_length;
Hì7-ë;ﬂ
¥ã;H´?Çê2¶§˜Ü
¥ã;H´?Çê2¶§˜'
÷ÍPg;/)Dûg
;^’OÇfÁÓçw+r
£;n4‰EfC∞Ì
W`Äd˘å°B≥t¥÷;ƒk|C
¶o$Dó8?"&;e
;≠éO™ødOÜÁ
;3ÜKê/ª[lÖjü
;3ÜKê/ª[lÖjH
cuAä7ÓTx;97C
 V™¥Ä≥jOò
∆;|óºL¨î¢†∞%µ?®
∆;|óºL¨î¢†∞%µ?&
;äB%ΩáUD±
∆;|óºL¨î¢†∞%µ?
Ë"t;Cü
≤‰≤Tè8;E∫ùT&êó){H
"$ƒÏkUXIóäÛ;o∫Àƒ
J±„}SÁ;ﬁÎ
T]G`—⁄;Fèe•ˆœŒÍ‹C
™;ïu£¥(EëÛ˜áù
g`ä;ÅKπ
åZoùÖKàä;X¸"å®¯
Pª÷;ıãıMè
\ò¿Mã·xºg;ˆ¶w
G°‰Ì';
Gæ≤]Ú;ÏÁ.‘
Gæ≤]Ú;ÏÁ.“
ÕÕÌÿN í‚—m„Ü Ã˘;
=≥È˘≠;úF¶˘Ñ˛
;ÒJåBB
;F••¯pa∆+
∆√œŒNæ&;ΩH#˘u‡
˘<[lLØPs;Tb¶os
À‚})H¶¶ÖbÁ…;˝t
;Ké˚å5ôAö
¸¥gq‘ÚôOí;
y¬ƒ;√Ò
'¨BÅ:;¯
ËM” ?∫∞JÖLË7§;(∂H
Fó\ã`Ò;WØÈ
Fó\ã`Ò;WØ9
F≥∞M‡â“1w;
  z·8Cµ∑
ª˚\∫;∑ﬂB°àÈ…Àr
˙nzú;%
;3ÜKê/ª[lÖj
∆;|óºL¨î¢†∞%µ?+
Gæ≤]Ú;ÏÁ.F
Fó\ã`Ò;WØ[
;Á£dDü3Ò±
µÑ;:èCó»
ùõ)iâ;AÑv‚Rûú˙¸‡
;˘-∞iC®Vœ‰ëI
e´äõ6Ô‹EÇFVØÊ;’\C
àÁŸ…;ÈD≥
*M† `;
M†báêå;†8å
M†báêå;†8¨
;Õ6\™’rBπ•
[ê;$ÿÙ¡GèkÄuÙûÑm
i—|R;@õ…ÈΩ$Ù=(í
i—|R;@õ…ÈΩ$Ù=(9
·[]I•©ı;¯ﬂJ^ï
·[]I•©ı;¯ﬂJ^9
Ω(∑häAµ;ÜµNÓ‚¸ó
Ω(∑häAµ;ÜµNÓ‚¸(
DªÉ`;!»(à
;p∞˝Ô∆
M†báêå;†8§
Iôè3ˇP;lºC
i—|R;@õ…ÈΩ$Ù=(™
&jkMìh›L"–Ú;¨
·[]I•©ı;¯ﬂJ^∞
«[];EA≥
«[];EA†
B?F;sa⁄A¢
Ω(∑häAµ;ÜµNÓ‚¸∑
=k;Nªx
{•QëÚÜúLù";∂é3¶
∂ÙµO≥;3Yx‘(ÇC
Oæv8;fnz†A
Oá-Òº;?ì≤Ó
Oá-Òº;?ì≤5
I≠;GñmOº|:•gÔ
I≠;GñmOº|:•g5
;&Ω5˙Û
;&Ω5˙5
;µCHÛ;
·cT˜11 Gì#ÃCw;©W
˝Å+;>D»KëîÂ
∞À;ºO∑
ïô—j•;E´°Úa÷$Ω>A
Näøû—;ù≈Ô
Näøû—;ù≈Ô5
;ñJªãGâ›K°,ïîX
v;P@Äﬁ√
O≠ø¯˙;
˙ﬂ8áFÚ^JÖ=û;@
5?fXPEΩ~;
júXêL±•=;
ÏfVÉÛ˘;L¨pqÓ\∞ﬁ
lâOö;™Ù(§+∫
w\ Kâ⁄"ü;Eß˛
Oá-Òº;?ì≤d
I≠;GñmOº|:•ge
;&Ω5˙i
Näøû—;ù≈ÔÑ
∞bI≤ ;jMìsπO
G∂;PÅûË©H
jK´É˚VL;’⁄Ã
jK´É˚VL;’⁄=
õ∏ä;ΩNhLì„OY˘
jK´É˚VL;’⁄Õ
~æ£O;ˆ∑B∞ÿqvK≤âmC
çô;<zŒ@É"ô:Ç¡y{C
◊œ-%ïlTE∏;}
≤≥º];EÌ@≤fÇ
jK´É˚VL;’⁄„
jK´É˚VL;’⁄‰
;ô^Ã[ÅC¨à¿6
9,ÁÀ¿IIKßÍ;ˇ
;®√„¡Bî∂(ﬂ…
E®;fVynÔ∫A
–œÌ(;8fGô!vk\>
npOÄ£k;•åUÁ¢
î¨•±{Ü@@úÀ˛N;¶
q‘ı;EûuCdﬁ&5
q‘ı;EûuCdﬁ&5›H
ø@ô-‘…˙C™;DŒJQ
÷K´;pü0
SÍ;A®t
å®;®HÛ¸GáìW-c
'QD¥m;,°
¸â{éòEæ°Éæ{;yLæ
¸â{éòEæ°Éæ{;yLH
óÖ–;å1gBú
q‘ı;EûuCdﬁ&5›À
Oá-Òº;?ì≤
 Jí‰˚‡i¥ïrA
⁄>ùJ!∂;IÅ
I≠;GñmOº|:•g
˝cñL;g°^b'
°Ehñ;q¢
°Ehñ;q
˝2˚ëüúÜ@âÇÏE˘⁄&;ƒ/ãp:!^A©˘®
l@ùÙ;Ä
°™O±ñ9ö;Œ
˝2˚ëüúÜ@âÇÏE˘⁄&;
ZLı;~¯Ë
ZLı;~¯
·cT˜11 Gì#ÃCw;©WÎ
êÙX;‹–#N¶
;ñJªãGâ›K°,ïîX¸
”V;ñ8A
p5%Iü;´êOöÕ2H
˙ﬁ]¢;;Oã¬Áº
y;iDÉ12
Î˙"ñ∂û#B∏-r#;5≤‡
oﬂ˙ëgÚÈG£Ëa;
Â;ÔuJ¢ˇ
NèÎ<#i∑;±
NèÎ<#i∑;±H
jTjj⁄0¸I¥;[Ñ/˙&„
ÁFû8È\ê“,[;[
L;A£Eü»mV°kH
…;ÄMã3v&Ê'
m;4S:Hßöu≠
 FD±¡Oπ∂
’N™˛'WØ';ÃC
àÜU!;Ç"O∏m∫yÅ
è?˚;Dù¢
è?˚;Dù
q{¢|œÙ;Iè|ä
 Vmu’]¸C¶ﬂ=«7‡?˝
zÎ8(ƒ1ØB¶‰;<n‡÷
q;x¬jÀGC†D?¿
Ç;·@åAï>?dûÚH
-LØ…;Ó¡a
ÍZ;çÑH
ÖÎ7∂°;DCøU4Ôpã£89
©;Øõ|{)A°b)ìÈ=≥H:
©;Øõ|{)A°b)ìÈ=≥HH
A¨$xπixBò°'å≤¨)œ;
ˆ˚#EçNØ€;–
p√Op◊;[Iöä
Ì[y6LòÓDÆä¡;lÊd"?
Ì[y6LòÓDÆä¡;lÊd"Ô
“;>u\±J£›“
å¸…ıH;áHå
@6á|èh’Kö≠D!O¢†f{“Í…Rƒ8Fó‡'†N;º
{“Í…Rƒ8Fó‡'†N;º◊
Úz;ë ≤F´PÀ≈:~4ë¢
åÚz;ë ≤F´PÀ≈:~4ë
Än;∆PnõN¨#l5.¢áëM
Än;∆PnõN¨#l5.¢áë
Y;€XW€'Kõj©fM%~≥N
Y;€XW€'Kõj©fM%~≥
BJ∑'-k;//ª
∑ÏÄE´;fØ”⁄_
yò@©º;å0
∑ÏÄE´;fØ”⁄_Ÿ
vCûÏÂê]?Å†lxﬁ”;
¡†æ®∞A;N£
;0¨†Gµ
I¢8;§y‹D∂
lâOö;™Ù(§+∫b
èG¶v??;
ø@Õ;˝7L©≥ııg‘tô
M¨;BßBv,=C
=BûVFè[:;°u
i;®Û¨O
=BûVFè[:;°
n˝∑:c¿”Nû“∆—;^TÖq
n˝∑:c¿”Nû“∆—;^TÖ§
'dM©’fï;Å9Ÿt
'dM©’fï;Å9Ÿ„
Tèﬁ;Iä
9∏y¸8ÛLÅ`Ì;©ÎB
∂F≤gj;ãvòq
˛ΩOïãÕÃˆ‚;“
<G;•Îˆ
ŸF//îı¢
ŸF//îı
ÌÏñJñ‹.M´;úÓs
ó;è(Œ⁄GÑ
Êb`Ö?6ÑHí;X/
„;\UÁwœFπ
;Hà˛ËÒ
Fì∂≠X∂û;±¢
J±„}SÁ;ﬁÎû
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
;HßñÆ/L7Îi≥
;HßñÆ/L7ÎiH
põ;/ H}IîòrL
"$ƒÏkUXIóäÛ;o∫À
â;Lûn≤º+6.!C
v‰êPÑÑPGñ;‹c4ÚT“H
#Üs;‡¯
ü√l£NÏ›MÖjÏˇ;¨
¡⁄;*QÛíKì˚
îO6Cõ;1^
≥ãŒV;`3eNÇ
ãŒV;`3eNÇ
ßh2ƒ6;+ù„ADæY
Ä%;Wfi‚H¢l
ƒ6;+ù„ADæY
¸â{éòEæ°Éæ{;yLÿ
q‘ı;EûuCdﬁ&5›Î
q‘ı;EûuCdﬁ&5›ˇ
;ñJªãGâ›K°,ïîX-
2ÊÂä’;
NèÎ<#i∑;±<
ÖÎ7∂°;DCøU4Ôpã£8k
©;Øõ|{)A°b)ìÈ=≥Hl
Ó_ﬂ;?ç
N≤j;ëz'¨©s
N≤j;ëz'¨©
Ì[y6LòÓDÆä¡;lÊd"v
Än;∆PnõN¨#l5.¢áëÑ
Y;€XW€'Kõj©fM%~≥Ö
lâOö;™Ù(§+∫ô
n˝∑:c¿”Nû“∆—;^TÖ®
'dM©’fï;Å9
∫t*§ó Ò;;…AîÄ∫g/
ƒsıÜ≥ú˜@∏çü´û9;.º
ƒsıÜ≥ú˜@∏çü´û9;.
§ó Ò;;…AîÄ∫g/
J±„}SÁ;ﬁÎŸ
;HßñÆ/L7ÎiÓ
"$ƒÏkUXIóäÛ;o∫Àƒˆ
˙Ωê≤N≠;»‘¸LØîz
Nalñ;sãmI◊«xLÇÊÿ
˙Ωê≤N≠;»‘¸LØî
;^’OÇfÁÓçw+r$
;^’OÇfÁÓçw+rÉ
f;:ú|äF≤
 YS"ísÇO∞˛@YV…A+C
Dô«;ı+0/>
0ÖûÊ;S{Aâí1QJ
WKé∏u;÷Q“"2
WKé∏u;÷Q“"
Ó2Oåt2ÿ}ñ†ÿ;
ÕF´∏•;‰aÚ∞
ä±ËdàAÌNá"Æyîá9ƒ;
··Nª;2MÆ¥ù
äGÉ¯æ ;yˇ]
¨;EHª≥ì·a!
æU∞BÌ1YGâ;≠N8-
ÍJõP≠;•Bñ÷9(π]-¡G
ÍJõP≠;•Bñ÷9(π]-¡
mß;J\H$D†˙%åÚtF
≥pπ;ÏO
;{oûLª«A¶å
GM7˜›ÃvF∑;øO˜ïÉÏ
 Vmu’]¸C¶ﬂ=«7‡?˝T
 Vmu’]¸C¶ﬂ=«7‡?˝◊
 BØ˘ÜˆIå7JW]Fiù
8;ÏéEø"Y<
IïòŒkñÅD£>Óg$D];
Á°;·◊ﬁHK∂6
|ÓΩ‰;]
|ÓΩ‰;˜
˛nO‘D©r≤‡k6o;
/PƒBç[õ7;Fp£
Î˙"ñ∂û#B∏-r#;5≤‡a
w\ Kâ⁄"ü;Eß˛f
w\ Kâ⁄"ü;Eß˛
˙ˆ”@Ω;∂lI,;U
Gänf*≥¯FôÖ;L
5¸òC];H©
o?™;ªªl
o?™;ªª
Rm&;@µ,Õp€Ljêq
Rm&;@µ,Õp€Ljê∂
•1{ÈDµ’h=+˜;öC
Ôâ^öŸr;AüÊ“rÕO
XÚ;ÿO£[ Ÿ$^ëH
ø@Õ;˝7L©≥ııg‘tôy
ø@Õ;˝7L©≥ııg‘tô˙
n˝∑:c¿”Nû“∆—;^TÖ
'dM©’fï;Å9Ÿ
π,;XU∑µL¨DTÿ6¶·
 frëD<€D¨Òy*·{K
Ì[y6LòÓDÆä¡;lÊd"
jTjj⁄0¸I¥;[Ñ/˙&„É
jTjj⁄0¸I¥;[Ñ/˙&„s
∂F≤gj;ãvòqÉ
∂F≤gj;ãvòqu
BFiÛ;K≤Fô!
UŸOò$K`;LÂ6á
UŸOò$K`;LÂ6
˛ΩOïãÕÃˆ‚;
N88w∆UB≤™^Ω´Œ;
w˘M; }˝Oï$
üE;*óî
üE;*ó[
&D∞BÈx≥;Ë‹
BJ∑'-k;//ªñ
BJ∑'-k;//ªÀ
WKé∏u;÷Q“"ú
;^’OÇfÁÓçw+rü
ÍJõP≠;•Bñ÷9(π]-¡¿
≥pπ;Ï»
 Vmu’]¸C¶ﬂ=«7‡?˝Õ
|ÓΩ‰;÷
Î˙"ñ∂û#B∏-r#;5≤‡⁄
w\ Kâ⁄"ü;Eß˛ﬂ
o?™;ªªÂ
Rm&;@µ,Õp€LjêÍ
ø@Õ;˝7L©≥ııg‘tôÚ
jTjj⁄0¸I¥;[Ñ/˙&„¸
∂F≤gj;ãvòq¸
¿,;‡ìe√Fõ
·[]I•©ı;¯ﬂJ^
å5ò≤L°ïπ˜o≠;
[ê;$ÿÙ¡GèkÄuÙûÑm'
[ê;$ÿÙ¡GèkÄuÙûÑma
¬;Hò™]B7≈xc
M†báêå;†8
i—|R;@õ…ÈΩ$Ù=(
ÈBôC7¿˙b…;
  ;nmC\EÉô{ß`%Ñû
&jkMìh›L"–Ú;
CµI3H;≤M.
[ê;$ÿÙ¡GèkÄuÙûÑm8
X=AÅÁU»nZzØ;
ÑHAµoÿ‹^à⁄<;
ò<È'lJâ;ÖIÓn“&
ç∏®-;ë
çti•”Y%K§˚@*“Ú`2;
<õ;vHMUË–N™
ö˙õå);¶E∑
Bà;r‚=µç¶·
Bà;r‚=µç¶M
 T∏vFH
úSQ&;H
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
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform001_WorldToUnit;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_UnitToWorld;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_LocalToWorldRotation;
float3 Emitter_fluids_lighting_environmentDirection;
float Emitter_ShadowDensityMult;
float3 Emitter_fluids_lighting_sunDirection;
float Emitter_fluids_solver_dissipationTemperature;
float3 Emitter_ComputeOwnerMotion_Acceleration;
float Emitter_fluids_solver_dissipationDensity;
float3 Emitter_g;
int Emitter_SimGrid_TemperatureIndex;
float2 Emitter_SimGrid_Velocity;
int Emitter_SimGrid_DensityIndex;
int Emitter_PressureGrid_PressureIndex;
float Emitter_SimGrid_Density;
float Emitter_SimGrid_Temperature;
float Emitter_SimGrid_Boundary;
float Emitter_dt;
float Emitter_dx;
bool Emitter_SourceIsLocalSpace;
float Emitter_SourceCore;
float Emitter_SourceDensityMult;
float Emitter_SourceFalloff;
int Emitter_SourceMaxStreakSamples;
float Emitter_RadiusScale;
float Emitter_SourceStreakDensity;
float Emitter_SourceTemperatureMult;
float Emitter_SourceVelocityMult;
int Emitter_SimGrid_SimFloatIndex;
float Emitter_fluids_solver_vorticityConfinement;
float Emitter_fluids_solver_densityBouyancy;
float Emitter_fluids_solver_temperatureBouyancy;
int Emitter_SimGrid_VelocityIndex;
float Emitter_fluids_solver_velocityDissipation;
int Emitter_SimGrid_SolidVelocityIndex;
float Emitter_fluids_solver_pressureRelaxation;
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
bool Execute;
bool UseSolidVelocity;
float Div;
float dt;
bool UseFFT;
float Value;
float2 PressureGradient;
int SolidVelocityIndex;
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
float4x4 PreviousWorldToUnit;
float4x4 WorldToUnit;
float Relaxation;
float3 OwnerMotionAcceleration;
float Blue;
bool Enabled;
float Green;
float Red;
float Core;
float DensityMult;
float Falloff;
int MaxStreakSamples;
float RadiusScale;
bool ScaleEmissionByDt;
bool SourceIsLocalSpace;
float StreakDensity;
float TemperatureMult;
bool UseColor;
bool UseStreaking;
float VelocityMult;
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
float3 Acceleration;
FParamMap0_Emitter_ComputeOwnerMotion ComputeOwnerMotion;
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
FParamMap0_Emitter_Grid2D_CreateUnitToWorldTransform001 Grid2D_CreateUnitToWorldTransform001;
FParamMap0_Emitter_PressureGrid PressureGrid;
int PressureGrid_PressureIndex;
float ShadowDensityMult;
FParamMap0_Emitter_SimGrid SimGrid;
int SimGrid_DensityIndex;
int SimGrid_SimFloatIndex;
int SimGrid_SolidVelocityIndex;
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
bool UseGBufferVelocity;
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
FParamMap0_Grid2D_OwnerMotionForce Grid2D_OwnerMotionForce;
FParamMap0_Grid2D_PressureIteration Grid2D_PressureIteration;
FParamMap0_Grid2D_ResampleFromOwnerMotion Grid2D_ResampleFromOwnerMotion;
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
void GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(int In_IndexX, int In_IndexY, out float2 Out_Value);
void GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(int In_IndexX, int In_IndexY, out float Out_Value);
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
void CustomHlsl25EDC993477AFBC2DE5F27B448B27AA5Emitter_SourceGrid_Func_(float2 In_ParticleCenterFloatIndex, float3 In_ParticlePos, float3 In_ParticleVel, float In_ParticleDensity, float In_ParticleTemperature, float In_Radius, float4 In_ParticleColor, int In_ParticleRadiusIndex, float In_VelocityMult, float In_DensityMult, float In_TemperatureMult, float In_Falloff, float In_Core, float In_RadiusScale, int In_NumCellsX, int In_NumCellsY, float In_dx, int In_MaxStreakSamples, float In_StreakDensity, bool In_UseStreaking, float In_dt, float4x4 In_WorldToLocal, bool In_UseColor, inout FSimulationContext Context);
void Grid2D_Gas_ParticleScatterSource001_Emitter_Func_(inout FSimulationContext Context);
void GetPositionByIndex_Emitter_ParticleSource_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void NiagaraScript_831_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void NiagaraScript_830_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocity(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radius(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_density(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperature(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void Grid2D_Gas_ParticleScatterSource_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl673BB53B4107160B5025A782D355320A_Func_(float4x4 In_WorldToUnit, float4x4 In_PreviousWorldToUnit, float In_OwnerMotionFraction, out float4x4 Out_OutMatrix);
void ExecutionIndexToUnit_Emitter_SimGrid(out float2 Out_Unit);
void SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocity(float2 In_Unit, out float2 Out_Value);
void SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperature(float2 In_Unit, out float Out_Value);
void SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensity(float2 In_Unit, out float Out_Value);
void Grid2D_ResampleFromOwnerMotion_Emitter_Func_(inout FSimulationContext Context);
void UnitToSimulation_Emitter_SimGrid(float3 In_Unit, float4x4 In_UnitToSimulationTransform, out float3 Out_Simulation);
void QuerySceneDepthGPU_Emitter_CollisionQuery(float3 In_DepthSamplePosWorld, out float Out_SceneDepth, out float3 Out_CameraPosWorld, out bool Out_IsInsideView, out float3 Out_SamplePosWorld, out float3 Out_SampleWorldNormal);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_(int In_IndexX, int In_IndexY, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, out float Out_Boundary);
void ComputeBoundaryGrid2D_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SourceGrid(out int Out_IndexX, out int Out_IndexY);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensity(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperature(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocity(int In_IndexX, int In_IndexY, out float2 Out_Value);
void ScratchModule001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_32_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void CustomHlsl81F4FE1D4EF3CE7337D446B210754B64_Func_(float2 In_TmpVelocity, float2 In_Velocity, out float2 Out_V);
void ScratchDynamicInput001_Emitter_Func_(out float2 Out_Output, inout FSimulationContext Context);
void ScratchDynamicInput002_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_TemporaryGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_ScalarIndex, out float2 Out_Grad);
void Grid2D_ComputeGradient001_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_(float In_dx, float2 In_GradCurl, float In_VorticityMult, out float2 Out_VC_Force);
void VorticityConfinementForceGrid2D_Emitter_Func_(inout FSimulationContext Context);
void Multiply_Float001_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void Multiply_Float008_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_(float In_DensityBuoyancy, float In_SimGrid_Density, float In_TemperatureBuoyancy, float In_SimGrid_Temperature, float3 In_g, out float3 Out_Force);
void Grid2D_Gas_3DBuoyancy_Emitter_Func_(inout FSimulationContext Context);
void TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_(float In_NoiseIntensity, float In_NoiseScale, float3 In_CellPos, float In_Time, out float2 Out_TurbulenceForce);
void Grid2D_TurbulenceForce_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_799_Particle_Func_(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void WindForce5644C4204BEF67FC22121D96EC483B74_Func_(float3 In_CellPos, float3 In_WDirection, float In_dx, float In_WSpeed, out float2 Out_WindForce2D);
void Grid2D_WindForce_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_OwnerMotionForce_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_IntegrateForces_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_(inout FSimulationContext Context);
void LinearToIndex_Emitter_SimGrid(int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, out float3 Out_Unit);
void CubicSamplePreviousGridAtIndex_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void SamplePreviousGridAtIndex_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(int In_VelocityIndex, int In_ScalarIndex, float In_dx, float In_dt, int In_IndexX, int In_IndexY, float In_AdvectionVelocityMult, int In_InterpolationMethod, out float Out_AdvectedScalar);
void Grid2D_AdvectScalar_Emitter_Func_(inout FSimulationContext Context);
void Add_Integer001_Emitter_Func_(out int Out_NewOutput, inout FSimulationContext Context);
void Grid2D_AdvectScalar001_Emitter_Func_(inout FSimulationContext Context);
void BreakVector2D_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_820_Func_(float In_dt, float In_DissipationRate, float2 In_Vector2DValue, out float2 Out_DissipatedVector2D, inout FSimulationContext Context);
void DissipateVector2D_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl6D9C04374BA54A1D4428A98E4601D086_Func_(float In_B_center, out bool Out_IsBoundary);
void ScratchModule_06_Emitter_Func_(inout FSimulationContext Context);
void CopyPreviousToCurrentForCell_Emitter_SimGrid_UEImpureCall(int In_IndexX, int In_IndexY);
void CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_VectorIndex, out float Out_Div);
void Grid2D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, float In_Value);
void ScratchModule_04_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_IndexX, int In_IndexY, float In_Value);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, out float Out_Value);
void GetDivergence_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl465A8EC34A516BDE6B19F18B39DC67C2_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void NiagaraScript_827_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void GetFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_(int In_IndexX, int In_IndexY, out float Out_P_right, out float Out_P_left, out float Out_P_up, out float Out_P_down);
void GetFloatValue_Emitter_SimGrid_AttributeBoundary(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_(int In_IndexX, int In_IndexY, out float Out_B_right, out float Out_B_left, out float Out_B_up, out float Out_B_down);
void CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_(float In_dx, float In_dt, float In_density, int In_IndexX, int In_IndexY, float In_Divergence, float2 In_Velocity, int In_IterationIndex, float In_Relaxation, float In_P_center, float In_B_center, float In_P_right, float In_P_left, float In_P_up, float In_P_down, float In_B_right, float In_B_left, float In_B_up, float In_B_down, float In_SV_x_right, float In_SV_x_left, float In_SV_y_up, float In_SV_y_down, out float Out_Pressure);
void Grid2D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, out float Out_Value);
void GetGroupID2704B67B4073AF1256539E9A763D1533_Func_(out int Out_GroupID, out int Out_GroupThreadID);
void GetNumCells_Emitter_PressureGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(float In_GridSpaceDX, bool In_bIsInverse, bool In_bTransformX, int In_ScanlineIdx, int In_ThreadIdx, float In_Pi, bool In_bPoissonSolver, inout FSimulationContext Context);
void Grid2D_ComputeFFT_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT001_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT002_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT003_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_ScalarIndex, out float2 Out_Grad);
void Grid2D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_(float2 In_Velocity, int In_IndexX, int In_IndexY, float In_B_center, float In_SV_x_center, float In_SV_y_center, float In_SV_x_right, float In_SV_x_left, float In_SV_y_up, float In_SV_y_down, out float2 Out_VelocityOut);
void ProjectPressureGrid2D_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_AdvectScalar002_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_AdvectScalar003_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_815_Func_(float In_dt, float In_DissipationRate, float In_SubtractionAmount, float In_FloatValue, out float Out_DissipatedFloat, inout FSimulationContext Context);
void DissipateFloat_Emitter_Func_(inout FSimulationContext Context);
void DissipateFloat001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_(float In_Density, float In_Boundary, out float Out_Output);
void MaskFloatByBoundary_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void MaskFloatByBoundary001_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_(float In_dx, int In_VectorIndex, int In_IndexX, int In_IndexY, out float Out_curl);
void Grid2D_ComputeCurl_Emitter_Func_(inout FSimulationContext Context);
void ScratchModule_02001_Emitter_Func_(inout FSimulationContext Context);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, float4 In_Value);
void Grid2D_Gas_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_LightingGridDownsample(out float2 Out_Unit);
void SampleGrid_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void GetNumCells_Emitter_LightingGridDownsample(out int Out_NumCellsX, out int Out_NumCellsY);
void UnitToIndex_Emitter_LightingGridDownsample(float2 In_Unit, out int Out_IndexX, out int Out_IndexY);
void SetGridValue_Emitter_LightingGridDownsample(int In_IndexX, int In_IndexY, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void DownsampleSimGrid19C51F204EDB6C68C8426CA765CB7155Emitter_SimGridEmitter_LightingGridDownsample_Func_(float2 In_UnitCoordinates, int In_HighResAttribute, int In_LowResAttribute, inout FSimulationContext Context);
void Grid2D_DownsampleScalar_Emitter_Func_(inout FSimulationContext Context);
void GetViewSpaceTransformsGPU_Emitter_CameraQuery(out float4x4 Out_TranslatedWorldToViewTransform, out float4x4 Out_ViewToTranslatedWorldTransform, out float4x4 Out_TranslatedWorldToCameraViewTransform, out float4x4 Out_CameraViewToTranslatedWorldTransform, out float4x4 Out_ViewToClipTransform, out float4x4 Out_ViewToClipNoAATransform);
void Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_(float3 In_WorldDirection, out float2 Out_TangentDirectionVector2d, out float3 Out_TangentDirectionVector, inout FSimulationContext Context);
void ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_(float In_Samples, float In_RayLength, float2 In_UnitCoordinates, float2 In_Direction, float In_ShadowDensity, int In_LightingIndex, int In_DensityIndex, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_(float3 In_WorldDirection, out float2 Out_TangentDirectionVector2d, out float3 Out_TangentDirectionVector, inout FSimulationContext Context);
void ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_(float In_Samples, float In_RayLength, float2 In_UnitCoordinates, float2 In_Direction, float In_ShadowDensity, int In_LightingIndex, int In_DensityIndex, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void SampleGrid_Emitter_LightingGridDownsample(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_(float2 In_UnitCoordinates, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void Grid2D_ComputeLighting_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_836_Particle_Func_(float3 In_VECTOR_VAR, int In_TargetChannel, out float Out_Float, inout FSimulationContext Context);
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
int Constant7 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.Use NDC"
int Constant8 = 1;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.UseColor"
int Constant9 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.ScaleEmissionByDt"
int Constant10 = 0;
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
float Constant11 = 1;
float Result5 = Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.DensityMult * Constant11;
float Result6 = Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.TemperatureMult * Constant11;
int GetNumCells_Emitter_SourceGridOutput_NumCellsX;
int GetNumCells_Emitter_SourceGridOutput_NumCellsY;
GetNumCells_Emitter_SourceGrid(GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY);
CustomHlsl25EDC993477AFBC2DE5F27B448B27AA5Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index, Output12, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Velocity, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Density, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Temperature, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Color, Result4, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.VelocityMult, Result5, Result6, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Falloff, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Core, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dx, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.MaxStreakSamples, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.StreakDensity, Constant7, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dt, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.WorldToLocal, Constant9, Context);
int Constant30 = 0;
bool Result8 = NiagaraAll(In_SourceSpace == Constant30);
int Constant31 = 0;
bool Result9 = NiagaraAll(In_DestinationSpace == Constant31);
bool Result10 = Result8 && Result9;
int Constant32 = 1;
bool Result11 = NiagaraAll(In_SourceSpace == Constant32);
int Constant33 = 1;
bool Result12 = NiagaraAll(In_DestinationSpace == Constant33);
bool Result13 = Result11 && Result12;
bool Result14 = Result10 || Result13;
int Constant34 = 2;
bool Result15 = NiagaraAll(In_SourceSpace == Constant34);
int Constant35 = 2;
bool Result16 = NiagaraAll(In_DestinationSpace == Constant35);
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
float4x4 Constant27 = (float4x4)0;
float4x4 LocalToWorld_SelectResult = Constant27;
float4x4 Constant28 = (float4x4)0;
float4x4 WorldToLocal_SelectResult = Constant28;
LocalToWorld_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult = Context.MapSimStage3_RasterizeSourceParticles.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant29 = false;
bool NiagaraScript_831_Func_Output_bUseOriginal;
float4x4 NiagaraScript_831_Func_Output_OutTransform;
bool NiagaraScript_831_Func_Output_LocalToWorld;
NiagaraScript_831_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant29, NiagaraScript_831_Func_Output_bUseOriginal, NiagaraScript_831_Func_Output_OutTransform, NiagaraScript_831_Func_Output_LocalToWorld, Context);
float3 Result35 = mul(float4(In_Position,1.0),NiagaraScript_831_Func_Output_OutTransform).xyz;
float3 Constant36 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult1 = Constant36;
NiagaraPosition_SelectResult1 = In_Position;
NiagaraPosition_SelectResult1 = Result35;
Out_Position = NiagaraPosition_SelectResult1;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.UseStreaking"
int Constant15 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.Use NDC"
int Constant16 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.UseColor"
int Constant17 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.ScaleEmissionByDt"
int Constant18 = 0;
int Result7 = ExecIndex();
bool GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Valid;
float3 GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value;
GetPositionByIndex_Emitter_ParticleSource_AttributePosition(Result7, GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value);
int Constant19 = 2;
int Constant20 = 1;
bool Constant21 = false;
float4x4 Constant22 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant23 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant24 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant25 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant26 = false;
float3 NiagaraScript_830_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraScript_830_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value, Constant19, Constant20, Constant21, Constant22, Constant23, Constant24, Constant25, NiagaraScript_830_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant37 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult2 = Constant37;
NiagaraPosition_SelectResult2 = NiagaraScript_830_Emitter_Localspace_false_Particle_Func_Output_Position;
NiagaraPosition_SelectResult2 = GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value;
bool GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Valid;
float3 GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value;
GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocity(Result7, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Valid, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value);
bool GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Valid;
float GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value;
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radius(Result7, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value);
bool GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Valid;
float GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value;
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_density(Result7, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value);
bool GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Valid;
float GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value;
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperature(Result7, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value);
float4 Constant38 = float4(0,0,0,1);
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
float Result37 = GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value * Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.RadiusScale;
float Result38 = Result37 / Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dx;
float Result39 = ceil(Result38);
float Constant39 = 1;
float Result40 = Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.DensityMult * Constant39;
float Result41 = Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.TemperatureMult * Constant39;
int GetNumCells_Emitter_SourceGridOutput_NumCellsX1;
int GetNumCells_Emitter_SourceGridOutput_NumCellsY1;
GetNumCells_Emitter_SourceGrid(GetNumCells_Emitter_SourceGridOutput_NumCellsX1, GetNumCells_Emitter_SourceGridOutput_NumCellsY1);
CustomHlsl25EDC993477AFBC2DE5F27B448B27AA5Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index1, Output15, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value, Constant38, Result39, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.VelocityMult, Result40, Result41, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Falloff, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Core, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX1, GetNumCells_Emitter_SourceGridOutput_NumCellsY1, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dx, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.MaxStreakSamples, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.StreakDensity, Constant15, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dt, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.WorldToLocal, Constant17, Context);
Out_OutMatrix = lerp(In_WorldToUnit, In_PreviousWorldToUnit, In_OwnerMotionFraction);
float Constant41 = 1;
float4x4 CustomHlsl673BB53B4107160B5025A782D355320A_Func_Output_OutMatrix;
CustomHlsl673BB53B4107160B5025A782D355320A_Func_(Context.MapSimStage4_PreSim.Grid2D_ResampleFromOwnerMotion.WorldToUnit, Context.MapSimStage4_PreSim.Grid2D_ResampleFromOwnerMotion.PreviousWorldToUnit, Constant41, CustomHlsl673BB53B4107160B5025A782D355320A_Func_Output_OutMatrix);
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit);
float Constant42 = 0;
float3 Output16;
Output16.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.x;
Output16.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.y;
Output16.z = Constant42;
float3 Result42 = mul(float4(Output16,1.0),Context.MapSimStage4_PreSim.Grid2D_ResampleFromOwnerMotion.UnitToWorld).xyz;
float3 Result43 = mul(float4(Result42,1.0),CustomHlsl673BB53B4107160B5025A782D355320A_Func_Output_OutMatrix).xyz;
float2 Output17;
Output17.x = Result43.x;
Output17.y = Result43.y;
float2 SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocity(Output17, SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
float SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperatureOutput_Value;
SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperature(Output17, SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperatureOutput_Value);
float SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensityOutput_Value;
SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensity(Output17, SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensityOutput_Value);
Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity = SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature = SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperatureOutput_Value;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Density = SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensityOutput_Value;
Out_Boundary = 0;
  Out_Boundary = In_OpenBoundaryRight ? 2 : 1;
  Out_Boundary = In_OpenBoundaryLeft ? 2 : 1;
  Out_Boundary = In_OpenBoundaryDown ? 2 : 1;
  Out_Boundary = In_OpenBoundaryUp ? 2 : 1;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1);
float Constant51 = 0;
float3 Output18;
Output18.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output18.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output18.z = Constant51;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation;
UnitToSimulation_Emitter_SimGrid(Output18, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation);
float QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SceneDepth;
float3 QuerySceneDepthGPU_Emitter_CollisionQueryOutput_CameraPosWorld;
bool QuerySceneDepthGPU_Emitter_CollisionQueryOutput_IsInsideView;
float3 QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld;
float3 QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SampleWorldNormal;
QuerySceneDepthGPU_Emitter_CollisionQuery(UnitToSimulation_Emitter_SimGridOutput_Simulation, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SceneDepth, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_CameraPosWorld, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_IsInsideView, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SampleWorldNormal);
float3 Output19;
Output19.x = UnitToSimulation_Emitter_SimGridOutput_Simulation.x;
Output19.y = UnitToSimulation_Emitter_SimGridOutput_Simulation.y;
Output19.z = UnitToSimulation_Emitter_SimGridOutput_Simulation.z;
float3 Result44 = QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld - Output19;
float Result45 = length(Result44);
float Constant52 = 15;
bool Result46 = NiagaraAll(Result45 < Constant52);
float Constant53 = 1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY);
int Constant54 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY);
float CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary;
CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, Constant54, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryRight, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryLeft, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryUp, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryDown, CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary);
float float_IfResult;
float_IfResult = Constant53;
float_IfResult = CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary;
float Constant55 = 1;
//SetConstantByStaticVariable "/Compute Boundary Grid 2D/Map Get/Map Get->Module.Use GBuffer Velocity"
int Constant56 = 0;
Context.MapSimStage4_PreSim.OUTPUT_VAR.ComputeBoundaryGrid2D.Boundary = float_IfResult;
//SetConstantByStaticVariable "/Compute Boundary Grid 2D/Map Get/Map Get->Module.Use Solid Velocity"
int Constant57 = 0;
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
float Result47 = max(Context.MapSimStage4_PreSim.Transient.TmpDensity, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
Out_Output = Result47;
Out_V = dot(In_TmpVelocity, In_TmpVelocity) > dot(In_Velocity, In_Velocity) ? In_TmpVelocity : In_Velocity;
float2 CustomHlsl81F4FE1D4EF3CE7337D446B210754B64_Func_Output_V;
CustomHlsl81F4FE1D4EF3CE7337D446B210754B64_Func_(Context.MapSimStage4_PreSim.Transient.TmpVelocity, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity, CustomHlsl81F4FE1D4EF3CE7337D446B210754B64_Func_Output_V);
Out_Output = CustomHlsl81F4FE1D4EF3CE7337D446B210754B64_Func_Output_V;
float Result48 = max(Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature, Context.MapSimStage4_PreSim.Transient.TmpTemperature);
Out_Output = Result48;
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
float2 CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_Output_Grad;
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_(Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.dx, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.ScalarIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_Output_Grad);
Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_Output_Grad;
Out_VC_Force = float2(0,0);
float GradCurlLength = length(In_GradCurl);
  Out_VC_Force = In_VorticityMult * In_dx * cross(float3(In_GradCurl / GradCurlLength, 0), float3(0,0,1)).xy;
float2 CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_Output_VC_Force;
CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_(Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.dx, Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.GradCurl, Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.VorticityMult, CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_Output_VC_Force);
float2 Result49 = Context.MapSimStage4_PreSim.Transient.PhysicsForce + CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_Output_VC_Force;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result49;
float Constant60 = 1;
float Result50 = Constant60 * Context.MapSimStage4_PreSim.Multiply_Float001.B;
Out_Result = Result50;
float Constant62 = -1;
float Result51 = Constant62 * Context.MapSimStage4_PreSim.Multiply_Float008.B;
Out_Result = Result51;
Out_Force = (In_DensityBuoyancy * In_SimGrid_Density - In_TemperatureBuoyancy * In_SimGrid_Temperature) * In_g;
float3 CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_Output_Force;
CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_(Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.DensityBuoyancy, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density, Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature, Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.g, CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_Output_Force);
float3 Result52 = Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld + CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_Output_Force;
Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld = Result52;
Out_TurbulenceForce= float2(0.0,0.0);
    float noiseScale = .05 * In_NoiseScale;
    float noiseIntensity = 100.0 * In_NoiseIntensity;
    float noiseX = FastGradientPerlinNoise3D_TEX(float3(In_CellPos.xy+ In_Time.xx,.0)*noiseScale).x *noiseIntensity;
    float noiseY = FastGradientPerlinNoise3D_TEX(float3(In_CellPos.xy-+ In_Time.xx+ 842.212,0.0)*noiseScale).x *noiseIntensity;
    Out_TurbulenceForce = float2(noiseX,noiseY);
float Constant67 = 1;
float Constant68 = 1;
float Constant69 = 1;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2);
float Constant70 = 0;
float3 Output110;
Output110.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2.x;
Output110.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2.y;
Output110.z = Constant70;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation1;
UnitToSimulation_Emitter_SimGrid(Output110, Context.MapSimStage4_PreSim.Grid2D_TurbulenceForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation1);
float Result53 = Context.MapSimStage4_PreSim.Engine.Time * Constant69;
float2 TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_Output_TurbulenceForce;
TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_(Constant67, Constant68, UnitToSimulation_Emitter_SimGridOutput_Simulation1, Result53, TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_Output_TurbulenceForce);
float2 Result54 = TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_Output_TurbulenceForce + Context.MapSimStage4_PreSim.Transient.PhysicsForce;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result54;
float Result56 = dot(In_V,In_V);
float Result57 = In_Threshold * In_Threshold;
bool Result58 = NiagaraAll(Result56 < Result57);
float Result59 = length(In_Fallback);
float Result60 = rsqrt(Result56);
float3 Result61 = In_V * Result60;
float Result62 = Reciprocal(Result60);
float3 Constant78 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult3 = Constant78;
float Constant79 = (0.0);
float Length_SelectResult3 = Constant79;
Direction_SelectResult3 = In_Fallback;
Length_SelectResult3 = Result59;
Direction_SelectResult3 = Result61;
Length_SelectResult3 = Result62;
Out_Direction = Direction_SelectResult3;
Out_Length = Length_SelectResult3;
Out_BelowThreshold = Result58;
Out_WindForce2D= float2(0.0,0.0);
        Out_WindForce2D = In_WDirection.xy*In_WSpeed * In_dx * 60.0;
float3 Constant73 = float3(1,1,0);
float Constant74 = 0.5;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit3;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit3);
float Constant75 = 0;
float3 Output111;
Output111.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit3.x;
Output111.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit3.y;
Output111.z = Constant75;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation2;
UnitToSimulation_Emitter_SimGrid(Output111, Context.MapSimStage4_PreSim.Grid2D_WindForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation2);
float3 Result55 = mul(float4(UnitToSimulation_Emitter_SimGridOutput_Simulation2,1.0),Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal).xyz;
float3 Constant76 = float3(0,0,1);
float Constant77 = 1e-05;
float3 NiagaraScript_799_Particle_Func_Output_Direction;
float NiagaraScript_799_Particle_Func_Output_Length;
bool NiagaraScript_799_Particle_Func_Output_BelowThreshold;
NiagaraScript_799_Particle_Func_(Constant73, Constant76, Constant77, NiagaraScript_799_Particle_Func_Output_Direction, NiagaraScript_799_Particle_Func_Output_Length, NiagaraScript_799_Particle_Func_Output_BelowThreshold, Context);
float3 Result63 = mul(float4(NiagaraScript_799_Particle_Func_Output_Direction,0.0),Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal).xyz;
float2 WindForce5644C4204BEF67FC22121D96EC483B74_Func_Output_WindForce2D;
WindForce5644C4204BEF67FC22121D96EC483B74_Func_(Result55, Result63, Context.MapSimStage4_PreSim.Grid2D_WindForce.dx, Constant74, WindForce5644C4204BEF67FC22121D96EC483B74_Func_Output_WindForce2D);
float2 Result64 = WindForce5644C4204BEF67FC22121D96EC483B74_Func_Output_WindForce2D + Context.MapSimStage4_PreSim.Transient.PhysicsForce;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result64;
float Constant81 = 0;
float3 Result65 = Context.MapSimStage4_PreSim.Grid2D_OwnerMotionForce.OwnerMotionAcceleration * Constant81;
float3 Result66 = Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld + Result65;
Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld = Result66;
float4x4 Result67 = transpose(Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.WorldToLocal);
float3 Result68 = mul(float4(Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld,0.0),Result67).xyz;
float2 Output112;
Output112.x = Result68.x;
Output112.y = Result68.y;
float2 Result69 = Context.MapSimStage4_PreSim.Transient.PhysicsForce + Output112;
float2 Result70 = Result69 * Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.dt;
float2 Result71 = Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.Velocity + Result70;
Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_IntegrateForces.NewVelocity = Result71;
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
float Constant84 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar/Map Get/Map Get->Module.Interpolation Method"
int Constant85 = 1;
int Result72 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX;
int LinearToIndex_Emitter_SimGridOutput_IndexY;
LinearToIndex_Emitter_SimGrid(Result72, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY);
float CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.VelocityIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.ScalarIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dx, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dt, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, Constant84, Constant85, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
int Constant87 = 1;
int Result73 = Context.MapSimStage5_AdvectVelocity.Add_Integer001.A + Constant87;
Out_NewOutput = Result73;
float Constant90 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 001/Map Get/Map Get->Module.Interpolation Method"
int Constant91 = 1;
int Result74 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX1;
int LinearToIndex_Emitter_SimGridOutput_IndexY1;
LinearToIndex_Emitter_SimGrid(Result74, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1);
float CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.VelocityIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.ScalarIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dx, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dt, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1, Constant90, Constant91, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar001.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
float2 Output113;
Output113.x = Context.MapSimStage5_AdvectVelocity.BreakVector2D.X;
Output113.y = Context.MapSimStage5_AdvectVelocity.BreakVector2D.Y;
Out_Vec2 = Output113;
Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity = Context.MapSimStage5_AdvectVelocity.SetVariables_47EB198B4D26ACB745967FA215BE495B.Emitter.SimGrid.Velocity;
float Result75 = In_dt * In_DissipationRate;
float Constant92 = 1;
float Result76 = Result75 + Constant92;
float2 Result77 = In_Vector2DValue / Result76;
Out_DissipatedVector2D = Result77;
float2 NiagaraScript_820_Func_Output_DissipatedVector2D;
NiagaraScript_820_Func_(Context.MapSimStage5_AdvectVelocity.DissipateVector2D.dt, Context.MapSimStage5_AdvectVelocity.DissipateVector2D.DissipationRate, Context.MapSimStage5_AdvectVelocity.DissipateVector2D.VectorValue, NiagaraScript_820_Func_Output_DissipatedVector2D, Context);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.DissipateVector2D.DissipatedVector2D = NiagaraScript_820_Func_Output_DissipatedVector2D;
int CellType = round(In_B_center);
Out_IsBoundary = CellType == SOLID_CELL || CellType == EMPTY_CELL;
//SetConstantByStaticVariable "/Scratch Module 06/Map Get/Map Get->Module.Execute"
int Constant95 = 1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1);
float GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value;
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value);
bool CustomHlsl6D9C04374BA54A1D4428A98E4601D086_Func_Output_IsBoundary;
CustomHlsl6D9C04374BA54A1D4428A98E4601D086_Func_(GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value, CustomHlsl6D9C04374BA54A1D4428A98E4601D086_Func_Output_IsBoundary);
//SetConstantByStaticVariable "/Scratch Module 06/Map Get/Map Get->Module.UseSolidVelocity"
int Constant96 = 0;
float2 Constant97 = float2(0,0);
float2 Constant98 = float2(0.0, 0.0);
float2 Vector2f_SelectResult4 = Constant98;
Vector2f_SelectResult4 = Constant97;
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
float CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div;
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_(Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.VectorIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div);
Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div;
Context.MapSimStage6_ComputeDivergence.Emitter.TemporaryGrid.SimFloat = Context.MapSimStage6_ComputeDivergence.SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118.Emitter.TemporaryGrid.SimFloat;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY);
//SetConstantByStaticVariable "/Scratch Module 04/Map Get/Map Get->Module.Use FFT"
int Constant100 = 1;
float Result78 = Context.MapSimStage6_ComputeDivergence.ScratchModule_04.Div / Context.MapSimStage6_ComputeDivergence.ScratchModule_04.dt;
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, Result78);
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
int Constant102 = 0;
float Constant103 = 1;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1);
float2 GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
int NiagaraScript_827_Func_Output_IterationIndex;
int NiagaraScript_827_Func_Output_MaxIterations;
float NiagaraScript_827_Func_Output_NormalizedIterationIndex;
int NiagaraScript_827_Func_Output_LoopIndex;
int NiagaraScript_827_Func_Output_NumberOfLoops;
float NiagaraScript_827_Func_Output_NormalizedLoopIndex;
NiagaraScript_827_Func_(NiagaraScript_827_Func_Output_IterationIndex, NiagaraScript_827_Func_Output_MaxIterations, NiagaraScript_827_Func_Output_NormalizedIterationIndex, NiagaraScript_827_Func_Output_LoopIndex, NiagaraScript_827_Func_Output_NumberOfLoops, NiagaraScript_827_Func_Output_NormalizedLoopIndex, Context);
float GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value1;
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value1);
float CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_right;
float CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_left;
float CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_up;
float CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_down;
CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_right, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_left, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_up, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_down);
float CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_right;
float CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_left;
float CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_up;
float CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_down;
CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_right, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_left, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_up, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_down);
float Constant104 = 0;
float Constant105 = 0;
float Constant106 = 0;
float Constant107 = 0;
float CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_Output_Pressure;
CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_(Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dx, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dt, Constant103, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Divergence, GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value, NiagaraScript_827_Func_Output_IterationIndex, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Relaxation, Context.MapSimStage7_SolvePressure.Emitter.PressureGrid.Pressure, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value1, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_right, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_left, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_up, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_down, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_right, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_left, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_up, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_down, Constant104, Constant105, Constant106, Constant107, CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_Output_Pressure);
Context.MapSimStage7_SolvePressure.OUTPUT_VAR.Grid2D_PressureIteration.Pressure = CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_Output_Pressure;
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
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID;
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID;
GetGroupID2704B67B4073AF1256539E9A763D1533_Func_(GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID);
float Result79 = PI;
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.dx, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.Inverse, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID, Result79, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.bPoissonSolver, Context);
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID1;
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID1;
GetGroupID2704B67B4073AF1256539E9A763D1533_Func_(GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID1, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID1);
float Result80 = PI;
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.dx, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.Inverse, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID1, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID1, Result80, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.bPoissonSolver, Context);
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID2;
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID2;
GetGroupID2704B67B4073AF1256539E9A763D1533_Func_(GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID2, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID2);
float Result81 = PI;
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.dx, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.Inverse, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID2, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID2, Result81, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.bPoissonSolver, Context);
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID3;
int GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID3;
GetGroupID2704B67B4073AF1256539E9A763D1533_Func_(GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID3, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID3);
float Result82 = PI;
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.dx, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.Inverse, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID3, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID3, Result82, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.bPoissonSolver, Context);
GetGridValue_Emitter_PressureGrid(In_IndexX+1, In_IndexY, In_ScalarIndex, S_right);
GetGridValue_Emitter_PressureGrid(In_IndexX-1, In_IndexY, In_ScalarIndex, S_left);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY+1, In_ScalarIndex, S_up);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY-1, In_ScalarIndex, S_down);
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2);
float2 CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad;
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_(Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2, Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.ScalarIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad);
Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.Grid2D_ComputeGradient.Grad = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad;
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
int Constant122 = 0;
float2 Result83 = Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.PressureGradient * Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.dt;
float2 Result84 = Result83 / Context.MapSimStage12_ProjectPressure.Local.ProjectPressureGrid2D.density;
float2 Result85 = Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity - Result84;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3);
float Constant123 = 0;
float Constant124 = 0;
float Constant125 = 0;
float Constant126 = 0;
float Constant127 = 0;
float Constant128 = 0;
float2 CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_Output_VelocityOut;
CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_(Result85, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Boundary, Constant123, Constant124, Constant125, Constant126, Constant127, Constant128, CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_Output_VelocityOut);
Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.ProjectPressureGrid2D.Velocity = CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_Output_VelocityOut;
Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage12_ProjectPressure.SetVariables_9E282C7845E37D6B386476BE13A71330.Emitter.SimGrid.Velocity;
float Constant131 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 002/Map Get/Map Get->Module.Interpolation Method"
int Constant132 = 1;
int Result86 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX2;
int LinearToIndex_Emitter_SimGridOutput_IndexY2;
LinearToIndex_Emitter_SimGrid(Result86, LinearToIndex_Emitter_SimGridOutput_IndexX2, LinearToIndex_Emitter_SimGridOutput_IndexY2);
float CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2;
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.VelocityIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.ScalarIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dt, LinearToIndex_Emitter_SimGridOutput_IndexX2, LinearToIndex_Emitter_SimGridOutput_IndexY2, Constant131, Constant132, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2;
float Constant135 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 003/Map Get/Map Get->Module.Interpolation Method"
int Constant136 = 1;
int Result87 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX3;
int LinearToIndex_Emitter_SimGridOutput_IndexY3;
LinearToIndex_Emitter_SimGrid(Result87, LinearToIndex_Emitter_SimGridOutput_IndexX3, LinearToIndex_Emitter_SimGridOutput_IndexY3);
float CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3;
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.VelocityIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.ScalarIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dt, LinearToIndex_Emitter_SimGridOutput_IndexX3, LinearToIndex_Emitter_SimGridOutput_IndexY3, Constant135, Constant136, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3;
float Result88 = In_dt * In_DissipationRate;
float Constant139 = 1;
float Result89 = Result88 + Constant139;
float Result90 = In_FloatValue / Result89;
float Result91 = In_SubtractionAmount * In_dt;
float Result92 = Result90 - Result91;
float Constant140 = 0;
float Constant141 = 1e+09;
float Result93 = clamp(Result92,Constant140,Constant141);
Out_DissipatedFloat = Result93;
float Constant138 = 0;
float NiagaraScript_815_Func_Output_DissipatedFloat;
NiagaraScript_815_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.dt, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.DissipationRate, Constant138, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.FloatValue, NiagaraScript_815_Func_Output_DissipatedFloat, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat.DissipatedFloat = NiagaraScript_815_Func_Output_DissipatedFloat;
float Constant143 = 0;
float NiagaraScript_815_Func_Output_DissipatedFloat1;
NiagaraScript_815_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.dt, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.DissipationRate, Constant143, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.FloatValue, NiagaraScript_815_Func_Output_DissipatedFloat1, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat001.DissipatedFloat = NiagaraScript_815_Func_Output_DissipatedFloat1;
Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Boundary = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_49366F1C4BCFBA536A86108A2DBB4F43.Transient.Boundary;
Out_Output = In_Density * (In_Boundary < 1e-5);
float CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output;
CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary.FloatValue, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary, CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output);
Out_Output = CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output;
float CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output1;
CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary001.FloatValue, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary, CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output1);
Out_Output = CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output1;
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
float CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_Output_curl;
CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.VectorIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_Output_curl);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_ComputeCurl.Curl = CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_Output_curl;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, Context.MapSimStage13_AdvectScalarsandPostSim.ScratchModule_02001.Value);
float Constant147 = 0;
float Constant148 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5);
float4 Output114;
Output114.r = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Red;
Output114.g = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Green;
Output114.b = Constant147;
Output114.a = Constant148;
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Enabled, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5, Output114);
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
int Constant150 = 0;
float2 ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit;
ExecutionIndexToUnit_Emitter_LightingGridDownsample(ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit);
DownsampleSimGrid19C51F204EDB6C68C8426CA765CB7155Emitter_SimGridEmitter_LightingGridDownsample_Func_(ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit, Context.MapSimStage14_LightingPrePass.Grid2D_DownsampleScalar.HighResolutionAttribute, Constant150, Context);
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
float Constant153 = 0;
float4 Output116;
Output116.x = X;
Output116.y = Y;
Output116.z = Z;
Output116.w = Constant153;
float4 Result94 = mul(Output116,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform);
float Constant154 = 1;
float4 Result95 = Result94 * Constant154;
float X1;
float Y1;
float Z1;
float W;
X1 = Result95.x;
Y1 = Result95.y;
Z1 = Result95.z;
W = Result95.w;
float2 Output117;
Output117.x = X1;
Output117.y = Y1;
float3 Output118;
Output118.x = X1;
Output118.y = Y1;
Output118.z = Z1;
Out_TangentDirectionVector2d = Output117;
Out_TangentDirectionVector = Output118;
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
float Constant159 = 0;
float4 Output119;
Output119.x = X2;
Output119.y = Y2;
Output119.z = Z2;
Output119.w = Constant159;
float4 Result97 = mul(Output119,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform1);
float Constant160 = 1;
float4 Result98 = Result97 * Constant160;
float X3;
float Y3;
float Z3;
float W1;
X3 = Result98.x;
Y3 = Result98.y;
Z3 = Result98.z;
W1 = Result98.w;
float2 Output120;
Output120.x = X3;
Output120.y = Y3;
float3 Output121;
Output121.x = X3;
Output121.y = Y3;
Output121.z = Z3;
Out_TangentDirectionVector2d = Output120;
Out_TangentDirectionVector = Output121;
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y,  0,  multipleScattering);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x+length,  In_UnitCoordinates.y,  0,  ms1);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x-length,  In_UnitCoordinates.y,  0,  ms2);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y+length,  0,  ms3);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y-length,  0,  ms4);
Out_Value = multipleScattering;
float Constant151 = 16;
float Constant152 = 60;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6);
float3 IndexToUnit_Emitter_SimGridOutput_Unit;
IndexToUnit_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, IndexToUnit_Emitter_SimGridOutput_Unit);
float2 Output115;
Output115.x = IndexToUnit_Emitter_SimGridOutput_Unit.x;
Output115.y = IndexToUnit_Emitter_SimGridOutput_Unit.y;
float2 Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d;
float3 Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector;
Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_(Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.SunDirection, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector, Context);
float Constant155 = 1;
float Result96 = Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthSun * Constant155;
int Constant156 = 0;
float ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_(Constant151, Constant152, Output115, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d, Result96, Constant156, Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
float Constant157 = 8;
float Constant158 = 32;
float2 Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d;
float3 Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector;
Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_(Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.EnvironmentDirection, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector, Context);
float Constant161 = 1;
float Result99 = Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthEnvironment * Constant161;
int Constant162 = 1;
float ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_(Constant157, Constant158, Output115, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Result99, Constant162, Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
float ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value;
ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_(Output115, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value, Context);
float3 Output122;
Output122.x = ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output122.y = ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output122.z = ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value;
Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting = Output122;
float X4;
float Y4;
float Z4;
X4 = In_VECTOR_VAR.x;
Y4 = In_VECTOR_VAR.y;
Z4 = In_VECTOR_VAR.z;
float Constant166 = (0.0);
float NiagaraFloat_SelectResult5 = Constant166;
NiagaraFloat_SelectResult5 = X4;
NiagaraFloat_SelectResult5 = Y4;
NiagaraFloat_SelectResult5 = Z4;
Out_Float = NiagaraFloat_SelectResult5;
float NiagaraScript_836_Particle_Func_Output_Float;
NiagaraScript_836_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.Channel, NiagaraScript_836_Particle_Func_Output_Float, Context);
Out_Float = NiagaraScript_836_Particle_Func_Output_Float;
float NiagaraScript_836_Particle_Func_Output_Float1;
NiagaraScript_836_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.Channel, NiagaraScript_836_Particle_Func_Output_Float1, Context);
Out_Float = NiagaraScript_836_Particle_Func_Output_Float1;
float NiagaraScript_836_Particle_Func_Output_Float2;
NiagaraScript_836_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.Channel, NiagaraScript_836_Particle_Func_Output_Float2, Context);
Out_Float = NiagaraScript_836_Particle_Func_Output_Float2;
float Constant169 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7);
float4 Output123;
Output123.r = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Red;
Output123.g = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Green;
Output123.b = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Blue;
Output123.a = Constant169;
SetRenderTargetValue_Emitter_LightingRT_UEImpureCall(Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Enabled, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7, Output123);
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
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.ScaleEmissionByDt"
int Constant6 = 0;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dt = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.dt;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dx = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.dx;
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.SourceIsLocalSpace = Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceIsLocalSpace;
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
Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.ScaleEmissionByDt = Constant6;
EnterStatScope(2 /**Grid2D_Gas_ParticleScatterSource001_Emitter_Func_*/);
Grid2D_Gas_ParticleScatterSource001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_ParticleScatterSource001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage2_RasterizeNDCSourceParticles
//Begin Stage Script: MapSimStage3_RasterizeSourceParticles!
int Constant12 = 0;
int Constant13 = 0;
int Constant14 = 0;
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
Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.ScaleEmissionByDt = Constant14;
EnterStatScope(3 /**Grid2D_Gas_ParticleScatterSource_Emitter_Func_*/);
Grid2D_Gas_ParticleScatterSource_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_ParticleScatterSource_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage3_RasterizeSourceParticles
//Begin Stage Script: MapSimStage4_PreSim!
Context.MapSimStage4_PreSim.Grid2D_ResampleFromOwnerMotion.PreviousWorldToUnit = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform001.WorldToUnit;
Context.MapSimStage4_PreSim.Grid2D_ResampleFromOwnerMotion.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapSimStage4_PreSim.Grid2D_ResampleFromOwnerMotion.WorldToUnit = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit;
float Constant40 = 1;
EnterStatScope(4 /**Grid2D_ResampleFromOwnerMotion_Emitter_Func_*/);
Grid2D_ResampleFromOwnerMotion_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ResampleFromOwnerMotion_Emitter_Func_*/);
bool Constant43 = true;
bool Constant44 = false;
bool Constant45 = false;
bool Constant46 = false;
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.fluids_solver_useSolidVelocity"
int Constant47 = 0;
int Constant48 = 0;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.dt = Context.MapSimStage4_PreSim.Emitter.dt;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.WorldToLocal = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryUp = Constant43;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryRight = Constant44;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryDown = Constant45;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryLeft = Constant46;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.UseSolidVelocity = Constant47;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.UseGBufferVelocity = Constant48;
float Constant49 = 15;
float Constant50 = 1;
EnterStatScope(5 /**ComputeBoundaryGrid2D_Emitter_Func_*/);
ComputeBoundaryGrid2D_Emitter_Func_(Context);
ExitStatScope(/**ComputeBoundaryGrid2D_Emitter_Func_*/);
EnterStatScope(6 /**ScratchModule001_Emitter_Func_*/);
ScratchModule001_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule001_Emitter_Func_*/);
Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpDensity = Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Density;
Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpTemperature = Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Temperature;
Context.MapSimStage4_PreSim.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpVelocity = Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule001.Velocity;
EnterStatScope(7 /**SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_*/);
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
EnterStatScope(8 /**SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_*/);
SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_*/);
Context.MapSimStage4_PreSim.SetVariables_9A5606CD480032B7102900A8757C50F2.Emitter.SimGrid.Boundary = Context.MapSimStage4_PreSim.OUTPUT_VAR.ComputeBoundaryGrid2D.Boundary;
EnterStatScope(9 /**SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_*/);
SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.dx = Context.MapSimStage4_PreSim.Emitter.dx;
Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.ScalarIndex = Context.MapSimStage4_PreSim.Emitter.SimGrid_SimFloatIndex;
EnterStatScope(10 /**Grid2D_ComputeGradient001_Emitter_Func_*/);
Grid2D_ComputeGradient001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeGradient001_Emitter_Func_*/);
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.dx = Context.MapSimStage4_PreSim.Emitter.dx;
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.GradCurl = Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad;
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.VorticityMult = Context.MapSimStage4_PreSim.Emitter.fluids_solver_vorticityConfinement;
float2 Constant58 = float2(0,0);
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Constant58;
EnterStatScope(11 /**VorticityConfinementForceGrid2D_Emitter_Func_*/);
VorticityConfinementForceGrid2D_Emitter_Func_(Context);
ExitStatScope(/**VorticityConfinementForceGrid2D_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Multiply_Float001.B = Context.MapSimStage4_PreSim.Emitter.fluids_solver_densityBouyancy;
Context.MapSimStage4_PreSim.Multiply_Float008.B = Context.MapSimStage4_PreSim.Emitter.fluids_solver_temperatureBouyancy;
float Constant59 = 1;
float Multiply_Float001_Emitter_Func_Output_Result;
Multiply_Float001_Emitter_Func_(Multiply_Float001_Emitter_Func_Output_Result, Context);
float Constant61 = -1;
float Multiply_Float008_Emitter_Func_Output_Result;
Multiply_Float008_Emitter_Func_(Multiply_Float008_Emitter_Func_Output_Result, Context);
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.DensityBuoyancy = Multiply_Float001_Emitter_Func_Output_Result;
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.g = Context.MapSimStage4_PreSim.Emitter.g;
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy = Multiply_Float008_Emitter_Func_Output_Result;
float3 Constant63 = float3(0,0,0);
Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld = Constant63;
EnterStatScope(12 /**Grid2D_Gas_3DBuoyancy_Emitter_Func_*/);
Grid2D_Gas_3DBuoyancy_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_3DBuoyancy_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_TurbulenceForce.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
float Constant64 = 1;
float Constant65 = 1;
float Constant66 = 1;
EnterStatScope(13 /**Grid2D_TurbulenceForce_Emitter_Func_*/);
Grid2D_TurbulenceForce_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_TurbulenceForce_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_WindForce.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.MapSimStage4_PreSim.Grid2D_WindForce.dx = Context.MapSimStage4_PreSim.Emitter.dx;
float3 Constant71 = float3(1,1,0);
float Constant72 = 0.5;
EnterStatScope(14 /**Grid2D_WindForce_Emitter_Func_*/);
Grid2D_WindForce_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_WindForce_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_OwnerMotionForce.OwnerMotionAcceleration = Context.MapSimStage4_PreSim.Emitter.ComputeOwnerMotion.Acceleration;
float Constant80 = 0;
EnterStatScope(15 /**Grid2D_OwnerMotionForce_Emitter_Func_*/);
Grid2D_OwnerMotionForce_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_OwnerMotionForce_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.Velocity = Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity;
Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.dt = Context.MapSimStage4_PreSim.Emitter.dt;
Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.WorldToLocal = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.LocalToWorldRotation;
EnterStatScope(16 /**Grid2D_IntegrateForces_Emitter_Func_*/);
Grid2D_IntegrateForces_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_IntegrateForces_Emitter_Func_*/);
Context.MapSimStage4_PreSim.SetVariables_C54322844BB05B548FF0B8B0DC931DEE.Emitter.SimGrid.Velocity = Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_IntegrateForces.NewVelocity;
EnterStatScope(17 /**SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_*/);
SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage4_PreSim
//Begin Stage Script: MapSimStage5_AdvectVelocity!
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.VelocityInterpolationMethod"
int Constant82 = 1;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dx = Context.MapSimStage5_AdvectVelocity.Emitter.dx;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.ScalarIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.VelocityIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.InterpolationMethod = Constant82;
float Constant83 = 1;
EnterStatScope(18 /**Grid2D_AdvectScalar_Emitter_Func_*/);
Grid2D_AdvectScalar_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.Add_Integer001.A = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
int Constant86 = 1;
int Add_Integer001_Emitter_Func_Output_NewOutput;
Add_Integer001_Emitter_Func_(Add_Integer001_Emitter_Func_Output_NewOutput, Context);
int Constant88 = 1;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dx = Context.MapSimStage5_AdvectVelocity.Emitter.dx;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.ScalarIndex = Add_Integer001_Emitter_Func_Output_NewOutput;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.VelocityIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.InterpolationMethod = Constant88;
float Constant89 = 1;
EnterStatScope(19 /**Grid2D_AdvectScalar001_Emitter_Func_*/);
Grid2D_AdvectScalar001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar001_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.BreakVector2D.X = Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar.AdvectedScalar;
Context.MapSimStage5_AdvectVelocity.BreakVector2D.Y = Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar001.AdvectedScalar;
float2 BreakVector2D_Emitter_Func_Output_Vec2;
BreakVector2D_Emitter_Func_(BreakVector2D_Emitter_Func_Output_Vec2, Context);
Context.MapSimStage5_AdvectVelocity.SetVariables_47EB198B4D26ACB745967FA215BE495B.Emitter.SimGrid.Velocity = BreakVector2D_Emitter_Func_Output_Vec2;
EnterStatScope(20 /**SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_*/);
SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.DissipateVector2D.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.DissipateVector2D.DissipationRate = Context.MapSimStage5_AdvectVelocity.Emitter.fluids_solver_velocityDissipation;
Context.MapSimStage5_AdvectVelocity.DissipateVector2D.VectorValue = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity;
EnterStatScope(21 /**DissipateVector2D_Emitter_Func_*/);
DissipateVector2D_Emitter_Func_(Context);
ExitStatScope(/**DissipateVector2D_Emitter_Func_*/);
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.UseFFT"
int Constant93 = 1;
int Constant94 = 0;
Context.MapSimStage5_AdvectVelocity.ScratchModule_06.Execute = Constant93;
Context.MapSimStage5_AdvectVelocity.ScratchModule_06.UseSolidVelocity = Constant94;
Context.MapSimStage5_AdvectVelocity.ScratchModule_06.Velocity = Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.DissipateVector2D.DissipatedVector2D;
EnterStatScope(22 /**ScratchModule_06_Emitter_Func_*/);
ScratchModule_06_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_06_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage5_AdvectVelocity
//Begin Stage Script: MapSimStage6_ComputeDivergence!
Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.dx = Context.MapSimStage6_ComputeDivergence.Emitter.dx;
Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.VectorIndex = Context.MapSimStage6_ComputeDivergence.Emitter.SimGrid_VelocityIndex;
EnterStatScope(23 /**Grid2D_ComputeDivergence_Emitter_Func_*/);
Grid2D_ComputeDivergence_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeDivergence_Emitter_Func_*/);
Context.MapSimStage6_ComputeDivergence.SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118.Emitter.TemporaryGrid.SimFloat = Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div;
EnterStatScope(24 /**SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_*/);
SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_*/);
int Constant99 = 1;
Context.MapSimStage6_ComputeDivergence.ScratchModule_04.Div = Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div;
Context.MapSimStage6_ComputeDivergence.ScratchModule_04.dt = Context.MapSimStage6_ComputeDivergence.Emitter.dt;
Context.MapSimStage6_ComputeDivergence.ScratchModule_04.UseFFT = Constant99;
EnterStatScope(25 /**ScratchModule_04_Emitter_Func_*/);
ScratchModule_04_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_04_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage6_ComputeDivergence
//Begin Stage Script: MapSimStage7_SolvePressure!
EnterStatScope(26 /**GetDivergence_Emitter_Func_*/);
GetDivergence_Emitter_Func_(Context);
ExitStatScope(/**GetDivergence_Emitter_Func_*/);
int Constant101 = 0;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dt = Context.MapSimStage7_SolvePressure.Emitter.dt;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dx = Context.MapSimStage7_SolvePressure.Emitter.dx;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.SolidVelocityIndex = Context.MapSimStage7_SolvePressure.Emitter.SimGrid_SolidVelocityIndex;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Divergence = Context.MapSimStage7_SolvePressure.Transient.Divergence;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Relaxation = Context.MapSimStage7_SolvePressure.Emitter.fluids_solver_pressureRelaxation;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.UseSolidVelocity = Constant101;
EnterStatScope(27 /**Grid2D_PressureIteration_Emitter_Func_*/);
Grid2D_PressureIteration_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_PressureIteration_Emitter_Func_*/);
Context.MapSimStage7_SolvePressure.SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91.Emitter.PressureGrid.Pressure = Context.MapSimStage7_SolvePressure.OUTPUT_VAR.Grid2D_PressureIteration.Pressure;
EnterStatScope(28 /**SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_*/);
SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage7_SolvePressure
//Begin Stage Script: MapSimStage8_SolvePressureASC40SinFFTinYASC41!
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.dx = Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Emitter.dx;
bool Constant108 = false;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.XDirecton = Constant108;
bool Constant109 = false;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.Inverse = Constant109;
bool Constant110 = true;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.bPoissonSolver = Constant110;
EnterStatScope(29 /**Grid2D_ComputeFFT_Emitter_Func_*/);
Grid2D_ComputeFFT_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage8_SolvePressureASC40SinFFTinYASC41
//Begin Stage Script: MapSimStage9_SolvePressureASC40SinFFTinXASC41!
bool Constant111 = true;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.dx = Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Emitter.dx;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.XDirecton = Constant111;
bool Constant112 = false;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.Inverse = Constant112;
bool Constant113 = true;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.bPoissonSolver = Constant113;
EnterStatScope(30 /**Grid2D_ComputeFFT001_Emitter_Func_*/);
Grid2D_ComputeFFT001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage9_SolvePressureASC40SinFFTinXASC41
//Begin Stage Script: MapSimStage10_SolvePressureASC40InvSinFFTinXASC41!
bool Constant114 = true;
bool Constant115 = true;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.dx = Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Emitter.dx;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.Inverse = Constant114;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.XDirecton = Constant115;
bool Constant116 = true;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.bPoissonSolver = Constant116;
EnterStatScope(31 /**Grid2D_ComputeFFT002_Emitter_Func_*/);
Grid2D_ComputeFFT002_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT002_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage10_SolvePressureASC40InvSinFFTinXASC41
//Begin Stage Script: MapSimStage11_SolvePressureASC40InvSinFFTinYASC41!
bool Constant117 = true;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.dx = Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Emitter.dx;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.Inverse = Constant117;
bool Constant118 = false;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.XDirecton = Constant118;
bool Constant119 = true;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.bPoissonSolver = Constant119;
EnterStatScope(32 /**Grid2D_ComputeFFT003_Emitter_Func_*/);
Grid2D_ComputeFFT003_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT003_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage11_SolvePressureASC40InvSinFFTinYASC41
//Begin Stage Script: MapSimStage12_ProjectPressure!
Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.dx = Context.MapSimStage12_ProjectPressure.Emitter.dx;
Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.ScalarIndex = Context.MapSimStage12_ProjectPressure.Emitter.PressureGrid_PressureIndex;
EnterStatScope(33 /**Grid2D_ComputeGradient_Emitter_Func_*/);
Grid2D_ComputeGradient_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeGradient_Emitter_Func_*/);
int Constant120 = 0;
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.dt = Context.MapSimStage12_ProjectPressure.Emitter.dt;
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.SolidVelocityIndex = Context.MapSimStage12_ProjectPressure.Emitter.SimGrid_SolidVelocityIndex;
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.PressureGradient = Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.Grid2D_ComputeGradient.Grad;
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.UseSolidVelocity = Constant120;
float Constant121 = 1;
Context.MapSimStage12_ProjectPressure.Local.ProjectPressureGrid2D.density = Constant121;
EnterStatScope(34 /**ProjectPressureGrid2D_Emitter_Func_*/);
ProjectPressureGrid2D_Emitter_Func_(Context);
ExitStatScope(/**ProjectPressureGrid2D_Emitter_Func_*/);
Context.MapSimStage12_ProjectPressure.SetVariables_9E282C7845E37D6B386476BE13A71330.Emitter.SimGrid.Velocity = Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.ProjectPressureGrid2D.Velocity;
EnterStatScope(35 /**SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_*/);
SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage12_ProjectPressure
//Begin Stage Script: MapSimStage13_AdvectScalarsandPostSim!
//SetConstantByStaticVariable "/Map Get/Map Get->Emitter.ScalarInterpolationMethod"
int Constant129 = 1;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.ScalarIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_DensityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.VelocityIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.InterpolationMethod = Constant129;
float Constant130 = 1;
EnterStatScope(36 /**Grid2D_AdvectScalar002_Emitter_Func_*/);
Grid2D_AdvectScalar002_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar002_Emitter_Func_*/);
int Constant133 = 1;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.ScalarIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_TemperatureIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.VelocityIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.InterpolationMethod = Constant133;
float Constant134 = 1;
EnterStatScope(37 /**Grid2D_AdvectScalar003_Emitter_Func_*/);
Grid2D_AdvectScalar003_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar003_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.DissipationRate = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationDensity;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar;
float Constant137 = 0;
EnterStatScope(38 /**DissipateFloat_Emitter_Func_*/);
DissipateFloat_Emitter_Func_(Context);
ExitStatScope(/**DissipateFloat_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.DissipationRate = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationTemperature;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar;
float Constant142 = 0;
EnterStatScope(39 /**DissipateFloat001_Emitter_Func_*/);
DissipateFloat001_Emitter_Func_(Context);
ExitStatScope(/**DissipateFloat001_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_49366F1C4BCFBA536A86108A2DBB4F43.Transient.Boundary = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary;
EnterStatScope(40 /**SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_*/);
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
EnterStatScope(41 /**SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_*/);
SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.VectorIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
EnterStatScope(42 /**Grid2D_ComputeCurl_Emitter_Func_*/);
Grid2D_ComputeCurl_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeCurl_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.ScratchModule_02001.Value = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_ComputeCurl.Curl;
EnterStatScope(43 /**ScratchModule_02001_Emitter_Func_*/);
ScratchModule_02001_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_02001_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Red = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Green = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature;
float Constant144 = 0;
float Constant145 = 0;
bool Constant146 = true;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Enabled = Constant146;
EnterStatScope(44 /**Grid2D_Gas_SetRTValues_Emitter_Func_*/);
Grid2D_Gas_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_SetRTValues_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_AdvectScalarsandPostSim
//Begin Stage Script: MapSimStage14_LightingPrePass!
Context.MapSimStage14_LightingPrePass.Grid2D_DownsampleScalar.HighResolutionAttribute = Context.MapSimStage14_LightingPrePass.Emitter.SimGrid_TemperatureIndex;
int Constant149 = 0;
EnterStatScope(45 /**Grid2D_DownsampleScalar_Emitter_Func_*/);
Grid2D_DownsampleScalar_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_DownsampleScalar_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_LightingPrePass
//Begin Stage Script: MapSimStage15_ComputeLighting!
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.SunDirection = Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_sunDirection;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.EnvironmentDirection = Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_environmentDirection;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthEnvironment = Context.MapSimStage15_ComputeLighting.Emitter.ShadowDensityMult;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthSun = Context.MapSimStage15_ComputeLighting.Emitter.ShadowDensityMult;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex = Context.MapSimStage15_ComputeLighting.Emitter.SimGrid_DensityIndex;
EnterStatScope(46 /**Grid2D_ComputeLighting_Emitter_Func_*/);
Grid2D_ComputeLighting_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeLighting_Emitter_Func_*/);
int Constant163 = 1;
int Constant164 = 2;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.Channel = Constant163;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.Channel = Constant164;
int Constant165 = 0;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.Channel = Constant165;
float MakeFloatFromVector_Emitter_Func_Output_Float;
MakeFloatFromVector_Emitter_Func_(MakeFloatFromVector_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector001_Emitter_Func_Output_Float;
MakeFloatFromVector001_Emitter_Func_(MakeFloatFromVector001_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector002_Emitter_Func_Output_Float;
MakeFloatFromVector002_Emitter_Func_(MakeFloatFromVector002_Emitter_Func_Output_Float, Context);
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Red = MakeFloatFromVector_Emitter_Func_Output_Float;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Green = MakeFloatFromVector001_Emitter_Func_Output_Float;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Blue = MakeFloatFromVector002_Emitter_Func_Output_Float;
float Constant167 = 0;
bool Constant168 = true;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Enabled = Constant168;
EnterStatScope(47 /**Grid2D_Gas_SetRTValues001_Emitter_Func_*/);
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
int4 Emitter_SimGrid_AttributeIndices[6];
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
Emitter_ParticleSource_AttributeCompressed[2];
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Texture2D ComputeBoundaryGrid2D_GBuffer_VelocityTexture;
SamplerState ComputeBoundaryGrid2D_GBuffer_VelocityTextureSampler;
uint2 ScreenPos = uint2(ScreenUV * View.BufferSizeAndInvSize.xy);
return SubstratePublic_GetSubstrateGBufferFromFirstBSDF(ScreenPos);
UV = (UV * float2(2.0f, -2.0f) + float2(-1.0f, 1.0f)) * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
return UV;
ScreenUV = ApplyViewportOffset_ComputeBoundaryGrid2D_GBuffer(ScreenUV, bApplyViewportOffset);
IsValid = true;
OutValue = SubstratePublic_GetWorldNormal(ScreenPos);
FGBufferData GBufferData = GetGBufferData(ScreenUV);
OutValue = GBufferData.DiffuseColor;
IsValid = false;
OutValue = 0;
OutValue = GBufferData.WorldNormal;
float4 EncodedVelocity = 0;
EncodedVelocity = GetGBufferData(ScreenUV).Velocity;
EncodedVelocity = ComputeBoundaryGrid2D_GBuffer_VelocityTexture.SampleLevel(ComputeBoundaryGrid2D_GBuffer_VelocityTextureSampler, ScreenUV, 0);
OutValue = DecodeVelocityFromTexture(EncodedVelocity);
OutValue.xy = DecodeVelocityFromTexture(EncodedVelocity).xy;
float3 Velocity = DecodeVelocityFromTexture(EncodedVelocity);
float SceneDeviceZ = LookupDeviceZ(ScreenUV);
float SceneDepth = ConvertFromDeviceZ(SceneDeviceZ);
float2 ScreenPosition = (ScreenUV - View.ScreenPositionScaleBias.wz) / View.ScreenPositionScaleBias.xy;
float3 TranslatedWorldPosition = mul(float4(GetScreenPositionForProjectionType(ScreenPosition, SceneDepth), SceneDepth, 1), PrimaryView.ScreenToTranslatedWorld).xyz;
float PrevSceneDepth = 0;
PrevSceneDepth = ConvertFromDeviceZ(SceneDeviceZ - Velocity.z);
// Ideally we would use CalcPrevSceneDepth(PrevScreenUV) here to get an accurate location, however we do not store PrevSceneDepth so this is a very rough approximation
PrevSceneDepth = SceneDepth; // CalcPrevSceneDepth(PrevScreenUV);
float2 PrevScreenPosition = ScreenPosition - Velocity.xy;
float3 PrevTranslatedWorldPosition = mul(float4(GetScreenPositionForProjectionType(PrevScreenPosition, PrevSceneDepth), PrevSceneDepth, 1), PrimaryView.PrevScreenToTranslatedWorld).xyz;
float3 PreViewTranslationOffset = DFFastLocalSubtractDemote(PrimaryView.PreViewTranslation, PrimaryView.PrevPreViewTranslation);
OutValue = TranslatedWorldPosition - PrevTranslatedWorldPosition - PreViewTranslationOffset;
OutValue = GetNiagaraSubstrateGBuffer_ComputeBoundaryGrid2D_GBuffer(ScreenUV).BaseColor;
OutValue = GBufferData.BaseColor;
OutValue = GetNiagaraSubstrateGBuffer_ComputeBoundaryGrid2D_GBuffer(ScreenUV).Metallic;
OutValue = GBufferData.Metallic;
OutValue = GetNiagaraSubstrateGBuffer_ComputeBoundaryGrid2D_GBuffer(ScreenUV).Specular;
OutValue = GBufferData.Specular;
OutValue = SubstratePublic_GetRoughness(ScreenPos);
OutValue = GBufferData.Roughness;
OutValue = GBufferData.Depth;
OutValue = CalcSceneDepth(ScreenUV);
// This has not been tested yet
uint2 IntUV = (uint2)(ScreenUV.xy * (float2)View.BufferSizeAndInvSize.xy);
uint Stencil = SceneStencilTexture.Load(uint3(IntUV, 0)) STENCIL_COMPONENT_SWIZZLE;
OutValue = int(Stencil);
OutValue = ConvertFromDeviceZ(Texture2DSampleLevel(SceneTexturesStruct.ScenePartialDepthTexture, SceneTexturesStruct_ScenePartialDepthTextureSampler, ScreenUV, 0).r);
OutValue = ConvertFromDeviceZ(Texture2DSampleLevel(MobileSceneTextures.ScenePartialDepthTexture, MobileSceneTextures.ScenePartialDepthTextureSampler, ScreenUV, 0).r);
OutValue = GBufferData.CustomDepth;
OutValue = ConvertFromDeviceZ(Texture2DSampleLevel(MobileSceneTextures.CustomDepthTexture, MobileSceneTextures.CustomDepthTextureSampler, ScreenUV, 0).r);
OutValue = GBufferData.CustomStencil;
OutValue = MobileSceneTextures.CustomStencilTexture.Load(int3(ScreenUV, 0)) STENCIL_COMPONENT_SWIZZLE;
OutValue = Texture2DSampleLevel(SceneTexturesStruct_SceneColorTexture, SceneTexturesStruct_SceneColorTextureSampler, ScreenUV, 0);
OutValue.rgb *= View.OneOverPreExposure.xxx;
OutValue = Texture2DSampleLevel(MobileSceneTextures.SceneColorTexture, MobileSceneTextures.SceneColorTextureSampler, ScreenUV, 0);
OutValue = int(GetNiagaraSubstrateGBuffer_ComputeBoundaryGrid2D_GBuffer(ScreenUV).ShadingModelID);
OutValue = GBufferData.ShadingModelID;
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
Out_Val.r = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 0, 0)); 
Out_Val.g = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 1, 0)); 
int In_AttributeIndex = 2;
Out_Val = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
int In_AttributeIndex = 3;
int In_AttributeIndex = 4;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 0)] = In_Value.r;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 1)] = In_Value.g;
Out_Unit = (float2(GDispatchThreadId.x, GDispatchThreadId.y) + .5) * rcp(Emitter_SimGrid_NumCells);
const uint IndexX = Linear % Emitter_SimGrid_NumCells.x;
const uint IndexY = Linear / Emitter_SimGrid_NumCells.x;
Out_Unit = (float2(IndexX, IndexY) + .5) * Emitter_SimGrid_UnitToUV;
Out_Val.r = Emitter_SimGrid_Grid.SampleLevel(Emitter_SimGrid_GridSampler, float3(In_Unit, In_AttributeIndex + 0), 0); 
Out_Val.g = Emitter_SimGrid_Grid.SampleLevel(Emitter_SimGrid_GridSampler, float3(In_Unit, In_AttributeIndex + 1), 0); 
Out_Val = Emitter_SimGrid_Grid.SampleLevel(Emitter_SimGrid_GridSampler, float3(In_Unit, In_AttributeIndex), 0);
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
Out_Index = In_Unit * float2(Emitter_SourceGrid_NumCells)  - .5;
Out_NumCellsX = Emitter_SourceGrid_NumCells.x;
Out_NumCellsY = Emitter_SourceGrid_NumCells.y;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
int In_AttributeIndex = 1;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 0)] = In_Value.r;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 1)] = In_Value.g;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 2)] = In_Value.b;
Emitter_SourceGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 3)] = In_Value.a;
Out_IndexX = Linear % Emitter_SourceGrid_NumCells.x;
Out_IndexY = Linear / Emitter_SourceGrid_NumCells.x;
Out_Val = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex, 0));
Out_Val.r = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 0, 0)); 
Out_Val.g = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 1, 0)); 
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
// Variable Name "Emitter.SimGrid.Velocity" Type "Vector2f" Var "Map.Emitter.SimGrid.Velocity"
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Velocity);
// Variable Name "Emitter.SimGrid.Temperature" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Temperature"
GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Temperature);
// Variable Name "Emitter.SimGrid.Density" Type "NiagaraFloat" Var "Map.Emitter.SimGrid.Density"
GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Density);
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
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity);
GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature);
GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
SetupFromIterationSource_MapSimStage4_PreSim_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage4_PreSim_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
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
Context.MapSimStage2_RasterizeNDCSourceParticles.Emitter.SourceIsLocalSpace = Emitter_SourceIsLocalSpace;
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
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform001.WorldToUnit = Emitter_Grid2D_CreateUnitToWorldTransform001_WorldToUnit;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld = Emitter_Grid2D_CreateUnitToWorldTransform_UnitToWorld;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToUnit;
Context.MapSimStage4_PreSim.Emitter.dt = Emitter_dt;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
Context.MapSimStage4_PreSim.Emitter.dx = Emitter_dx;
Context.MapSimStage4_PreSim.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_vorticityConfinement = Emitter_fluids_solver_vorticityConfinement;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_densityBouyancy = Emitter_fluids_solver_densityBouyancy;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_temperatureBouyancy = Emitter_fluids_solver_temperatureBouyancy;
Context.MapSimStage4_PreSim.Emitter.g = Emitter_g;
Context.MapSimStage4_PreSim.Engine.Time = Engine_Time;
Context.MapSimStage4_PreSim.Emitter.ComputeOwnerMotion.Acceleration = Emitter_ComputeOwnerMotion_Acceleration;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.LocalToWorldRotation = Emitter_Grid2D_CreateUnitToWorldTransform_LocalToWorldRotation;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
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
Context.MapSimStage7_SolvePressure.Emitter.SimGrid_SolidVelocityIndex = Emitter_SimGrid_SolidVelocityIndex;
Context.MapSimStage7_SolvePressure.Emitter.fluids_solver_pressureRelaxation = Emitter_fluids_solver_pressureRelaxation;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Emitter.dx = Emitter_dx;
Context.MapSimStage12_ProjectPressure.Emitter.dx = Emitter_dx;
Context.MapSimStage12_ProjectPressure.Emitter.PressureGrid_PressureIndex = Emitter_PressureGrid_PressureIndex;
Context.MapSimStage12_ProjectPressure.Emitter.dt = Emitter_dt;
Context.MapSimStage12_ProjectPressure.Emitter.SimGrid_SolidVelocityIndex = Emitter_SimGrid_SolidVelocityIndex;
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
SimulateMapUpdate(Context);
WriteDataSets(Context);
SetupExecIndexAndSpawnInfoForGPU();
InitSpawnVariables(Context);
Context.MapSpawn.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + GLinearThreadId - GSpawnStartInstance;
ConditionalInterpolateParameters(Context);
SimulateMapSpawn(Context);
TransferAttributes(Context);
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
ˇ†LœZ;Ár
ƒC†‹;©
èW;˙99
Wö;‡@¶Œ`
>˙∆;7L˚JÜ¥Êstçˆ[
>˙∆;7L˚JÜ¥Êstçˆ[f
„~IäLb»I∂;!Éö
0ûíÍÉ'ÔåG;‘;l2J"
0ûíÍÉ'ÔåG;‘;l2J"f
npOÄ£k;•åUÁ¨
npOÄ£k;•åUÁ
æ iyM0›Bñ,;{Z˙É∆
æ iyM0›Bñ,;{Z˙É∆f
FParamMap0 Map;
void Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColor(int In_InstanceData, int In_Index, out bool Out_Success, out float3 Out_Position, out float3 Out_Velocity, out float Out_Radius, out float Out_PreviousRadius, out float Out_Density, out float Out_Temperature, out float Out_Divergence, out float4 Out_Color);
void UnitToFloatIndex_Emitter_SourceGrid(int In_InstanceData, float2 In_Unit, out float2 Out_Index);
void GetNumCells_Emitter_SourceGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY);
void SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeDensity(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeTemperature(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void SetVector2DValue_Emitter_SourceGrid_UEImpureCall_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, float2 In_Value);
void SetVector4Value_Emitter_SourceGrid_UEImpureCall_AttributeColor(int In_InstanceData, int In_IndexX, int In_IndexY, float4 In_Value);
            SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeDensity(1, CellIndex.x,CellIndex.y, Density * FalloffMult);
            SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeTemperature(1, CellIndex.x,CellIndex.y, Temperature * FalloffMult);
            SetVector2DValue_Emitter_SourceGrid_UEImpureCall_AttributeVelocity(1, CellIndex.x,CellIndex.y, Velocity.xy * FalloffMult);
                SetVector4Value_Emitter_SourceGrid_UEImpureCall_AttributeColor(1, CellIndex.x, CellIndex.y, In_ParticleColor);
int Constant3 = 0;
int Constant4 = 1;
Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColor(2, Result, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Success, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Velocity, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_PreviousRadius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Density, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Temperature, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Divergence, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Color);
float3 Result1 = mul(float4(Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Position,1.0),Context.Map.Grid2D_Gas_ParticleScatterSource001.WorldToUnit).xyz;
UnitToFloatIndex_Emitter_SourceGrid(1, Output11, UnitToFloatIndex_Emitter_SourceGridOutput_Index);
float Result2 = Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius * Context.Map.Grid2D_Gas_ParticleScatterSource001.RadiusScale;
float Result3 = Result2 / Context.Map.Grid2D_Gas_ParticleScatterSource001.dx;
float Constant7 = 1;
float Result5 = Context.Map.Grid2D_Gas_ParticleScatterSource001.DensityMult * Constant7;
float Result6 = Context.Map.Grid2D_Gas_ParticleScatterSource001.TemperatureMult * Constant7;
GetNumCells_Emitter_SourceGrid(1, GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY);
CustomHlsl25EDC993477AFBC2DE5F27B448B27AA5Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index, Output12, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Velocity, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Density, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Temperature, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Color, Result4, Context.Map.Grid2D_Gas_ParticleScatterSource001.VelocityMult, Result5, Result6, Context.Map.Grid2D_Gas_ParticleScatterSource001.Falloff, Context.Map.Grid2D_Gas_ParticleScatterSource001.Core, Context.Map.Grid2D_Gas_ParticleScatterSource001.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY, Context.Map.Grid2D_Gas_ParticleScatterSource001.dx, Context.Map.Grid2D_Gas_ParticleScatterSource001.MaxStreakSamples, Context.Map.Grid2D_Gas_ParticleScatterSource001.StreakDensity, Constant3, Context.Map.Grid2D_Gas_ParticleScatterSource001.dt, Context.Map.Grid2D_Gas_ParticleScatterSource001.WorldToLocal, Constant5, Context);
EnterStatScope(0 /**SimulationStage_0*/);
int Constant = 0;
int Constant1 = 0;
int Constant2 = 0;
Context.Map.Grid2D_Gas_ParticleScatterSource001.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_Gas_ParticleScatterSource001.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_Gas_ParticleScatterSource001.SourceIsLocalSpace = Context.Map.Emitter.SourceIsLocalSpace;
Context.Map.Grid2D_Gas_ParticleScatterSource001.WorldToLocal = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.Map.Grid2D_Gas_ParticleScatterSource001.WorldToUnit = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit;
Context.Map.Grid2D_Gas_ParticleScatterSource001.Core = Context.Map.Emitter.SourceCore;
Context.Map.Grid2D_Gas_ParticleScatterSource001.DensityMult = Context.Map.Emitter.SourceDensityMult;
Context.Map.Grid2D_Gas_ParticleScatterSource001.Falloff = Context.Map.Emitter.SourceFalloff;
Context.Map.Grid2D_Gas_ParticleScatterSource001.MaxStreakSamples = Context.Map.Emitter.SourceMaxStreakSamples;
Context.Map.Grid2D_Gas_ParticleScatterSource001.RadiusScale = Context.Map.Emitter.RadiusScale;
Context.Map.Grid2D_Gas_ParticleScatterSource001.StreakDensity = Context.Map.Emitter.SourceStreakDensity;
Context.Map.Grid2D_Gas_ParticleScatterSource001.TemperatureMult = Context.Map.Emitter.SourceTemperatureMult;
Context.Map.Grid2D_Gas_ParticleScatterSource001.UseStreaking = Constant;
Context.Map.Grid2D_Gas_ParticleScatterSource001.VelocityMult = Context.Map.Emitter.SourceVelocityMult;
Context.Map.Grid2D_Gas_ParticleScatterSource001.UseColor = Constant1;
Context.Map.Grid2D_Gas_ParticleScatterSource001.ScaleEmissionByDt = Constant2;
EnterStatScope(1 /**Grid2D_Gas_ParticleScatterSource001_Emitter_Func_*/);
ExitStatScope(/**SimulationStage_0*/);
EnterStatScope(2 /**SimulationStage_0_Main*/);
Context.Map.Emitter.dt = Emitter_dt;
Context.Map.Emitter.dx = Emitter_dx;
Context.Map.Emitter.SourceIsLocalSpace = Emitter_SourceIsLocalSpace;
Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToUnit;
Context.Map.Emitter.SourceCore = Emitter_SourceCore;
Context.Map.Emitter.SourceDensityMult = Emitter_SourceDensityMult;
Context.Map.Emitter.SourceFalloff = Emitter_SourceFalloff;
Context.Map.Emitter.SourceMaxStreakSamples = Emitter_SourceMaxStreakSamples;
Context.Map.Emitter.RadiusScale = Emitter_RadiusScale;
Context.Map.Emitter.SourceStreakDensity = Emitter_SourceStreakDensity;
Context.Map.Emitter.SourceTemperatureMult = Emitter_SourceTemperatureMult;
Context.Map.Emitter.SourceVelocityMult = Emitter_SourceVelocityMult;
Context.Map.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.Map.Emitter.RandomSeed = Emitter_RandomSeed;
Context.Map.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.Map.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.Map.Engine.ExecIndex = ExecIndex();
Context.Map.Engine.Emitter.ID.ID = 1;
EnterStatScope(3 /**SimulationStage_0_MapMain*/);
Simulate(Context);
ExitStatScope(/**SimulationStage_0_MapMain*/);
int TmpWriteIndex = OutputIndex(0, false, true);
OutputDataInt(0, 0, TmpWriteIndex, Context.Map.Particles.UniqueID);
ExitStatScope(/**SimulationStage_0_Main*/);
Context.Map.Emitter.SimGrid.Density = Constant2;
Context.Map.Emitter.SimGrid.Velocity = Constant3;
EnterStatScope(0 /**SimulationStage_1_1*/);
ExitStatScope(/**SimulationStage_1_1*/);
EnterStatScope(2 /**SimulationStage_1_1_Main*/);
EnterStatScope(3 /**SimulationStage_1_1_MapMain*/);
ExitStatScope(/**SimulationStage_1_1_MapMain*/);
ExitStatScope(/**SimulationStage_1_1_Main*/);
void GetPositionByIndex_Emitter_ParticleSource_AttributePosition(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocity(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radius(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_density(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperature(int In_InstanceData, int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
bool Result1 = NiagaraAll(In_SourceSpace == Constant18);
int Constant19 = 0;
bool Result2 = NiagaraAll(In_DestinationSpace == Constant19);
bool Result3 = Result1 && Result2;
bool Result4 = NiagaraAll(In_SourceSpace == Constant20);
int Constant21 = 1;
bool Result5 = NiagaraAll(In_DestinationSpace == Constant21);
bool Result6 = Result4 && Result5;
bool Result7 = Result3 || Result6;
int Constant22 = 2;
bool Result8 = NiagaraAll(In_SourceSpace == Constant22);
int Constant23 = 2;
bool Result9 = NiagaraAll(In_DestinationSpace == Constant23);
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
Out_bUseOriginal = Result22;
Out_LocalToWorld = Result27;
float4x4 Constant15 = (float4x4)0;
float4x4 LocalToWorld_SelectResult = Constant15;
float4x4 Constant16 = (float4x4)0;
float4x4 WorldToLocal_SelectResult = Constant16;
LocalToWorld_SelectResult = Context.Map.Engine.Owner.SystemLocalToWorld;
WorldToLocal_SelectResult = Context.Map.Engine.Owner.SystemWorldToLocal;
LocalToWorld_SelectResult = Context.Map.Engine.Owner.SystemLocalToWorldNoScale;
WorldToLocal_SelectResult = Context.Map.Engine.Owner.SystemWorldToLocalNoScale;
bool Constant17 = false;
NiagaraScript_831_Func_(In_SourceSpace, In_DestinationSpace, LocalToWorld_SelectResult, WorldToLocal_SelectResult, Constant17, NiagaraScript_831_Func_Output_bUseOriginal, NiagaraScript_831_Func_Output_OutTransform, NiagaraScript_831_Func_Output_LocalToWorld, Context);
float3 Result28 = mul(float4(In_Position,1.0),NiagaraScript_831_Func_Output_OutTransform).xyz;
float3 Constant24 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult1 = Constant24;
NiagaraPosition_SelectResult1 = Result28;
GetPositionByIndex_Emitter_ParticleSource_AttributePosition(0, Result, GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Valid, GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value);
int Constant7 = 2;
bool Constant9 = false;
float4x4 Constant10 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant11 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant12 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
float4x4 Constant13 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
bool Constant14 = false;
NiagaraScript_830_Emitter_Localspace_false_Particle_Func_(GetPositionByIndex_Emitter_ParticleSource_AttributePositionOutput_Value, Constant7, Constant8, Constant9, Constant10, Constant11, Constant12, Constant13, NiagaraScript_830_Emitter_Localspace_false_Particle_Func_Output_Position, Context);
float3 Constant25 = float3(0.0, 0.0, 0.0);
float3 NiagaraPosition_SelectResult2 = Constant25;
GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocity(0, Result, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Valid, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value);
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radius(0, Result, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value);
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_density(0, Result, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value);
GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperature(0, Result, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Valid, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value);
float4 Constant26 = float4(0,0,0,1);
float3 Result29 = mul(float4(NiagaraPosition_SelectResult2,1.0),Context.Map.Grid2D_Gas_ParticleScatterSource.WorldToUnit).xyz;
Output1.x = Result29.x;
Output1.y = Result29.y;
Output1.z = Result29.z;
Output12.x = NiagaraPosition_SelectResult2.x;
Output12.y = NiagaraPosition_SelectResult2.y;
Output12.z = NiagaraPosition_SelectResult2.z;
float Result30 = GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value * Context.Map.Grid2D_Gas_ParticleScatterSource.RadiusScale;
float Result31 = Result30 / Context.Map.Grid2D_Gas_ParticleScatterSource.dx;
float Result32 = ceil(Result31);
float Constant27 = 1;
float Result33 = Context.Map.Grid2D_Gas_ParticleScatterSource.DensityMult * Constant27;
float Result34 = Context.Map.Grid2D_Gas_ParticleScatterSource.TemperatureMult * Constant27;
CustomHlsl25EDC993477AFBC2DE5F27B448B27AA5Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index, Output12, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value, Constant26, Result32, Context.Map.Grid2D_Gas_ParticleScatterSource.VelocityMult, Result33, Result34, Context.Map.Grid2D_Gas_ParticleScatterSource.Falloff, Context.Map.Grid2D_Gas_ParticleScatterSource.Core, Context.Map.Grid2D_Gas_ParticleScatterSource.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY, Context.Map.Grid2D_Gas_ParticleScatterSource.dx, Context.Map.Grid2D_Gas_ParticleScatterSource.MaxStreakSamples, Context.Map.Grid2D_Gas_ParticleScatterSource.StreakDensity, Constant3, Context.Map.Grid2D_Gas_ParticleScatterSource.dt, Context.Map.Grid2D_Gas_ParticleScatterSource.WorldToLocal, Constant5, Context);
Context.Map.Grid2D_Gas_ParticleScatterSource.Core = Context.Map.Emitter.SourceCore;
Context.Map.Grid2D_Gas_ParticleScatterSource.DensityMult = Context.Map.Emitter.SourceDensityMult;
Context.Map.Grid2D_Gas_ParticleScatterSource.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_Gas_ParticleScatterSource.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_Gas_ParticleScatterSource.Falloff = Context.Map.Emitter.SourceFalloff;
Context.Map.Grid2D_Gas_ParticleScatterSource.MaxStreakSamples = Context.Map.Emitter.SourceMaxStreakSamples;
Context.Map.Grid2D_Gas_ParticleScatterSource.RadiusScale = Context.Map.Emitter.RadiusScale;
Context.Map.Grid2D_Gas_ParticleScatterSource.SourceIsLocalSpace = Context.Map.Emitter.SourceIsLocalSpace;
Context.Map.Grid2D_Gas_ParticleScatterSource.StreakDensity = Context.Map.Emitter.SourceStreakDensity;
Context.Map.Grid2D_Gas_ParticleScatterSource.TemperatureMult = Context.Map.Emitter.SourceTemperatureMult;
Context.Map.Grid2D_Gas_ParticleScatterSource.UseStreaking = Constant;
Context.Map.Grid2D_Gas_ParticleScatterSource.VelocityMult = Context.Map.Emitter.SourceVelocityMult;
Context.Map.Grid2D_Gas_ParticleScatterSource.WorldToLocal = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.Map.Grid2D_Gas_ParticleScatterSource.WorldToUnit = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit;
Context.Map.Grid2D_Gas_ParticleScatterSource.UseColor = Constant1;
Context.Map.Grid2D_Gas_ParticleScatterSource.ScaleEmissionByDt = Constant2;
EnterStatScope(1 /**Grid2D_Gas_ParticleScatterSource_Emitter_Func_*/);
Context.Map.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.Map.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.Map.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.Map.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
void ExecutionIndexToGridIndex_Emitter_PressureGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_PressureGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void ExecutionIndexToGridIndex_Emitter_SimGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY);
void GetFloatValue_Emitter_SimGrid_AttributeBoundary(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
GetGridValue_Emitter_PressureGrid(0, In_IndexX+1, In_IndexY, In_ScalarIndex, S_right);
GetGridValue_Emitter_PressureGrid(0, In_IndexX-1, In_IndexY, In_ScalarIndex, S_left);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY+1, In_ScalarIndex, S_up);
GetGridValue_Emitter_PressureGrid(0, In_IndexX, In_IndexY-1, In_ScalarIndex, S_down);
ExecutionIndexToGridIndex_Emitter_PressureGrid(0, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY);
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_(Context.Map.Grid2D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, Context.Map.Grid2D_ComputeGradient.ScalarIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad);
Context.Map.OUTPUT_VAR.Grid2D_ComputeGradient.Grad = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_PressureGrid_Func_Output_Grad;
GetFloatValue_Emitter_SimGrid_AttributeBoundary(1, In_IndexX+1, In_IndexY, B_right);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(1, In_IndexX-1, In_IndexY, B_left);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(1, In_IndexX, In_IndexY+1, B_up);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(1, In_IndexX, In_IndexY-1, B_down);
float2 Result = Context.Map.ProjectPressureGrid2D.PressureGradient * Context.Map.ProjectPressureGrid2D.dt;
float2 Result1 = Result / Context.Map.Local.ProjectPressureGrid2D.density;
float2 Result2 = Context.Map.Emitter.SimGrid.Velocity - Result1;
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY);
float Constant3 = 0;
float Constant4 = 0;
float Constant5 = 0;
float Constant6 = 0;
float Constant7 = 0;
float Constant8 = 0;
CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_(Result2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, Context.Map.Emitter.SimGrid.Boundary, Constant3, Constant4, Constant5, Constant6, Constant7, Constant8, CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_Output_VelocityOut);
Context.Map.OUTPUT_VAR.ProjectPressureGrid2D.Velocity = CustomHlsl3293810643037FF6C04BFFA7C0F414DFEmitter_SimGrid_Func_Output_VelocityOut;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_9E282C7845E37D6B386476BE13A71330.Emitter.SimGrid.Velocity;
Context.Map.Grid2D_ComputeGradient.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_ComputeGradient.ScalarIndex = Context.Map.Emitter.PressureGrid_PressureIndex;
EnterStatScope(1 /**Grid2D_ComputeGradient_Emitter_Func_*/);
Context.Map.ProjectPressureGrid2D.dt = Context.Map.Emitter.dt;
Context.Map.ProjectPressureGrid2D.SolidVelocityIndex = Context.Map.Emitter.SimGrid_SolidVelocityIndex;
Context.Map.ProjectPressureGrid2D.PressureGradient = Context.Map.OUTPUT_VAR.Grid2D_ComputeGradient.Grad;
Context.Map.ProjectPressureGrid2D.UseSolidVelocity = Constant;
float Constant1 = 1;
Context.Map.Local.ProjectPressureGrid2D.density = Constant1;
EnterStatScope(2 /**ProjectPressureGrid2D_Emitter_Func_*/);
Context.Map.SetVariables_9E282C7845E37D6B386476BE13A71330.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.ProjectPressureGrid2D.Velocity;
EnterStatScope(3 /**SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_*/);
EnterStatScope(4 /**SimulationStage_1_1_Main*/);
Context.Map.Emitter.PressureGrid_PressureIndex = Emitter_PressureGrid_PressureIndex;
Context.Map.Emitter.SimGrid_SolidVelocityIndex = Emitter_SimGrid_SolidVelocityIndex;
EnterStatScope(5 /**SimulationStage_1_1_MapMain*/);
void LinearToIndex_Emitter_SimGrid(int In_InstanceData, int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_SimGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void IndexToUnit_Emitter_SimGrid(int In_InstanceData, float In_IndexX, float In_IndexY, out float3 Out_Unit);
void CubicSamplePreviousGridAtIndex_Emitter_SimGrid(int In_InstanceData, float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void SamplePreviousGridAtIndex_Emitter_SimGrid(int In_InstanceData, float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(int In_InstanceData, bool In_Enabled, int In_IndexX, int In_IndexY, float4 In_Value);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY, In_VelocityIndex, Velocity.x);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY, In_VelocityIndex + 1, Velocity.y);
IndexToUnit_Emitter_SimGrid(0, SampleIndex.x, SampleIndex.y, SampleUnit);
    CubicSamplePreviousGridAtIndex_Emitter_SimGrid(0, SampleUnit.x, SampleUnit.y, In_ScalarIndex, Out_AdvectedScalar);
    SamplePreviousGridAtIndex_Emitter_SimGrid(0, SampleUnit.x, SampleUnit.y, In_ScalarIndex, Out_AdvectedScalar);
float Constant2 = 1;
int Constant3 = 1;
LinearToIndex_Emitter_SimGrid(0, Result, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY);
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.Map.Grid2D_AdvectScalar002.VelocityIndex, Context.Map.Grid2D_AdvectScalar002.ScalarIndex, Context.Map.Grid2D_AdvectScalar002.dx, Context.Map.Grid2D_AdvectScalar002.dt, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, Constant2, Constant3, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar);
Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
float Constant6 = 1;
int Constant7 = 1;
int Result1 = ExecIndex();
LinearToIndex_Emitter_SimGrid(0, Result1, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1);
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.Map.Grid2D_AdvectScalar003.VelocityIndex, Context.Map.Grid2D_AdvectScalar003.ScalarIndex, Context.Map.Grid2D_AdvectScalar003.dx, Context.Map.Grid2D_AdvectScalar003.dt, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1, Constant6, Constant7, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1);
Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
float Result2 = In_dt * In_DissipationRate;
float Constant10 = 1;
float Result3 = Result2 + Constant10;
float Result4 = In_FloatValue / Result3;
float Result5 = In_SubtractionAmount * In_dt;
float Result6 = Result4 - Result5;
float Constant11 = 0;
float Constant12 = 1e+09;
float Result7 = clamp(Result6,Constant11,Constant12);
Out_DissipatedFloat = Result7;
float Constant9 = 0;
NiagaraScript_815_Func_(Context.Map.DissipateFloat.dt, Context.Map.DissipateFloat.DissipationRate, Constant9, Context.Map.DissipateFloat.FloatValue, NiagaraScript_815_Func_Output_DissipatedFloat, Context);
Context.Map.OUTPUT_VAR.DissipateFloat.DissipatedFloat = NiagaraScript_815_Func_Output_DissipatedFloat;
float Constant14 = 0;
NiagaraScript_815_Func_(Context.Map.DissipateFloat001.dt, Context.Map.DissipateFloat001.DissipationRate, Constant14, Context.Map.DissipateFloat001.FloatValue, NiagaraScript_815_Func_Output_DissipatedFloat1, Context);
Context.Map.OUTPUT_VAR.DissipateFloat001.DissipatedFloat = NiagaraScript_815_Func_Output_DissipatedFloat1;
Context.Map.Transient.Boundary = Context.Map.SetVariables_49366F1C4BCFBA536A86108A2DBB4F43.Transient.Boundary;
CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_(Context.Map.MaskFloatByBoundary.FloatValue, Context.Map.Emitter.SimGrid.Boundary, CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output);
CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_(Context.Map.MaskFloatByBoundary001.FloatValue, Context.Map.Emitter.SimGrid.Boundary, CustomHlsl807CDB8442B93311A36B43A73A3CDBA1_Func_Output_Output1);
Context.Map.Emitter.SimGrid.Density = Context.Map.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Density;
Context.Map.Emitter.SimGrid.Temperature = Context.Map.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Temperature;
GetGridValue_Emitter_SimGrid(0, In_IndexX+1, In_IndexY, In_VectorIndex+1, Vy_right);
GetGridValue_Emitter_SimGrid(0, In_IndexX-1, In_IndexY, In_VectorIndex+1, Vy_left);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY+1, In_VectorIndex, Vx_up);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY-1, In_VectorIndex, Vx_down);
ExecutionIndexToGridIndex_Emitter_SimGrid(0, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY);
CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_(Context.Map.Grid2D_ComputeCurl.dx, Context.Map.Grid2D_ComputeCurl.VectorIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_Output_curl);
Context.Map.OUTPUT_VAR.Grid2D_ComputeCurl.Curl = CustomHlslD51E7C90458BF95013D755B04B1C65E8Emitter_SimGrid_Func_Output_curl;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(1, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, Context.Map.ScratchModule_02001.Value);
float Constant18 = 0;
float Constant19 = 0;
ExecutionIndexToGridIndex_Emitter_SimGrid(0, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1);
float4 Output1;
Output1.r = Context.Map.Grid2D_Gas_SetRTValues.Red;
Output1.g = Context.Map.Grid2D_Gas_SetRTValues.Green;
Output1.b = Constant18;
Output1.a = Constant19;
SetRenderTargetValue_Emitter_SimRT_UEImpureCall(2, Context.Map.Grid2D_Gas_SetRTValues.Enabled, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, Output1);
int Constant = 1;
Context.Map.Grid2D_AdvectScalar002.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_AdvectScalar002.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_AdvectScalar002.ScalarIndex = Context.Map.Emitter.SimGrid_DensityIndex;
Context.Map.Grid2D_AdvectScalar002.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid2D_AdvectScalar002.InterpolationMethod = Constant;
EnterStatScope(1 /**Grid2D_AdvectScalar002_Emitter_Func_*/);
Context.Map.Grid2D_AdvectScalar003.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_AdvectScalar003.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_AdvectScalar003.ScalarIndex = Context.Map.Emitter.SimGrid_TemperatureIndex;
Context.Map.Grid2D_AdvectScalar003.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid2D_AdvectScalar003.InterpolationMethod = Constant4;
float Constant5 = 1;
EnterStatScope(2 /**Grid2D_AdvectScalar003_Emitter_Func_*/);
Context.Map.DissipateFloat.dt = Context.Map.Emitter.dt;
Context.Map.DissipateFloat.DissipationRate = Context.Map.Emitter.fluids_solver_dissipationDensity;
Context.Map.DissipateFloat.FloatValue = Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar;
EnterStatScope(3 /**DissipateFloat_Emitter_Func_*/);
Context.Map.DissipateFloat001.dt = Context.Map.Emitter.dt;
Context.Map.DissipateFloat001.DissipationRate = Context.Map.Emitter.fluids_solver_dissipationTemperature;
Context.Map.DissipateFloat001.FloatValue = Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar;
float Constant13 = 0;
EnterStatScope(4 /**DissipateFloat001_Emitter_Func_*/);
Context.Map.SetVariables_49366F1C4BCFBA536A86108A2DBB4F43.Transient.Boundary = Context.Map.Emitter.SimGrid.Boundary;
EnterStatScope(5 /**SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_*/);
Context.Map.MaskFloatByBoundary.FloatValue = Context.Map.OUTPUT_VAR.DissipateFloat.DissipatedFloat;
Context.Map.MaskFloatByBoundary001.FloatValue = Context.Map.OUTPUT_VAR.DissipateFloat001.DissipatedFloat;
Context.Map.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Density = MaskFloatByBoundary_Emitter_Func_Output_Output;
Context.Map.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Temperature = MaskFloatByBoundary001_Emitter_Func_Output_Output;
EnterStatScope(6 /**SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_*/);
Context.Map.Grid2D_ComputeCurl.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_ComputeCurl.VectorIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
EnterStatScope(7 /**Grid2D_ComputeCurl_Emitter_Func_*/);
Context.Map.ScratchModule_02001.Value = Context.Map.OUTPUT_VAR.Grid2D_ComputeCurl.Curl;
EnterStatScope(8 /**ScratchModule_02001_Emitter_Func_*/);
Context.Map.Grid2D_Gas_SetRTValues.Red = Context.Map.Emitter.SimGrid.Density;
Context.Map.Grid2D_Gas_SetRTValues.Green = Context.Map.Emitter.SimGrid.Temperature;
float Constant15 = 0;
float Constant16 = 0;
bool Constant17 = true;
Context.Map.Grid2D_Gas_SetRTValues.Enabled = Constant17;
EnterStatScope(9 /**Grid2D_Gas_SetRTValues_Emitter_Func_*/);
EnterStatScope(10 /**SimulationStage_1_1_Main*/);
Context.Map.Emitter.SimGrid_DensityIndex = Emitter_SimGrid_DensityIndex;
Context.Map.Emitter.SimGrid_VelocityIndex = Emitter_SimGrid_VelocityIndex;
Context.Map.Emitter.SimGrid_TemperatureIndex = Emitter_SimGrid_TemperatureIndex;
Context.Map.Emitter.fluids_solver_dissipationDensity = Emitter_fluids_solver_dissipationDensity;
Context.Map.Emitter.fluids_solver_dissipationTemperature = Emitter_fluids_solver_dissipationTemperature;
Context.Map.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
Context.Map.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
EnterStatScope(11 /**SimulationStage_1_1_MapMain*/);
void ExecutionIndexToUnit_Emitter_LightingGridDownsample(int In_InstanceData, out float2 Out_Unit);
void SampleGrid_Emitter_SimGrid(int In_InstanceData, float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void GetNumCells_Emitter_LightingGridDownsample(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY);
void UnitToIndex_Emitter_LightingGridDownsample(int In_InstanceData, float2 In_Unit, out int Out_IndexX, out int Out_IndexY);
void SetGridValue_Emitter_LightingGridDownsample(int In_InstanceData, int In_IndexX, int In_IndexY, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
GetNumCells_Emitter_LightingGridDownsample(1, numCellsX, numCellsY);
SampleGrid_Emitter_SimGrid(0, In_UnitCoordinates.x+length.x,  In_UnitCoordinates.y,  In_HighResAttribute,  t1);
SampleGrid_Emitter_SimGrid(0, In_UnitCoordinates.x-length.x,  In_UnitCoordinates.y,  In_HighResAttribute,  t2);
SampleGrid_Emitter_SimGrid(0, In_UnitCoordinates.x,  In_UnitCoordinates.y+length.y,  In_HighResAttribute,  t3);
SampleGrid_Emitter_SimGrid(0, In_UnitCoordinates.x,  In_UnitCoordinates.y-length.y,  In_HighResAttribute,  t4);
UnitToIndex_Emitter_LightingGridDownsample(1, In_UnitCoordinates.xy, IndexX, IndexY);
SetGridValue_Emitter_LightingGridDownsample(1, IndexX, IndexY, In_LowResAttribute, temperature, Ignore);
ExecutionIndexToUnit_Emitter_LightingGridDownsample(1, ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit);
DownsampleSimGrid19C51F204EDB6C68C8426CA765CB7155Emitter_SimGridEmitter_LightingGridDownsample_Func_(ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit, Context.Map.Grid2D_DownsampleScalar.HighResolutionAttribute, Constant1, Context);
Context.Map.Grid2D_DownsampleScalar.HighResolutionAttribute = Context.Map.Emitter.SimGrid_TemperatureIndex;
EnterStatScope(1 /**Grid2D_DownsampleScalar_Emitter_Func_*/);
void GetViewSpaceTransformsGPU_Emitter_CameraQuery(int In_InstanceData, out float4x4 Out_TranslatedWorldToViewTransform, out float4x4 Out_ViewToTranslatedWorldTransform, out float4x4 Out_TranslatedWorldToCameraViewTransform, out float4x4 Out_CameraViewToTranslatedWorldTransform, out float4x4 Out_ViewToClipTransform, out float4x4 Out_ViewToClipNoAATransform);
void GetNumCells_Emitter_SimGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY);
void SampleGrid_Emitter_LightingGridDownsample(int In_InstanceData, float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void SetRenderTargetValue_Emitter_LightingRT_UEImpureCall(int In_InstanceData, bool In_Enabled, int In_IndexX, int In_IndexY, float4 In_Value);
GetViewSpaceTransformsGPU_Emitter_CameraQuery(0, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform);
float4 Output11;
Output11.x = X;
Output11.y = Y;
Output11.z = Z;
Output11.w = Constant2;
float4 Result = mul(Output11,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform);
float Constant3 = 1;
float4 Result1 = Result * Constant3;
X1 = Result1.x;
Y1 = Result1.y;
Z1 = Result1.z;
W = Result1.w;
float2 Output12;
Output12.x = X1;
Output12.y = Y1;
Output13.x = X1;
Output13.y = Y1;
Output13.z = Z1;
Out_TangentDirectionVector2d = Output12;
Out_TangentDirectionVector = Output13;
GetNumCells_Emitter_SimGrid(1, numCellsX, numCellsY);
   SampleGrid_Emitter_SimGrid(1, In_UnitCoordinates.x,  In_UnitCoordinates.y,  In_DensityIndex,  d);
       SampleGrid_Emitter_SimGrid(1, coordinates.x,  coordinates.y,  In_DensityIndex,  neighborDensity);
GetViewSpaceTransformsGPU_Emitter_CameraQuery(0, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform1, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform1);
float4 Output14;
Output14.x = X2;
Output14.y = Y2;
Output14.z = Z2;
Output14.w = Constant8;
float4 Result3 = mul(Output14,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform1);
float Constant9 = 1;
float4 Result4 = Result3 * Constant9;
X3 = Result4.x;
Y3 = Result4.y;
Z3 = Result4.z;
W1 = Result4.w;
float2 Output15;
Output15.x = X3;
Output15.y = Y3;
Output16.x = X3;
Output16.y = Y3;
Output16.z = Z3;
Out_TangentDirectionVector2d = Output15;
Out_TangentDirectionVector = Output16;
SampleGrid_Emitter_LightingGridDownsample(2, In_UnitCoordinates.x,  In_UnitCoordinates.y,  0,  multipleScattering);
SampleGrid_Emitter_LightingGridDownsample(2, In_UnitCoordinates.x+length,  In_UnitCoordinates.y,  0,  ms1);
SampleGrid_Emitter_LightingGridDownsample(2, In_UnitCoordinates.x-length,  In_UnitCoordinates.y,  0,  ms2);
SampleGrid_Emitter_LightingGridDownsample(2, In_UnitCoordinates.x,  In_UnitCoordinates.y+length,  0,  ms3);
SampleGrid_Emitter_LightingGridDownsample(2, In_UnitCoordinates.x,  In_UnitCoordinates.y-length,  0,  ms4);
float Constant = 16;
float Constant1 = 60;
IndexToUnit_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, IndexToUnit_Emitter_SimGridOutput_Unit);
float2 Output1;
Output1.x = IndexToUnit_Emitter_SimGridOutput_Unit.x;
Output1.y = IndexToUnit_Emitter_SimGridOutput_Unit.y;
Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_(Context.Map.Grid2D_ComputeLighting.SunDirection, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector, Context);
float Constant4 = 1;
float Result2 = Context.Map.Grid2D_ComputeLighting.ShadowStrengthSun * Constant4;
ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_(Constant, Constant1, Output1, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d, Result2, Constant5, Context.Map.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
float Constant6 = 8;
float Constant7 = 32;
Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_(Context.Map.Grid2D_ComputeLighting.EnvironmentDirection, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector, Context);
float Result5 = Context.Map.Grid2D_ComputeLighting.ShadowStrengthEnvironment * Constant10;
int Constant11 = 1;
ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_(Constant6, Constant7, Output1, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Result5, Constant11, Context.Map.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_(Output1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value, Context);
float3 Output17;
Output17.x = ComputeLightingSun104BE13842DB9FA6317B7E8D7D608C44Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output17.y = ComputeLightingEnvironment3C09FADC4900DA2BDBB017831E2D5547Emitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output17.z = ComputeLightingTemperature8DA29B374002E5027EAB20B0DC1766A2Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value;
Context.Map.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting = Output17;
float Constant15 = (0.0);
float NiagaraFloat_SelectResult = Constant15;
NiagaraFloat_SelectResult = X4;
NiagaraFloat_SelectResult = Y4;
NiagaraFloat_SelectResult = Z4;
Out_Float = NiagaraFloat_SelectResult;
NiagaraScript_836_Particle_Func_(Context.Map.MakeFloatFromVector.VECTOR_VAR, Context.Map.MakeFloatFromVector.Channel, NiagaraScript_836_Particle_Func_Output_Float, Context);
NiagaraScript_836_Particle_Func_(Context.Map.MakeFloatFromVector001.VECTOR_VAR, Context.Map.MakeFloatFromVector001.Channel, NiagaraScript_836_Particle_Func_Output_Float1, Context);
NiagaraScript_836_Particle_Func_(Context.Map.MakeFloatFromVector002.VECTOR_VAR, Context.Map.MakeFloatFromVector002.Channel, NiagaraScript_836_Particle_Func_Output_Float2, Context);
ExecutionIndexToGridIndex_Emitter_SimGrid(1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1);
float4 Output18;
Output18.r = Context.Map.Grid2D_Gas_SetRTValues001.Red;
Output18.g = Context.Map.Grid2D_Gas_SetRTValues001.Green;
Output18.b = Context.Map.Grid2D_Gas_SetRTValues001.Blue;
Output18.a = Constant18;
SetRenderTargetValue_Emitter_LightingRT_UEImpureCall(3, Context.Map.Grid2D_Gas_SetRTValues001.Enabled, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY1, Output18);
Context.Map.Grid2D_ComputeLighting.SunDirection = Context.Map.Emitter.fluids_lighting_sunDirection;
Context.Map.Grid2D_ComputeLighting.EnvironmentDirection = Context.Map.Emitter.fluids_lighting_environmentDirection;
Context.Map.Grid2D_ComputeLighting.ShadowStrengthEnvironment = Context.Map.Emitter.ShadowDensityMult;
Context.Map.Grid2D_ComputeLighting.ShadowStrengthSun = Context.Map.Emitter.ShadowDensityMult;
Context.Map.Grid2D_ComputeLighting.DensityIndex = Context.Map.Emitter.SimGrid_DensityIndex;
EnterStatScope(1 /**Grid2D_ComputeLighting_Emitter_Func_*/);
int Constant12 = 1;
int Constant13 = 2;
Context.Map.MakeFloatFromVector.VECTOR_VAR = Context.Map.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.Map.MakeFloatFromVector001.VECTOR_VAR = Context.Map.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.Map.MakeFloatFromVector001.Channel = Constant12;
Context.Map.MakeFloatFromVector002.VECTOR_VAR = Context.Map.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.Map.MakeFloatFromVector002.Channel = Constant13;
Context.Map.MakeFloatFromVector.Channel = Constant14;
Context.Map.Grid2D_Gas_SetRTValues001.Red = MakeFloatFromVector_Emitter_Func_Output_Float;
Context.Map.Grid2D_Gas_SetRTValues001.Green = MakeFloatFromVector001_Emitter_Func_Output_Float;
Context.Map.Grid2D_Gas_SetRTValues001.Blue = MakeFloatFromVector002_Emitter_Func_Output_Float;
Context.Map.Grid2D_Gas_SetRTValues001.Enabled = Constant17;
EnterStatScope(2 /**Grid2D_Gas_SetRTValues001_Emitter_Func_*/);
EnterStatScope(3 /**SimulationStage_1_1_Main*/);
Context.Map.Emitter.fluids_lighting_sunDirection = Emitter_fluids_lighting_sunDirection;
Context.Map.Emitter.fluids_lighting_environmentDirection = Emitter_fluids_lighting_environmentDirection;
Context.Map.Emitter.ShadowDensityMult = Emitter_ShadowDensityMult;
EnterStatScope(4 /**SimulationStage_1_1_MapMain*/);
void ExecutionIndexToUnit_Emitter_SimGrid(int In_InstanceData, out float2 Out_Unit);
void SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, float2 In_Unit, out float2 Out_Value);
void SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperature(int In_InstanceData, float2 In_Unit, out float Out_Value);
void SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensity(int In_InstanceData, float2 In_Unit, out float Out_Value);
void UnitToSimulation_Emitter_SimGrid(int In_InstanceData, float3 In_Unit, float4x4 In_UnitToSimulationTransform, out float3 Out_Simulation);
void QuerySceneDepthGPU_Emitter_CollisionQuery(int In_InstanceData, float3 In_DepthSamplePosWorld, out float Out_SceneDepth, out float3 Out_CameraPosWorld, out bool Out_IsInsideView, out float3 Out_SamplePosWorld, out float3 Out_SampleWorldNormal);
void ExecutionIndexToGridIndex_Emitter_SourceGrid(int In_InstanceData, out int Out_IndexX, out int Out_IndexY);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensity(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperature(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, out float2 Out_Value);
void GetGridValue_Emitter_TemporaryGrid(int In_InstanceData, int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
CustomHlsl673BB53B4107160B5025A782D355320A_Func_(Context.Map.Grid2D_ResampleFromOwnerMotion.WorldToUnit, Context.Map.Grid2D_ResampleFromOwnerMotion.PreviousWorldToUnit, Constant1, CustomHlsl673BB53B4107160B5025A782D355320A_Func_Output_OutMatrix);
ExecutionIndexToUnit_Emitter_SimGrid(0, ExecutionIndexToUnit_Emitter_SimGridOutput_Unit);
Output1.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.x;
Output1.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.y;
Output1.z = Constant2;
float3 Result = mul(float4(Output1,1.0),Context.Map.Grid2D_ResampleFromOwnerMotion.UnitToWorld).xyz;
float3 Result1 = mul(float4(Result,1.0),CustomHlsl673BB53B4107160B5025A782D355320A_Func_Output_OutMatrix).xyz;
Output11.x = Result1.x;
Output11.y = Result1.y;
SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocity(0, Output11, SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperature(0, Output11, SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperatureOutput_Value);
SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensity(0, Output11, SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensityOutput_Value);
Context.Map.Emitter.SimGrid.Velocity = SamplePreviousGridVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value;
Context.Map.Emitter.SimGrid.Temperature = SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeTemperatureOutput_Value;
Context.Map.Emitter.SimGrid.Density = SamplePreviousGridFloatValue_Emitter_SimGrid_AttributeDensityOutput_Value;
ExecutionIndexToUnit_Emitter_SimGrid(0, ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1);
Output12.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output12.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output12.z = Constant11;
UnitToSimulation_Emitter_SimGrid(0, Output12, Context.Map.ComputeBoundaryGrid2D.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation);
QuerySceneDepthGPU_Emitter_CollisionQuery(1, UnitToSimulation_Emitter_SimGridOutput_Simulation, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SceneDepth, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_CameraPosWorld, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_IsInsideView, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld, QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SampleWorldNormal);
Output13.x = UnitToSimulation_Emitter_SimGridOutput_Simulation.x;
Output13.y = UnitToSimulation_Emitter_SimGridOutput_Simulation.y;
Output13.z = UnitToSimulation_Emitter_SimGridOutput_Simulation.z;
float3 Result2 = QuerySceneDepthGPU_Emitter_CollisionQueryOutput_SamplePosWorld - Output13;
float Result3 = length(Result2);
float Constant12 = 15;
bool Result4 = NiagaraAll(Result3 < Constant12);
float Constant13 = 1;
int Constant14 = 2;
GetNumCells_Emitter_SimGrid(0, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY);
CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, Constant14, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, Context.Map.ComputeBoundaryGrid2D.OpenBoundaryRight, Context.Map.ComputeBoundaryGrid2D.OpenBoundaryLeft, Context.Map.ComputeBoundaryGrid2D.OpenBoundaryUp, Context.Map.ComputeBoundaryGrid2D.OpenBoundaryDown, CustomHlsl7AA3DEF1417E5B35CB98FAA34E2624C7_Func_Output_Boundary);
float_IfResult = Constant13;
float Constant15 = 1;
Context.Map.OUTPUT_VAR.ComputeBoundaryGrid2D.Boundary = float_IfResult;
ExecutionIndexToGridIndex_Emitter_SourceGrid(2, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY);
GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensity(2, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY, GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value);
GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperature(2, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY, GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value);
GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocity(2, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY, GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value);
Context.Map.OUTPUT_VAR.ScratchModule001.Density = GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value;
Context.Map.OUTPUT_VAR.ScratchModule001.Temperature = GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value;
Context.Map.OUTPUT_VAR.ScratchModule001.Velocity = GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value;
Context.Map.Transient.TmpVelocity = Context.Map.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpVelocity;
Context.Map.Transient.TmpDensity = Context.Map.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpDensity;
Context.Map.Transient.TmpTemperature = Context.Map.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpTemperature;
float Result5 = max(Context.Map.Transient.TmpDensity, Context.Map.Emitter.SimGrid.Density);
Out_Output = Result5;
CustomHlsl81F4FE1D4EF3CE7337D446B210754B64_Func_(Context.Map.Transient.TmpVelocity, Context.Map.Emitter.SimGrid.Velocity, CustomHlsl81F4FE1D4EF3CE7337D446B210754B64_Func_Output_V);
float Result6 = max(Context.Map.Emitter.SimGrid.Temperature, Context.Map.Transient.TmpTemperature);
Out_Output = Result6;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Velocity;
Context.Map.Emitter.SimGrid.Density = Context.Map.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Density;
Context.Map.Emitter.SimGrid.Temperature = Context.Map.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Temperature;
Context.Map.Emitter.SimGrid.Boundary = Context.Map.SetVariables_9A5606CD480032B7102900A8757C50F2.Emitter.SimGrid.Boundary;
GetGridValue_Emitter_TemporaryGrid(3, In_IndexX+1, In_IndexY, In_ScalarIndex, S_right);
GetGridValue_Emitter_TemporaryGrid(3, In_IndexX-1, In_IndexY, In_ScalarIndex, S_left);
GetGridValue_Emitter_TemporaryGrid(3, In_IndexX, In_IndexY+1, In_ScalarIndex, S_up);
GetGridValue_Emitter_TemporaryGrid(3, In_IndexX, In_IndexY-1, In_ScalarIndex, S_down);
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(3, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY);
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_(Context.Map.Grid2D_ComputeGradient001.dx, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, Context.Map.Grid2D_ComputeGradient001.ScalarIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_Output_Grad);
Context.Map.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_TemporaryGrid_Func_Output_Grad;
CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_(Context.Map.VorticityConfinementForceGrid2D.dx, Context.Map.VorticityConfinementForceGrid2D.GradCurl, Context.Map.VorticityConfinementForceGrid2D.VorticityMult, CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_Output_VC_Force);
float2 Result7 = Context.Map.Transient.PhysicsForce + CustomHlsl8CDC34A240CCEF9AD50A839D76D054C2_Func_Output_VC_Force;
Context.Map.Transient.PhysicsForce = Result7;
float Constant20 = 1;
float Result8 = Constant20 * Context.Map.Multiply_Float001.B;
Out_Result = Result8;
float Constant22 = -1;
float Result9 = Constant22 * Context.Map.Multiply_Float008.B;
Out_Result = Result9;
CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_(Context.Map.Grid2D_Gas_3DBuoyancy.DensityBuoyancy, Context.Map.Emitter.SimGrid.Density, Context.Map.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy, Context.Map.Emitter.SimGrid.Temperature, Context.Map.Grid2D_Gas_3DBuoyancy.g, CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_Output_Force);
float3 Result10 = Context.Map.Transient.PhysicsForceWorld + CustomHlsl1EDF8AC24F9709F796E9D0870D247FFC_Func_Output_Force;
Context.Map.Transient.PhysicsForceWorld = Result10;
float Constant28 = 1;
float Constant29 = 1;
ExecutionIndexToUnit_Emitter_SimGrid(0, ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2);
float Constant30 = 0;
float3 Output14;
Output14.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2.x;
Output14.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit2.y;
Output14.z = Constant30;
UnitToSimulation_Emitter_SimGrid(0, Output14, Context.Map.Grid2D_TurbulenceForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation1);
float Result11 = Context.Map.Engine.Time * Constant29;
TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_(Constant27, Constant28, UnitToSimulation_Emitter_SimGridOutput_Simulation1, Result11, TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_Output_TurbulenceForce);
float2 Result12 = TurbulenceForce1A920C854570890F49C6B6A4BE8A966C_Func_Output_TurbulenceForce + Context.Map.Transient.PhysicsForce;
Context.Map.Transient.PhysicsForce = Result12;
float Result14 = dot(In_V,In_V);
float Result15 = In_Threshold * In_Threshold;
bool Result16 = NiagaraAll(Result14 < Result15);
float Result17 = length(In_Fallback);
float Result18 = rsqrt(Result14);
float3 Result19 = In_V * Result18;
float Result20 = Reciprocal(Result18);
float3 Constant38 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult = Constant38;
float Constant39 = (0.0);
float Length_SelectResult = Constant39;
Direction_SelectResult = In_Fallback;
Length_SelectResult = Result17;
Direction_SelectResult = Result19;
Length_SelectResult = Result20;
Out_Direction = Direction_SelectResult;
Out_Length = Length_SelectResult;
Out_BelowThreshold = Result16;
float3 Constant33 = float3(1,1,0);
float Constant34 = 0.5;
ExecutionIndexToUnit_Emitter_SimGrid(0, ExecutionIndexToUnit_Emitter_SimGridOutput_Unit3);
float Constant35 = 0;
Output15.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit3.x;
Output15.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit3.y;
Output15.z = Constant35;
UnitToSimulation_Emitter_SimGrid(0, Output15, Context.Map.Grid2D_WindForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation2);
float3 Result13 = mul(float4(UnitToSimulation_Emitter_SimGridOutput_Simulation2,1.0),Context.Map.Grid2D_WindForce.WorldToLocal).xyz;
float3 Constant36 = float3(0,0,1);
float Constant37 = 1e-05;
NiagaraScript_799_Particle_Func_(Constant33, Constant36, Constant37, NiagaraScript_799_Particle_Func_Output_Direction, NiagaraScript_799_Particle_Func_Output_Length, NiagaraScript_799_Particle_Func_Output_BelowThreshold, Context);
float3 Result21 = mul(float4(NiagaraScript_799_Particle_Func_Output_Direction,0.0),Context.Map.Grid2D_WindForce.WorldToLocal).xyz;
WindForce5644C4204BEF67FC22121D96EC483B74_Func_(Result13, Result21, Context.Map.Grid2D_WindForce.dx, Constant34, WindForce5644C4204BEF67FC22121D96EC483B74_Func_Output_WindForce2D);
float2 Result22 = WindForce5644C4204BEF67FC22121D96EC483B74_Func_Output_WindForce2D + Context.Map.Transient.PhysicsForce;
Context.Map.Transient.PhysicsForce = Result22;
float Constant41 = 0;
float3 Result23 = Context.Map.Grid2D_OwnerMotionForce.OwnerMotionAcceleration * Constant41;
float3 Result24 = Context.Map.Transient.PhysicsForceWorld + Result23;
Context.Map.Transient.PhysicsForceWorld = Result24;
float4x4 Result25 = transpose(Context.Map.Grid2D_IntegrateForces.WorldToLocal);
float3 Result26 = mul(float4(Context.Map.Transient.PhysicsForceWorld,0.0),Result25).xyz;
float2 Output16;
Output16.x = Result26.x;
Output16.y = Result26.y;
float2 Result27 = Context.Map.Transient.PhysicsForce + Output16;
float2 Result28 = Result27 * Context.Map.Grid2D_IntegrateForces.dt;
float2 Result29 = Context.Map.Grid2D_IntegrateForces.Velocity + Result28;
Context.Map.OUTPUT_VAR.Grid2D_IntegrateForces.NewVelocity = Result29;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_C54322844BB05B548FF0B8B0DC931DEE.Emitter.SimGrid.Velocity;
Context.Map.Grid2D_ResampleFromOwnerMotion.PreviousWorldToUnit = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform001.WorldToUnit;
Context.Map.Grid2D_ResampleFromOwnerMotion.UnitToWorld = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.Map.Grid2D_ResampleFromOwnerMotion.WorldToUnit = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToUnit;
float Constant = 1;
EnterStatScope(1 /**Grid2D_ResampleFromOwnerMotion_Emitter_Func_*/);
bool Constant3 = true;
bool Constant4 = false;
bool Constant5 = false;
bool Constant6 = false;
int Constant8 = 0;
Context.Map.ComputeBoundaryGrid2D.UnitToWorld = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.Map.ComputeBoundaryGrid2D.dt = Context.Map.Emitter.dt;
Context.Map.ComputeBoundaryGrid2D.WorldToLocal = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.Map.ComputeBoundaryGrid2D.OpenBoundaryUp = Constant3;
Context.Map.ComputeBoundaryGrid2D.OpenBoundaryRight = Constant4;
Context.Map.ComputeBoundaryGrid2D.OpenBoundaryDown = Constant5;
Context.Map.ComputeBoundaryGrid2D.OpenBoundaryLeft = Constant6;
Context.Map.ComputeBoundaryGrid2D.UseSolidVelocity = Constant7;
Context.Map.ComputeBoundaryGrid2D.UseGBufferVelocity = Constant8;
float Constant9 = 15;
EnterStatScope(2 /**ComputeBoundaryGrid2D_Emitter_Func_*/);
EnterStatScope(3 /**ScratchModule001_Emitter_Func_*/);
Context.Map.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpDensity = Context.Map.OUTPUT_VAR.ScratchModule001.Density;
Context.Map.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpTemperature = Context.Map.OUTPUT_VAR.ScratchModule001.Temperature;
Context.Map.SetVariables_CE3F24D742499C1EFA32EB978D87038A.Transient.TmpVelocity = Context.Map.OUTPUT_VAR.ScratchModule001.Velocity;
EnterStatScope(4 /**SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_*/);
Context.Map.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Density = ScratchDynamicInput_32_Emitter_Func_Output_Output;
Context.Map.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Velocity = ScratchDynamicInput001_Emitter_Func_Output_Output;
Context.Map.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Temperature = ScratchDynamicInput002_Emitter_Func_Output_Output;
EnterStatScope(5 /**SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_*/);
Context.Map.SetVariables_9A5606CD480032B7102900A8757C50F2.Emitter.SimGrid.Boundary = Context.Map.OUTPUT_VAR.ComputeBoundaryGrid2D.Boundary;
EnterStatScope(6 /**SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_*/);
Context.Map.Grid2D_ComputeGradient001.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_ComputeGradient001.ScalarIndex = Context.Map.Emitter.SimGrid_SimFloatIndex;
EnterStatScope(7 /**Grid2D_ComputeGradient001_Emitter_Func_*/);
Context.Map.VorticityConfinementForceGrid2D.dx = Context.Map.Emitter.dx;
Context.Map.VorticityConfinementForceGrid2D.GradCurl = Context.Map.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad;
Context.Map.VorticityConfinementForceGrid2D.VorticityMult = Context.Map.Emitter.fluids_solver_vorticityConfinement;
float2 Constant18 = float2(0,0);
Context.Map.Transient.PhysicsForce = Constant18;
EnterStatScope(8 /**VorticityConfinementForceGrid2D_Emitter_Func_*/);
Context.Map.Multiply_Float001.B = Context.Map.Emitter.fluids_solver_densityBouyancy;
Context.Map.Multiply_Float008.B = Context.Map.Emitter.fluids_solver_temperatureBouyancy;
float Constant19 = 1;
float Constant21 = -1;
Context.Map.Grid2D_Gas_3DBuoyancy.DensityBuoyancy = Multiply_Float001_Emitter_Func_Output_Result;
Context.Map.Grid2D_Gas_3DBuoyancy.g = Context.Map.Emitter.g;
Context.Map.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy = Multiply_Float008_Emitter_Func_Output_Result;
float3 Constant23 = float3(0,0,0);
Context.Map.Transient.PhysicsForceWorld = Constant23;
EnterStatScope(9 /**Grid2D_Gas_3DBuoyancy_Emitter_Func_*/);
Context.Map.Grid2D_TurbulenceForce.UnitToWorld = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
float Constant24 = 1;
float Constant25 = 1;
float Constant26 = 1;
EnterStatScope(10 /**Grid2D_TurbulenceForce_Emitter_Func_*/);
Context.Map.Grid2D_WindForce.UnitToWorld = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.Map.Grid2D_WindForce.WorldToLocal = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.Map.Grid2D_WindForce.dx = Context.Map.Emitter.dx;
float3 Constant31 = float3(1,1,0);
float Constant32 = 0.5;
EnterStatScope(11 /**Grid2D_WindForce_Emitter_Func_*/);
Context.Map.Grid2D_OwnerMotionForce.OwnerMotionAcceleration = Context.Map.Emitter.ComputeOwnerMotion.Acceleration;
float Constant40 = 0;
EnterStatScope(12 /**Grid2D_OwnerMotionForce_Emitter_Func_*/);
Context.Map.Grid2D_IntegrateForces.Velocity = Context.Map.Emitter.SimGrid.Velocity;
Context.Map.Grid2D_IntegrateForces.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_IntegrateForces.WorldToLocal = Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.LocalToWorldRotation;
EnterStatScope(13 /**Grid2D_IntegrateForces_Emitter_Func_*/);
Context.Map.SetVariables_C54322844BB05B548FF0B8B0DC931DEE.Emitter.SimGrid.Velocity = Context.Map.OUTPUT_VAR.Grid2D_IntegrateForces.NewVelocity;
EnterStatScope(14 /**SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_*/);
EnterStatScope(15 /**SimulationStage_1_1_Main*/);
Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform001.WorldToUnit = Emitter_Grid2D_CreateUnitToWorldTransform001_WorldToUnit;
Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld = Emitter_Grid2D_CreateUnitToWorldTransform_UnitToWorld;
Context.Map.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.Map.Emitter.fluids_solver_vorticityConfinement = Emitter_fluids_solver_vorticityConfinement;
Context.Map.Emitter.fluids_solver_densityBouyancy = Emitter_fluids_solver_densityBouyancy;
Context.Map.Emitter.fluids_solver_temperatureBouyancy = Emitter_fluids_solver_temperatureBouyancy;
Context.Map.Emitter.g = Emitter_g;
Context.Map.Engine.Time = Engine_Time;
Context.Map.Emitter.ComputeOwnerMotion.Acceleration = Emitter_ComputeOwnerMotion_Acceleration;
Context.Map.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.Map.Emitter.Grid2D_CreateUnitToWorldTransform.LocalToWorldRotation = Emitter_Grid2D_CreateUnitToWorldTransform_LocalToWorldRotation;
EnterStatScope(16 /**SimulationStage_1_1_MapMain*/);
void GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.Map.Grid2D_AdvectScalar.VelocityIndex, Context.Map.Grid2D_AdvectScalar.ScalarIndex, Context.Map.Grid2D_AdvectScalar.dx, Context.Map.Grid2D_AdvectScalar.dt, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, Constant2, Constant3, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar);
Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
int Constant5 = 1;
int Result1 = Context.Map.Add_Integer001.A + Constant5;
Out_NewOutput = Result1;
float Constant8 = 1;
int Constant9 = 1;
int Result2 = ExecIndex();
LinearToIndex_Emitter_SimGrid(0, Result2, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1);
CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_(Context.Map.Grid2D_AdvectScalar001.VelocityIndex, Context.Map.Grid2D_AdvectScalar001.ScalarIndex, Context.Map.Grid2D_AdvectScalar001.dx, Context.Map.Grid2D_AdvectScalar001.dt, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1, Constant8, Constant9, CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1);
Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar001.AdvectedScalar = CustomHlsl706BA85C45F835B37A92EC888733867AEmitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
Output1.x = Context.Map.BreakVector2D.X;
Output1.y = Context.Map.BreakVector2D.Y;
Out_Vec2 = Output1;
Context.Map.Emitter.SimGrid.Velocity = Context.Map.SetVariables_47EB198B4D26ACB745967FA215BE495B.Emitter.SimGrid.Velocity;
float Result3 = In_dt * In_DissipationRate;
float Result4 = Result3 + Constant10;
float2 Result5 = In_Vector2DValue / Result4;
Out_DissipatedVector2D = Result5;
NiagaraScript_820_Func_(Context.Map.DissipateVector2D.dt, Context.Map.DissipateVector2D.DissipationRate, Context.Map.DissipateVector2D.VectorValue, NiagaraScript_820_Func_Output_DissipatedVector2D, Context);
Context.Map.OUTPUT_VAR.DissipateVector2D.DissipatedVector2D = NiagaraScript_820_Func_Output_DissipatedVector2D;
int Constant13 = 1;
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(0, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value);
float2 Constant15 = float2(0,0);
float2 Constant16 = float2(0.0, 0.0);
float2 Vector2f_SelectResult = Constant16;
Vector2f_SelectResult = Constant15;
Vector2f_SelectResult = Context.Map.ScratchModule_06.Velocity;
Context.Map.Emitter.SimGrid.Velocity = Vector2f_SelectResult;
Context.Map.Grid2D_AdvectScalar.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_AdvectScalar.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_AdvectScalar.ScalarIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid2D_AdvectScalar.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid2D_AdvectScalar.InterpolationMethod = Constant;
EnterStatScope(1 /**Grid2D_AdvectScalar_Emitter_Func_*/);
Context.Map.Add_Integer001.A = Context.Map.Emitter.SimGrid_VelocityIndex;
int Constant6 = 1;
Context.Map.Grid2D_AdvectScalar001.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_AdvectScalar001.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_AdvectScalar001.ScalarIndex = Add_Integer001_Emitter_Func_Output_NewOutput;
Context.Map.Grid2D_AdvectScalar001.VelocityIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
Context.Map.Grid2D_AdvectScalar001.InterpolationMethod = Constant6;
EnterStatScope(2 /**Grid2D_AdvectScalar001_Emitter_Func_*/);
Context.Map.BreakVector2D.X = Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar.AdvectedScalar;
Context.Map.BreakVector2D.Y = Context.Map.OUTPUT_VAR.Grid2D_AdvectScalar001.AdvectedScalar;
Context.Map.SetVariables_47EB198B4D26ACB745967FA215BE495B.Emitter.SimGrid.Velocity = BreakVector2D_Emitter_Func_Output_Vec2;
EnterStatScope(3 /**SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_*/);
Context.Map.DissipateVector2D.dt = Context.Map.Emitter.dt;
Context.Map.DissipateVector2D.DissipationRate = Context.Map.Emitter.fluids_solver_velocityDissipation;
Context.Map.DissipateVector2D.VectorValue = Context.Map.Emitter.SimGrid.Velocity;
EnterStatScope(4 /**DissipateVector2D_Emitter_Func_*/);
Context.Map.ScratchModule_06.Execute = Constant11;
Context.Map.ScratchModule_06.UseSolidVelocity = Constant12;
Context.Map.ScratchModule_06.Velocity = Context.Map.OUTPUT_VAR.DissipateVector2D.DissipatedVector2D;
EnterStatScope(5 /**ScratchModule_06_Emitter_Func_*/);
EnterStatScope(6 /**SimulationStage_1_1_Main*/);
Context.Map.Emitter.fluids_solver_velocityDissipation = Emitter_fluids_solver_velocityDissipation;
EnterStatScope(7 /**SimulationStage_1_1_MapMain*/);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
GetGridValue_Emitter_SimGrid(0, In_IndexX+1, In_IndexY, In_VectorIndex, Vx_right);
GetGridValue_Emitter_SimGrid(0, In_IndexX-1, In_IndexY, In_VectorIndex, Vx_left);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY+1, In_VectorIndex+1, Vy_up);
GetGridValue_Emitter_SimGrid(0, In_IndexX, In_IndexY-1, In_VectorIndex+1, Vy_down);
CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_(Context.Map.Grid2D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, Context.Map.Grid2D_ComputeDivergence.VectorIndex, CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div);
Context.Map.OUTPUT_VAR.Grid2D_ComputeDivergence.Div = CustomHlsl360A04FC4C69B01C01D9618CB39C7962Emitter_SimGrid_Func_Output_Div;
Context.Map.Emitter.TemporaryGrid.SimFloat = Context.Map.SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118.Emitter.TemporaryGrid.SimFloat;
ExecutionIndexToGridIndex_Emitter_PressureGrid(1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY);
int Constant1 = 1;
float Result = Context.Map.ScratchModule_04.Div / Context.Map.ScratchModule_04.dt;
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, Result);
Context.Map.Grid2D_ComputeDivergence.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_ComputeDivergence.VectorIndex = Context.Map.Emitter.SimGrid_VelocityIndex;
EnterStatScope(1 /**Grid2D_ComputeDivergence_Emitter_Func_*/);
Context.Map.SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118.Emitter.TemporaryGrid.SimFloat = Context.Map.OUTPUT_VAR.Grid2D_ComputeDivergence.Div;
EnterStatScope(2 /**SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_*/);
Context.Map.ScratchModule_04.Div = Context.Map.OUTPUT_VAR.Grid2D_ComputeDivergence.Div;
Context.Map.ScratchModule_04.dt = Context.Map.Emitter.dt;
Context.Map.ScratchModule_04.UseFFT = Constant;
EnterStatScope(3 /**ScratchModule_04_Emitter_Func_*/);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, out float2 Out_Value);
void GetFloatValue_Emitter_PressureGrid_AttributePressure(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY);
GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(0, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value);
Context.Map.Transient.Divergence = GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloatOutput_Value;
GetFloatValue_Emitter_PressureGrid_AttributePressure(1, In_IndexX+1, In_IndexY, Out_P_right);
GetFloatValue_Emitter_PressureGrid_AttributePressure(1, In_IndexX-1, In_IndexY, Out_P_left);
GetFloatValue_Emitter_PressureGrid_AttributePressure(1, In_IndexX, In_IndexY+1, Out_P_up);
GetFloatValue_Emitter_PressureGrid_AttributePressure(1, In_IndexX, In_IndexY-1, Out_P_down);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(2, In_IndexX+1, In_IndexY, Out_B_right);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(2, In_IndexX-1, In_IndexY, Out_B_left);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(2, In_IndexX, In_IndexY+1, Out_B_up);
GetFloatValue_Emitter_SimGrid_AttributeBoundary(2, In_IndexX, In_IndexY-1, Out_B_down);
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value);
GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value);
CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_right, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_left, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_up, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_down);
CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_right, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_left, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_up, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_down);
CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_(Context.Map.Grid2D_PressureIteration.dx, Context.Map.Grid2D_PressureIteration.dt, Constant2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, Context.Map.Grid2D_PressureIteration.Divergence, GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value, NiagaraScript_827_Func_Output_IterationIndex, Context.Map.Grid2D_PressureIteration.Relaxation, Context.Map.Emitter.PressureGrid.Pressure, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_right, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_left, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_up, CustomHlsl8D28223E4B23F2B1B56AC0BE6D40FB88Emitter_PressureGrid_Func_Output_P_down, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_right, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_left, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_up, CustomHlsl0EAA0A274134F3DC33A39BA656915E5DEmitter_SimGrid_Func_Output_B_down, Constant3, Constant4, Constant5, Constant6, CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_Output_Pressure);
Context.Map.OUTPUT_VAR.Grid2D_PressureIteration.Pressure = CustomHlsl20011CBA4012BE1646DB41A6C44D87C8_Func_Output_Pressure;
Context.Map.Emitter.PressureGrid.Pressure = Context.Map.SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91.Emitter.PressureGrid.Pressure;
EnterStatScope(1 /**GetDivergence_Emitter_Func_*/);
Context.Map.Grid2D_PressureIteration.dt = Context.Map.Emitter.dt;
Context.Map.Grid2D_PressureIteration.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_PressureIteration.SolidVelocityIndex = Context.Map.Emitter.SimGrid_SolidVelocityIndex;
Context.Map.Grid2D_PressureIteration.Divergence = Context.Map.Transient.Divergence;
Context.Map.Grid2D_PressureIteration.Relaxation = Context.Map.Emitter.fluids_solver_pressureRelaxation;
Context.Map.Grid2D_PressureIteration.UseSolidVelocity = Constant;
EnterStatScope(2 /**Grid2D_PressureIteration_Emitter_Func_*/);
Context.Map.SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91.Emitter.PressureGrid.Pressure = Context.Map.OUTPUT_VAR.Grid2D_PressureIteration.Pressure;
EnterStatScope(3 /**SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_*/);
Context.Map.Emitter.fluids_solver_pressureRelaxation = Emitter_fluids_solver_pressureRelaxation;
void GetNumCells_Emitter_PressureGrid(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY);
GetNumCells_Emitter_PressureGrid(0, NumCells.x, NumCells.y);
            GetFloatValue_Emitter_PressureGrid_AttributePressure(0, pxl.x, pxl.y, V[0].x);
            GetFloatValue_Emitter_PressureGrid_AttributePressure(0, pxl2.x, pxl2.y, V[1].x);
        GetFloatValue_Emitter_PressureGrid_AttributePressure(0, pxl.x + off.x, pxl.y + off.y, V[0].y);
        GetFloatValue_Emitter_PressureGrid_AttributePressure(0, pxl2.x - off.x, pxl2.y - off.y, V[1].y);
    SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(0, GridIdx.x, GridIdx.y, Val);
   SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(0, GridIdx.x, GridIdx.y, FsinK);
    SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(0, GridIdx.x, GridIdx.y, FsinMmK);
float Result = PI;
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.Map.Grid2D_ComputeFFT.dx, Context.Map.Grid2D_ComputeFFT.Inverse, Context.Map.Grid2D_ComputeFFT.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID, Result, Context.Map.Grid2D_ComputeFFT.bPoissonSolver, Context);
EnterStatScope(0 /**SimulationStage_1_0*/);
Context.Map.Grid2D_ComputeFFT.dx = Context.Map.Emitter.dx;
bool Constant = false;
Context.Map.Grid2D_ComputeFFT.XDirecton = Constant;
bool Constant1 = false;
Context.Map.Grid2D_ComputeFFT.Inverse = Constant1;
bool Constant2 = true;
Context.Map.Grid2D_ComputeFFT.bPoissonSolver = Constant2;
EnterStatScope(1 /**Grid2D_ComputeFFT_Emitter_Func_*/);
ExitStatScope(/**SimulationStage_1_0*/);
EnterStatScope(2 /**SimulationStage_1_0_Main*/);
EnterStatScope(3 /**SimulationStage_1_0_MapMain*/);
ExitStatScope(/**SimulationStage_1_0_MapMain*/);
ExitStatScope(/**SimulationStage_1_0_Main*/);
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.Map.Grid2D_ComputeFFT001.dx, Context.Map.Grid2D_ComputeFFT001.Inverse, Context.Map.Grid2D_ComputeFFT001.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID, Result, Context.Map.Grid2D_ComputeFFT001.bPoissonSolver, Context);
bool Constant = true;
Context.Map.Grid2D_ComputeFFT001.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_ComputeFFT001.XDirecton = Constant;
Context.Map.Grid2D_ComputeFFT001.Inverse = Constant1;
Context.Map.Grid2D_ComputeFFT001.bPoissonSolver = Constant2;
EnterStatScope(1 /**Grid2D_ComputeFFT001_Emitter_Func_*/);
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.Map.Grid2D_ComputeFFT002.dx, Context.Map.Grid2D_ComputeFFT002.Inverse, Context.Map.Grid2D_ComputeFFT002.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID, Result, Context.Map.Grid2D_ComputeFFT002.bPoissonSolver, Context);
bool Constant1 = true;
Context.Map.Grid2D_ComputeFFT002.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_ComputeFFT002.Inverse = Constant;
Context.Map.Grid2D_ComputeFFT002.XDirecton = Constant1;
Context.Map.Grid2D_ComputeFFT002.bPoissonSolver = Constant2;
EnterStatScope(1 /**Grid2D_ComputeFFT002_Emitter_Func_*/);
CustomHlsl001F9A457414CBA84D93D4B4DA770487137Emitter_PressureGrid_Func_(Context.Map.Grid2D_ComputeFFT003.dx, Context.Map.Grid2D_ComputeFFT003.Inverse, Context.Map.Grid2D_ComputeFFT003.XDirecton, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupID, GetGroupID2704B67B4073AF1256539E9A763D1533_Func_Output_GroupThreadID, Result, Context.Map.Grid2D_ComputeFFT003.bPoissonSolver, Context);
Context.Map.Grid2D_ComputeFFT003.dx = Context.Map.Emitter.dx;
Context.Map.Grid2D_ComputeFFT003.Inverse = Constant;
Context.Map.Grid2D_ComputeFFT003.XDirecton = Constant1;
Context.Map.Grid2D_ComputeFFT003.bPoissonSolver = Constant2;
EnterStatScope(1 /**Grid2D_ComputeFFT003_Emitter_Func_*/);
EnterStatScope(0 /**SpawnScript_1_0*/);
ExitStatScope(/**SpawnScript_1_0*/);
EnterStatScope(1 /**SpawnScript_1_0_Main*/);
Context.Map.Particles.UniqueID = 0;
Context.Map.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + ExecIndex();
EnterStatScope(2 /**SpawnScript_1_0_MapMain*/);
ExitStatScope(/**SpawnScript_1_0_MapMain*/);
ExitStatScope(/**SpawnScript_1_0_Main*/);
EnterStatScope(0 /**UpdateScript_1_0*/);
ExitStatScope(/**UpdateScript_1_0*/);
EnterStatScope(1 /**UpdateScript_1_0_Main*/);
Context.Map.Particles.UniqueID = InputDataInt(0, 0);
Context.Map.Array.UniqueID = 0;
EnterStatScope(2 /**UpdateScript_1_0_MapMain*/);
ExitStatScope(/**UpdateScript_1_0_MapMain*/);
ExitStatScope(/**UpdateScript_1_0_Main*/);
ª°p7¥;÷5÷eñò
˜¬'‡{É*"Úë;∞«
Bà;r‚=µç¶⁄
0m4P≈ﬁA;•K¶ó_Î˛
?f;ì<c⁄
∑X;≤˜N€‹H
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
bool DragIgnoreMass;
bool FirstFrame;
float4 ParticleColorScaleFactor;
float PhysicsDeltaTime;
float PhysicsDrag;
float3 PhysicsForce;
float3 PhysicsRotationalForce;
bool HemisphereX;
bool HemisphereY;
bool HemisphereZ;
bool NormalizeThickness;
int OffsetCoordinateSpace;
int SphereCoordinateSpace;
float3 SphereOrigin;
float SphereRadius;
int SurfaceExpansionMode;
float3 Force;
float Mass;
float3 PreviousVelocity;
bool WritetoIntrinsicProperties;
float NormalizedAngle;
float2 SpriteSize;
FParamMap0_SetVariables_BDEC693D447651B764B3B6BBF3065841_Particles Particles;
float4 ColorValueToScale;
float ScaleAlpha;
float Lifetime;
float SpriteRotation;
float4 Color;
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
FParamMap0_Particles_Initial Initial;
float MaterialRandom;
float NormalizedAge;
FParamMap0_Particles_Presolve Presolve;
FParamMap0_Particles_Previous Previous;
float RotationalInertia;
float3 RotationalVelocity;
float3 SphereNormal;
float3 SphereVector;
float IncomingPhysicsDrag;
float3 IncomingPhysicsForce;
float3 CurlNoiseForce;
float3 IncomingPhysicsRotationalForce;
FParamMap0_OUTPUT_VAR_ApplyInitialForces ApplyInitialForces;
FParamMap0_OUTPUT_VAR_CurlNoiseForce CurlNoiseForce;
FParamMap0_OUTPUT_VAR_ParticleState ParticleState;
FParamMap0_OUTPUT_VAR_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_OUTPUT_VAR_SphereLocation SphereLocation;
float A;
float3 DragVelocity;
float InverseMass;
float AgeAdvancement;
float DeterministicOffset;
float3 SampledNoise;
float3 SamplePosition;
FParamMap0_Local_CurlNoiseForce CurlNoiseForce;
FParamMap0_Local_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_Local_SphereLocation SphereLocation;
float Alpha;
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
float VelocityScale;
float CurveIndex;
float ScaleCurve;
int ExecutionCount;
float SpawnRate;
bool Alive;
float CurlNoiseConeMaskAngle;
float3 CurlNoiseConeMaskAxis;
float CurlNoiseConeMaskFalloffAngle;
int Position;
int SpriteRotation;
int SpriteSize;
int Velocity;
int PhysicsForce;
int Color;
int Age;
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
FParamMap0_Array_Initial Initial;
int Lifetime;
int Mass;
int MaterialRandom;
int NormalizedAge;
FParamMap0_Array_Presolve Presolve;
FParamMap0_Array_Previous Previous;
int RotationalInertia;
int RotationalVelocity;
int Scale;
bool ApplyForcetoPosition;
bool ApplyForcetoVelocity;
bool ApplyRotationalForcetoRotationalVelocity;
FParamMap0_ApplyInitialForces ApplyInitialForces;
FParamMap0_CurlNoiseForce CurlNoiseForce;
FParamMap0_DataInstance DataInstance;
FParamMap0_FloatFromCurve FloatFromCurve;
FParamMap0_FloatFromCurve001 FloatFromCurve001;
FParamMap0_FloatFromCurve004 FloatFromCurve004;
FParamMap0_Fluids_Gas_Source Fluids_Gas_Source;
FParamMap0_InitializeParticle InitializeParticle;
FParamMap0_Interpolation Interpolation;
FParamMap0_Lerp_Float Lerp_Float;
FParamMap0_Multiply_Float Multiply_Float;
FParamMap0_ParticleState ParticleState;
FParamMap0_ScaleColor ScaleColor;
FParamMap0_SetVariables_BDEC693D447651B764B3B6BBF3065841 SetVariables_BDEC693D447651B764B3B6BBF3065841;
FParamMap0_Sine Sine;
FParamMap0_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_SphereLocation SphereLocation;
FParamMap0_Vector2DFromFloat Vector2DFromFloat;
FParamMap0_Vector2DFromFloat001 Vector2DFromFloat001;
void NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat003_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat001_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void Vector2DFromFloat_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void RandomRangeFloat_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void NiagaraScript_753_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void NiagaraScript_759_Func_(float In_Min, float In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float Out_Result, inout FSimulationContext Context);
void InitializeParticle_SimulationPosition_Emitter_Func_(out float3 Out_OutPosition, inout FSimulationContext Context);
void InitializeParticle_Emitter_Func_(inout FSimulationContext Context);
void Sine_Emitter_Func_(out float Out_NewOutput, inout FSimulationContext Context);
void Lerp_Float_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void NiagaraScript_741_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(float In_InnerRadius, float In_OuterRadius, int In_Seed, out float3 Out_Ouput, inout FSimulationContext Context);
void CustomHlsl99D2D00244511A096EA5088DE8D89968_Func_(bool In_X, bool In_Y, bool In_Z, out float3 Out_Output);
void NiagaraScript_747_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void SphereLocation_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_NF_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_Emitter_Func_(inout FSimulationContext Context);
void SampleField_Emitter_VectorField32(float3 In_SamplePoint, out float3 Out_SampledValue);
void CurlNoiseForce_Emitter_Func_(int In_Emitter_RandomSeed, inout FSimulationContext Context);
void ApplyInitialForces_Emitter_Func_(inout FSimulationContext Context);
void ParticleState_Emitter_Func_(inout FSimulationContext Context);
void SampleCurve_Emitter_ScaleAlpha_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void ScaleColor_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_768_Particle_Func_(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void SolveForcesAndVelocity_Emitter_Func_(inout FSimulationContext Context);
void NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat004_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat005_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat006_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void SampleCurve_Emitter_Radius_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve004_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void SampleCurve_Emitter_Temperature_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve001_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void Fluids_Gas_Source_Emitter_Func_(inout FSimulationContext Context);
void Multiply_Float_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void Vector2DFromFloat001_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_BDEC693D447651B764B3B6BBF3065841_Emitter_Func_(inout FSimulationContext Context);
bool Constant38 = false;
float Result = In_FloatMax - In_FloatMin;
float Result1 = rand_float(Result);
float Result2 = In_FloatMin + Result1;
Out_RandomFloat = Result2;
Out_IsDeterministic = Constant38;
int Constant30 = (0);
float Constant31 = 300;
float Constant32 = 1000;
int Constant33 = 0;
int Constant34 = (0);
int Constant35 = 0;
int Constant36 = (0);
int Constant37 = (0);
float NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
bool NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant30, Constant31, Constant32, Constant33, Constant34, Constant35, Constant36, Constant37, NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat, NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
int Constant42 = (0);
float Constant43 = 0.75;
float Constant44 = 1;
int Constant45 = 0;
int Constant46 = (0);
int Constant48 = (0);
int Constant49 = (0);
float NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
bool NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1;
NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant42, Constant43, Constant44, Constant45, Constant46, Constant47, Constant48, Constant49, NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1, NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
Output1.x = Context.MapSpawn.Vector2DFromFloat.Value;
Output1.y = Context.MapSpawn.Vector2DFromFloat.Value;
int Constant56 = (0);
float Constant57 = 0.2;
float Constant58 = 0.3;
int Constant59 = 0;
int Constant60 = (0);
int Constant61 = 0;
int Constant62 = (0);
int Constant63 = (0);
float NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
bool NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2;
NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant56, Constant57, Constant58, Constant59, Constant60, Constant61, Constant62, Constant63, NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2, NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2, Context);
Out_UniformRangedFloat = NiagaraScript_761_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
bool Constant75 = false;
int Constant76 = 0;
bool Result3 = NiagaraAll(In_RandomnessMode == Constant76);
bool Result4 = Constant75 && Result3;
int Constant77 = 1;
bool Result5 = NiagaraAll(In_RandomnessMode == Constant77);
bool Result6 = Result4 || Result5;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapSpawn.Emitter.RandomSeed;
int Constant78 = 0;
int Constant79 = 0;
int Seed1_IfResult;
int Seed2_IfResult;
int Seed3_IfResult;
Seed1_IfResult = Seed_IfResult;
Seed2_IfResult = Constant78;
Seed3_IfResult = Constant79;
Seed1_IfResult = Context.MapSpawn.Particles.UniqueID;
Seed2_IfResult = Context.MapSpawn.Engine.System.TickCount;
Seed3_IfResult = Seed_IfResult;
int Constant80 = -1;
int Constant81 = -1;
int Constant82 = -1;
int Seed1_IfResult1;
int Seed2_IfResult1;
int Seed3_IfResult1;
Seed1_IfResult1 = Seed1_IfResult;
Seed2_IfResult1 = Seed2_IfResult;
Seed3_IfResult1 = Seed3_IfResult;
Seed1_IfResult1 = Constant80;
Seed2_IfResult1 = Constant81;
Seed3_IfResult1 = Constant82;
NiagaraRandInfo Output11;
Output11.Seed1 = Seed1_IfResult1;
Output11.Seed2 = Seed2_IfResult1;
Output11.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output11;
Out_UseDeterministicRandoms = Result6;
int Constant70 = (0);
bool Constant71 = false;
int Constant72 = 0;
int Constant73 = (0);
bool Constant74 = false;
NiagaraRandInfo NiagaraScript_753_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool NiagaraScript_753_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
NiagaraScript_753_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant70, In_OverrideSeed, Constant72, Constant73, Constant74, In_RandomnessMode, NiagaraScript_753_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, NiagaraScript_753_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
float Result7 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = NiagaraScript_753_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed1;
Seed2 = NiagaraScript_753_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed2;
Seed3 = NiagaraScript_753_Emitter_Determinism_false_Particle_Func_Output_RandomInfo.Seed3;
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
float4 Constant90 = float4(1111,13.6009,0,1);
float4 Color_IfResult;
Color_IfResult = Constant90;
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
float Constant91 = 0;
float SpriteRotation_IfResult;
SpriteRotation_IfResult = Constant91;
SpriteRotation_IfResult = Context.MapSpawn.Particles.SpriteRotation;
Context.MapSpawn.Particles.SpriteRotation = SpriteRotation_IfResult;
float3 Constant92 = float3(1,1,1);
float3 Scale_IfResult;
Scale_IfResult = Constant92;
Scale_IfResult = Context.MapSpawn.Particles.Scale;
Context.MapSpawn.Particles.Scale = Scale_IfResult;
float3 Position_IfResult;
Position_IfResult = Context.MapSpawn.InitializeParticle.Position;
Position_IfResult = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Position = Position_IfResult;
float Constant96 = 2;
float Constant97 = 0.5;
float Constant98 = 1;
float Result11 = sin(Context.MapSpawn.Sine.NormalizedAngle*(TWO_PI/Constant96));
float Result12 = Result11 * Constant97;
float Result13 = Result12 + Constant98;
Out_NewOutput = Result13;
float Constant101 = 50;
float Constant102 = 60;
float Result14 = lerp(Constant101,Constant102,Context.MapSpawn.Lerp_Float.Alpha);
Out_Result = Result14;
bool Constant131 = false;
float3 Result19 = In_RangeMax - In_RangeMin;
float3 Result20 = rand(Result19);
float3 Result21 = In_RangeMin + Result20;
Out_RandomValue = Result21;
Out_IsDeterministic = Constant131;
int Constant121 = (0);
float Constant122 = 0;
float Constant123 = -1;
float Constant124 = 3;
float Result16 = pow(max(0, In_InnerRadius),Constant124);
Output12.x = Constant122;
Output12.y = Constant123;
Output12.z = Result16;
float Result17 = TWO_PI;
float Constant125 = 1;
float Constant126 = 3;
float Result18 = pow(max(0, In_OuterRadius),Constant126);
Output13.x = Result17;
Output13.y = Constant125;
Output13.z = Result18;
int Constant127 = (0);
int Constant128 = 0;
int Constant129 = (0);
int Constant130 = (0);
float3 NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue;
bool NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant121, Output12, Output13, In_Seed, Constant127, Constant128, Constant129, Constant130, NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue, NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
float Phi;
float CosASC40ThetaASC41;
float RASC943;
Phi = NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue.x;
CosASC40ThetaASC41 = NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue.y;
RASC943 = NiagaraScript_742_Particle_Particle_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue.z;
float Result22 = cos(Phi);
float Result23 = CosASC40ThetaASC41 * CosASC40ThetaASC41;
float Result24 = 1 - Result23;
float Result25 = sqrt(Result24);
float Result26 = Result22 * Result25;
float Result27 = sin(Phi);
float Result28 = Result27 * Result25;
Output14.x = Result26;
Output14.y = Result28;
Output14.z = CosASC40ThetaASC41;
float Constant132 = 0.333333;
float Result29 = pow(max(0, RASC943),Constant132);
float3 Result30 = Output14 * Result29;
Out_Ouput = Result30;
Out_Output = float3(In_X, In_Y, In_Z);
int Constant140 = 0;
bool Result34 = NiagaraAll(In_SourceSpace == Constant140);
int Constant141 = 0;
bool Result35 = NiagaraAll(In_DestinationSpace == Constant141);
bool Result36 = Result34 && Result35;
int Constant142 = 1;
bool Result37 = NiagaraAll(In_SourceSpace == Constant142);
int Constant143 = 1;
bool Result38 = NiagaraAll(In_DestinationSpace == Constant143);
bool Result39 = Result37 && Result38;
bool Result40 = Result36 || Result39;
int Constant144 = 2;
bool Result41 = NiagaraAll(In_SourceSpace == Constant144);
int Constant145 = 2;
bool Result42 = NiagaraAll(In_DestinationSpace == Constant145);
bool Result43 = Result41 && Result42;
bool Result44 = Result40 || Result43;
bool Result45 = Result34 && Result42;
bool Result46 = Result41 && Result35;
bool Result47 = Result45 || Result46;
bool Result48 = In_bLocalSpace && Result47;
bool Result49 = Result44 || Result48;
bool Result50 = !In_bLocalSpace;
bool Result51 = Result34 && Result38;
bool Result52 = Result37 && Result35;
bool Result53 = Result51 || Result52;
bool Result54 = Result50 && Result53;
bool Result55 = Result49 || Result54;
bool Result56 = In_bLocalSpace && Result51;
bool Result57 = Result41 && Result38;
bool Result58 = Result56 || Result57;
bool Result59 = Result50 && Result46;
bool Result60 = Result58 || Result59;
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result55;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result60;
bool Constant139 = false;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_747_Func_Output_bUseOriginal;
float4x4 NiagaraScript_747_Func_Output_OutTransform;
bool NiagaraScript_747_Func_Output_LocalToWorld;
NiagaraScript_747_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant139, NiagaraScript_747_Func_Output_bUseOriginal, NiagaraScript_747_Func_Output_OutTransform, NiagaraScript_747_Func_Output_LocalToWorld, Context);
float3 Result61 = mul(float4(In_InVector,0.0),NiagaraScript_747_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InVector;
Vector_IfResult = Result61;
Out_OutVector = Vector_IfResult;
bool Constant148 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_747_Func_Output_bUseOriginal1;
float4x4 NiagaraScript_747_Func_Output_OutTransform1;
bool NiagaraScript_747_Func_Output_LocalToWorld1;
NiagaraScript_747_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant148, NiagaraScript_747_Func_Output_bUseOriginal1, NiagaraScript_747_Func_Output_OutTransform1, NiagaraScript_747_Func_Output_LocalToWorld1, Context);
float3 Result63 = mul(float4(In_InVector,0.0),NiagaraScript_747_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result63;
Out_OutVector = Vector_IfResult1;
bool Constant154 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool NiagaraScript_747_Func_Output_bUseOriginal2;
float4x4 NiagaraScript_747_Func_Output_OutTransform2;
bool NiagaraScript_747_Func_Output_LocalToWorld2;
NiagaraScript_747_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant154, NiagaraScript_747_Func_Output_bUseOriginal2, NiagaraScript_747_Func_Output_OutTransform2, NiagaraScript_747_Func_Output_LocalToWorld2, Context);
float3 Result70 = mul(float4(In_InVector,0.0),NiagaraScript_747_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result70;
Out_OutVector = Vector_IfResult2;
int Constant117 = 0;
float Constant118 = 0;
float Constant119 = 0;
float Result15 = Constant118 * Constant119;
float Constant120 = 1;
float3 NiagaraScript_741_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput;
NiagaraScript_741_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Result15, Constant120, Constant117, NiagaraScript_741_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput, Context);
Context.MapSpawn.Local.SphereLocation.SphereVector = NiagaraScript_741_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput;
float3 Result31 = abs(Context.MapSpawn.Local.SphereLocation.SphereVector);
float3 CustomHlsl99D2D00244511A096EA5088DE8D89968_Func_Output_Output;
CustomHlsl99D2D00244511A096EA5088DE8D89968_Func_(Context.MapSpawn.SphereLocation.HemisphereX, Context.MapSpawn.SphereLocation.HemisphereY, Context.MapSpawn.SphereLocation.HemisphereZ, CustomHlsl99D2D00244511A096EA5088DE8D89968_Func_Output_Output);
float3 Result32 = lerp(Context.MapSpawn.Local.SphereLocation.SphereVector,Result31,CustomHlsl99D2D00244511A096EA5088DE8D89968_Func_Output_Output);
Context.MapSpawn.Local.SphereLocation.SphereVector = Result32;
float3 Constant133 = float3(1,1,0.6);
float3 Result33 = Context.MapSpawn.SphereLocation.SphereRadius * Context.MapSpawn.Local.SphereLocation.SphereVector * Constant133;
Context.MapSpawn.Local.SphereLocation.SphereVector = Result33;
float3 Constant134 = float3(1,0,0);
Context.MapSpawn.Local.SphereLocation.SphereVector = Context.MapSpawn.Local.SphereLocation.SphereVector;
float3 Constant135 = float3(0,0,20);
int Constant136 = 0;
int Constant137 = 0;
bool Constant138 = true;
float3 SphereLocation_TransformVector_Emitter_Func_Output_OutVector;
SphereLocation_TransformVector_Emitter_Func_(Constant135, Context.MapSpawn.SphereLocation.OffsetCoordinateSpace, Constant137, Constant138, SphereLocation_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result62 = Context.MapSpawn.SphereLocation.SphereOrigin + SphereLocation_TransformVector_Emitter_Func_Output_OutVector;
int Constant146 = 0;
bool Constant147 = true;
float3 SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
SphereLocation_NF_TransformVector_Emitter_Func_(Context.MapSpawn.Local.SphereLocation.SphereVector, Context.MapSpawn.SphereLocation.SphereCoordinateSpace, Constant146, Constant147, SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result64 = Result62 + SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
float Constant149 = 1;
float3 Constant150 = float3(1,1,0.6);
float3 Result65 = Constant150 * Context.MapSpawn.Engine.Owner.Scale;
float3 Result66 = abs(Result65);
float3 Constant151 = float3(0.0001,0.0001,0.0001);
float3 Result67 = max(Result66, Constant151);
float3 Result68 = Constant149 / Result67;
float3 Result69 = Context.MapSpawn.Local.SphereLocation.SphereVector * Result68;
int Constant152 = 0;
bool Constant153 = true;
float3 SphereLocation_TransformVector001_Emitter_Func_Output_OutVector;
SphereLocation_TransformVector001_Emitter_Func_(Result69, Context.MapSpawn.SphereLocation.SphereCoordinateSpace, Constant152, Constant153, SphereLocation_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Result71 = normalize(SphereLocation_TransformVector001_Emitter_Func_Output_OutVector);
Context.MapSpawn.OUTPUT_VAR.SphereLocation.Position = Result64;
Context.MapSpawn.OUTPUT_VAR.SphereLocation.SphereVector = SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
Context.MapSpawn.OUTPUT_VAR.SphereLocation.SphereNormal = Result71;
Context.MapSpawn.Particles.Position = Context.MapSpawn.OUTPUT_VAR.SphereLocation.Position;
bool Constant164 = false;
float AgeAdvancement_IfResult;
AgeAdvancement_IfResult = Context.MapSpawn.Emitter.Age;
AgeAdvancement_IfResult = Context.MapSpawn.Engine.Time;
float Constant166 = 4096;
int Constant167 = 0;
float Result72 = rand_float(Constant166, Constant165, Context.MapSpawn.Emitter.RandomSeed, Constant167);
Context.MapSpawn.Local.CurlNoiseForce.AgeAdvancement = AgeAdvancement_IfResult;
Context.MapSpawn.Local.CurlNoiseForce.DeterministicOffset = Result72;
Context.MapSpawn.Local.CurlNoiseForce.SamplePosition = Context.MapSpawn.CurlNoiseForce.SamplePosition;
float Constant168 = 0.04;
float3 Constant169 = float3(0.3,0.5,0.3);
float3 Result73 = Context.MapSpawn.Local.CurlNoiseForce.DeterministicOffset + Context.MapSpawn.Local.CurlNoiseForce.SamplePosition;
float3 Result74 = Result73 * Constant168;
float3 Result75 = Constant169 * Context.MapSpawn.Local.CurlNoiseForce.AgeAdvancement;
float3 Result76 = Result74 - Result75;
float Constant170 = 125;
float3 Result77 = Result76 * Constant170;
float3 SampleField_Emitter_VectorField32Output_SampledValue;
SampleField_Emitter_VectorField32(Result77, SampleField_Emitter_VectorField32Output_SampledValue);
Context.MapSpawn.Local.CurlNoiseForce.SampledNoise = SampleField_Emitter_VectorField32Output_SampledValue;
float Constant171 = 1;
float Constant172 = 0;
float Constant173 = 0;
Context.MapSpawn.Local.CurlNoiseForce.Falloff = Constant171;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAngle = Constant172;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskFalloffAngle = Constant173;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAxis = Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAxis;
float Constant174 = 130;
float3 Result78 = Context.MapSpawn.Local.CurlNoiseForce.SampledNoise * Constant174;
float3 Result79 = Context.MapSpawn.Transient.PhysicsForce + Result78;
Context.MapSpawn.Transient.PhysicsForce = Result79;
Context.MapSpawn.OUTPUT_VAR.CurlNoiseForce.CurlNoiseForce = Result78;
float Constant180 = 1;
float Constant181 = 1e-06;
float Result80 = max(Context.MapSpawn.Particles.Mass, Constant181);
float3 Result81 = Context.MapSpawn.Transient.PhysicsForce / Result80;
float3 Result82 = Result81 + Context.MapSpawn.Particles.Velocity;
float3 Velocity_IfResult;
Velocity_IfResult = Result82;
Velocity_IfResult = Context.MapSpawn.Particles.Velocity;
float Constant182 = 1e-06;
float Result83 = max(Context.MapSpawn.Particles.RotationalInertia, Constant182);
float3 Result84 = Context.MapSpawn.Transient.PhysicsRotationalForce / Result83;
float3 Result85 = Context.MapSpawn.Particles.RotationalVelocity + Result84;
float3 Constant183 = float3(0,0,0);
float3 RotVelocity_IfResult;
float3 RotationalForce_IfResult;
RotVelocity_IfResult = Result85;
RotationalForce_IfResult = Constant183;
RotVelocity_IfResult = Context.MapSpawn.Particles.RotationalVelocity;
RotationalForce_IfResult = Context.MapSpawn.Transient.PhysicsRotationalForce;
float3 Result86 = Context.MapSpawn.Transient.PhysicsForce * Constant180;
float3 Result87 = Context.MapSpawn.Particles.Position + Result86;
float3 Position_IfResult1;
Position_IfResult1 = Result87;
Position_IfResult1 = Context.MapSpawn.Particles.Position;
bool Result88 = Context.MapSpawn.ApplyInitialForces.ApplyForcetoVelocity || Context.MapSpawn.ApplyInitialForces.ApplyForcetoPosition;
float3 Constant184 = float3(0,0,0);
float3 Force_IfResult;
Force_IfResult = Constant184;
Force_IfResult = Context.MapSpawn.Transient.PhysicsForce;
Context.MapSpawn.Particles.Velocity = Velocity_IfResult;
Context.MapSpawn.Particles.RotationalVelocity = RotVelocity_IfResult;
Context.MapSpawn.Particles.Position = Position_IfResult1;
Context.MapSpawn.Transient.PhysicsForce = Force_IfResult;
Context.MapSpawn.Transient.PhysicsRotationalForce = RotationalForce_IfResult;
Context.MapSpawn.OUTPUT_VAR.ApplyInitialForces.IncomingPhysicsForce = Context.MapSpawn.Transient.PhysicsForce;
Context.MapSpawn.OUTPUT_VAR.ApplyInitialForces.IncomingPhysicsRotationalForce = Context.MapSpawn.Transient.PhysicsRotationalForce;
bool Result89 = NiagaraAll(Context.MapUpdate.Particles.Age <= Context.MapUpdate.Engine.DeltaTime);
Context.MapUpdate.OUTPUT_VAR.ParticleState.FirstFrame = Result89;
Context.MapUpdate.Transient.FirstFrame = Result89;
float Result90 = Context.MapUpdate.Particles.Age + Context.MapUpdate.ParticleState.DeltaTime;
float Constant186 = 1e-05;
float Result91 = max(Context.MapUpdate.ParticleState.Lifetime, Constant186);
float Constant187 = 0.0001;
float Result92 = Result91 - Constant187;
bool Result93 = NiagaraAll(Result90 < Result92);
bool Constant188 = false;
bool bool_IfResult;
bool_IfResult = Context.MapUpdate.DataInstance.Alive;
bool_IfResult = Constant188;
float Result94 = Result90 / Result91;
Context.MapUpdate.DataInstance.Alive = bool_IfResult;
Context.MapUpdate.Particles.Age = Result90;
Context.MapUpdate.Particles.NormalizedAge = Result94;
bool Constant189 = false;
bool Constant190 = true;
float Constant192 = 1;
float SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value;
SampleCurve_Emitter_ScaleAlpha_FloatCurve(Context.MapUpdate.FloatFromCurve.CurveIndex, SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value);
float Result95 = SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value * Constant192;
Out_Value = Result95;
float3 Constant195 = float3(1,1,1);
float4 Output0;
Output0.r = Constant195.x;
Output0.g = Constant195.y;
Output0.b = Constant195.z;
Output0.a = Context.MapUpdate.ScaleColor.ScaleAlpha;
float4 Result96 = Context.MapUpdate.Transient.ParticleColorScaleFactor * Output0;
float4 Result97 = Context.MapUpdate.ScaleColor.ColorValueToScale * Result96;
Context.MapUpdate.Particles.Color = Result97;
Context.MapUpdate.Transient.ParticleColorScaleFactor = Result96;
float3 Result104 = In_Velocity - In_AdvectionVelocity;
float Result105 = In_Drag * In_InverseMass;
float Constant205 = (0.0);
float NiagaraFloat_SelectResult = Constant205;
NiagaraFloat_SelectResult = In_Drag;
NiagaraFloat_SelectResult = Result105;
float Constant206 = 0;
float Result106 = max(NiagaraFloat_SelectResult, Constant206);
float Result107 = Result106 * In_DeltaTime;
float Constant207 = 1;
float Result108 = Result107 + Constant207;
float3 Result109 = Result104 / Result108;
float3 Result110 = Result109 + In_AdvectionVelocity;
Out_Output = Result110;
Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime = Context.MapUpdate.SolveForcesAndVelocity.DeltaTime;
float Constant203 = 1e-05;
float Result98 = max(Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime, Constant203);
float Result99 = Reciprocal(Result98);
Context.MapUpdate.Local.SolveForcesAndVelocity.InverseDeltaTime = Result99;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce = Context.MapUpdate.SolveForcesAndVelocity.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce = Context.MapUpdate.SolveForcesAndVelocity.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.MapUpdate.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.Local.SolveForcesAndVelocity.Mass = Context.MapUpdate.SolveForcesAndVelocity.Mass;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position = Context.MapUpdate.SolveForcesAndVelocity.Position;
Context.MapUpdate.Particles.Presolve.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.Particles.Presolve.Position = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.MapUpdate.Particles.Presolve.PhysicsForce = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce;
float Constant204 = 1e-06;
float Result100 = max(Context.MapUpdate.Local.SolveForcesAndVelocity.Mass, Constant204);
float Result101 = Reciprocal(Result100);
float3 Result102 = Result101 * Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce = Result102;
Context.MapUpdate.Local.SolveForcesAndVelocity.InverseMass = Result101;
float3 Result103 = Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce * Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Result103;
Context.MapUpdate.Local.SolveForcesAndVelocity.AdvectionVelocity = Context.MapUpdate.Transient.AdvectionVelocity;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Local.SolveForcesAndVelocity.DragIgnoreMass = Context.MapUpdate.Transient.DragIgnoreMass;
float3 NiagaraScript_768_Particle_Func_Output_Output;
NiagaraScript_768_Particle_Func_(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity.DragIgnoreMass, NiagaraScript_768_Particle_Func_Output_Output, Context);
float3 Result111 = NiagaraScript_768_Particle_Func_Output_Output - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = NiagaraScript_768_Particle_Func_Output_Output;
Context.MapUpdate.Local.SolveForcesAndVelocity.DragVelocity = Result111;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsDrag = Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag;
float Constant208 = 1000;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
float Constant209 = 9999;
float3 Result112 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity * Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime;
float3 Result113 = Result112 + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position = Result113;
float3 Position_IfResult2;
float3 Velocity_IfResult1;
Position_IfResult2 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Velocity_IfResult1 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Position_IfResult2 = Context.MapUpdate.Particles.Position;
Velocity_IfResult1 = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.Particles.Position = Position_IfResult2;
Context.MapUpdate.Particles.Velocity = Velocity_IfResult1;
float3 Constant210 = float3(0,0,0);
float Constant211 = 0;
float3 ForceVector_IfResult;
float Drag_IfResult;
ForceVector_IfResult = Constant210;
Drag_IfResult = Constant211;
ForceVector_IfResult = Context.MapUpdate.Transient.PhysicsForce;
Drag_IfResult = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsForce = ForceVector_IfResult;
Context.MapUpdate.Transient.PhysicsDrag = Drag_IfResult;
float3 Result114 = Context.MapUpdate.Particles.Position - Context.MapUpdate.Particles.Previous.Position;
float Result115 = length(Result114);
float Constant212 = 0.3333;
float Result116 = Result115 * Constant212;
float Constant213 = 1e+08;
float Result117 = Modulo(Context.MapUpdate.Particles.DistanceTraveled, Constant213);
float Result118 = Result116 + Result117;
Context.MapUpdate.Particles.DistanceTraveled = Result118;
//SetConstantByStaticVariable "/Solve Forces and Velocity/Map Get/Map Get->Particles.RotationalVelocityEnabled"
int Constant214 = 0;
//SetConstantByStaticVariable "/Solve Forces and Velocity/Map Get/Map Get->Module.Manually Enable Rotational Solver"
int Constant215 = 0;
//SetConstantByStaticVariable "/Solve Forces and Velocity/Logic OR (Static)/Logic OR (Static)->Result"
int Constant216 = 0;
bool Constant228 = false;
float Result119 = In_FloatMax - In_FloatMin;
int Constant229 = -1005805596;
float Result120 = rand_float(Result119, Context.MapUpdate.Particles.UniqueID, Constant229, Context.MapUpdate.Engine.Emitter.InstanceSeed);
float Result121 = In_FloatMin + Result120;
Out_RandomFloat = Result121;
Out_IsDeterministic = Constant228;
int Constant220 = (0);
float Constant221 = 2;
float Constant222 = 4;
int Constant223 = 0;
int Constant224 = (0);
int Constant225 = 0;
int Constant226 = (0);
int Constant227 = (0);
float NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
bool NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant220, Constant221, Constant222, Constant223, Constant224, Constant225, Constant226, Constant227, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
int Constant233 = (0);
float Constant234 = 1;
float Constant235 = 2;
int Constant236 = 0;
int Constant237 = (0);
int Constant238 = 0;
int Constant239 = (0);
int Constant240 = (0);
float NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
bool NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1;
NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant233, Constant234, Constant235, Constant236, Constant237, Constant238, Constant239, Constant240, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
int Constant244 = (0);
float Constant245 = 1;
float Constant246 = 2;
int Constant247 = 0;
int Constant248 = (0);
int Constant249 = 0;
int Constant250 = (0);
int Constant251 = (0);
float NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
bool NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2;
NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant244, Constant245, Constant246, Constant247, Constant248, Constant249, Constant250, Constant251, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2, Context);
Out_UniformRangedFloat = NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
float SampleCurve_Emitter_Radius_FloatCurveOutput_Value;
SampleCurve_Emitter_Radius_FloatCurve(Context.MapUpdate.FloatFromCurve004.CurveIndex, SampleCurve_Emitter_Radius_FloatCurveOutput_Value);
float Result122 = SampleCurve_Emitter_Radius_FloatCurveOutput_Value * Context.MapUpdate.FloatFromCurve004.ScaleCurve;
Out_Value = Result122;
float SampleCurve_Emitter_Temperature_FloatCurveOutput_Value;
SampleCurve_Emitter_Temperature_FloatCurve(Context.MapUpdate.FloatFromCurve001.CurveIndex, SampleCurve_Emitter_Temperature_FloatCurveOutput_Value);
float Result123 = SampleCurve_Emitter_Temperature_FloatCurveOutput_Value * Context.MapUpdate.FloatFromCurve001.ScaleCurve;
Out_Value = Result123;
float Constant257 = 2;
float Constant258 = 1;
float Constant259 = 4;
float Constant260 = 12;
float Constant261 = 1;
Context.MapUpdate.Particles.fluids_source_density = Constant257;
Context.MapUpdate.Particles.fluids_source_falloff = Constant258;
Context.MapUpdate.Particles.fluids_source_noiseIntensity = Constant259;
Context.MapUpdate.Particles.fluids_source_noiseScale = Constant260;
Context.MapUpdate.Particles.fluids_source_radius = Context.MapUpdate.Fluids_Gas_Source.Radius;
Context.MapUpdate.Particles.fluids_source_temperature = Context.MapUpdate.Fluids_Gas_Source.Temperature;
Context.MapUpdate.Particles.fluids_source_velocityScale = Context.MapUpdate.Fluids_Gas_Source.VelocityScale;
Context.MapUpdate.Particles.fluids_source_velocity = Context.MapUpdate.Fluids_Gas_Source.Velocity;
Context.MapUpdate.Particles.fluids_source_divergence = Constant261;
float Constant263 = 2;
float Result124 = Context.MapUpdate.Multiply_Float.A * Constant263;
Out_Result = Result124;
Output15.x = Context.MapUpdate.Vector2DFromFloat001.Value;
Output15.y = Context.MapUpdate.Vector2DFromFloat001.Value;
Out_Vec2 = Output15;
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
Context.MapSpawn.Particles.Lifetime = Constant1;
float4 Constant2 = float4(1,1,1,1);
Context.MapSpawn.Particles.Color = Constant2;
Context.MapSpawn.Particles.Mass = Constant3;
float2 Constant4 = float2(10,10);
Context.MapSpawn.Particles.SpriteSize = Constant4;
Context.MapSpawn.Particles.SpriteRotation = Constant5;
float3 Constant6 = float3(1,1,1);
Context.MapSpawn.Particles.Scale = Constant6;
float3 Constant7 = float3(0,0,0);
Context.MapSpawn.Particles.Velocity = Constant7;
float3 Constant8 = float3(0,0,0);
Context.MapSpawn.Particles.RotationalVelocity = Constant8;
Context.MapSpawn.Particles.RotationalInertia = Constant9;
float Constant10 = 0;
Context.MapSpawn.Particles.Age = Constant10;
float Constant11 = (0.0);
Context.MapSpawn.Particles.NormalizedAge = Constant11;
float3 Constant12 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Velocity = Constant12;
float3 Constant13 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Position = Constant13;
float3 Constant14 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.PhysicsForce = Constant14;
float3 Constant15 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Velocity = Constant15;
float3 Constant16 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Position = Constant16;
float Constant17 = 0;
Context.MapSpawn.Particles.DistanceTraveled = Constant17;
float Constant18 = (0.0);
Context.MapSpawn.Particles.fluids_source_density = Constant18;
float Constant19 = (0.0);
Context.MapSpawn.Particles.fluids_source_falloff = Constant19;
float Constant20 = (0.0);
Context.MapSpawn.Particles.fluids_source_noiseIntensity = Constant20;
float Constant21 = (0.0);
Context.MapSpawn.Particles.fluids_source_noiseScale = Constant21;
float Constant22 = (0.0);
Context.MapSpawn.Particles.fluids_source_radius = Constant22;
float Constant23 = (0.0);
Context.MapSpawn.Particles.fluids_source_temperature = Constant23;
float Constant24 = (0.0);
Context.MapSpawn.Particles.fluids_source_velocityScale = Constant24;
Context.MapSpawn.Particles.fluids_source_velocity = Constant25;
float Constant26 = (0.0);
Context.MapSpawn.Particles.fluids_source_divergence = Constant26;
float Constant27 = 300;
float Constant28 = 1000;
int Constant29 = 0;
float RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat003_Emitter_Func_(RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.Vector2DFromFloat.Value = RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
float Constant39 = 0.75;
int Constant41 = 0;
float RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat001_Emitter_Func_(RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat, Context);
bool Constant50 = true;
bool Constant51 = false;
bool Constant52 = true;
float2 Vector2DFromFloat_Emitter_Func_Output_Vec2;
Vector2DFromFloat_Emitter_Func_(Vector2DFromFloat_Emitter_Func_Output_Vec2, Context);
float Constant53 = 0.2;
float Constant54 = 0.3;
int Constant55 = 0;
float RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat_Emitter_Func_(RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.InitializeParticle.Mass = RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
Context.MapSpawn.InitializeParticle.WriteColor = Constant50;
Context.MapSpawn.InitializeParticle.WritePosition = Constant51;
Context.MapSpawn.InitializeParticle.WriteSpriteSize = Constant52;
Context.MapSpawn.InitializeParticle.SpriteSize = Vector2DFromFloat_Emitter_Func_Output_Vec2;
Context.MapSpawn.InitializeParticle.Lifetime = RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
bool Constant64 = true;
Context.MapSpawn.InitializeParticle.WriteMaterialRandom = Constant64;
float Constant65 = 0;
int Constant67 = -1;
int Constant68 = 0;
bool Constant69 = false;
float NiagaraScript_759_Func_Output_Result;
NiagaraScript_759_Func_(Constant65, Constant66, Constant67, Constant68, Constant69, NiagaraScript_759_Func_Output_Result, Context);
Context.MapSpawn.InitializeParticle.MaterialRandom = NiagaraScript_759_Func_Output_Result;
bool Constant83 = true;
Context.MapSpawn.InitializeParticle.WriteLifetime = Constant83;
float4 Constant84 = float4(1111,13.6009,0,1);
bool Constant85 = true;
Context.MapSpawn.InitializeParticle.WriteMass = Constant85;
bool Constant86 = false;
Context.MapSpawn.InitializeParticle.WriteSpriteRotation = Constant86;
float Constant87 = 0;
bool Constant88 = false;
Context.MapSpawn.InitializeParticle.WriteScale = Constant88;
float3 Constant89 = float3(1,1,1);
float3 InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
InitializeParticle_SimulationPosition_Emitter_Func_(InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition, Context);
Context.MapSpawn.InitializeParticle.Position = InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
Context.MapSpawn.Particles.Position = InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
EnterStatScope(1 /**InitializeParticle_Emitter_Func_*/);
InitializeParticle_Emitter_Func_(Context);
ExitStatScope(/**InitializeParticle_Emitter_Func_*/);
Context.MapSpawn.Sine.NormalizedAngle = Context.MapSpawn.Emitter.Age;
float Constant93 = 2;
float Constant94 = 0.5;
float Constant95 = 1;
float Sine_Emitter_Func_Output_NewOutput;
Sine_Emitter_Func_(Sine_Emitter_Func_Output_NewOutput, Context);
Context.MapSpawn.Lerp_Float.Alpha = Sine_Emitter_Func_Output_NewOutput;
float Constant99 = 50;
float Constant100 = 60;
float Lerp_Float_Emitter_Func_Output_Result;
Lerp_Float_Emitter_Func_(Lerp_Float_Emitter_Func_Output_Result, Context);
Context.MapSpawn.SphereLocation.SphereRadius = Lerp_Float_Emitter_Func_Output_Result;
int Constant103 = 0;
bool Constant104 = true;
Context.MapSpawn.SphereLocation.NormalizeThickness = Constant104;
int Constant106 = 0;
Context.MapSpawn.SphereLocation.SurfaceExpansionMode = Constant106;
bool Constant107 = false;
Context.MapSpawn.SphereLocation.HemisphereX = Constant107;
Context.MapSpawn.SphereLocation.HemisphereY = Constant108;
Context.MapSpawn.SphereLocation.HemisphereZ = Constant109;
float3 Constant110 = float3(1,1,0.6);
float3 Constant111 = float3(1,0,0);
Context.MapSpawn.SphereLocation.SphereOrigin = Context.MapSpawn.Particles.Position;
float3 Constant112 = float3(0,0,20);
int Constant113 = 2;
Context.MapSpawn.SphereLocation.OffsetCoordinateSpace = Constant113;
int Constant114 = 2;
Context.MapSpawn.SphereLocation.SphereCoordinateSpace = Constant114;
int Constant115 = 0;
bool Constant116 = false;
EnterStatScope(2 /**SphereLocation_Emitter_Func_*/);
SphereLocation_Emitter_Func_(Context);
ExitStatScope(/**SphereLocation_Emitter_Func_*/);
bool Constant155 = false;
int Constant156 = (0);
int Constant157 = 0;
Context.MapSpawn.CurlNoiseForce.SamplePosition = Context.MapSpawn.Particles.Position;
float Constant158 = 0.04;
float3 Constant159 = float3(0.3,0.5,0.3);
float Constant160 = 0;
float Constant161 = 0;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAxis = Context.MapSpawn.Particles.Velocity;
float3 Constant162 = float3(0,0,0);
Context.MapSpawn.Transient.PhysicsForce = Constant162;
float Constant163 = 130;
EnterStatScope(3 /**CurlNoiseForce_Emitter_Func_*/);
CurlNoiseForce_Emitter_Func_(Constant156, Context);
ExitStatScope(/**CurlNoiseForce_Emitter_Func_*/);
bool Constant175 = true;
Context.MapSpawn.ApplyInitialForces.ApplyForcetoVelocity = Constant175;
bool Constant176 = false;
Context.MapSpawn.ApplyInitialForces.ApplyForcetoPosition = Constant176;
bool Constant177 = true;
Context.MapSpawn.ApplyInitialForces.ApplyRotationalForcetoRotationalVelocity = Constant177;
float3 Constant178 = float3(0,0,0);
Context.MapSpawn.Transient.PhysicsRotationalForce = Constant178;
float Constant179 = 1;
EnterStatScope(4 /**ApplyInitialForces_Emitter_Func_*/);
ApplyInitialForces_Emitter_Func_(Context);
ExitStatScope(/**ApplyInitialForces_Emitter_Func_*/);
Context.MapSpawn.Particles.Initial.Color = Context.MapSpawn.Particles.Color;
bool Constant185 = true;
Context.MapUpdate.DataInstance.Alive = Constant185;
Context.MapUpdate.ParticleState.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
EnterStatScope(5 /**ParticleState_Emitter_Func_*/);
ParticleState_Emitter_Func_(Context);
ExitStatScope(/**ParticleState_Emitter_Func_*/);
Context.MapUpdate.FloatFromCurve.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float Constant191 = 1;
float FloatFromCurve_Emitter_Func_Output_Value;
FloatFromCurve_Emitter_Func_(FloatFromCurve_Emitter_Func_Output_Value, Context);
Context.MapUpdate.ScaleColor.ScaleAlpha = FloatFromCurve_Emitter_Func_Output_Value;
Context.MapUpdate.ScaleColor.ColorValueToScale = Context.MapUpdate.Particles.Initial.Color;
float4 Constant193 = float4(1,1,1,1);
Context.MapUpdate.Transient.ParticleColorScaleFactor = Constant193;
float3 Constant194 = float3(1,1,1);
EnterStatScope(6 /**ScaleColor_Emitter_Func_*/);
ScaleColor_Emitter_Func_(Context);
ExitStatScope(/**ScaleColor_Emitter_Func_*/);
Context.MapUpdate.Transient.PhysicsDeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.SolveForcesAndVelocity.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float3 Constant196 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant196;
Context.MapUpdate.SolveForcesAndVelocity.Force = Context.MapUpdate.Transient.PhysicsForce;
Context.MapUpdate.SolveForcesAndVelocity.Velocity = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.SolveForcesAndVelocity.Mass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.SolveForcesAndVelocity.Position = Context.MapUpdate.Particles.Position;
float3 Constant197 = float3(0,0,0);
Context.MapUpdate.Transient.AdvectionVelocity = Constant197;
float Constant198 = 0;
Context.MapUpdate.Transient.PhysicsDrag = Constant198;
bool Constant199 = true;
Context.MapUpdate.Transient.DragIgnoreMass = Constant199;
float Constant200 = 1000;
Context.MapUpdate.SolveForcesAndVelocity.PreviousVelocity = Context.MapUpdate.Particles.Previous.Velocity;
float Constant201 = 9999;
bool Constant202 = true;
Context.MapUpdate.SolveForcesAndVelocity.WritetoIntrinsicProperties = Constant202;
EnterStatScope(7 /**SolveForcesAndVelocity_Emitter_Func_*/);
SolveForcesAndVelocity_Emitter_Func_(Context);
ExitStatScope(/**SolveForcesAndVelocity_Emitter_Func_*/);
float Constant217 = 2;
float Constant218 = 4;
int Constant219 = 0;
float RandomRangeFloat004_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat004_Emitter_Func_(RandomRangeFloat004_Emitter_Func_Output_UniformRangedFloat, Context);
float Constant230 = 1;
float Constant231 = 2;
int Constant232 = 0;
float RandomRangeFloat005_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat005_Emitter_Func_(RandomRangeFloat005_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapUpdate.FloatFromCurve004.ScaleCurve = RandomRangeFloat004_Emitter_Func_Output_UniformRangedFloat;
Context.MapUpdate.FloatFromCurve001.ScaleCurve = RandomRangeFloat005_Emitter_Func_Output_UniformRangedFloat;
float Constant241 = 1;
float Constant242 = 2;
int Constant243 = 0;
float RandomRangeFloat006_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat006_Emitter_Func_(RandomRangeFloat006_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapUpdate.FloatFromCurve004.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float FloatFromCurve004_Emitter_Func_Output_Value;
FloatFromCurve004_Emitter_Func_(FloatFromCurve004_Emitter_Func_Output_Value, Context);
Context.MapUpdate.FloatFromCurve001.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float FloatFromCurve001_Emitter_Func_Output_Value;
FloatFromCurve001_Emitter_Func_(FloatFromCurve001_Emitter_Func_Output_Value, Context);
Context.MapUpdate.Fluids_Gas_Source.VelocityScale = RandomRangeFloat006_Emitter_Func_Output_UniformRangedFloat;
Context.MapUpdate.Fluids_Gas_Source.Radius = FloatFromCurve004_Emitter_Func_Output_Value;
Context.MapUpdate.Fluids_Gas_Source.Temperature = FloatFromCurve001_Emitter_Func_Output_Value;
float Constant252 = 2;
float Constant253 = 1;
float Constant254 = 4;
float Constant255 = 12;
Context.MapUpdate.Fluids_Gas_Source.Velocity = Context.MapUpdate.Particles.Velocity;
float Constant256 = 1;
EnterStatScope(8 /**Fluids_Gas_Source_Emitter_Func_*/);
Fluids_Gas_Source_Emitter_Func_(Context);
ExitStatScope(/**Fluids_Gas_Source_Emitter_Func_*/);
Context.MapUpdate.Multiply_Float.A = Context.MapUpdate.Particles.fluids_source_radius;
float Constant262 = 2;
float Multiply_Float_Emitter_Func_Output_Result;
Multiply_Float_Emitter_Func_(Multiply_Float_Emitter_Func_Output_Result, Context);
Context.MapUpdate.Vector2DFromFloat001.Value = Multiply_Float_Emitter_Func_Output_Result;
float2 Vector2DFromFloat001_Emitter_Func_Output_Vec2;
Vector2DFromFloat001_Emitter_Func_(Vector2DFromFloat001_Emitter_Func_Output_Vec2, Context);
Context.MapUpdate.SetVariables_BDEC693D447651B764B3B6BBF3065841.Particles.SpriteSize = Vector2DFromFloat001_Emitter_Func_Output_Vec2;
EnterStatScope(9 /**SetVariables_BDEC693D447651B764B3B6BBF3065841_Emitter_Func_*/);
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
Emitter_Temperature_FloatCurve_MinTime;
Emitter_Temperature_FloatCurve_MaxTime;
Emitter_Temperature_FloatCurve_InvTimeRange;
Emitter_Temperature_FloatCurve_CurveLUTNumMinusOne;
Emitter_Temperature_FloatCurve_LUTOffset;
Emitter_Temperature_FloatCurve_CurveLUT;
float RemappedTime = saturate((Time - Emitter_Temperature_FloatCurve_MinTime) * Emitter_Temperature_FloatCurve_InvTimeRange) * float(Emitter_Temperature_FloatCurve_CurveLUTNumMinusOne);
IndexB = min(IndexA + 1, Emitter_Temperature_FloatCurve_CurveLUTNumMinusOne);
return Emitter_Temperature_FloatCurve_CurveLUT[index];
return StaticInputFloat[Emitter_Temperature_FloatCurve_LUTOffset + index];
GetCurveLUTIndices_Emitter_Temperature_FloatCurve(Time, IndexA, IndexB, Fraction);
Value = lerp(SampleCurveLUT_Emitter_Temperature_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_Temperature_FloatCurve(IndexB + i), Fraction);
Value[i] = lerp(SampleCurveLUT_Emitter_Temperature_FloatCurve(IndexA + i), SampleCurveLUT_Emitter_Temperature_FloatCurve(IndexB + i), Fraction);
float3 SamplePoint = (In_SamplePoint - Emitter_VectorField32_MinBounds) / (Emitter_VectorField32_MaxBounds - Emitter_VectorField32_MinBounds);
Out_Sample = Texture3DSample(Emitter_VectorField32_Texture, Emitter_VectorField32_Sampler, SamplePoint).xyz;
Context.MapSpawn.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSpawn.Engine.System.TickCount = Engine_System_TickCount;
Context.MapSpawn.Engine.Owner.Position = Engine_Owner_Position;
Context.MapSpawn.Emitter.Age = Emitter_Age;
Context.MapSpawn.Engine.Owner.SystemLocalToWorld = Engine_Owner_SystemLocalToWorld;
Context.MapSpawn.Engine.Owner.SystemWorldToLocal = Engine_Owner_SystemWorldToLocal;
Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale = Engine_Owner_SystemLocalToWorldNoScale;
Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale = Engine_Owner_SystemWorldToLocalNoScale;
Context.MapSpawn.Engine.Owner.Scale = Engine_Owner_Scale;
Context.MapSpawn.Engine.Time = Engine_Time;
Context.MapUpdate.Engine.DeltaTime = Engine_DeltaTime;
Context.MapUpdate.Engine.Owner.Position = Engine_Owner_Position;
Context.MapUpdate.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapUpdate.Engine.Time = Engine_Time;
Context.MapUpdate.Engine.WorldDeltaTime = Engine_WorldDeltaTime;
Context.MapUpdate.Engine.InverseDeltaTime = Engine_InverseDeltaTime;
Context.MapUpdate.Engine.ExecutionCount = Engine_ExecutionCount;
Context.MapUpdate.Emitter.SpawnRate = Emitter_SpawnRate;
Context.MapUpdate.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapUpdate.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapUpdate.Engine.System.RandomSeed = Engine_System_RandomSeed;
Context.MapSpawn.Particles.Age = 0.0f;
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
Context.MapSpawn.Particles.Initial.Color.r = 0.0f;
Context.MapSpawn.Particles.Initial.Color.g = 0.0f;
Context.MapSpawn.Particles.Initial.Color.b = 0.0f;
Context.MapSpawn.Particles.Initial.Color.a = 0.0f;
Context.MapSpawn.Particles.Lifetime = 0.0f;
Context.MapSpawn.Particles.Mass = 0.0f;
Context.MapSpawn.Particles.MaterialRandom = 0.0f;
Context.MapSpawn.Particles.NormalizedAge = 0.0f;
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
Context.MapUpdate.Array.Color = 1;
Context.MapUpdate.Particles.Color.r = InputDataFloat(0, 1, InstanceIdx);
Context.MapUpdate.Particles.Color.g = InputDataFloat(0, 2, InstanceIdx);
Context.MapUpdate.Particles.Color.b = InputDataFloat(0, 3, InstanceIdx);
Context.MapUpdate.Particles.Color.a = InputDataFloat(0, 4, InstanceIdx);
Context.MapUpdate.Array.DistanceTraveled = 5;
Context.MapUpdate.Particles.DistanceTraveled = InputDataFloat(0, 5, InstanceIdx);
Context.MapUpdate.Array.fluids_source_density = 6;
Context.MapUpdate.Particles.fluids_source_density = InputDataFloat(0, 6, InstanceIdx);
Context.MapUpdate.Array.fluids_source_divergence = 7;
Context.MapUpdate.Particles.fluids_source_divergence = InputDataFloat(0, 7, InstanceIdx);
Context.MapUpdate.Array.fluids_source_falloff = 8;
Context.MapUpdate.Particles.fluids_source_falloff = InputDataFloat(0, 8, InstanceIdx);
Context.MapUpdate.Array.fluids_source_noiseIntensity = 9;
Context.MapUpdate.Particles.fluids_source_noiseIntensity = InputDataFloat(0, 9, InstanceIdx);
Context.MapUpdate.Array.fluids_source_noiseScale = 10;
Context.MapUpdate.Particles.fluids_source_noiseScale = InputDataFloat(0, 10, InstanceIdx);
Context.MapUpdate.Array.fluids_source_radius = 11;
Context.MapUpdate.Particles.fluids_source_radius = InputDataFloat(0, 11, InstanceIdx);
Context.MapUpdate.Array.fluids_source_temperature = 12;
Context.MapUpdate.Particles.fluids_source_temperature = InputDataFloat(0, 12, InstanceIdx);
Context.MapUpdate.Array.fluids_source_velocity = 13;
Context.MapUpdate.Particles.fluids_source_velocity.x = InputDataFloat(0, 13, InstanceIdx);
Context.MapUpdate.Particles.fluids_source_velocity.y = InputDataFloat(0, 14, InstanceIdx);
Context.MapUpdate.Particles.fluids_source_velocity.z = InputDataFloat(0, 15, InstanceIdx);
Context.MapUpdate.Array.fluids_source_velocityScale = 16;
Context.MapUpdate.Particles.fluids_source_velocityScale = InputDataFloat(0, 16, InstanceIdx);
Context.MapUpdate.Array.Initial.Color = 17;
Context.MapUpdate.Particles.Initial.Color.r = InputDataFloat(0, 17, InstanceIdx);
Context.MapUpdate.Particles.Initial.Color.g = InputDataFloat(0, 18, InstanceIdx);
Context.MapUpdate.Particles.Initial.Color.b = InputDataFloat(0, 19, InstanceIdx);
Context.MapUpdate.Particles.Initial.Color.a = InputDataFloat(0, 20, InstanceIdx);
Context.MapUpdate.Array.Lifetime = 21;
Context.MapUpdate.Particles.Lifetime = InputDataFloat(0, 21, InstanceIdx);
Context.MapUpdate.Array.Mass = 22;
Context.MapUpdate.Particles.Mass = InputDataFloat(0, 22, InstanceIdx);
Context.MapUpdate.Array.MaterialRandom = 23;
Context.MapUpdate.Particles.MaterialRandom = InputDataFloat(0, 23, InstanceIdx);
Context.MapUpdate.Array.NormalizedAge = 24;
Context.MapUpdate.Particles.NormalizedAge = InputDataFloat(0, 24, InstanceIdx);
Context.MapUpdate.Array.Position = 25;
Context.MapUpdate.Particles.Position.x = InputDataFloat(0, 25, InstanceIdx);
Context.MapUpdate.Particles.Position.y = InputDataFloat(0, 26, InstanceIdx);
Context.MapUpdate.Particles.Position.z = InputDataFloat(0, 27, InstanceIdx);
Context.MapUpdate.Array.Presolve.PhysicsForce = 28;
Context.MapUpdate.Particles.Presolve.PhysicsForce.x = InputDataFloat(0, 28, InstanceIdx);
Context.MapUpdate.Particles.Presolve.PhysicsForce.y = InputDataFloat(0, 29, InstanceIdx);
Context.MapUpdate.Particles.Presolve.PhysicsForce.z = InputDataFloat(0, 30, InstanceIdx);
Context.MapUpdate.Array.Presolve.Position = 31;
Context.MapUpdate.Particles.Presolve.Position.x = InputDataFloat(0, 31, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Position.y = InputDataFloat(0, 32, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Position.z = InputDataFloat(0, 33, InstanceIdx);
Context.MapUpdate.Array.Presolve.Velocity = 34;
Context.MapUpdate.Particles.Presolve.Velocity.x = InputDataFloat(0, 34, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Velocity.y = InputDataFloat(0, 35, InstanceIdx);
Context.MapUpdate.Particles.Presolve.Velocity.z = InputDataFloat(0, 36, InstanceIdx);
Context.MapUpdate.Array.RotationalInertia = 46;
Context.MapUpdate.Particles.RotationalInertia = InputDataFloat(0, 46, InstanceIdx);
Context.MapUpdate.Array.RotationalVelocity = 47;
Context.MapUpdate.Particles.RotationalVelocity.x = InputDataFloat(0, 47, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.y = InputDataFloat(0, 48, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.z = InputDataFloat(0, 49, InstanceIdx);
Context.MapUpdate.Array.Scale = 50;
Context.MapUpdate.Particles.Scale.x = InputDataFloat(0, 50, InstanceIdx);
Context.MapUpdate.Particles.Scale.y = InputDataFloat(0, 51, InstanceIdx);
Context.MapUpdate.Particles.Scale.z = InputDataFloat(0, 52, InstanceIdx);
Context.MapUpdate.Array.SpriteRotation = 53;
Context.MapUpdate.Particles.SpriteRotation = InputDataFloat(0, 53, InstanceIdx);
Context.MapUpdate.Array.SpriteSize = 54;
Context.MapUpdate.Particles.SpriteSize.x = InputDataFloat(0, 54, InstanceIdx);
Context.MapUpdate.Particles.SpriteSize.y = InputDataFloat(0, 55, InstanceIdx);
Context.MapUpdate.Array.Velocity = 56;
Context.MapUpdate.Particles.Velocity.x = InputDataFloat(0, 56, InstanceIdx);
Context.MapUpdate.Particles.Velocity.y = InputDataFloat(0, 57, InstanceIdx);
Context.MapUpdate.Particles.Velocity.z = InputDataFloat(0, 58, InstanceIdx);
Context.MapUpdate.Particles.Position;
Context.MapUpdate.Particles.SpriteRotation;
Context.MapUpdate.Particles.SpriteSize;
Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.DataInstance.Alive=true;
Context.MapUpdate.Engine.Emitter.ID.ID = 0;
InterpolateParameters(Context);
Context.MapUpdate.DataInstance.Alive = true;
Context.MapUpdate.Particles.Previous.Velocity = Context.MapSpawn.Particles.Velocity;
Context.MapUpdate.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
const bool bValid = bIsValidInstance && Context.MapUpdate.DataInstance.Alive;
const int WriteIndex = OutputIndex(0, true, bValid);
OutputDataFloat(0, 0, WriteIndex, Context.MapUpdate.Particles.Age);
OutputDataFloat(0, 1, WriteIndex, Context.MapUpdate.Particles.Color.r);
OutputDataFloat(0, 2, WriteIndex, Context.MapUpdate.Particles.Color.g);
OutputDataFloat(0, 3, WriteIndex, Context.MapUpdate.Particles.Color.b);
OutputDataFloat(0, 4, WriteIndex, Context.MapUpdate.Particles.Color.a);
OutputDataFloat(0, 5, WriteIndex, Context.MapUpdate.Particles.DistanceTraveled);
OutputDataFloat(0, 6, WriteIndex, Context.MapUpdate.Particles.fluids_source_density);
OutputDataFloat(0, 7, WriteIndex, Context.MapUpdate.Particles.fluids_source_divergence);
OutputDataFloat(0, 8, WriteIndex, Context.MapUpdate.Particles.fluids_source_falloff);
OutputDataFloat(0, 9, WriteIndex, Context.MapUpdate.Particles.fluids_source_noiseIntensity);
OutputDataFloat(0, 10, WriteIndex, Context.MapUpdate.Particles.fluids_source_noiseScale);
OutputDataFloat(0, 11, WriteIndex, Context.MapUpdate.Particles.fluids_source_radius);
OutputDataFloat(0, 12, WriteIndex, Context.MapUpdate.Particles.fluids_source_temperature);
OutputDataFloat(0, 13, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.x);
OutputDataFloat(0, 14, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.y);
OutputDataFloat(0, 15, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.z);
OutputDataFloat(0, 16, WriteIndex, Context.MapUpdate.Particles.fluids_source_velocityScale);
OutputDataFloat(0, 17, WriteIndex, Context.MapUpdate.Particles.Initial.Color.r);
OutputDataFloat(0, 18, WriteIndex, Context.MapUpdate.Particles.Initial.Color.g);
OutputDataFloat(0, 19, WriteIndex, Context.MapUpdate.Particles.Initial.Color.b);
OutputDataFloat(0, 20, WriteIndex, Context.MapUpdate.Particles.Initial.Color.a);
OutputDataFloat(0, 21, WriteIndex, Context.MapUpdate.Particles.Lifetime);
OutputDataFloat(0, 22, WriteIndex, Context.MapUpdate.Particles.Mass);
OutputDataFloat(0, 23, WriteIndex, Context.MapUpdate.Particles.MaterialRandom);
OutputDataFloat(0, 24, WriteIndex, Context.MapUpdate.Particles.NormalizedAge);
OutputDataFloat(0, 25, WriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 26, WriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 27, WriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 28, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.x);
OutputDataFloat(0, 29, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.y);
OutputDataFloat(0, 30, WriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.z);
OutputDataFloat(0, 31, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.x);
OutputDataFloat(0, 32, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.y);
OutputDataFloat(0, 33, WriteIndex, Context.MapUpdate.Particles.Presolve.Position.z);
OutputDataFloat(0, 34, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.x);
OutputDataFloat(0, 35, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.y);
OutputDataFloat(0, 36, WriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.z);
OutputDataFloat(0, 37, WriteIndex, Context.MapUpdate.Particles.Previous.Position.x);
OutputDataFloat(0, 38, WriteIndex, Context.MapUpdate.Particles.Previous.Position.y);
OutputDataFloat(0, 39, WriteIndex, Context.MapUpdate.Particles.Previous.Position.z);
OutputDataFloat(0, 40, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteRotation);
OutputDataFloat(0, 41, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 42, WriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 43, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.x);
OutputDataFloat(0, 44, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.y);
OutputDataFloat(0, 45, WriteIndex, Context.MapUpdate.Particles.Previous.Velocity.z);
OutputDataFloat(0, 46, WriteIndex, Context.MapUpdate.Particles.RotationalInertia);
OutputDataFloat(0, 47, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.x);
OutputDataFloat(0, 48, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.y);
OutputDataFloat(0, 49, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.z);
OutputDataFloat(0, 50, WriteIndex, Context.MapUpdate.Particles.Scale.x);
OutputDataFloat(0, 51, WriteIndex, Context.MapUpdate.Particles.Scale.y);
OutputDataFloat(0, 52, WriteIndex, Context.MapUpdate.Particles.Scale.z);
OutputDataFloat(0, 53, WriteIndex, Context.MapUpdate.Particles.SpriteRotation);
OutputDataFloat(0, 54, WriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 55, WriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataFloat(0, 56, WriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 57, WriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 58, WriteIndex, Context.MapUpdate.Particles.Velocity.z);
 Aöôô>
 AÕÃÃ=
int Engine_ExecutionCount;
int PREV_Engine_ExecutionCount;
float PREV_Emitter_SpawnInterval;
float PREV_Emitter_InterpSpawnStartDt;
int PREV_Emitter_SpawnGroup;
float InterpSpawnStartDt;
int SpawnGroup;
float SpawnInterval;
void NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void NiagaraScript_753_Emitter_Determinism_false_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void NiagaraScript_768_Func_(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Engine_System_TickCount, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
float NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
bool NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant30, Constant31, Constant32, Constant33, Constant34, Constant35, Constant36, Constant37, NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat, NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
float NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
bool NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1;
NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant42, Constant43, Constant44, Constant45, Constant46, Constant47, Constant48, Constant49, NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1, NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
float NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
bool NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2;
NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant56, Constant57, Constant58, Constant59, Constant60, Constant61, Constant62, Constant63, NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2, NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2, Context);
Out_UniformRangedFloat = NiagaraScript_761_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
NiagaraRandInfo NiagaraScript_753_Emitter_Determinism_false_Func_Output_RandomInfo;
bool NiagaraScript_753_Emitter_Determinism_false_Func_Output_UseDeterministicRandoms;
NiagaraScript_753_Emitter_Determinism_false_Func_(In_Seed, Constant70, In_OverrideSeed, Constant72, Constant73, Constant74, In_RandomnessMode, NiagaraScript_753_Emitter_Determinism_false_Func_Output_RandomInfo, NiagaraScript_753_Emitter_Determinism_false_Func_Output_UseDeterministicRandoms, Context);
Seed1 = NiagaraScript_753_Emitter_Determinism_false_Func_Output_RandomInfo.Seed1;
Seed2 = NiagaraScript_753_Emitter_Determinism_false_Func_Output_RandomInfo.Seed2;
Seed3 = NiagaraScript_753_Emitter_Determinism_false_Func_Output_RandomInfo.Seed3;
float3 NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue;
bool NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant121, Output12, Output13, In_Seed, Constant127, Constant128, Constant129, Constant130, NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue, NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
Phi = NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue.x;
CosASC40ThetaASC41 = NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue.y;
RASC943 = NiagaraScript_742_ScriptUsage4_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomValue.z;
float3 NiagaraScript_768_Func_Output_Output;
NiagaraScript_768_Func_(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity.DragIgnoreMass, NiagaraScript_768_Func_Output_Output, Context);
float3 Result111 = NiagaraScript_768_Func_Output_Output - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = NiagaraScript_768_Func_Output_Output;
float NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
bool NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic;
NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant220, Constant221, Constant222, Constant223, Constant224, Constant225, Constant226, Constant227, NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat, NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat;
float NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
bool NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1;
NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant233, Constant234, Constant235, Constant236, Constant237, Constant238, Constant239, Constant240, NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1, NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1;
float NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
bool NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2;
NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant244, Constant245, Constant246, Constant247, Constant248, Constant249, Constant250, Constant251, NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2, NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2, Context);
Out_UniformRangedFloat = NiagaraScript_761_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2;
EnterStatScope(10 /**SpawnScript_1_1_Main*/);
Context.MapSpawn.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + ExecIndex();
Context.MapUpdate.Emitter.SpawnInterval = Emitter_SpawnInterval;
Context.MapUpdate.Emitter.InterpSpawnStartDt = Emitter_InterpSpawnStartDt;
Context.MapUpdate.Emitter.SpawnGroup = Emitter_SpawnGroup;
Context.MapSpawn.Engine.ExecIndex = ExecIndex();
EnterStatScope(11 /**SpawnScript_1_1_MapSpawnMain*/);
ExitStatScope(/**SpawnScript_1_1_MapSpawnMain*/);
//Begin Transfer of Attributes!
//End Transfer of Attributes!
Context.MapUpdate.Engine.ExecIndex = ExecIndex();
EnterStatScope(12 /**SpawnScript_1_1_MapUpdateMain*/);
ExitStatScope(/**SpawnScript_1_1_MapUpdateMain*/);
bool bValid = Context.MapUpdate.DataInstance.Alive;
int TmpWriteIndex = OutputIndex(0, true, bValid);
OutputDataFloat(0, 0, TmpWriteIndex, Context.MapUpdate.Particles.Age);
OutputDataFloat(0, 1, TmpWriteIndex, Context.MapUpdate.Particles.Color.r);
OutputDataFloat(0, 2, TmpWriteIndex, Context.MapUpdate.Particles.Color.g);
OutputDataFloat(0, 3, TmpWriteIndex, Context.MapUpdate.Particles.Color.b);
OutputDataFloat(0, 4, TmpWriteIndex, Context.MapUpdate.Particles.Color.a);
OutputDataFloat(0, 5, TmpWriteIndex, Context.MapUpdate.Particles.DistanceTraveled);
OutputDataFloat(0, 6, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_density);
OutputDataFloat(0, 7, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_divergence);
OutputDataFloat(0, 8, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_falloff);
OutputDataFloat(0, 9, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_noiseIntensity);
OutputDataFloat(0, 10, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_noiseScale);
OutputDataFloat(0, 11, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_radius);
OutputDataFloat(0, 12, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_temperature);
OutputDataFloat(0, 13, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.x);
OutputDataFloat(0, 14, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.y);
OutputDataFloat(0, 15, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_velocity.z);
OutputDataFloat(0, 16, TmpWriteIndex, Context.MapUpdate.Particles.fluids_source_velocityScale);
OutputDataFloat(0, 17, TmpWriteIndex, Context.MapUpdate.Particles.Initial.Color.r);
OutputDataFloat(0, 18, TmpWriteIndex, Context.MapUpdate.Particles.Initial.Color.g);
OutputDataFloat(0, 19, TmpWriteIndex, Context.MapUpdate.Particles.Initial.Color.b);
OutputDataFloat(0, 20, TmpWriteIndex, Context.MapUpdate.Particles.Initial.Color.a);
OutputDataFloat(0, 21, TmpWriteIndex, Context.MapUpdate.Particles.Lifetime);
OutputDataFloat(0, 22, TmpWriteIndex, Context.MapUpdate.Particles.Mass);
OutputDataFloat(0, 23, TmpWriteIndex, Context.MapUpdate.Particles.MaterialRandom);
OutputDataFloat(0, 24, TmpWriteIndex, Context.MapUpdate.Particles.NormalizedAge);
OutputDataFloat(0, 25, TmpWriteIndex, Context.MapUpdate.Particles.Position.x);
OutputDataFloat(0, 26, TmpWriteIndex, Context.MapUpdate.Particles.Position.y);
OutputDataFloat(0, 27, TmpWriteIndex, Context.MapUpdate.Particles.Position.z);
OutputDataFloat(0, 28, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.x);
OutputDataFloat(0, 29, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.y);
OutputDataFloat(0, 30, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.PhysicsForce.z);
OutputDataFloat(0, 31, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Position.x);
OutputDataFloat(0, 32, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Position.y);
OutputDataFloat(0, 33, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Position.z);
OutputDataFloat(0, 34, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.x);
OutputDataFloat(0, 35, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.y);
OutputDataFloat(0, 36, TmpWriteIndex, Context.MapUpdate.Particles.Presolve.Velocity.z);
OutputDataFloat(0, 37, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Position.x);
OutputDataFloat(0, 38, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Position.y);
OutputDataFloat(0, 39, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Position.z);
OutputDataFloat(0, 40, TmpWriteIndex, Context.MapUpdate.Particles.Previous.SpriteRotation);
OutputDataFloat(0, 41, TmpWriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 42, TmpWriteIndex, Context.MapUpdate.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 43, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Velocity.x);
OutputDataFloat(0, 44, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Velocity.y);
OutputDataFloat(0, 45, TmpWriteIndex, Context.MapUpdate.Particles.Previous.Velocity.z);
OutputDataFloat(0, 46, TmpWriteIndex, Context.MapUpdate.Particles.RotationalInertia);
OutputDataFloat(0, 47, TmpWriteIndex, Context.MapUpdate.Particles.RotationalVelocity.x);
OutputDataFloat(0, 48, TmpWriteIndex, Context.MapUpdate.Particles.RotationalVelocity.y);
OutputDataFloat(0, 49, TmpWriteIndex, Context.MapUpdate.Particles.RotationalVelocity.z);
OutputDataFloat(0, 50, TmpWriteIndex, Context.MapUpdate.Particles.Scale.x);
OutputDataFloat(0, 51, TmpWriteIndex, Context.MapUpdate.Particles.Scale.y);
OutputDataFloat(0, 52, TmpWriteIndex, Context.MapUpdate.Particles.Scale.z);
OutputDataFloat(0, 53, TmpWriteIndex, Context.MapUpdate.Particles.SpriteRotation);
OutputDataFloat(0, 54, TmpWriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 55, TmpWriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataInt(0, 0, TmpWriteIndex, Context.MapUpdate.Particles.UniqueID);
OutputDataFloat(0, 56, TmpWriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 57, TmpWriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 58, TmpWriteIndex, Context.MapUpdate.Particles.Velocity.z);
ExitStatScope(/**SpawnScript_1_1_Main*/);
bool Result = NiagaraAll(Context.Map.Particles.Age <= Context.Map.Engine.DeltaTime);
Context.Map.OUTPUT_VAR.ParticleState.FirstFrame = Result;
Context.Map.Transient.FirstFrame = Result;
float Result1 = Context.Map.Particles.Age + Context.Map.ParticleState.DeltaTime;
float Constant1 = 1e-05;
float Result2 = max(Context.Map.ParticleState.Lifetime, Constant1);
float Constant2 = 0.0001;
float Result3 = Result2 - Constant2;
bool Result4 = NiagaraAll(Result1 < Result3);
bool Constant3 = false;
bool_IfResult = Context.Map.DataInstance.Alive;
bool_IfResult = Constant3;
float Result5 = Result1 / Result2;
Context.Map.DataInstance.Alive = bool_IfResult;
Context.Map.Particles.Age = Result1;
Context.Map.Particles.NormalizedAge = Result5;
bool Constant5 = true;
SampleCurve_Emitter_ScaleAlpha_FloatCurve(Context.Map.FloatFromCurve.CurveIndex, SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value);
float Result6 = SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value * Constant7;
Out_Value = Result6;
float3 Constant10 = float3(1,1,1);
Output0.r = Constant10.x;
Output0.g = Constant10.y;
Output0.b = Constant10.z;
Output0.a = Context.Map.ScaleColor.ScaleAlpha;
float4 Result7 = Context.Map.Transient.ParticleColorScaleFactor * Output0;
float4 Result8 = Context.Map.ScaleColor.ColorValueToScale * Result7;
Context.Map.Particles.Color = Result8;
Context.Map.Transient.ParticleColorScaleFactor = Result7;
float3 Result15 = In_Velocity - In_AdvectionVelocity;
float Result16 = In_Drag * In_InverseMass;
float NiagaraFloat_SelectResult = Constant20;
NiagaraFloat_SelectResult = Result16;
float Constant21 = 0;
float Result17 = max(NiagaraFloat_SelectResult, Constant21);
float Result18 = Result17 * In_DeltaTime;
float Constant22 = 1;
float Result19 = Result18 + Constant22;
float3 Result20 = Result15 / Result19;
float3 Result21 = Result20 + In_AdvectionVelocity;
Out_Output = Result21;
Context.Map.Local.SolveForcesAndVelocity.DeltaTime = Context.Map.SolveForcesAndVelocity.DeltaTime;
float Constant18 = 1e-05;
float Result9 = max(Context.Map.Local.SolveForcesAndVelocity.DeltaTime, Constant18);
float Result10 = Reciprocal(Result9);
Context.Map.Local.SolveForcesAndVelocity.InverseDeltaTime = Result10;
Context.Map.Local.SolveForcesAndVelocity.PhysicsForce = Context.Map.SolveForcesAndVelocity.Force;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce = Context.Map.SolveForcesAndVelocity.Force;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.Map.SolveForcesAndVelocity.Velocity;
Context.Map.Local.SolveForcesAndVelocity.Mass = Context.Map.SolveForcesAndVelocity.Mass;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Position = Context.Map.SolveForcesAndVelocity.Position;
Context.Map.Particles.Presolve.Velocity = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.Map.Particles.Presolve.Position = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.Map.Particles.Presolve.PhysicsForce = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce;
float Constant19 = 1e-06;
float Result11 = max(Context.Map.Local.SolveForcesAndVelocity.Mass, Constant19);
float Result12 = Reciprocal(Result11);
float3 Result13 = Result12 * Context.Map.Local.SolveForcesAndVelocity.PhysicsForce;
Context.Map.Local.SolveForcesAndVelocity.PhysicsForce = Result13;
Context.Map.Local.SolveForcesAndVelocity.InverseMass = Result12;
float3 Result14 = Context.Map.Local.SolveForcesAndVelocity.PhysicsForce * Context.Map.Local.SolveForcesAndVelocity.DeltaTime + Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Result14;
Context.Map.Local.SolveForcesAndVelocity.AdvectionVelocity = Context.Map.Transient.AdvectionVelocity;
Context.Map.Local.SolveForcesAndVelocity.PhysicsDrag = Context.Map.Transient.PhysicsDrag;
Context.Map.Local.SolveForcesAndVelocity.DragIgnoreMass = Context.Map.Transient.DragIgnoreMass;
NiagaraScript_768_Particle_Func_(Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity, Context.Map.Local.SolveForcesAndVelocity.AdvectionVelocity, Context.Map.Local.SolveForcesAndVelocity.InverseMass, Context.Map.Local.SolveForcesAndVelocity.PhysicsDrag, Context.Map.Local.SolveForcesAndVelocity.DeltaTime, Context.Map.Local.SolveForcesAndVelocity.DragIgnoreMass, NiagaraScript_768_Particle_Func_Output_Output, Context);
float3 Result22 = NiagaraScript_768_Particle_Func_Output_Output - Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = NiagaraScript_768_Particle_Func_Output_Output;
Context.Map.Local.SolveForcesAndVelocity.DragVelocity = Result22;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsDrag = Context.Map.Local.SolveForcesAndVelocity.PhysicsDrag;
float Constant23 = 1000;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
float Constant24 = 9999;
float3 Result23 = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity * Context.Map.Local.SolveForcesAndVelocity.DeltaTime;
float3 Result24 = Result23 + Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Position = Result24;
Position_IfResult = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Velocity_IfResult = Context.Map.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Position_IfResult = Context.Map.Particles.Position;
Velocity_IfResult = Context.Map.Particles.Velocity;
Context.Map.Particles.Position = Position_IfResult;
Context.Map.Particles.Velocity = Velocity_IfResult;
float3 Constant25 = float3(0,0,0);
float Constant26 = 0;
ForceVector_IfResult = Constant25;
Drag_IfResult = Constant26;
ForceVector_IfResult = Context.Map.Transient.PhysicsForce;
Drag_IfResult = Context.Map.Transient.PhysicsDrag;
Context.Map.Transient.PhysicsForce = ForceVector_IfResult;
Context.Map.Transient.PhysicsDrag = Drag_IfResult;
float3 Result25 = Context.Map.Particles.Position - Context.Map.Particles.Previous.Position;
float Result26 = length(Result25);
float Constant27 = 0.3333;
float Result27 = Result26 * Constant27;
float Constant28 = 1e+08;
float Result28 = Modulo(Context.Map.Particles.DistanceTraveled, Constant28);
float Result29 = Result27 + Result28;
Context.Map.Particles.DistanceTraveled = Result29;
bool Constant43 = false;
float Result30 = In_FloatMax - In_FloatMin;
int Constant44 = -1005805596;
float Result31 = rand_float(Result30, Context.Map.Particles.UniqueID, Constant44, Context.Map.Engine.Emitter.InstanceSeed);
float Result32 = In_FloatMin + Result31;
Out_RandomFloat = Result32;
Out_IsDeterministic = Constant43;
int Constant35 = (0);
float Constant36 = 2;
float Constant37 = 4;
int Constant38 = 0;
int Constant39 = (0);
int Constant40 = 0;
int Constant41 = (0);
NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant35, Constant36, Constant37, Constant38, Constant39, Constant40, Constant41, Constant42, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic, Context);
float Constant49 = 1;
float Constant50 = 2;
int Constant51 = 0;
int Constant52 = (0);
int Constant53 = 0;
int Constant54 = (0);
int Constant55 = (0);
NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant48, Constant49, Constant50, Constant51, Constant52, Constant53, Constant54, Constant55, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat1, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic1, Context);
int Constant59 = (0);
float Constant61 = 2;
int Constant62 = 0;
int Constant64 = 0;
int Constant65 = (0);
int Constant66 = (0);
NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Constant59, Constant60, Constant61, Constant62, Constant63, Constant64, Constant65, Constant66, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_RandomFloat2, NiagaraScript_761_Particle_Particle_ScriptUsage5_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_IsDeterministic2, Context);
SampleCurve_Emitter_Radius_FloatCurve(Context.Map.FloatFromCurve004.CurveIndex, SampleCurve_Emitter_Radius_FloatCurveOutput_Value);
float Result33 = SampleCurve_Emitter_Radius_FloatCurveOutput_Value * Context.Map.FloatFromCurve004.ScaleCurve;
Out_Value = Result33;
SampleCurve_Emitter_Temperature_FloatCurve(Context.Map.FloatFromCurve001.CurveIndex, SampleCurve_Emitter_Temperature_FloatCurveOutput_Value);
float Result34 = SampleCurve_Emitter_Temperature_FloatCurveOutput_Value * Context.Map.FloatFromCurve001.ScaleCurve;
Out_Value = Result34;
float Constant72 = 2;
float Constant73 = 1;
float Constant74 = 4;
float Constant75 = 12;
float Constant76 = 1;
Context.Map.Particles.fluids_source_density = Constant72;
Context.Map.Particles.fluids_source_falloff = Constant73;
Context.Map.Particles.fluids_source_noiseIntensity = Constant74;
Context.Map.Particles.fluids_source_noiseScale = Constant75;
Context.Map.Particles.fluids_source_radius = Context.Map.Fluids_Gas_Source.Radius;
Context.Map.Particles.fluids_source_temperature = Context.Map.Fluids_Gas_Source.Temperature;
Context.Map.Particles.fluids_source_velocityScale = Context.Map.Fluids_Gas_Source.VelocityScale;
Context.Map.Particles.fluids_source_velocity = Context.Map.Fluids_Gas_Source.Velocity;
Context.Map.Particles.fluids_source_divergence = Constant76;
float Constant78 = 2;
float Result35 = Context.Map.Multiply_Float.A * Constant78;
Out_Result = Result35;
Output1.x = Context.Map.Vector2DFromFloat001.Value;
Output1.y = Context.Map.Vector2DFromFloat001.Value;
Context.Map.Particles.SpriteSize = Context.Map.SetVariables_BDEC693D447651B764B3B6BBF3065841.Particles.SpriteSize;
EnterStatScope(0 /**UpdateScript_1_2*/);
Context.Map.DataInstance.Alive = Constant;
Context.Map.ParticleState.DeltaTime = Context.Map.Engine.DeltaTime;
Context.Map.ParticleState.Lifetime = Context.Map.Particles.Lifetime;
EnterStatScope(1 /**ParticleState_Emitter_Func_*/);
Context.Map.FloatFromCurve.CurveIndex = Context.Map.Particles.NormalizedAge;
Context.Map.ScaleColor.ScaleAlpha = FloatFromCurve_Emitter_Func_Output_Value;
Context.Map.ScaleColor.ColorValueToScale = Context.Map.Particles.Initial.Color;
float4 Constant8 = float4(1,1,1,1);
Context.Map.Transient.ParticleColorScaleFactor = Constant8;
float3 Constant9 = float3(1,1,1);
EnterStatScope(2 /**ScaleColor_Emitter_Func_*/);
Context.Map.Transient.PhysicsDeltaTime = Context.Map.Engine.DeltaTime;
Context.Map.SolveForcesAndVelocity.DeltaTime = Context.Map.Transient.PhysicsDeltaTime;
float3 Constant11 = float3(0,0,0);
Context.Map.Transient.PhysicsForce = Constant11;
Context.Map.SolveForcesAndVelocity.Force = Context.Map.Transient.PhysicsForce;
Context.Map.SolveForcesAndVelocity.Velocity = Context.Map.Particles.Velocity;
Context.Map.SolveForcesAndVelocity.Mass = Context.Map.Particles.Mass;
Context.Map.SolveForcesAndVelocity.Position = Context.Map.Particles.Position;
float3 Constant12 = float3(0,0,0);
Context.Map.Transient.AdvectionVelocity = Constant12;
Context.Map.Transient.PhysicsDrag = Constant13;
bool Constant14 = true;
Context.Map.Transient.DragIgnoreMass = Constant14;
float Constant15 = 1000;
Context.Map.SolveForcesAndVelocity.PreviousVelocity = Context.Map.Particles.Previous.Velocity;
float Constant16 = 9999;
Context.Map.SolveForcesAndVelocity.WritetoIntrinsicProperties = Constant17;
EnterStatScope(3 /**SolveForcesAndVelocity_Emitter_Func_*/);
float Constant32 = 2;
float Constant33 = 4;
int Constant34 = 0;
float Constant45 = 1;
float Constant46 = 2;
Context.Map.FloatFromCurve004.ScaleCurve = RandomRangeFloat004_Emitter_Func_Output_UniformRangedFloat;
Context.Map.FloatFromCurve001.ScaleCurve = RandomRangeFloat005_Emitter_Func_Output_UniformRangedFloat;
float Constant56 = 1;
float Constant57 = 2;
int Constant58 = 0;
Context.Map.FloatFromCurve004.CurveIndex = Context.Map.Particles.NormalizedAge;
Context.Map.FloatFromCurve001.CurveIndex = Context.Map.Particles.NormalizedAge;
Context.Map.Fluids_Gas_Source.VelocityScale = RandomRangeFloat006_Emitter_Func_Output_UniformRangedFloat;
Context.Map.Fluids_Gas_Source.Radius = FloatFromCurve004_Emitter_Func_Output_Value;
Context.Map.Fluids_Gas_Source.Temperature = FloatFromCurve001_Emitter_Func_Output_Value;
float Constant67 = 2;
float Constant69 = 4;
float Constant70 = 12;
Context.Map.Fluids_Gas_Source.Velocity = Context.Map.Particles.Velocity;
float Constant71 = 1;
EnterStatScope(4 /**Fluids_Gas_Source_Emitter_Func_*/);
Context.Map.Multiply_Float.A = Context.Map.Particles.fluids_source_radius;
float Constant77 = 2;
Context.Map.Vector2DFromFloat001.Value = Multiply_Float_Emitter_Func_Output_Result;
Context.Map.SetVariables_BDEC693D447651B764B3B6BBF3065841.Particles.SpriteSize = Vector2DFromFloat001_Emitter_Func_Output_Vec2;
EnterStatScope(5 /**SetVariables_BDEC693D447651B764B3B6BBF3065841_Emitter_Func_*/);
ExitStatScope(/**UpdateScript_1_2*/);
EnterStatScope(6 /**UpdateScript_1_2_Main*/);
Context.Map.Particles.Age = InputDataFloat(0, 0);
Context.Map.Array.Age = 0;
Context.Map.Particles.Color.r = InputDataFloat(0, 1);
Context.Map.Array.Color = 1;
Context.Map.Particles.Color.g = InputDataFloat(0, 2);
Context.Map.Array.Color = 2;
Context.Map.Particles.Color.b = InputDataFloat(0, 3);
Context.Map.Array.Color = 3;
Context.Map.Particles.Color.a = InputDataFloat(0, 4);
Context.Map.Array.Color = 4;
Context.Map.Particles.DistanceTraveled = InputDataFloat(0, 5);
Context.Map.Array.DistanceTraveled = 5;
Context.Map.Particles.fluids_source_density = InputDataFloat(0, 6);
Context.Map.Array.fluids_source_density = 6;
Context.Map.Particles.fluids_source_divergence = InputDataFloat(0, 7);
Context.Map.Array.fluids_source_divergence = 7;
Context.Map.Particles.fluids_source_falloff = InputDataFloat(0, 8);
Context.Map.Array.fluids_source_falloff = 8;
Context.Map.Particles.fluids_source_noiseIntensity = InputDataFloat(0, 9);
Context.Map.Array.fluids_source_noiseIntensity = 9;
Context.Map.Particles.fluids_source_noiseScale = InputDataFloat(0, 10);
Context.Map.Array.fluids_source_noiseScale = 10;
Context.Map.Particles.fluids_source_radius = InputDataFloat(0, 11);
Context.Map.Array.fluids_source_radius = 11;
Context.Map.Particles.fluids_source_temperature = InputDataFloat(0, 12);
Context.Map.Array.fluids_source_temperature = 12;
Context.Map.Particles.fluids_source_velocity.x = InputDataFloat(0, 13);
Context.Map.Array.fluids_source_velocity = 13;
Context.Map.Particles.fluids_source_velocity.y = InputDataFloat(0, 14);
Context.Map.Array.fluids_source_velocity = 14;
Context.Map.Particles.fluids_source_velocity.z = InputDataFloat(0, 15);
Context.Map.Array.fluids_source_velocity = 15;
Context.Map.Particles.fluids_source_velocityScale = InputDataFloat(0, 16);
Context.Map.Array.fluids_source_velocityScale = 16;
Context.Map.Particles.Initial.Color.r = InputDataFloat(0, 17);
Context.Map.Array.Initial.Color = 17;
Context.Map.Particles.Initial.Color.g = InputDataFloat(0, 18);
Context.Map.Array.Initial.Color = 18;
Context.Map.Particles.Initial.Color.b = InputDataFloat(0, 19);
Context.Map.Array.Initial.Color = 19;
Context.Map.Particles.Initial.Color.a = InputDataFloat(0, 20);
Context.Map.Array.Initial.Color = 20;
Context.Map.Particles.Lifetime = InputDataFloat(0, 21);
Context.Map.Array.Lifetime = 21;
Context.Map.Particles.Mass = InputDataFloat(0, 22);
Context.Map.Array.Mass = 22;
Context.Map.Particles.MaterialRandom = InputDataFloat(0, 23);
Context.Map.Array.MaterialRandom = 23;
Context.Map.Particles.NormalizedAge = InputDataFloat(0, 24);
Context.Map.Array.NormalizedAge = 24;
Context.Map.Particles.Position.x = InputDataFloat(0, 25);
Context.Map.Array.Position = 25;
Context.Map.Particles.Position.y = InputDataFloat(0, 26);
Context.Map.Array.Position = 26;
Context.Map.Particles.Position.z = InputDataFloat(0, 27);
Context.Map.Array.Position = 27;
Context.Map.Particles.Presolve.PhysicsForce.x = InputDataFloat(0, 28);
Context.Map.Array.Presolve.PhysicsForce = 28;
Context.Map.Particles.Presolve.PhysicsForce.y = InputDataFloat(0, 29);
Context.Map.Array.Presolve.PhysicsForce = 29;
Context.Map.Particles.Presolve.PhysicsForce.z = InputDataFloat(0, 30);
Context.Map.Array.Presolve.PhysicsForce = 30;
Context.Map.Particles.Presolve.Position.x = InputDataFloat(0, 31);
Context.Map.Array.Presolve.Position = 31;
Context.Map.Particles.Presolve.Position.y = InputDataFloat(0, 32);
Context.Map.Array.Presolve.Position = 32;
Context.Map.Particles.Presolve.Position.z = InputDataFloat(0, 33);
Context.Map.Array.Presolve.Position = 33;
Context.Map.Particles.Presolve.Velocity.x = InputDataFloat(0, 34);
Context.Map.Array.Presolve.Velocity = 34;
Context.Map.Particles.Presolve.Velocity.y = InputDataFloat(0, 35);
Context.Map.Array.Presolve.Velocity = 35;
Context.Map.Particles.Presolve.Velocity.z = InputDataFloat(0, 36);
Context.Map.Array.Presolve.Velocity = 36;
Context.Map.Particles.RotationalInertia = InputDataFloat(0, 46);
Context.Map.Array.RotationalInertia = 46;
Context.Map.Particles.RotationalVelocity.x = InputDataFloat(0, 47);
Context.Map.Array.RotationalVelocity = 47;
Context.Map.Particles.RotationalVelocity.y = InputDataFloat(0, 48);
Context.Map.Array.RotationalVelocity = 48;
Context.Map.Particles.RotationalVelocity.z = InputDataFloat(0, 49);
Context.Map.Array.RotationalVelocity = 49;
Context.Map.Particles.Scale.x = InputDataFloat(0, 50);
Context.Map.Array.Scale = 50;
Context.Map.Particles.Scale.y = InputDataFloat(0, 51);
Context.Map.Array.Scale = 51;
Context.Map.Particles.Scale.z = InputDataFloat(0, 52);
Context.Map.Array.Scale = 52;
Context.Map.Particles.SpriteRotation = InputDataFloat(0, 53);
Context.Map.Array.SpriteRotation = 53;
Context.Map.Particles.SpriteSize.x = InputDataFloat(0, 54);
Context.Map.Array.SpriteSize = 54;
Context.Map.Particles.SpriteSize.y = InputDataFloat(0, 55);
Context.Map.Array.SpriteSize = 55;
Context.Map.Particles.Velocity.x = InputDataFloat(0, 56);
Context.Map.Array.Velocity = 56;
Context.Map.Particles.Velocity.y = InputDataFloat(0, 57);
Context.Map.Array.Velocity = 57;
Context.Map.Particles.Velocity.z = InputDataFloat(0, 58);
Context.Map.Array.Velocity = 58;
Context.Map.Particles.Position;
Context.Map.Particles.SpriteRotation;
Context.Map.Particles.SpriteSize;
Context.Map.Particles.Velocity;
Context.Map.Engine.DeltaTime = Engine_DeltaTime;
Context.Map.Engine.Owner.Position = Engine_Owner_Position;
Context.Map.Engine.Emitter.ID.ID = 0;
EnterStatScope(7 /**UpdateScript_1_2_MapMain*/);
ExitStatScope(/**UpdateScript_1_2_MapMain*/);
bool bValid = Context.Map.DataInstance.Alive;
OutputDataFloat(0, 0, TmpWriteIndex, Context.Map.Particles.Age);
OutputDataFloat(0, 1, TmpWriteIndex, Context.Map.Particles.Color.r);
OutputDataFloat(0, 2, TmpWriteIndex, Context.Map.Particles.Color.g);
OutputDataFloat(0, 3, TmpWriteIndex, Context.Map.Particles.Color.b);
OutputDataFloat(0, 4, TmpWriteIndex, Context.Map.Particles.Color.a);
OutputDataFloat(0, 5, TmpWriteIndex, Context.Map.Particles.DistanceTraveled);
OutputDataFloat(0, 6, TmpWriteIndex, Context.Map.Particles.fluids_source_density);
OutputDataFloat(0, 7, TmpWriteIndex, Context.Map.Particles.fluids_source_divergence);
OutputDataFloat(0, 8, TmpWriteIndex, Context.Map.Particles.fluids_source_falloff);
OutputDataFloat(0, 9, TmpWriteIndex, Context.Map.Particles.fluids_source_noiseIntensity);
OutputDataFloat(0, 10, TmpWriteIndex, Context.Map.Particles.fluids_source_noiseScale);
OutputDataFloat(0, 11, TmpWriteIndex, Context.Map.Particles.fluids_source_radius);
OutputDataFloat(0, 12, TmpWriteIndex, Context.Map.Particles.fluids_source_temperature);
OutputDataFloat(0, 13, TmpWriteIndex, Context.Map.Particles.fluids_source_velocity.x);
OutputDataFloat(0, 14, TmpWriteIndex, Context.Map.Particles.fluids_source_velocity.y);
OutputDataFloat(0, 15, TmpWriteIndex, Context.Map.Particles.fluids_source_velocity.z);
OutputDataFloat(0, 16, TmpWriteIndex, Context.Map.Particles.fluids_source_velocityScale);
OutputDataFloat(0, 17, TmpWriteIndex, Context.Map.Particles.Initial.Color.r);
OutputDataFloat(0, 18, TmpWriteIndex, Context.Map.Particles.Initial.Color.g);
OutputDataFloat(0, 19, TmpWriteIndex, Context.Map.Particles.Initial.Color.b);
OutputDataFloat(0, 20, TmpWriteIndex, Context.Map.Particles.Initial.Color.a);
OutputDataFloat(0, 21, TmpWriteIndex, Context.Map.Particles.Lifetime);
OutputDataFloat(0, 22, TmpWriteIndex, Context.Map.Particles.Mass);
OutputDataFloat(0, 23, TmpWriteIndex, Context.Map.Particles.MaterialRandom);
OutputDataFloat(0, 24, TmpWriteIndex, Context.Map.Particles.NormalizedAge);
OutputDataFloat(0, 25, TmpWriteIndex, Context.Map.Particles.Position.x);
OutputDataFloat(0, 26, TmpWriteIndex, Context.Map.Particles.Position.y);
OutputDataFloat(0, 27, TmpWriteIndex, Context.Map.Particles.Position.z);
OutputDataFloat(0, 28, TmpWriteIndex, Context.Map.Particles.Presolve.PhysicsForce.x);
OutputDataFloat(0, 29, TmpWriteIndex, Context.Map.Particles.Presolve.PhysicsForce.y);
OutputDataFloat(0, 30, TmpWriteIndex, Context.Map.Particles.Presolve.PhysicsForce.z);
OutputDataFloat(0, 31, TmpWriteIndex, Context.Map.Particles.Presolve.Position.x);
OutputDataFloat(0, 32, TmpWriteIndex, Context.Map.Particles.Presolve.Position.y);
OutputDataFloat(0, 33, TmpWriteIndex, Context.Map.Particles.Presolve.Position.z);
OutputDataFloat(0, 34, TmpWriteIndex, Context.Map.Particles.Presolve.Velocity.x);
OutputDataFloat(0, 35, TmpWriteIndex, Context.Map.Particles.Presolve.Velocity.y);
OutputDataFloat(0, 36, TmpWriteIndex, Context.Map.Particles.Presolve.Velocity.z);
OutputDataFloat(0, 37, TmpWriteIndex, Context.Map.Particles.Previous.Position.x);
OutputDataFloat(0, 38, TmpWriteIndex, Context.Map.Particles.Previous.Position.y);
OutputDataFloat(0, 39, TmpWriteIndex, Context.Map.Particles.Previous.Position.z);
OutputDataFloat(0, 40, TmpWriteIndex, Context.Map.Particles.Previous.SpriteRotation);
OutputDataFloat(0, 41, TmpWriteIndex, Context.Map.Particles.Previous.SpriteSize.x);
OutputDataFloat(0, 42, TmpWriteIndex, Context.Map.Particles.Previous.SpriteSize.y);
OutputDataFloat(0, 43, TmpWriteIndex, Context.Map.Particles.Previous.Velocity.x);
OutputDataFloat(0, 44, TmpWriteIndex, Context.Map.Particles.Previous.Velocity.y);
OutputDataFloat(0, 45, TmpWriteIndex, Context.Map.Particles.Previous.Velocity.z);
OutputDataFloat(0, 46, TmpWriteIndex, Context.Map.Particles.RotationalInertia);
OutputDataFloat(0, 47, TmpWriteIndex, Context.Map.Particles.RotationalVelocity.x);
OutputDataFloat(0, 48, TmpWriteIndex, Context.Map.Particles.RotationalVelocity.y);
OutputDataFloat(0, 49, TmpWriteIndex, Context.Map.Particles.RotationalVelocity.z);
OutputDataFloat(0, 50, TmpWriteIndex, Context.Map.Particles.Scale.x);
OutputDataFloat(0, 51, TmpWriteIndex, Context.Map.Particles.Scale.y);
OutputDataFloat(0, 52, TmpWriteIndex, Context.Map.Particles.Scale.z);
OutputDataFloat(0, 53, TmpWriteIndex, Context.Map.Particles.SpriteRotation);
OutputDataFloat(0, 54, TmpWriteIndex, Context.Map.Particles.SpriteSize.x);
OutputDataFloat(0, 55, TmpWriteIndex, Context.Map.Particles.SpriteSize.y);
OutputDataFloat(0, 56, TmpWriteIndex, Context.Map.Particles.Velocity.x);
OutputDataFloat(0, 57, TmpWriteIndex, Context.Map.Particles.Velocity.y);
OutputDataFloat(0, 58, TmpWriteIndex, Context.Map.Particles.Velocity.z);
ExitStatScope(/**UpdateScript_1_2_Main*/);
;π…f–Ô¥
BåÄ-û;-m3H
≤ø5;∫H
©ï“;ôO∫‡£]Òµ€
øLìr£;
;π„ö¯ü)@¥
ÇÖ∏ŒKr¶Líõ;
U;⁄Gâ4•‚¢
Z;ÍêK’Gô¥æNp
zŸ;#B∂õk
QñÛkTWFâ⁄#;∆G
*NñS∂≠Z;QùH
ÍÂ‡ª≤Dµ·tépc;
j;±4Fè¡\ëCëﬁ=H
£Fë*;¶4u<ÔH
Dº"LS;Ç4$H
npOÄ£k;•åUÁH
¡É*ûóˆ•Ä.;ƒ—
i†¥Më;


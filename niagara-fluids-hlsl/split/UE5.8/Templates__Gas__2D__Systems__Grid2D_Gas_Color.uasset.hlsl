 vÖ.˝PCO∫F&
„Öaï∫¢∏K™ëU;ç√
3∑Ë;qLµ
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
‘0Ï⁄;˘oEé%Y
ﬂ\ŸEû;˝¬
MöO;(ñL‰ÊŸ
.;óÚ€ré®äe˛8
ôÎj_ïqÉNªgq;Ω>
≥§≥;M
J;˜|I+¢I∞ô°
É_%X¯VaÎ£;AO&,
!œ:Ñßy+xÑÍ;z
\)ê;˚ÔÜ‚3”Zo
Z|agO}ï3ävS¶hLs;ùˆ9M
LLú/ë±M‘Ë;˘
LLú/ë±M‘Ë;A
≤ˇ£]Ï;l…X‡œG0M
npOÄ£k;•åUÁ¬
Ë∆=KñÈ6»/ÌÙéK;
[m≤9NôÊ!D>;€ﬁ
N∞…"`ØAá;B
N∞…"`ØAá;A
â4;  M
;A±ÀŒ|aﬁ_^6
;¥WC<€˝É
0O©jD5õåv;B
0O©jD5õåv;A
∏[RÈ;à=
J¬;‡@,
¥6Ûc¢;X≠
K∫ßK¥ˇ‘47ö˙õå);¶E∑
˝˚Jºt;‚÷
;á≤¢–C¢û»(®M
˘<[lLØPs;Tb¶oM
À‚})H¶¶ÖbÁ…;˝M
å;"ZπH†.Ïn]
m}øI/ëáFü†°;Ù'2™M
ÖÎ7∂°;DCøU4Ôpã£8
¥FOÑ@;(Öfï
ÀÙnÓJ†;”
Fó\ã`Ò;WØ
w;º,Jë
.;@ëØ˙Oô»
XÚ;ÿO£[ Ÿ$^ëHG
XÚ;ÿO£[ Ÿ$^ëH%
;¢¶/âH™K≤
Mœ?rr;ƒKß≠Í∑
BåÄ-û;-m3î
N∞…"`ØAá;ˇ
åZoùÖKàä;X¸"å®ì
/PƒBç[õ7;Fp£Q
/PƒBç[õ7;Fp£%
XÚ;ÿO£[ Ÿ$^ëH`
/PƒBç[õ7;Fp£j
Å;â˙CüM
ó;#ºsE\O¢§„¯6
!’Ì)°ÅGÉ;¥
ÔLCÜ«;
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
M;L√Hå´A¢Ñû"V¥-xH
êŸ]Ê¥HzI¶ä;ç
VC_Force = float2(0,0);
float grad_curl_length = length(grad_curl);
  VC_Force = vorticity * dx * grad_curl / grad_curl_length;
Hì7-ë;ﬂ
¥ã;H´?Çê2¶§˜õ
¥ã;H´?Çê2¶§˜
÷ÍPg;/)Dûg
˘´0ò¯;
;^’OÇfÁÓçw+r
n·¶Lè1ÎÉ‚}È€;
£;n4‰EfC∞Ì
j†≥Ô∞;
W`Äd˘å°B≥t¥÷;ƒk|H
â%ΩmîkØAîIä;@|D≠≤
â%ΩmîkØAîIä;@|D≠&
ÁrÔª’WO¥_ÇŒ¸W;
¶o$Dó8?"&;e
;≠éO™ødOÜÁ
;3ÜKê/ª[lÖjª
;3ÜKê/ª[lÖjM
 V™¥Ä≥jOò
∆;|óºL¨î¢†∞%µ?ƒ
∆;|óºL¨î¢†∞%µ?
;äB%ΩáUD±
Ë"t;Cü
≤‰≤Tè8;E∫ùT&êó){M
"$ƒÏkUXIóäÛ;o∫Àƒ
J±„}SÁ;ﬁÎ
T]G`—⁄;Fèe•ˆœŒÍ‹H
™;ïu£¥(EëÛ˜áù
g`ä;ÅKπ
åZoùÖKàä;X¸"å®
Pª÷;ıãıMè
\ò¿Mã·xºg;ˆ¶ú
d˚†—k;
G°‰Ì';
Gæ≤]Ú;ÏÁ.
Gæ≤]Ú;ÏÁ.˚
ÕÕÌÿN í‚—m„Ü Ã˘;F
=≥È˘≠;úF¶˘Ñ˛
;ÒJåBB
;F••¯pa∆+
∆√œŒNæ&;ΩH#˘uˇ
˘<[lLØPs;Tb¶oä
À‚})H¶¶ÖbÁ…;˝ã
;Ké˚å5ôAö
¸¥gq‘ÚôOí;
'¨BÅ:;¯
ËM” ?∫∞JÖLË7§;(∂M
Fó\ã`Ò;WØ%
  z·8Cµ∑
ª˚\∫;∑ﬂB°àÈ…Àr
(\-ΩÏËÊH¢ÌWRKƒ·˜;
˙nzú;%
â%ΩmîkØAîIä;@|D≠1
;3ÜKê/ª[lÖj7
ôåI1ò‰4Iâ/˜c˙Gÿ:;
è¡Uâ;
>jÑ-ÙÀeBÆ®6‘ﬁ∆b¸;
∆;|óºL¨î¢†∞%µ?O
Gæ≤]Ú;ÏÁ.j
∆;|óºL¨î¢†∞%µ?Æ
;˘-∞iC®Vœ‰ëI
e´äõ6Ô‹EÇFVØÊ;’\H
àÁŸ…;ÈD≥
*M† `;
M†báêå;†8ª
M†báêå;†8◊
[ê;$ÿÙ¡GèkÄuÙûÑm
Øåuƒ˚.`Oø(C2ú2.N;
i—|R;@õ…ÈΩ$Ù=(¡
i—|R;@õ…ÈΩ$Ù=(%
·[]I•©ı;¯ﬂJ^ƒ
·[]I•©ı;¯ﬂJ^%
Ω(∑häAµ;ÜµNÓ‚¸∆
Ω(∑häAµ;ÜµNÓ‚¸S
DªÉ`;!»(à
;p∞˝Ô∆"
E–EñA§;QO‰4H
ù;DDî∏}}
Iôè3ˇP;lºH
i—|R;@õ…ÈΩ$Ù=(ÿ
ùlkùK≤;ß˚'0 .⁄
ùlkùK≤;ß˚'0 .%
·[]I•©ı;¯ﬂJ^ﬁ
Fí*d≤œ,;A‡
Fí*d≤œ,;Aÿ
o>;E´_∫ŸILLt‡
o>;E´_∫ŸILLt
ÖΩtmA;≥GØdË
#ée7;ó
ò›HC≠;Ìù5zät‚
ò›HC≠;Ìù5zätü
 N OÑTt⁄PJ
Fé≥‡ä;èFeM
Ω(∑häAµ;ÜµNÓ‚¸È
{•QëÚÜúLù";∂é3¶
∂ÙµO≥;3Yx‘(ÇH
Oæv8;fnz†F
Oá-Òº;?ì≤$
Oá-Òº;?ì≤!
I≠;GñmOº|:•g%
I≠;GñmOº|:•g!
;&Ω5˙)
;&Ω5˙!
;µCHÛ;
·cT˜11 Gì#ÃCw;©W
˝Å+;>D»KëîÂ
∞À;ºO∑
ïô—j•;E´°Úa÷$Ω>F
‹;îÄNºs:
HãÜ;D”&îGF
Näøû—;ù≈ÔF
Näøû—;ù≈Ô!
;ñJªãGâ›K°,ïîX
v;P@Äﬁ√
O≠ø¯˙;
˙ﬂ8áFÚ^JÖ=û;@
5?fXPEΩ~;
júXêL±•=;
ÏfVÉÛ˘;L¨pqÓ\∞ﬁ
lâOö;™Ù(§+∫
w\ Kâ⁄"ü;Eß˛
Oá-Òº;?ì≤ù
I≠;GñmOº|:•g†
;&Ω5˙§
Näøû—;ù≈Ô¡
∞bI≤ ;jMìsπO
XJî∂XÃ;
G∂;PÅûË©M
jK´É˚VL;’⁄
jK´É˚VL;’⁄A
B¨˛]äF,ˇx;
õ∏ä;ΩNhLì„OY˘
~æ£O;ˆ∑B∞ÿqvK≤âmH
7ç!ø–Í:C≤µbã¢|ˆ¶;
çô;<zŒ@É"ô:Ç¡y{H
◊œ-%ïlTE∏;}
≤≥º];EÌ@≤fÇ
§¿j≤?;
*øD=å;
6BáﬂA$ï6Aƒ;
jK´É˚VL;’⁄0
jK´É˚VL;’⁄1
VD¶-¯˛…Ô˚÷;
¥T%P—B±/%àrˆ≠Ú;
;ô^Ã[ÅC¨à¿6
9,ÁÀ¿IIKßÍ;ˇ
z.û˙È;
Ö©u∂xé»Dú†` hÈÚ÷;
;3ÜKê/ª[lÖj
;®√„¡Bî∂(ﬂ…
E®;fVynÔ∫F
–œÌ(;8fGô!vk\>
npOÄ£k;•åUÁß
èÜ;F±ˇ∫éÃ¡∞ ¸
èÜ;F±ˇ∫éÃ¡∞ ö
î¨•±{Ü@@úÀ˛N;¶
q‘ı;EûuCdﬁ&5›
q‘ı;EûuCdﬁ&5›M
â%ΩmîkØAîIä;@|D≠
ø@ô-‘…˙C™;DŒJQ
÷K´;pü0
SÍ;A®t
å®;®HÛ¸GáìW-c
'QD¥m;,°
¸â{éòEæ°Éæ{;yL 
¸â{éòEæ°Éæ{;yLM
óÖ–;å1gBú
q‘ı;EûuCdﬁ&5›-
ìãtàœAêÅÃcùoÕy;
Oá-Òº;?ì≤
 Jí‰˚‡i¥ïrF
⁄>ùJ!∂;IÅ
I≠;GñmOº|:•g
˝cñL;g°^b'
°Ehñ;qß
°Ehñ;q
˝2˚ëüúÜ@âÇÏE˘⁄&;ƒ/ãp:!^A©˘®
l@ùÙ;Ä
°™O±ñ9ö;Œ
˝2˚ëüúÜ@âÇÏE˘⁄&;
ZLı;~¯J
ZLı;~¯
·cT˜11 Gì#ÃCw;©WM
·cT˜11 Gì#ÃCw;©W7
êÙX;‹–#N¶
ŸÚ≈Ï}sz;´
Lïs‚«œ%/;F
Ï}sz;´
Näøû—;ù≈Ô
;ñJªãGâ›K°,ïîX`
;ñJªãGâ›K°,ïîX7
”V;ñ8F
p5%Iü;´êOöÕ2M
˙ﬁ]¢;;Oã¬Áº
y;iDÉ12
Î˙"ñ∂û#B∏-r#;5≤‡
oﬂ˙ëgÚÈG£Ëa;
Â;ÔuJ¢ˇ
NèÎ<#i∑;±o
NèÎ<#i∑;±M
jTjj⁄0¸I¥;[Ñ/˙&„
ÁFû8È\ê“,[;[
L;A£Eü»mV°kM
…;ÄMã3v&Ê'
m;4S:Hßöu≠
 FD±¡Oπ∂
’N™˛'WØ';ÃH
àÜU!;Ç"O∏m∫yÅ
è?˚;Dùß
è?˚;Dù
q{¢|œÙ;Iè|ä
 Vmu’]¸C¶ﬂ=«7‡?˝
zÎ8(ƒ1ØB¶‰;<n‡÷
q;x¬jÀGC†D?¿
Ç;·@åAï>?dûÚM
-LØ…;Ó¡a
ÍZ;çÑM
ÖÎ7∂°;DCøU4Ôpã£8ù
ÖÎ7∂°;DCøU4Ôpã£87
©;Øõ|{)A°b)ìÈ=≥Hû
©;Øõ|{)A°b)ìÈ=≥HM
ˆ˚#EçNØ€;–
p√Op◊;[Iöä
Ì[y6LòÓDÆä¡;lÊd"£
Ì[y6LòÓDÆä¡;lÊd"
“;>u\±J£›“
å¸…ıH;áHå
@6á|èh’Kö≠D!O¢†f{“Í…Rƒ8Fó‡'†N;º
{“Í…Rƒ8Fó‡'†N;º◊
Úz;ë ≤F´PÀ≈:~4ëß
åÚz;ë ≤F´PÀ≈:~4ë
Än;∆PnõN¨#l5.¢áë±
Än;∆PnõN¨#l5.¢áë
Y;€XW€'Kõj©fM%~≥≤
Y;€XW€'Kõj©fM%~≥
BJ∑'-k;//ª
∑ÏÄE´;fØ”⁄_
yò@©º;å0
∑ÏÄE´;fØ”⁄_Ÿ
vCûÏÂê]?Å†lxﬁ”;
¡†æ®∞A;N£
;0¨†Gµ
I¢8;§y‹D∂
lâOö;™Ù(§+∫∆
lâOö;™Ù(§+∫7
èG¶v??;
ø@Õ;˝7L©≥ııg‘tô
M¨;BßBv,=H
=BûVFè[:;°u
i;®Û¨O
=BûVFè[:;°
n˝∑:c¿”Nû“∆—;^TÖ’
n˝∑:c¿”Nû“∆—;^TÖ∏
'dM©’fï;Å9Ÿÿ
'dM©’fï;Å9Ÿˇ
Tèﬁ;Iä
9∏y¸8ÛLÅ`Ì;©ÎB
∂F≤gj;ãvòq
˛ΩOïãÕÃˆ‚;“
<G;•Îˆ
ŸF//îıß
ŸF//îı
ÌÏñJñ‹.M´;úÓs
ó;è(Œ⁄GÑ
Êb`Ö?6ÑHí;X/
„;\UÁwœFπ
;Hà˛ËÒ
Fì∂≠X∂û;±ß
J±„}SÁ;ﬁÎ7
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
;HßñÆ/L7Îi
;HßñÆ/L7ÎiM
põ;/ H}IîòrL
"$ƒÏkUXIóäÛ;o∫Àƒ7
â;Lûn≤º+6.!H
v‰êPÑÑPGñ;‹c4ÚT“M
#Üs;‡¯
ü√l£NÏ›MÖjÏˇ;¨
¡⁄;*QÛíKì˚
îO6Cõ;1^
≥ãŒV;`3eNÇ
ãŒV;`3eNÇ
ßh2ƒ6;+ù„ADæY
Ä%;Wfi‚H¢l
ƒ6;+ù„ADæY
kZÿ›(ü˝MçHt„Ií^H;
¸â{éòEæ°Éæ{;yL<
q‘ı;EûuCdﬁ&5›O
q‘ı;EûuCdﬁ&5›g
Ò;ºŒıC©‘0
ZLı;~¯É
·cT˜11 Gì#ÃCw;©WÜ
;ñJªãGâ›K°,ïîXô
NèÎ<#i∑;±¨
éLù(;Y¸r\™º
éLù(;Y¸r\™
hÔúiâNÜ\E;d7&£º
hÔúiâNÜ\E;d7&£M
ÖÎ7∂°;DCøU4Ôpã£8⁄
©;Øõ|{)A°b)ìÈ=≥H€
õBºLƒÓ*sL;M
 LåÉØ Ÿc:≤ÿ¯Ó7;ØjO£
 LåÉØ Ÿc:≤
ÿ¯Ó7;ØjO£
Än;∆PnõN¨#l5.¢áëÚ
Y;€XW€'Kõj©fM%~≥Û
n˝∑:c¿”Nû“∆—;^TÖ
'dM©’fï;Å9Ÿ
o≠ègEã¡Õ;:zÆˆ)
o≠ègEã¡Õ;:zÆˆ
»ÎïˆdàeL•;™≠å+‡˝/
»ÎïˆdàeL•;™≠å+‡˝»
…M˜∆ËàEÅû```2éU;
€Òhy∞^SNâûç“!ËÉ);
J±„}SÁ;ﬁÎK
;HßñÆ/L7Îi`
"$ƒÏkUXIóäÛ;o∫Àƒh
˙Ωê≤N≠;»‘¸LØîz
Nalñ;sãmI◊«xLÇÊÿ
˙Ωê≤N≠;»‘¸LØî
Ñöe≥`@;@£ËX≈
OÑò~öj«};û
OÑò~öj«};M
7@9ó;ïé‰h
7@9ó;ï
;^’OÇfÁÓçw+r¢
;^’OÇfÁÓçw+ré
Q/*<±åwKìB;…ˆ0ZáM
f;:ú|äF≤
 YS"ísÇO∞˛@YV…A+H
Dô«;ı+0/>
0ÖûÊ;S{Aâí1QJ
WKé∏u;÷Q“"≤
WKé∏u;÷Q“"
ÕF´∏•;‰aÚ∞
··Nª;2MÆ¥ù
äGÉ¯æ ;yˇ]
¨;EHª≥ì·a!
æU∞BÌ1YGâ;≠N8-
ÍJõP≠;•Bñ÷9(π]-¡«
ÍJõP≠;•Bñ÷9(π]-¡
mß;J\H$D†˙%åÚtF
≥pπ;Ï–
≥pπ;Ïw
;{oûLª«A¶å
GM7˜›ÃvF∑;øO˜ïÉÏ
 Vmu’]¸C¶ﬂ=«7‡?˝’
 Vmu’]¸C¶ﬂ=«7‡?˝ 
 BØ˘ÜˆIå7JW]Fiù
8;ÏéEø"Y<
IïòŒkñÅD£>Óg$D];
Á°;·◊ﬁHK∂6
|ÓΩ‰;ﬁ
˛nO‘D©r≤‡k6o;
/PƒBç[õ7;Fp£
Î˙"ñ∂û#B∏-r#;5≤‡‚
Î˙"ñ∂û#B∏-r#;5≤‡>
w\ Kâ⁄"ü;Eß˛Á
w\ Kâ⁄"ü;Eß˛⁄
˙ˆ”@Ω;∂lI,;U
Gänf*≥¯FôÖ;L
5¸òC];H©
o?™;ªªÌ
o?™;ªª
Rm&;@µ,Õp€LjêÚ
Rm&;@µ,Õp€Ljê“
•1{ÈDµ’h=+˜;öH
Ôâ^öŸr;AüÊ“rÕO
XÚ;ÿO£[ Ÿ$^ëH
ø@Õ;˝7L©≥ııg‘tô˙
ø@Õ;˝7L©≥ııg‘tôÙ
π,;XU∑µL¨DTÿ6¶·
 frëD<€D¨Òy*·{K
jTjj⁄0¸I¥;[Ñ/˙&„ä
∂F≤gj;ãvòqå
BFiÛ;K≤Fô!
UŸOò$K`;LÂ6
˛ΩOïãÕÃˆ‚;“*
;ÄnL#„⁄I∂
N88w∆UB≤™^Ω´Œ;
w˘M; }˝Oï$
üE;*óÜ
&D∞BÈx≥;Ë‹
BJ∑'-k;//ªæ
;^’OÇfÁÓçw+r!
ÇáÊ‡‡;
oô‹˝uáHMìr¶Üﬂph2;
¶¨,»l∆LÄ˛î9S©˛);
ÍJõP≠;•Bñ÷9(π]-¡E
≥pπ;ÏN
 Vmu’]¸C¶ﬂ=«7‡?˝U
|ÓΩ‰;^
Î˙"ñ∂û#B∏-r#;5≤‡b
w\ Kâ⁄"ü;Eß˛g
o?™;ªªm
Rm&;@µ,Õp€Ljêr
ø@Õ;˝7L©≥ııg‘tôz
jTjj⁄0¸I¥;[Ñ/˙&„Ñ
∂F≤gj;ãvòqÑ
UŸOò$K`;LÂ6à
˛ΩOïãÕÃˆ‚;
üE;*óò
BJ∑'-k;//ªõ
É‡Â˘ˇ;NBëı
◊ˇDA;M
ñâ&;F∂Ûä\
»ÎïˆdàeL•;™≠å+‡˝
;^’OÇfÁÓçw+rß
¿,;‡ìe√Fõ
·[]I•©ı;¯ﬂJ^
å5ò≤L°ïπ˜o≠;
[ê;$ÿÙ¡GèkÄuÙûÑm∂
[ê;$ÿÙ¡GèkÄuÙûÑmw
¬;Hò™]B7≈xc
M†báêå;†8
i—|R;@õ…ÈΩ$Ù=(
ÈBôC7¿˙b…;
  ;nmC\EÉô{ß`%Ñû
wÔG™ä+Ö≈€;ì
èÜ;F±ˇ∫éÃ¡∞ 
-1;á~H
ùlkùK≤;ß˚'0 .
ùµû6;9jKáÛ
[ê;$ÿÙ¡GèkÄuÙûÑmÃ
©6S;’@ßs≥pwÀ˜K
Ñ‡¡ë^ﬂ@∞j◊◊Hçw;H
ç∏®-;ë
Bà;r‚=µç¶Ë
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
float4 Emitter_SimGrid_Color;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_WorldToUnit;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_UnitToWorld;
float4x4 Emitter_Grid2D_CreateUnitToWorldTransform_LocalToWorldRotation;
float3 Emitter_fluids_lighting_environmentDirection;
float Emitter_ShadowDensityMult;
float3 Emitter_fluids_lighting_sunDirection;
int Emitter_SimGrid_ColorIndex;
float3 Emitter_g;
float Emitter_fluids_solver_dissipationTemperature;
float2 Emitter_SimGrid_Velocity;
float Emitter_fluids_solver_dissipationDensity;
int Emitter_SimGrid_TemperatureIndex;
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
int Emitter_SimGrid_DensityIndex;
float dx;
float2 GradCurl;
float VorticityMult;
float Boundary;
float Divergence;
float2 PhysicsForce;
float3 PhysicsForceWorld;
float4 Tmp;
float TmpDensity;
float TmpTemperature;
float2 TmpVelocity;
float4 Color;
FParamMap0_SetVariables_E999D6404B73E9C72DA5DB8376548585_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_E999D6404B73E9C72DA5DB8376548585_Emitter Emitter;
float Pressure;
FParamMap0_SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_PressureGrid PressureGrid;
FParamMap0_SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter Emitter;
FParamMap0_SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A_Emitter_SimGrid SimGrid;
FParamMap0_SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A_Emitter Emitter;
FParamMap0_SetVariables_E34011A846386C9E92A2D4AB29AFF617_Transient Transient;
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
float4 Vector4;
float4 InColor;
float2 PressureGradient;
int UniqueID;
float2 NewVelocity;
float3 Lighting;
float2 Grad;
float Curl;
float4 AdvectedVector4;
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
FParamMap0_OUTPUT_VAR_Grid2D_AdvectVector4 Grid2D_AdvectVector4;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeCurl Grid2D_ComputeCurl;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeDivergence Grid2D_ComputeDivergence;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeGradient Grid2D_ComputeGradient;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeGradient001 Grid2D_ComputeGradient001;
FParamMap0_OUTPUT_VAR_Grid2D_ComputeLighting Grid2D_ComputeLighting;
FParamMap0_OUTPUT_VAR_Grid2D_IntegrateForces Grid2D_IntegrateForces;
FParamMap0_OUTPUT_VAR_Grid2D_PressureIteration Grid2D_PressureIteration;
FParamMap0_OUTPUT_VAR_ProjectPressureGrid2D ProjectPressureGrid2D;
FParamMap0_OUTPUT_VAR_ScratchModule001 ScratchModule001;
FParamMap0_OUTPUT_VAR_ScratchModule_03001 ScratchModule_03001;
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
float Alpha;
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
int AttributeIndex;
int VelocityIndex;
int InterpolationMethod;
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
int SimGrid_ColorIndex;
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
FParamMap0_Grid2D_AdvectVector4 Grid2D_AdvectVector4;
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
FParamMap0_MakeFloatFromVector4 MakeFloatFromVector4;
FParamMap0_MakeFloatFromVector4001 MakeFloatFromVector4001;
FParamMap0_MakeFloatFromVector4002 MakeFloatFromVector4002;
FParamMap0_MakeFloatFromVector4003 MakeFloatFromVector4003;
FParamMap0_MaskFloatByBoundary MaskFloatByBoundary;
FParamMap0_MaskFloatByBoundary001 MaskFloatByBoundary001;
FParamMap0_Multiply_Float001 Multiply_Float001;
FParamMap0_Multiply_Float008 Multiply_Float008;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_Particles Particles;
FParamMap0_ProjectPressureGrid2D ProjectPressureGrid2D;
FParamMap0_ScratchDynamicInput_05 ScratchDynamicInput_05;
FParamMap0_ScratchDynamicInput_06 ScratchDynamicInput_06;
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
FParamMap0_SetVariables_E34011A846386C9E92A2D4AB29AFF617 SetVariables_E34011A846386C9E92A2D4AB29AFF617;
FParamMap0_SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A;
FParamMap0_SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91 SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91;
FParamMap0_SetVariables_E999D6404B73E9C72DA5DB8376548585 SetVariables_E999D6404B73E9C72DA5DB8376548585;
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
void GetPreviousVector4Value_Emitter_SimGrid_AttributeColor(int In_IndexX, int In_IndexY, out float4 Out_Value);
void GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundary(int In_IndexX, int In_IndexY, out float Out_Value);
void SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(int In_IndexX, int In_IndexY, float In_Value);
void SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, float2 In_Value);
void SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(int In_IndexX, int In_IndexY, float In_Value);
void SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(int In_IndexX, int In_IndexY, float In_Value);
void SetVector4Value_Emitter_SimGrid_UEImpureCall_AttributeColor(int In_IndexX, int In_IndexY, float4 In_Value);
void Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColor(int In_Index, out bool Out_Success, out float3 Out_Position, out float3 Out_Velocity, out float Out_Radius, out float Out_PreviousRadius, out float Out_Density, out float Out_Temperature, out float Out_Divergence, out float4 Out_Color);
void UnitToFloatIndex_Emitter_SourceGrid(float2 In_Unit, out float2 Out_Index);
void GetNumCells_Emitter_SourceGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeDensity(int In_IndexX, int In_IndexY, float In_Value);
void SetFloatValue_Emitter_SourceGrid_UEImpureCall_AttributeTemperature(int In_IndexX, int In_IndexY, float In_Value);
void SetVector2DValue_Emitter_SourceGrid_UEImpureCall_AttributeVelocity(int In_IndexX, int In_IndexY, float2 In_Value);
void SetVector4Value_Emitter_SourceGrid_UEImpureCall_AttributeColor(int In_IndexX, int In_IndexY, float4 In_Value);
void CustomHlsl8396B1121BB7C9BEE6D7F4C252CFB6952B120994Emitter_SourceGrid_Func_(float2 In_ParticleCenterFloatIndex, float3 In_ParticlePos, float3 In_ParticleVel, float In_ParticleDensity, float In_ParticleTemperature, float In_Radius, float4 In_ParticleColor, int In_ParticleRadiusIndex, float In_VelocityMult, float In_DensityMult, float In_TemperatureMult, float In_Falloff, float In_Core, float In_RadiusScale, int In_NumCellsX, int In_NumCellsY, float In_dx, int In_MaxStreakSamples, float In_StreakDensity, bool In_UseStreaking, float In_dt, float4x4 In_WorldToLocal, bool In_UseColor, inout FSimulationContext Context);
void Grid2D_Gas_ParticleScatterSource001_Emitter_Func_(inout FSimulationContext Context);
void GetPositionByIndex_Emitter_ParticleSource_AttributePosition(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void TransformBase_Func_(int In_SourceSpace, int In_DestinationSpace, float4x4 In_LocalToWorldTransform, float4x4 In_WorldToLocalTransform, bool In_bLocalSpace, out bool Out_bUseOriginal, out float4x4 Out_OutTransform, out bool Out_LocalToWorld, inout FSimulationContext Context);
void TransformPosition_v2_0_Emitter_Localspace_false_Particle_Func_(float3 In_Position, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, float4x4 In_Engine_Owner_SystemLocalToWorld, float4x4 In_Engine_Owner_SystemWorldToLocal, float4x4 In_Engine_Owner_SystemLocalToWorldNoScale, float4x4 In_Engine_Owner_SystemWorldToLocalNoScale, out float3 Out_Position, inout FSimulationContext Context);
void GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocity(int In_ParticleIndex, out bool Out_Valid, out float3 Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_density(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperature(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radius(int In_ParticleIndex, out bool Out_Valid, out float Out_Value);
void GetColorByIndex_Emitter_ParticleSource_Attributefluid_source_color(int In_ParticleIndex, out bool Out_Valid, out float4 Out_Value);
void Grid2D_Gas_ParticleScatterSource_Emitter_Func_(inout FSimulationContext Context);
void GetNumCells_Emitter_SimGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void CustomHlslE40CF31B04EFAD49D13C9347AAA778C34F32DFED_Func_(int In_IndexX, int In_IndexY, int In_BorderWidth, int In_NumCellsX, int In_NumCellsY, bool In_OpenBoundaryRight, bool In_OpenBoundaryLeft, bool In_OpenBoundaryUp, bool In_OpenBoundaryDown, out float Out_Boundary);
void ComputeBoundaryGrid2D_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SourceGrid(out int Out_IndexX, out int Out_IndexY);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensity(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperature(int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocity(int In_IndexX, int In_IndexY, out float2 Out_Value);
void ScratchModule001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_CE3F24D742499C1EFA32EB978D87038A_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousVector4Value_Emitter_SourceGrid_AttributeColor(int In_IndexX, int In_IndexY, out float4 Out_Value);
void ScratchModule_03001_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_32_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void CustomHlslB7305EA875C1999CE672AC4D805AF153BB7451A4_Func_(float2 In_TmpVelocity, float2 In_Velocity, out float2 Out_V);
void ScratchDynamicInput001_Emitter_Func_(out float2 Out_Output, inout FSimulationContext Context);
void ScratchDynamicInput002_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void SetVariables_196F739F414428A690D86C8CECB0FE2B_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9A5606CD480032B7102900A8757C50F2_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_05_Emitter_Func_(out float4 Out_Output, inout FSimulationContext Context);
void SetVariables_E999D6404B73E9C72DA5DB8376548585_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_TemporaryGrid(out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_TemporaryGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_TemporaryGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_ScalarIndex, out float2 Out_Grad);
void Grid2D_ComputeGradient001_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl5086256F6B821003E0E6675DFA71A2F42D25643C_Func_(float In_dx, float2 In_GradCurl, float In_VorticityMult, out float2 Out_VC_Force);
void VorticityConfinementForceGrid2D_Emitter_Func_(inout FSimulationContext Context);
void Multiply_Float001_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void Multiply_Float008_Emitter_Func_(out float Out_Result, inout FSimulationContext Context);
void CustomHlsl4D23CDAF08AD6166A8CBC65A03625700FF4473A0_Func_(float In_DensityBuoyancy, float In_SimGrid_Density, float In_TemperatureBuoyancy, float In_SimGrid_Temperature, float3 In_g, out float3 Out_Force);
void Grid2D_Gas_3DBuoyancy_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_SimGrid(out float2 Out_Unit);
void UnitToSimulation_Emitter_SimGrid(float3 In_Unit, float4x4 In_UnitToSimulationTransform, out float3 Out_Simulation);
void TurbulenceForce7996D0765DAD2D08556490046B0591C6EB406113_Func_(float In_NoiseIntensity, float In_NoiseScale, float3 In_CellPos, float In_Time, out float2 Out_TurbulenceForce);
void Grid2D_TurbulenceForce_Emitter_Func_(inout FSimulationContext Context);
void DirectionAndLengthSafe_v1_0_Particle_Func_(float3 In_V, float3 In_Fallback, float In_Threshold, out float3 Out_Direction, out float Out_Length, out bool Out_BelowThreshold, inout FSimulationContext Context);
void WindForceFD4E49AE840624EB93D3186DEEC5D667684C9EAD_Func_(float3 In_CellPos, float3 In_WDirection, float In_dx, float In_WSpeed, out float2 Out_WindForce2D);
void Grid2D_WindForce_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_IntegrateForces_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_C54322844BB05B548FF0B8B0DC931DEE_Emitter_Func_(inout FSimulationContext Context);
void LinearToIndex_Emitter_SimGrid(int In_LINEAR_VAR, out int Out_IndexX, out int Out_IndexY);
void GetGridValue_Emitter_SimGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void IndexToUnit_Emitter_SimGrid(float In_IndexX, float In_IndexY, out float3 Out_Unit);
void CubicSamplePreviousGridAtIndex_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void SamplePreviousGridAtIndex_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_(int In_VelocityIndex, int In_ScalarIndex, float In_dx, float In_dt, int In_IndexX, int In_IndexY, float In_AdvectionVelocityMult, int In_InterpolationMethod, out float Out_AdvectedScalar);
void Grid2D_AdvectScalar_Emitter_Func_(inout FSimulationContext Context);
void Add_Integer001_Emitter_Func_(out int Out_NewOutput, inout FSimulationContext Context);
void Grid2D_AdvectScalar001_Emitter_Func_(inout FSimulationContext Context);
void BreakVector2D_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_47EB198B4D26ACB745967FA215BE495B_Emitter_Func_(inout FSimulationContext Context);
void DissipateVector2D_Fn_Func_(float In_dt, float In_DissipationRate, float2 In_Vector2DValue, out float2 Out_DissipatedVector2D, inout FSimulationContext Context);
void DissipateVector2D_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl2E256849956CE0E30F79A79D5E80A4D88A7CA05D_Func_(float In_B_center, out bool Out_IsBoundary);
void ScratchModule_06_Emitter_Func_(inout FSimulationContext Context);
void CopyPreviousToCurrentForCell_Emitter_SimGrid_UEImpureCall(int In_IndexX, int In_IndexY);
void CustomHlsl213F80CF839E5E2C47C1F862BB8E0833BC4E9781Emitter_SimGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_VectorIndex, out float Out_Div);
void Grid2D_ComputeDivergence_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_PressureGrid(out int Out_IndexX, out int Out_IndexY);
void SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(int In_IndexX, int In_IndexY, float In_Value);
void ScratchModule_04_Emitter_Func_(inout FSimulationContext Context);
void SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(int In_IndexX, int In_IndexY, float In_Value);
void GetPreviousFloatValue_Emitter_TemporaryGrid_AttributeSimFloat(int In_IndexX, int In_IndexY, out float Out_Value);
void GetDivergence_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex);
void SimulationStageIterationInfo_Func_(out int Out_IterationIndex, out int Out_MaxIterations, out float Out_NormalizedIterationIndex, out int Out_LoopIndex, out int Out_NumberOfLoops, out float Out_NormalizedLoopIndex, inout FSimulationContext Context);
void GetFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_(int In_IndexX, int In_IndexY, out float Out_P_right, out float Out_P_left, out float Out_P_up, out float Out_P_down);
void GetFloatValue_Emitter_SimGrid_AttributeBoundary(int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_(int In_IndexX, int In_IndexY, out float Out_B_right, out float Out_B_left, out float Out_B_up, out float Out_B_down);
void CustomHlsl443BA84C04A9C8424EEAA31F221258C9FAB7A075_Func_(float In_dx, float In_dt, float In_density, int In_IndexX, int In_IndexY, float In_Divergence, float2 In_Velocity, int In_IterationIndex, float In_Relaxation, float In_P_center, float In_B_center, float In_P_right, float In_P_left, float In_P_up, float In_P_down, float In_B_right, float In_B_left, float In_B_up, float In_B_down, float In_SV_x_right, float In_SV_x_left, float In_SV_y_up, float In_SV_y_down, out float Out_Pressure);
void Grid2D_PressureIteration_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E8DDF91F46F1C83E6B48B4AF7F477C91_Emitter_Func_(inout FSimulationContext Context);
void GetPreviousFloatValue_Emitter_PressureGrid_AttributePressure(int In_IndexX, int In_IndexY, out float Out_Value);
void GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_(out int Out_GroupID, out int Out_GroupThreadID);
void GetNumCells_Emitter_PressureGrid(out int Out_NumCellsX, out int Out_NumCellsY);
void CustomHlsl001DFBE4A5207772117E002C5C97158823384363590Emitter_PressureGrid_Func_(float In_GridSpaceDX, bool In_bIsInverse, bool In_bTransformX, int In_ScanlineIdx, int In_ThreadIdx, float In_Pi, bool In_bPoissonSolver, inout FSimulationContext Context);
void Grid2D_ComputeFFT_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT001_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT002_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_ComputeFFT003_Emitter_Func_(inout FSimulationContext Context);
void GetGridValue_Emitter_PressureGrid(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_PressureGrid_Func_(float In_dx, int In_IndexX, int In_IndexY, int In_ScalarIndex, out float2 Out_Grad);
void Grid2D_ComputeGradient_Emitter_Func_(inout FSimulationContext Context);
void CustomHlslADF01788351FE0F8B1947C740EDA269515327388Emitter_SimGrid_Func_(float2 In_Velocity, int In_IndexX, int In_IndexY, float In_B_center, float In_SV_x_center, float In_SV_y_center, float In_SV_x_right, float In_SV_x_left, float In_SV_y_up, float In_SV_y_down, out float2 Out_VelocityOut);
void ProjectPressureGrid2D_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_9E282C7845E37D6B386476BE13A71330_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_AdvectScalar002_Emitter_Func_(inout FSimulationContext Context);
void Grid2D_AdvectScalar003_Emitter_Func_(inout FSimulationContext Context);
void DissipateFloat_Fn_Func_(float In_dt, float In_DissipationRate, float In_SubtractionAmount, float In_FloatValue, out float Out_DissipatedFloat, inout FSimulationContext Context);
void DissipateFloat_Emitter_Func_(inout FSimulationContext Context);
void DissipateFloat001_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_49366F1C4BCFBA536A86108A2DBB4F43_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_(float In_Density, float In_Boundary, out float Out_Output);
void MaskFloatByBoundary_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void MaskFloatByBoundary001_Emitter_Func_(out float Out_Output, inout FSimulationContext Context);
void SetVariables_612FD801416D76B392FD168A3D29BE00_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl48BB7CD2F784928AFE23BC591E59D29191C42F6CEmitter_SimGrid_Func_(int In_VelocityIndex, float In_dx, float In_dt, int In_IndexX, int In_IndexY, float In_AdvectionVelocityMult, int In_AttributeIndex, out float4 Out_AdvectedVector4);
void Grid2D_AdvectVector4_Emitter_Func_(inout FSimulationContext Context);
void SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A_Emitter_Func_(inout FSimulationContext Context);
void CustomHlsl47400634B23A4BDCE4F1E02F135C2A8E38E920C6Emitter_SimGrid_Func_(float In_dx, int In_VectorIndex, int In_IndexX, int In_IndexY, out float Out_curl);
void Grid2D_ComputeCurl_Emitter_Func_(inout FSimulationContext Context);
void ScratchDynamicInput_06_Emitter_Func_(out float4 Out_Output, inout FSimulationContext Context);
void SetVariables_E34011A846386C9E92A2D4AB29AFF617_Emitter_Func_(inout FSimulationContext Context);
void ScratchModule_02001_Emitter_Func_(inout FSimulationContext Context);
void SelectV4Channel_Particle_Func_(float4 In_FLOAT4_VAR, int In_TargetChannel, out float Out_NewOutput, inout FSimulationContext Context);
void MakeFloatFromVector4_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector4001_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector4003_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void MakeFloatFromVector4002_Emitter_Func_(out float Out_Float, inout FSimulationContext Context);
void SetRenderTargetValue_Emitter_SimRT_UEImpureCall(bool In_Enabled, int In_IndexX, int In_IndexY, float4 In_Value);
void Grid2D_Gas_SetRTValues_Emitter_Func_(inout FSimulationContext Context);
void ExecutionIndexToUnit_Emitter_LightingGridDownsample(out float2 Out_Unit);
void SampleGrid_Emitter_SimGrid(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void GetNumCells_Emitter_LightingGridDownsample(out int Out_NumCellsX, out int Out_NumCellsY);
void UnitToIndex_Emitter_LightingGridDownsample(float2 In_Unit, out int Out_IndexX, out int Out_IndexY);
void SetGridValue_Emitter_LightingGridDownsample(int In_IndexX, int In_IndexY, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void DownsampleSimGrid9B46ADFD0304787C81F777FAA8BC8E00071257D1Emitter_SimGridEmitter_LightingGridDownsample_Func_(float2 In_UnitCoordinates, int In_HighResAttribute, int In_LowResAttribute, inout FSimulationContext Context);
void Grid2D_DownsampleScalar_Emitter_Func_(inout FSimulationContext Context);
void GetViewSpaceTransformsGPU_Emitter_CameraQuery(out float4x4 Out_TranslatedWorldToViewTransform, out float4x4 Out_ViewToTranslatedWorldTransform, out float4x4 Out_TranslatedWorldToCameraViewTransform, out float4x4 Out_CameraViewToTranslatedWorldTransform, out float4x4 Out_ViewToClipTransform, out float4x4 Out_ViewToClipNoAATransform);
void Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_(float3 In_WorldDirection, out float2 Out_TangentDirectionVector2d, out float3 Out_TangentDirectionVector, inout FSimulationContext Context);
void ComputeLightingSunFB099FCB6391A3D7B090EFA8A3983A46849A6CECEmitter_SimGridEmitter_SimGrid_Func_(float In_Samples, float In_RayLength, float2 In_UnitCoordinates, float2 In_Direction, float In_ShadowDensity, int In_LightingIndex, int In_DensityIndex, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_(float3 In_WorldDirection, out float2 Out_TangentDirectionVector2d, out float3 Out_TangentDirectionVector, inout FSimulationContext Context);
void ComputeLightingEnvironmentC6F2A3847B7809565B6F87CA92548C443B72864FEmitter_SimGridEmitter_SimGrid_Func_(float In_Samples, float In_RayLength, float2 In_UnitCoordinates, float2 In_Direction, float In_ShadowDensity, int In_LightingIndex, int In_DensityIndex, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
void SampleGrid_Emitter_LightingGridDownsample(float In_UnitX, float In_UnitY, int In_AttributeIndex, out float Out_Value);
void ComputeLightingTemperatureF4954D22451C60B0059AD2B4A362A878FB7D51F0Emitter_SimGridEmitter_LightingGridDownsample_Func_(float2 In_UnitCoordinates, int In_IndexX, int In_IndexY, out float Out_Value, inout FSimulationContext Context);
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
int Constant10 = 1;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source 001/Map Get/Map Get->Module.ScaleEmissionByDt"
int Constant11 = 0;
CustomHlsl8396B1121BB7C9BEE6D7F4C252CFB6952B120994Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index, Output12, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Velocity, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Density, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Temperature, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Radius, Read_Emitter_NDCParticleSource_PositionNiagaraPosition_VelocityVector3f_RadiusNiagaraFloat_PreviousRadiusNiagaraFloat_DensityNiagaraFloat_TemperatureNiagaraFloat_DivergenceNiagaraFloat_ColorLinearColorOutput_Color, Result4, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.VelocityMult, Result5, Result6, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Falloff, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.Core, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX, GetNumCells_Emitter_SourceGridOutput_NumCellsY, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dx, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.MaxStreakSamples, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.StreakDensity, Constant6, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.dt, Context.MapSimStage2_RasterizeNDCSourceParticles.Grid2D_Gas_ParticleScatterSource001.WorldToLocal, Constant10, Context);
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
bool GetColorByIndex_Emitter_ParticleSource_Attributefluid_source_colorOutput_Valid;
float4 GetColorByIndex_Emitter_ParticleSource_Attributefluid_source_colorOutput_Value;
GetColorByIndex_Emitter_ParticleSource_Attributefluid_source_color(Result7, GetColorByIndex_Emitter_ParticleSource_Attributefluid_source_colorOutput_Valid, GetColorByIndex_Emitter_ParticleSource_Attributefluid_source_colorOutput_Value);
float Result37 = GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value * Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.RadiusScale;
float Result38 = Result37 / Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dx;
float Result39 = ceil(Result38);
float Constant34 = 1;
float Result40 = Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.DensityMult * Constant34;
float Constant35 = 1;
float Result41 = Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.TemperatureMult * Constant35;
int GetNumCells_Emitter_SourceGridOutput_NumCellsX1;
int GetNumCells_Emitter_SourceGridOutput_NumCellsY1;
GetNumCells_Emitter_SourceGrid(GetNumCells_Emitter_SourceGridOutput_NumCellsX1, GetNumCells_Emitter_SourceGridOutput_NumCellsY1);
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.Use NDC"
int Constant36 = 0;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.UseColor"
int Constant37 = 1;
//SetConstantByStaticVariable "/Grid 2D Gas Particle Scatter Source/Map Get/Map Get->Module.ScaleEmissionByDt"
int Constant38 = 0;
CustomHlsl8396B1121BB7C9BEE6D7F4C252CFB6952B120994Emitter_SourceGrid_Func_(UnitToFloatIndex_Emitter_SourceGridOutput_Index1, Output15, GetVectorByIndex_Emitter_ParticleSource_Attributefluids_source_velocityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_densityOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_temperatureOutput_Value, GetFloatByIndex_Emitter_ParticleSource_Attributefluids_source_radiusOutput_Value, GetColorByIndex_Emitter_ParticleSource_Attributefluid_source_colorOutput_Value, Result39, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.VelocityMult, Result40, Result41, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Falloff, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.Core, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.RadiusScale, GetNumCells_Emitter_SourceGridOutput_NumCellsX1, GetNumCells_Emitter_SourceGridOutput_NumCellsY1, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dx, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.MaxStreakSamples, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.StreakDensity, Constant14, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.dt, Context.MapSimStage3_RasterizeSourceParticles.Grid2D_Gas_ParticleScatterSource.WorldToLocal, Constant37, Context);
Out_Boundary = 0;
  Out_Boundary = In_OpenBoundaryRight ? 2 : 1;
  Out_Boundary = In_OpenBoundaryLeft ? 2 : 1;
  Out_Boundary = In_OpenBoundaryDown ? 2 : 1;
  Out_Boundary = In_OpenBoundaryUp ? 2 : 1;
float4x4 Constant43 = float4x4(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1);
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY);
int Constant44 = 2;
int GetNumCells_Emitter_SimGridOutput_NumCellsX;
int GetNumCells_Emitter_SimGridOutput_NumCellsY;
GetNumCells_Emitter_SimGrid(GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY);
float CustomHlslE40CF31B04EFAD49D13C9347AAA778C34F32DFED_Func_Output_Boundary;
CustomHlslE40CF31B04EFAD49D13C9347AAA778C34F32DFED_Func_(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY, Constant44, GetNumCells_Emitter_SimGridOutput_NumCellsX, GetNumCells_Emitter_SimGridOutput_NumCellsY, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryRight, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryLeft, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryUp, Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryDown, CustomHlslE40CF31B04EFAD49D13C9347AAA778C34F32DFED_Func_Output_Boundary);
Context.MapSimStage4_PreSim.OUTPUT_VAR.ComputeBoundaryGrid2D.Boundary = CustomHlslE40CF31B04EFAD49D13C9347AAA778C34F32DFED_Func_Output_Boundary;
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
int ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX1;
int ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY1;
ExecutionIndexToGridIndex_Emitter_SourceGrid(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY1);
float GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value1;
GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensity(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY1, GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value1);
float GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value1;
GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperature(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY1, GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value1);
float2 GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value1;
GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocity(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY1, GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value1);
float4 GetPreviousVector4Value_Emitter_SourceGrid_AttributeColorOutput_Value;
GetPreviousVector4Value_Emitter_SourceGrid_AttributeColor(ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SourceGridOutput_IndexY1, GetPreviousVector4Value_Emitter_SourceGrid_AttributeColorOutput_Value);
Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule_03001.Density = GetPreviousFloatValue_Emitter_SourceGrid_AttributeDensityOutput_Value1;
Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule_03001.Temperature = GetPreviousFloatValue_Emitter_SourceGrid_AttributeTemperatureOutput_Value1;
Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule_03001.Velocity = GetPreviousVector2DValue_Emitter_SourceGrid_AttributeVelocityOutput_Value1;
Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule_03001.Color = GetPreviousVector4Value_Emitter_SourceGrid_AttributeColorOutput_Value;
float Result42 = max(Context.MapSimStage4_PreSim.Transient.TmpDensity, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
Out_Output = Result42;
Out_V = dot(In_TmpVelocity, In_TmpVelocity) > dot(In_Velocity, In_Velocity) ? In_TmpVelocity : In_Velocity;
float2 CustomHlslB7305EA875C1999CE672AC4D805AF153BB7451A4_Func_Output_V;
CustomHlslB7305EA875C1999CE672AC4D805AF153BB7451A4_Func_(Context.MapSimStage4_PreSim.Transient.TmpVelocity, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity, CustomHlslB7305EA875C1999CE672AC4D805AF153BB7451A4_Func_Output_V);
Out_Output = CustomHlslB7305EA875C1999CE672AC4D805AF153BB7451A4_Func_Output_V;
float Result43 = max(Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature, Context.MapSimStage4_PreSim.Transient.TmpTemperature);
Out_Output = Result43;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity = Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Velocity;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Density = Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Density;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature = Context.MapSimStage4_PreSim.SetVariables_196F739F414428A690D86C8CECB0FE2B.Emitter.SimGrid.Temperature;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Boundary = Context.MapSimStage4_PreSim.SetVariables_9A5606CD480032B7102900A8757C50F2.Emitter.SimGrid.Boundary;
float Z;
float W;
X = Context.MapSimStage4_PreSim.ScratchDynamicInput_05.InColor.x;
Y = Context.MapSimStage4_PreSim.ScratchDynamicInput_05.InColor.y;
Z = Context.MapSimStage4_PreSim.ScratchDynamicInput_05.InColor.z;
W = Context.MapSimStage4_PreSim.ScratchDynamicInput_05.InColor.w;
float4 Result44 = lerp(Context.MapSimStage4_PreSim.Emitter.SimGrid.Color,Context.MapSimStage4_PreSim.ScratchDynamicInput_05.InColor,W);
Out_Output = Result44;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Color = Context.MapSimStage4_PreSim.SetVariables_E999D6404B73E9C72DA5DB8376548585.Emitter.SimGrid.Color;
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
float2 CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_TemporaryGrid_Func_Output_Grad;
CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_TemporaryGrid_Func_(Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.dx, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY, Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.ScalarIndex, CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_TemporaryGrid_Func_Output_Grad);
Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad = CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_TemporaryGrid_Func_Output_Grad;
Out_VC_Force = float2(0,0);
float GradCurlLength = length(In_GradCurl);
  Out_VC_Force = In_VorticityMult * In_dx * cross(float3(In_GradCurl / GradCurlLength, 0), float3(0,0,1)).xy;
float2 CustomHlsl5086256F6B821003E0E6675DFA71A2F42D25643C_Func_Output_VC_Force;
CustomHlsl5086256F6B821003E0E6675DFA71A2F42D25643C_Func_(Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.dx, Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.GradCurl, Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.VorticityMult, CustomHlsl5086256F6B821003E0E6675DFA71A2F42D25643C_Func_Output_VC_Force);
float2 Result45 = Context.MapSimStage4_PreSim.Transient.PhysicsForce + CustomHlsl5086256F6B821003E0E6675DFA71A2F42D25643C_Func_Output_VC_Force;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result45;
float Constant47 = 1;
float Result46 = Constant47 * Context.MapSimStage4_PreSim.Multiply_Float001.B;
Out_Result = Result46;
float Constant49 = -1;
float Result47 = Constant49 * Context.MapSimStage4_PreSim.Multiply_Float008.B;
Out_Result = Result47;
Out_Force = (In_DensityBuoyancy * In_SimGrid_Density - In_TemperatureBuoyancy * In_SimGrid_Temperature) * In_g;
float3 CustomHlsl4D23CDAF08AD6166A8CBC65A03625700FF4473A0_Func_Output_Force;
CustomHlsl4D23CDAF08AD6166A8CBC65A03625700FF4473A0_Func_(Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.DensityBuoyancy, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density, Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature, Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.g, CustomHlsl4D23CDAF08AD6166A8CBC65A03625700FF4473A0_Func_Output_Force);
float3 Result48 = Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld + CustomHlsl4D23CDAF08AD6166A8CBC65A03625700FF4473A0_Func_Output_Force;
Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld = Result48;
Out_TurbulenceForce= float2(0.0,0.0);
    float noiseScale = .05 * In_NoiseScale;
    float noiseIntensity = 100.0 * In_NoiseIntensity;
    float noiseX = FastGradientPerlinNoise3D_TEX(float3(In_CellPos.xy+ In_Time.xx,.0)*noiseScale).x *noiseIntensity;
    float noiseY = FastGradientPerlinNoise3D_TEX(float3(In_CellPos.xy-+ In_Time.xx+ 842.212,0.0)*noiseScale).x *noiseIntensity;
    Out_TurbulenceForce = float2(noiseX,noiseY);
float Constant54 = 1;
float Constant55 = 1;
float Constant56 = 1;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit);
float Constant57 = 0;
float3 Output16;
Output16.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.x;
Output16.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit.y;
Output16.z = Constant57;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation;
UnitToSimulation_Emitter_SimGrid(Output16, Context.MapSimStage4_PreSim.Grid2D_TurbulenceForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation);
float Result49 = Context.MapSimStage4_PreSim.Engine.Time * Constant56;
float2 TurbulenceForce7996D0765DAD2D08556490046B0591C6EB406113_Func_Output_TurbulenceForce;
TurbulenceForce7996D0765DAD2D08556490046B0591C6EB406113_Func_(Constant54, Constant55, UnitToSimulation_Emitter_SimGridOutput_Simulation, Result49, TurbulenceForce7996D0765DAD2D08556490046B0591C6EB406113_Func_Output_TurbulenceForce);
float2 Result50 = TurbulenceForce7996D0765DAD2D08556490046B0591C6EB406113_Func_Output_TurbulenceForce + Context.MapSimStage4_PreSim.Transient.PhysicsForce;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result50;
float Result52 = dot(In_V,In_V);
float Result53 = In_Threshold * In_Threshold;
bool Result54 = NiagaraAll(Result52 < Result53);
float Result55 = length(In_Fallback);
float Result56 = rsqrt(Result52);
float3 Result57 = In_V * Result56;
float Result58 = Reciprocal(Result56);
float3 Constant65 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult3 = Constant65;
float Constant66 = (0.0);
float Length_SelectResult3 = Constant66;
Direction_SelectResult3 = In_Fallback;
Length_SelectResult3 = Result55;
Direction_SelectResult3 = Result57;
Length_SelectResult3 = Result58;
Out_Direction = Direction_SelectResult3;
Out_Length = Length_SelectResult3;
Out_BelowThreshold = Result54;
Out_WindForce2D= float2(0.0,0.0);
        Out_WindForce2D = In_WDirection.xy*In_WSpeed * In_dx * 60.0;
float3 Constant60 = float3(1,1,0);
float Constant61 = 0;
float2 ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1;
ExecutionIndexToUnit_Emitter_SimGrid(ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1);
float Constant62 = 0;
float3 Output17;
Output17.x = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.x;
Output17.y = ExecutionIndexToUnit_Emitter_SimGridOutput_Unit1.y;
Output17.z = Constant62;
float3 UnitToSimulation_Emitter_SimGridOutput_Simulation1;
UnitToSimulation_Emitter_SimGrid(Output17, Context.MapSimStage4_PreSim.Grid2D_WindForce.UnitToWorld, UnitToSimulation_Emitter_SimGridOutput_Simulation1);
float3 Result51 = mul(float4(UnitToSimulation_Emitter_SimGridOutput_Simulation1,1.0),Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal).xyz;
float3 Constant63 = float3(0,0,1);
float Constant64 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold;
DirectionAndLengthSafe_v1_0_Particle_Func_(Constant60, Constant63, Constant64, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold, Context);
float3 Result59 = mul(float4(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction,0.0),Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal).xyz;
float2 WindForceFD4E49AE840624EB93D3186DEEC5D667684C9EAD_Func_Output_WindForce2D;
WindForceFD4E49AE840624EB93D3186DEEC5D667684C9EAD_Func_(Result51, Result59, Context.MapSimStage4_PreSim.Grid2D_WindForce.dx, Constant61, WindForceFD4E49AE840624EB93D3186DEEC5D667684C9EAD_Func_Output_WindForce2D);
float2 Result60 = WindForceFD4E49AE840624EB93D3186DEEC5D667684C9EAD_Func_Output_WindForce2D + Context.MapSimStage4_PreSim.Transient.PhysicsForce;
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Result60;
float4x4 Result61 = transpose(Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.WorldToLocal);
float3 Result62 = mul(float4(Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld,0.0),Result61).xyz;
float2 Output18;
Output18.x = Result62.x;
Output18.y = Result62.y;
float2 Result63 = Context.MapSimStage4_PreSim.Transient.PhysicsForce + Output18;
float2 Result64 = Result63 * Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.dt;
float2 Result65 = Context.MapSimStage4_PreSim.Grid2D_IntegrateForces.Velocity + Result64;
Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_IntegrateForces.NewVelocity = Result65;
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
float Constant69 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar/Map Get/Map Get->Module.Interpolation Method"
int Constant70 = 1;
int Result66 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX;
int LinearToIndex_Emitter_SimGridOutput_IndexY;
LinearToIndex_Emitter_SimGrid(Result66, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY);
float CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.VelocityIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.ScalarIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dx, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dt, LinearToIndex_Emitter_SimGridOutput_IndexX, LinearToIndex_Emitter_SimGridOutput_IndexY, Constant69, Constant70, CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar.AdvectedScalar = CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar;
int Constant72 = 1;
int Result67 = Context.MapSimStage5_AdvectVelocity.Add_Integer001.A + Constant72;
Out_NewOutput = Result67;
float Constant75 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 001/Map Get/Map Get->Module.Interpolation Method"
int Constant76 = 1;
int Result68 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX1;
int LinearToIndex_Emitter_SimGridOutput_IndexY1;
LinearToIndex_Emitter_SimGrid(Result68, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1);
float CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.VelocityIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.ScalarIndex, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dx, Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dt, LinearToIndex_Emitter_SimGridOutput_IndexX1, LinearToIndex_Emitter_SimGridOutput_IndexY1, Constant75, Constant76, CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1);
Context.MapSimStage5_AdvectVelocity.OUTPUT_VAR.Grid2D_AdvectScalar001.AdvectedScalar = CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar1;
float2 Output19;
Output19.x = Context.MapSimStage5_AdvectVelocity.BreakVector2D.X;
Output19.y = Context.MapSimStage5_AdvectVelocity.BreakVector2D.Y;
Out_Vec2 = Output19;
Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid.Velocity = Context.MapSimStage5_AdvectVelocity.SetVariables_47EB198B4D26ACB745967FA215BE495B.Emitter.SimGrid.Velocity;
float Result69 = In_dt * In_DissipationRate;
float Constant77 = 1;
float Result70 = Result69 + Constant77;
float2 Result71 = In_Vector2DValue / Result70;
Out_DissipatedVector2D = Result71;
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
bool CustomHlsl2E256849956CE0E30F79A79D5E80A4D88A7CA05D_Func_Output_IsBoundary;
CustomHlsl2E256849956CE0E30F79A79D5E80A4D88A7CA05D_Func_(GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value, CustomHlsl2E256849956CE0E30F79A79D5E80A4D88A7CA05D_Func_Output_IsBoundary);
float2 Constant78 = float2(0,0);
float2 Constant79 = float2(0.0, 0.0);
float2 Vector2f_SelectResult4 = Constant79;
Vector2f_SelectResult4 = Constant78;
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
float CustomHlsl213F80CF839E5E2C47C1F862BB8E0833BC4E9781Emitter_SimGrid_Func_Output_Div;
CustomHlsl213F80CF839E5E2C47C1F862BB8E0833BC4E9781Emitter_SimGrid_Func_(Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.dx, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY2, Context.MapSimStage6_ComputeDivergence.Grid2D_ComputeDivergence.VectorIndex, CustomHlsl213F80CF839E5E2C47C1F862BB8E0833BC4E9781Emitter_SimGrid_Func_Output_Div);
Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div = CustomHlsl213F80CF839E5E2C47C1F862BB8E0833BC4E9781Emitter_SimGrid_Func_Output_Div;
Context.MapSimStage6_ComputeDivergence.Emitter.TemporaryGrid.SimFloat = Context.MapSimStage6_ComputeDivergence.SetVariables_DDC94BF44A53FF2F2DE281AAE55BD118.Emitter.TemporaryGrid.SimFloat;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY);
float Result72 = Context.MapSimStage6_ComputeDivergence.ScratchModule_04.Div / Context.MapSimStage6_ComputeDivergence.ScratchModule_04.dt;
SetFloatValue_Emitter_PressureGrid_UEImpureCall_AttributePressure(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY, Result72);
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
int CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_IterationIndex;
int CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_MaxIterations;
float CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NormalizedIterationIndex;
int CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_LoopIndex;
int CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NumberOfLoops;
float CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NormalizedLoopIndex;
CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_(CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_IterationIndex, CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_MaxIterations, CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NormalizedIterationIndex, CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_LoopIndex, CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NumberOfLoops, CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NormalizedLoopIndex);
Out_IterationIndex = CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_IterationIndex;
Out_MaxIterations = CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_MaxIterations;
Out_NormalizedIterationIndex = CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NormalizedIterationIndex;
Out_LoopIndex = CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_LoopIndex;
Out_NumberOfLoops = CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NumberOfLoops;
Out_NormalizedLoopIndex = CustomHlsl0FA01CD6946843F8A5B5856DC832470EE8BFF4AB_Func_Output_NormalizedLoopIndex;
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
int Constant80 = 0;
float Constant81 = 1;
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
float CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_right;
float CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_left;
float CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_up;
float CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_down;
CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_right, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_left, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_up, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_down);
float CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_right;
float CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_left;
float CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_up;
float CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_down;
CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_right, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_left, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_up, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_down);
float Constant82 = 0;
float Constant83 = 0;
float Constant84 = 0;
float Constant85 = 0;
float CustomHlsl443BA84C04A9C8424EEAA31F221258C9FAB7A075_Func_Output_Pressure;
CustomHlsl443BA84C04A9C8424EEAA31F221258C9FAB7A075_Func_(Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dx, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dt, Constant81, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY1, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Divergence, GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocityOutput_Value, SimulationStageIterationInfo_Func_Output_IterationIndex, Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Relaxation, Context.MapSimStage7_SolvePressure.Emitter.PressureGrid.Pressure, GetPreviousFloatValue_Emitter_SimGrid_AttributeBoundaryOutput_Value1, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_right, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_left, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_up, CustomHlslDC737339869012F972F4B0954572729A39E6BC44Emitter_PressureGrid_Func_Output_P_down, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_right, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_left, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_up, CustomHlslF054C1173225565B9000AD97B2AF719CB9903C83Emitter_SimGrid_Func_Output_B_down, Constant82, Constant83, Constant84, Constant85, CustomHlsl443BA84C04A9C8424EEAA31F221258C9FAB7A075_Func_Output_Pressure);
Context.MapSimStage7_SolvePressure.OUTPUT_VAR.Grid2D_PressureIteration.Pressure = CustomHlsl443BA84C04A9C8424EEAA31F221258C9FAB7A075_Func_Output_Pressure;
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
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID;
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID;
GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_(GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID);
float Result73 = PI;
CustomHlsl001DFBE4A5207772117E002C5C97158823384363590Emitter_PressureGrid_Func_(Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.dx, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.Inverse, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.XDirecton, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID, Result73, Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.bPoissonSolver, Context);
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID1;
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID1;
GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_(GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID1, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID1);
float Result74 = PI;
CustomHlsl001DFBE4A5207772117E002C5C97158823384363590Emitter_PressureGrid_Func_(Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.dx, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.Inverse, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.XDirecton, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID1, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID1, Result74, Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.bPoissonSolver, Context);
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID2;
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID2;
GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_(GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID2, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID2);
float Result75 = PI;
CustomHlsl001DFBE4A5207772117E002C5C97158823384363590Emitter_PressureGrid_Func_(Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.dx, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.Inverse, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.XDirecton, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID2, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID2, Result75, Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.bPoissonSolver, Context);
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID3;
int GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID3;
GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_(GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID3, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID3);
float Result76 = PI;
CustomHlsl001DFBE4A5207772117E002C5C97158823384363590Emitter_PressureGrid_Func_(Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.dx, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.Inverse, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.XDirecton, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupID3, GetGroupIDD4175512A1D90C11E49B715E06C4F52646AE4D25_Func_Output_GroupThreadID3, Result76, Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.bPoissonSolver, Context);
GetGridValue_Emitter_PressureGrid(In_IndexX+1, In_IndexY, In_ScalarIndex, S_right);
GetGridValue_Emitter_PressureGrid(In_IndexX-1, In_IndexY, In_ScalarIndex, S_left);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY+1, In_ScalarIndex, S_up);
GetGridValue_Emitter_PressureGrid(In_IndexX, In_IndexY-1, In_ScalarIndex, S_down);
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2;
ExecutionIndexToGridIndex_Emitter_PressureGrid(ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2);
float2 CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_PressureGrid_Func_Output_Grad;
CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_PressureGrid_Func_(Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.dx, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_PressureGridOutput_IndexY2, Context.MapSimStage12_ProjectPressure.Grid2D_ComputeGradient.ScalarIndex, CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_PressureGrid_Func_Output_Grad);
Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.Grid2D_ComputeGradient.Grad = CustomHlsl043FC607924CFD630AF557039BA6C7180983AE45Emitter_PressureGrid_Func_Output_Grad;
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
int Constant99 = 0;
float2 Result77 = Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.PressureGradient * Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.dt;
float2 Result78 = Result77 / Context.MapSimStage12_ProjectPressure.Local.ProjectPressureGrid2D.density;
float2 Result79 = Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity - Result78;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3);
float Constant100 = 0;
float Constant101 = 0;
float Constant102 = 0;
float Constant103 = 0;
float Constant104 = 0;
float Constant105 = 0;
float2 CustomHlslADF01788351FE0F8B1947C740EDA269515327388Emitter_SimGrid_Func_Output_VelocityOut;
CustomHlslADF01788351FE0F8B1947C740EDA269515327388Emitter_SimGrid_Func_(Result79, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX3, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY3, Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Boundary, Constant100, Constant101, Constant102, Constant103, Constant104, Constant105, CustomHlslADF01788351FE0F8B1947C740EDA269515327388Emitter_SimGrid_Func_Output_VelocityOut);
Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.ProjectPressureGrid2D.Velocity = CustomHlslADF01788351FE0F8B1947C740EDA269515327388Emitter_SimGrid_Func_Output_VelocityOut;
Context.MapSimStage12_ProjectPressure.Emitter.SimGrid.Velocity = Context.MapSimStage12_ProjectPressure.SetVariables_9E282C7845E37D6B386476BE13A71330.Emitter.SimGrid.Velocity;
float Constant108 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 002/Map Get/Map Get->Module.Interpolation Method"
int Constant109 = 1;
int Result80 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX2;
int LinearToIndex_Emitter_SimGridOutput_IndexY2;
LinearToIndex_Emitter_SimGrid(Result80, LinearToIndex_Emitter_SimGridOutput_IndexX2, LinearToIndex_Emitter_SimGridOutput_IndexY2);
float CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2;
CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.VelocityIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.ScalarIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dt, LinearToIndex_Emitter_SimGridOutput_IndexX2, LinearToIndex_Emitter_SimGridOutput_IndexY2, Constant108, Constant109, CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar = CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar2;
float Constant112 = 1;
//SetConstantByStaticVariable "/Grid 2D Advect Scalar 003/Map Get/Map Get->Module.Interpolation Method"
int Constant113 = 1;
int Result81 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX3;
int LinearToIndex_Emitter_SimGridOutput_IndexY3;
LinearToIndex_Emitter_SimGrid(Result81, LinearToIndex_Emitter_SimGridOutput_IndexX3, LinearToIndex_Emitter_SimGridOutput_IndexY3);
float CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3;
CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.VelocityIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.ScalarIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dt, LinearToIndex_Emitter_SimGridOutput_IndexX3, LinearToIndex_Emitter_SimGridOutput_IndexY3, Constant112, Constant113, CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar = CustomHlsl05BCB091559127AC3C2FE36F0D4A842909BE5363Emitter_SimGridEmitter_SimGrid_Func_Output_AdvectedScalar3;
float Result82 = In_dt * In_DissipationRate;
float Constant116 = 1;
float Result83 = Result82 + Constant116;
float Result84 = In_FloatValue / Result83;
float Result85 = In_SubtractionAmount * In_dt;
float Result86 = Result84 - Result85;
float Constant117 = 0;
float Constant118 = 1e+09;
float Result87 = clamp(Result86,Constant117,Constant118);
Out_DissipatedFloat = Result87;
float Constant115 = 0;
float DissipateFloat_Fn_Func_Output_DissipatedFloat;
DissipateFloat_Fn_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.dt, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.DissipationRate, Constant115, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.FloatValue, DissipateFloat_Fn_Func_Output_DissipatedFloat, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat.DissipatedFloat = DissipateFloat_Fn_Func_Output_DissipatedFloat;
float Constant120 = 0;
float DissipateFloat_Fn_Func_Output_DissipatedFloat1;
DissipateFloat_Fn_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.dt, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.DissipationRate, Constant120, Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.FloatValue, DissipateFloat_Fn_Func_Output_DissipatedFloat1, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.DissipateFloat001.DissipatedFloat = DissipateFloat_Fn_Func_Output_DissipatedFloat1;
Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Boundary = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_49366F1C4BCFBA536A86108A2DBB4F43.Transient.Boundary;
Out_Output = In_Density * (In_Boundary < 1e-5);
float CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_Output_Output;
CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary.FloatValue, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary, CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_Output_Output);
Out_Output = CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_Output_Output;
float CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_Output_Output1;
CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MaskFloatByBoundary001.FloatValue, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary, CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_Output_Output1);
Out_Output = CustomHlsl8FF29C558E206324F5D95E0485095EEA6F08DB07_Func_Output_Output1;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Density;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_612FD801416D76B392FD168A3D29BE00.Emitter.SimGrid.Temperature;
SamplePreviousGridAtIndex_Emitter_SimGrid(SampleUnit.x, SampleUnit.y, In_AttributeIndex, Out_AdvectedVector4.x);
SamplePreviousGridAtIndex_Emitter_SimGrid(SampleUnit.x, SampleUnit.y, In_AttributeIndex+1, Out_AdvectedVector4.y);
SamplePreviousGridAtIndex_Emitter_SimGrid(SampleUnit.x, SampleUnit.y, In_AttributeIndex+2, Out_AdvectedVector4.z);
SamplePreviousGridAtIndex_Emitter_SimGrid(SampleUnit.x, SampleUnit.y, In_AttributeIndex+3, Out_AdvectedVector4.w);
float Constant122 = 1;
int Result88 = ExecIndex();
int LinearToIndex_Emitter_SimGridOutput_IndexX4;
int LinearToIndex_Emitter_SimGridOutput_IndexY4;
LinearToIndex_Emitter_SimGrid(Result88, LinearToIndex_Emitter_SimGridOutput_IndexX4, LinearToIndex_Emitter_SimGridOutput_IndexY4);
float4 CustomHlsl48BB7CD2F784928AFE23BC591E59D29191C42F6CEmitter_SimGrid_Func_Output_AdvectedVector4;
CustomHlsl48BB7CD2F784928AFE23BC591E59D29191C42F6CEmitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.VelocityIndex, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.dt, LinearToIndex_Emitter_SimGridOutput_IndexX4, LinearToIndex_Emitter_SimGridOutput_IndexY4, Constant122, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.AttributeIndex, CustomHlsl48BB7CD2F784928AFE23BC591E59D29191C42F6CEmitter_SimGrid_Func_Output_AdvectedVector4);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectVector4.AdvectedVector4 = CustomHlsl48BB7CD2F784928AFE23BC591E59D29191C42F6CEmitter_SimGrid_Func_Output_AdvectedVector4;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Color = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A.Emitter.SimGrid.Color;
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
float CustomHlsl47400634B23A4BDCE4F1E02F135C2A8E38E920C6Emitter_SimGrid_Func_Output_curl;
CustomHlsl47400634B23A4BDCE4F1E02F135C2A8E38E920C6Emitter_SimGrid_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.dx, Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.VectorIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX4, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY4, CustomHlsl47400634B23A4BDCE4F1E02F135C2A8E38E920C6Emitter_SimGrid_Func_Output_curl);
Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_ComputeCurl.Curl = CustomHlsl47400634B23A4BDCE4F1E02F135C2A8E38E920C6Emitter_SimGrid_Func_Output_curl;
float X1;
float Y1;
float Z1;
float W1;
X1 = Context.MapSimStage13_AdvectScalarsandPostSim.ScratchDynamicInput_06.Vector4.x;
Y1 = Context.MapSimStage13_AdvectScalarsandPostSim.ScratchDynamicInput_06.Vector4.y;
Z1 = Context.MapSimStage13_AdvectScalarsandPostSim.ScratchDynamicInput_06.Vector4.z;
W1 = Context.MapSimStage13_AdvectScalarsandPostSim.ScratchDynamicInput_06.Vector4.w;
float Constant123 = 1e-05;
bool Result89 = NiagaraAll(W1 < Constant123);
float3 Output110;
Output110.x = X1;
Output110.y = Y1;
Output110.z = Z1;
float3 Result90 = Output110 / W1;
float3 Constant124 = float3(0.0, 0.0, 0.0);
float3 RGB_SelectResult5 = Constant124;
RGB_SelectResult5 = Output110;
RGB_SelectResult5 = Result90;
float X2;
float Y2;
float Z2;
X2 = RGB_SelectResult5.x;
Y2 = RGB_SelectResult5.y;
Z2 = RGB_SelectResult5.z;
float4 Output111;
Output111.x = X2;
Output111.y = Y2;
Output111.z = Z2;
Output111.w = W1;
Out_Output = Output111;
Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Tmp = Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_E34011A846386C9E92A2D4AB29AFF617.Transient.Tmp;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2;
int ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2;
ExecutionIndexToGridIndex_Emitter_TemporaryGrid(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2);
SetFloatValue_Emitter_TemporaryGrid_UEImpureCall_AttributeSimFloat(ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexX2, ExecutionIndexToGridIndex_Emitter_TemporaryGridOutput_IndexY2, Context.MapSimStage13_AdvectScalarsandPostSim.ScratchModule_02001.Value);
float X3;
float Y3;
float Z3;
float W2;
X3 = In_FLOAT4_VAR.x;
Y3 = In_FLOAT4_VAR.y;
Z3 = In_FLOAT4_VAR.z;
W2 = In_FLOAT4_VAR.w;
float Constant129 = (0.0);
float NiagaraFloat_SelectResult6 = Constant129;
NiagaraFloat_SelectResult6 = X3;
NiagaraFloat_SelectResult6 = Y3;
NiagaraFloat_SelectResult6 = Z3;
NiagaraFloat_SelectResult6 = W2;
Out_NewOutput = NiagaraFloat_SelectResult6;
float SelectV4Channel_Particle_Func_Output_NewOutput;
SelectV4Channel_Particle_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4.Vector4, Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4.Channel, SelectV4Channel_Particle_Func_Output_NewOutput, Context);
Out_Float = SelectV4Channel_Particle_Func_Output_NewOutput;
float SelectV4Channel_Particle_Func_Output_NewOutput1;
SelectV4Channel_Particle_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4001.Vector4, Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4001.Channel, SelectV4Channel_Particle_Func_Output_NewOutput1, Context);
Out_Float = SelectV4Channel_Particle_Func_Output_NewOutput1;
float SelectV4Channel_Particle_Func_Output_NewOutput2;
SelectV4Channel_Particle_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4003.Vector4, Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4003.Channel, SelectV4Channel_Particle_Func_Output_NewOutput2, Context);
Out_Float = SelectV4Channel_Particle_Func_Output_NewOutput2;
float SelectV4Channel_Particle_Func_Output_NewOutput3;
SelectV4Channel_Particle_Func_(Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4002.Vector4, Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4002.Channel, SelectV4Channel_Particle_Func_Output_NewOutput3, Context);
Out_Float = SelectV4Channel_Particle_Func_Output_NewOutput3;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX5, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY5);
float4 Output112;
Output112.r = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Red;
Output112.g = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Green;
Output112.b = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Blue;
Output112.a = Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Alpha;
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
int Constant132 = 0;
float2 ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit;
ExecutionIndexToUnit_Emitter_LightingGridDownsample(ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit);
DownsampleSimGrid9B46ADFD0304787C81F777FAA8BC8E00071257D1Emitter_SimGridEmitter_LightingGridDownsample_Func_(ExecutionIndexToUnit_Emitter_LightingGridDownsampleOutput_Unit, Context.MapSimStage14_LightingPrePass.Grid2D_DownsampleScalar.HighResolutionAttribute, Constant132, Context);
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform;
float4x4 GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform;
GetViewSpaceTransformsGPU_Emitter_CameraQuery(GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToViewTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToTranslatedWorldTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_CameraViewToTranslatedWorldTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipTransform, GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_ViewToClipNoAATransform);
float X4;
float Y4;
float Z4;
X4 = In_WorldDirection.x;
Y4 = In_WorldDirection.y;
Z4 = In_WorldDirection.z;
float Constant135 = 0;
float4 Output114;
Output114.x = X4;
Output114.y = Y4;
Output114.z = Z4;
Output114.w = Constant135;
float4 Result91 = mul(Output114,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform);
float Constant136 = 1;
float4 Result92 = Result91 * Constant136;
float X5;
float Y5;
float Z5;
float W3;
X5 = Result92.x;
Y5 = Result92.y;
Z5 = Result92.z;
W3 = Result92.w;
float2 Output115;
Output115.x = X5;
Output115.y = Y5;
float3 Output116;
Output116.x = X5;
Output116.y = Y5;
Output116.z = Z5;
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
float X6;
float Y6;
float Z6;
X6 = In_WorldDirection.x;
Y6 = In_WorldDirection.y;
Z6 = In_WorldDirection.z;
float Constant141 = 0;
float4 Output117;
Output117.x = X6;
Output117.y = Y6;
Output117.z = Z6;
Output117.w = Constant141;
float4 Result94 = mul(Output117,GetViewSpaceTransformsGPU_Emitter_CameraQueryOutput_TranslatedWorldToCameraViewTransform1);
float Constant142 = 1;
float4 Result95 = Result94 * Constant142;
float X7;
float Y7;
float Z7;
float W4;
X7 = Result95.x;
Y7 = Result95.y;
Z7 = Result95.z;
W4 = Result95.w;
float2 Output118;
Output118.x = X7;
Output118.y = Y7;
float3 Output119;
Output119.x = X7;
Output119.y = Y7;
Output119.z = Z7;
Out_TangentDirectionVector2d = Output118;
Out_TangentDirectionVector = Output119;
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y,  0,  multipleScattering);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x+length,  In_UnitCoordinates.y,  0,  ms1);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x-length,  In_UnitCoordinates.y,  0,  ms2);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y+length,  0,  ms3);
SampleGrid_Emitter_LightingGridDownsample(In_UnitCoordinates.x,  In_UnitCoordinates.y-length,  0,  ms4);
Out_Value = multipleScattering;
float Constant133 = 16;
float Constant134 = 60;
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
float Constant137 = 1;
float Result93 = Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthSun * Constant137;
int Constant138 = 0;
float ComputeLightingSunFB099FCB6391A3D7B090EFA8A3983A46849A6CECEmitter_SimGridEmitter_SimGrid_Func_Output_Value;
ComputeLightingSunFB099FCB6391A3D7B090EFA8A3983A46849A6CECEmitter_SimGridEmitter_SimGrid_Func_(Constant133, Constant134, Output113, Grid2D_ComputeLighting_WorldToTangent_Emitter_Func_Output_TangentDirectionVector2d, Result93, Constant138, Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingSunFB099FCB6391A3D7B090EFA8A3983A46849A6CECEmitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
float Constant139 = 8;
float Constant140 = 32;
float2 Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d;
float3 Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector;
Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_(Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.EnvironmentDirection, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector, Context);
float Constant143 = 1;
float Result96 = Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthEnvironment * Constant143;
int Constant144 = 1;
float ComputeLightingEnvironmentC6F2A3847B7809565B6F87CA92548C443B72864FEmitter_SimGridEmitter_SimGrid_Func_Output_Value;
ComputeLightingEnvironmentC6F2A3847B7809565B6F87CA92548C443B72864FEmitter_SimGridEmitter_SimGrid_Func_(Constant139, Constant140, Output113, Grid2D_ComputeLighting_WorldToTangent001_Emitter_Func_Output_TangentDirectionVector2d, Result96, Constant144, Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingEnvironmentC6F2A3847B7809565B6F87CA92548C443B72864FEmitter_SimGridEmitter_SimGrid_Func_Output_Value, Context);
float ComputeLightingTemperatureF4954D22451C60B0059AD2B4A362A878FB7D51F0Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value;
ComputeLightingTemperatureF4954D22451C60B0059AD2B4A362A878FB7D51F0Emitter_SimGridEmitter_LightingGridDownsample_Func_(Output113, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX6, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY6, ComputeLightingTemperatureF4954D22451C60B0059AD2B4A362A878FB7D51F0Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value, Context);
float3 Output120;
Output120.x = ComputeLightingSunFB099FCB6391A3D7B090EFA8A3983A46849A6CECEmitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output120.y = ComputeLightingEnvironmentC6F2A3847B7809565B6F87CA92548C443B72864FEmitter_SimGridEmitter_SimGrid_Func_Output_Value;
Output120.z = ComputeLightingTemperatureF4954D22451C60B0059AD2B4A362A878FB7D51F0Emitter_SimGridEmitter_LightingGridDownsample_Func_Output_Value;
Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting = Output120;
float X8;
float Y8;
float Z8;
X8 = In_VECTOR_VAR.x;
Y8 = In_VECTOR_VAR.y;
Z8 = In_VECTOR_VAR.z;
float Constant148 = (0.0);
float NiagaraFloat_SelectResult7 = Constant148;
NiagaraFloat_SelectResult7 = X8;
NiagaraFloat_SelectResult7 = Y8;
NiagaraFloat_SelectResult7 = Z8;
Out_Float = NiagaraFloat_SelectResult7;
float SelectV3Channel_Particle_Func_Output_Float;
SelectV3Channel_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.Channel, SelectV3Channel_Particle_Func_Output_Float, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float;
float SelectV3Channel_Particle_Func_Output_Float1;
SelectV3Channel_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.Channel, SelectV3Channel_Particle_Func_Output_Float1, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float1;
float SelectV3Channel_Particle_Func_Output_Float2;
SelectV3Channel_Particle_Func_(Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.VECTOR_VAR, Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.Channel, SelectV3Channel_Particle_Func_Output_Float2, Context);
Out_Float = SelectV3Channel_Particle_Func_Output_Float2;
float Constant151 = 0;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7;
int ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7;
ExecutionIndexToGridIndex_Emitter_SimGrid(ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexX7, ExecutionIndexToGridIndex_Emitter_SimGridOutput_IndexY7);
float4 Output121;
Output121.r = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Red;
Output121.g = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Green;
Output121.b = Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Blue;
Output121.a = Constant151;
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
int Constant5 = 1;
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
int Constant13 = 1;
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
bool Constant39 = true;
bool Constant40 = true;
bool Constant41 = true;
bool Constant42 = true;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryUp = Constant39;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryRight = Constant40;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryDown = Constant41;
Context.MapSimStage4_PreSim.ComputeBoundaryGrid2D.OpenBoundaryLeft = Constant42;
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
EnterStatScope(7 /**ScratchModule_03001_Emitter_Func_*/);
ScratchModule_03001_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_03001_Emitter_Func_*/);
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
Context.MapSimStage4_PreSim.ScratchDynamicInput_05.InColor = Context.MapSimStage4_PreSim.OUTPUT_VAR.ScratchModule_03001.Color;
float4 ScratchDynamicInput_05_Emitter_Func_Output_Output;
ScratchDynamicInput_05_Emitter_Func_(ScratchDynamicInput_05_Emitter_Func_Output_Output, Context);
Context.MapSimStage4_PreSim.SetVariables_E999D6404B73E9C72DA5DB8376548585.Emitter.SimGrid.Color = ScratchDynamicInput_05_Emitter_Func_Output_Output;
EnterStatScope(10 /**SetVariables_E999D6404B73E9C72DA5DB8376548585_Emitter_Func_*/);
SetVariables_E999D6404B73E9C72DA5DB8376548585_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E999D6404B73E9C72DA5DB8376548585_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.dx = Context.MapSimStage4_PreSim.Emitter.dx;
Context.MapSimStage4_PreSim.Grid2D_ComputeGradient001.ScalarIndex = Context.MapSimStage4_PreSim.Emitter.SimGrid_SimFloatIndex;
EnterStatScope(11 /**Grid2D_ComputeGradient001_Emitter_Func_*/);
Grid2D_ComputeGradient001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeGradient001_Emitter_Func_*/);
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.dx = Context.MapSimStage4_PreSim.Emitter.dx;
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.GradCurl = Context.MapSimStage4_PreSim.OUTPUT_VAR.Grid2D_ComputeGradient001.Grad;
Context.MapSimStage4_PreSim.VorticityConfinementForceGrid2D.VorticityMult = Context.MapSimStage4_PreSim.Emitter.fluids_solver_vorticityConfinement;
float2 Constant45 = float2(0,0);
Context.MapSimStage4_PreSim.Transient.PhysicsForce = Constant45;
EnterStatScope(12 /**VorticityConfinementForceGrid2D_Emitter_Func_*/);
VorticityConfinementForceGrid2D_Emitter_Func_(Context);
ExitStatScope(/**VorticityConfinementForceGrid2D_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Multiply_Float001.B = Context.MapSimStage4_PreSim.Emitter.fluids_solver_densityBouyancy;
Context.MapSimStage4_PreSim.Multiply_Float008.B = Context.MapSimStage4_PreSim.Emitter.fluids_solver_temperatureBouyancy;
float Constant46 = 1;
float Multiply_Float001_Emitter_Func_Output_Result;
Multiply_Float001_Emitter_Func_(Multiply_Float001_Emitter_Func_Output_Result, Context);
float Constant48 = -1;
float Multiply_Float008_Emitter_Func_Output_Result;
Multiply_Float008_Emitter_Func_(Multiply_Float008_Emitter_Func_Output_Result, Context);
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.DensityBuoyancy = Multiply_Float001_Emitter_Func_Output_Result;
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.g = Context.MapSimStage4_PreSim.Emitter.g;
Context.MapSimStage4_PreSim.Grid2D_Gas_3DBuoyancy.TemperatureBuoyancy = Multiply_Float008_Emitter_Func_Output_Result;
float3 Constant50 = float3(0,0,0);
Context.MapSimStage4_PreSim.Transient.PhysicsForceWorld = Constant50;
EnterStatScope(13 /**Grid2D_Gas_3DBuoyancy_Emitter_Func_*/);
Grid2D_Gas_3DBuoyancy_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_3DBuoyancy_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_TurbulenceForce.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
float Constant51 = 1;
float Constant52 = 1;
float Constant53 = 1;
EnterStatScope(14 /**Grid2D_TurbulenceForce_Emitter_Func_*/);
Grid2D_TurbulenceForce_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_TurbulenceForce_Emitter_Func_*/);
Context.MapSimStage4_PreSim.Grid2D_WindForce.UnitToWorld = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld;
Context.MapSimStage4_PreSim.Grid2D_WindForce.WorldToLocal = Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal;
Context.MapSimStage4_PreSim.Grid2D_WindForce.dx = Context.MapSimStage4_PreSim.Emitter.dx;
float3 Constant58 = float3(1,1,0);
float Constant59 = 0;
EnterStatScope(15 /**Grid2D_WindForce_Emitter_Func_*/);
Grid2D_WindForce_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_WindForce_Emitter_Func_*/);
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
int Constant67 = 1;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.dx = Context.MapSimStage5_AdvectVelocity.Emitter.dx;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.ScalarIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.VelocityIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar.InterpolationMethod = Constant67;
float Constant68 = 1;
EnterStatScope(18 /**Grid2D_AdvectScalar_Emitter_Func_*/);
Grid2D_AdvectScalar_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar_Emitter_Func_*/);
Context.MapSimStage5_AdvectVelocity.Add_Integer001.A = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
int Constant71 = 1;
int Add_Integer001_Emitter_Func_Output_NewOutput;
Add_Integer001_Emitter_Func_(Add_Integer001_Emitter_Func_Output_NewOutput, Context);
int Constant73 = 1;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dt = Context.MapSimStage5_AdvectVelocity.Emitter.dt;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.dx = Context.MapSimStage5_AdvectVelocity.Emitter.dx;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.ScalarIndex = Add_Integer001_Emitter_Func_Output_NewOutput;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.VelocityIndex = Context.MapSimStage5_AdvectVelocity.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage5_AdvectVelocity.Grid2D_AdvectScalar001.InterpolationMethod = Constant73;
float Constant74 = 1;
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
Context.MapSimStage6_ComputeDivergence.ScratchModule_04.Div = Context.MapSimStage6_ComputeDivergence.OUTPUT_VAR.Grid2D_ComputeDivergence.Div;
Context.MapSimStage6_ComputeDivergence.ScratchModule_04.dt = Context.MapSimStage6_ComputeDivergence.Emitter.dt;
EnterStatScope(25 /**ScratchModule_04_Emitter_Func_*/);
ScratchModule_04_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_04_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage6_ComputeDivergence
//Begin Stage Script: MapSimStage7_SolvePressure!
EnterStatScope(26 /**GetDivergence_Emitter_Func_*/);
GetDivergence_Emitter_Func_(Context);
ExitStatScope(/**GetDivergence_Emitter_Func_*/);
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dt = Context.MapSimStage7_SolvePressure.Emitter.dt;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.dx = Context.MapSimStage7_SolvePressure.Emitter.dx;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Divergence = Context.MapSimStage7_SolvePressure.Transient.Divergence;
Context.MapSimStage7_SolvePressure.Grid2D_PressureIteration.Relaxation = Context.MapSimStage7_SolvePressure.Emitter.fluids_solver_pressureRelaxation;
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
bool Constant86 = false;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.XDirecton = Constant86;
bool Constant87 = false;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.Inverse = Constant87;
bool Constant88 = true;
Context.MapSimStage8_SolvePressureASC40SinFFTinYASC41.Grid2D_ComputeFFT.bPoissonSolver = Constant88;
EnterStatScope(29 /**Grid2D_ComputeFFT_Emitter_Func_*/);
Grid2D_ComputeFFT_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage8_SolvePressureASC40SinFFTinYASC41
//Begin Stage Script: MapSimStage9_SolvePressureASC40SinFFTinXASC41!
bool Constant89 = true;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.dx = Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Emitter.dx;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.XDirecton = Constant89;
bool Constant90 = false;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.Inverse = Constant90;
bool Constant91 = true;
Context.MapSimStage9_SolvePressureASC40SinFFTinXASC41.Grid2D_ComputeFFT001.bPoissonSolver = Constant91;
EnterStatScope(30 /**Grid2D_ComputeFFT001_Emitter_Func_*/);
Grid2D_ComputeFFT001_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT001_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage9_SolvePressureASC40SinFFTinXASC41
//Begin Stage Script: MapSimStage10_SolvePressureASC40InvSinFFTinXASC41!
bool Constant92 = true;
bool Constant93 = true;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.dx = Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Emitter.dx;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.Inverse = Constant92;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.XDirecton = Constant93;
bool Constant94 = true;
Context.MapSimStage10_SolvePressureASC40InvSinFFTinXASC41.Grid2D_ComputeFFT002.bPoissonSolver = Constant94;
EnterStatScope(31 /**Grid2D_ComputeFFT002_Emitter_Func_*/);
Grid2D_ComputeFFT002_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeFFT002_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage10_SolvePressureASC40InvSinFFTinXASC41
//Begin Stage Script: MapSimStage11_SolvePressureASC40InvSinFFTinYASC41!
bool Constant95 = true;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.dx = Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Emitter.dx;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.Inverse = Constant95;
bool Constant96 = false;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.XDirecton = Constant96;
bool Constant97 = true;
Context.MapSimStage11_SolvePressureASC40InvSinFFTinYASC41.Grid2D_ComputeFFT003.bPoissonSolver = Constant97;
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
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.dt = Context.MapSimStage12_ProjectPressure.Emitter.dt;
Context.MapSimStage12_ProjectPressure.ProjectPressureGrid2D.PressureGradient = Context.MapSimStage12_ProjectPressure.OUTPUT_VAR.Grid2D_ComputeGradient.Grad;
float Constant98 = 1;
Context.MapSimStage12_ProjectPressure.Local.ProjectPressureGrid2D.density = Constant98;
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
int Constant106 = 1;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.ScalarIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_DensityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.VelocityIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar002.InterpolationMethod = Constant106;
float Constant107 = 1;
EnterStatScope(36 /**Grid2D_AdvectScalar002_Emitter_Func_*/);
Grid2D_AdvectScalar002_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar002_Emitter_Func_*/);
int Constant110 = 1;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.ScalarIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_TemperatureIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.VelocityIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectScalar003.InterpolationMethod = Constant110;
float Constant111 = 1;
EnterStatScope(37 /**Grid2D_AdvectScalar003_Emitter_Func_*/);
Grid2D_AdvectScalar003_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectScalar003_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.DissipationRate = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationDensity;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar002.AdvectedScalar;
float Constant114 = 0;
EnterStatScope(38 /**DissipateFloat_Emitter_Func_*/);
DissipateFloat_Emitter_Func_(Context);
ExitStatScope(/**DissipateFloat_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.DissipationRate = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.fluids_solver_dissipationTemperature;
Context.MapSimStage13_AdvectScalarsandPostSim.DissipateFloat001.FloatValue = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectScalar003.AdvectedScalar;
float Constant119 = 0;
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
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.dt = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dt;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.VelocityIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_AdvectVector4.AttributeIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_ColorIndex;
float Constant121 = 1;
EnterStatScope(42 /**Grid2D_AdvectVector4_Emitter_Func_*/);
Grid2D_AdvectVector4_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_AdvectVector4_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A.Emitter.SimGrid.Color = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_AdvectVector4.AdvectedVector4;
EnterStatScope(43 /**SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A_Emitter_Func_*/);
SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E8A6762149BE038A7D34DAA2B5EDDA1A_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.dx = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.dx;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_ComputeCurl.VectorIndex = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_VelocityIndex;
EnterStatScope(44 /**Grid2D_ComputeCurl_Emitter_Func_*/);
Grid2D_ComputeCurl_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeCurl_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.ScratchDynamicInput_06.Vector4 = Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Color;
float4 ScratchDynamicInput_06_Emitter_Func_Output_Output;
ScratchDynamicInput_06_Emitter_Func_(ScratchDynamicInput_06_Emitter_Func_Output_Output, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.SetVariables_E34011A846386C9E92A2D4AB29AFF617.Transient.Tmp = ScratchDynamicInput_06_Emitter_Func_Output_Output;
EnterStatScope(45 /**SetVariables_E34011A846386C9E92A2D4AB29AFF617_Emitter_Func_*/);
SetVariables_E34011A846386C9E92A2D4AB29AFF617_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_E34011A846386C9E92A2D4AB29AFF617_Emitter_Func_*/);
Context.MapSimStage13_AdvectScalarsandPostSim.ScratchModule_02001.Value = Context.MapSimStage13_AdvectScalarsandPostSim.OUTPUT_VAR.Grid2D_ComputeCurl.Curl;
EnterStatScope(46 /**ScratchModule_02001_Emitter_Func_*/);
ScratchModule_02001_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_02001_Emitter_Func_*/);
int Constant125 = 3;
int Constant126 = 2;
int Constant127 = 0;
int Constant128 = 1;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4.Channel = Constant125;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4.Vector4 = Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Tmp;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4001.Channel = Constant126;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4001.Vector4 = Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Tmp;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4003.Channel = Constant127;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4003.Vector4 = Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Tmp;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4002.Channel = Constant128;
Context.MapSimStage13_AdvectScalarsandPostSim.MakeFloatFromVector4002.Vector4 = Context.MapSimStage13_AdvectScalarsandPostSim.Transient.Tmp;
float MakeFloatFromVector4_Emitter_Func_Output_Float;
MakeFloatFromVector4_Emitter_Func_(MakeFloatFromVector4_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector4001_Emitter_Func_Output_Float;
MakeFloatFromVector4001_Emitter_Func_(MakeFloatFromVector4001_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector4003_Emitter_Func_Output_Float;
MakeFloatFromVector4003_Emitter_Func_(MakeFloatFromVector4003_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector4002_Emitter_Func_Output_Float;
MakeFloatFromVector4002_Emitter_Func_(MakeFloatFromVector4002_Emitter_Func_Output_Float, Context);
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Alpha = MakeFloatFromVector4_Emitter_Func_Output_Float;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Blue = MakeFloatFromVector4001_Emitter_Func_Output_Float;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Red = MakeFloatFromVector4003_Emitter_Func_Output_Float;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Green = MakeFloatFromVector4002_Emitter_Func_Output_Float;
bool Constant130 = true;
Context.MapSimStage13_AdvectScalarsandPostSim.Grid2D_Gas_SetRTValues.Enabled = Constant130;
EnterStatScope(47 /**Grid2D_Gas_SetRTValues_Emitter_Func_*/);
Grid2D_Gas_SetRTValues_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_Gas_SetRTValues_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage13_AdvectScalarsandPostSim
//Begin Stage Script: MapSimStage14_LightingPrePass!
Context.MapSimStage14_LightingPrePass.Grid2D_DownsampleScalar.HighResolutionAttribute = Context.MapSimStage14_LightingPrePass.Emitter.SimGrid_TemperatureIndex;
int Constant131 = 0;
EnterStatScope(48 /**Grid2D_DownsampleScalar_Emitter_Func_*/);
Grid2D_DownsampleScalar_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_DownsampleScalar_Emitter_Func_*/);
//End Simulation Stage Script: MapSimStage14_LightingPrePass
//Begin Stage Script: MapSimStage15_ComputeLighting!
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.SunDirection = Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_sunDirection;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.EnvironmentDirection = Context.MapSimStage15_ComputeLighting.Emitter.fluids_lighting_environmentDirection;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthEnvironment = Context.MapSimStage15_ComputeLighting.Emitter.ShadowDensityMult;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.ShadowStrengthSun = Context.MapSimStage15_ComputeLighting.Emitter.ShadowDensityMult;
Context.MapSimStage15_ComputeLighting.Grid2D_ComputeLighting.DensityIndex = Context.MapSimStage15_ComputeLighting.Emitter.SimGrid_DensityIndex;
EnterStatScope(49 /**Grid2D_ComputeLighting_Emitter_Func_*/);
Grid2D_ComputeLighting_Emitter_Func_(Context);
ExitStatScope(/**Grid2D_ComputeLighting_Emitter_Func_*/);
int Constant145 = 1;
int Constant146 = 2;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector001.Channel = Constant145;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.VECTOR_VAR = Context.MapSimStage15_ComputeLighting.OUTPUT_VAR.Grid2D_ComputeLighting.Lighting;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector002.Channel = Constant146;
int Constant147 = 0;
Context.MapSimStage15_ComputeLighting.MakeFloatFromVector.Channel = Constant147;
float MakeFloatFromVector_Emitter_Func_Output_Float;
MakeFloatFromVector_Emitter_Func_(MakeFloatFromVector_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector001_Emitter_Func_Output_Float;
MakeFloatFromVector001_Emitter_Func_(MakeFloatFromVector001_Emitter_Func_Output_Float, Context);
float MakeFloatFromVector002_Emitter_Func_Output_Float;
MakeFloatFromVector002_Emitter_Func_(MakeFloatFromVector002_Emitter_Func_Output_Float, Context);
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Red = MakeFloatFromVector_Emitter_Func_Output_Float;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Green = MakeFloatFromVector001_Emitter_Func_Output_Float;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Blue = MakeFloatFromVector002_Emitter_Func_Output_Float;
float Constant149 = 0;
bool Constant150 = true;
Context.MapSimStage15_ComputeLighting.Grid2D_Gas_SetRTValues001.Enabled = Constant150;
EnterStatScope(50 /**Grid2D_Gas_SetRTValues001_Emitter_Func_*/);
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
Emitter_ParticleSource_AttributeCompressed[2];
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
Out_Val.b = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 2, 0)); 
Out_Val.a = Emitter_SimGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 3, 0)); 
int In_AttributeIndex = 8;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 0)] = In_Value.r;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 1)] = In_Value.g;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 2)] = In_Value.b;
Emitter_SimGrid_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex + 3)] = In_Value.a;
Out_NumCellsX = Emitter_SimGrid_NumCells.x;
Out_NumCellsY = Emitter_SimGrid_NumCells.y;
Out_Unit = (float2(GDispatchThreadId.x, GDispatchThreadId.y) + .5) * rcp(Emitter_SimGrid_NumCells);
const uint IndexX = Linear % Emitter_SimGrid_NumCells.x;
const uint IndexY = Linear / Emitter_SimGrid_NumCells.x;
Out_Unit = (float2(IndexX, IndexY) + .5) * Emitter_SimGrid_UnitToUV;
Out_Simulation = mul(float4(In_Unit, 1.0), In_UnitToSimulationTransform).xyz;
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
Out_Val.b = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 2, 0)); 
Out_Val.a = Emitter_SourceGrid_Grid.Load(int4(In_IndexX, In_IndexY, In_AttributeIndex + 3, 0)); 
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
    int RegisterIndex = Emitter_ParticleSource_AttributeIndices[1].y;
        if (Emitter_ParticleSource_AttributeCompressed[1].y)
                Out_Value.w = float(Emitter_ParticleSource_InputHalfBuffer[(RegisterIndex + 3)*Emitter_ParticleSource_ParticleStrideHalf + ParticleIndex]);
                Out_Value.w = float(Emitter_ParticleSource_InputFloatBuffer[(RegisterIndex + 3)*Emitter_ParticleSource_ParticleStrideFloat + ParticleIndex]);
        Out_Value = (float4)0;
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
// Variable Name "Emitter.SimGrid.Color" Type "Vector4f" Var "Map.Emitter.SimGrid.Color"
GetPreviousVector4Value_Emitter_SimGrid_AttributeColor(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Color);
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
// Name "Emitter.SimGrid.Color" Type "Vector4f" Var "Map.Emitter.SimGrid.Color"
SetVector4Value_Emitter_SimGrid_UEImpureCall_AttributeColor(X, Y, Context.MapSimStage1_Init.Emitter.SimGrid.Color);
TeardownFromIterationSource_MapSimStage1_Init_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage1_Init_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
GetPreviousFloatValue_Emitter_SimGrid_AttributeDensity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
GetPreviousVector2DValue_Emitter_SimGrid_AttributeVelocity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity);
GetPreviousFloatValue_Emitter_SimGrid_AttributeTemperature(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature);
GetPreviousVector4Value_Emitter_SimGrid_AttributeColor(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Color);
SetupFromIterationSource_MapSimStage4_PreSim_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage4_PreSim_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Density);
SetVector2DValue_Emitter_SimGrid_UEImpureCall_AttributeVelocity(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Boundary);
SetVector4Value_Emitter_SimGrid_UEImpureCall_AttributeColor(X, Y, Context.MapSimStage4_PreSim.Emitter.SimGrid.Color);
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
GetPreviousVector4Value_Emitter_SimGrid_AttributeColor(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Color);
SetupFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedSetup_Func_(Context);
SetupFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedReadAttributesEmitter_SimGrid_Func_(Context);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeBoundary(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeDensity(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density);
SetFloatValue_Emitter_SimGrid_UEImpureCall_AttributeTemperature(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature);
SetVector4Value_Emitter_SimGrid_UEImpureCall_AttributeColor(X, Y, Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Color);
TeardownFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedTeardown_Func_(Context);
TeardownFromIterationSource_MapSimStage13_AdvectScalarsandPostSim_GeneratedWriteAttributesEmitter_SimGrid_Func_(Context);
SetupFromIterationSource_MapSimStage14_LightingPrePass_GeneratedSetup_Func_(Context);
TeardownFromIterationSource_MapSimStage14_LightingPrePass_GeneratedTeardown_Func_(Context);
Context.MapSimStage1_Init.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
Context.MapSimStage1_Init.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage1_Init.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
Context.MapSimStage1_Init.Emitter.SimGrid.Boundary = Emitter_SimGrid_Boundary;
Context.MapSimStage1_Init.Emitter.SimGrid.Color = Emitter_SimGrid_Color;
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
Context.MapSimStage4_PreSim.Emitter.dx = Emitter_dx;
Context.MapSimStage4_PreSim.Emitter.SimGrid_SimFloatIndex = Emitter_SimGrid_SimFloatIndex;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_vorticityConfinement = Emitter_fluids_solver_vorticityConfinement;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_densityBouyancy = Emitter_fluids_solver_densityBouyancy;
Context.MapSimStage4_PreSim.Emitter.fluids_solver_temperatureBouyancy = Emitter_fluids_solver_temperatureBouyancy;
Context.MapSimStage4_PreSim.Emitter.g = Emitter_g;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.UnitToWorld = Emitter_Grid2D_CreateUnitToWorldTransform_UnitToWorld;
Context.MapSimStage4_PreSim.Engine.Time = Engine_Time;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.WorldToLocal = Emitter_Grid2D_CreateUnitToWorldTransform_WorldToLocal;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Velocity = Emitter_SimGrid_Velocity;
Context.MapSimStage4_PreSim.Emitter.dt = Emitter_dt;
Context.MapSimStage4_PreSim.Emitter.Grid2D_CreateUnitToWorldTransform.LocalToWorldRotation = Emitter_Grid2D_CreateUnitToWorldTransform_LocalToWorldRotation;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
Context.MapSimStage4_PreSim.Emitter.SimGrid.Color = Emitter_SimGrid_Color;
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
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid_ColorIndex = Emitter_SimGrid_ColorIndex;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Boundary = Emitter_SimGrid_Boundary;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Color = Emitter_SimGrid_Color;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Density = Emitter_SimGrid_Density;
Context.MapSimStage13_AdvectScalarsandPostSim.Emitter.SimGrid.Temperature = Emitter_SimGrid_Temperature;
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
Í;Eao>°◊K∑ZàõûT⁄OCM
ˇ†LœZ;Ár
ƒC†‹;©
èW;˙99
Wö;‡@¶Œ`
>˙∆;7L˚JÜ¥Êstçˆ[4
>˙∆;7L˚JÜ¥Êstçˆ[h
„~IäLb»I∂;!Éö
0ûíÍÉ'ÔåG;‘;l2J"4
0ûíÍÉ'ÔåG;‘;l2J"h
npOÄ£k;•åUÁœ
æ iyM0›Bñ,;{Z˙É∆4
æ iyM0›Bñ,;{Z˙É∆h
npOÄ£k;•åUÁò
xè‚B Èpeú;ªj
0m4P≈ﬁA;•K¶ó_Î˛
?f;ì<c⁄
hd‚;Y¬≈M
ª°p7¥;÷5÷eñò
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
float Emitter_AlphaScale;
float Emitter_SpawnRate;
float PREV_Emitter_AlphaScale;
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
int SurfaceExpansionMode;
float3 Force;
float Mass;
bool WritetoIntrinsicProperties;
float4 fluid_source_color;
float2 SpriteSize;
FParamMap0_SetVariables_BC233B974F5C4573F8E3A4A245A8C536_Particles Particles;
float4 ColorValueToScale;
float ScaleAlpha;
float Lifetime;
float SpriteRotation;
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
float3 ConeVector;
float DotBetweenConeVectorAndAxis;
float3 LocalTransformBitangent;
float3 LocalTransformNormal;
float3 LocalTransformTangent;
float3 LocalTransformVector;
float3 TransformedVector;
FParamMap0_Local_AddVelocity_TransformStack_Rotation TransformStack_Rotation;
FParamMap0_Local_AddVelocity AddVelocity;
FParamMap0_Local_AddVelocityInCone AddVelocityInCone;
FParamMap0_Local_CurlNoiseForce CurlNoiseForce;
FParamMap0_Local_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_Local_SphereLocation SphereLocation;
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
float ScaleCurve;
int ExecutionCount;
float AlphaScale;
float SpawnRate;
bool Alive;
float CurlNoiseConeMaskAngle;
float3 CurlNoiseConeMaskAxis;
float CurlNoiseConeMaskFalloffAngle;
float NormalizedAngle;
int Position;
int SpriteRotation;
int SpriteSize;
int Velocity;
int PhysicsForce;
int Color;
int Age;
int DistanceTraveled;
int fluid_source_color;
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
float ConeAngle;
int ConeAxisCoordinateSpace;
bool UseVelocityFalloffOnConeAxis;
float VelocityStrength;
bool InvertRotationQuaternion;
int RotationCoordinateSpace;
float4x4 RotationMatrix;
FParamMap0_AddVelocity AddVelocity;
FParamMap0_AddVelocityInCone AddVelocityInCone;
FParamMap0_ApplyInitialForces ApplyInitialForces;
FParamMap0_Color Color;
FParamMap0_Cosine001 Cosine001;
FParamMap0_CurlNoiseForce CurlNoiseForce;
FParamMap0_DataInstance DataInstance;
FParamMap0_FloatFromCurve FloatFromCurve;
FParamMap0_FloatFromCurve001 FloatFromCurve001;
FParamMap0_FloatFromCurve004 FloatFromCurve004;
FParamMap0_Fluids_Gas_Source Fluids_Gas_Source;
FParamMap0_InitializeParticle InitializeParticle;
FParamMap0_Interpolation Interpolation;
FParamMap0_ParticleState ParticleState;
FParamMap0_ScaleColor ScaleColor;
FParamMap0_SetVariables_BC233B974F5C4573F8E3A4A245A8C536 SetVariables_BC233B974F5C4573F8E3A4A245A8C536;
FParamMap0_SolveForcesAndVelocity SolveForcesAndVelocity;
FParamMap0_SphereLocation SphereLocation;
FParamMap0_Vector2DFromFloat Vector2DFromFloat;
FParamMap0_Vector2DFromFloat002 Vector2DFromFloat002;
void CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat003_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat001_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void Vector2DFromFloat_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void RandomRangeFloat_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void GetRandomInfo_Emitter_Determinism_false_Particle_Func_(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void RandomRangeFloat_Func_(float In_Min, float In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float Out_Result, inout FSimulationContext Context);
void InitializeParticle_SimulationPosition_Emitter_Func_(out float3 Out_OutPosition, inout FSimulationContext Context);
void InitializeParticle_Emitter_Func_(inout FSimulationContext Context);
void Cosine001_Emitter_Func_(out float Out_NewOutput, inout FSimulationContext Context);
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
void CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float3 In_RangeMin, float3 In_RangeMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float3 Out_RandomValue, out bool Out_IsDeterministic, inout FSimulationContext Context);
void CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(float In_InnerRadius, float In_OuterRadius, int In_Seed, out float3 Out_Ouput, inout FSimulationContext Context);
void CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_(bool In_X, bool In_Y, bool In_Z, out float3 Out_Output);
void SphereLocation_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_NF_TransformVector_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void SphereLocation_Emitter_Func_(inout FSimulationContext Context);
void SampleField_Emitter_VectorField32(float3 In_SamplePoint, out float3 Out_SampledValue);
void CurlNoiseForce_Emitter_Func_(int In_Emitter_RandomSeed, inout FSimulationContext Context);
void AddVelocity_TransformStack_Rotation_TransformVector002_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void AddVelocity_TransformStack_Rotation_TransformVector001_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void AddVelocity_TransformStack_Rotation_TransformVector003_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void AddVelocity_TransformStack_Rotation_TransformVector004_Emitter_Func_(float3 In_InVector, int In_SourceSpace, int In_DestinationSpace, bool In_ApplyScale, out float3 Out_OutVector, inout FSimulationContext Context);
void AddVelocity_TransformStack_Rotation_Emitter_Func_(float3 In_InputVector, int In_RotationCoordinateSpace, float3 In_InputNormal, float3 In_InputTangent, float3 In_InputBitangent, out float3 Out_TransformedVector, out float3 Out_TransformedNormal, out float3 Out_TransformedTangent, out float3 Out_TransformedBitangent, inout FSimulationContext Context);
void AddVelocity_Emitter_Func_(inout FSimulationContext Context);
void ApplyInitialForces_Emitter_Func_(inout FSimulationContext Context);
void ParticleState_Emitter_Func_(inout FSimulationContext Context);
void SampleCurve_Emitter_ScaleAlpha_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void ScaleColor_Emitter_Func_(inout FSimulationContext Context);
void DragVelocity_Particle_Func_(float3 In_Velocity, float3 In_AdvectionVelocity, float In_InverseMass, float In_Drag, float In_DeltaTime, bool In_IgnoreMass, out float3 Out_Output, inout FSimulationContext Context);
void SolveForcesAndVelocity_Emitter_Func_(inout FSimulationContext Context);
void CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat004_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat005_Emitter_Func_(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void SampleCurve_Emitter_Radius_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve004_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void SampleCurve_Emitter_Temperature_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve001_Emitter_Func_(out float Out_Value, inout FSimulationContext Context);
void Fluids_Gas_Source_Emitter_Func_(inout FSimulationContext Context);
void Length_Emitter_SelectLinearColorFromArray001_ColorSelectionArray(out int Out_Num);
void CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(int In_Engine_System_RandomSeed, int In_IntegerMin, int In_IntegerMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out int Out_RandomValue, out bool Out_IsDeterministic, out bool Out_IsFixedRandomSeed, inout FSimulationContext Context);
void Get_Emitter_SelectLinearColorFromArray001_ColorSelectionArray(int In_Index, out float4 Out_Value);
void SelectLinearColorFromArray001_Emitter_Func_(out float4 Out_NewOutput001, inout FSimulationContext Context);
void Vector2DFromFloat002_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void SetVariables_BC233B974F5C4573F8E3A4A245A8C536_Emitter_Func_(inout FSimulationContext Context);
void Color_Emitter_Func_(inout FSimulationContext Context);
bool Constant37 = false;
float Result = In_FloatMax - In_FloatMin;
float Result1 = rand_float(Result);
float Result2 = In_FloatMin + Result1;
Out_RandomFloat = Result2;
Out_IsDeterministic = Constant37;
int Constant30 = (0);
float Constant31 = 600;
float Constant32 = 1000;
int Constant33 = 0;
int Constant34 = 0;
int Constant35 = (0);
int Constant36 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant30, Constant31, Constant32, Constant33, Constant34, Constant35, Constant36, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
int Constant41 = (0);
float Constant42 = 0.75;
float Constant43 = 1;
int Constant44 = 0;
int Constant45 = 0;
int Constant46 = (0);
int Constant47 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant41, Constant42, Constant43, Constant44, Constant45, Constant46, Constant47, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
float2 Output1;
Output1.x = Context.MapSpawn.Vector2DFromFloat.Value;
Output1.y = Context.MapSpawn.Vector2DFromFloat.Value;
Out_Vec2 = Output1;
int Constant54 = (0);
float Constant56 = 5;
int Constant57 = 0;
int Constant58 = 0;
int Constant59 = (0);
int Constant60 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat2;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic2;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant54, Constant55, Constant56, Constant57, Constant58, Constant59, Constant60, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat2, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic2, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat2;
bool Constant72 = false;
int Constant73 = 0;
bool Result3 = NiagaraAll(In_RandomnessMode == Constant73);
bool Result4 = Constant72 && Result3;
int Constant74 = 1;
bool Result5 = NiagaraAll(In_RandomnessMode == Constant74);
bool Result6 = Result4 || Result5;
int Seed_IfResult;
Seed_IfResult = In_Seed;
Seed_IfResult = Context.MapSpawn.Emitter.RandomSeed;
int Constant75 = 0;
int Constant76 = 0;
int Seed1_IfResult;
int Seed2_IfResult;
int Seed3_IfResult;
Seed1_IfResult = Seed_IfResult;
Seed2_IfResult = Constant75;
Seed3_IfResult = Constant76;
Seed1_IfResult = Context.MapSpawn.Particles.UniqueID;
Seed2_IfResult = Context.MapSpawn.Engine.System.TickCount;
Seed3_IfResult = Seed_IfResult;
int Constant77 = -1;
int Constant78 = -1;
int Constant79 = -1;
int Seed1_IfResult1;
int Seed2_IfResult1;
int Seed3_IfResult1;
Seed1_IfResult1 = Seed1_IfResult;
Seed2_IfResult1 = Seed2_IfResult;
Seed3_IfResult1 = Seed3_IfResult;
Seed1_IfResult1 = Constant77;
Seed2_IfResult1 = Constant78;
Seed3_IfResult1 = Constant79;
NiagaraRandInfo Output11;
Output11.Seed1 = Seed1_IfResult1;
Output11.Seed2 = Seed2_IfResult1;
Output11.Seed3 = Seed3_IfResult1;
Out_RandomInfo = Output11;
Out_UseDeterministicRandoms = Result6;
int Constant67 = (0);
bool Constant68 = false;
int Constant69 = 0;
int Constant70 = (0);
bool Constant71 = false;
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant67, In_OverrideSeed, Constant69, Constant70, Constant71, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms, Context);
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
float4 Constant87 = float4(1111,13.6009,0,1);
float4 Color_IfResult;
Color_IfResult = Constant87;
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
float Constant88 = 0;
float SpriteRotation_IfResult;
SpriteRotation_IfResult = Constant88;
SpriteRotation_IfResult = Context.MapSpawn.Particles.SpriteRotation;
Context.MapSpawn.Particles.SpriteRotation = SpriteRotation_IfResult;
float3 Constant89 = float3(1,1,1);
float3 Scale_IfResult;
Scale_IfResult = Constant89;
Scale_IfResult = Context.MapSpawn.Particles.Scale;
Context.MapSpawn.Particles.Scale = Scale_IfResult;
float3 Position_IfResult;
Position_IfResult = Context.MapSpawn.InitializeParticle.Position;
Position_IfResult = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Position = Position_IfResult;
float Constant95 = 0.4;
float Constant96 = 0;
float Constant97 = 88;
float Result11 = cos(Context.MapSpawn.Cosine001.NormalizedAngle*(TWO_PI/Constant95));
float Result12 = Result11 * Constant96;
float Result13 = Result12 + Constant97;
Out_NewOutput = Result13;
int Constant101 = (0);
float Constant102 = -50;
float Constant103 = 50;
int Constant104 = 0;
int Constant105 = 0;
int Constant106 = (0);
int Constant107 = (0);
float CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat3;
bool CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic3;
CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant101, Constant102, Constant103, Constant104, Constant105, Constant106, Constant107, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat3, CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic3, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat3;
int Constant122 = (0);
bool Constant123 = false;
int Constant124 = 0;
int Constant125 = (0);
NiagaraRandInfo GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1;
bool GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1;
GetRandomInfo_Emitter_Determinism_false_Particle_Func_(In_Seed, Constant122, In_OverrideSeed, Constant124, Constant125, In_FixedOverrideSeed, In_RandomnessMode, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1, GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_UseDeterministicRandoms1, Context);
float Result15 = In_Max - In_Min;
int Seed11;
int Seed21;
int Seed31;
Seed11 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed1;
Seed21 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed2;
Seed31 = GetRandomInfo_Emitter_Determinism_false_Particle_Func_Output_RandomInfo1.Seed3;
float Result16 = rand_float(Result15, Seed11, Seed21, Seed31);
float Result17 = rand_float(Result15);
float Random_IfResult1;
Random_IfResult1 = Result16;
Random_IfResult1 = Result17;
float Result18 = In_Min + Random_IfResult1;
Out_Result = Result18;
float Result25 = cos(In_Theta*(TWO_PI/In_Period));
float Result26 = In_Radius * Result25;
float Result27 = sin(In_Theta*(TWO_PI/In_Period));
float Result28 = In_Radius * Result27;
float2 XY;
XY.x = Result26;
XY.y = Result28;
float Constant138 = -1;
float Result29 = Result27 * Constant138;
float2 dXdY;
dXdY.x = Result29;
dXdY.y = Result25;
Out_XY = XY;
Out_X = Result26;
Out_Y = Result28;
Out_dXdY = dXdY;
Out_dX = Result29;
Out_dY = Result25;
float Result32 = dot(In_V,In_V);
float Result33 = In_Threshold * In_Threshold;
bool Result34 = NiagaraAll(Result32 < Result33);
float Result35 = length(In_Fallback);
float Result36 = rsqrt(Result32);
float3 Result37 = In_V * Result36;
float Result38 = Reciprocal(Result36);
float3 Constant141 = float3(0.0, 0.0, 0.0);
float3 Direction_SelectResult = Constant141;
float Constant142 = (0.0);
float Length_SelectResult = Constant142;
Direction_SelectResult = In_Fallback;
Length_SelectResult = Result35;
Direction_SelectResult = Result37;
Length_SelectResult = Result38;
Out_Direction = Direction_SelectResult;
Out_Length = Length_SelectResult;
Out_BelowThreshold = Result34;
float Constant120 = 1;
bool Constant121 = false;
float RandomRangeFloat_Func_Output_Result1;
RandomRangeFloat_Func_(Constant119, Constant120, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant121, RandomRangeFloat_Func_Output_Result1, Context);
float Constant126 = 0;
float Constant127 = 1;
bool Constant128 = false;
float RandomRangeFloat_Func_Output_Result2;
RandomRangeFloat_Func_(Constant126, Constant127, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant128, RandomRangeFloat_Func_Output_Result2, Context);
float Result19 = pow(max(0, RandomRangeFloat_Func_Output_Result2),In_ConePointDistribution);
float Constant129 = 1e-05;
float Constant130 = 179.875;
float Result20 = clamp(In_ConeAngle,Constant129,Constant130);
float Constant131 = 0.5;
float Result21 = Result20 * Constant131;
float Result22 = tan((PI/180.0f)*Result21);
float Constant132 = 0;
float Constant133 = 1;
bool Constant134 = false;
float RandomRangeFloat_Func_Output_Result3;
RandomRangeFloat_Func_(Constant132, Constant133, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant134, RandomRangeFloat_Func_Output_Result3, Context);
float Constant135 = 0.0001;
float Constant136 = 10;
float Result23 = clamp(In_ConeCurvature,Constant135,Constant136);
float Result24 = pow(max(0, RandomRangeFloat_Func_Output_Result1),Result23);
float float_IfResult;
float_IfResult = Result24;
float_IfResult = RandomRangeFloat_Func_Output_Result1;
float2 PolarToCartesianCoordinates_Func_Output_XY;
float PolarToCartesianCoordinates_Func_Output_X;
float PolarToCartesianCoordinates_Func_Output_Y;
float2 PolarToCartesianCoordinates_Func_Output_dXdY;
float PolarToCartesianCoordinates_Func_Output_dX;
float PolarToCartesianCoordinates_Func_Output_dY;
PolarToCartesianCoordinates_Func_(RandomRangeFloat_Func_Output_Result3, float_IfResult, Constant137, PolarToCartesianCoordinates_Func_Output_XY, PolarToCartesianCoordinates_Func_Output_X, PolarToCartesianCoordinates_Func_Output_Y, PolarToCartesianCoordinates_Func_Output_dXdY, PolarToCartesianCoordinates_Func_Output_dX, PolarToCartesianCoordinates_Func_Output_dY, Context);
float2 Result30 = Result22 * PolarToCartesianCoordinates_Func_Output_XY;
float2 Result31 = Result19 * Result30;
X = Result31.x;
Y = Result31.y;
Output12.x = RandomRangeFloat_Func_Output_Result1;
Output12.y = X;
Output12.z = Y;
float3 Constant139 = float3(1,0,0);
float Constant140 = 1e-05;
DirectionAndLengthSafe_v1_0_Particle_Func_(Output12, Constant139, Constant140, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold, Context);
Out_Vector = Output12;
Out_NormalizedVector = DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction;
float Result42 = In_INPUT_VAR - In_InputLow;
float Result43 = In_InputHigh - In_InputLow;
float Result44 = Result42 / Result43;
float Result45 = In_TargetHigh - In_TargetLow;
float Result46 = Result44 * Result45;
float Result47 = Result46 + In_TargetLow;
Out_Remapped = Result47;
int Constant155 = 0;
bool Result50 = NiagaraAll(In_SourceSpace == Constant155);
int Constant156 = 0;
bool Result51 = NiagaraAll(In_DestinationSpace == Constant156);
bool Result52 = Result50 && Result51;
int Constant157 = 1;
bool Result53 = NiagaraAll(In_SourceSpace == Constant157);
int Constant158 = 1;
bool Result54 = NiagaraAll(In_DestinationSpace == Constant158);
bool Result55 = Result53 && Result54;
bool Result56 = Result52 || Result55;
int Constant159 = 2;
bool Result57 = NiagaraAll(In_SourceSpace == Constant159);
int Constant160 = 2;
bool Result58 = NiagaraAll(In_DestinationSpace == Constant160);
bool Result59 = Result57 && Result58;
bool Result60 = Result56 || Result59;
bool Result61 = Result50 && Result58;
bool Result62 = Result57 && Result51;
bool Result63 = Result61 || Result62;
bool Result64 = In_bLocalSpace && Result63;
bool Result65 = Result60 || Result64;
bool Result66 = !In_bLocalSpace;
bool Result67 = Result50 && Result54;
bool Result68 = Result53 && Result51;
bool Result69 = Result67 || Result68;
bool Result70 = Result66 && Result69;
bool Result71 = Result65 || Result70;
bool Result72 = In_bLocalSpace && Result67;
bool Result73 = Result57 && Result54;
bool Result74 = Result72 || Result73;
bool Result75 = Result66 && Result62;
bool Result76 = Result74 || Result75;
float4x4 Matrix_IfResult1;
Matrix_IfResult1 = In_LocalToWorldTransform;
Matrix_IfResult1 = In_WorldToLocalTransform;
Out_bUseOriginal = Result71;
Out_OutTransform = Matrix_IfResult1;
Out_LocalToWorld = Result76;
bool Constant154 = false;
float4x4 Matrix001_IfResult;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult, Matrix001_IfResult, Constant154, TransformBase_Func_Output_bUseOriginal, TransformBase_Func_Output_OutTransform, TransformBase_Func_Output_LocalToWorld, Context);
float3 Result77 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform).xyz;
float3 Vector_IfResult;
Vector_IfResult = In_InVector;
Vector_IfResult = Result77;
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
float3 Constant161 = float3(1,0,0);
float Constant162 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_From, Constant161, Constant162, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold1, Context);
float3 Constant163 = float3(1,0,0);
float Constant164 = 1e-05;
float3 DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2;
float DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2;
bool DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2;
DirectionAndLengthSafe_v1_0_Particle_Func_(In_To, Constant163, Constant164, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Length2, DirectionAndLengthSafe_v1_0_Particle_Func_Output_BelowThreshold2, Context);
float4 CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_(DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction1, DirectionAndLengthSafe_v1_0_Particle_Func_Output_Direction2, CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result);
Out_NewOutput = CustomHlsl471747954F7F9E4B9F8E9E9234CD764E125E10A5_Func_Output_Result;
float3 Output0;
float Output13;
Output0.x = In_Quaternion.x;
Output0.y = In_Quaternion.y;
Output0.z = In_Quaternion.z;
Output13 = In_Quaternion.w;
float Result78 = dot(Output0,In_VECTOR_VAR);
float Constant165 = 2;
float Result79 = Result78 * Constant165;
float3 Result80 = Output0 * Result79;
float Result81 = Output13 * Output13;
float Result82 = dot(Output0,Output0);
float Result83 = Result81 - Result82;
float3 Result84 = Result83 * In_VECTOR_VAR;
float3 Result85 = Result80 + Result84;
float3 Result86 = cross(Output0,In_VECTOR_VAR);
float Constant166 = 2;
float Result87 = Output13 * Constant166;
float3 Result88 = Result86 * Result87;
float3 Result89 = Result85 + Result88;
Out_Vector = Result89;
float Constant112 = 0.5;
float Constant113 = 1e-05;
float Result14 = max(Context.MapSpawn.AddVelocityInCone.ConeAngle, Constant113);
bool Constant114 = false;
float Constant115 = 1;
int Constant116 = -1;
int Constant117 = 0;
bool Constant118 = false;
float3 RandomVectorInCone_Func_Output_Vector;
float3 RandomVectorInCone_Func_Output_NormalizedVector;
RandomVectorInCone_Func_(Result14, Constant112, Constant114, Constant115, Constant116, Constant117, Constant118, RandomVectorInCone_Func_Output_Vector, RandomVectorInCone_Func_Output_NormalizedVector, Context);
float3 Constant143 = float3(1,0,0);
float Result39 = dot(Constant143,RandomVectorInCone_Func_Output_NormalizedVector);
float Constant144 = 0.5;
float Result40 = Result14 * Constant144;
float Result41 = cos((PI/180.0f)*Result40);
float Constant145 = 1;
float Constant146 = 0;
float Constant147 = 1;
float RemapValueRange_Func_Output_Remapped;
RemapValueRange_Func_(Result39, Result41, Constant145, Constant146, Constant147, RemapValueRange_Func_Output_Remapped, Context);
float Constant148 = 0;
float Constant149 = 1;
float Result48 = clamp(RemapValueRange_Func_Output_Remapped,Constant148,Constant149);
Context.MapSpawn.Local.AddVelocityInCone.ConeVector = RandomVectorInCone_Func_Output_NormalizedVector;
Context.MapSpawn.Local.AddVelocityInCone.DotBetweenConeVectorAndAxis = Result48;
float3 Constant150 = float3(0,0,1);
float3 Constant151 = float3(1,0,0);
float3 Result49 = normalize(Constant150);
int Constant152 = 0;
bool Constant153 = false;
float3 AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector;
AddVelocityInCone_NF_TransformVector_Emitter_Func_(Result49, Context.MapSpawn.AddVelocityInCone.ConeAxisCoordinateSpace, Constant152, Constant153, AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
float4 FindQuatBetween_v1_0_Func_Output_NewOutput;
FindQuatBetween_v1_0_Func_(Constant151, AddVelocityInCone_NF_TransformVector_Emitter_Func_Output_OutVector, FindQuatBetween_v1_0_Func_Output_NewOutput, Context);
float3 MultiplyVectorWithQuaternion_Func_Output_Vector;
MultiplyVectorWithQuaternion_Func_(Context.MapSpawn.Local.AddVelocityInCone.ConeVector, FindQuatBetween_v1_0_Func_Output_NewOutput, MultiplyVectorWithQuaternion_Func_Output_Vector, Context);
Context.MapSpawn.Local.AddVelocityInCone.ConeVector = MultiplyVectorWithQuaternion_Func_Output_Vector;
float Constant167 = 0.333;
float Constant168 = 0.0001;
float Result90 = max(Constant167, Constant168);
float Result91 = pow(max(0, Context.MapSpawn.Local.AddVelocityInCone.DotBetweenConeVectorAndAxis),Result90);
float Result92 = Context.MapSpawn.AddVelocityInCone.VelocityStrength * Result91;
float float_IfResult1;
float_IfResult1 = Result92;
float_IfResult1 = Context.MapSpawn.AddVelocityInCone.VelocityStrength;
float3 Result93 = Context.MapSpawn.Local.AddVelocityInCone.ConeVector * float_IfResult1;
float3 Result94 = Context.MapSpawn.Particles.Velocity + Result93;
Context.MapSpawn.Particles.Velocity = Result94;
bool Constant197 = false;
float3 Result99 = In_RangeMax - In_RangeMin;
float3 Result100 = rand(Result99);
float3 Result101 = In_RangeMin + Result100;
Out_RandomValue = Result101;
Out_IsDeterministic = Constant197;
int Constant188 = (0);
float Constant189 = 0;
float Constant190 = -1;
float Constant191 = 3;
float Result96 = pow(max(0, In_InnerRadius),Constant191);
float3 Output14;
Output14.x = Constant189;
Output14.y = Constant190;
Output14.z = Result96;
float Result97 = TWO_PI;
float Constant192 = 1;
float Constant193 = 3;
float Result98 = pow(max(0, In_OuterRadius),Constant193);
Output15.x = Result97;
Output15.y = Constant192;
Output15.z = Result98;
int Constant194 = 0;
int Constant195 = (0);
int Constant196 = (0);
float3 CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue;
bool CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant188, Output14, Output15, In_Seed, Constant194, Constant195, Constant196, CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue, CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
float Phi;
float CosASC40ThetaASC41;
float RASC943;
Phi = CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue.x;
CosASC40ThetaASC41 = CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue.y;
RASC943 = CalculateRandomRange_ScriptUsage4_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue.z;
float Result102 = cos(Phi);
float Result103 = CosASC40ThetaASC41 * CosASC40ThetaASC41;
float Result104 = 1 - Result103;
float Result105 = sqrt(Result104);
float Result106 = Result102 * Result105;
float Result107 = sin(Phi);
float Result108 = Result107 * Result105;
Output16.x = Result106;
Output16.y = Result108;
Output16.z = CosASC40ThetaASC41;
float Constant198 = 0.333333;
float Result109 = pow(max(0, RASC943),Constant198);
float3 Result110 = Output16 * Result109;
Out_Ouput = Result110;
Out_Output = float3(In_X, In_Y, In_Z);
bool Constant206 = false;
float4x4 Matrix_IfResult2;
float4x4 Matrix001_IfResult1;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult2 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult1 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal1;
float4x4 TransformBase_Func_Output_OutTransform1;
bool TransformBase_Func_Output_LocalToWorld1;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult2, Matrix001_IfResult1, Constant206, TransformBase_Func_Output_bUseOriginal1, TransformBase_Func_Output_OutTransform1, TransformBase_Func_Output_LocalToWorld1, Context);
float3 Result114 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform1).xyz;
float3 Vector_IfResult1;
Vector_IfResult1 = In_InVector;
Vector_IfResult1 = Result114;
Out_OutVector = Vector_IfResult1;
bool Constant209 = false;
float4x4 Matrix_IfResult3;
float4x4 Matrix001_IfResult2;
Matrix_IfResult3 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult2 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult3 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult2 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal2;
float4x4 TransformBase_Func_Output_OutTransform2;
bool TransformBase_Func_Output_LocalToWorld2;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult3, Matrix001_IfResult2, Constant209, TransformBase_Func_Output_bUseOriginal2, TransformBase_Func_Output_OutTransform2, TransformBase_Func_Output_LocalToWorld2, Context);
float3 Result116 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform2).xyz;
float3 Vector_IfResult2;
Vector_IfResult2 = In_InVector;
Vector_IfResult2 = Result116;
Out_OutVector = Vector_IfResult2;
bool Constant215 = false;
float4x4 Matrix_IfResult4;
float4x4 Matrix001_IfResult3;
Matrix_IfResult4 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult3 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult4 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult3 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal3;
float4x4 TransformBase_Func_Output_OutTransform3;
bool TransformBase_Func_Output_LocalToWorld3;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult4, Matrix001_IfResult3, Constant215, TransformBase_Func_Output_bUseOriginal3, TransformBase_Func_Output_OutTransform3, TransformBase_Func_Output_LocalToWorld3, Context);
float3 Result123 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform3).xyz;
float3 Vector_IfResult3;
Vector_IfResult3 = In_InVector;
Vector_IfResult3 = Result123;
Out_OutVector = Vector_IfResult3;
int Constant183 = 0;
float Constant184 = 0;
float Constant185 = 100;
float Constant186 = 0;
float Result95 = Constant184 * Constant186;
float Constant187 = 1;
float3 CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput;
CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_(Result95, Constant187, Constant183, CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput, Context);
Context.MapSpawn.Local.SphereLocation.SphereVector = CalculateRandomPointInSphere_EvaluationType_NewEnumerator0_FixedRandomSeed_false_OverrideSeed_false_RandomnessMode_NewEnumerator0_Func_Output_Ouput;
float3 Result111 = abs(Context.MapSpawn.Local.SphereLocation.SphereVector);
float3 CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output;
CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_(Context.MapSpawn.SphereLocation.HemisphereX, Context.MapSpawn.SphereLocation.HemisphereY, Context.MapSpawn.SphereLocation.HemisphereZ, CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output);
float3 Result112 = lerp(Context.MapSpawn.Local.SphereLocation.SphereVector,Result111,CustomHlsl4A4AA6862CCF1B92B7BB368FFF853206CC8486A8_Func_Output_Output);
Context.MapSpawn.Local.SphereLocation.SphereVector = Result112;
float Constant199 = 100;
float3 Constant200 = float3(1,1,1);
float3 Result113 = Constant199 * Context.MapSpawn.Local.SphereLocation.SphereVector;
Context.MapSpawn.Local.SphereLocation.SphereVector = Result113;
float3 Constant201 = float3(1,0,0);
Context.MapSpawn.Local.SphereLocation.SphereVector = Context.MapSpawn.Local.SphereLocation.SphereVector;
float3 Constant202 = float3(0,200,0);
int Constant203 = 0;
int Constant204 = 0;
bool Constant205 = true;
float3 SphereLocation_TransformVector_Emitter_Func_Output_OutVector;
SphereLocation_TransformVector_Emitter_Func_(Constant202, Context.MapSpawn.SphereLocation.OffsetCoordinateSpace, Constant204, Constant205, SphereLocation_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result115 = Context.MapSpawn.SphereLocation.SphereOrigin + SphereLocation_TransformVector_Emitter_Func_Output_OutVector;
int Constant207 = 0;
bool Constant208 = true;
float3 SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
SphereLocation_NF_TransformVector_Emitter_Func_(Context.MapSpawn.Local.SphereLocation.SphereVector, Context.MapSpawn.SphereLocation.SphereCoordinateSpace, Constant207, Constant208, SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector, Context);
float3 Result117 = Result115 + SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
float Constant210 = 1;
float3 Constant211 = float3(1,1,1);
float3 Result118 = Constant211 * Context.MapSpawn.Engine.Owner.Scale;
float3 Result119 = abs(Result118);
float3 Constant212 = float3(0.0001,0.0001,0.0001);
float3 Result120 = max(Result119, Constant212);
float3 Result121 = Constant210 / Result120;
float3 Result122 = Context.MapSpawn.Local.SphereLocation.SphereVector * Result121;
int Constant213 = 0;
bool Constant214 = true;
float3 SphereLocation_TransformVector001_Emitter_Func_Output_OutVector;
SphereLocation_TransformVector001_Emitter_Func_(Result122, Context.MapSpawn.SphereLocation.SphereCoordinateSpace, Constant213, Constant214, SphereLocation_TransformVector001_Emitter_Func_Output_OutVector, Context);
float3 Result124 = normalize(SphereLocation_TransformVector001_Emitter_Func_Output_OutVector);
Context.MapSpawn.OUTPUT_VAR.SphereLocation.Position = Result117;
Context.MapSpawn.OUTPUT_VAR.SphereLocation.SphereVector = SphereLocation_NF_TransformVector_Emitter_Func_Output_OutVector;
Context.MapSpawn.OUTPUT_VAR.SphereLocation.SphereNormal = Result124;
Context.MapSpawn.Particles.Position = Context.MapSpawn.OUTPUT_VAR.SphereLocation.Position;
bool Constant225 = false;
int Constant226 = 0;
float AgeAdvancement_IfResult;
AgeAdvancement_IfResult = Context.MapSpawn.Emitter.Age;
AgeAdvancement_IfResult = Context.MapSpawn.Engine.Time;
float Constant227 = 4096;
int Constant228 = 0;
float Result125 = rand_float(Constant227, Constant226, Context.MapSpawn.Emitter.RandomSeed, Constant228);
Context.MapSpawn.Local.CurlNoiseForce.AgeAdvancement = AgeAdvancement_IfResult;
Context.MapSpawn.Local.CurlNoiseForce.DeterministicOffset = Result125;
Context.MapSpawn.Local.CurlNoiseForce.SamplePosition = Context.MapSpawn.CurlNoiseForce.SamplePosition;
float Constant229 = 0.04;
float3 Constant230 = float3(0.3,0.5,0.3);
float3 Result126 = Context.MapSpawn.Local.CurlNoiseForce.DeterministicOffset + Context.MapSpawn.Local.CurlNoiseForce.SamplePosition;
float3 Result127 = Result126 * Constant229;
float3 Result128 = Constant230 * Context.MapSpawn.Local.CurlNoiseForce.AgeAdvancement;
float3 Result129 = Result127 - Result128;
float Constant231 = 125;
float3 Result130 = Result129 * Constant231;
float3 SampleField_Emitter_VectorField32Output_SampledValue;
SampleField_Emitter_VectorField32(Result130, SampleField_Emitter_VectorField32Output_SampledValue);
Context.MapSpawn.Local.CurlNoiseForce.SampledNoise = SampleField_Emitter_VectorField32Output_SampledValue;
float Constant232 = 1;
float Constant233 = 0;
float Constant234 = 0;
Context.MapSpawn.Local.CurlNoiseForce.Falloff = Constant232;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAngle = Constant233;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskFalloffAngle = Constant234;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAxis = Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAxis;
float Constant235 = 200;
float3 Result131 = Context.MapSpawn.Local.CurlNoiseForce.SampledNoise * Constant235;
float3 Result132 = Context.MapSpawn.Transient.PhysicsForce + Result131;
Context.MapSpawn.Transient.PhysicsForce = Result132;
Context.MapSpawn.OUTPUT_VAR.CurlNoiseForce.CurlNoiseForce = Result131;
bool Constant257 = false;
float4x4 Matrix_IfResult5;
float4x4 Matrix001_IfResult4;
Matrix_IfResult5 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult4 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult5 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult4 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal4;
float4x4 TransformBase_Func_Output_OutTransform4;
bool TransformBase_Func_Output_LocalToWorld4;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult5, Matrix001_IfResult4, Constant257, TransformBase_Func_Output_bUseOriginal4, TransformBase_Func_Output_OutTransform4, TransformBase_Func_Output_LocalToWorld4, Context);
float3 Result134 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform4).xyz;
float3 Vector_IfResult4;
Vector_IfResult4 = In_InVector;
Vector_IfResult4 = Result134;
Out_OutVector = Vector_IfResult4;
bool Constant260 = false;
float4x4 Matrix_IfResult6;
float4x4 Matrix001_IfResult5;
Matrix_IfResult6 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult5 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult6 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult5 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal5;
float4x4 TransformBase_Func_Output_OutTransform5;
bool TransformBase_Func_Output_LocalToWorld5;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult6, Matrix001_IfResult5, Constant260, TransformBase_Func_Output_bUseOriginal5, TransformBase_Func_Output_OutTransform5, TransformBase_Func_Output_LocalToWorld5, Context);
float3 Result135 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform5).xyz;
float3 Vector_IfResult5;
Vector_IfResult5 = In_InVector;
Vector_IfResult5 = Result135;
Out_OutVector = Vector_IfResult5;
bool Constant263 = false;
float4x4 Matrix_IfResult7;
float4x4 Matrix001_IfResult6;
Matrix_IfResult7 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult6 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult7 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult6 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal6;
float4x4 TransformBase_Func_Output_OutTransform6;
bool TransformBase_Func_Output_LocalToWorld6;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult7, Matrix001_IfResult6, Constant263, TransformBase_Func_Output_bUseOriginal6, TransformBase_Func_Output_OutTransform6, TransformBase_Func_Output_LocalToWorld6, Context);
float3 Result136 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform6).xyz;
float3 Vector_IfResult6;
Vector_IfResult6 = In_InVector;
Vector_IfResult6 = Result136;
Out_OutVector = Vector_IfResult6;
bool Constant266 = false;
float4x4 Matrix_IfResult8;
float4x4 Matrix001_IfResult7;
Matrix_IfResult8 = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
Matrix001_IfResult7 = Context.MapSpawn.Engine.Owner.SystemWorldToLocal;
Matrix_IfResult8 = Context.MapSpawn.Engine.Owner.SystemLocalToWorldNoScale;
Matrix001_IfResult7 = Context.MapSpawn.Engine.Owner.SystemWorldToLocalNoScale;
bool TransformBase_Func_Output_bUseOriginal7;
float4x4 TransformBase_Func_Output_OutTransform7;
bool TransformBase_Func_Output_LocalToWorld7;
TransformBase_Func_(In_SourceSpace, In_DestinationSpace, Matrix_IfResult8, Matrix001_IfResult7, Constant266, TransformBase_Func_Output_bUseOriginal7, TransformBase_Func_Output_OutTransform7, TransformBase_Func_Output_LocalToWorld7, Context);
float3 Result137 = mul(float4(In_InVector,0.0),TransformBase_Func_Output_OutTransform7).xyz;
float3 Vector_IfResult7;
Vector_IfResult7 = In_InVector;
Vector_IfResult7 = Result137;
Out_OutVector = Vector_IfResult7;
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformVector = In_InputVector;
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformNormal = In_InputNormal;
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformTangent = In_InputTangent;
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformBitangent = In_InputBitangent;
int Constant255 = 0;
bool Constant256 = false;
float3 AddVelocity_TransformStack_Rotation_TransformVector002_Emitter_Func_Output_OutVector;
AddVelocity_TransformStack_Rotation_TransformVector002_Emitter_Func_(Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformVector, In_RotationCoordinateSpace, Constant255, Constant256, AddVelocity_TransformStack_Rotation_TransformVector002_Emitter_Func_Output_OutVector, Context);
int Constant258 = 0;
bool Constant259 = false;
float3 AddVelocity_TransformStack_Rotation_TransformVector001_Emitter_Func_Output_OutVector;
AddVelocity_TransformStack_Rotation_TransformVector001_Emitter_Func_(Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformNormal, In_RotationCoordinateSpace, Constant258, Constant259, AddVelocity_TransformStack_Rotation_TransformVector001_Emitter_Func_Output_OutVector, Context);
int Constant261 = 0;
bool Constant262 = false;
float3 AddVelocity_TransformStack_Rotation_TransformVector003_Emitter_Func_Output_OutVector;
AddVelocity_TransformStack_Rotation_TransformVector003_Emitter_Func_(Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformTangent, In_RotationCoordinateSpace, Constant261, Constant262, AddVelocity_TransformStack_Rotation_TransformVector003_Emitter_Func_Output_OutVector, Context);
int Constant264 = 0;
bool Constant265 = false;
float3 AddVelocity_TransformStack_Rotation_TransformVector004_Emitter_Func_Output_OutVector;
AddVelocity_TransformStack_Rotation_TransformVector004_Emitter_Func_(Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformBitangent, In_RotationCoordinateSpace, Constant264, Constant265, AddVelocity_TransformStack_Rotation_TransformVector004_Emitter_Func_Output_OutVector, Context);
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformVector = AddVelocity_TransformStack_Rotation_TransformVector002_Emitter_Func_Output_OutVector;
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformNormal = AddVelocity_TransformStack_Rotation_TransformVector001_Emitter_Func_Output_OutVector;
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformTangent = AddVelocity_TransformStack_Rotation_TransformVector003_Emitter_Func_Output_OutVector;
Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformBitangent = AddVelocity_TransformStack_Rotation_TransformVector004_Emitter_Func_Output_OutVector;
Out_TransformedVector = Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformVector;
Out_TransformedNormal = Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformNormal;
Out_TransformedTangent = Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformTangent;
Out_TransformedBitangent = Context.MapSpawn.Local.AddVelocity.TransformStack_Rotation.LocalTransformBitangent;
float3 Constant245 = float3(0,0,50);
float Constant246 = 1;
float3 Result133 = Constant245 * Constant246;
Context.MapSpawn.Local.AddVelocity.TransformedVector = Result133;
float3 Constant247 = float3(0,0,0);
float3 Constant248 = float3(1,0,0);
float Constant249 = 0;
float4 Constant250 = float4(0,0,0,1);
float3 Constant251 = float3(0,0,0);
float3 Constant252 = float3(0,0,0);
float3 Constant253 = float3(0,0,0);
float3 Constant254 = float3(0,0,0);
float3 AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedVector;
float3 AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedNormal;
float3 AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedTangent;
float3 AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedBitangent;
AddVelocity_TransformStack_Rotation_Emitter_Func_(Context.MapSpawn.Local.AddVelocity.TransformedVector, Context.MapSpawn.AddVelocity.RotationCoordinateSpace, Constant252, Constant253, Constant254, AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedVector, AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedNormal, AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedTangent, AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedBitangent, Context);
Context.MapSpawn.Local.AddVelocity.TransformedVector = AddVelocity_TransformStack_Rotation_Emitter_Func_Output_TransformedVector;
float3 Result138 = Context.MapSpawn.Local.AddVelocity.TransformedVector + Context.MapSpawn.Particles.Velocity;
Context.MapSpawn.Particles.Velocity = Result138;
float Constant272 = 1;
float Constant273 = 1e-06;
float Result139 = max(Context.MapSpawn.Particles.Mass, Constant273);
float3 Result140 = Context.MapSpawn.Transient.PhysicsForce / Result139;
float3 Result141 = Result140 + Context.MapSpawn.Particles.Velocity;
float3 Velocity_IfResult;
Velocity_IfResult = Result141;
Velocity_IfResult = Context.MapSpawn.Particles.Velocity;
float Constant274 = 1e-06;
float Result142 = max(Context.MapSpawn.Particles.RotationalInertia, Constant274);
float3 Result143 = Context.MapSpawn.Transient.PhysicsRotationalForce / Result142;
float3 Result144 = Context.MapSpawn.Particles.RotationalVelocity + Result143;
float3 Constant275 = float3(0,0,0);
float3 RotVelocity_IfResult;
float3 RotationalForce_IfResult;
RotVelocity_IfResult = Result144;
RotationalForce_IfResult = Constant275;
RotVelocity_IfResult = Context.MapSpawn.Particles.RotationalVelocity;
RotationalForce_IfResult = Context.MapSpawn.Transient.PhysicsRotationalForce;
float3 Result145 = Context.MapSpawn.Transient.PhysicsForce * Constant272;
float3 Result146 = Context.MapSpawn.Particles.Position + Result145;
float3 Position_IfResult1;
Position_IfResult1 = Result146;
Position_IfResult1 = Context.MapSpawn.Particles.Position;
bool Result147 = Context.MapSpawn.ApplyInitialForces.ApplyForcetoVelocity || Context.MapSpawn.ApplyInitialForces.ApplyForcetoPosition;
float3 Constant276 = float3(0,0,0);
float3 Force_IfResult;
Force_IfResult = Constant276;
Force_IfResult = Context.MapSpawn.Transient.PhysicsForce;
Context.MapSpawn.Particles.Velocity = Velocity_IfResult;
Context.MapSpawn.Particles.RotationalVelocity = RotVelocity_IfResult;
Context.MapSpawn.Particles.Position = Position_IfResult1;
Context.MapSpawn.Transient.PhysicsForce = Force_IfResult;
Context.MapSpawn.Transient.PhysicsRotationalForce = RotationalForce_IfResult;
Context.MapSpawn.OUTPUT_VAR.ApplyInitialForces.IncomingPhysicsForce = Context.MapSpawn.Transient.PhysicsForce;
Context.MapSpawn.OUTPUT_VAR.ApplyInitialForces.IncomingPhysicsRotationalForce = Context.MapSpawn.Transient.PhysicsRotationalForce;
bool Result148 = NiagaraAll(Context.MapUpdate.Particles.Age <= Context.MapUpdate.Engine.DeltaTime);
Context.MapUpdate.OUTPUT_VAR.ParticleState.FirstFrame = Result148;
Context.MapUpdate.Transient.FirstFrame = Result148;
float Result149 = Context.MapUpdate.Particles.Age + Context.MapUpdate.ParticleState.DeltaTime;
float Constant278 = 1e-05;
float Result150 = max(Context.MapUpdate.ParticleState.Lifetime, Constant278);
float Constant279 = 0.0001;
float Result151 = Result150 - Constant279;
bool Result152 = NiagaraAll(Result149 < Result151);
bool Constant280 = false;
bool bool_IfResult;
bool_IfResult = Context.MapUpdate.DataInstance.Alive;
bool_IfResult = Constant280;
float Result153 = Result149 / Result150;
Context.MapUpdate.DataInstance.Alive = bool_IfResult;
Context.MapUpdate.Particles.Age = Result149;
Context.MapUpdate.Particles.NormalizedAge = Result153;
bool Constant281 = false;
bool Constant282 = true;
float Constant284 = 1;
float SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value;
SampleCurve_Emitter_ScaleAlpha_FloatCurve(Context.MapUpdate.FloatFromCurve.CurveIndex, SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value);
float Result154 = SampleCurve_Emitter_ScaleAlpha_FloatCurveOutput_Value * Constant284;
Out_Value = Result154;
float3 Constant287 = float3(1,1,1);
float4 Output01;
Output01.r = Constant287.x;
Output01.g = Constant287.y;
Output01.b = Constant287.z;
Output01.a = Context.MapUpdate.ScaleColor.ScaleAlpha;
float4 Result155 = Context.MapUpdate.Transient.ParticleColorScaleFactor * Output01;
float4 Result156 = Context.MapUpdate.ScaleColor.ColorValueToScale * Result155;
Context.MapUpdate.Particles.Color = Result156;
Context.MapUpdate.Transient.ParticleColorScaleFactor = Result155;
float3 Result163 = In_Velocity - In_AdvectionVelocity;
float Result164 = In_Drag * In_InverseMass;
float Constant298 = (0.0);
float NiagaraFloat_SelectResult1 = Constant298;
NiagaraFloat_SelectResult1 = In_Drag;
NiagaraFloat_SelectResult1 = Result164;
float Constant299 = 0;
float Result165 = max(NiagaraFloat_SelectResult1, Constant299);
float Result166 = Result165 * In_DeltaTime;
float Constant300 = 1;
float Result167 = Result166 + Constant300;
float3 Result168 = Result163 / Result167;
float3 Result169 = Result168 + In_AdvectionVelocity;
Out_Output = Result169;
Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime = Context.MapUpdate.SolveForcesAndVelocity.DeltaTime;
float Constant296 = 1e-05;
float Result157 = max(Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime, Constant296);
float Result158 = Reciprocal(Result157);
Context.MapUpdate.Local.SolveForcesAndVelocity.InverseDeltaTime = Result158;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce = Context.MapUpdate.SolveForcesAndVelocity.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce = Context.MapUpdate.SolveForcesAndVelocity.Force;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.MapUpdate.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.Local.SolveForcesAndVelocity.Mass = Context.MapUpdate.SolveForcesAndVelocity.Mass;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position = Context.MapUpdate.SolveForcesAndVelocity.Position;
Context.MapUpdate.Particles.Presolve.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.Particles.Presolve.Position = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.MapUpdate.Particles.Presolve.PhysicsForce = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsForce;
float Constant297 = 1e-06;
float Result159 = max(Context.MapUpdate.Local.SolveForcesAndVelocity.Mass, Constant297);
float Result160 = Reciprocal(Result159);
float3 Result161 = Result160 * Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce = Result161;
Context.MapUpdate.Local.SolveForcesAndVelocity.InverseMass = Result160;
float3 Result162 = Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsForce * Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Result162;
Context.MapUpdate.Local.SolveForcesAndVelocity.AdvectionVelocity = Context.MapUpdate.Transient.AdvectionVelocity;
Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Local.SolveForcesAndVelocity.DragIgnoreMass = Context.MapUpdate.Transient.DragIgnoreMass;
float3 DragVelocity_Particle_Func_Output_Output;
DragVelocity_Particle_Func_(Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity, Context.MapUpdate.Local.SolveForcesAndVelocity.AdvectionVelocity, Context.MapUpdate.Local.SolveForcesAndVelocity.InverseMass, Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag, Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime, Context.MapUpdate.Local.SolveForcesAndVelocity.DragIgnoreMass, DragVelocity_Particle_Func_Output_Output, Context);
float3 Result170 = DragVelocity_Particle_Func_Output_Output - Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = DragVelocity_Particle_Func_Output_Output;
Context.MapUpdate.Local.SolveForcesAndVelocity.DragVelocity = Result170;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.IncomingPhysicsDrag = Context.MapUpdate.Local.SolveForcesAndVelocity.PhysicsDrag;
float Constant301 = 1000;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
float3 Constant302 = float3(0,0,0);
float Constant303 = 9999;
float3 Result171 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity * Context.MapUpdate.Local.SolveForcesAndVelocity.DeltaTime;
float3 Result172 = Result171 + Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position = Result172;
float3 Position_IfResult2;
float3 Velocity_IfResult1;
Position_IfResult2 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Position;
Velocity_IfResult1 = Context.MapUpdate.OUTPUT_VAR.SolveForcesAndVelocity.Velocity;
Position_IfResult2 = Context.MapUpdate.Particles.Position;
Velocity_IfResult1 = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.Particles.Position = Position_IfResult2;
Context.MapUpdate.Particles.Velocity = Velocity_IfResult1;
float3 Constant304 = float3(0,0,0);
float Constant305 = 0;
float3 ForceVector_IfResult;
float Drag_IfResult;
ForceVector_IfResult = Constant304;
Drag_IfResult = Constant305;
ForceVector_IfResult = Context.MapUpdate.Transient.PhysicsForce;
Drag_IfResult = Context.MapUpdate.Transient.PhysicsDrag;
Context.MapUpdate.Transient.PhysicsForce = ForceVector_IfResult;
Context.MapUpdate.Transient.PhysicsDrag = Drag_IfResult;
float3 Result173 = Context.MapUpdate.Particles.Position - Context.MapUpdate.Particles.Previous.Position;
float Result174 = length(Result173);
float Constant306 = 0.3333;
float Result175 = Result174 * Constant306;
float Constant307 = 1e+08;
float Result176 = Modulo(Context.MapUpdate.Particles.DistanceTraveled, Constant307);
float Result177 = Result175 + Result176;
Context.MapUpdate.Particles.DistanceTraveled = Result177;
bool Constant318 = false;
float Result178 = In_FloatMax - In_FloatMin;
int Constant319 = -1005805596;
float Result179 = rand_float(Result178, Context.MapUpdate.Particles.UniqueID, Constant319, Context.MapUpdate.Engine.Emitter.InstanceSeed);
float Result180 = In_FloatMin + Result179;
Out_RandomFloat = Result180;
Out_IsDeterministic = Constant318;
int Constant311 = (0);
float Constant312 = 10;
float Constant313 = 20;
int Constant314 = 0;
int Constant315 = 0;
int Constant316 = (0);
int Constant317 = (0);
float CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
bool CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant311, Constant312, Constant313, Constant314, Constant315, Constant316, Constant317, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat;
int Constant323 = (0);
float Constant324 = 500;
float Constant325 = 3000;
int Constant326 = 0;
int Constant327 = 0;
int Constant328 = (0);
int Constant329 = (0);
float CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
bool CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1;
CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant323, Constant324, Constant325, Constant326, Constant327, Constant328, Constant329, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1, CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic1, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomFloat1;
float SampleCurve_Emitter_Radius_FloatCurveOutput_Value;
SampleCurve_Emitter_Radius_FloatCurve(Context.MapUpdate.FloatFromCurve004.CurveIndex, SampleCurve_Emitter_Radius_FloatCurveOutput_Value);
float Result181 = SampleCurve_Emitter_Radius_FloatCurveOutput_Value * Context.MapUpdate.FloatFromCurve004.ScaleCurve;
Out_Value = Result181;
float SampleCurve_Emitter_Temperature_FloatCurveOutput_Value;
SampleCurve_Emitter_Temperature_FloatCurve(Context.MapUpdate.FloatFromCurve001.CurveIndex, SampleCurve_Emitter_Temperature_FloatCurveOutput_Value);
float Result182 = SampleCurve_Emitter_Temperature_FloatCurveOutput_Value * Context.MapUpdate.FloatFromCurve001.ScaleCurve;
Out_Value = Result182;
float Constant336 = 1;
float Constant337 = 1;
float Constant338 = 4;
float Constant339 = 12;
float Constant340 = 1;
float Constant341 = 1;
Context.MapUpdate.Particles.fluids_source_density = Constant336;
Context.MapUpdate.Particles.fluids_source_falloff = Constant337;
Context.MapUpdate.Particles.fluids_source_noiseIntensity = Constant338;
Context.MapUpdate.Particles.fluids_source_noiseScale = Constant339;
Context.MapUpdate.Particles.fluids_source_radius = Context.MapUpdate.Fluids_Gas_Source.Radius;
Context.MapUpdate.Particles.fluids_source_temperature = Context.MapUpdate.Fluids_Gas_Source.Temperature;
Context.MapUpdate.Particles.fluids_source_velocityScale = Constant340;
Context.MapUpdate.Particles.fluids_source_velocity = Context.MapUpdate.Fluids_Gas_Source.Velocity;
Context.MapUpdate.Particles.fluids_source_divergence = Constant341;
float Constant343 = 2;
float Result183 = Context.MapUpdate.Multiply_Float001.A * Constant343;
Out_Result = Result183;
bool Constant352 = false;
int Result185 = In_IntegerMax - In_IntegerMin;
int Constant353 = 1;
int Result186 = Result185 + Constant353;
int Constant354 = -1005805595;
int Result187 = rand_int(Result186, Context.MapUpdate.Particles.UniqueID, Constant354, Context.MapUpdate.Engine.Emitter.InstanceSeed);
int Result188 = In_IntegerMin + Result187;
bool Constant355 = false;
Out_RandomValue = Result188;
Out_IsDeterministic = Constant352;
Out_IsFixedRandomSeed = Constant355;
int Constant345 = (0);
int Constant346 = 0;
int Length_Emitter_SelectLinearColorFromArray001_ColorSelectionArrayOutput_Num;
Length_Emitter_SelectLinearColorFromArray001_ColorSelectionArray(Length_Emitter_SelectLinearColorFromArray001_ColorSelectionArrayOutput_Num);
int Constant347 = 1;
int Result184 = Length_Emitter_SelectLinearColorFromArray001_ColorSelectionArrayOutput_Num - Constant347;
int Constant348 = 0;
int Constant349 = 0;
int Constant350 = (0);
int Constant351 = (0);
int CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue;
bool CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic;
bool CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsFixedRandomSeed;
CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_(Constant345, Constant346, Result184, Constant348, Constant349, Constant350, Constant351, CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue, CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsDeterministic, CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_IsFixedRandomSeed, Context);
float4 Get_Emitter_SelectLinearColorFromArray001_ColorSelectionArrayOutput_Value;
Get_Emitter_SelectLinearColorFromArray001_ColorSelectionArray(CalculateRandomRangeInteger_ScriptUsage5_Particle_Particle_RandomnessMode_NewEnumerator0_FixedRandomSeed_false_EvaluationType_NewEnumerator0_OverrideSeed_false_Func_Output_RandomValue, Get_Emitter_SelectLinearColorFromArray001_ColorSelectionArrayOutput_Value);
Out_NewOutput001 = Get_Emitter_SelectLinearColorFromArray001_ColorSelectionArrayOutput_Value;
float2 Output17;
Output17.x = Context.MapUpdate.Vector2DFromFloat002.Value;
Output17.y = Context.MapUpdate.Vector2DFromFloat002.Value;
Out_Vec2 = Output17;
Context.MapUpdate.Particles.SpriteSize = Context.MapUpdate.SetVariables_BC233B974F5C4573F8E3A4A245A8C536.Particles.SpriteSize;
Context.MapUpdate.Particles.fluid_source_color = Context.MapUpdate.SetVariables_BC233B974F5C4573F8E3A4A245A8C536.Particles.fluid_source_color;
float3 Constant358 = float3(1,1,1);
float Constant359 = 1;
float3 Output02;
float Output2;
Output02.x = Context.MapUpdate.Color.Color.r;
Output02.y = Context.MapUpdate.Color.Color.g;
Output02.z = Context.MapUpdate.Color.Color.b;
Output2 = Context.MapUpdate.Color.Color.a;
float3 Result189 = Output02 * Constant358;
float Result190 = Output2 * Constant359;
float Result191 = Result190 * Context.MapUpdate.Emitter.AlphaScale;
float4 Output03;
Output03.g = Result189.y;
Output03.a = Result191;
Output03.r = Result189.x;
Output03.b = Result189.z;
Context.MapUpdate.Particles.Color = Output03;
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
Context.MapSpawn.Emitter.AlphaScale = lerp(PREV_Emitter_AlphaScale, Emitter_AlphaScale, SpawnInterp);
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
float3 Constant12 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Velocity = Constant12;
float3 Constant13 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.Position = Constant13;
float3 Constant14 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.Presolve.PhysicsForce = Constant14;
float3 Constant15 = float3(0,0,0);
Context.MapSpawn.Particles.Previous.Position = Constant15;
float Constant16 = 0;
Context.MapSpawn.Particles.DistanceTraveled = Constant16;
float Constant17 = (0.0);
Context.MapSpawn.Particles.fluids_source_density = Constant17;
float Constant18 = (0.0);
Context.MapSpawn.Particles.fluids_source_falloff = Constant18;
float Constant19 = (0.0);
Context.MapSpawn.Particles.fluids_source_noiseIntensity = Constant19;
float Constant20 = (0.0);
Context.MapSpawn.Particles.fluids_source_noiseScale = Constant20;
float Constant21 = (0.0);
Context.MapSpawn.Particles.fluids_source_radius = Constant21;
float Constant22 = (0.0);
Context.MapSpawn.Particles.fluids_source_temperature = Constant22;
float Constant23 = (0.0);
Context.MapSpawn.Particles.fluids_source_velocityScale = Constant23;
float3 Constant24 = float3(0.0, 0.0, 0.0);
Context.MapSpawn.Particles.fluids_source_velocity = Constant24;
float Constant25 = (0.0);
Context.MapSpawn.Particles.fluids_source_divergence = Constant25;
float4 Constant26 = float4(1.0, 1.0, 1.0, 1.0);
Context.MapSpawn.Particles.fluid_source_color = Constant26;
float Constant27 = 600;
float Constant28 = 1000;
int Constant29 = 0;
float RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat003_Emitter_Func_(RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.Vector2DFromFloat.Value = RandomRangeFloat003_Emitter_Func_Output_UniformRangedFloat;
float Constant38 = 0.75;
float Constant39 = 1;
int Constant40 = 0;
float RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat001_Emitter_Func_(RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat, Context);
bool Constant48 = true;
bool Constant49 = false;
bool Constant50 = true;
float2 Vector2DFromFloat_Emitter_Func_Output_Vec2;
Vector2DFromFloat_Emitter_Func_(Vector2DFromFloat_Emitter_Func_Output_Vec2, Context);
float Constant52 = 5;
int Constant53 = 0;
float RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat_Emitter_Func_(RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.InitializeParticle.Mass = RandomRangeFloat001_Emitter_Func_Output_UniformRangedFloat;
Context.MapSpawn.InitializeParticle.WriteColor = Constant48;
Context.MapSpawn.InitializeParticle.WritePosition = Constant49;
Context.MapSpawn.InitializeParticle.WriteSpriteSize = Constant50;
Context.MapSpawn.InitializeParticle.SpriteSize = Vector2DFromFloat_Emitter_Func_Output_Vec2;
Context.MapSpawn.InitializeParticle.Lifetime = RandomRangeFloat_Emitter_Func_Output_UniformRangedFloat;
bool Constant61 = true;
Context.MapSpawn.InitializeParticle.WriteMaterialRandom = Constant61;
float Constant63 = 1;
int Constant64 = -1;
int Constant65 = 0;
bool Constant66 = false;
float RandomRangeFloat_Func_Output_Result;
RandomRangeFloat_Func_(Constant62, Constant63, Constant64, Constant65, Constant66, RandomRangeFloat_Func_Output_Result, Context);
Context.MapSpawn.InitializeParticle.MaterialRandom = RandomRangeFloat_Func_Output_Result;
bool Constant80 = true;
Context.MapSpawn.InitializeParticle.WriteLifetime = Constant80;
float4 Constant81 = float4(1111,13.6009,0,1);
bool Constant82 = true;
Context.MapSpawn.InitializeParticle.WriteMass = Constant82;
bool Constant83 = false;
Context.MapSpawn.InitializeParticle.WriteSpriteRotation = Constant83;
bool Constant85 = false;
Context.MapSpawn.InitializeParticle.WriteScale = Constant85;
float3 Constant86 = float3(1,1,1);
float3 InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
InitializeParticle_SimulationPosition_Emitter_Func_(InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition, Context);
Context.MapSpawn.InitializeParticle.Position = InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
Context.MapSpawn.Particles.Position = InitializeParticle_SimulationPosition_Emitter_Func_Output_OutPosition;
EnterStatScope(1 /**InitializeParticle_Emitter_Func_*/);
InitializeParticle_Emitter_Func_(Context);
ExitStatScope(/**InitializeParticle_Emitter_Func_*/);
bool Constant90 = true;
int Constant91 = 1;
Context.MapSpawn.Cosine001.NormalizedAngle = Context.MapSpawn.Emitter.Age;
float Constant92 = 0.4;
float Constant93 = 0;
float Constant94 = 88;
float Cosine001_Emitter_Func_Output_NewOutput;
Cosine001_Emitter_Func_(Cosine001_Emitter_Func_Output_NewOutput, Context);
float Constant98 = -50;
float Constant99 = 50;
int Constant100 = 0;
float RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat002_Emitter_Func_(RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapSpawn.AddVelocityInCone.UseVelocityFalloffOnConeAxis = Constant90;
Context.MapSpawn.AddVelocityInCone.ConeAxisCoordinateSpace = Constant91;
Context.MapSpawn.AddVelocityInCone.ConeAngle = Cosine001_Emitter_Func_Output_NewOutput;
Context.MapSpawn.AddVelocityInCone.VelocityStrength = RandomRangeFloat002_Emitter_Func_Output_UniformRangedFloat;
float Constant108 = 0.5;
float3 Constant109 = float3(0,0,1);
bool Constant110 = false;
float Constant111 = 0.333;
EnterStatScope(2 /**AddVelocityInCone_Emitter_Func_*/);
AddVelocityInCone_Emitter_Func_(Context);
ExitStatScope(/**AddVelocityInCone_Emitter_Func_*/);
int Constant169 = 0;
bool Constant170 = true;
Context.MapSpawn.SphereLocation.NormalizeThickness = Constant170;
float Constant171 = 0;
float Constant172 = 100;
int Constant173 = 0;
Context.MapSpawn.SphereLocation.SurfaceExpansionMode = Constant173;
bool Constant174 = false;
Context.MapSpawn.SphereLocation.HemisphereX = Constant174;
bool Constant175 = false;
Context.MapSpawn.SphereLocation.HemisphereY = Constant175;
bool Constant176 = false;
Context.MapSpawn.SphereLocation.HemisphereZ = Constant176;
float3 Constant177 = float3(1,1,1);
float3 Constant178 = float3(1,0,0);
Context.MapSpawn.SphereLocation.SphereOrigin = Context.MapSpawn.Particles.Position;
float3 Constant179 = float3(0,200,0);
int Constant180 = 2;
Context.MapSpawn.SphereLocation.OffsetCoordinateSpace = Constant180;
int Constant181 = 2;
Context.MapSpawn.SphereLocation.SphereCoordinateSpace = Constant181;
int Constant182 = 0;
EnterStatScope(3 /**SphereLocation_Emitter_Func_*/);
SphereLocation_Emitter_Func_(Context);
ExitStatScope(/**SphereLocation_Emitter_Func_*/);
bool Constant216 = false;
int Constant217 = (0);
int Constant218 = 0;
Context.MapSpawn.CurlNoiseForce.SamplePosition = Context.MapSpawn.Particles.Position;
float Constant219 = 0.04;
float3 Constant220 = float3(0.3,0.5,0.3);
float Constant221 = 0;
float Constant222 = 0;
Context.MapSpawn.CurlNoiseForce.CurlNoiseConeMaskAxis = Context.MapSpawn.Particles.Velocity;
float3 Constant223 = float3(0,0,0);
Context.MapSpawn.Transient.PhysicsForce = Constant223;
float Constant224 = 200;
EnterStatScope(4 /**CurlNoiseForce_Emitter_Func_*/);
CurlNoiseForce_Emitter_Func_(Constant217, Context);
ExitStatScope(/**CurlNoiseForce_Emitter_Func_*/);
float3 Constant236 = float3(0,0,50);
float Constant237 = 1;
int Constant238 = 2;
Context.MapSpawn.AddVelocity.RotationCoordinateSpace = Constant238;
float3 Constant239 = float3(0,0,0);
float3 Constant240 = float3(1,0,0);
float Constant241 = 0;
float4 Constant242 = float4(0,0,0,1);
bool Constant243 = false;
Context.MapSpawn.AddVelocity.InvertRotationQuaternion = Constant243;
float3 Constant244 = float3(0,0,0);
Context.MapSpawn.AddVelocity.RotationMatrix = Context.MapSpawn.Engine.Owner.SystemLocalToWorld;
EnterStatScope(5 /**AddVelocity_Emitter_Func_*/);
AddVelocity_Emitter_Func_(Context);
ExitStatScope(/**AddVelocity_Emitter_Func_*/);
bool Constant267 = true;
Context.MapSpawn.ApplyInitialForces.ApplyForcetoVelocity = Constant267;
bool Constant268 = false;
Context.MapSpawn.ApplyInitialForces.ApplyForcetoPosition = Constant268;
bool Constant269 = true;
Context.MapSpawn.ApplyInitialForces.ApplyRotationalForcetoRotationalVelocity = Constant269;
float3 Constant270 = float3(0,0,0);
Context.MapSpawn.Transient.PhysicsRotationalForce = Constant270;
float Constant271 = 1;
EnterStatScope(6 /**ApplyInitialForces_Emitter_Func_*/);
ApplyInitialForces_Emitter_Func_(Context);
ExitStatScope(/**ApplyInitialForces_Emitter_Func_*/);
Context.MapSpawn.Particles.Initial.Color = Context.MapSpawn.Particles.Color;
bool Constant277 = true;
Context.MapUpdate.DataInstance.Alive = Constant277;
Context.MapUpdate.ParticleState.DeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
EnterStatScope(7 /**ParticleState_Emitter_Func_*/);
ParticleState_Emitter_Func_(Context);
ExitStatScope(/**ParticleState_Emitter_Func_*/);
Context.MapUpdate.FloatFromCurve.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float Constant283 = 1;
float FloatFromCurve_Emitter_Func_Output_Value;
FloatFromCurve_Emitter_Func_(FloatFromCurve_Emitter_Func_Output_Value, Context);
Context.MapUpdate.ScaleColor.ScaleAlpha = FloatFromCurve_Emitter_Func_Output_Value;
Context.MapUpdate.ScaleColor.ColorValueToScale = Context.MapUpdate.Particles.Initial.Color;
float4 Constant285 = float4(1,1,1,1);
Context.MapUpdate.Transient.ParticleColorScaleFactor = Constant285;
float3 Constant286 = float3(1,1,1);
EnterStatScope(8 /**ScaleColor_Emitter_Func_*/);
ScaleColor_Emitter_Func_(Context);
ExitStatScope(/**ScaleColor_Emitter_Func_*/);
Context.MapUpdate.Transient.PhysicsDeltaTime = Context.MapUpdate.Engine.DeltaTime;
Context.MapUpdate.SolveForcesAndVelocity.DeltaTime = Context.MapUpdate.Transient.PhysicsDeltaTime;
float3 Constant288 = float3(0,0,0);
Context.MapUpdate.Transient.PhysicsForce = Constant288;
Context.MapUpdate.SolveForcesAndVelocity.Force = Context.MapUpdate.Transient.PhysicsForce;
Context.MapUpdate.SolveForcesAndVelocity.Velocity = Context.MapUpdate.Particles.Velocity;
Context.MapUpdate.SolveForcesAndVelocity.Mass = Context.MapUpdate.Particles.Mass;
Context.MapUpdate.SolveForcesAndVelocity.Position = Context.MapUpdate.Particles.Position;
float3 Constant289 = float3(0,0,0);
Context.MapUpdate.Transient.AdvectionVelocity = Constant289;
float Constant290 = 0;
Context.MapUpdate.Transient.PhysicsDrag = Constant290;
bool Constant291 = true;
Context.MapUpdate.Transient.DragIgnoreMass = Constant291;
float Constant292 = 1000;
float3 Constant293 = float3(0,0,0);
float Constant294 = 9999;
bool Constant295 = true;
Context.MapUpdate.SolveForcesAndVelocity.WritetoIntrinsicProperties = Constant295;
EnterStatScope(9 /**SolveForcesAndVelocity_Emitter_Func_*/);
SolveForcesAndVelocity_Emitter_Func_(Context);
ExitStatScope(/**SolveForcesAndVelocity_Emitter_Func_*/);
float Constant308 = 10;
float Constant309 = 20;
int Constant310 = 0;
float RandomRangeFloat004_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat004_Emitter_Func_(RandomRangeFloat004_Emitter_Func_Output_UniformRangedFloat, Context);
float Constant320 = 500;
float Constant321 = 3000;
int Constant322 = 0;
float RandomRangeFloat005_Emitter_Func_Output_UniformRangedFloat;
RandomRangeFloat005_Emitter_Func_(RandomRangeFloat005_Emitter_Func_Output_UniformRangedFloat, Context);
Context.MapUpdate.FloatFromCurve004.ScaleCurve = RandomRangeFloat004_Emitter_Func_Output_UniformRangedFloat;
Context.MapUpdate.FloatFromCurve001.ScaleCurve = RandomRangeFloat005_Emitter_Func_Output_UniformRangedFloat;
Context.MapUpdate.FloatFromCurve004.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float FloatFromCurve004_Emitter_Func_Output_Value;
FloatFromCurve004_Emitter_Func_(FloatFromCurve004_Emitter_Func_Output_Value, Context);
Context.MapUpdate.FloatFromCurve001.CurveIndex = Context.MapUpdate.Particles.NormalizedAge;
float FloatFromCurve001_Emitter_Func_Output_Value;
FloatFromCurve001_Emitter_Func_(FloatFromCurve001_Emitter_Func_Output_Value, Context);
Context.MapUpdate.Fluids_Gas_Source.Radius = FloatFromCurve004_Emitter_Func_Output_Value;
Context.MapUpdate.Fluids_Gas_Source.Temperature = FloatFromCurve001_Emitter_Func_Output_Value;
float Constant330 = 1;
float Constant331 = 1;
float Constant332 = 4;
float Constant333 = 12;
float Constant334 = 1;
Context.MapUpdate.Fluids_Gas_Source.Velocity = Context.MapUpdate.Particles.Velocity;
float Constant335 = 1;
EnterStatScope(10 /**Fluids_Gas_Source_Emitter_Func_*/);
Fluids_Gas_Source_Emitter_Func_(Context);
ExitStatScope(/**Fluids_Gas_Source_Emitter_Func_*/);
Context.MapUpdate.Multiply_Float001.A = Context.MapUpdate.Particles.fluids_source_radius;
float Constant342 = 2;
Context.MapUpdate.Vector2DFromFloat002.Value = Multiply_Float001_Emitter_Func_Output_Result;
int Constant344 = 0;
float4 SelectLinearColorFromArray001_Emitter_Func_Output_NewOutput001;
SelectLinearColorFromArray001_Emitter_Func_(SelectLinearColorFromArray001_Emitter_Func_Output_NewOutput001, Context);
float2 Vector2DFromFloat002_Emitter_Func_Output_Vec2;
Vector2DFromFloat002_Emitter_Func_(Vector2DFromFloat002_Emitter_Func_Output_Vec2, Context);
Context.MapUpdate.SetVariables_BC233B974F5C4573F8E3A4A245A8C536.Particles.fluid_source_color = SelectLinearColorFromArray001_Emitter_Func_Output_NewOutput001;
Context.MapUpdate.SetVariables_BC233B974F5C4573F8E3A4A245A8C536.Particles.SpriteSize = Vector2DFromFloat002_Emitter_Func_Output_Vec2;
EnterStatScope(11 /**SetVariables_BC233B974F5C4573F8E3A4A245A8C536_Emitter_Func_*/);
SetVariables_BC233B974F5C4573F8E3A4A245A8C536_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_BC233B974F5C4573F8E3A4A245A8C536_Emitter_Func_*/);
Context.MapUpdate.Color.Color = Context.MapUpdate.Particles.fluid_source_color;
float3 Constant356 = float3(1,1,1);
float Constant357 = 1;
EnterStatScope(12 /**Color_Emitter_Func_*/);
Color_Emitter_Func_(Context);
ExitStatScope(/**Color_Emitter_Func_*/);
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
// ParameterName
// VariableType
// ReadBufferType
// ReadBufferRead
Emitter_SelectLinearColorFromArray001_ColorSelectionArray_ArrayReadBuffer;
Emitter_SelectLinearColorFromArray001_ColorSelectionArray_ArrayBufferParams;
// Where x=Length & y=max(Length-1,0)
int GetLength_Emitter_SelectLinearColorFromArray001_ColorSelectionArray() { return Emitter_SelectLinearColorFromArray001_ColorSelectionArray_ArrayBufferParams.x; }
int GetLengthMinusOne_Emitter_SelectLinearColorFromArray001_ColorSelectionArray() { return Emitter_SelectLinearColorFromArray001_ColorSelectionArray_ArrayBufferParams.y; }
ArrayLength = GetLength_Emitter_SelectLinearColorFromArray001_ColorSelectionArray();
bIsValid = Index >= 0 && Index < GetLength_Emitter_SelectLinearColorFromArray001_ColorSelectionArray();
Index = GetLengthMinusOne_Emitter_SelectLinearColorFromArray001_ColorSelectionArray();
Index = clamp(Index, 0, GetLengthMinusOne_Emitter_SelectLinearColorFromArray001_ColorSelectionArray());
Value = BUFFER_NAME[Index];
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
Context.MapUpdate.Emitter.AlphaScale = Emitter_AlphaScale;
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
Context.MapSpawn.Particles.fluid_source_color.r = 0.0f;
Context.MapSpawn.Particles.fluid_source_color.g = 0.0f;
Context.MapSpawn.Particles.fluid_source_color.b = 0.0f;
Context.MapSpawn.Particles.fluid_source_color.a = 0.0f;
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
Context.MapUpdate.Array.fluid_source_color = 6;
Context.MapUpdate.Particles.fluid_source_color.r = InputDataFloat(0, 6, InstanceIdx);
Context.MapUpdate.Particles.fluid_source_color.g = InputDataFloat(0, 7, InstanceIdx);
Context.MapUpdate.Particles.fluid_source_color.b = InputDataFloat(0, 8, InstanceIdx);
Context.MapUpdate.Particles.fluid_source_color.a = InputDataFloat(0, 9, InstanceIdx);
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
Context.MapUpdate.Array.RotationalInertia = 50;
Context.MapUpdate.Particles.RotationalInertia = InputDataFloat(0, 50, InstanceIdx);
Context.MapUpdate.Array.RotationalVelocity = 51;
Context.MapUpdate.Particles.RotationalVelocity.x = InputDataFloat(0, 51, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.y = InputDataFloat(0, 52, InstanceIdx);
Context.MapUpdate.Particles.RotationalVelocity.z = InputDataFloat(0, 53, InstanceIdx);
Context.MapUpdate.Array.Scale = 54;
Context.MapUpdate.Particles.Scale.x = InputDataFloat(0, 54, InstanceIdx);
Context.MapUpdate.Particles.Scale.y = InputDataFloat(0, 55, InstanceIdx);
Context.MapUpdate.Particles.Scale.z = InputDataFloat(0, 56, InstanceIdx);
Context.MapUpdate.Array.SpriteRotation = 57;
Context.MapUpdate.Particles.SpriteRotation = InputDataFloat(0, 57, InstanceIdx);
Context.MapUpdate.Array.SpriteSize = 58;
Context.MapUpdate.Particles.SpriteSize.x = InputDataFloat(0, 58, InstanceIdx);
Context.MapUpdate.Particles.SpriteSize.y = InputDataFloat(0, 59, InstanceIdx);
Context.MapUpdate.Array.Velocity = 60;
Context.MapUpdate.Particles.Velocity.x = InputDataFloat(0, 60, InstanceIdx);
Context.MapUpdate.Particles.Velocity.y = InputDataFloat(0, 61, InstanceIdx);
Context.MapUpdate.Particles.Velocity.z = InputDataFloat(0, 62, InstanceIdx);
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
OutputDataFloat(0, 1, WriteIndex, Context.MapUpdate.Particles.Color.r);
OutputDataFloat(0, 2, WriteIndex, Context.MapUpdate.Particles.Color.g);
OutputDataFloat(0, 3, WriteIndex, Context.MapUpdate.Particles.Color.b);
OutputDataFloat(0, 4, WriteIndex, Context.MapUpdate.Particles.Color.a);
OutputDataFloat(0, 5, WriteIndex, Context.MapUpdate.Particles.DistanceTraveled);
OutputDataFloat(0, 6, WriteIndex, Context.MapUpdate.Particles.fluid_source_color.r);
OutputDataFloat(0, 7, WriteIndex, Context.MapUpdate.Particles.fluid_source_color.g);
OutputDataFloat(0, 8, WriteIndex, Context.MapUpdate.Particles.fluid_source_color.b);
OutputDataFloat(0, 9, WriteIndex, Context.MapUpdate.Particles.fluid_source_color.a);
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
OutputDataFloat(0, 21, WriteIndex, Context.MapUpdate.Particles.Initial.Color.r);
OutputDataFloat(0, 22, WriteIndex, Context.MapUpdate.Particles.Initial.Color.g);
OutputDataFloat(0, 23, WriteIndex, Context.MapUpdate.Particles.Initial.Color.b);
OutputDataFloat(0, 24, WriteIndex, Context.MapUpdate.Particles.Initial.Color.a);
OutputDataFloat(0, 25, WriteIndex, Context.MapUpdate.Particles.Lifetime);
OutputDataFloat(0, 26, WriteIndex, Context.MapUpdate.Particles.Mass);
OutputDataFloat(0, 27, WriteIndex, Context.MapUpdate.Particles.MaterialRandom);
OutputDataFloat(0, 28, WriteIndex, Context.MapUpdate.Particles.NormalizedAge);
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
OutputDataFloat(0, 50, WriteIndex, Context.MapUpdate.Particles.RotationalInertia);
OutputDataFloat(0, 51, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.x);
OutputDataFloat(0, 52, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.y);
OutputDataFloat(0, 53, WriteIndex, Context.MapUpdate.Particles.RotationalVelocity.z);
OutputDataFloat(0, 54, WriteIndex, Context.MapUpdate.Particles.Scale.x);
OutputDataFloat(0, 55, WriteIndex, Context.MapUpdate.Particles.Scale.y);
OutputDataFloat(0, 56, WriteIndex, Context.MapUpdate.Particles.Scale.z);
OutputDataFloat(0, 57, WriteIndex, Context.MapUpdate.Particles.SpriteRotation);
OutputDataFloat(0, 58, WriteIndex, Context.MapUpdate.Particles.SpriteSize.x);
OutputDataFloat(0, 59, WriteIndex, Context.MapUpdate.Particles.SpriteSize.y);
OutputDataFloat(0, 60, WriteIndex, Context.MapUpdate.Particles.Velocity.x);
OutputDataFloat(0, 61, WriteIndex, Context.MapUpdate.Particles.Velocity.y);
OutputDataFloat(0, 62, WriteIndex, Context.MapUpdate.Particles.Velocity.z);
Bà;r‚=µç¶Ô
 Aöôô>
 AÕÃÃ=
$á'¬IÜYµqDúÃtúÚ;KK¢8M
| enter_stat_scope();
| R[0] = acquireindex(C[2]);
| external_func_call(C[0], C[1], C[1], C[2]R[65535]);
| exit_stat_scope();
| external_func_call(C[0]O[144], O[203]);
| O[144] = i2f_mul(O[144], C[3]);
| O[203] = i2f_mul(O[203], C[3]);
| O[157] = f2i(O[144]);
| O[165] = f2i(O[203]);
| external_func_call(C[4], O[157], O[165], C[2]R[65535]);
| O[158] = div(C[5], O[144]);
| O[157] = div(C[5], O[203]);
| outputdata_float(0, 147, R[0], O[157]);
| outputdata_float(0, 157, R[0], C[3]);
| O[144] = f2i(O[144]);
| outputdata_int32(0, 10, R[0], O[144]);
| O[157] = f2i(O[203]);
| O[144] = i2f(O[144]);
| O[203] = i2f(O[203]);
| O[165] = f2i(O[144]);
| O[162] = f2i(O[203]);
| external_func_call(C[6], O[165], O[162], C[2]R[65535]);
| O[164] = div(C[5], O[144]);
| O[165] = div(C[5], O[203]);
| O[162] = f2i(O[144]);
| O[203] = f2i(O[203]);
| outputdata_int32(0, 13, R[0], O[203]);
| O[147] = f2i(O[144]);
| O[146] = f2i(O[203]);
| external_func_call(C[7], O[147], O[146], C[2]R[65535]);
| outputdata_float(0, 33, R[0], C[27]);
| O[146] = div(C[5], O[144]);
| O[147] = div(C[5], O[203]);
| external_func_call(C[0]O[150], O[11]);
| O[150] = i2f(O[150]);
| O[11] = i2f(O[11]);
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
| outputdata_float(0, 28, R[0], C[16]);
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
| O[11] = f2i(O[11]);
| outputdata_float(0, 0, R[0], C[14]);
| outputdata_float(0, 2, R[0], C[14]);
| outputdata_float(0, 3, R[0], C[14]);
| outputdata_float(0, 5, R[0], C[14]);
| outputdata_float(0, 8, R[0], C[14]);
| outputdata_float(0, 9, R[0], C[14]);
| outputdata_float(0, 17, R[0], C[14]);
| outputdata_float(0, 18, R[0], C[14]);
| outputdata_float(0, 27, R[0], C[14]);
| outputdata_float(0, 31, R[0], C[14]);
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
| outputdata_float(0, 191, R[0], C[14]);
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
| outputdata_float(0, 36, R[0], C[28]);
| outputdata_float(0, 138, R[0], O[146]);
| external_func_call(C[11], C[10], C[10], C[2]R[65535]);
| outputdata_float(0, 134, R[0], C[29]);
| outputdata_float(0, 135, R[0], C[29]);
| outputdata_float(0, 139, R[0], O[147]);
| outputdata_float(0, 146, R[0], O[158]);
| outputdata_int32(0, 3, R[0], C[2]);
| outputdata_int32(0, 7, R[0], O[203]);
| outputdata_int32(0, 14, R[0], C[2]);
| outputdata_int32(0, 20, R[0], C[10]);
| outputdata_int32(0, 21, R[0], C[10]);
| outputdata_int32(0, 32, R[0], C[31]);
| outputdata_int32(0, 38, R[0], C[2]);
| external_func_call(C[0]O[203]);
| outputdata_float(0, 7, R[0], C[17]);
| outputdata_int32(0, 30, R[0], O[203]);
| outputdata_float(0, 13, R[0], C[18]);
| outputdata_int32(0, 26, R[0], O[203]);
| external_func_call(C[8]O[203]);
| outputdata_float(0, 14, R[0], C[19]);
| outputdata_int32(0, 12, R[0], O[162]);
| outputdata_int32(0, 27, R[0], O[203]);
| external_func_call(C[7]O[203]);
| outputdata_float(0, 15, R[0], C[20]);
| outputdata_float(0, 151, R[0], O[165]);
| outputdata_int32(0, 22, R[0], O[203]);
| outputdata_float(0, 20, R[0], C[21]);
| outputdata_float(0, 172, R[0], C[21]);
| outputdata_int32(0, 25, R[0], O[203]);
| outputdata_float(0, 21, R[0], C[22]);
| outputdata_int32(0, 23, R[0], O[203]);
| outputdata_float(0, 22, R[0], C[23]);
| outputdata_int32(0, 28, R[0], O[203]);
| outputdata_float(0, 24, R[0], C[24]);
| outputdata_float(0, 25, R[0], C[24]);
| outputdata_int32(0, 29, R[0], O[203]);
| outputdata_float(0, 29, R[0], C[25]);
| outputdata_int32(0, 1, R[0], C[0]);
| outputdata_int32(0, 2, R[0], C[0]);
| outputdata_int32(0, 11, R[0], O[157]);
| outputdata_int32(0, 17, R[0], C[0]);
| outputdata_int32(0, 24, R[0], O[203]);
| outputdata_int32(0, 33, R[0], C[0]);
| outputdata_int32(0, 34, R[0], C[0]);
| outputdata_int32(0, 35, R[0], C[0]);
| outputdata_int32(0, 36, R[0], C[0]);
| outputdata_int32(0, 37, R[0], C[0]);
| outputdata_int32(0, 39, R[0], C[0]);
| outputdata_int32(0, 40, R[0], C[0]);
| outputdata_int32(0, 41, R[0], C[0]);
| external_func_call(C[12]O[203]);
| outputdata_float(0, 30, R[0], C[26]);
| outputdata_int32(0, 6, R[0], O[144]);
| outputdata_int32(0, 15, R[0], C[30]);
| outputdata_int32(0, 16, R[0], C[30]);
| outputdata_int32(0, 31, R[0], O[203]);
| done();
| R[0] = inputdata_float();
| O[221] = inputdata_float();
| O[171] = inputdata_float();
| O[224] = inputdata_float();
| O[176] = inputdata_float();
| O[223] = inputdata_float();
| O[222] = inputdata_float();
| O[215] = inputdata_float();
| O[7] = inputdata_float();
| O[9] = inputdata_float();
| O[230] = inputdata_int32();
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
| R[90] = inputdata_int32();
| R[91] = inputdata_float();
| R[92] = inputdata_float();
| R[93] = inputdata_float();
| R[94] = inputdata_float();
| R[95] = inputdata_float();
| R[96] = inputdata_float();
| R[97] = inputdata_float();
| R[98] = inputdata_int32();
| R[99] = inputdata_int32();
| R[100] = inputdata_float();
| R[101] = inputdata_float();
| R[102] = inputdata_float();
| R[103] = inputdata_float();
| R[104] = inputdata_float();
| R[105] = inputdata_float();
| R[106] = inputdata_float();
| R[107] = inputdata_float();
| R[108] = inputdata_float();
| R[109] = inputdata_float();
| R[110] = inputdata_int32();
| R[111] = inputdata_int32();
| R[112] = inputdata_int32();
| R[113] = inputdata_float();
| R[114] = inputdata_float();
| R[115] = inputdata_float();
| R[116] = inputdata_float();
| R[117] = inputdata_int32();
| R[118] = inputdata_int32();
| R[119] = inputdata_int32();
| R[120] = inputdata_float();
| R[121] = inputdata_int32();
| R[122] = inputdata_int32();
| R[123] = inputdata_float();
| R[124] = inputdata_float();
| R[125] = inputdata_float();
| R[126] = inputdata_float();
| R[127] = inputdata_float();
| R[128] = inputdata_float();
| R[129] = inputdata_float();
| R[130] = inputdata_int32();
| R[131] = inputdata_float();
| R[0] = acquireindex(C[18]);
| O[224] = cmpeq_select(I[81], C[0], C[1], I[82]);
| O[171] = add(C[2], I[83]);
| O[221] = div_f2i(O[171], O[224]);
| O[221] = maxi(O[221], C[3]);
| O[176] = i2f_mul(O[221], O[224]);
| O[171] = sub(O[171], O[176]);
| O[176] = addi(O[221], I[120]);
| outputdata_int32(0, 41, R[0], O[176]);
| O[176] = add(I[81], C[2]);
| outputdata_float(0, 188, R[0], O[176]);
| O[221] = cmpgti(O[221], C[3]);
| O[224] = select(O[221], O[224], O[224]);
| O[171] = select(O[221], O[171], O[171]);
| O[221] = div(O[171], O[224]);
| outputdata_float(0, 189, R[0], O[224]);
| outputdata_float(0, 190, R[0], O[171]);
| outputdata_float(0, 191, R[0], O[221]);
| O[171] = cmplei(I[119], C[3]);
| O[221] = select(O[171], C[3], I[118]);
| O[224] = select(O[171], C[3], I[119]);
| outputdata_float(0, 2, R[0], I[2]);
| O[171] = cmpneqi(I[130], C[3]);
| O[171] = cmplei_logic_and(O[224], C[4], O[171]);
| O[221] = select(O[171], I[130], O[221]);
| O[230] = select(O[171], C[4], O[224]);
| O[223] = cmpeq_select(I[0], C[0], C[5], I[3]);
| O[171] = add(C[2], I[56]);
| O[224] = div_f2i(O[171], O[223]);
| O[224] = maxi(O[224], C[3]);
| O[176] = i2f_mul(O[224], O[223]);
| O[176] = sub(O[171], O[176]);
| O[171] = addi(O[224], I[99]);
| O[222] = add(I[0], C[2]);
| outputdata_float(0, 0, R[0], O[222]);
| O[224] = cmpgti(O[224], C[3]);
| O[223] = select(O[224], O[223], O[223]);
| O[224] = select(O[224], O[176], O[176]);
| O[176] = div(O[224], O[223]);
| outputdata_float(0, 3, R[0], O[223]);
| outputdata_float(0, 154, R[0], O[224]);
| O[224] = clamp(I[121], C[0], C[6]);
| outputdata_float(0, 163, R[0], O[224]);
| O[224] = cmpneqi(I[84], C[7]);
| O[224] = cmpnei_logic_and(I[84], C[8], O[224]);
| O[224] = cmpeqi_logic_and(O[230], C[3], O[224]);
| O[224] = cmplei_logic_and(I[85], O[230], O[224]);
| O[223] = cmpeqi(I[84], C[9]);
| O[223] = cmpeqi_logic_or(I[84], C[4], O[223]);
| O[223] = cmpeqi_logic_and(O[221], C[4], O[223]);
| O[223] = b2i(O[223]);
| O[223] = cmpeqi_select(O[223], C[3], O[221], C[9]);
| O[223] = select(O[224], O[223], I[84]);
| O[222] = select(O[224], O[230], I[85]);
| O[224] = cmpeqi(O[230], C[4]);
| O[224] = cmpnei_logic_and(O[221], C[3], O[224]);
| O[215] = cmpneqi(O[223], C[8]);
| O[215] = cmpnei_logic_and(O[223], C[7], O[215]);
| O[224] = logic_and(O[224], O[215]);
| O[224] = cmplei_logic_and(O[222], C[9], O[224]);
| O[223] = select(O[224], C[9], O[223]);
| O[222] = select(O[224], C[9], O[222]);
| O[224] = cmpneqi(O[222], C[3]);
| O[224] = cmpnei_logic_and(O[223], C[3], O[224]);
| O[224] = cmpeqi_logic_and(I[129], C[3], O[224]);
| outputdata_float(0, 7, R[0], I[7]);
| O[224] = cmplei_logic_and(O[222], C[7], O[224]);
| O[223] = select(O[224], C[7], O[223]);
| O[224] = select(O[224], C[7], O[222]);
| O[222] = mul(I[126], C[2]);
| O[215] = mul(I[125], C[2]);
| O[215] = mul_mad1(O[222], O[222], O[215], O[215]);
| O[222] = mul(I[127], C[2]);
| O[222] = mad_sqrt(O[222], O[222], O[215]);
| O[9] = fmod_add(I[8], C[10], O[222]);
| external_func_call(C[3]R[65535], R[65535], R[65535], R[65535], R[65535], R[65535], O[7], O[215], O[222], O[78], O[82], O[19]);
| O[40] = mul_mad1(O[82], O[82], O[78], O[78]);
| O[40] = mad(O[19], O[19], O[40]);
| O[40] = rsq(O[40]);
| O[59] = mul(O[78], O[40]);
| O[60] = mul(O[82], O[40]);
| O[61] = mul(O[19], O[40]);
| O[19] = neg(O[7]);
| O[7] = neg(O[215]);
| O[222] = neg(O[222]);
| O[215] = mul_mad1(O[7], O[7], O[19], O[19]);
| O[215] = mad(O[222], O[222], O[215]);
| O[215] = rsq(O[215]);
| O[82] = mul(O[19], O[215]);
| O[40] = mul(O[7], O[215]);
| O[19] = mul(O[222], O[215]);
| O[222] = mul(O[61], O[40]);
| O[7] = mul_sub0(O[60], O[19], O[222]);
| O[222] = mul(O[59], O[19]);
| O[215] = mul_sub0(O[61], O[82], O[222]);
| O[222] = mul(O[60], O[82]);
| O[222] = mul_sub0(O[59], O[40], O[222]);
| O[78] = mul_mad1(O[215], O[215], O[7], O[7]);
| O[78] = mad(O[222], O[222], O[78]);
| O[78] = rsq(O[78]);
| O[7] = mul(O[7], O[78]);
| O[215] = mul(O[215], O[78]);
| O[222] = mul(O[222], O[78]);
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
| O[130] = mad_mad0(C[0], O[215], O[75], C[0], C[0]);
| O[131] = mad_mad0(C[0], O[222], O[76], C[0], C[0]);
| O[46] = mad_mad0(C[0], C[0], O[77], C[0], C[5]);
| O[77] = mul(I[39], C[15]);
| O[49] = mul(I[39], C[13]);
| O[14] = mad_mad0(C[0], O[7], O[48], C[0], C[0]);
| O[47] = mad_mad0(C[0], O[215], O[75], C[0], C[0]);
| O[49] = mad_mad0(C[0], O[222], O[76], C[0], C[0]);
| O[48] = mad_mad0(C[0], C[0], O[77], C[0], C[5]);
| O[75] = mul_mad1(O[128], O[59], O[126], O[82]);
| O[76] = mul_mad1(O[128], O[60], O[126], O[40]);
| O[77] = mul_mad1(O[128], O[61], O[126], O[19]);
| O[128] = mul_mad1(O[128], C[0], O[126], C[0]);
| O[75] = mad_mad0(O[78], O[7], O[75], O[127], C[0]);
| O[76] = mad_mad0(O[78], O[215], O[76], O[127], C[0]);
| O[77] = mad_mad0(O[78], O[222], O[77], O[127], C[0]);
| O[78] = mad_mad0(O[78], C[0], O[128], O[127], C[5]);
| O[129] = mad(O[46], I[122], O[129]);
| outputdata_float(0, 86, R[0], O[129]);
| O[130] = add_mad1(O[130], C[0], O[46], I[123]);
| outputdata_float(0, 87, R[0], O[130]);
| O[131] = add_mad1(O[131], C[0], O[46], I[124]);
| outputdata_float(0, 88, R[0], O[131]);
| O[46] = mad(O[46], C[5], C[0]);
| outputdata_float(0, 89, R[0], O[46]);
| O[14] = mad(O[48], I[122], O[14]);
| outputdata_float(0, 90, R[0], O[14]);
| O[47] = add_mad1(O[47], C[0], O[48], I[123]);
| outputdata_float(0, 91, R[0], O[47]);
| O[49] = add_mad1(O[49], C[0], O[48], I[124]);
| outputdata_float(0, 92, R[0], O[49]);
| O[48] = mad(O[48], C[5], C[0]);
| outputdata_float(0, 93, R[0], O[48]);
| O[48] = mad(C[0], I[122], O[7]);
| outputdata_float(0, 94, R[0], O[48]);
| O[48] = add_mad1(O[215], C[0], C[0], I[123]);
| outputdata_float(0, 95, R[0], O[48]);
| O[48] = add_mad1(O[222], C[0], C[0], I[124]);
| outputdata_float(0, 96, R[0], O[48]);
| O[48] = mad(C[0], C[5], C[0]);
| outputdata_float(0, 97, R[0], O[48]);
| O[75] = mad(O[78], I[122], O[75]);
| outputdata_float(0, 98, R[0], O[75]);
| O[76] = add_mad1(O[76], C[0], O[78], I[123]);
| outputdata_float(0, 99, R[0], O[76]);
| O[77] = add_mad1(O[77], C[0], O[78], I[124]);
| outputdata_float(0, 100, R[0], O[77]);
| O[78] = mad(O[78], C[5], C[0]);
| outputdata_float(0, 101, R[0], O[78]);
| O[48] = neg(I[122]);
| O[49] = neg(I[123]);
| O[75] = mul_mad1(O[48], O[59], O[49], O[60]);
| O[47] = mul_mad1(O[48], O[82], O[49], O[40]);
| O[76] = mul_mad1(O[48], O[7], O[49], O[215]);
| O[77] = mul_mad1(O[48], C[0], O[49], C[0]);
| O[78] = neg(I[124]);
| O[75] = mad_add(O[78], O[61], O[75], C[0]);
| O[47] = mad_add(O[78], O[19], O[47], C[0]);
| O[76] = mad_add(O[78], O[222], O[76], C[0]);
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
| O[128] = add_add(O[215], C[0], O[131]);
| O[129] = add_add(C[0], C[0], O[46]);
| O[130] = mul_mad1(O[14], O[47], O[133], C[0]);
| O[131] = mul_mad1(O[14], C[0], O[133], O[75]);
| O[46] = mul_mad1(O[14], C[0], O[133], C[0]);
| O[14] = mul_mad1(O[14], C[0], O[133], C[0]);
| O[46] = add_add(O[222], C[0], O[46]);
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
| O[77] = mul_mad1(O[48], O[7], O[49], O[215]);
| O[48] = mul_mad1(O[48], C[0], O[49], C[0]);
| O[76] = mad_add(O[78], O[61], O[76], C[0]);
| O[75] = mad_add(O[78], O[19], O[75], C[0]);
| O[77] = mad_add(O[78], O[222], O[77], C[0]);
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
| O[48] = add(O[215], C[0]);
| outputdata_float(0, 108, R[0], O[48]);
| outputdata_float(0, 109, R[0], O[48]);
| O[48] = mul_mad1(O[61], C[13], O[19], C[14]);
| outputdata_float(0, 110, R[0], O[48]);
| O[48] = mul_mad1(O[61], C[15], O[19], C[13]);
| outputdata_float(0, 111, R[0], O[48]);
| O[48] = add(O[222], C[0]);
| outputdata_float(0, 112, R[0], O[48]);
| outputdata_float(0, 113, R[0], O[48]);
| O[48] = mul_mad1(O[76], C[13], O[75], C[14]);
| outputdata_float(0, 114, R[0], O[48]);
| O[76] = mul_mad1(O[76], C[15], O[75], C[13]);
| outputdata_float(0, 115, R[0], O[76]);
| outputdata_float(0, 116, R[0], O[77]);
| O[78] = add(O[78], C[0]);
| outputdata_float(0, 117, R[0], O[78]);
| O[47] = mad(C[0], I[122], O[59]);
| O[48] = add_mad1(O[60], C[0], C[0], I[123]);
| O[76] = add_mad1(O[61], C[0], C[0], I[124]);
| O[14] = mad(C[0], I[122], O[82]);
| O[49] = add_mad1(O[40], C[0], C[0], I[123]);
| O[75] = add_mad1(O[19], C[0], C[0], I[124]);
| O[78] = mad(C[0], I[122], O[7]);
| outputdata_float(0, 47, R[0], O[78]);
| O[78] = add_mad1(O[215], C[0], C[0], I[123]);
| outputdata_float(0, 48, R[0], O[78]);
| O[78] = add_mad1(O[222], C[0], C[0], I[124]);
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
| outputdata_float(0, 75, R[0], I[122]);
| outputdata_float(0, 159, R[0], I[122]);
| O[78] = mad(C[5], I[122], C[0]);
| outputdata_float(0, 51, R[0], O[78]);
| O[78] = add_mad1(C[0], C[0], C[5], I[123]);
| outputdata_float(0, 52, R[0], O[78]);
| outputdata_float(0, 76, R[0], I[123]);
| outputdata_float(0, 160, R[0], I[123]);
| O[78] = add_mad1(C[0], C[0], C[5], I[124]);
| outputdata_float(0, 53, R[0], O[78]);
| outputdata_float(0, 77, R[0], I[124]);
| outputdata_float(0, 161, R[0], I[124]);
| O[78] = mad(C[5], C[5], C[0]);
| outputdata_float(0, 54, R[0], O[78]);
| external_func_call(O[59], O[60], O[61], C[0], O[82], O[40], O[19], C[0], O[7], O[215], O[222], C[0], C[0], C[0], C[0], C[5]O[75], O[76], O[77], O[78]);
| outputdata_float(0, 55, R[0], O[59]);
| outputdata_float(0, 56, R[0], O[60]);
| outputdata_float(0, 57, R[0], O[61]);
| outputdata_float(0, 59, R[0], O[82]);
| outputdata_float(0, 60, R[0], O[40]);
| outputdata_float(0, 61, R[0], O[19]);
| outputdata_float(0, 63, R[0], O[7]);
| outputdata_float(0, 64, R[0], O[215]);
| outputdata_float(0, 65, R[0], O[222]);
| outputdata_float(0, 71, R[0], O[75]);
| outputdata_float(0, 72, R[0], O[76]);
| outputdata_float(0, 73, R[0], O[77]);
| outputdata_float(0, 74, R[0], O[78]);
| outputdata_float(0, 78, R[0], O[82]);
| outputdata_float(0, 79, R[0], O[40]);
| outputdata_float(0, 80, R[0], O[19]);
| outputdata_float(0, 81, R[0], O[7]);
| outputdata_float(0, 82, R[0], O[215]);
| outputdata_float(0, 83, R[0], O[222]);
| outputdata_int32(0, 2, R[0], O[224]);
| O[224] = mul(C[11], I[38]);
| O[7] = add(I[38], O[224]);
| O[222] = mul(C[11], I[38]);
| O[19] = add(I[38], O[222]);
| outputdata_float(0, 84, R[0], I[38]);
| outputdata_float(0, 136, R[0], I[38]);
| O[215] = mul(C[12], I[39]);
| O[40] = add(I[39], O[215]);
| outputdata_float(0, 85, R[0], I[39]);
| outputdata_float(0, 137, R[0], I[39]);
| external_func_call(C[9], C[18], C[18], O[224], O[222], O[215], O[7], O[19], O[40]);
| outputdata_float(0, 16, R[0], I[15]);
| outputdata_int32(0, 3, R[0], C[18]);
| outputdata_int32(0, 38, R[0], C[18]);
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
| O[215] = cmpeq_select(I[76], C[0], C[24], I[77]);
| outputdata_float(0, 22, R[0], I[21]);
| O[222] = add(C[2], I[79]);
| O[224] = div_f2i(O[222], O[215]);
| O[7] = i2f_mul(O[224], O[215]);
| O[222] = sub(O[222], O[7]);
| O[7] = addi(O[224], I[117]);
| outputdata_int32(0, 35, R[0], O[7]);
| O[7] = add(I[76], C[2]);
| outputdata_float(0, 179, R[0], O[7]);
| O[215] = select(O[224], O[215], O[215]);
| O[224] = select(O[224], O[222], O[222]);
| O[222] = div(O[224], O[215]);
| outputdata_float(0, 180, R[0], O[215]);
| outputdata_float(0, 183, R[0], O[222]);
| O[222] = clamp(I[121], C[0], C[6]);
| outputdata_float(0, 5, R[0], I[5]);
| outputdata_float(0, 184, R[0], O[222]);
| O[222] = cmpneqi(I[115], C[7]);
| O[222] = cmpnei_logic_and(I[115], C[8], O[222]);
| O[222] = cmpeqi_logic_and(O[230], C[3], O[222]);
| O[222] = cmplei_logic_and(I[116], O[230], O[222]);
| O[215] = cmpeqi(I[115], C[9]);
| O[215] = cmpeqi_logic_or(I[115], C[4], O[215]);
| O[215] = cmpeqi_logic_and(O[221], C[4], O[215]);
| O[215] = b2i(O[215]);
| O[215] = cmpeqi_select(O[215], C[3], O[221], C[9]);
| O[215] = select(O[222], O[215], I[115]);
| O[222] = select(O[222], O[230], I[116]);
| outputdata_int32(0, 39, R[0], O[221]);
| O[7] = cmpeqi(O[230], C[4]);
| outputdata_int32(0, 40, R[0], O[230]);
| O[221] = cmpnei_logic_and(O[221], C[3], O[7]);
| O[7] = cmpneqi(O[215], C[8]);
| O[7] = cmpnei_logic_and(O[215], C[7], O[7]);
| O[221] = logic_and(O[221], O[7]);
| O[221] = cmplei_logic_and(O[222], C[9], O[221]);
| O[215] = select(O[221], C[9], O[215]);
| O[222] = select(O[221], C[9], O[222]);
| O[221] = cmpneqi(O[222], C[3]);
| O[221] = cmpnei_logic_and(O[215], C[3], O[221]);
| O[221] = cmpeqi_logic_and(I[131], C[3], O[221]);
| outputdata_float(0, 8, R[0], O[9]);
| O[221] = cmplei_logic_and(O[222], C[7], O[221]);
| O[215] = select(O[221], C[7], O[215]);
| outputdata_int32(0, 33, R[0], O[215]);
| O[221] = select(O[221], C[7], O[222]);
| outputdata_float(0, 6, R[0], I[6]);
| outputdata_int32(0, 34, R[0], O[221]);
| O[221] = mul(I[126], C[2]);
| O[222] = mul(I[125], C[2]);
| O[222] = mul_mad1(O[221], O[221], O[222], O[222]);
| O[221] = mul(I[127], C[2]);
| O[221] = mad_sqrt(O[221], O[221], O[222]);
| outputdata_int32(0, 1, R[0], O[223]);
| O[221] = fmod_add(I[78], C[10], O[221]);
| outputdata_float(0, 181, R[0], O[221]);
| outputdata_float(0, 23, R[0], I[22]);
| O[221] = mul(C[25], I[128]);
| O[223] = rcp(O[221]);
| O[222] = sub_mul(C[5], I[80], O[223]);
| outputdata_float(0, 185, R[0], O[222]);
| outputdata_float(0, 186, R[0], O[223]);
| outputdata_float(0, 182, R[0], O[224]);
| O[224] = cmplt_select(O[224], C[0], C[0], C[5]);
| outputdata_float(0, 58, R[0], C[0]);
| outputdata_float(0, 62, R[0], C[0]);
| outputdata_float(0, 66, R[0], C[0]);
| outputdata_float(0, 67, R[0], C[0]);
| outputdata_float(0, 68, R[0], C[0]);
| outputdata_float(0, 69, R[0], C[0]);
| outputdata_float(0, 158, R[0], O[176]);
| O[221] = mul_mad0(O[221], O[224], C[2], I[80]);
| outputdata_float(0, 1, R[0], I[1]);
| outputdata_float(0, 9, R[0], C[2]);
| O[224] = floor(O[221]);
| O[221] = sub(O[221], O[224]);
| outputdata_float(0, 187, R[0], O[221]);
| O[221] = random(C[5]);
| O[221] = cmple(O[221], C[5]);
| outputdata_float(0, 4, R[0], I[4]);
| outputdata_float(0, 70, R[0], C[5]);
| O[221] = f2i_select1(O[221], O[224], C[3]);
| outputdata_int32(0, 17, R[0], O[171]);
| outputdata_int32(0, 36, R[0], O[221]);
| outputdata_int32(0, 37, R[0], C[3]);
| outputdata_float(0, 10, R[0], I[9]);
| outputdata_float(0, 24, R[0], I[23]);
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
| outputdata_int32(0, 0, R[0], C[26]);
| outputdata_int32(0, 4, R[0], I[86]);
| outputdata_int32(0, 5, R[0], I[87]);
| outputdata_int32(0, 6, R[0], I[88]);
| outputdata_int32(0, 7, R[0], I[89]);
| outputdata_int32(0, 8, R[0], I[90]);
| outputdata_int32(0, 9, R[0], I[91]);
| outputdata_int32(0, 10, R[0], I[92]);
| outputdata_int32(0, 11, R[0], I[93]);
| outputdata_int32(0, 12, R[0], I[94]);
| outputdata_int32(0, 13, R[0], I[95]);
| outputdata_int32(0, 14, R[0], I[96]);
| outputdata_int32(0, 15, R[0], I[97]);
| outputdata_int32(0, 16, R[0], I[98]);
| outputdata_int32(0, 18, R[0], I[100]);
| outputdata_int32(0, 19, R[0], I[101]);
| outputdata_int32(0, 20, R[0], I[102]);
| outputdata_int32(0, 21, R[0], I[103]);
| outputdata_int32(0, 22, R[0], I[104]);
| outputdata_int32(0, 23, R[0], I[105]);
| outputdata_int32(0, 24, R[0], I[106]);
| outputdata_int32(0, 25, R[0], I[107]);
| outputdata_int32(0, 26, R[0], I[108]);
| outputdata_int32(0, 27, R[0], I[109]);
| outputdata_int32(0, 28, R[0], I[110]);
| outputdata_int32(0, 29, R[0], I[111]);
| outputdata_int32(0, 30, R[0], I[112]);
| outputdata_int32(0, 31, R[0], I[113]);
| outputdata_int32(0, 32, R[0], I[114]);
BåÄ-û;-m3M
≤ø5;∫M
\è^ñzË¿LÇc;
©ï“;ôO∫‡£]Òµ€
øLìr£;
;π„ö¯ü)@¥
ÇÖ∏ŒKr¶Líõ;
U;⁄Gâ4•‚¢
Z;ÍêK’Gô¥æNp
zŸ;#B∂õk
ÎDÆ!;Ú75Y≈M
≤B∞ôV¡–[;4M
j;±4Fè¡\ëCëﬁ=M
£Fë*;¶4u<ÔM
Dº"LS;Ç4$M
(!;DéG>–¬R
npOÄ£k;•åUÁM
ÑoÃxßò;
¡É*ûóˆ•Ä.;ƒ—
i†¥Më;


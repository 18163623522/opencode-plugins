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
¥Ø›UÑ;&Îó/q∑˛“ÿj…
N‘CØ≠%£Bó;Lo0~‚ 
N‘CØ≠%£Bó;Lo0~‚ c
¬;µO¬˛˙
0ò«;5ﬁH¨MT¯çyJ
Uè›;‘]ÍO∂/ˇg
¡˙i|«`@ç´‡;øœ*ø
q Hh]í:¸Q∫µoL:;
˘I7/˜;
å6Á∆;h
…Ï};tS}XıY
 T¶KÅä
ØyLîªı>;9
~Ûáˆ8;â¯
Ã;í—Yﬂ{Eà
zICò7–^ˆv;u
5CánHi.Ú#;‡
!;/{€˙¸
D◊9>;ı#
òëâˆc√Ì@á(D‡Øy;
;äCæF™y€
g'∞˜ÄîHa;≈_
ÿ;ºÉ5R
©oìoìuå¡2πüj;ËÃ:ΩÅ…
ySD;I¢CnÎÜÌ√
wõ©∂Îâ-[ïÎ◊Ò;
;E˜9—‘
rU˘ë≥ª;π
OÜ°ùp~;ÀT\~ˆ
µe°;˝L∫z"{˙
⁄*tD<;úEì&É
fπ∏NêX´;M°˛Ω…
≠G∏;—O
N‘CØ≠%£Bó;Lo0~‚ ⁄
ÿd¡4C∂°H£=;ø
~3;G‹¸≈
j£;ﬁjØFÉ•4N^
G¢^>i;I±
ÂAA?îhKæ6Ä≈a;:
·Ä;2Kx+J≤Bè§]â‹#
s;Mi”DÅéÄµó«RË
öc,„( ÒCí;˙™gÊN1
ùΩ;Bêa¢óoÆóˆ
6/Øém;<Jå
o;û<≠G∞C)#ù7õÑ≈
¯AÅÜùµ√;M;ø
¯AÅÜùµ√;M;
FøGÔ;@Ø
Ù;HgI©“7
cMäI#í;…Ï£ˇ
—Xd°JeG∏;(
¯AÅÜùµ√;M;‹
ﬁ;®J´A]
ﬁJΩu&ÑkU„;T
ﬁJΩu&ÑkU„;Z
—Ì7;GΩ
ﬁJΩu&ÑkU„;ˆ
ﬁJΩu&ÑkU„;=
‡gYßÖ¯Hê");rÆ◊\
‡gYßÖ¯Hê");rÆ◊\Z
‡gYßÖ¯Hê");rÆ◊\˜
‡gYßÖ¯Hê");rÆ◊\\
ªˇ4ÌIÅíz~JÕjR;
Ÿ˙œ‹¿Ñ;AòEiËΩË»K¸
Ÿ˙œ‹¿Ñ;AòEiËΩË»K
;O∫´>àéMöÖâ$≠„ö
ÒÛIûãmR¸º;h
Ÿ˙œ‹¿Ñ;AòEiËΩË»K˛
Ÿ˙œ‹¿Ñ;AòEiËΩË»Kˇ
ﬁJΩu&ÑkU„;
–Ã˘ë·3©Aº“]»[(2W;
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
Å)YÆëŸnN∫;Ùm
£;n4‰EfC∞Ì
±qú©#N7O™ª;eﬂ
W`Äd˘å°B≥t¥÷;ƒk|≈
nÂ¢q“qMâ;}tk
;W/Ë¿]4
;W/Ë¿]”
Â√˙»S;ÅD†ò
˚˙{ßYGß<8ÊVKÒƒ;
ièÇ\Ë;
Læái+:zr¥;
*¯ı°”^;
è;ÿ˙ú†qBï*tÎˇ
÷‡y|;NÄuÀ^‰îÍﬁ
÷‡y|;NÄuÀ^‰îÍﬁA
b;~G¿ôGJµ≠YÏÅ{hµF
b;~G¿ôGJµ≠YÏÅ{hµù
=œ;€„<˛I¥
Õ;B¶x£∏°©Á3/
ãsL≥L©j;Ö®¨¶ºG
;·•5ªÌ]O∞l9•{
Ò¥;ªC≥ó=L*˜ø¿G
>Â;N™Õ)vãh.ZG
b\^ÇPÛEü;±
”5oU;Já±±@†®%9&
x™Má4i=;
n;¨`gFïC∑Yc
;"#É⁄N
;gG°Ä3ÒsFHÜ
oµÙ(∫;ŒHºé9ôgÚU™Å
K˜ZC ö;Mòïs
;Iò£+1
9û;$N˝E£IËÔ†=ˆ&^
Ñq;dœDÿJë`†à]ÀÁÆi
~c⁄\õ%¥N™; Û:5
TA±;ãÒ¢!ÁyZ
TA±;ãÒ¢!Áy_
87ô5¶3Në;
8KbUkí≠LîªıΩãë®;
Ñq;dœDÿJë`†à]À
¸ëØNµ‹P%Náw;‘
EÉ©N}í.;œﬁ
ãß;ÂR@ø©àm¯êúJc
÷ÎÜ˚õAé;¿Ùc.ó∑
Ò≈;ªO≠lÜ••˙C≥G
Æ;IN:ˆ
;≠ã£πÏ™G•'∆5
*J;œ’$ÓI¥ÒƒƒÚo‘~z
Oö;P2π¸Æ*b
!;ÌBÔΩ«@†À<Ç*
†6i ;z
?;’Á]éJ∑ü
L@•.Å;
;…Cûp˘«r¸˛^y
mk†;$û•O´ÜáVóIø¥c
OÆÎi;^¡òŸ…
@ãeT;Æúç
˘~ÙÈ<Ä;M•
phÏ«ÙíòKÅLOèH´S;c
∫å  ‚˜;Dã
";ıÖø©&@ñΩŒ*Â
ıó;à.ÈÓ
-15 ;WaEú◊$q
  I@ê,
¢!Ë;ù¯JñÂàﬂÏu>
Cõ$B1;Í Ó
†HæÂ˛†’H-;ª
;Ô“].ºx
ä£ü;Ó€oBïÌ‡«CXO
Dßï”√;≤—Ûª
Y{3;FçûRô®<NCb
 DÄ÷bûYPc7x
∞i“LÜv*Eµ;®
â;8™É[DàöVKs≠Ó
xH;A˘qb
˜cKª‰´˛;‡Úˇn
 iÈJÜ-g$ûZH
7uù¬‘RçKô'î£lÅ;kb
ª[Ì”t~;K•˛F
ﬂ˛˚_œŸR@Åˇˆ§g;
Ts9˝f;H¨€ÒkX¿ÇÚ
:Ã;3ËBqM£<Y)ôfH$n
AÉ%F;XOÖ6x‡jæÊ\…
xùù⁄€HH≠cç;[*Y>j
xùù⁄€HH≠cç;[*Y>_
æπ~f;b
ÚJÜÊ;§Ô
ÒÔºNÇú&;
;|ã´Îø
™áåEñ1I∞è$Bø;Pe
¸¥gq‘ÚôOí;
'_z] ÒG§;§Q¬a)
pbn;>mG
Dó0¿¯;ÑOæG
 l;æNÉÒÌ‡~ 4=&
ÑÒ`@ºèS;<»Zö&
õ;˜∫·Oúö˝
9~Nï;nÉ¶4‘˜˜
p˙S Ï€;O±™¨
T;R[áÿ
®;@èQ›xΩ§
\Ày`AçÇZ≥Ñ˙;±
∂z;FÚ≈
(s±;î`ÏCö6⁄V`6X3 
Ñ◊Aâ3;!–w>ë
eºî˙F®ÉSÇì;-≤
˛AqˇQ@–I±õ5;
L˘;KCb
{;≤;ÆÆEÆ˘'¶„ö⁄
!ÿq;'-
;LôÕÂ≠ı©*3≈
jÚLî;5}†ÌyÑï
jÚLî;5}†ÌyÑ_
úÄˆﬂ&O¢Pÿ¡æƒ;7…
ÛLV‚µc}I≠º;∂c
†Âo¬)?Fæ;y|µ ˇ¯ú
†Âo¬)?Fæ;y|µ ˇ¯—
\∏Aä;!ô-¬€¡…
;+¯OOûû7>
E≥¬;7ë1I
lZ;E§P±ˆ˘C π
1Â˙!9;≈A∞Ü
å†;ıæµ"Jì"∑∞ö
å†;ıæµ"Jì"∑∞öÛ∞ô_
b;~G¿ôGJµ≠YÏÅ{hµ√
;W/Ë¿]“
÷‡y|;NÄuÀ^‰îÍﬁﬂ
;"#É⁄Á
TA±;ãÒ¢!ÁyÛ
xùù⁄€HH≠cç;[*Y>
;ÎÔ!i¿,JàÖvË
jÚLî;5}†ÌyÑ.
†Âo¬)?Fæ;y|µ ˇ¯5
+tj€6díHª'ºÓWâõS;
√.äX™Ö;
cˆÜ/#2ˇFº5J∞^Ñóä;
å†;ıæµ"Jì"∑∞öÛ∞ôL
ëÖ;ü>=-N©
;I°ît%:ùMe 
j@ëg—…Ÿ;
≤™cZ_Cí\;
;¬ÒÒEª
M;„uÓÎ»Må†e
;[]eL∏m¬u
àŸC¶œ;'q˚Ohf
àŸC¶œ;'q˚Oh_
àŸC¶œ;'q˚OhÅ
∆N‡˚ú7—AçÂµ;Ωv·
∂ÙµO≥;3Yx‘(Ç≈
æ=¿§;0-F≥
ßòÕb;æáDá¢ûäE
;aJΩzO ?∆+†ü
;aJΩzO ?∆+†[
Cãˇ"Q;CÚV
É∆:JóÑƒ—;Tá_
I¶dvÉ;
ÙΩÀ51fwI≠V‹Ì´.;F√
&;˜qQIT@Ü®R
öZóàîHÑ;w?~¯Vî
Ä~E;ﬁÂ
ñ≥fÏÄ»˘D≥àdÍÊ;L6
B≥%Îë;
Ω.BπYÎ;k7Î˜
—;=V}¸FùQ˜
q$Û;‚ò∆Oñ
¡AπG≠H;æi
Ü;‚{v¡!JéDY†a
∆M±\Oå;µxK
¨•;ª´Ê“Kß√t
Ö∏:“)¢ŒOò;æíÖ√„õÒ
Ö∏:“)¢ŒOò;æíÖ√„õ[
AãÀL;^£Ü;
’‡˘rﬂPJMëo≥;œ-ﬁB
;S=ö±XàKäÑ
;aJΩzO ?∆+†(
Ö∏:“)¢ŒOò;æíÖ√„õz
E¨Ñõ;ôGK2
[;w‹ÊC÷M´Wƒ;ÃQ√H
@;x§ù.DAàÔ«;–Ë
°;bF[√
ó‚‰z;XUIÄt7a!EÏ
Úó;˝3g.Dì
z;O∫kÉ^˝öËT≈
rÓD∞j˙Íopno;
Nt=<w;
BßÏ&xÌˇ$Ã;
≤´;à‘ÿ
NáÔTSg†÷E;
“US?ˆºbE™;e›k˜¯
°Gë&.ïﬁnãb;
∑±Ykò’(@êøè(t∑Kô;
J†)E—;
Âù˚z˙ÎÉOπ`)LA»;”√
|ÜbD1;
tXOåOòæÛÎ‚s;
Z;Öj6sêO¢øÍky@‰»
\≤ﬂﬁ1;ıM°&´“ C…z√
É;LßA^%Ÿ¸ª
ÍzëﬂDñsØu„Lû;≈
q‘ı;EûuCdﬁ&5›√
q‘ı;EûuCdﬁ&5›…
Hd;}†#
4ùæò∞b;∫ÉÈm@ãõ
∞b;∫ÉÈm@ãõ
Rﬁı;M®
sVb∑I;|B™0
êÑ”7X;KªGûﬁV±ë˙
´;{Á9o€F≠ïÊ.ﬂ
;j∫pº∏$ßrE†8‰ÏE(
;{;uXÎ–
;{;uXÎN
>Nô^Î;$Õ 0–
>Nô^Î;$Õ 0…
Øc8\;‚Eí#˜iª⁄
b;~G¿ôGJµ≠YÏÅ{hµ
G®R›ﬂRU;æ÷
G®R›ﬂRU;æ
£í;Cä˘G¥
@™ÛlØ,;
;aJΩzO ?∆+†
DºÅïïÏ;
ıÉ˛ÑooH´”ÎÙõ ;
[µ∞ÁJA´- ;:ﬁwH√2
∂qÍ;ΩúÒM¢±—
ıÉ˛ÑooH´”ÎÙõ ;Ÿ
ÍCø;{∑ÿO¥‰ø,
›PÔ&∫Î"Bèj;3©Sc†›
›PÔ&∫Î"Bèj;3©Sc†…
H≥s;DædÓ
YKê;UÄïGù
[µ∞ÁJA´- ;:ﬁwH
Â;Q·@.’Mß”|ûóÆDZÛ'&
Â;Q·@.’Mß”|ûóÆDZ
kbA‚;›o@ñ,Ô˝iê‹I"óa!Æ~hD®c)Â
ø>«;"à¡Aö·Ù\
kbA‚;›o@ñ,Ô˝iê‹I
É∆:JóÑƒ—;Tá_‰
9á‚ s‘]MäSr;˚±µ`√
;]ú0ø®*G®^¬
9;˛π$J»Añ{C8·åNıÌ
9;˛π$J»Añ{C8·åNı…
ùY˝;BEî¢
hLAïî%á∏;3Ã˘
hLAïî%á∏;3Ã
;~8^HìB}
¥’n^Õ;dIïYÒüS
~;Œ@:5Î@ΩsXCy
¶Ój7;*áMüÎ
 q\!™2îL∏1Wç
s™˛â;NôÜˆM›
8Há 4M+Y;ë
ÿ ;¯ÈUºMù{¶
µ¶8ÀÀ|&@ô//„Jπ€
µ¶8ÀÀ|&@ô//„Jπ€ƒ
Gò;ä∆…±
;Ì∂u2jMí3Càf∏∑8≈
÷5Hì;ˇS>kÕ–Ó +
÷5Hì;ˇS>kÕ–
 ZSiBº´AéÓ—lÜ∆“A%
 ZSiBº´AéÓ—lÜ∆“A…
N]˜ÏO¶;7
µ¶ú©®ƒ;Hß
‘!„Ñ;≈.
‘!„Ñ;≈X
 C®ØHŸ˜ÎRﬁ…
––˙»H™;[á}zŒB≈
ÄùX¡Ú;^`I±
ùX¡Ú;^`I±
IVj;≈DE©
;ªÑê*%?
;ªÑê*%
N´†;zXã
wàB“Nç†;¸ˇ”Î
r;Âgi~b˜µgTHxFá
r;Âgi~
…;∂†uEÖ≤0õ
&≠,ÿ;´§Oª‚œ
;Aë-È∫4àΩ∞≈
s£DBÜ-íHòÀ:;∂L
∑D,∫ù}ˆDôe’!9;
®É?PK;À¡E∞ÙD
É?PK;À¡E∞ÙD
;Doâ)E†⁄Â{Äå
EñC‡w@¸k;…
;Doâ)E†⁄Â{Äå 
;u¡Ñÿ\nO°
:OèÑœ]WUf;o
:OèÑœ]WUf;…
Bº9≥”Ù"ë;
ok§P$K¨∂Ë2≤;Ó±≈
√œb©[;V@Ä
íe;íÎY-AÑÓ=.uZ∂
iyH≠T‘;0
AãÀL;^£Ü;z
5¶;^M©
˘';hPNû
o™åp§Ÿ‰EâN˜ø;ä +~
o™åp§Ÿ‰EâN˜ø;ä +…
JÅ2$H;
IØ∫Ûø;'
Û≈C;9ÁÄ
Û≈C;9Á…
H;Îw‹_MKØ˚µ2Z‘Á‰Å
H;Îw‹_MKØ˚µ2Z‘Á‰+
∆M±\Oå;µxKÇ
bπ∫;6TI≥hêuﬂı
0˘;Dú(¿∆
pï;ŒÈNæ·:
ö≈Û;•^ä
ö≈Û;•^
∆ÀI;∫ä'L™
’uõôÆMòI4;
ØV;BØHG¯ÎA¢≥¶
ØV;BØHG¯ÎA¢≥
;|HÄ9ÛNîfÿ9¶
;|HÄ9ÛNîfÿ9
¯;·€J_UD®9&Ÿ
—;5é3p
L˘;KCb©
ù)g&g;k@çg
‘J1G≠Æ{ï¥ßi¡‘cÎ;ÄNQ@∫%ë
ö;öVH6†N¶JÁ2Ñûƒ)≠
ö;öVH6†N¶JÁ2Ñûƒ)…
‘cÎ;ÄNQ@∫%ë
˘5D;Ö¯-AÖUß„à]1§…
õN;XÙÄ÷KªíR÷œHUy
ìlUm‹˚B¥];
∆=Bàx±8ëOW;¶
∆=Bàx±8ëOW;
¯√ƒ∂4ÆG§A∂Í;A‰≥
¯√ƒ∂4ÆG§A∂Í;A‰
@ÜÒô1%È;Ë
nxñb”z7M∂æ;z≥û
ø”HAl¶Díe6;˘§˚
úﬂÀv™∑3Nü•õ;˚√„c
wjIF;F´oÒ}
)Œ14);ìG∏ôµ’
\©;7±s–@áÕ8p2âi
|¿* I≤˘LöÎÄ;
Í∏u™j†ÖAó;ì·
;±8<Iâ√rïÄ‹
Q‚†CÚØlB∞;ÊYï
!kGîñ;jF∏ù‰
î;˛‚ù≈wM¶^*Ÿ‡Ê\È 
î;˛‚ù≈wM¶^*Ÿ‡Ê\È…
FzÕ«;Gõ@
;G´÷œ‘m¯~G
∏’◊NÑdÚò;€
˚;‹P±uÿ
˚;‹P±u
æª‹=,B(F≥≥q;Ëds?Ÿ
æª‹=,B(F≥≥q;Ëds?
ÛEΩ»;?∑OázM…0ÛK·≈
B;˙2•=U}u
¿;œ«H™lÊÓ£
B;˙2•=
sé;+ ÿ¯E¢Zˆ-
>3#G©6“;´v>ÿ≈
+;K}êºÆJê∞ˆ_≈ˆ"
 A´1≥^qZ@ñ¶
 A´1≥^qZ@ñ
e;HµJc¥≈(éëÌ
e;HµJc¥≈(éë…
8—d≤G©G¡`Q;◊H≈
Íi+;<’Nö±w
∞;óÎI´nùp?¸/$ˆ
∞;óÎI´nùp?¸/$…
~!¢†s˜nBπ;
ŒO`öD!ÇM†é| ;
»;Kãmı˝ê9]?
^ﬁzEº∑uô·>;e¶
^ﬁzEº∑uô·>;e
BàV;z+”Ùˇ¶
BàV;z+”Ùˇ
?¥÷Yò;Kô
)‚;~£=:C±
;Ñ∫Yµ7È@ìÖπ‰ıy
ññﬂˆ~O˛N¶‹E¸Ôæb;
fæ–ÚR?Mî>® D;ÒÊ≈
Û]¯;¨òïBá
µ@fR;™πIâﬂ∆˝Ë'
±\π;·(˚Aõ/=4œ!
;NVπ,s
DÅ)¯P√}i;
B™Ö¯0b.\;¶
B™Ö¯0b.\;
©„≈Fõ∑¯[_`Â];
H°·R.˘z#»;
B~ZSÒ3WM©G°91cåw;
ı‰®I¶;
¨3êC?D´Ü∂v;“%1>
¨3êC?D´Ü∂v;“%1
ùΩ;Bêa¢óoÆóˆA
 A´KUTFöR!C
 A´KUTFöR!…
DH;Eêé$,*H‹–H
DH;Eêé$,*H‹–
GåÁÂé-;Ë‡J
GåÁÂé-;Ë‡
;¥Fü/6æÂá2J≈
úË¥„ﬂXøHà;â
E∑πÖ ÒxK;¶
;YÂLË…
E∑πÖ ÒxK;
˛´T“@õÜ;˘TÑq™
≥$Ñ;M†˜¨
{5mHãvûzAÌºi4˜ ;ñ
x_t‹n;ªIé™
H{5føÉ•Oá"ç;§VQb…
©ÁI°Q-¸;_◊
;{;uXÎi
>Nô^Î;$Õ 0i
q‘ı;EûuCdﬁ&5›l
G®R›ﬂRU;æx
›PÔ&∫Î"Bèj;3©Sc†
É∆:JóÑƒ—;Tá_Ü
9;˛π$J»Añ{C8·åNıè
hLAïî%á∏;3
öZóàîHÑ;w?~¯Vî¢
Ω.BπYÎ;k7Î˜±
 ZSiBº´AéÓ—lÜ∆“A¬
‘!„Ñ;≈À
;ªÑê*%‹
:OèÑœ]WUf;
o™åp§Ÿ‰EâN˜ø;ä +
Û≈C;9Á
H;Îw‹_MKØ˚µ2Z‘Á‰
ö≈Û;•^$
¡›E∫~?ñB±ß.©h=Ã∆;
L˘;KCbC
ö;öVH6†N¶JÁ2Ñûƒ)G
¯√ƒ∂4ÆG§A∂Í;A‰M
î;˛‚ù≈wM¶^*Ÿ‡Ê\Èc
˚;‹P±uq
æª‹=,B(F≥≥q;Ëds?r
e;HµJc¥≈(éëÜ
∞;óÎI´nùp?¸/$è
»;Kãmı˝ê9]?£
ññﬂˆ~O˛N¶‹E¸Ôæb;Æ
√¿D™èC;-±’
J°_ycô‰;
∂;ΩR\…
=F¥Ïb;ªØ…J≈
f-†ùCÅÁBd6;^Hø
f-†ùCÅÁBd6;^H
®+´c ı„A©W!∑;
˘kô}îÎ0Dû;â6≤´ﬂ‹√
˘kô}îÎ0Dû;â6≤´ﬂ‹…
H^˛;D…
9=<Dó;›Iºå
¨3êC?D´Ü∂v;“%1Ô
ùΩ;Bêa¢óoÆóˆÚ
 A´KUTFöR!Ù
GåÁÂé-;Ë‡¯
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
˝‘WXÚ7äF•Wﬂ–;ow"…
;ßÄ«\~@ûSØ}@üı«
âiFã/&Ø;™∑ˆ
âiFã/&Ø;™∑ˆ…
5\´Ô;O≠yÄç‚LÒ&
5\´Ô;O≠yÄç‚LÒ&…
˘FCüö‡Èz«;)¶
˘FCüö‡Èz«;)
'ªÙú¬Ù;Nê
åójÕVJØ;ueßä%€
·4∑„ë»-@ó´;['J
)Õ`ä;πmDÇ–
ej;æïDâã–Y
Nˇ¡ë7„mN∂ƒGñR;
y˜)œ(CÖC∑FªﬂP˝%Ö;
Å˚yÎxE±Z)ÕÀı¯E;
ÍAöW≈&ºqÕﬁ;
uÊÄAØ)„-¬@Sv;
¯éºÖ≤‚ìGºÍ˜‰^;~
Fë$;a’[
⁄;Æ_CD∞—Opwd
µ˜Œuº;nEâﬂj>R
˚C„[;aQBà&8∞
;◊X≤B∏N
˝‘WXÚ7äF•Wﬂ–;ow"P
âiFã/&Ø;™∑ˆP
E¨Ñõ;ôGK2R
[;w‹ÊC÷M´Wƒ;ÃQ√HV
5\´Ô;O≠yÄç‚LÒ&V
åójÕVJØ;ueßä%€_
 s&≥|…
‰˜DÖ0;èU
7D{C°èÅG¢#pÓ[;7
ó‚‰z;XUIÄt7a!EÏî
;©†˚(ÊÂFêç
@Ô¥-;M©EåQ†
ÒÛIûãmR¸º;hû
ÒÛIûãmR¸º;hU
 —<;?h™Môç•ØZüòU†
 —<;?h™Môç•ØZüòU
˜cKm>…;
ãvx¶∑”;OÖ(Sï!M>•…
Cãˇ"Q;CÚV£
‰g;•†0MÜQ:âıπº^•
‰g;•†0MÜQ:âıπº^
íl¨È;¥PDãá{L÷=U
;∏maù⁄Cªl8•Mi+
ñ≥fÏÄ»˘D≥àdÍÊ;L6∑
8Há 4M+Y;ëπ
8Há 4M+Y;ëA
K;Óñ‰ﬁ
¢Òi;‡®AáG”÷
û`Nò≈4´0ã;]
"Cª\ÏÒè;ÏÈ
ìHàl@≥BKö^;'=
„£HΩ;®
6#≈Ivn%Dëø;
å†;ıæµ"Jì"∑∞öÛ∞ô
Ωvÿ;7;Må´K
;gG°Ä3ÒsFHÜÕ
;gG°Ä3ÒsFHÜS
Á˛O∂tÌVIáˆÊê.;òÆŒ
Á˛O∂tÌVIáˆÊê.;òÆ
◊Wx‡;≥ÇI≤
&HÚ´;R
DÅ)¯P√}i;“
DÅ)¯P√}i;‚
:;@–^Å
‰v’˚Ò¿–KÉaΩÔΩ;Kî
 Aëˆ3-
{Œju~O;Dªé∑
Ö∏:“)¢ŒOò;æíÖ√„õ
£[h+%Ë.Aõl-j∏’;E≈
‘!„Ñ;≈
Èc∑æ…E;H©ËáË¥m
qi;;¥E∂o>2e
´ÎF˚;∫ŸK≤‡ïëÖ_
;˙/¯X€
;˙/¯Xî
ıR9ÿ"D¨Úq;Ã
TA±;ãÒ¢!Áy
g‹I∏xü;Ü
%îh;˘Ä_G∑
Ö°ÄE<;ÈFÑñ
}\@ùO£;—VÜç
ûÅ(÷GíÊ[eÒr;0
ìáï∆)K;Mà±≠/˜˜ùö≈
;M¸è¿sK£ﬁ»u8q„e…
˛´T“@õÜ;˘TÑq™Û
˛´T“@õÜ;˘TÑq™˝
\Ày`AçÇZ≥Ñ˙;±Ù
\Ày`AçÇZ≥Ñ˙;±S
;\AŒ#Ú≤JêO<ê†Kue
kgÉÄ§DÅPŒrq1;Ô
;·”tÉ{KñÕ]w¡’}ÿ
©ç;øíÆ‡MåA˜¸™û{T
&—√n‡]⁄KØ;û
˘aûª;D°Oá
 Cã˛¡î
P∂\;zP∂NÆ¡¢fhú©√
Æ◊míÖ;°Jñ~dõ/øÚÄ≈
 M≤˝ˆ∏
´–Sïa;wL°≈¡œg™lª
$y>2Gä˚!«;ó
Ñ◊Aâ3;!–w>ëS
;âL$ªB¢ª–
eºî˙F®ÉSÇì;-≤S
Iç≈a2¢¸i;
‡ÿ8°ˆ;
°;;¨√F†˛M
ä‘;=ıj
õN;XÙÄ÷KªíR÷œHUy 
ù„zDæg4IûOr;
’‡˘rﬂPJMëo≥;œ-ﬁB"
’‡˘rﬂPJMëo≥;œ-ﬁB-
@ÜÒô1%È;Ë"
@ÜÒô1%È;Ë.
Cä1pE;¥º
jÚLî;5}†ÌyÑ
úﬂÀv™∑3Nü•õ;˚√„c$
úﬂÀv™∑3Nü•õ;˚√„cq
ı©£Dàz"û;A`†≈
æì}P;˚
;G´÷œ‘m¯~G*
;G´÷œ‘m¯~G˚
óTHÑ{_;R⁄Q&+
óTHÑ{_;R⁄Q&
lZ;E§P±ˆ˘C π-
˘a'¬Í∑Bø„]Açù;Û
ÒÛIûãmR¸º;h9
G°^ëÙÚ1o”;
 —<;?h™Môç•ØZüòU;
Cãˇ"Q;CÚV>
‰g;•†0MÜQ:âıπº^@
ñ≥fÏÄ»˘D≥àdÍÊ;L6R
8Há 4M+Y;ëT
K;Óñ‰ﬁW
;gG°Ä3ÒsFHÜh
Á˛O∂tÌVIáˆÊê.;òÆi
DÅ)¯P√}i;n
;˙/¯Xw
˛´T“@õÜ;˘TÑq™è
\Ày`AçÇZ≥Ñ˙;±ê
8KbUkí≠LîªıΩãë®;©
™áåEñ1I∞è$Bø;Pe≠
Ñ◊Aâ3;!–w>ë∞
Bº9≥”Ù"ë;±
eºî˙F®ÉSÇì;-≤±
õN;XÙÄ÷KªíR÷œHUyº
’‡˘rﬂPJMëo≥;œ-ﬁBæ
@ÜÒô1%È;Ëæ
úﬂÀv™∑3Nü•õ;˚√„c¿
;G´÷œ‘m¯~G∆
óTHÑ{_;R⁄Q&«
lZ;E§P±ˆ˘C π…
Z;Öj6sêO¢øÍky@‰»—
Z;Öj6sêO¢øÍky@‰»S
TÕ;oËÌQMÉÛmàáXxD—
TÕ;oËÌQMÉÛmàáXxD[
;ßÄ«\~@ûSØ}@üı«—
;ßÄ«\~@ûSØ}@üı«K
¯˚ç2;±§HæO}ê
‡Á¸Œ˙åBF∞π;/
ñ8~.Ô;
™Ø ;LCå5â©zÍMø≈
›;-ÒJ¢§S/¿
àŸC¶œ;'q˚Oh
Z;Öj6sêO¢øÍky@‰»ı
TÕ;oËÌQMÉÛmàáXxDı
;ßÄ«\~@ûSØ}@üı«ı
;√nQmÕ
êﬁM„VLÚN∫ßUs™Kñ”;
;X^5@ü
êÑ”7X;KªGûﬁV±ë˙%
êÑ”7X;KªGûﬁV±ë˙;
NæÆÄqæ∫;*<
ó±√;ÚM¢°
NæÆÄqæ∫;*
õ…;ÔÙ∞NíDK∫O6Ë¿&
õ…;ÔÙ∞NíDK∫O6Ë¿
v†S]¶Æ"Kª;ò_YIto<
BíGøW˚G∏ uGöÂ¬Ú;
v†S]¶Æ"Kª;ò_YIto
L•;Òâ‹ku–…
;{;uXÎ
õ…;ÔÙ∞NíDK∫O6Ë¿,
êÑ”7X;KªGûﬁV±ë˙4
——6¸'…;`
O;Å†ûÉ…
ßOlG;\·vX
ÿˇR:˘≤zñy;Ÿ
k“`·¿9j;
O©;êˇ˛åõ˙…
ÑËK1;≤‘…
æ;¡l,{3K¸V]ù˚
%∞2Çø;
ˇ†LœZ;Ár
Q;!ÎÙ2ÿ4CW{ÂkVƒ9∏›(…
_\õ=õ):;l˙<
>·-ˇ^;zÂ_
æDçŸ¯ÚòNá;*äm:T≈
æDçŸ¯ÚòNá;*äm:T≈c
ñ6sôRsHüeß;ÄÃSá
ñ6sôRsHüeß;ÄÃSác
Z◊;∫Äc
Z◊;∫Äcc
ád˘Ôn;…G¶ﬁ=m˙ÄD(Í
ád˘Ôn;…G¶ﬁ=m˙ÄD(ù
‰S∫Ì=M9O†<ù.Ü;mîö
T5`;BºÎ8
‰ˇ;πxyVbL}ÆÊ
;%ûEÆVπÁ\>≠@Í
Bà;r‚=µç¶ﬂ
ôÊÏ¶;.…
»8?ôk]•∏;C
// Shader generated by Niagara HLSL Translator
// SimStage[0] = ParticleSpawnUpdate
// SimStage[1] = Find Secondary Emission Points
// Compile Tags: 
// Compile Tags Editor Only: 
// Compile Data> Static Variables Input: 
// Compile Data> PinToConstantValues Input: 
int Index;
int AcquireTag;
int ID;
float Engine_WorldDeltaTime;
float Engine_DeltaTime;
float Engine_InverseDeltaTime;
float Engine_Time;
float Engine_RealTime;
int Engine_QualityLevel;
int Engine_PaddingInt32_0;
int Engine_PaddingInt32_1;
float PREV_Engine_WorldDeltaTime;
float PREV_Engine_DeltaTime;
float PREV_Engine_InverseDeltaTime;
float PREV_Engine_Time;
float PREV_Engine_RealTime;
int PREV_Engine_QualityLevel;
int PREV_Engine_PaddingInt32_0;
int PREV_Engine_PaddingInt32_1;
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
int Engine_Emitter_NumParticles;
int Engine_Emitter_TotalSpawnedParticles;
float Engine_Emitter_SpawnCountScale;
float Emitter_Age;
int Emitter_RandomSeed;
int Engine_Emitter_InstanceSeed;
int Engine_Emitter_PaddingInt32_0;
int Engine_Emitter_PaddingInt32_1;
int PREV_Engine_Emitter_NumParticles;
int PREV_Engine_Emitter_TotalSpawnedParticles;
float PREV_Engine_Emitter_SpawnCountScale;
float PREV_Emitter_Age;
int PREV_Emitter_RandomSeed;
int PREV_Engine_Emitter_InstanceSeed;
int PREV_Engine_Emitter_PaddingInt32_0;
int PREV_Engine_Emitter_PaddingInt32_1;
float4x4 Emitter_UnitToWorld;
float4x4 Emitter_WorldToUnit;
int Emitter_MaxSecondaryParticlesPerFrame;
float Emitter_DeltaTime;
float Emitter_dx;
int Emitter_SimGrid_VelocityIndex;
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
float2 SpriteSize;
float DeltaTime;
float3 Position;
float3 Velocity;
float Age;
float4 DynamicMaterialParameter;
NiagaraID ID;
float NormalizedAge;
FParamMap0_Particles_Previous Previous;
int State;
int UniqueID;
bool IsInsideBoundary;
FParamMap0_OUTPUT_VAR_Grid3D_Secondary_UpdateParticles Grid3D_Secondary_UpdateParticles;
FParamMap0_OUTPUT_VAR_ParticleState ParticleState;
float A;
float B;
int INT_VAR;
bool KillParticles;
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
float4x4 WorldToUnit;
float dx;
int MaxSecondaryParticlesPerFrame;
float4x4 UnitToWorld;
float SimDx;
int VelocityIndex;
float CurveIndex;
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
FParamMap0_Engine_Emitter Emitter;
int ExecIndex;
int ExecutionCount;
float InverseDeltaTime;
FParamMap0_Engine_Owner Owner;
int QualityLevel;
float RealTime;
FParamMap0_Engine_System System;
float Time;
float WorldDeltaTime;
int SimGrid_VelocityIndex;
float SpawnRate;
float Index0Param1;
float Index0Param2;
float Index0Param4;
bool Param0WriteEnabled;
bool Param1WriteEnabled;
bool Param2WriteEnabled;
bool Param3WriteEnabled;
bool Alive;
int Position;
int SpriteSize;
int Velocity;
int Age;
int DynamicMaterialParameter;
int Lifetime;
int NormalizedAge;
FParamMap0_Array_Previous Previous;
FParamMap0_Array Array;
FParamMap0_DataInstance DataInstance;
FParamMap0_DynamicMaterialParameters DynamicMaterialParameters;
FParamMap0_Emitter Emitter;
FParamMap0_Engine Engine;
FParamMap0_FloatFromCurve FloatFromCurve;
FParamMap0_Grid3D_Secondary_EmissionPoints Grid3D_Secondary_EmissionPoints;
FParamMap0_Grid3D_Secondary_SpawnParticles Grid3D_Secondary_SpawnParticles;
FParamMap0_Grid3D_Secondary_UpdateParticles Grid3D_Secondary_UpdateParticles;
FParamMap0_Interpolation Interpolation;
FParamMap0_KillParticles KillParticles;
FParamMap0_MakeFloatFromInt MakeFloatFromInt;
FParamMap0_Multiply_Float Multiply_Float;
FParamMap0_OUTPUT_VAR OUTPUT_VAR;
FParamMap0_Particles Particles;
FParamMap0_ParticleState ParticleState;
FParamMap0_ScratchModule ScratchModule;
FParamMap0_Transient Transient;
FParamMap0_Vector2DFromFloat001 Vector2DFromFloat001;
#if ((SimulationStageIndex == 0)) // MapSpawn
FParamMap0 MapSpawn;
#endif // MapSpawn
#if ((SimulationStageIndex == 0)) // MapUpdate
FParamMap0 MapUpdate;
#endif // MapUpdate
#if ((SimulationStageIndex == 1)) // MapSimStage1_FindSecondaryEmissionPoints
FParamMap0 MapSimStage1_FindSecondaryEmissionPoints;
#endif // MapSimStage1_FindSecondaryEmissionPoints
static float HackSpawnInterp = 1.0;
void CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_Func(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat_Emitter_Func(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void SampleCurve_Emitter_FloatFromCurve_FloatCurve(float In_X, out float Out_Value);
void FloatFromCurve_Emitter_Func(out float Out_Value, inout FSimulationContext Context);
void Vector2DFromFloat001_Emitter_Func(out float2 Out_Vec2, inout FSimulationContext Context);
void RandomRangeFloat001_Emitter_Func(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void ScratchModule_Emitter_Func(inout FSimulationContext Context);
void GetParticleNeighborCount_Emitter_EmissionCounter(int In_LINEAR_VAR, out int Out_NeighborCount);
void GetNumCells_Emitter_EmissionPositions(out int Out_NumCellsX, out int Out_NumCellsY);
void GetGridValue_Emitter_EmissionPositions(int In_IndexX, int In_IndexY, int In_AttributeIndex, out float Out_Value);
void SamplePreviousGridVector3Value_Emitter_SimGridReader_AttributeVelocity(float3 In_Unit, out float3 Out_Value);
void CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_Func(int In_Index, int In_MaxSecondaryParticlesPerFrame, int In_EmissionCount, float4x4 In_UnitToWorld, out float3 Out_World, out bool Out_IsAlive, out float3 Out_Velocity);
void GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_Func(int In_Seed, int In_Engine_System_TickCount, bool In_OverrideSeed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, bool In_FixedOverrideSeed, int In_RandomnessMode, out NiagaraRandInfo Out_RandomInfo, out bool Out_UseDeterministicRandoms, inout FSimulationContext Context);
void RandomRangeFloat_997IPWV7MOPKM3SJE09WFADXW_Func(float2 In_Min, float2 In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, bool In_FixedOverrideSeed, out float2 Out_Result, inout FSimulationContext Context);
void RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_Func(float In_Min, float In_Max, int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float Out_Result, inout FSimulationContext Context);
void RandomUnitVector_1XTBTP8Z17JA7EYERVF7HFALX_Func(int In_Seed, int In_RandomnessMode, bool In_OverrideSeed, out float3 Out_UnitVector3D, out float2 Out_UnitVector2D, inout FSimulationContext Context);
void RemapRange_9CEMVP2Y9L7A5KZT9CC77J5VD_Func(float3 In_Value, float3 In_InputMin, float3 In_InputMax, float3 In_OutputMin, float3 In_OutputMax, out float3 Out_NewOutput, inout FSimulationContext Context);
void Grid3D_Secondary_SpawnParticles_Emitter_Func(inout FSimulationContext Context);
void SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDF(float3 In_Unit, out float Out_Value);
void CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_Func(float3 In_Position, float3 In_CurrUnit, float3 In_InPosition, float In_SimDt, float3 In_Velocity, bool In_Alive, float3 In_BubbleBounancy, float3 In_Gravity, float In_FoamThickness, float In_FoamAgingRate, float In_SprayAgingRate, float In_BubbleAgingRate, int In_State, out float3 Out_OutPosition, out float3 Out_OutVelocity, out bool Out_OutAlive, out int Out_OutState, out float Out_AgingRate);
void SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundary(float3 In_Unit, out float Out_Value);
void CustomHlsl004D5BD41E323C19E965FAFC1A24195BB5964703C53_Func(float In_Mask, out bool Out_IsInside);
void Grid3D_Secondary_UpdateParticles_Emitter_Func(inout FSimulationContext Context);
void MakeFloatFromInt_Emitter_Func(out float Out_Output, inout FSimulationContext Context);
void CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_Func(int In_Engine_System_RandomSeed, float In_FloatMin, float In_FloatMax, int In_Seed, int In_Particles_UniqueID, int In_Emitter_RandomSeed, int In_Engine_Emitter_InstanceSeed, out float Out_RandomFloat, out bool Out_IsDeterministic, inout FSimulationContext Context);
void RandomRangeFloat002_Emitter_Func(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void RandomRangeFloat003_Emitter_Func(out float Out_UniformRangedFloat, inout FSimulationContext Context);
void DynamicMaterialParameters_Emitter_Func(inout FSimulationContext Context);
void Multiply_Float_Emitter_Func(out float Out_Result, inout FSimulationContext Context);
void ParticleState_Emitter_Func(inout FSimulationContext Context);
void KillParticles_Emitter_Func(inout FSimulationContext Context);
void ExecutionIndexToGridIndex_Emitter_SimGridReader(out int Out_IndexX, out int Out_IndexY, out int Out_IndexZ);
void GetGridValue_Emitter_SimGridReader(int In_IndexX, int In_IndexY, int In_IndexZ, int In_AttributeIndex, out float Out_Value);
void CustomHlslADE88DC393864046574424524848D3E7AACA6FE3Emitter_SimGridReader_Func(float In_dx, int In_VectorIndex, int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_curl);
void ExecutionIndexToUnit_Emitter_SimGridReader(out float3 Out_Unit);
void GetPreviousVectorValue_Emitter_SimGridReader_AttributeVelocity(int In_IndexX, int In_IndexY, int In_IndexZ, out float3 Out_Value);
void SetParticleNeighborCount_Emitter_EmissionCounter(int In_LINEAR_VAR, int In_Increment, out int Out_PrevNeighborCount);
void SetGridValue_Emitter_EmissionPositions(int In_IndexX, int In_IndexY, int In_AttributeIndex, float In_Value, out int Out_IGNORE);
void CustomHlslA22F24A7BBCC429CFF2215CAD0197E160275E371Emitter_EmissionCounterEmitter_EmissionPositions_Func(int In_IndexX, int In_IndexY, int In_IndexZ, float In_SimDt, float In_EmissionMult, float In_VorticityMagnitude, float In_MinEmitVorticity, float In_MaxEmitVorticity, int In_MaxSecondaryParticlesPerFrame, float3 In_CurrUnit, float In_SDFValue, float In_MinEmitVelocityMagnitude, float In_MaxEmitVelocityMagnitude, float In_VelocityMagnitude, float In_VorticityEmissionMult, float In_VelocityEmissionMult, float In_Random0To1, float2 In_EmissionClamp, float In_SDFMinValue, float In_SDFMaxValue, float In_AccelMagnitude, float In_MinEmitAccelMagnitude, float In_MaxEmitAccelMagnitude, float In_AccelEmissionMult, inout FSimulationContext Context);
void Grid3D_Secondary_EmissionPoints_Emitter_Func(inout FSimulationContext Context);
float GetSpawnInterpolation();
// CalculateRandomRangeFloat
// Evaluation Type=NewEnumerator0
// Fixed Random Seed=false
// Override Seed=false
// Randomness Mode=NewEnumerator0
// ScriptUsage=4
// Usage=Particle
// Script.Usage=0
// Emitter.Determinism=0
// Script.Context=2
// Input - [NiagaraInt32 Engine.System.RandomSeed;NiagaraFloat Float Min;NiagaraFloat Float Max;NiagaraInt32 Seed;NiagaraInt32 Particles.UniqueID;NiagaraInt32 Emitter.RandomSeed;NiagaraInt32 Engine.Emitter.InstanceSeed;]
// Output - [NiagaraFloat RandomFloat;NiagaraBool IsDeterministic;]
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
float CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_RandomFloat;
bool CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_IsDeterministic;
CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_Func(Constant11, Constant12, Constant13, Constant14, Constant15, Constant16, Constant17, CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_RandomFloat, CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_RandomFloat;
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
float CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_RandomFloat1;
bool CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_IsDeterministic1;
CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_Func(Constant24, Constant25, Constant26, Constant27, Constant28, Constant29, Constant30, CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_RandomFloat1, CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_IsDeterministic1, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_AV3OE82I7LQD528ULYBC7G9FV_FuncOutput_RandomFloat1;
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
// GetRandomInfo
// Emitter.Determinism_false
// Input - [NiagaraInt32 Seed;NiagaraInt32 Engine.System.TickCount;NiagaraBool OverrideSeed;NiagaraInt32 Particles.UniqueID;NiagaraInt32 Emitter.RandomSeed;NiagaraBool Fixed Override Seed;ENiagaraRandomnessMode RandomnessMode;]
// Output - [NiagaraRandInfo RandomInfo;NiagaraBool Use Deterministic Randoms;]
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
// RandomRangeFloat
// Input - [Vector2f Min;Vector2f Max;NiagaraInt32 Seed;ENiagaraRandomnessMode RandomnessMode;NiagaraBool OverrideSeed;NiagaraBool Fixed Override Seed;]
// Output - [Vector2f Result;]
int Constant50 = (0);
bool Constant51 = false;
int Constant52 = 0;
int Constant53 = (0);
NiagaraRandInfo GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo;
bool GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_UseDeterministicRandoms;
GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_Func(In_Seed, Constant50, In_OverrideSeed, Constant52, Constant53, In_FixedOverrideSeed, In_RandomnessMode, GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo, GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_UseDeterministicRandoms, Context);
float2 Result9 = In_Max - In_Min;
int Seed1;
int Seed2;
int Seed3;
Seed1 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo.Seed1;
Seed2 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo.Seed2;
Seed3 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo.Seed3;
float2 Result10 = rand_float(Result9, Seed1, Seed2, Seed3);
float2 Result11 = rand_float(Result9);
float2 Random_IfResult;
Random_IfResult = Result10;
Random_IfResult = Result11;
float2 Result12 = In_Min + Random_IfResult;
Out_Result = Result12;
// Input - [NiagaraFloat Min;NiagaraFloat Max;NiagaraInt32 Seed;ENiagaraRandomnessMode RandomnessMode;NiagaraBool OverrideSeed;]
// Output - [NiagaraFloat Result;]
int Constant67 = (0);
bool Constant68 = false;
int Constant69 = 0;
int Constant70 = (0);
bool Constant71 = false;
NiagaraRandInfo GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo1;
bool GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_UseDeterministicRandoms1;
GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_Func(In_Seed, Constant67, In_OverrideSeed, Constant69, Constant70, Constant71, In_RandomnessMode, GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo1, GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_UseDeterministicRandoms1, Context);
float Result20 = In_Max - In_Min;
int Seed11;
int Seed21;
int Seed31;
Seed11 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo1.Seed1;
Seed21 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo1.Seed2;
Seed31 = GetRandomInfo_6RFAH35H9YEKLQZW0ZJPKZC3S_FuncOutput_RandomInfo1.Seed3;
float Result21 = rand_float(Result20, Seed11, Seed21, Seed31);
float Result22 = rand_float(Result20);
float Random_IfResult1;
Random_IfResult1 = Result21;
Random_IfResult1 = Result22;
float Result23 = In_Min + Random_IfResult1;
Out_Result = Result23;
// RandomUnitVector
// Input - [NiagaraInt32 Seed;ENiagaraRandomnessMode RandomnessMode;NiagaraBool Override Seed;]
// Output - [Vector3f Unit Vector 3D;Vector2f Unit Vector 2D;]
float2 Constant47 = float2(0,-1);
float2 Constant48 = float2(6.28319,1);
bool Constant49 = false;
float2 RandomRangeFloat_997IPWV7MOPKM3SJE09WFADXW_FuncOutput_Result;
RandomRangeFloat_997IPWV7MOPKM3SJE09WFADXW_Func(Constant47, Constant48, In_Seed, In_RandomnessMode, In_OverrideSeed, Constant49, RandomRangeFloat_997IPWV7MOPKM3SJE09WFADXW_FuncOutput_Result, Context);
float Phi;
float CosASC40ThetaASC41;
Phi = RandomRangeFloat_997IPWV7MOPKM3SJE09WFADXW_FuncOutput_Result.x;
CosASC40ThetaASC41 = RandomRangeFloat_997IPWV7MOPKM3SJE09WFADXW_FuncOutput_Result.y;
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
float RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_FuncOutput_Result;
RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_Func(Constant62, Constant63, Constant64, Constant65, Constant66, RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_FuncOutput_Result, Context);
float Result24 = cos(RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_FuncOutput_Result);
float Result25 = sin(RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_FuncOutput_Result);
float2 PositionOnCircle;
PositionOnCircle.x = Result24;
PositionOnCircle.y = Result25;
Out_UnitVector3D = PositionOnSphere;
Out_UnitVector2D = PositionOnCircle;
// RemapRange
// Clamp Results=true
// Input - [Vector3f Value;Vector3f Input Min;Vector3f Input Max;Vector3f Output Min;Vector3f Output Max;]
// Output - [Vector3f NewOutput;]
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
int Constant43 = 0;
int GetParticleNeighborCount_Emitter_EmissionCounterOutput_NeighborCount;
GetParticleNeighborCount_Emitter_EmissionCounter(Constant43, GetParticleNeighborCount_Emitter_EmissionCounterOutput_NeighborCount);
float3 CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_World;
bool CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_IsAlive;
float3 CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_Velocity;
CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_Func(Result4, Context.MapSpawn.Grid3D_Secondary_SpawnParticles.MaxSecondaryParticlesPerFrame, GetParticleNeighborCount_Emitter_EmissionCounterOutput_NeighborCount, Context.MapSpawn.Grid3D_Secondary_SpawnParticles.UnitToWorld, CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_World, CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_IsAlive, CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_Velocity);
int Constant44 = -1;
int Constant45 = 0;
bool Constant46 = false;
float3 RandomUnitVector_1XTBTP8Z17JA7EYERVF7HFALX_FuncOutput_UnitVector3D;
float2 RandomUnitVector_1XTBTP8Z17JA7EYERVF7HFALX_FuncOutput_UnitVector2D;
RandomUnitVector_1XTBTP8Z17JA7EYERVF7HFALX_Func(Constant44, Constant45, Constant46, RandomUnitVector_1XTBTP8Z17JA7EYERVF7HFALX_FuncOutput_UnitVector3D, RandomUnitVector_1XTBTP8Z17JA7EYERVF7HFALX_FuncOutput_UnitVector2D, Context);
float3 Result26 = RandomUnitVector_1XTBTP8Z17JA7EYERVF7HFALX_FuncOutput_UnitVector3D * Constant39;
float3 Result27 = lerp(Result26,CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_Velocity,Constant41);
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
float RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_FuncOutput_Result1;
RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_Func(Constant72, Constant73, Constant74, Constant75, Constant76, RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_FuncOutput_Result1, Context);
float3 Result33 = Result32 * Context.MapSpawn.Grid3D_Secondary_SpawnParticles.SimDt * Constant37 * RandomRangeFloat_A1PYV2PYSPF5RZOBZN3JSJFNC_FuncOutput_Result1;
float3 Result34 = CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_World + Result33;
float3 Constant77 = float3(1,1,1);
float3 Result35 = rand_float(Constant77);
float3 Constant78 = float3(0,0,0);
float3 Constant79 = float3(1,1,1);
float3 Constant80 = float3(-1,-1,-1);
float3 Constant81 = float3(1,1,1);
float3 RemapRange_9CEMVP2Y9L7A5KZT9CC77J5VD_FuncOutput_NewOutput;
RemapRange_9CEMVP2Y9L7A5KZT9CC77J5VD_Func(Result35, Constant78, Constant79, Constant80, Constant81, RemapRange_9CEMVP2Y9L7A5KZT9CC77J5VD_FuncOutput_NewOutput, Context);
float Constant84 = 0.5;
float3 Result41 = RemapRange_9CEMVP2Y9L7A5KZT9CC77J5VD_FuncOutput_NewOutput * Constant38 * Context.MapSpawn.Grid3D_Secondary_SpawnParticles.dx * Constant84;
float3 Result42 = Result34 + Result41;
Context.MapSpawn.Particles.Position = Result42;
Context.MapSpawn.DataInstance.Alive = CustomHlslB7FF5E66D1EDABB8FD90BC47E281F1B196A15469Emitter_EmissionPositionsEmitter_SimGridReader_FuncOutput_IsAlive;
Context.MapSpawn.Particles.Velocity = Result32;
Out_OutPosition = In_Position;
Out_OutVelocity = In_Velocity;
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
Out_IsInside = round(In_Mask) == 1;
float3 Constant91 = float3(0,0,980);
float3 Constant92 = float3(0,0,-980);
float Constant93 = 1;
float3 Result43 = mul(float4(((float3)Context.MapUpdate.Particles.Position),1.0),Context.MapUpdate.Grid3D_Secondary_UpdateParticles.WorldToUnit).xyz;
float Constant94 = 1;
float Constant95 = 1;
float Constant96 = 1;
float3 CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutPosition;
float3 CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutVelocity;
bool CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutAlive;
int CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutState;
float CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_AgingRate;
CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_Func(Context.MapUpdate.Particles.Position, Result43, Context.MapUpdate.Particles.Position, Context.MapUpdate.Grid3D_Secondary_UpdateParticles.SimDt, Context.MapUpdate.Particles.Velocity, Context.MapUpdate.DataInstance.Alive, Constant91, Constant92, Constant93, Constant94, Constant95, Constant96, Context.MapUpdate.Particles.State, CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutPosition, CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutVelocity, CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutAlive, CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutState, CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_AgingRate);
Context.MapUpdate.Particles.Position = CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutPosition;
Context.MapUpdate.Particles.Velocity = CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutVelocity;
Context.MapUpdate.DataInstance.Alive = CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_OutAlive;
Context.MapUpdate.Transient.AgingRate = CustomHlsl5FE505E1690F45BC7C53AAD0B520F3A6BB5B9DECEmitter_SimGridReaderEmitter_SDFReader_FuncOutput_AgingRate;
float SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundaryOutput_Value;
SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundary(Result43, SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundaryOutput_Value);
bool CustomHlsl004D5BD41E323C19E965FAFC1A24195BB5964703C53_FuncOutput_IsInside;
CustomHlsl004D5BD41E323C19E965FAFC1A24195BB5964703C53_Func(SamplePreviousGridFloatValue_Emitter_BoundaryReader_AttributeBoundaryOutput_Value, CustomHlsl004D5BD41E323C19E965FAFC1A24195BB5964703C53_FuncOutput_IsInside);
Context.MapUpdate.OUTPUT_VAR.Grid3D_Secondary_UpdateParticles.IsInsideBoundary = CustomHlsl004D5BD41E323C19E965FAFC1A24195BB5964703C53_FuncOutput_IsInside;
float NiagaraFloat;
NiagaraFloat = Context.MapUpdate.MakeFloatFromInt.INT_VAR;
Out_Output = NiagaraFloat;
// ScriptUsage=5
// Script.Usage=1
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
int Constant106 = 0;
int Constant107 = 0;
int Constant108 = (0);
int Constant109 = (0);
float CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_RandomFloat;
bool CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_IsDeterministic;
CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_Func(Constant103, Constant104, Constant105, Constant106, Constant107, Constant108, Constant109, CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_RandomFloat, CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_IsDeterministic, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_RandomFloat;
int Constant115 = (0);
float Constant116 = 0;
float Constant117 = 1;
int Constant118 = 0;
int Constant119 = 0;
int Constant120 = (0);
int Constant121 = (0);
float CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_RandomFloat1;
bool CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_IsDeterministic1;
CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_Func(Constant115, Constant116, Constant117, Constant118, Constant119, Constant120, Constant121, CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_RandomFloat1, CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_IsDeterministic1, Context);
Out_UniformRangedFloat = CalculateRandomRangeFloat_3NCC38XAU92ML196HZ4QDCVVE_FuncOutput_RandomFloat1;
float Constant124 = 0;
float X;
float Y;
float Z;
float W;
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
bool bool_IfResult;
bool_IfResult = Context.MapUpdate.DataInstance.Alive;
bool_IfResult = Constant127;
float Result53 = Result49 / Result50;
Context.MapUpdate.DataInstance.Alive = bool_IfResult;
Context.MapUpdate.Particles.Age = Result49;
Context.MapUpdate.Particles.NormalizedAge = Result53;
bool Constant128 = false;
bool Constant129 = true;
bool Constant130 = false;
bool bool_IfResult1;
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
float3 CustomHlslADE88DC393864046574424524848D3E7AACA6FE3Emitter_SimGridReader_FuncOutput_curl;
CustomHlslADE88DC393864046574424524848D3E7AACA6FE3Emitter_SimGridReader_Func(Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.SimDx, Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.VelocityIndex, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY1, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ1, CustomHlslADE88DC393864046574424524848D3E7AACA6FE3Emitter_SimGridReader_FuncOutput_curl);
float Result54 = length(CustomHlslADE88DC393864046574424524848D3E7AACA6FE3Emitter_SimGridReader_FuncOutput_curl);
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
CustomHlslA22F24A7BBCC429CFF2215CAD0197E160275E371Emitter_EmissionCounterEmitter_EmissionPositions_Func(ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexX, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexY, ExecutionIndexToGridIndex_Emitter_SimGridReaderOutput_IndexZ, Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.SimDt, Constant144, Result54, Constant145, Constant146, Context.MapSimStage1_FindSecondaryEmissionPoints.Grid3D_Secondary_EmissionPoints.MaxSecondaryParticlesPerFrame, ExecutionIndexToUnit_Emitter_SimGridReaderOutput_Unit, SamplePreviousGridFloatValue_Emitter_SDFReader_AttributeSDFOutput_Value, Constant147, Constant148, Result55, Constant149, Constant150, Result56, Constant151, Constant152, Constant153, Constant158, Constant154, Constant155, Constant156, Context);
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
#if (SimulationStageIndex == 0) // MapSpawn
Context.MapSpawn.Particles.Previous.Position = Context.MapSpawn.Particles.Position;
Context.MapSpawn.Particles.Previous.SpriteSize = Context.MapSpawn.Particles.SpriteSize;
Context.MapSpawn.Particles.Previous.Velocity = Context.MapSpawn.Particles.Velocity;
//Begin Interpolated Spawn Script!
//Begin Initialize Parameter Map Defaults
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
//End Initialize Parameter Map Defaults
float Constant8 = 0;
float Constant9 = 1;
int Constant10 = 0;
float RandomRangeFloat_Emitter_FuncOutput_UniformRangedFloat;
RandomRangeFloat_Emitter_Func(RandomRangeFloat_Emitter_FuncOutput_UniformRangedFloat, Context);
Context.MapSpawn.FloatFromCurve.CurveIndex = RandomRangeFloat_Emitter_FuncOutput_UniformRangedFloat;
float Constant19 = 1.5;
float FloatFromCurve_Emitter_FuncOutput_Value;
FloatFromCurve_Emitter_Func(FloatFromCurve_Emitter_FuncOutput_Value, Context);
Context.MapSpawn.Vector2DFromFloat001.Value = FloatFromCurve_Emitter_FuncOutput_Value;
float2 Vector2DFromFloat001_Emitter_FuncOutput_Vec2;
Vector2DFromFloat001_Emitter_Func(Vector2DFromFloat001_Emitter_FuncOutput_Vec2, Context);
float Constant21 = 2;
float Constant22 = 3;
int Constant23 = 0;
float RandomRangeFloat001_Emitter_FuncOutput_UniformRangedFloat;
RandomRangeFloat001_Emitter_Func(RandomRangeFloat001_Emitter_FuncOutput_UniformRangedFloat, Context);
Context.MapSpawn.ScratchModule.SpriteSize = Vector2DFromFloat001_Emitter_FuncOutput_Vec2;
Context.MapSpawn.ScratchModule.Lifetime = RandomRangeFloat001_Emitter_FuncOutput_UniformRangedFloat;
EnterStatScope(1 /**ScratchModule_Emitter_Func*/);
ScratchModule_Emitter_Func(Context);
ExitStatScope(/**ScratchModule_Emitter_Func*/);
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.MaxSecondaryParticlesPerFrame = Context.MapSpawn.Emitter.MaxSecondaryParticlesPerFrame;
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.SimDt = Context.MapSpawn.Emitter.DeltaTime;
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.UnitToWorld = Context.MapSpawn.Emitter.UnitToWorld;
Context.MapSpawn.Grid3D_Secondary_SpawnParticles.dx = Context.MapSpawn.Emitter.dx;
float Constant31 = 1;
float Constant32 = 0;
float Constant33 = 0;
float Constant34 = 1;
float Constant35 = 1;
float Constant36 = 1000;
EnterStatScope(2 /**Grid3D_Secondary_SpawnParticles_Emitter_Func*/);
Grid3D_Secondary_SpawnParticles_Emitter_Func(Context);
ExitStatScope(/**Grid3D_Secondary_SpawnParticles_Emitter_Func*/);
//End Spawn Script!
//Handle resetting previous values at the end of spawn so that they match outputs! (Needed for motion blur/etc)
HandlePreviousValuesForSpawn(Context);
// Begin HandleMissingDefaultValues
// End HandleMissingDefaultValues
//Begin Update Script!
RandomCounterDeterministic = 0;
Context.MapUpdate.Grid3D_Secondary_UpdateParticles.WorldToUnit = Context.MapUpdate.Emitter.WorldToUnit;
Context.MapUpdate.Grid3D_Secondary_UpdateParticles.SimDt = Context.MapUpdate.Emitter.DeltaTime;
float3 Constant85 = float3(0,0,980);
float3 Constant86 = float3(0,0,-980);
float Constant87 = 1;
float Constant88 = 1;
float Constant89 = 1;
float Constant90 = 1;
EnterStatScope(3 /**Grid3D_Secondary_UpdateParticles_Emitter_Func*/);
Grid3D_Secondary_UpdateParticles_Emitter_Func(Context);
ExitStatScope(/**Grid3D_Secondary_UpdateParticles_Emitter_Func*/);
Context.MapUpdate.MakeFloatFromInt.INT_VAR = Context.MapUpdate.Particles.State;
bool Constant97 = true;
bool Constant98 = true;
bool Constant99 = false;
float MakeFloatFromInt_Emitter_FuncOutput_Output;
MakeFloatFromInt_Emitter_Func(MakeFloatFromInt_Emitter_FuncOutput_Output, Context);
float Constant100 = 0;
float Constant101 = 1;
int Constant102 = 0;
float RandomRangeFloat002_Emitter_FuncOutput_UniformRangedFloat;
RandomRangeFloat002_Emitter_Func(RandomRangeFloat002_Emitter_FuncOutput_UniformRangedFloat, Context);
float Constant112 = 0;
float Constant113 = 1;
int Constant114 = 0;
float RandomRangeFloat003_Emitter_FuncOutput_UniformRangedFloat;
RandomRangeFloat003_Emitter_Func(RandomRangeFloat003_Emitter_FuncOutput_UniformRangedFloat, Context);
Context.MapUpdate.DynamicMaterialParameters.Param0WriteEnabled = Constant97;
Context.MapUpdate.DynamicMaterialParameters.Param1WriteEnabled = Constant98;
Context.MapUpdate.DynamicMaterialParameters.Param2WriteEnabled = Constant99;
Context.MapUpdate.DynamicMaterialParameters.Index0Param4 = MakeFloatFromInt_Emitter_FuncOutput_Output;
Context.MapUpdate.DynamicMaterialParameters.Index0Param1 = RandomRangeFloat002_Emitter_FuncOutput_UniformRangedFloat;
Context.MapUpdate.DynamicMaterialParameters.Index0Param2 = RandomRangeFloat003_Emitter_FuncOutput_UniformRangedFloat;
float Constant122 = 0;
bool Constant123 = true;
Context.MapUpdate.DynamicMaterialParameters.Param3WriteEnabled = Constant123;
EnterStatScope(4 /**DynamicMaterialParameters_Emitter_Func*/);
DynamicMaterialParameters_Emitter_Func(Context);
ExitStatScope(/**DynamicMaterialParameters_Emitter_Func*/);
Context.MapUpdate.Multiply_Float.A = Context.MapUpdate.Emitter.DeltaTime;
Context.MapUpdate.Multiply_Float.B = Context.MapUpdate.Transient.AgingRate;
float Multiply_Float_Emitter_FuncOutput_Result;
Multiply_Float_Emitter_Func(Multiply_Float_Emitter_FuncOutput_Result, Context);
Context.MapUpdate.ParticleState.DeltaTime = Multiply_Float_Emitter_FuncOutput_Result;
Context.MapUpdate.ParticleState.Lifetime = Context.MapUpdate.Particles.Lifetime;
EnterStatScope(5 /**ParticleState_Emitter_Func*/);
ParticleState_Emitter_Func(Context);
ExitStatScope(/**ParticleState_Emitter_Func*/);
Context.MapUpdate.KillParticles.KillParticles = Context.MapUpdate.OUTPUT_VAR.Grid3D_Secondary_UpdateParticles.IsInsideBoundary;
EnterStatScope(6 /**KillParticles_Emitter_Func*/);
KillParticles_Emitter_Func(Context);
ExitStatScope(/**KillParticles_Emitter_Func*/);
//End Update Script!
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
EnterStatScope(7 /**Grid3D_Secondary_EmissionPoints_Emitter_Func*/);
Grid3D_Secondary_EmissionPoints_Emitter_Func(Context);
ExitStatScope(/**Grid3D_Secondary_EmissionPoints_Emitter_Func*/);
//End Simulation Stage Script: MapSimStage1_FindSecondaryEmissionPoints
// Copyright Epic Games, Inc. All Rights Reserved.
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
const float2 GridPos = UVW.xy * Emitter_EmissionPositions_NumCells.xy - .5;
// identify the lower-left-hand corner of the cell
const int2 GridCell = floor(GridPos);
const int2 MaxCell = Emitter_EmissionPositions_NumCells - int2(3,3);
// revert to bilinear hardware sampling at the boundary cells.
return Emitter_EmissionPositions_Grid.SampleLevel(Sampler, UVW, MipLevel);
const float2 t = frac(GridPos);
float4 GridVals;
float minv = 3.402823466e+38;
float maxv = -3.402823466e+38;
float4 InterpInX;
for (int j = 0; j < 4; ++j)
for (int i = 0; i < 4; ++i)
const float CurrValue = Emitter_EmissionPositions_Grid.Load(int4(GridCell.x + i - 1, GridCell.y + j - 1, AttributeIndex, MipLevel));
GridVals[i] = CurrValue;
minv = min(CurrValue, minv);
maxv = max(CurrValue, maxv);
InterpInX[j] = Basic1DCubic_Emitter_EmissionPositions(GridVals[0], GridVals[1], GridVals[2], GridVals[3], t[0]);
const float BiCubicValue = Basic1DCubic_Emitter_EmissionPositions(InterpInX[0], InterpInX[1], InterpInX[2], InterpInX[3], t[1]);
return BiCubicValue;
const int2 MaxCell = Emitter_EmissionPositions_NumCells - int2(2,2);
const float2 t = GridPos - GridCell;
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
float3 GridPos = float3(TotalDim[0] * UVW[0] - 0.5,  TotalDim[1] * UVW[1] - 0.5, TotalDim[2] * UVW[2] - 0.5f);
int3 GridCell = floor(GridPos);
float3 delta = float3( GridPos[0] - GridCell[0], GridPos[1] - GridCell[1], GridPos[2] - GridCell[2]);
// local values
float4 F; 
// bottom face
F[0] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1], GridCell[2], MipLevel) );
F[1] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1], GridCell[2], MipLevel) );
F[2] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2], MipLevel) );
F[3] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2], MipLevel) );
// bottom value
float BV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// top face
F[0] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1],     GridCell[2] + 1, MipLevel) );
F[1] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1],     GridCell[2] + 1, MipLevel) );
F[2] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0] + 1, GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
F[3] = Emitter_SimGridReader_Grid.Load( int4( GridCell[0],     GridCell[1] +1 , GridCell[2] + 1, MipLevel) );
// top value
float TV = (1.-delta.y) * (F[0] *(1.-delta.x) + F[1]*(delta.x)) + delta.y * (F[3]*(1.-delta.x) + F[2]*delta.x);
// interp between bottom and top
return TV * delta.z + BV * (1.-delta.z);
int3 LocalCell = GridCell % Emitter_SimGridReader_NumCells;
const int3 MaxCell = Emitter_SimGridReader_NumCells - int3(2,2,2);
// revert to trilinear hardware sampling at the boundary cells.
return Emitter_SimGridReader_Grid.SampleLevel(Sampler, UVW, MipLevel);
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
DataInX[xi] = Emitter_SimGridReader_Grid.Load(int4(col, row, plane, MipLevel)); 
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
float4x1 DataInZ;
float1 minv = 3.402823466e+38;
float1 maxv = -3.402823466e+38;
float4x1  DataInY;
float4x1 DataInX;
DataInX[xi] = Emitter_SDFReader_Grid.Load(int4(col, row, plane, MipLevel)); 
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
val = 0;
Emitter_EmissionPositions_OutputGrid[int3(In_IndexX, In_IndexY, In_AttributeIndex)] = In_Value;
Value = Emitter_SimGridReader_Grid.SampleLevel(Emitter_SimGridReader_GridSampler, Unit, 0).rgb;
Out_IndexX = GDispatchThreadId.x;
Out_IndexY = GDispatchThreadId.y;
Out_IndexZ = GDispatchThreadId.z;
const uint Linear = GLinearThreadId;
Out_IndexX = Linear % Emitter_SimGridReader_NumCells.x;
Out_IndexY = (Linear / Emitter_SimGridReader_NumCells.x) % Emitter_SimGridReader_NumCells.y;
Out_IndexZ = Linear / (Emitter_SimGridReader_NumCells.x * Emitter_SimGridReader_NumCells.y);
    Out_Val = 0;
    const float3 TmpVal = Emitter_SimGridReader_Grid.Load(int4(In_IndexX, In_IndexY, In_IndexZ, 0));
    if (In_AttributeIndex == 0)
        Out_Val = TmpVal.r;
    else if (In_AttributeIndex == 1)
        Out_Val = TmpVal.g;
    else if (In_AttributeIndex == 2)
        Out_Val = TmpVal.b;
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
Context.MapSpawn.Emitter.UnitToWorld = Emitter_UnitToWorld;
Context.MapSpawn.Emitter.dx = Emitter_dx;
Context.MapSpawn.Engine.Time = Engine_Time;
Context.MapSpawn.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapSpawn.Engine.System.TickCount = Engine_System_TickCount;
Context.MapUpdate.Emitter.WorldToUnit = Emitter_WorldToUnit;
Context.MapUpdate.Emitter.DeltaTime = Emitter_DeltaTime;
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
Context.MapSpawn.Particles.Position.x = 0.0f;
Context.MapSpawn.Particles.Position.y = 0.0f;
Context.MapSpawn.Particles.Position.z = 0.0f;
Context.MapSpawn.Particles.Previous.Position.x = 0.0f;
Context.MapSpawn.Particles.Previous.Position.y = 0.0f;
Context.MapSpawn.Particles.Previous.Position.z = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.Previous.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Previous.Velocity.z = 0.0f;
Context.MapSpawn.Particles.SpriteSize.x = 0.0f;
Context.MapSpawn.Particles.SpriteSize.y = 0.0f;
Context.MapSpawn.Particles.State = 0;
Context.MapSpawn.Particles.UniqueID = 0;
Context.MapSpawn.Particles.Velocity.x = 0.0f;
Context.MapSpawn.Particles.Velocity.y = 0.0f;
Context.MapSpawn.Particles.Velocity.z = 0.0f;
Context.MapSpawn.DataInstance.Alive=true;
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
Context.MapUpdate.DataInstance.Alive=true;
Context.MapUpdate.Engine.Emitter.ID.ID = 1;
InterpolateParameters(Context);
Context.MapUpdate.Particles = Context.MapSpawn.Particles;
Context.MapUpdate.DataInstance = Context.MapSpawn.DataInstance;
#elif ((SimulationStageIndex == 1)) // MapSimStage1_FindSecondaryEmissionPoints
const bool bValid = bIsValidInstance && Context.MapUpdate.DataInstance.Alive;
const int WriteIndex = OutputIndex(0, true, bValid);
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
#elif SimulationStageIndex == 1 // MapSimStage1_FindSecondaryEmissionPoints
const uint MaxInstances = SimulationStage_GetInstanceCount();
GLinearThreadId = all(GDispatchThreadId < DispatchThreadIdBounds) ? GLinearThreadId : MaxInstances;
GSpawnStartInstance = MaxInstances;
const bool bRunUpdateLogic = (GLinearThreadId < GSpawnStartInstance) && (SimStart != 1);
const bool bRunSpawnLogic = (GLinearThreadId < GSpawnStartInstance) && (SimStart == 1);
SimulateMapSimStage1_FindSecondaryEmissionPoints(Context);
öu˝i+;Î>£7ò…
FKÍõ/;ﬁH∂îø{FôH∏Ó
E5ˇ;£π
;Å(ê›JÕNúÎ§
jG<û;#
ê∫ÓvJº¨'úW'Ë;ƒ>ù∫åN:…
» òf;Ô
;Ä=Ä>Äˇˇ
| enter_stat_scope();
| R[0] = inputdata_float();
| O[479] = inputdata_float();
| O[184] = inputdata_float();
| O[189] = inputdata_float();
| O[188] = inputdata_int32();
| O[15] = inputdata_int32();
| O[125] = inputdata_int32();
| O[187] = inputdata_int32();
| O[168] = inputdata_float();
| O[13] = inputdata_float();
| O[14] = inputdata_float();
| O[137] = inputdata_float();
| R[0] = acquireindex(C[3]);
| O[147] = mul(I[6], I[1]);
| external_func_call(C[0], C[1], C[2], C[3]R[65535]);
| exit_stat_scope();
| external_func_call(C[4]O[479]);
| O[184] = cmpeqi(C[5], C[6]);
| O[189] = b2i(O[184]);
| O[13] = cmpeqi_select(O[189], C[4], I[11], I[11]);
| O[145] = cmpeqi_select(O[189], C[4], C[7], C[7]);
| outputdata_float(0, 112, R[0], I[3]);
| O[137] = cmpeqi_select(O[189], C[4], I[8], I[8]);
| O[15] = cmpeqi_select(O[189], C[4], I[9], I[10]);
| O[184] = b2i(O[184]);
| O[184] = cmpeqi_select(O[184], C[4], I[10], I[10]);
| outputdata_int32(0, 49, R[0], O[184]);
| external_func_call(C[8], C[9], C[2], C[3]R[65535]);
| O[759] = mul(I[5], I[0]);
| O[184] = max(O[759], O[147]);
| O[146] = mul(I[7], I[2]);
| O[189] = max(O[146], O[184]);
| O[184] = maxi(O[137], C[2]);
| O[125] = i2f_div1(O[184], O[189]);
| O[184] = div(O[759], O[125]);
| O[184] = floor(O[184]);
| O[184] = cmple_select(O[125], C[10], C[11], O[184]);
| O[187] = f2i(O[184]);
| O[184] = div(O[147], O[125]);
| O[168] = f2i(O[184]);
| O[184] = div(O[146], O[125]);
| O[188] = f2i(O[184]);
| O[184] = i2f_mul(O[168], O[125]);
| O[184] = sub(O[184], O[147]);
| O[184] = abs(O[184]);
| O[189] = cmpgt(O[759], O[146]);
| O[189] = cmpgt_logic_and(O[759], O[147], O[189]);
| O[184] = cmpgt_logic_and(O[184], C[10], O[189]);
| O[189] = addi(O[168], C[2]);
| O[168] = select(O[184], O[189], O[168]);
| O[184] = i2f_mul(O[188], O[125]);
| O[184] = sub(O[184], O[146]);
| O[189] = addi(O[188], C[2]);
| O[188] = select(O[184], O[189], O[188]);
| O[184] = i2f_mul(O[187], O[125]);
| O[184] = sub(O[184], O[759]);
| O[189] = cmpgt(O[147], O[146]);
| O[189] = cmpgt_logic_and(O[147], O[759], O[189]);
| O[189] = addi(O[187], C[2]);
| O[187] = select(O[184], O[189], O[187]);
| O[184] = select(O[184], O[189], O[188]);
| O[189] = i2f_mul(O[187], O[125]);
| O[189] = sub(O[189], O[759]);
| O[189] = abs(O[189]);
| O[188] = cmpgt(O[146], O[147]);
| O[188] = cmpgt_logic_and(O[146], O[759], O[188]);
| O[189] = cmpgt_logic_and(O[189], C[10], O[188]);
| O[188] = addi(O[187], C[2]);
| O[188] = select(O[189], O[188], O[187]);
| O[189] = i2f_mul(O[168], O[125]);
| O[189] = sub(O[189], O[147]);
| O[187] = cmpgt(O[146], O[147]);
| O[187] = cmpgt_logic_and(O[146], O[759], O[187]);
| outputdata_int32(0, 50, R[0], O[13]);
| O[189] = cmpgt_logic_and(O[189], C[10], O[187]);
| O[187] = addi(O[168], C[2]);
| O[189] = select(O[189], O[187], O[168]);
| O[207] = i2f_mul(O[188], O[125]);
| O[4] = i2f_mul(O[189], O[125]);
| O[288] = i2f_mul(O[184], O[125]);
| O[188] = i2f(O[188]);
| O[189] = i2f(O[189]);
| O[184] = i2f(O[184]);
| O[125] = f2i(O[188]);
| O[187] = f2i(O[189]);
| external_func_call(C[12], O[125], O[187], O[168]R[65535]);
| O[186] = div(O[207], O[188]);
| O[178] = div(O[4], O[189]);
| O[293] = div(O[288], O[184]);
| O[326] = f2i(O[188]);
| O[189] = f2i(O[189]);
| outputdata_int32(0, 14, R[0], C[6]);
| outputdata_int32(0, 26, R[0], O[189]);
| O[154] = f2i(O[184]);
| external_func_call(C[12]O[188], O[189], O[184]);
| external_func_call(C[13], O[125], O[187], O[168]R[65535]);
| O[160] = div(O[759], O[188]);
| O[161] = div(O[147], O[189]);
| O[162] = div(O[146], O[184]);
| O[14] = f2i(O[188]);
| O[13] = f2i(O[189]);
| O[133] = f2i(O[184]);
| external_func_call(C[12]O[184], O[188], O[189]);
| O[125] = i2f(O[188]);
| O[168] = i2f(O[189]);
| O[189] = f2i(O[184]);
| O[188] = f2i(O[125]);
| O[187] = f2i(O[168]);
| external_func_call(C[14], O[189], O[188], O[187]R[65535]);
| O[187] = div(O[759], O[184]);
| O[188] = div(O[147], O[125]);
| O[189] = div(O[146], O[168]);
| O[184] = f2i(O[184]);
| O[125] = f2i(O[125]);
| O[179] = f2i(O[168]);
| external_func_call(C[12]O[292], O[53], O[168]);
| O[292] = i2f(O[292]);
| O[53] = i2f(O[53]);
| O[168] = i2f(O[168]);
| O[202] = f2i(O[292]);
| O[205] = f2i(O[53]);
| O[206] = f2i(O[168]);
| external_func_call(C[15], O[202], O[205], O[206]R[65535]);
| O[202] = div(O[759], O[292]);
| outputdata_float(0, 0, R[0], C[34]);
| outputdata_float(0, 1, R[0], C[34]);
| outputdata_float(0, 2, R[0], C[34]);
| outputdata_float(0, 4, R[0], C[34]);
| outputdata_float(0, 5, R[0], C[34]);
| outputdata_float(0, 6, R[0], C[34]);
| outputdata_float(0, 7, R[0], C[34]);
| outputdata_float(0, 8, R[0], C[34]);
| outputdata_float(0, 9, R[0], C[34]);
| outputdata_float(0, 10, R[0], C[34]);
| outputdata_float(0, 11, R[0], C[34]);
| outputdata_float(0, 12, R[0], C[34]);
| outputdata_float(0, 13, R[0], C[34]);
| outputdata_float(0, 14, R[0], C[34]);
| outputdata_float(0, 15, R[0], C[34]);
| outputdata_float(0, 16, R[0], C[34]);
| outputdata_float(0, 17, R[0], C[34]);
| outputdata_float(0, 18, R[0], C[34]);
| outputdata_float(0, 19, R[0], C[34]);
| outputdata_float(0, 20, R[0], C[34]);
| outputdata_float(0, 21, R[0], C[34]);
| outputdata_float(0, 22, R[0], C[34]);
| outputdata_float(0, 23, R[0], C[34]);
| outputdata_float(0, 24, R[0], C[34]);
| outputdata_float(0, 25, R[0], C[34]);
| outputdata_float(0, 26, R[0], C[34]);
| outputdata_float(0, 27, R[0], C[34]);
| outputdata_float(0, 28, R[0], C[34]);
| outputdata_float(0, 29, R[0], C[34]);
| outputdata_float(0, 30, R[0], C[34]);
| outputdata_float(0, 31, R[0], C[34]);
| outputdata_float(0, 32, R[0], C[34]);
| outputdata_float(0, 33, R[0], C[34]);
| outputdata_float(0, 34, R[0], C[34]);
| outputdata_float(0, 35, R[0], C[34]);
| outputdata_float(0, 36, R[0], C[34]);
| outputdata_float(0, 37, R[0], C[34]);
| outputdata_float(0, 38, R[0], C[34]);
| outputdata_float(0, 39, R[0], C[34]);
| outputdata_float(0, 40, R[0], C[34]);
| outputdata_float(0, 41, R[0], C[34]);
| outputdata_float(0, 42, R[0], C[34]);
| outputdata_float(0, 43, R[0], C[34]);
| outputdata_float(0, 44, R[0], C[34]);
| outputdata_float(0, 45, R[0], C[34]);
| outputdata_float(0, 46, R[0], C[34]);
| outputdata_float(0, 47, R[0], C[34]);
| outputdata_float(0, 49, R[0], C[34]);
| outputdata_float(0, 50, R[0], C[34]);
| outputdata_float(0, 51, R[0], C[34]);
| outputdata_float(0, 52, R[0], C[34]);
| outputdata_float(0, 53, R[0], C[34]);
| outputdata_float(0, 54, R[0], C[34]);
| outputdata_float(0, 55, R[0], C[34]);
| outputdata_float(0, 56, R[0], C[34]);
| outputdata_float(0, 57, R[0], C[34]);
| outputdata_float(0, 58, R[0], C[34]);
| outputdata_float(0, 59, R[0], C[34]);
| outputdata_float(0, 60, R[0], C[34]);
| outputdata_float(0, 61, R[0], C[34]);
| outputdata_float(0, 62, R[0], C[34]);
| outputdata_float(0, 63, R[0], C[34]);
| outputdata_float(0, 64, R[0], C[34]);
| outputdata_float(0, 65, R[0], C[34]);
| outputdata_float(0, 66, R[0], C[34]);
| outputdata_float(0, 67, R[0], C[34]);
| outputdata_float(0, 68, R[0], C[34]);
| outputdata_float(0, 69, R[0], C[34]);
| outputdata_float(0, 70, R[0], C[34]);
| outputdata_float(0, 71, R[0], C[34]);
| outputdata_float(0, 72, R[0], C[34]);
| outputdata_float(0, 73, R[0], C[34]);
| outputdata_float(0, 74, R[0], C[34]);
| outputdata_float(0, 75, R[0], C[34]);
| outputdata_float(0, 76, R[0], C[34]);
| outputdata_float(0, 77, R[0], C[34]);
| outputdata_float(0, 78, R[0], C[34]);
| outputdata_float(0, 79, R[0], C[34]);
| outputdata_float(0, 80, R[0], C[34]);
| outputdata_float(0, 81, R[0], C[34]);
| outputdata_float(0, 82, R[0], C[34]);
| outputdata_float(0, 83, R[0], C[34]);
| outputdata_float(0, 84, R[0], C[34]);
| outputdata_float(0, 85, R[0], C[34]);
| outputdata_float(0, 86, R[0], C[34]);
| outputdata_float(0, 87, R[0], C[34]);
| outputdata_float(0, 88, R[0], C[34]);
| outputdata_float(0, 89, R[0], C[34]);
| outputdata_float(0, 90, R[0], C[34]);
| outputdata_float(0, 91, R[0], C[34]);
| outputdata_float(0, 92, R[0], C[34]);
| outputdata_float(0, 93, R[0], C[34]);
| outputdata_float(0, 94, R[0], C[34]);
| outputdata_float(0, 95, R[0], C[34]);
| outputdata_float(0, 96, R[0], C[34]);
| outputdata_float(0, 97, R[0], C[34]);
| outputdata_float(0, 98, R[0], C[34]);
| outputdata_float(0, 99, R[0], C[34]);
| outputdata_float(0, 100, R[0], C[34]);
| outputdata_float(0, 101, R[0], C[34]);
| outputdata_float(0, 102, R[0], C[34]);
| outputdata_float(0, 103, R[0], C[34]);
| outputdata_float(0, 104, R[0], C[34]);
| outputdata_float(0, 105, R[0], C[34]);
| outputdata_float(0, 106, R[0], C[34]);
| outputdata_float(0, 107, R[0], C[34]);
| outputdata_float(0, 121, R[0], C[34]);
| outputdata_float(0, 122, R[0], C[34]);
| outputdata_float(0, 135, R[0], O[202]);
| outputdata_float(0, 165, R[0], C[34]);
| outputdata_float(0, 166, R[0], C[34]);
| outputdata_float(0, 167, R[0], C[34]);
| outputdata_float(0, 168, R[0], C[34]);
| outputdata_float(0, 169, R[0], C[34]);
| outputdata_float(0, 170, R[0], C[34]);
| outputdata_float(0, 171, R[0], C[34]);
| outputdata_float(0, 172, R[0], C[34]);
| outputdata_float(0, 173, R[0], C[34]);
| outputdata_float(0, 175, R[0], C[34]);
| outputdata_float(0, 176, R[0], C[34]);
| outputdata_float(0, 177, R[0], C[34]);
| outputdata_float(0, 178, R[0], C[34]);
| outputdata_float(0, 179, R[0], C[34]);
| outputdata_float(0, 180, R[0], C[34]);
| outputdata_float(0, 181, R[0], C[34]);
| outputdata_float(0, 182, R[0], C[34]);
| outputdata_float(0, 183, R[0], C[34]);
| outputdata_float(0, 184, R[0], C[34]);
| outputdata_float(0, 185, R[0], C[34]);
| outputdata_float(0, 186, R[0], C[34]);
| outputdata_float(0, 187, R[0], C[34]);
| outputdata_float(0, 188, R[0], C[34]);
| outputdata_float(0, 189, R[0], C[34]);
| outputdata_float(0, 190, R[0], C[34]);
| outputdata_float(0, 191, R[0], C[34]);
| outputdata_float(0, 192, R[0], C[34]);
| outputdata_float(0, 193, R[0], C[34]);
| outputdata_float(0, 194, R[0], C[34]);
| outputdata_float(0, 195, R[0], C[34]);
| outputdata_float(0, 196, R[0], C[34]);
| outputdata_float(0, 197, R[0], C[34]);
| outputdata_float(0, 198, R[0], C[34]);
| outputdata_float(0, 199, R[0], C[34]);
| outputdata_float(0, 200, R[0], C[34]);
| outputdata_float(0, 201, R[0], C[34]);
| outputdata_float(0, 202, R[0], C[34]);
| outputdata_float(0, 203, R[0], C[34]);
| outputdata_float(0, 204, R[0], C[34]);
| outputdata_float(0, 205, R[0], C[34]);
| outputdata_float(0, 206, R[0], C[34]);
| outputdata_float(0, 207, R[0], C[34]);
| outputdata_float(0, 208, R[0], C[34]);
| outputdata_float(0, 209, R[0], C[34]);
| outputdata_float(0, 210, R[0], C[34]);
| outputdata_float(0, 211, R[0], C[34]);
| outputdata_float(0, 212, R[0], C[34]);
| outputdata_float(0, 214, R[0], C[34]);
| outputdata_float(0, 215, R[0], C[34]);
| outputdata_float(0, 216, R[0], C[34]);
| outputdata_float(0, 217, R[0], C[34]);
| outputdata_float(0, 218, R[0], C[34]);
| outputdata_float(0, 219, R[0], C[34]);
| outputdata_float(0, 220, R[0], C[34]);
| outputdata_float(0, 221, R[0], C[34]);
| outputdata_float(0, 222, R[0], C[34]);
| outputdata_float(0, 223, R[0], C[34]);
| outputdata_float(0, 224, R[0], C[34]);
| outputdata_float(0, 225, R[0], C[34]);
| outputdata_float(0, 226, R[0], C[34]);
| outputdata_float(0, 227, R[0], C[34]);
| outputdata_float(0, 255, R[0], C[34]);
| outputdata_float(0, 256, R[0], C[34]);
| outputdata_float(0, 257, R[0], C[34]);
| outputdata_float(0, 258, R[0], C[34]);
| outputdata_float(0, 259, R[0], C[34]);
| outputdata_float(0, 261, R[0], C[34]);
| outputdata_float(0, 262, R[0], C[34]);
| outputdata_float(0, 263, R[0], C[34]);
| outputdata_float(0, 264, R[0], C[34]);
| outputdata_float(0, 265, R[0], C[34]);
| outputdata_float(0, 266, R[0], C[34]);
| outputdata_float(0, 267, R[0], C[34]);
| outputdata_float(0, 268, R[0], C[34]);
| outputdata_float(0, 269, R[0], C[34]);
| outputdata_float(0, 270, R[0], C[34]);
| outputdata_float(0, 271, R[0], C[34]);
| outputdata_float(0, 272, R[0], C[34]);
| outputdata_float(0, 273, R[0], C[34]);
| outputdata_float(0, 274, R[0], C[34]);
| outputdata_float(0, 275, R[0], C[34]);
| outputdata_float(0, 276, R[0], C[34]);
| outputdata_float(0, 277, R[0], C[34]);
| outputdata_float(0, 278, R[0], C[34]);
| outputdata_float(0, 279, R[0], C[34]);
| outputdata_float(0, 280, R[0], C[34]);
| outputdata_float(0, 281, R[0], C[34]);
| outputdata_float(0, 282, R[0], C[34]);
| outputdata_float(0, 283, R[0], C[34]);
| outputdata_float(0, 284, R[0], C[34]);
| outputdata_float(0, 285, R[0], C[34]);
| outputdata_float(0, 286, R[0], C[34]);
| outputdata_float(0, 287, R[0], C[34]);
| outputdata_float(0, 288, R[0], C[34]);
| outputdata_float(0, 289, R[0], C[34]);
| outputdata_float(0, 290, R[0], C[34]);
| outputdata_float(0, 291, R[0], C[34]);
| outputdata_float(0, 292, R[0], C[34]);
| outputdata_float(0, 293, R[0], C[34]);
| outputdata_float(0, 294, R[0], C[34]);
| outputdata_float(0, 295, R[0], C[34]);
| outputdata_float(0, 296, R[0], C[34]);
| outputdata_float(0, 297, R[0], C[34]);
| outputdata_float(0, 298, R[0], C[34]);
| outputdata_float(0, 299, R[0], C[34]);
| outputdata_float(0, 300, R[0], C[34]);
| outputdata_float(0, 304, R[0], C[34]);
| outputdata_float(0, 305, R[0], C[34]);
| outputdata_float(0, 306, R[0], C[34]);
| outputdata_float(0, 307, R[0], C[34]);
| outputdata_float(0, 308, R[0], C[34]);
| outputdata_float(0, 309, R[0], C[34]);
| outputdata_float(0, 310, R[0], C[34]);
| outputdata_float(0, 311, R[0], C[34]);
| outputdata_float(0, 312, R[0], C[34]);
| outputdata_float(0, 313, R[0], C[34]);
| outputdata_float(0, 314, R[0], C[34]);
| outputdata_float(0, 315, R[0], C[34]);
| outputdata_float(0, 316, R[0], C[34]);
| outputdata_float(0, 317, R[0], C[34]);
| outputdata_float(0, 318, R[0], C[34]);
| outputdata_float(0, 319, R[0], C[34]);
| outputdata_float(0, 320, R[0], C[34]);
| outputdata_float(0, 321, R[0], C[34]);
| outputdata_float(0, 322, R[0], C[34]);
| outputdata_float(0, 323, R[0], C[34]);
| outputdata_float(0, 324, R[0], C[34]);
| outputdata_float(0, 325, R[0], C[34]);
| outputdata_float(0, 326, R[0], C[34]);
| outputdata_float(0, 327, R[0], C[34]);
| outputdata_float(0, 328, R[0], C[34]);
| outputdata_float(0, 329, R[0], C[34]);
| outputdata_float(0, 330, R[0], C[34]);
| outputdata_float(0, 331, R[0], C[34]);
| outputdata_float(0, 332, R[0], C[34]);
| outputdata_float(0, 333, R[0], C[34]);
| outputdata_float(0, 334, R[0], C[34]);
| outputdata_float(0, 335, R[0], C[34]);
| outputdata_float(0, 336, R[0], C[34]);
| outputdata_float(0, 337, R[0], C[34]);
| outputdata_float(0, 338, R[0], C[34]);
| outputdata_float(0, 339, R[0], C[34]);
| outputdata_float(0, 340, R[0], C[34]);
| outputdata_float(0, 341, R[0], C[34]);
| outputdata_float(0, 342, R[0], C[34]);
| outputdata_float(0, 343, R[0], C[34]);
| outputdata_float(0, 344, R[0], C[34]);
| outputdata_float(0, 345, R[0], C[34]);
| outputdata_float(0, 346, R[0], C[34]);
| outputdata_float(0, 347, R[0], C[34]);
| outputdata_float(0, 348, R[0], C[34]);
| outputdata_float(0, 349, R[0], C[34]);
| outputdata_float(0, 350, R[0], C[34]);
| outputdata_float(0, 351, R[0], C[34]);
| outputdata_float(0, 352, R[0], C[34]);
| outputdata_float(0, 353, R[0], C[34]);
| outputdata_float(0, 354, R[0], C[34]);
| outputdata_float(0, 355, R[0], C[34]);
| outputdata_float(0, 356, R[0], C[34]);
| outputdata_float(0, 357, R[0], C[34]);
| outputdata_float(0, 358, R[0], C[34]);
| outputdata_float(0, 359, R[0], C[34]);
| outputdata_float(0, 365, R[0], C[34]);
| outputdata_float(0, 366, R[0], C[34]);
| outputdata_float(0, 367, R[0], C[34]);
| outputdata_float(0, 368, R[0], C[34]);
| outputdata_float(0, 369, R[0], C[34]);
| outputdata_float(0, 370, R[0], C[34]);
| outputdata_float(0, 372, R[0], C[34]);
| outputdata_float(0, 373, R[0], C[34]);
| outputdata_float(0, 374, R[0], C[34]);
| outputdata_float(0, 375, R[0], C[34]);
| outputdata_float(0, 376, R[0], C[34]);
| outputdata_float(0, 377, R[0], C[34]);
| outputdata_float(0, 378, R[0], C[34]);
| outputdata_float(0, 379, R[0], C[34]);
| outputdata_float(0, 380, R[0], C[34]);
| outputdata_float(0, 381, R[0], C[34]);
| outputdata_float(0, 382, R[0], C[34]);
| outputdata_float(0, 383, R[0], C[34]);
| outputdata_float(0, 384, R[0], C[34]);
| outputdata_float(0, 385, R[0], C[34]);
| outputdata_float(0, 386, R[0], C[34]);
| outputdata_float(0, 387, R[0], C[34]);
| outputdata_float(0, 388, R[0], C[34]);
| outputdata_float(0, 389, R[0], C[34]);
| outputdata_float(0, 391, R[0], C[34]);
| outputdata_float(0, 392, R[0], C[34]);
| outputdata_float(0, 393, R[0], C[34]);
| outputdata_float(0, 394, R[0], C[34]);
| outputdata_float(0, 395, R[0], C[34]);
| outputdata_float(0, 396, R[0], C[34]);
| outputdata_float(0, 397, R[0], C[34]);
| outputdata_float(0, 398, R[0], C[34]);
| outputdata_float(0, 399, R[0], C[34]);
| outputdata_float(0, 400, R[0], C[34]);
| outputdata_float(0, 401, R[0], C[34]);
| outputdata_float(0, 402, R[0], C[34]);
| outputdata_float(0, 403, R[0], C[34]);
| outputdata_float(0, 404, R[0], C[34]);
| outputdata_float(0, 405, R[0], C[34]);
| outputdata_float(0, 406, R[0], C[34]);
| outputdata_float(0, 407, R[0], C[34]);
| outputdata_float(0, 408, R[0], C[34]);
| outputdata_float(0, 409, R[0], C[34]);
| outputdata_float(0, 410, R[0], C[34]);
| outputdata_float(0, 411, R[0], C[34]);
| outputdata_float(0, 412, R[0], C[34]);
| outputdata_float(0, 413, R[0], C[34]);
| outputdata_float(0, 414, R[0], C[34]);
| outputdata_float(0, 415, R[0], C[34]);
| outputdata_float(0, 416, R[0], C[34]);
| outputdata_float(0, 417, R[0], C[34]);
| outputdata_float(0, 418, R[0], C[34]);
| outputdata_float(0, 419, R[0], C[34]);
| outputdata_float(0, 420, R[0], C[34]);
| outputdata_float(0, 421, R[0], C[34]);
| outputdata_float(0, 422, R[0], C[34]);
| outputdata_float(0, 423, R[0], C[34]);
| outputdata_float(0, 424, R[0], C[34]);
| outputdata_float(0, 425, R[0], C[34]);
| outputdata_float(0, 426, R[0], C[34]);
| outputdata_float(0, 427, R[0], C[34]);
| outputdata_float(0, 428, R[0], C[34]);
| outputdata_float(0, 429, R[0], C[34]);
| outputdata_float(0, 430, R[0], C[34]);
| outputdata_float(0, 431, R[0], C[34]);
| outputdata_float(0, 432, R[0], C[34]);
| outputdata_float(0, 433, R[0], C[34]);
| outputdata_float(0, 434, R[0], C[34]);
| outputdata_float(0, 435, R[0], C[34]);
| outputdata_float(0, 436, R[0], C[34]);
| outputdata_float(0, 437, R[0], C[34]);
| outputdata_float(0, 438, R[0], C[34]);
| outputdata_float(0, 439, R[0], C[34]);
| outputdata_float(0, 440, R[0], C[34]);
| outputdata_float(0, 441, R[0], C[34]);
| outputdata_float(0, 442, R[0], C[34]);
| outputdata_float(0, 443, R[0], C[34]);
| outputdata_float(0, 444, R[0], C[34]);
| outputdata_float(0, 445, R[0], C[34]);
| outputdata_float(0, 446, R[0], C[34]);
| outputdata_float(0, 447, R[0], C[34]);
| outputdata_float(0, 448, R[0], C[34]);
| outputdata_float(0, 449, R[0], C[34]);
| outputdata_float(0, 450, R[0], C[34]);
| outputdata_float(0, 451, R[0], C[34]);
| outputdata_float(0, 452, R[0], C[34]);
| outputdata_float(0, 453, R[0], C[34]);
| outputdata_float(0, 454, R[0], C[34]);
| outputdata_float(0, 455, R[0], C[34]);
| outputdata_float(0, 456, R[0], C[34]);
| outputdata_float(0, 457, R[0], C[34]);
| outputdata_float(0, 458, R[0], C[34]);
| outputdata_float(0, 459, R[0], C[34]);
| outputdata_float(0, 460, R[0], C[34]);
| outputdata_float(0, 461, R[0], C[34]);
| outputdata_float(0, 462, R[0], C[34]);
| outputdata_float(0, 463, R[0], C[34]);
| outputdata_float(0, 464, R[0], C[34]);
| outputdata_float(0, 465, R[0], C[34]);
| outputdata_float(0, 466, R[0], C[34]);
| outputdata_float(0, 467, R[0], C[34]);
| outputdata_float(0, 468, R[0], C[34]);
| outputdata_float(0, 469, R[0], C[34]);
| outputdata_float(0, 471, R[0], C[34]);
| outputdata_float(0, 472, R[0], C[34]);
| outputdata_float(0, 473, R[0], C[34]);
| outputdata_float(0, 474, R[0], C[34]);
| outputdata_float(0, 475, R[0], C[34]);
| outputdata_float(0, 476, R[0], C[34]);
| outputdata_float(0, 477, R[0], C[34]);
| outputdata_float(0, 478, R[0], C[34]);
| outputdata_float(0, 479, R[0], C[34]);
| outputdata_float(0, 480, R[0], C[34]);
| outputdata_float(0, 481, R[0], C[34]);
| outputdata_float(0, 482, R[0], C[34]);
| outputdata_float(0, 483, R[0], C[34]);
| outputdata_float(0, 484, R[0], C[34]);
| outputdata_float(0, 485, R[0], C[34]);
| outputdata_float(0, 486, R[0], C[34]);
| outputdata_float(0, 487, R[0], C[34]);
| outputdata_float(0, 488, R[0], C[34]);
| outputdata_float(0, 489, R[0], C[34]);
| outputdata_float(0, 491, R[0], C[34]);
| outputdata_float(0, 492, R[0], C[34]);
| outputdata_float(0, 493, R[0], C[34]);
| outputdata_float(0, 494, R[0], C[34]);
| outputdata_float(0, 496, R[0], C[34]);
| outputdata_float(0, 497, R[0], C[34]);
| outputdata_float(0, 498, R[0], C[34]);
| outputdata_float(0, 499, R[0], C[34]);
| outputdata_float(0, 501, R[0], C[34]);
| outputdata_float(0, 502, R[0], C[34]);
| outputdata_float(0, 503, R[0], C[34]);
| outputdata_float(0, 504, R[0], C[34]);
| outputdata_float(0, 506, R[0], C[34]);
| outputdata_float(0, 507, R[0], C[34]);
| outputdata_float(0, 508, R[0], C[34]);
| outputdata_float(0, 509, R[0], C[34]);
| outputdata_float(0, 510, R[0], C[34]);
| outputdata_float(0, 511, R[0], C[34]);
| outputdata_float(0, 512, R[0], C[34]);
| outputdata_float(0, 513, R[0], C[34]);
| outputdata_float(0, 514, R[0], C[34]);
| outputdata_float(0, 515, R[0], C[34]);
| outputdata_float(0, 516, R[0], C[34]);
| outputdata_float(0, 517, R[0], C[34]);
| outputdata_float(0, 518, R[0], C[34]);
| outputdata_float(0, 519, R[0], C[34]);
| outputdata_float(0, 520, R[0], C[34]);
| outputdata_float(0, 521, R[0], C[34]);
| outputdata_float(0, 522, R[0], C[34]);
| outputdata_float(0, 523, R[0], C[34]);
| outputdata_float(0, 524, R[0], C[34]);
| outputdata_float(0, 525, R[0], C[34]);
| outputdata_float(0, 526, R[0], C[34]);
| outputdata_float(0, 527, R[0], C[34]);
| outputdata_float(0, 528, R[0], C[34]);
| outputdata_float(0, 529, R[0], C[34]);
| outputdata_float(0, 530, R[0], C[34]);
| outputdata_float(0, 531, R[0], C[34]);
| outputdata_float(0, 532, R[0], C[34]);
| outputdata_float(0, 533, R[0], C[34]);
| outputdata_float(0, 534, R[0], C[34]);
| outputdata_float(0, 535, R[0], C[34]);
| outputdata_float(0, 536, R[0], C[34]);
| outputdata_float(0, 537, R[0], C[34]);
| outputdata_float(0, 539, R[0], C[34]);
| outputdata_float(0, 540, R[0], C[34]);
| outputdata_float(0, 541, R[0], C[34]);
| outputdata_float(0, 542, R[0], C[34]);
| outputdata_float(0, 544, R[0], C[34]);
| outputdata_float(0, 545, R[0], C[34]);
| outputdata_float(0, 546, R[0], C[34]);
| outputdata_float(0, 547, R[0], C[34]);
| outputdata_float(0, 549, R[0], C[34]);
| outputdata_float(0, 550, R[0], C[34]);
| outputdata_float(0, 551, R[0], C[34]);
| outputdata_float(0, 552, R[0], C[34]);
| outputdata_float(0, 555, R[0], C[34]);
| outputdata_float(0, 556, R[0], C[34]);
| outputdata_float(0, 557, R[0], C[34]);
| outputdata_float(0, 558, R[0], C[34]);
| outputdata_float(0, 560, R[0], C[34]);
| outputdata_float(0, 561, R[0], C[34]);
| outputdata_float(0, 562, R[0], C[34]);
| outputdata_float(0, 563, R[0], C[34]);
| outputdata_float(0, 565, R[0], C[34]);
| outputdata_float(0, 566, R[0], C[34]);
| outputdata_float(0, 567, R[0], C[34]);
| outputdata_float(0, 568, R[0], C[34]);
| outputdata_float(0, 570, R[0], C[34]);
| outputdata_float(0, 571, R[0], C[34]);
| outputdata_float(0, 572, R[0], C[34]);
| outputdata_float(0, 573, R[0], C[34]);
| outputdata_float(0, 574, R[0], C[34]);
| outputdata_float(0, 575, R[0], C[34]);
| outputdata_float(0, 576, R[0], C[34]);
| outputdata_float(0, 577, R[0], C[34]);
| outputdata_float(0, 578, R[0], C[34]);
| outputdata_float(0, 579, R[0], C[34]);
| outputdata_float(0, 580, R[0], C[34]);
| outputdata_float(0, 581, R[0], C[34]);
| outputdata_float(0, 582, R[0], C[34]);
| outputdata_float(0, 583, R[0], C[34]);
| outputdata_float(0, 584, R[0], C[34]);
| outputdata_float(0, 585, R[0], C[34]);
| outputdata_float(0, 587, R[0], C[34]);
| outputdata_float(0, 588, R[0], C[34]);
| outputdata_float(0, 589, R[0], C[34]);
| outputdata_float(0, 590, R[0], C[34]);
| outputdata_float(0, 592, R[0], C[34]);
| outputdata_float(0, 593, R[0], C[34]);
| outputdata_float(0, 594, R[0], C[34]);
| outputdata_float(0, 595, R[0], C[34]);
| outputdata_float(0, 597, R[0], C[34]);
| outputdata_float(0, 598, R[0], C[34]);
| outputdata_float(0, 599, R[0], C[34]);
| outputdata_float(0, 600, R[0], C[34]);
| outputdata_float(0, 602, R[0], C[34]);
| outputdata_float(0, 603, R[0], C[34]);
| outputdata_float(0, 604, R[0], C[34]);
| outputdata_float(0, 605, R[0], C[34]);
| outputdata_float(0, 606, R[0], C[34]);
| outputdata_float(0, 607, R[0], C[34]);
| outputdata_float(0, 608, R[0], C[34]);
| outputdata_float(0, 609, R[0], C[34]);
| outputdata_float(0, 610, R[0], C[34]);
| outputdata_float(0, 612, R[0], C[34]);
| outputdata_float(0, 613, R[0], C[34]);
| outputdata_float(0, 614, R[0], C[34]);
| outputdata_float(0, 615, R[0], C[34]);
| outputdata_float(0, 616, R[0], C[34]);
| outputdata_float(0, 617, R[0], C[34]);
| outputdata_float(0, 618, R[0], C[34]);
| outputdata_float(0, 619, R[0], C[34]);
| outputdata_float(0, 620, R[0], C[34]);
| outputdata_float(0, 621, R[0], C[34]);
| outputdata_float(0, 622, R[0], C[34]);
| outputdata_float(0, 623, R[0], C[34]);
| outputdata_float(0, 624, R[0], C[34]);
| outputdata_float(0, 625, R[0], C[34]);
| outputdata_float(0, 626, R[0], C[34]);
| outputdata_float(0, 627, R[0], C[34]);
| outputdata_float(0, 628, R[0], C[34]);
| outputdata_float(0, 629, R[0], C[34]);
| outputdata_float(0, 630, R[0], C[34]);
| outputdata_float(0, 631, R[0], C[34]);
| outputdata_float(0, 632, R[0], C[34]);
| outputdata_float(0, 633, R[0], C[34]);
| outputdata_float(0, 634, R[0], C[34]);
| outputdata_float(0, 635, R[0], C[34]);
| outputdata_float(0, 636, R[0], C[34]);
| outputdata_float(0, 637, R[0], C[34]);
| outputdata_float(0, 638, R[0], C[34]);
| outputdata_float(0, 639, R[0], C[34]);
| outputdata_float(0, 640, R[0], C[34]);
| outputdata_float(0, 641, R[0], C[34]);
| outputdata_float(0, 642, R[0], C[34]);
| outputdata_float(0, 643, R[0], C[34]);
| outputdata_float(0, 644, R[0], C[34]);
| outputdata_float(0, 645, R[0], C[34]);
| outputdata_float(0, 646, R[0], C[34]);
| outputdata_float(0, 647, R[0], C[34]);
| outputdata_float(0, 648, R[0], C[34]);
| outputdata_float(0, 649, R[0], C[34]);
| outputdata_float(0, 650, R[0], C[34]);
| outputdata_float(0, 651, R[0], C[34]);
| outputdata_float(0, 652, R[0], C[34]);
| outputdata_float(0, 653, R[0], C[34]);
| outputdata_float(0, 654, R[0], C[34]);
| outputdata_float(0, 655, R[0], C[34]);
| outputdata_float(0, 656, R[0], C[34]);
| outputdata_float(0, 657, R[0], C[34]);
| outputdata_float(0, 658, R[0], C[34]);
| outputdata_float(0, 659, R[0], C[34]);
| outputdata_float(0, 660, R[0], C[34]);
| outputdata_float(0, 661, R[0], C[34]);
| outputdata_float(0, 662, R[0], C[34]);
| outputdata_float(0, 663, R[0], C[34]);
| outputdata_float(0, 664, R[0], C[34]);
| outputdata_float(0, 668, R[0], C[34]);
| outputdata_float(0, 669, R[0], C[34]);
| outputdata_float(0, 670, R[0], C[34]);
| outputdata_float(0, 671, R[0], C[34]);
| outputdata_float(0, 672, R[0], C[34]);
| outputdata_float(0, 673, R[0], C[34]);
| outputdata_float(0, 674, R[0], C[34]);
| outputdata_float(0, 675, R[0], C[34]);
| outputdata_float(0, 676, R[0], C[34]);
| outputdata_float(0, 677, R[0], C[34]);
| outputdata_float(0, 678, R[0], C[34]);
| outputdata_float(0, 679, R[0], C[34]);
| outputdata_float(0, 680, R[0], C[34]);
| outputdata_float(0, 681, R[0], C[34]);
| outputdata_float(0, 682, R[0], C[34]);
| outputdata_float(0, 683, R[0], C[34]);
| outputdata_float(0, 684, R[0], C[34]);
| outputdata_float(0, 685, R[0], C[34]);
| outputdata_float(0, 686, R[0], C[34]);
| outputdata_float(0, 687, R[0], C[34]);
| outputdata_float(0, 688, R[0], C[34]);
| outputdata_float(0, 689, R[0], C[34]);
| outputdata_float(0, 690, R[0], C[34]);
| outputdata_float(0, 691, R[0], C[34]);
| outputdata_float(0, 692, R[0], C[34]);
| outputdata_float(0, 693, R[0], C[34]);
| outputdata_float(0, 694, R[0], C[34]);
| outputdata_float(0, 695, R[0], C[34]);
| outputdata_float(0, 696, R[0], C[34]);
| outputdata_float(0, 697, R[0], C[34]);
| outputdata_float(0, 698, R[0], C[34]);
| outputdata_float(0, 699, R[0], C[34]);
| outputdata_float(0, 700, R[0], C[34]);
| outputdata_float(0, 701, R[0], C[34]);
| outputdata_float(0, 702, R[0], C[34]);
| outputdata_float(0, 703, R[0], C[34]);
| outputdata_float(0, 704, R[0], C[34]);
| outputdata_float(0, 705, R[0], C[34]);
| outputdata_float(0, 706, R[0], C[34]);
| outputdata_float(0, 707, R[0], C[34]);
| outputdata_float(0, 708, R[0], C[34]);
| outputdata_float(0, 709, R[0], C[34]);
| outputdata_float(0, 710, R[0], C[34]);
| outputdata_float(0, 711, R[0], C[34]);
| outputdata_float(0, 712, R[0], C[34]);
| outputdata_float(0, 713, R[0], C[34]);
| outputdata_float(0, 714, R[0], C[34]);
| outputdata_float(0, 715, R[0], C[34]);
| O[202] = div(O[147], O[53]);
| outputdata_float(0, 108, R[0], C[36]);
| outputdata_float(0, 109, R[0], C[36]);
| outputdata_float(0, 110, R[0], C[36]);
| outputdata_float(0, 111, R[0], C[36]);
| outputdata_float(0, 136, R[0], O[202]);
| O[202] = div(O[146], O[168]);
| outputdata_float(0, 114, R[0], C[37]);
| outputdata_float(0, 137, R[0], O[202]);
| O[292] = f2i(O[292]);
| outputdata_int32(0, 31, R[0], O[292]);
| outputdata_int32(0, 51, R[0], C[38]);
| outputdata_int32(0, 52, R[0], C[38]);
| O[53] = f2i(O[53]);
| outputdata_int32(0, 1, R[0], C[35]);
| outputdata_int32(0, 7, R[0], C[35]);
| outputdata_int32(0, 8, R[0], C[35]);
| outputdata_int32(0, 9, R[0], C[35]);
| outputdata_int32(0, 10, R[0], C[35]);
| outputdata_int32(0, 11, R[0], C[35]);
| outputdata_int32(0, 15, R[0], C[35]);
| outputdata_int32(0, 32, R[0], O[53]);
| outputdata_int32(0, 90, R[0], C[35]);
| O[168] = f2i(O[168]);
| external_func_call(C[12]O[202], O[292], O[53]);
| O[202] = i2f(O[202]);
| O[205] = f2i(O[202]);
| O[206] = f2i(O[292]);
| O[150] = f2i(O[53]);
| external_func_call(C[16], O[205], O[206], O[150]R[65535]);
| outputdata_int32(0, 27, R[0], O[154]);
| O[154] = div(O[759], O[202]);
| outputdata_float(0, 153, R[0], O[154]);
| outputdata_float(0, 361, R[0], C[40]);
| O[154] = div(O[147], O[292]);
| outputdata_float(0, 154, R[0], O[154]);
| O[154] = div(O[146], O[53]);
| outputdata_float(0, 155, R[0], O[154]);
| O[202] = f2i(O[202]);
| outputdata_int32(0, 40, R[0], O[202]);
| outputdata_int32(0, 41, R[0], O[292]);
| outputdata_int32(0, 0, R[0], C[33]);
| outputdata_int32(0, 42, R[0], O[53]);
| O[202] = i2f_mul(O[202], C[17]);
| O[292] = i2f_mul(O[292], C[17]);
| O[53] = i2f_mul(O[53], C[17]);
| O[154] = f2i(O[202]);
| O[205] = f2i(O[292]);
| O[206] = f2i(O[53]);
| external_func_call(C[18], O[154], O[205], O[206]R[65535]);
| outputdata_float(0, 126, R[0], O[207]);
| O[207] = div(O[759], O[202]);
| outputdata_float(0, 159, R[0], O[207]);
| O[207] = div(O[147], O[292]);
| outputdata_float(0, 160, R[0], O[207]);
| O[207] = div(O[146], O[53]);
| outputdata_float(0, 161, R[0], O[207]);
| outputdata_int32(0, 43, R[0], O[202]);
| outputdata_float(0, 360, R[0], C[39]);
| outputdata_int32(0, 44, R[0], O[292]);
| outputdata_int32(0, 45, R[0], O[53]);
| external_func_call(C[12]O[53]);
| outputdata_int32(0, 80, R[0], O[53]);
| external_func_call(C[19]O[53]);
| outputdata_int32(0, 75, R[0], O[53]);
| outputdata_float(0, 125, R[0], O[293]);
| outputdata_int32(0, 79, R[0], O[53]);
| external_func_call(C[13]O[53]);
| outputdata_int32(0, 78, R[0], O[53]);
| outputdata_float(0, 128, R[0], O[288]);
| outputdata_int32(0, 74, R[0], O[53]);
| external_func_call(C[15]O[53]);
| outputdata_int32(0, 30, R[0], O[133]);
| outputdata_int32(0, 76, R[0], O[53]);
| external_func_call(C[14]O[53]);
| outputdata_float(0, 123, R[0], O[186]);
| outputdata_int32(0, 77, R[0], O[53]);
| external_func_call(C[12]O[133], O[186], O[53]);
| O[133] = i2f_mul(O[133], O[145]);
| O[288] = max(O[133], C[11]);
| O[186] = i2f_mul(O[186], O[145]);
| O[133] = max(O[186], C[11]);
| O[53] = i2f_mul(O[53], O[145]);
| O[186] = max(O[53], C[11]);
| O[53] = f2i(O[288]);
| O[293] = f2i(O[133]);
| O[292] = f2i(O[186]);
| external_func_call(C[20], O[53], O[293], O[292]R[65535]);
| O[53] = div(O[759], O[288]);
| O[293] = div(O[147], O[133]);
| outputdata_float(0, 230, R[0], O[293]);
| O[293] = div(O[146], O[186]);
| outputdata_float(0, 231, R[0], O[293]);
| O[288] = f2i(O[288]);
| outputdata_int32(0, 59, R[0], O[288]);
| O[133] = f2i(O[133]);
| outputdata_int32(0, 60, R[0], O[133]);
| O[186] = f2i(O[186]);
| outputdata_int32(0, 61, R[0], O[186]);
| outputdata_float(0, 127, R[0], O[4]);
| outputdata_int32(0, 20, R[0], C[9]);
| outputdata_int32(0, 58, R[0], C[9]);
| O[4] = addi(C[9], C[2]);
| O[4] = i2f_mul(O[4], O[53]);
| outputdata_float(0, 228, R[0], O[53]);
| outputdata_float(0, 229, R[0], O[53]);
| outputdata_float(0, 260, R[0], O[53]);
| external_func_call(C[20], O[4]R[65535]);
| outputdata_int32(0, 25, R[0], O[326]);
| external_func_call(C[12]O[53], O[4], O[326]);
| O[186] = max(O[145], C[17]);
| outputdata_float(0, 124, R[0], O[178]);
| O[53] = i2f_mul(O[53], O[186]);
| O[4] = i2f_mul(O[4], O[186]);
| O[326] = i2f_mul(O[326], O[186]);
| O[186] = f2i(O[53]);
| O[178] = f2i(O[4]);
| O[133] = f2i(O[326]);
| external_func_call(C[21], O[186], O[178], O[133]R[65535]);
| outputdata_int32(0, 39, R[0], O[179]);
| O[179] = div(O[759], O[53]);
| outputdata_float(0, 141, R[0], O[179]);
| O[179] = div(O[147], O[4]);
| outputdata_float(0, 119, R[0], O[147]);
| outputdata_float(0, 133, R[0], O[147]);
| outputdata_float(0, 139, R[0], O[147]);
| outputdata_float(0, 142, R[0], O[179]);
| outputdata_float(0, 145, R[0], O[147]);
| outputdata_float(0, 151, R[0], O[147]);
| outputdata_float(0, 157, R[0], O[147]);
| outputdata_float(0, 163, R[0], O[147]);
| outputdata_float(0, 233, R[0], O[147]);
| outputdata_float(0, 236, R[0], O[147]);
| outputdata_float(0, 239, R[0], O[147]);
| outputdata_float(0, 302, R[0], O[147]);
| outputdata_float(0, 666, R[0], O[147]);
| outputdata_int32(0, 73, R[0], C[0]);
| O[147] = div(O[146], O[326]);
| outputdata_float(0, 120, R[0], O[146]);
| outputdata_float(0, 134, R[0], O[146]);
| outputdata_float(0, 140, R[0], O[146]);
| outputdata_float(0, 143, R[0], O[147]);
| outputdata_float(0, 146, R[0], O[146]);
| outputdata_float(0, 152, R[0], O[146]);
| outputdata_float(0, 158, R[0], O[146]);
| outputdata_float(0, 164, R[0], O[146]);
| outputdata_float(0, 234, R[0], O[146]);
| outputdata_float(0, 237, R[0], O[146]);
| outputdata_float(0, 240, R[0], O[146]);
| outputdata_float(0, 303, R[0], O[146]);
| outputdata_float(0, 667, R[0], O[146]);
| outputdata_int32(0, 83, R[0], C[1]);
| outputdata_int32(0, 86, R[0], C[1]);
| outputdata_int32(0, 34, R[0], O[53]);
| O[4] = f2i(O[4]);
| outputdata_int32(0, 35, R[0], O[4]);
| O[326] = f2i(O[326]);
| outputdata_int32(0, 36, R[0], O[326]);
| O[4] = i2f_mul(O[4], O[145]);
| O[326] = i2f_mul(O[326], O[145]);
| outputdata_float(0, 213, R[0], O[145]);
| outputdata_float(0, 254, R[0], O[145]);
| O[145] = f2i(O[53]);
| O[146] = f2i(O[4]);
| O[147] = f2i(O[326]);
| external_func_call(C[22], O[145], O[146], O[147]R[65535]);
| outputdata_float(0, 129, R[0], O[160]);
| outputdata_int32(0, 22, R[0], O[53]);
| outputdata_int32(0, 23, R[0], O[4]);
| outputdata_int32(0, 24, R[0], O[326]);
| external_func_call(C[23], C[2], C[2], C[2]R[65535]);
| outputdata_int32(0, 29, R[0], O[13]);
| external_func_call(C[12]O[13], O[4], O[53]);
| O[326] = i2f_div1(O[13], C[24]);
| O[326] = cos(O[326]);
| outputdata_int32(0, 56, R[0], O[4]);
| O[4] = i2f_div1(O[4], C[24]);
| O[4] = cos(O[4]);
| outputdata_int32(0, 57, R[0], O[53]);
| O[53] = i2f_div1(O[53], C[24]);
| outputdata_float(0, 130, R[0], O[161]);
| O[53] = cos(O[53]);
| O[326] = add_add(O[326], O[4], O[53]);
| O[326] = div(O[326], C[25]);
| outputdata_float(0, 131, R[0], O[162]);
| O[326] = mul_sub1(O[326], O[326], C[11]);
| O[326] = sqrt(O[326]);
| O[326] = add(C[11], O[326]);
| O[326] = div(C[26], O[326]);
| O[326] = sub(O[326], C[11]);
| outputdata_float(0, 3, R[0], C[11]);
| outputdata_float(0, 48, R[0], C[11]);
| outputdata_float(0, 113, R[0], C[11]);
| outputdata_float(0, 115, R[0], C[11]);
| outputdata_float(0, 116, R[0], C[11]);
| outputdata_float(0, 174, R[0], C[11]);
| outputdata_float(0, 241, R[0], C[11]);
| outputdata_float(0, 242, R[0], C[11]);
| outputdata_float(0, 243, R[0], C[11]);
| outputdata_float(0, 244, R[0], C[11]);
| outputdata_float(0, 245, R[0], C[11]);
| outputdata_float(0, 246, R[0], C[11]);
| outputdata_float(0, 247, R[0], C[11]);
| outputdata_float(0, 248, R[0], C[11]);
| outputdata_float(0, 249, R[0], C[11]);
| outputdata_float(0, 250, R[0], C[11]);
| outputdata_float(0, 251, R[0], C[11]);
| outputdata_float(0, 252, R[0], C[11]);
| outputdata_float(0, 253, R[0], O[326]);
| outputdata_float(0, 362, R[0], C[11]);
| outputdata_float(0, 363, R[0], C[11]);
| outputdata_float(0, 364, R[0], C[11]);
| outputdata_float(0, 371, R[0], C[11]);
| outputdata_float(0, 390, R[0], C[11]);
| outputdata_float(0, 470, R[0], C[11]);
| outputdata_float(0, 490, R[0], C[11]);
| outputdata_float(0, 495, R[0], C[11]);
| outputdata_float(0, 500, R[0], C[11]);
| outputdata_float(0, 505, R[0], C[11]);
| outputdata_float(0, 538, R[0], C[11]);
| outputdata_float(0, 543, R[0], C[11]);
| outputdata_float(0, 548, R[0], C[11]);
| outputdata_float(0, 553, R[0], C[11]);
| outputdata_float(0, 554, R[0], C[11]);
| outputdata_float(0, 559, R[0], C[11]);
| outputdata_float(0, 564, R[0], C[11]);
| outputdata_float(0, 569, R[0], C[11]);
| outputdata_float(0, 586, R[0], C[11]);
| outputdata_float(0, 591, R[0], C[11]);
| outputdata_float(0, 596, R[0], C[11]);
| outputdata_float(0, 601, R[0], C[11]);
| outputdata_float(0, 611, R[0], C[11]);
| outputdata_int32(0, 47, R[0], O[137]);
| O[13] = i2f_div0(O[13], C[26]);
| outputdata_int32(0, 28, R[0], O[14]);
| O[13] = ceil(O[13]);
| O[13] = f2i(O[13]);
| outputdata_int32(0, 55, R[0], O[13]);
| external_func_call(C[12]O[13], O[14], O[137]);
| outputdata_float(0, 118, R[0], O[759]);
| outputdata_float(0, 132, R[0], O[759]);
| outputdata_float(0, 138, R[0], O[759]);
| outputdata_float(0, 144, R[0], O[759]);
| outputdata_float(0, 150, R[0], O[759]);
| outputdata_float(0, 156, R[0], O[759]);
| outputdata_float(0, 162, R[0], O[759]);
| outputdata_float(0, 232, R[0], O[759]);
| outputdata_float(0, 235, R[0], O[759]);
| outputdata_float(0, 238, R[0], O[759]);
| outputdata_float(0, 301, R[0], O[759]);
| outputdata_float(0, 665, R[0], O[759]);
| O[13] = i2f(O[13]);
| O[14] = i2f(O[14]);
| O[14] = f2i(O[14]);
| O[137] = i2f(O[137]);
| O[137] = f2i(O[137]);
| external_func_call(C[27], O[13], O[14], O[137], C[2]R[65535]);
| outputdata_int32(0, 33, R[0], O[168]);
| external_func_call(C[28], C[2], C[2], C[3]R[65535]);
| external_func_call(C[29], C[4], C[4], C[3]R[65535]);
| outputdata_int32(0, 2, R[0], C[4]);
| outputdata_int32(0, 3, R[0], C[4]);
| outputdata_int32(0, 16, R[0], C[4]);
| outputdata_int32(0, 17, R[0], C[4]);
| outputdata_int32(0, 18, R[0], C[4]);
| outputdata_int32(0, 19, R[0], C[4]);
| outputdata_int32(0, 38, R[0], O[125]);
| outputdata_int32(0, 46, R[0], C[4]);
| outputdata_int32(0, 48, R[0], O[15]);
| outputdata_int32(0, 53, R[0], C[4]);
| outputdata_int32(0, 54, R[0], C[4]);
| outputdata_int32(0, 71, R[0], C[4]);
| outputdata_int32(0, 72, R[0], C[4]);
| outputdata_int32(0, 81, R[0], C[4]);
| outputdata_int32(0, 82, R[0], C[4]);
| outputdata_int32(0, 85, R[0], C[4]);
| outputdata_int32(0, 88, R[0], C[4]);
| outputdata_int32(0, 89, R[0], C[4]);
| outputdata_int32(0, 91, R[0], C[4]);
| outputdata_int32(0, 92, R[0], C[4]);
| outputdata_int32(0, 93, R[0], C[4]);
| external_func_call(C[28]O[15], O[125]);
| outputdata_float(0, 147, R[0], O[187]);
| external_func_call(C[30], O[15], O[125], C[3]R[65535]);
| outputdata_float(0, 148, R[0], O[188]);
| outputdata_int32(0, 4, R[0], C[3]);
| outputdata_int32(0, 12, R[0], C[3]);
| external_func_call(C[31], C[2], C[2], C[2]R[65535]);
| outputdata_float(0, 149, R[0], O[189]);
| external_func_call(C[32], C[2], C[2], C[2]R[65535]);
| outputdata_int32(0, 5, R[0], C[2]);
| outputdata_int32(0, 6, R[0], C[2]);
| outputdata_int32(0, 13, R[0], C[2]);
| outputdata_int32(0, 21, R[0], C[2]);
| outputdata_int32(0, 37, R[0], O[184]);
| outputdata_int32(0, 62, R[0], C[2]);
| outputdata_int32(0, 63, R[0], C[2]);
| outputdata_int32(0, 64, R[0], C[2]);
| outputdata_int32(0, 65, R[0], C[2]);
| outputdata_int32(0, 66, R[0], C[2]);
| outputdata_int32(0, 67, R[0], C[2]);
| outputdata_int32(0, 68, R[0], C[2]);
| outputdata_int32(0, 69, R[0], C[2]);
| outputdata_int32(0, 70, R[0], C[2]);
| outputdata_int32(0, 84, R[0], C[2]);
| outputdata_int32(0, 87, R[0], O[479]);
| outputdata_float(0, 117, R[0], I[4]);
| done();
| O[328] = inputdata_float();
| O[36] = inputdata_float();
| O[35] = inputdata_float();
| O[34] = inputdata_float();
| O[61] = inputdata_float();
| O[60] = inputdata_float();
| O[59] = inputdata_float();
| O[58] = inputdata_int32();
| O[57] = inputdata_float();
| O[53] = inputdata_int32();
| O[52] = inputdata_int32();
| O[51] = inputdata_int32();
| O[50] = inputdata_int32();
| O[8] = inputdata_float();
| O[24] = inputdata_float();
| O[25] = inputdata_float();
| O[23] = inputdata_float();
| O[30] = inputdata_float();
| O[22] = inputdata_int32();
| O[54] = inputdata_int32();
| O[21] = inputdata_int32();
| O[351] = inputdata_int32();
| O[350] = inputdata_int32();
| O[349] = inputdata_int32();
| O[348] = inputdata_float();
| O[347] = inputdata_float();
| O[346] = inputdata_float();
| O[345] = inputdata_float();
| O[344] = inputdata_int32();
| O[343] = inputdata_float();
| O[342] = inputdata_float();
| O[97] = inputdata_float();
| O[98] = inputdata_float();
| O[99] = inputdata_int32();
| O[269] = inputdata_int32();
| O[379] = inputdata_int32();
| O[121] = inputdata_int32();
| O[122] = inputdata_int32();
| O[270] = inputdata_int32();
| O[380] = inputdata_int32();
| O[126] = inputdata_int32();
| O[373] = inputdata_float();
| O[496] = inputdata_float();
| O[643] = inputdata_float();
| O[755] = inputdata_float();
| O[374] = inputdata_float();
| O[604] = inputdata_float();
| O[603] = inputdata_int32();
| O[799] = inputdata_int32();
| O[798] = inputdata_int32();
| O[421] = inputdata_float();
| O[797] = inputdata_float();
| O[796] = inputdata_float();
| O[795] = inputdata_float();
| O[794] = inputdata_float();
| O[417] = inputdata_float();
| O[532] = inputdata_int32();
| O[679] = inputdata_int32();
| R[60] = inputdata_int32();
| R[61] = inputdata_float();
| R[62] = inputdata_float();
| R[63] = inputdata_float();
| R[64] = inputdata_float();
| R[65] = inputdata_float();
| R[66] = inputdata_float();
| R[67] = inputdata_int32();
| R[68] = inputdata_int32();
| R[69] = inputdata_int32();
| R[70] = inputdata_float();
| R[71] = inputdata_float();
| R[72] = inputdata_float();
| R[73] = inputdata_float();
| R[74] = inputdata_float();
| R[75] = inputdata_float();
| R[76] = inputdata_int32();
| R[77] = inputdata_int32();
| R[78] = inputdata_int32();
| R[79] = inputdata_float();
| R[80] = inputdata_float();
| R[81] = inputdata_float();
| R[82] = inputdata_float();
| R[83] = inputdata_float();
| R[84] = inputdata_float();
| R[85] = inputdata_int32();
| R[86] = inputdata_int32();
| R[87] = inputdata_int32();
| R[88] = inputdata_float();
| R[89] = inputdata_float();
| R[90] = inputdata_float();
| R[91] = inputdata_float();
| R[92] = inputdata_float();
| R[93] = inputdata_float();
| R[94] = inputdata_int32();
| R[95] = inputdata_int32();
| R[96] = inputdata_int32();
| R[97] = inputdata_float();
| R[98] = inputdata_float();
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
| R[109] = inputdata_float();
| R[110] = inputdata_float();
| R[111] = inputdata_int32();
| R[112] = inputdata_int32();
| R[113] = inputdata_int32();
| R[114] = inputdata_float();
| R[115] = inputdata_int32();
| R[116] = inputdata_int32();
| R[117] = inputdata_int32();
| R[118] = inputdata_int32();
| R[119] = inputdata_int32();
| R[120] = inputdata_int32();
| R[121] = inputdata_float();
| R[122] = inputdata_int32();
| R[123] = inputdata_int32();
| R[124] = inputdata_int32();
| R[125] = inputdata_int32();
| R[126] = inputdata_float();
| R[127] = inputdata_float();
| R[128] = inputdata_float();
| R[129] = inputdata_float();
| R[130] = inputdata_float();
| R[131] = inputdata_float();
| R[132] = inputdata_int32();
| R[133] = inputdata_int32();
| R[134] = inputdata_int32();
| R[135] = inputdata_float();
| R[136] = inputdata_float();
| R[137] = inputdata_float();
| R[138] = inputdata_float();
| R[139] = inputdata_float();
| R[140] = inputdata_float();
| R[141] = inputdata_int32();
| R[142] = inputdata_int32();
| R[143] = inputdata_int32();
| R[144] = inputdata_float();
| R[145] = inputdata_float();
| R[146] = inputdata_float();
| R[147] = inputdata_float();
| R[148] = inputdata_float();
| R[149] = inputdata_float();
| R[150] = inputdata_int32();
| R[151] = inputdata_int32();
| R[152] = inputdata_int32();
| R[153] = inputdata_float();
| R[154] = inputdata_float();
| R[155] = inputdata_float();
| R[156] = inputdata_float();
| R[157] = inputdata_float();
| R[158] = inputdata_float();
| R[159] = inputdata_float();
| R[160] = inputdata_float();
| R[161] = inputdata_int32();
| R[162] = inputdata_float();
| R[163] = inputdata_int32();
| R[164] = inputdata_int32();
| R[165] = inputdata_int32();
| R[166] = inputdata_int32();
| R[167] = inputdata_int32();
| R[168] = inputdata_int32();
| R[169] = inputdata_int32();
| R[170] = inputdata_float();
| R[171] = inputdata_float();
| R[172] = inputdata_float();
| R[173] = inputdata_float();
| R[174] = inputdata_int32();
| R[175] = inputdata_int32();
| R[176] = inputdata_int32();
| R[177] = inputdata_int32();
| R[178] = inputdata_float();
| R[179] = inputdata_float();
| R[180] = inputdata_float();
| R[181] = inputdata_float();
| R[182] = inputdata_int32();
| R[183] = inputdata_float();
| R[184] = inputdata_int32();
| R[185] = inputdata_float();
| R[186] = inputdata_float();
| R[187] = inputdata_float();
| R[188] = inputdata_int32();
| R[189] = inputdata_int32();
| R[190] = inputdata_int32();
| R[191] = inputdata_float();
| R[192] = inputdata_int32();
| R[193] = inputdata_int32();
| R[194] = inputdata_int32();
| R[195] = inputdata_float();
| R[196] = inputdata_float();
| R[197] = inputdata_float();
| R[198] = inputdata_float();
| R[199] = inputdata_float();
| R[200] = inputdata_float();
| R[201] = inputdata_float();
| R[202] = inputdata_float();
| R[203] = inputdata_float();
| R[204] = inputdata_float();
| R[205] = inputdata_float();
| R[206] = inputdata_float();
| R[207] = inputdata_float();
| R[208] = inputdata_float();
| R[209] = inputdata_float();
| R[210] = inputdata_float();
| R[211] = inputdata_float();
| R[0] = acquireindex(C[18]);
| O[35] = cmpeq_select(I[110], C[0], C[1], I[112]);
| O[36] = add(C[2], I[113]);
| O[328] = div_f2i(O[36], O[35]);
| O[328] = maxi(O[328], C[3]);
| O[34] = i2f_mul(O[328], O[35]);
| O[36] = sub(O[36], O[34]);
| O[34] = addi(O[328], I[191]);
| outputdata_int32(0, 85, R[0], O[34]);
| outputdata_int32(0, 93, R[0], O[34]);
| O[34] = add(I[110], C[2]);
| outputdata_float(0, 352, R[0], O[34]);
| outputdata_float(0, 458, R[0], O[34]);
| O[328] = cmpgti(O[328], C[3]);
| O[35] = select(O[328], O[35], O[35]);
| O[36] = select(O[328], O[36], O[36]);
| O[328] = div(O[36], O[35]);
| outputdata_float(0, 357, R[0], O[35]);
| outputdata_float(0, 388, R[0], O[36]);
| outputdata_float(0, 389, R[0], O[328]);
| outputdata_float(0, 460, R[0], O[35]);
| outputdata_float(0, 631, R[0], O[36]);
| outputdata_float(0, 632, R[0], O[328]);
| O[328] = cmplei(I[190], C[3]);
| O[36] = select(O[328], C[3], I[189]);
| O[35] = select(O[328], C[3], I[190]);
| O[328] = cmpneqi(I[211], C[3]);
| O[328] = cmplei_logic_and(O[35], C[4], O[328]);
| O[36] = select(O[328], I[211], O[36]);
| O[98] = select(O[328], C[4], O[35]);
| O[328] = add(I[196], I[196]);
| O[58] = add(I[197], I[197]);
| O[61] = add(I[198], I[198]);
| O[35] = mul(I[197], O[58]);
| O[34] = mul(I[197], O[61]);
| O[59] = mul(I[198], O[61]);
| O[60] = mul(I[199], O[58]);
| O[57] = mul(I[199], O[61]);
| O[755] = mad_sub1(I[197], O[58], O[59], C[5]);
| O[603] = mul_sub0(I[196], O[58], O[57]);
| O[373] = mad(I[196], O[61], O[60]);
| O[126] = mad(I[196], O[58], O[57]);
| O[374] = mad_sub1(I[196], O[328], O[59], C[5]);
| O[99] = mul_sub1(I[199], O[328], O[34]);
| O[122] = mul_sub0(I[196], O[61], O[60]);
| O[61] = mad(I[199], O[328], O[34]);
| O[328] = mul_add(I[196], O[328], O[35]);
| O[60] = sub(C[5], O[328]);
| O[52] = mul(I[208], I[202]);
| O[35] = mul(C[6], O[52]);
| O[269] = mul(I[206], I[200]);
| O[8] = mul_mad1(C[7], O[269], C[7], C[0]);
| O[22] = mul(I[207], I[201]);
| O[59] = mul_mad1(C[7], C[0], C[7], O[22]);
| O[34] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[328] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[328] = mad_add(C[7], C[0], O[328], C[5]);
| O[50] = mad_add(C[7], C[0], O[59], C[0]);
| O[53] = mad_add(C[7], O[52], O[34], C[0]);
| O[59] = add(O[328], C[0]);
| O[328] = mad(C[0], C[0], O[269]);
| O[51] = add_mad1(C[0], C[0], C[0], C[0]);
| O[348] = add_mad1(C[0], C[0], C[0], O[35]);
| O[58] = add_mad1(O[22], C[0], C[0], C[0]);
| O[24] = add_mad1(C[0], C[0], C[0], O[35]);
| O[57] = add_mad1(C[0], C[0], C[0], C[0]);
| O[34] = add_mad1(O[52], C[0], C[0], O[35]);
| O[346] = mad_mad0(C[7], C[0], O[8], O[59], C[0]);
| O[345] = add_mad1(O[50], C[0], O[59], C[0]);
| O[53] = add_mad1(O[53], C[0], O[59], O[35]);
| O[347] = mul_mad1(O[328], O[755], O[51], O[603]);
| O[351] = mul_mad1(O[328], O[126], O[51], O[374]);
| O[349] = mul_mad1(O[328], O[122], O[51], O[61]);
| O[328] = mul_mad1(O[328], C[0], O[51], C[0]);
| O[51] = mad(C[0], C[5], C[0]);
| O[23] = mad_add(O[348], C[0], O[328], O[51]);
| O[328] = mad(C[0], C[0], C[0]);
| O[350] = mul_mad1(O[328], O[755], O[58], O[603]);
| O[50] = mul_mad1(O[328], O[126], O[58], O[374]);
| O[21] = mul_mad1(O[328], O[122], O[58], O[61]);
| O[328] = mul_mad1(O[328], C[0], O[58], C[0]);
| O[58] = mad(C[0], C[5], C[0]);
| O[25] = mad_add(O[24], C[0], O[328], O[58]);
| O[58] = mad(C[0], C[0], C[0]);
| O[54] = mul_mad1(O[58], O[755], O[57], O[603]);
| O[328] = mul_mad1(O[58], O[126], O[57], O[374]);
| O[8] = mul_mad1(O[58], O[122], O[57], O[61]);
| O[58] = mul_mad1(O[58], C[0], O[57], C[0]);
| O[57] = mad(C[0], C[5], C[0]);
| O[30] = mad_add(O[34], C[0], O[58], O[57]);
| O[51] = mul_mad1(O[346], O[755], O[345], O[603]);
| O[57] = mul_mad1(O[346], O[126], O[345], O[374]);
| O[58] = mul_mad1(O[346], O[122], O[345], O[61]);
| O[346] = mul_mad1(O[346], C[0], O[345], C[0]);
| O[346] = mad(O[53], C[0], O[346]);
| O[59] = mad_add(O[59], C[5], C[0], O[346]);
| O[351] = mad_add(O[348], O[99], O[351], C[0]);
| O[349] = mad_add(O[348], O[60], O[349], C[0]);
| O[345] = mad_mad0(O[348], O[373], O[347], O[23], I[193]);
| O[351] = mad(O[23], I[194], O[351]);
| O[343] = mad(O[23], I[195], O[349]);
| O[23] = mad(O[23], C[5], C[0]);
| O[50] = mad_add(O[24], O[99], O[50], C[0]);
| O[21] = mad_add(O[24], O[60], O[21], C[0]);
| O[24] = mad_mad0(O[24], O[373], O[350], O[25], I[193]);
| O[50] = mad(O[25], I[194], O[50]);
| O[346] = mad(O[25], I[195], O[21]);
| O[25] = mad(O[25], C[5], C[0]);
| O[328] = mad_add(O[34], O[99], O[328], C[0]);
| O[8] = mad_add(O[34], O[60], O[8], C[0]);
| O[34] = mad_mad0(O[34], O[373], O[54], O[30], I[193]);
| O[328] = mad(O[30], I[194], O[328]);
| O[8] = mad(O[30], I[195], O[8]);
| O[30] = mad(O[30], C[5], C[0]);
| O[57] = mad_add(O[53], O[99], O[57], C[0]);
| O[58] = mad_add(O[53], O[60], O[58], C[0]);
| O[348] = mad_mad0(O[53], O[373], O[51], O[59], I[193]);
| O[349] = mad(O[59], I[194], O[57]);
| O[350] = mad(O[59], I[195], O[58]);
| O[59] = mad(O[59], C[5], C[0]);
| outputdata_float(0, 295, R[0], O[59]);
| outputdata_float(0, 409, R[0], O[59]);
| outputdata_float(0, 553, R[0], O[59]);
| outputdata_float(0, 664, R[0], O[59]);
| O[379] = rcp(O[269]);
| O[21] = rcp(O[22]);
| O[347] = rcp(O[52]);
| O[58] = neg(O[35]);
| O[59] = neg(I[193]);
| O[380] = neg(I[194]);
| O[57] = mul_mad1(O[59], O[755], O[380], O[126]);
| O[54] = mul_mad1(O[59], O[603], O[380], O[374]);
| O[53] = mul_mad1(O[59], O[373], O[380], O[99]);
| O[344] = mul_mad1(O[59], C[0], O[380], C[0]);
| O[51] = neg(I[195]);
| O[125] = mad_add(O[51], C[0], O[344], C[5]);
| O[496] = mad_add(O[51], O[61], O[54], C[0]);
| O[54] = mad_add(O[51], O[60], O[53], C[0]);
| O[121] = neg(C[0]);
| O[57] = mad_mad0(O[51], O[122], O[57], O[125], O[121]);
| O[53] = neg(C[0]);
| O[342] = add_add(O[603], C[0], C[0]);
| O[794] = add_add(O[373], C[0], C[0]);
| O[344] = add_add(O[374], C[0], C[0]);
| O[798] = add_add(O[99], C[0], C[0]);
| O[270] = add_add(O[61], C[0], C[0]);
| O[97] = add_add(O[60], C[0], C[0]);
| O[679] = mad_add(O[125], O[53], O[496], C[0]);
| O[54] = mad_add(O[125], O[58], O[54], C[0]);
| O[532] = mad_add(O[125], C[5], C[0], C[0]);
| O[417] = mul_mad1(O[755], O[379], O[342], C[0]);
| O[795] = mul_mad1(O[755], C[0], O[342], O[21]);
| O[796] = mul_mad1(O[755], C[0], O[342], C[0]);
| O[342] = mul_mad1(O[755], C[0], O[342], C[0]);
| O[125] = add(C[0], C[0]);
| O[797] = mad_add(O[794], C[0], O[342], O[125]);
| O[421] = mul_mad1(O[126], O[379], O[344], C[0]);
| O[799] = mul_mad1(O[126], C[0], O[344], O[21]);
| O[604] = mul_mad1(O[126], C[0], O[344], C[0]);
| O[344] = mul_mad1(O[126], C[0], O[344], C[0]);
| O[342] = add(C[0], C[0]);
| O[643] = mad_add(O[798], C[0], O[344], O[342]);
| O[496] = mul_mad1(O[122], O[379], O[270], C[0]);
| O[342] = mul_mad1(O[122], C[0], O[270], O[21]);
| O[344] = mul_mad1(O[122], C[0], O[270], C[0]);
| O[270] = mul_mad1(O[122], C[0], O[270], C[0]);
| O[125] = mad_add(O[97], C[0], O[270], O[125]);
| O[379] = mul_mad1(O[57], O[379], O[679], C[0]);
| O[21] = mul_mad1(O[57], C[0], O[679], O[21]);
| O[270] = mul_mad1(O[57], C[0], O[679], C[0]);
| O[57] = mul_mad1(O[57], C[0], O[679], C[0]);
| O[57] = mad_add(O[54], C[0], O[57], O[532]);
| O[795] = mad_add(O[794], C[0], O[795], C[0]);
| O[796] = mad_add(O[794], O[347], O[796], C[0]);
| O[794] = mad_mad0(O[794], C[0], O[417], O[797], C[6]);
| outputdata_float(0, 336, R[0], O[794]);
| outputdata_float(0, 442, R[0], O[794]);
| outputdata_float(0, 586, R[0], O[794]);
| outputdata_float(0, 700, R[0], O[794]);
| O[795] = mad(O[797], C[6], O[795]);
| outputdata_float(0, 337, R[0], O[795]);
| outputdata_float(0, 443, R[0], O[795]);
| outputdata_float(0, 587, R[0], O[795]);
| outputdata_float(0, 701, R[0], O[795]);
| O[796] = mad(O[797], C[6], O[796]);
| outputdata_float(0, 338, R[0], O[796]);
| outputdata_float(0, 444, R[0], O[796]);
| outputdata_float(0, 588, R[0], O[796]);
| outputdata_float(0, 702, R[0], O[796]);
| O[797] = add(O[797], C[0]);
| outputdata_float(0, 339, R[0], O[797]);
| outputdata_float(0, 445, R[0], O[797]);
| outputdata_float(0, 589, R[0], O[797]);
| outputdata_float(0, 703, R[0], O[797]);
| O[799] = mad_add(O[798], C[0], O[799], C[0]);
| O[604] = mad_add(O[798], O[347], O[604], C[0]);
| O[798] = mad_mad0(O[798], C[0], O[421], O[643], C[6]);
| outputdata_float(0, 340, R[0], O[798]);
| outputdata_float(0, 446, R[0], O[798]);
| outputdata_float(0, 590, R[0], O[798]);
| outputdata_float(0, 704, R[0], O[798]);
| O[799] = mad(O[643], C[6], O[799]);
| outputdata_float(0, 341, R[0], O[799]);
| outputdata_float(0, 447, R[0], O[799]);
| outputdata_float(0, 591, R[0], O[799]);
| outputdata_float(0, 705, R[0], O[799]);
| O[604] = mad(O[643], C[6], O[604]);
| outputdata_float(0, 342, R[0], O[604]);
| outputdata_float(0, 448, R[0], O[604]);
| outputdata_float(0, 592, R[0], O[604]);
| outputdata_float(0, 706, R[0], O[604]);
| O[643] = add(O[643], C[0]);
| outputdata_float(0, 343, R[0], O[643]);
| outputdata_float(0, 449, R[0], O[643]);
| outputdata_float(0, 593, R[0], O[643]);
| outputdata_float(0, 707, R[0], O[643]);
| O[342] = mad_add(O[97], C[0], O[342], C[0]);
| O[344] = mad_add(O[97], O[347], O[344], C[0]);
| O[97] = mad_mad0(O[97], C[0], O[496], O[125], C[6]);
| O[342] = mad(O[125], C[6], O[342]);
| O[344] = mad(O[125], C[6], O[344]);
| O[125] = add(O[125], C[0]);
| outputdata_float(0, 347, R[0], O[125]);
| outputdata_float(0, 453, R[0], O[125]);
| outputdata_float(0, 597, R[0], O[125]);
| outputdata_float(0, 711, R[0], O[125]);
| O[21] = mad_add(O[54], C[0], O[21], C[0]);
| O[347] = mad_add(O[54], O[347], O[270], C[0]);
| O[54] = mad_mad0(O[54], C[0], O[379], O[57], C[6]);
| O[21] = mad(O[57], C[6], O[21]);
| O[347] = mad(O[57], C[6], O[347]);
| O[57] = add(O[57], C[0]);
| outputdata_float(0, 351, R[0], O[57]);
| outputdata_float(0, 457, R[0], O[57]);
| outputdata_float(0, 601, R[0], O[57]);
| outputdata_float(0, 715, R[0], O[57]);
| O[379] = mul_mad1(O[59], O[755], O[380], O[126]);
| O[270] = mul_mad1(O[59], O[603], O[380], O[374]);
| O[57] = mul_mad1(O[59], O[373], O[380], O[99]);
| O[59] = mul_mad1(O[59], C[0], O[380], C[0]);
| O[59] = mad_add(O[51], C[0], O[59], C[5]);
| O[270] = mad_add(O[51], O[61], O[270], C[0]);
| O[57] = mad_add(O[51], O[60], O[57], C[0]);
| O[51] = mad_mad0(O[51], O[122], O[379], O[59], O[121]);
| O[643] = add_add(O[603], C[0], C[0]);
| O[496] = add_add(O[373], C[0], C[0]);
| O[125] = add_add(O[374], C[0], C[0]);
| O[380] = add_add(O[99], C[0], C[0]);
| O[121] = add_add(O[61], C[0], C[0]);
| O[379] = add_add(O[60], C[0], C[0]);
| O[53] = mad_add(O[59], O[53], O[270], C[0]);
| O[57] = mad_add(O[59], O[58], O[57], C[0]);
| O[58] = mad_add(O[59], C[5], C[0], C[0]);
| O[270] = add(O[126], C[0]);
| O[59] = add(O[122], C[0]);
| O[604] = add(O[374], C[0]);
| O[61] = add(O[61], C[0]);
| O[99] = add(O[99], C[0]);
| O[60] = add(O[60], C[0]);
| outputdata_float(0, 179, R[0], O[270]);
| outputdata_float(0, 195, R[0], O[270]);
| outputdata_float(0, 373, R[0], O[270]);
| outputdata_float(0, 491, R[0], O[270]);
| outputdata_float(0, 507, R[0], O[270]);
| outputdata_float(0, 180, R[0], O[59]);
| outputdata_float(0, 196, R[0], O[59]);
| outputdata_float(0, 374, R[0], O[59]);
| outputdata_float(0, 492, R[0], O[59]);
| outputdata_float(0, 508, R[0], O[59]);
| O[374] = mul_mad1(C[0], O[755], C[0], O[603]);
| outputdata_float(0, 182, R[0], O[603]);
| outputdata_float(0, 198, R[0], O[603]);
| outputdata_float(0, 376, R[0], O[603]);
| outputdata_float(0, 494, R[0], O[603]);
| outputdata_float(0, 510, R[0], O[603]);
| O[270] = mul_mad1(C[0], O[270], C[0], O[604]);
| outputdata_float(0, 183, R[0], O[604]);
| outputdata_float(0, 199, R[0], O[604]);
| outputdata_float(0, 377, R[0], O[604]);
| outputdata_float(0, 495, R[0], O[604]);
| outputdata_float(0, 511, R[0], O[604]);
| O[59] = mul_mad1(C[0], O[59], C[0], O[61]);
| outputdata_float(0, 184, R[0], O[61]);
| outputdata_float(0, 200, R[0], O[61]);
| outputdata_float(0, 378, R[0], O[61]);
| outputdata_float(0, 496, R[0], O[61]);
| outputdata_float(0, 512, R[0], O[61]);
| O[61] = mul_mad1(C[0], C[0], C[0], C[0]);
| outputdata_float(0, 186, R[0], O[373]);
| outputdata_float(0, 202, R[0], O[373]);
| outputdata_float(0, 380, R[0], O[373]);
| outputdata_float(0, 498, R[0], O[373]);
| outputdata_float(0, 514, R[0], O[373]);
| outputdata_float(0, 187, R[0], O[99]);
| outputdata_float(0, 203, R[0], O[99]);
| outputdata_float(0, 381, R[0], O[99]);
| outputdata_float(0, 499, R[0], O[99]);
| outputdata_float(0, 515, R[0], O[99]);
| outputdata_float(0, 188, R[0], O[60]);
| outputdata_float(0, 204, R[0], O[60]);
| outputdata_float(0, 382, R[0], O[60]);
| outputdata_float(0, 500, R[0], O[60]);
| outputdata_float(0, 516, R[0], O[60]);
| O[373] = mad_add(O[35], O[373], O[374], I[193]);
| outputdata_float(0, 190, R[0], O[373]);
| outputdata_float(0, 206, R[0], O[373]);
| outputdata_float(0, 384, R[0], O[373]);
| outputdata_float(0, 502, R[0], O[373]);
| outputdata_float(0, 518, R[0], O[373]);
| O[99] = mad_add(O[35], O[99], O[270], I[194]);
| outputdata_float(0, 191, R[0], O[99]);
| outputdata_float(0, 207, R[0], O[99]);
| outputdata_float(0, 385, R[0], O[99]);
| outputdata_float(0, 503, R[0], O[99]);
| outputdata_float(0, 519, R[0], O[99]);
| O[60] = mad_add(O[35], O[60], O[59], I[195]);
| outputdata_float(0, 192, R[0], O[60]);
| outputdata_float(0, 208, R[0], O[60]);
| outputdata_float(0, 386, R[0], O[60]);
| outputdata_float(0, 504, R[0], O[60]);
| outputdata_float(0, 520, R[0], O[60]);
| O[35] = mad_add(O[35], C[0], O[61], C[5]);
| outputdata_float(0, 193, R[0], O[35]);
| outputdata_float(0, 209, R[0], O[35]);
| outputdata_float(0, 387, R[0], O[35]);
| outputdata_float(0, 505, R[0], O[35]);
| outputdata_float(0, 521, R[0], O[35]);
| O[59] = mul_mad1(C[7], O[269], C[7], C[0]);
| O[60] = mul_mad1(C[7], C[0], C[7], O[22]);
| O[61] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[35] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[59] = mad(C[7], C[0], O[59]);
| outputdata_float(0, 534, R[0], O[59]);
| outputdata_float(0, 645, R[0], O[59]);
| O[60] = mad(C[7], C[0], O[60]);
| outputdata_float(0, 535, R[0], O[60]);
| outputdata_float(0, 646, R[0], O[60]);
| O[61] = mad(C[7], O[52], O[61]);
| outputdata_float(0, 536, R[0], O[61]);
| outputdata_float(0, 647, R[0], O[61]);
| O[35] = mad_add(C[7], C[0], O[35], C[5]);
| outputdata_float(0, 537, R[0], O[35]);
| outputdata_float(0, 648, R[0], O[35]);
| O[35] = rcp(O[269]);
| outputdata_float(0, 474, R[0], O[35]);
| outputdata_float(0, 615, R[0], O[35]);
| O[35] = rcp(O[22]);
| outputdata_float(0, 479, R[0], O[35]);
| outputdata_float(0, 620, R[0], O[35]);
| O[35] = rcp(O[52]);
| outputdata_float(0, 484, R[0], O[35]);
| outputdata_float(0, 625, R[0], O[35]);
| O[270] = add(C[0], C[0]);
| O[373] = add(C[0], C[0]);
| O[99] = add(C[0], C[0]);
| external_func_call(O[755], O[643], O[496], O[373], O[126], O[125], O[380], O[270], O[122], O[121], O[379], O[99], O[51], O[53], O[57], O[58]O[59], O[60], O[61], O[35]);
| outputdata_float(0, 178, R[0], O[755]);
| outputdata_float(0, 194, R[0], O[755]);
| outputdata_float(0, 304, R[0], O[755]);
| outputdata_float(0, 305, R[0], O[643]);
| outputdata_float(0, 306, R[0], O[496]);
| outputdata_float(0, 307, R[0], O[373]);
| outputdata_float(0, 308, R[0], O[126]);
| outputdata_float(0, 309, R[0], O[125]);
| outputdata_float(0, 310, R[0], O[380]);
| outputdata_float(0, 311, R[0], O[270]);
| outputdata_float(0, 312, R[0], O[122]);
| outputdata_float(0, 313, R[0], O[121]);
| outputdata_float(0, 314, R[0], O[379]);
| outputdata_float(0, 315, R[0], O[99]);
| outputdata_float(0, 316, R[0], O[51]);
| outputdata_float(0, 317, R[0], O[53]);
| outputdata_float(0, 318, R[0], O[57]);
| outputdata_float(0, 319, R[0], O[58]);
| outputdata_float(0, 320, R[0], O[755]);
| outputdata_float(0, 321, R[0], O[643]);
| outputdata_float(0, 322, R[0], O[496]);
| outputdata_float(0, 323, R[0], O[373]);
| outputdata_float(0, 324, R[0], O[126]);
| outputdata_float(0, 325, R[0], O[125]);
| outputdata_float(0, 326, R[0], O[380]);
| outputdata_float(0, 327, R[0], O[270]);
| outputdata_float(0, 328, R[0], O[122]);
| outputdata_float(0, 329, R[0], O[121]);
| outputdata_float(0, 330, R[0], O[379]);
| outputdata_float(0, 331, R[0], O[99]);
| outputdata_float(0, 332, R[0], O[51]);
| outputdata_float(0, 333, R[0], O[53]);
| outputdata_float(0, 334, R[0], O[57]);
| outputdata_float(0, 335, R[0], O[58]);
| outputdata_float(0, 372, R[0], O[755]);
| outputdata_float(0, 410, R[0], O[755]);
| outputdata_float(0, 411, R[0], O[643]);
| outputdata_float(0, 412, R[0], O[496]);
| outputdata_float(0, 413, R[0], O[373]);
| outputdata_float(0, 414, R[0], O[126]);
| outputdata_float(0, 415, R[0], O[125]);
| outputdata_float(0, 416, R[0], O[380]);
| outputdata_float(0, 417, R[0], O[270]);
| outputdata_float(0, 418, R[0], O[122]);
| outputdata_float(0, 419, R[0], O[121]);
| outputdata_float(0, 420, R[0], O[379]);
| outputdata_float(0, 421, R[0], O[99]);
| outputdata_float(0, 422, R[0], O[51]);
| outputdata_float(0, 423, R[0], O[53]);
| outputdata_float(0, 424, R[0], O[57]);
| outputdata_float(0, 425, R[0], O[58]);
| outputdata_float(0, 426, R[0], O[755]);
| outputdata_float(0, 427, R[0], O[643]);
| outputdata_float(0, 428, R[0], O[496]);
| outputdata_float(0, 429, R[0], O[373]);
| outputdata_float(0, 430, R[0], O[126]);
| outputdata_float(0, 431, R[0], O[125]);
| outputdata_float(0, 432, R[0], O[380]);
| outputdata_float(0, 433, R[0], O[270]);
| outputdata_float(0, 434, R[0], O[122]);
| outputdata_float(0, 435, R[0], O[121]);
| outputdata_float(0, 436, R[0], O[379]);
| outputdata_float(0, 437, R[0], O[99]);
| outputdata_float(0, 438, R[0], O[51]);
| outputdata_float(0, 439, R[0], O[53]);
| outputdata_float(0, 440, R[0], O[57]);
| outputdata_float(0, 441, R[0], O[58]);
| outputdata_float(0, 490, R[0], O[755]);
| outputdata_float(0, 506, R[0], O[755]);
| outputdata_float(0, 554, R[0], O[755]);
| outputdata_float(0, 555, R[0], O[643]);
| outputdata_float(0, 556, R[0], O[496]);
| outputdata_float(0, 557, R[0], O[373]);
| outputdata_float(0, 558, R[0], O[126]);
| outputdata_float(0, 559, R[0], O[125]);
| outputdata_float(0, 560, R[0], O[380]);
| outputdata_float(0, 561, R[0], O[270]);
| outputdata_float(0, 562, R[0], O[122]);
| outputdata_float(0, 563, R[0], O[121]);
| outputdata_float(0, 564, R[0], O[379]);
| outputdata_float(0, 565, R[0], O[99]);
| outputdata_float(0, 566, R[0], O[51]);
| outputdata_float(0, 567, R[0], O[53]);
| outputdata_float(0, 568, R[0], O[57]);
| outputdata_float(0, 569, R[0], O[58]);
| outputdata_float(0, 570, R[0], O[755]);
| outputdata_float(0, 571, R[0], O[643]);
| outputdata_float(0, 572, R[0], O[496]);
| outputdata_float(0, 573, R[0], O[373]);
| outputdata_float(0, 574, R[0], O[126]);
| outputdata_float(0, 575, R[0], O[125]);
| outputdata_float(0, 576, R[0], O[380]);
| outputdata_float(0, 577, R[0], O[270]);
| outputdata_float(0, 578, R[0], O[122]);
| outputdata_float(0, 579, R[0], O[121]);
| outputdata_float(0, 580, R[0], O[379]);
| outputdata_float(0, 581, R[0], O[99]);
| outputdata_float(0, 582, R[0], O[51]);
| outputdata_float(0, 583, R[0], O[53]);
| outputdata_float(0, 584, R[0], O[57]);
| outputdata_float(0, 585, R[0], O[58]);
| outputdata_float(0, 668, R[0], O[755]);
| outputdata_float(0, 669, R[0], O[643]);
| outputdata_float(0, 670, R[0], O[496]);
| outputdata_float(0, 671, R[0], O[373]);
| outputdata_float(0, 672, R[0], O[126]);
| outputdata_float(0, 673, R[0], O[125]);
| outputdata_float(0, 674, R[0], O[380]);
| outputdata_float(0, 675, R[0], O[270]);
| outputdata_float(0, 676, R[0], O[122]);
| outputdata_float(0, 677, R[0], O[121]);
| outputdata_float(0, 678, R[0], O[379]);
| outputdata_float(0, 679, R[0], O[99]);
| outputdata_float(0, 680, R[0], O[51]);
| outputdata_float(0, 681, R[0], O[53]);
| outputdata_float(0, 682, R[0], O[57]);
| outputdata_float(0, 683, R[0], O[58]);
| outputdata_float(0, 684, R[0], O[755]);
| outputdata_float(0, 685, R[0], O[643]);
| outputdata_float(0, 686, R[0], O[496]);
| outputdata_float(0, 687, R[0], O[373]);
| outputdata_float(0, 688, R[0], O[126]);
| outputdata_float(0, 689, R[0], O[125]);
| outputdata_float(0, 690, R[0], O[380]);
| outputdata_float(0, 691, R[0], O[270]);
| outputdata_float(0, 692, R[0], O[122]);
| outputdata_float(0, 693, R[0], O[121]);
| outputdata_float(0, 694, R[0], O[379]);
| outputdata_float(0, 695, R[0], O[99]);
| outputdata_float(0, 696, R[0], O[51]);
| outputdata_float(0, 697, R[0], O[53]);
| outputdata_float(0, 698, R[0], O[57]);
| outputdata_float(0, 699, R[0], O[58]);
| O[53] = mul_mad1(O[345], C[6], O[24], C[6]);
| O[57] = mul_mad1(O[351], C[6], O[50], C[6]);
| O[58] = mul_mad1(O[343], C[6], O[346], C[6]);
| O[53] = mad_add(O[34], C[6], O[53], O[348]);
| O[57] = mad_add(O[328], C[6], O[57], O[349]);
| O[58] = mad_add(O[8], C[6], O[58], O[350]);
| O[35] = mul(O[35], C[8]);
| O[51] = clamp(I[192], C[0], C[9]);
| outputdata_float(0, 391, R[0], O[51]);
| O[51] = cmpneqi(I[183], C[10]);
| O[51] = cmpnei_logic_and(I[183], C[11], O[51]);
| O[51] = cmpeqi_logic_and(O[98], C[3], O[51]);
| O[51] = cmplei_logic_and(I[184], O[98], O[51]);
| O[99] = cmpeqi(I[183], C[12]);
| O[99] = cmpeqi_logic_or(I[183], C[4], O[99]);
| O[99] = cmpeqi_logic_and(O[36], C[4], O[99]);
| O[99] = b2i(O[99]);
| O[99] = cmpeqi_select(O[99], C[3], O[36], C[12]);
| O[379] = select(O[51], O[99], I[183]);
| O[99] = select(O[51], O[98], I[184]);
| O[51] = cmpneqi(O[98], C[3]);
| O[51] = cmpnei_logic_and(O[36], C[3], O[51]);
| O[121] = cmpneqi(O[379], C[11]);
| O[121] = cmpnei_logic_and(O[379], C[10], O[121]);
| O[51] = logic_and(O[51], O[121]);
| O[51] = cmplei_logic_and(O[99], C[12], O[51]);
| O[379] = select(O[51], C[12], O[379]);
| O[99] = select(O[51], C[12], O[99]);
| O[51] = cmpeqi(O[98], C[4]);
| O[51] = cmpeqi(I[210], C[3]);
| O[51] = cmpnei_logic_and(O[379], C[3], O[51]);
| O[51] = cmpnei_logic_and(O[99], C[3], O[51]);
| O[51] = cmplei_logic_and(O[99], C[10], O[51]);
| O[379] = select(O[51], C[10], O[379]);
| outputdata_int32(0, 81, R[0], O[379]);
| O[51] = select(O[51], C[10], O[99]);
| outputdata_int32(0, 82, R[0], O[51]);
| O[51] = mul(I[204], C[2]);
| O[99] = mul(I[203], C[2]);
| O[99] = mul_mad1(O[51], O[51], O[99], O[99]);
| O[51] = mul(I[205], C[2]);
| O[51] = mad_sqrt(O[51], O[51], O[99]);
| O[51] = fmod_add(I[104], C[13], O[51]);
| outputdata_float(0, 359, R[0], O[51]);
| external_func_call(C[3]O[379], O[99], O[51]);
| O[379] = i2f_div1(O[379], O[269]);
| outputdata_float(0, 353, R[0], O[379]);
| outputdata_float(0, 360, R[0], O[379]);
| outputdata_float(0, 522, R[0], O[269]);
| outputdata_float(0, 633, R[0], O[269]);
| outputdata_float(0, 665, R[0], O[269]);
| O[99] = i2f_div1(O[99], O[22]);
| outputdata_float(0, 354, R[0], O[99]);
| outputdata_float(0, 527, R[0], O[22]);
| outputdata_float(0, 638, R[0], O[22]);
| outputdata_float(0, 666, R[0], O[22]);
| O[51] = i2f_div1(O[51], O[52]);
| outputdata_float(0, 355, R[0], O[51]);
| outputdata_float(0, 532, R[0], O[52]);
| outputdata_float(0, 643, R[0], O[52]);
| outputdata_float(0, 667, R[0], O[52]);
| outputdata_int32(0, 86, R[0], I[187]);
| O[52] = i2f(I[187]);
| O[52] = f2i(O[52]);
| outputdata_int32(0, 88, R[0], O[52]);
| O[52] = cmpeq_select(I[0], C[0], C[14], I[1]);
| outputdata_float(0, 1, R[0], O[52]);
| outputdata_int32(0, 6, R[0], I[118]);
| O[52] = add(I[0], C[2]);
| outputdata_float(0, 0, R[0], O[52]);
| outputdata_int32(0, 1, R[0], I[114]);
| O[52] = cmpneqi(I[115], C[10]);
| O[52] = cmpnei_logic_and(I[115], C[11], O[52]);
| O[52] = cmpeqi_logic_and(O[98], C[3], O[52]);
| O[51] = cmplei_logic_and(I[116], O[98], O[52]);
| O[52] = cmpeqi(I[115], C[12]);
| O[52] = cmpeqi_logic_or(I[115], C[4], O[52]);
| O[52] = cmpeqi_logic_and(O[36], C[4], O[52]);
| O[52] = b2i(O[52]);
| O[52] = cmpeqi_select(O[52], C[3], O[36], C[12]);
| O[52] = select(O[51], O[52], I[115]);
| O[51] = select(O[51], O[98], I[116]);
| outputdata_int32(0, 91, R[0], O[36]);
| O[22] = cmpeqi(O[98], C[4]);
| outputdata_int32(0, 92, R[0], O[98]);
| O[36] = cmpnei_logic_and(O[36], C[3], O[22]);
| O[22] = cmpneqi(O[52], C[10]);
| O[22] = cmpnei_logic_and(O[52], C[11], O[22]);
| O[36] = logic_and(O[36], O[22]);
| O[36] = cmplei_logic_and(O[51], C[12], O[36]);
| O[52] = select(O[36], C[12], O[52]);
| O[51] = select(O[36], C[12], O[51]);
| O[36] = cmpneqi(O[51], C[3]);
| O[36] = cmpnei_logic_and(O[52], C[3], O[36]);
| O[36] = cmpeqi_logic_and(I[209], C[3], O[36]);
| O[22] = cmpneqi(O[52], C[11]);
| O[22] = cmpnei_logic_and(O[52], C[10], O[22]);
| O[36] = cmplei_logic_and(O[51], C[10], O[36]);
| O[52] = select(O[36], C[10], O[52]);
| O[36] = select(O[36], C[10], O[51]);
| O[22] = mul(I[203], C[2]);
| O[22] = mul_mad1(O[51], O[51], O[22], O[22]);
| O[51] = mad_sqrt(O[51], O[51], O[22]);
| outputdata_int32(0, 5, R[0], I[117]);
| O[51] = fmod_add(I[8], C[13], O[51]);
| outputdata_float(0, 9, R[0], O[51]);
| external_func_call(C[12]O[51], R[65535], R[65535]);
| O[51] = i2f_div1(O[51], I[101]);
| outputdata_float(0, 10, R[0], O[51]);
| outputdata_float(0, 225, R[0], I[101]);
| outputdata_float(0, 301, R[0], I[101]);
| O[51] = mul_mad1(O[351], O[351], O[345], O[345]);
| O[51] = mad_mad0(O[343], O[343], O[51], O[23], O[23]);
| outputdata_float(0, 283, R[0], O[23]);
| outputdata_float(0, 397, R[0], O[23]);
| outputdata_float(0, 541, R[0], O[23]);
| outputdata_float(0, 652, R[0], O[23]);
| O[23] = sqrt(O[51]);
| O[51] = mul_mad1(O[50], O[50], O[24], O[24]);
| O[51] = mad_mad0(O[346], O[346], O[51], O[25], O[25]);
| outputdata_float(0, 287, R[0], O[25]);
| outputdata_float(0, 401, R[0], O[25]);
| outputdata_float(0, 545, R[0], O[25]);
| outputdata_float(0, 656, R[0], O[25]);
| O[25] = sqrt(O[51]);
| O[51] = mul_mad1(O[328], O[328], O[34], O[34]);
| O[51] = mad_mad0(O[8], O[8], O[51], O[30], O[30]);
| outputdata_float(0, 291, R[0], O[30]);
| outputdata_float(0, 405, R[0], O[30]);
| outputdata_float(0, 549, R[0], O[30]);
| outputdata_float(0, 660, R[0], O[30]);
| O[51] = sqrt(O[51]);
| O[269] = mul(O[23], C[6]);
| O[30] = mul(O[25], C[6]);
| O[379] = mul(O[51], C[6]);
| O[51] = mul_mad1(O[345], C[6], O[24], C[6]);
| O[25] = mul_mad1(O[351], C[6], O[50], C[6]);
| O[23] = mul_mad1(O[343], C[6], O[346], C[6]);
| O[51] = mad_add(O[34], C[6], O[51], O[348]);
| O[25] = mad_add(O[328], C[6], O[25], O[349]);
| O[23] = mad_add(O[8], C[6], O[23], O[350]);
| external_func_call(C[4], I[156], O[51], O[25], O[23], I[196], I[197], I[198], I[199], O[269], O[30], O[379], C[5], C[0], C[0], C[5]);
| outputdata_int32(0, 50, R[0], I[156]);
| outputdata_float(0, 108, R[0], I[9]);
| outputdata_float(0, 109, R[0], I[10]);
| O[30] = mul(I[196], C[16]);
| O[30] = mul_add(I[199], C[15], O[30]);
| O[22] = mul(I[196], C[15]);
| O[99] = mul_mad1(I[199], C[16], O[22], C[8]);
| O[22] = mul(I[197], C[16]);
| O[22] = mad_add(C[0], C[8], C[0], O[22]);
| O[98] = mul(I[197], C[15]);
| O[98] = add_mad1(C[0], C[0], O[98], C[8]);
| O[30] = add_mad1(C[0], O[30], C[0], C[8]);
| O[22] = mul_add(I[198], C[15], O[22]);
| O[98] = mul_add(I[198], C[16], O[98]);
| O[99] = mad_mad0(C[0], C[8], O[99], C[0], C[8]);
| external_func_call(C[4], C[17], O[51], O[25], O[23], O[30], O[22], O[98], O[99], O[269], O[379], I[129], I[131], C[6], C[0], C[0], C[5]);
| outputdata_float(0, 3, R[0], I[3]);
| outputdata_int32(0, 22, R[0], I[129]);
| outputdata_int32(0, 24, R[0], I[131]);
| O[25] = add(C[2], I[71]);
| outputdata_float(0, 8, R[0], C[2]);
| outputdata_float(0, 358, R[0], C[2]);
| outputdata_float(0, 392, R[0], C[2]);
| O[51] = sub_neg(O[25], C[2]);
| outputdata_float(0, 121, R[0], O[51]);
| outputdata_float(0, 210, R[0], O[25]);
| O[25] = neg_cmplt(O[25], C[0]);
| O[30] = cmpge_logic_and(O[51], C[0], O[25]);
| external_func_call(C[12]O[25], O[23], O[22]);
| O[51] = mad(O[97], I[18], O[54]);
| outputdata_float(0, 344, R[0], O[97]);
| outputdata_float(0, 348, R[0], O[54]);
| outputdata_float(0, 450, R[0], O[97]);
| outputdata_float(0, 454, R[0], O[54]);
| outputdata_float(0, 594, R[0], O[97]);
| outputdata_float(0, 598, R[0], O[54]);
| outputdata_float(0, 708, R[0], O[97]);
| outputdata_float(0, 712, R[0], O[54]);
| O[54] = mad(O[342], I[18], O[21]);
| outputdata_float(0, 345, R[0], O[342]);
| outputdata_float(0, 349, R[0], O[21]);
| outputdata_float(0, 451, R[0], O[342]);
| outputdata_float(0, 455, R[0], O[21]);
| outputdata_float(0, 595, R[0], O[342]);
| outputdata_float(0, 599, R[0], O[21]);
| outputdata_float(0, 709, R[0], O[342]);
| outputdata_float(0, 713, R[0], O[21]);
| O[21] = mad(O[344], I[18], O[347]);
| outputdata_float(0, 117, R[0], I[18]);
| outputdata_float(0, 300, R[0], I[18]);
| outputdata_float(0, 346, R[0], O[344]);
| outputdata_float(0, 350, R[0], O[347]);
| outputdata_float(0, 452, R[0], O[344]);
| outputdata_float(0, 456, R[0], O[347]);
| outputdata_float(0, 596, R[0], O[344]);
| outputdata_float(0, 600, R[0], O[347]);
| outputdata_float(0, 710, R[0], O[344]);
| outputdata_float(0, 714, R[0], O[347]);
| external_func_call(C[12], O[51], O[54], O[21]R[65535], R[65535], O[51]);
| O[51] = ceil(O[51]);
| O[51] = f2i(O[51]);
| O[51] = clampi(O[51], C[3], O[22]);
| O[22] = muli(O[25], O[23]);
| O[22] = muli(O[22], O[51]);
| O[22] = muli(O[22], I[154]);
| outputdata_int32(0, 48, R[0], I[154]);
| O[22] = i2f_mul(O[22], I[14]);
| O[54] = max(O[22], C[5]);
| O[22] = cmpeq_select(O[22], C[0], C[0], O[54]);
| O[30] = f2i_select1(O[30], O[22], C[3]);
| O[22] = cmpgti(O[30], C[3]);
| outputdata_int32(0, 15, R[0], O[22]);
| outputdata_int32(0, 16, R[0], O[30]);
| O[25] = muli(O[25], O[23]);
| O[25] = muli(O[25], O[51]);
| outputdata_int32(0, 18, R[0], O[25]);
| outputdata_int32(0, 19, R[0], O[51]);
| O[23] = neg(C[6]);
| O[51] = mad(I[206], O[23], C[0]);
| O[25] = mad(I[207], O[23], C[0]);
| O[30] = mul(I[208], C[6]);
| O[23] = mad(I[208], O[23], O[30]);
| O[22] = mad(I[207], C[6], C[0]);
| O[54] = mad(I[208], C[6], O[30]);
| O[30] = mad(I[206], C[6], C[0]);
| external_func_call(C[10], C[18], C[18], O[51], O[25], O[23], O[30], O[22], O[54]);
| outputdata_float(0, 111, R[0], I[12]);
| outputdata_int32(0, 2, R[0], O[52]);
| outputdata_int32(0, 4, R[0], C[18]);
| outputdata_int32(0, 90, R[0], C[18]);
| external_func_call(C[11], O[53], O[57], O[58], O[59], O[60], O[61], O[35], I[19], I[20], I[21], C[3], C[17]R[65535]);
| outputdata_float(0, 2, R[0], I[2]);
| outputdata_float(0, 110, R[0], I[11]);
| outputdata_float(0, 118, R[0], I[19]);
| outputdata_float(0, 119, R[0], I[20]);
| outputdata_float(0, 120, R[0], I[21]);
| outputdata_float(0, 165, R[0], O[53]);
| outputdata_float(0, 166, R[0], O[57]);
| outputdata_float(0, 167, R[0], O[58]);
| outputdata_float(0, 168, R[0], O[53]);
| outputdata_float(0, 169, R[0], O[57]);
| outputdata_float(0, 170, R[0], O[58]);
| outputdata_float(0, 171, R[0], O[59]);
| outputdata_float(0, 172, R[0], O[60]);
| outputdata_float(0, 173, R[0], O[61]);
| outputdata_float(0, 174, R[0], O[35]);
| outputdata_float(0, 365, R[0], O[53]);
| outputdata_float(0, 366, R[0], O[57]);
| outputdata_float(0, 367, R[0], O[58]);
| outputdata_float(0, 368, R[0], O[59]);
| outputdata_float(0, 369, R[0], O[60]);
| outputdata_float(0, 370, R[0], O[61]);
| outputdata_float(0, 371, R[0], O[35]);
| outputdata_float(0, 461, R[0], O[53]);
| outputdata_float(0, 462, R[0], O[57]);
| outputdata_float(0, 463, R[0], O[58]);
| outputdata_float(0, 464, R[0], O[53]);
| outputdata_float(0, 465, R[0], O[57]);
| outputdata_float(0, 466, R[0], O[58]);
| outputdata_float(0, 467, R[0], O[59]);
| outputdata_float(0, 468, R[0], O[60]);
| outputdata_float(0, 469, R[0], O[61]);
| outputdata_float(0, 470, R[0], O[35]);
| outputdata_float(0, 602, R[0], O[53]);
| outputdata_float(0, 603, R[0], O[57]);
| outputdata_float(0, 604, R[0], O[58]);
| outputdata_float(0, 605, R[0], O[53]);
| outputdata_float(0, 606, R[0], O[57]);
| outputdata_float(0, 607, R[0], O[58]);
| outputdata_float(0, 608, R[0], O[59]);
| outputdata_float(0, 609, R[0], O[60]);
| outputdata_float(0, 610, R[0], O[61]);
| outputdata_float(0, 611, R[0], O[35]);
| outputdata_int32(0, 3, R[0], O[36]);
| outputdata_int32(0, 17, R[0], C[3]);
| outputdata_int32(0, 46, R[0], C[3]);
| outputdata_int32(0, 89, R[0], C[3]);
| external_func_call(C[19]O[30], O[25], O[52], O[57], O[59], O[61], O[58], O[60], O[35], O[22], O[23], O[51], O[347], O[36], O[53]);
| external_func_call(C[19]O[54]);
| O[54] = mul(C[20], O[54]);
| outputdata_int32(0, 7, R[0], I[119]);
| O[21] = tan(O[54]);
| O[54] = div(O[347], O[36]);
| O[344] = mul(O[21], O[54]);
| O[379] = rcp(O[344]);
| O[98] = rcp(O[21]);
| O[344] = add(O[348], O[345]);
| outputdata_float(0, 280, R[0], O[345]);
| outputdata_float(0, 394, R[0], O[345]);
| outputdata_float(0, 538, R[0], O[345]);
| outputdata_float(0, 649, R[0], O[345]);
| O[345] = add(O[349], O[351]);
| outputdata_float(0, 281, R[0], O[351]);
| outputdata_float(0, 395, R[0], O[351]);
| outputdata_float(0, 539, R[0], O[351]);
| outputdata_float(0, 650, R[0], O[351]);
| O[351] = add(O[350], O[343]);
| outputdata_float(0, 282, R[0], O[343]);
| outputdata_float(0, 396, R[0], O[343]);
| outputdata_float(0, 540, R[0], O[343]);
| outputdata_float(0, 651, R[0], O[343]);
| O[125] = sub(O[344], O[348]);
| O[270] = sub(O[345], O[349]);
| O[121] = sub(O[351], O[350]);
| O[351] = add(O[348], O[24]);
| outputdata_float(0, 284, R[0], O[24]);
| outputdata_float(0, 398, R[0], O[24]);
| outputdata_float(0, 542, R[0], O[24]);
| outputdata_float(0, 653, R[0], O[24]);
| O[24] = add(O[349], O[50]);
| outputdata_float(0, 285, R[0], O[50]);
| outputdata_float(0, 399, R[0], O[50]);
| outputdata_float(0, 543, R[0], O[50]);
| outputdata_float(0, 654, R[0], O[50]);
| O[50] = add(O[350], O[346]);
| outputdata_float(0, 286, R[0], O[346]);
| outputdata_float(0, 400, R[0], O[346]);
| outputdata_float(0, 544, R[0], O[346]);
| outputdata_float(0, 655, R[0], O[346]);
| O[126] = sub(O[351], O[348]);
| O[380] = sub(O[24], O[349]);
| O[122] = sub(O[50], O[350]);
| O[50] = add(O[348], O[34]);
| outputdata_float(0, 288, R[0], O[34]);
| outputdata_float(0, 402, R[0], O[34]);
| outputdata_float(0, 546, R[0], O[34]);
| outputdata_float(0, 657, R[0], O[34]);
| O[34] = add(O[349], O[328]);
| outputdata_float(0, 289, R[0], O[328]);
| outputdata_float(0, 403, R[0], O[328]);
| outputdata_float(0, 547, R[0], O[328]);
| outputdata_float(0, 658, R[0], O[328]);
| O[328] = add(O[350], O[8]);
| outputdata_float(0, 290, R[0], O[8]);
| outputdata_float(0, 404, R[0], O[8]);
| outputdata_float(0, 548, R[0], O[8]);
| outputdata_float(0, 659, R[0], O[8]);
| O[269] = sub(O[50], O[348]);
| O[99] = sub(O[34], O[349]);
| O[346] = sub(O[328], O[350]);
| O[351] = sub(O[348], O[30]);
| O[8] = sub(O[349], O[25]);
| O[328] = sub(O[350], O[52]);
| O[34] = mul_mad1(O[8], O[59], O[351], O[57]);
| O[34] = mad(O[328], O[61], O[34]);
| O[50] = max(O[34], C[21]);
| O[24] = step(C[22], O[34]);
| O[34] = mul_mad1(O[8], O[23], O[351], O[22]);
| O[34] = mad(O[328], O[51], O[34]);
| O[34] = div_mul(O[34], O[50], O[379]);
| O[34] = mad(O[34], C[6], C[6]);
| O[8] = mul_mad1(O[8], O[60], O[351], O[58]);
| O[328] = mad(O[328], O[35], O[8]);
| O[328] = div_mul(O[328], O[50], O[98]);
| O[328] = mad(O[328], C[7], C[6]);
| O[50] = lerp(C[23], O[34], O[24]);
| O[50] = min(C[23], O[50]);
| O[34] = lerp(C[24], O[34], O[24]);
| O[8] = max(C[24], O[34]);
| O[34] = lerp(C[23], O[328], O[24]);
| O[34] = min(C[23], O[34]);
| O[328] = lerp(C[24], O[328], O[24]);
| O[328] = max(C[24], O[328]);
| outputdata_int32(0, 11, R[0], I[123]);
| O[344] = add(O[348], O[125]);
| O[345] = add(O[349], O[270]);
| O[351] = add(O[350], O[121]);
| O[97] = sub(O[344], O[30]);
| O[343] = sub(O[345], O[25]);
| O[351] = sub(O[351], O[52]);
| O[345] = mul_mad1(O[343], O[59], O[97], O[57]);
| O[345] = mad(O[351], O[61], O[345]);
| O[344] = max(O[345], C[21]);
| O[342] = step(C[22], O[345]);
| O[345] = mul_mad1(O[343], O[23], O[97], O[22]);
| O[345] = mad(O[351], O[51], O[345]);
| O[345] = div_mul(O[345], O[344], O[379]);
| O[345] = mad(O[345], C[6], C[6]);
| O[343] = mul_mad1(O[343], O[60], O[97], O[58]);
| O[351] = mad(O[351], O[35], O[343]);
| O[351] = div_mul(O[351], O[344], O[98]);
| O[351] = mad(O[351], C[7], C[6]);
| O[344] = lerp(O[50], O[345], O[342]);
| O[50] = min(O[50], O[344]);
| O[345] = lerp(O[8], O[345], O[342]);
| O[8] = max(O[8], O[345]);
| O[345] = lerp(O[34], O[351], O[342]);
| O[34] = min(O[34], O[345]);
| O[351] = lerp(O[328], O[351], O[342]);
| O[328] = max(O[328], O[351]);
| O[344] = add(O[348], O[126]);
| O[345] = add(O[349], O[380]);
| O[351] = add(O[350], O[122]);
| O[373] = sub(O[344], O[30]);
| O[345] = mul_mad1(O[343], O[59], O[373], O[57]);
| O[97] = step(C[22], O[345]);
| O[345] = mul_mad1(O[343], O[23], O[373], O[22]);
| O[343] = mul_mad1(O[343], O[60], O[373], O[58]);
| O[344] = lerp(O[50], O[345], O[97]);
| O[345] = lerp(O[8], O[345], O[97]);
| O[345] = lerp(O[34], O[351], O[97]);
| O[351] = lerp(O[328], O[351], O[97]);
| O[344] = add_add(O[348], O[125], O[126]);
| O[345] = add_add(O[349], O[270], O[380]);
| O[351] = add_add(O[350], O[121], O[122]);
| O[496] = sub(O[344], O[30]);
| O[373] = sub(O[345], O[25]);
| O[345] = mul_mad1(O[373], O[59], O[496], O[57]);
| O[343] = max(O[345], C[21]);
| O[344] = step(C[22], O[345]);
| O[345] = mul_mad1(O[373], O[23], O[496], O[22]);
| O[345] = div_mul(O[345], O[343], O[379]);
| O[373] = mul_mad1(O[373], O[60], O[496], O[58]);
| O[351] = mad(O[351], O[35], O[373]);
| O[351] = div_mul(O[351], O[343], O[98]);
| O[343] = lerp(O[50], O[345], O[344]);
| O[50] = min(O[50], O[343]);
| O[345] = lerp(O[8], O[345], O[344]);
| O[345] = lerp(O[34], O[351], O[344]);
| O[351] = lerp(O[328], O[351], O[344]);
| O[343] = add(O[348], O[269]);
| O[345] = add(O[349], O[99]);
| O[351] = add(O[350], O[346]);
| O[643] = sub(O[343], O[30]);
| O[496] = sub(O[345], O[25]);
| O[345] = mul_mad1(O[496], O[59], O[643], O[57]);
| O[373] = max(O[345], C[21]);
| O[343] = step(C[22], O[345]);
| O[345] = mul_mad1(O[496], O[23], O[643], O[22]);
| O[345] = div_mul(O[345], O[373], O[379]);
| O[496] = mul_mad1(O[496], O[60], O[643], O[58]);
| O[351] = mad(O[351], O[35], O[496]);
| O[351] = div_mul(O[351], O[373], O[98]);
| O[373] = lerp(O[50], O[345], O[343]);
| O[50] = min(O[50], O[373]);
| O[345] = lerp(O[8], O[345], O[343]);
| O[345] = lerp(O[34], O[351], O[343]);
| O[351] = lerp(O[328], O[351], O[343]);
| O[373] = add_add(O[348], O[125], O[269]);
| O[345] = add_add(O[349], O[270], O[99]);
| O[351] = add_add(O[350], O[121], O[346]);
| O[755] = sub(O[373], O[30]);
| O[643] = sub(O[345], O[25]);
| O[345] = sub(O[351], O[52]);
| O[351] = mul_mad1(O[643], O[59], O[755], O[57]);
| O[351] = mad(O[345], O[61], O[351]);
| O[496] = max(O[351], C[21]);
| O[351] = step(C[22], O[351]);
| O[373] = mul_mad1(O[643], O[23], O[755], O[22]);
| O[373] = mad(O[345], O[51], O[373]);
| O[373] = div_mul(O[373], O[496], O[379]);
| O[373] = mad(O[373], C[6], C[6]);
| O[643] = mul_mad1(O[643], O[60], O[755], O[58]);
| O[345] = mad(O[345], O[35], O[643]);
| O[345] = div_mul(O[345], O[496], O[98]);
| O[345] = mad(O[345], C[7], C[6]);
| O[496] = lerp(O[50], O[373], O[351]);
| O[50] = min(O[50], O[496]);
| O[373] = lerp(O[8], O[373], O[351]);
| O[8] = max(O[8], O[373]);
| O[373] = lerp(O[34], O[345], O[351]);
| O[34] = min(O[34], O[373]);
| O[345] = lerp(O[328], O[345], O[351]);
| O[328] = max(O[328], O[345]);
| O[496] = add_add(O[348], O[126], O[269]);
| O[373] = add_add(O[349], O[380], O[99]);
| O[345] = add_add(O[350], O[122], O[346]);
| O[374] = sub(O[496], O[30]);
| O[755] = sub(O[373], O[25]);
| O[373] = sub(O[345], O[52]);
| O[345] = mul_mad1(O[755], O[59], O[374], O[57]);
| O[345] = mad(O[373], O[61], O[345]);
| O[643] = max(O[345], C[21]);
| O[345] = step(C[22], O[345]);
| O[496] = mul_mad1(O[755], O[23], O[374], O[22]);
| O[496] = mad(O[373], O[51], O[496]);
| O[496] = div_mul(O[496], O[643], O[379]);
| O[496] = mad(O[496], C[6], C[6]);
| O[755] = mul_mad1(O[755], O[60], O[374], O[58]);
| O[373] = mad(O[373], O[35], O[755]);
| O[373] = div_mul(O[373], O[643], O[98]);
| O[373] = mad(O[373], C[7], C[6]);
| O[643] = lerp(O[50], O[496], O[345]);
| O[50] = min(O[50], O[643]);
| O[496] = lerp(O[8], O[496], O[345]);
| O[8] = max(O[8], O[496]);
| O[496] = lerp(O[34], O[373], O[345]);
| O[34] = min(O[34], O[496]);
| O[373] = lerp(O[328], O[373], O[345]);
| O[328] = max(O[328], O[373]);
| outputdata_float(0, 292, R[0], O[348]);
| outputdata_float(0, 406, R[0], O[348]);
| outputdata_float(0, 550, R[0], O[348]);
| outputdata_float(0, 661, R[0], O[348]);
| outputdata_float(0, 293, R[0], O[349]);
| outputdata_float(0, 407, R[0], O[349]);
| outputdata_float(0, 551, R[0], O[349]);
| outputdata_float(0, 662, R[0], O[349]);
| outputdata_float(0, 294, R[0], O[350]);
| outputdata_float(0, 408, R[0], O[350]);
| outputdata_float(0, 552, R[0], O[350]);
| outputdata_float(0, 663, R[0], O[350]);
| O[348] = add_add(O[348], O[125], O[126]);
| O[349] = add_add(O[349], O[270], O[380]);
| O[350] = add_add(O[350], O[121], O[122]);
| O[348] = add(O[348], O[269]);
| O[349] = add(O[349], O[99]);
| O[350] = add(O[350], O[346]);
| O[269] = sub(O[348], O[30]);
| O[99] = sub(O[349], O[25]);
| O[349] = sub(O[350], O[52]);
| O[350] = mul_mad1(O[99], O[59], O[269], O[57]);
| O[350] = mad(O[349], O[61], O[350]);
| O[348] = max(O[350], C[21]);
| outputdata_int32(0, 8, R[0], I[120]);
| O[346] = step(C[22], O[350]);
| outputdata_int32(0, 9, R[0], I[121]);
| O[350] = mul_mad1(O[99], O[23], O[269], O[22]);
| O[350] = mad(O[349], O[51], O[350]);
| O[350] = div_mul(O[350], O[348], O[379]);
| O[350] = mad(O[350], C[6], C[6]);
| O[99] = mul_mad1(O[99], O[60], O[269], O[58]);
| O[349] = mad(O[349], O[35], O[99]);
| O[349] = div_mul(O[349], O[348], O[98]);
| O[348] = mad(O[349], C[7], C[6]);
| O[349] = sub(C[5], O[24]);
| O[98] = sub(C[5], O[342]);
| O[99] = sub(C[5], O[97]);
| O[349] = add_add(O[349], O[98], O[99]);
| O[98] = sub(C[5], O[344]);
| O[99] = sub(C[5], O[343]);
| O[98] = sub(C[5], O[351]);
| O[99] = sub(C[5], O[345]);
| O[98] = sub(C[5], O[346]);
| O[349] = add(O[349], O[98]);
| O[349] = step(C[6], O[349]);
| O[24] = add_add(O[24], O[342], O[97]);
| O[24] = add_add(O[24], O[344], O[343]);
| O[24] = add_add(O[24], O[351], O[345]);
| O[24] = add(O[24], O[346]);
| O[351] = step(C[6], O[24]);
| O[24] = lerp(O[50], O[350], O[346]);
| O[50] = min(O[50], O[24]);
| O[50] = lerp(O[50], C[0], O[349]);
| O[50] = clamp(O[50], C[0], C[5]);
| O[24] = mul(O[50], O[351]);
| O[350] = lerp(O[8], O[350], O[346]);
| O[8] = max(O[8], O[350]);
| O[8] = lerp(O[8], C[5], O[349]);
| O[8] = clamp(O[8], C[0], C[5]);
| O[350] = mul(O[8], O[351]);
| O[8] = lerp(O[34], O[348], O[346]);
| O[34] = min(O[34], O[8]);
| O[34] = lerp(O[34], C[0], O[349]);
| O[34] = clamp(O[34], C[0], C[5]);
| O[8] = mul(O[34], O[351]);
| O[348] = lerp(O[328], O[348], O[346]);
| O[328] = max(O[328], O[348]);
| O[328] = lerp(O[328], C[5], O[349]);
| O[328] = clamp(O[328], C[0], C[5]);
| O[349] = mul(O[328], O[351]);
| O[346] = sub(O[350], O[24]);
| O[348] = sub(O[349], O[8]);
| O[328] = mul(O[346], O[347]);
| outputdata_float(0, 216, R[0], O[346]);
| outputdata_float(0, 298, R[0], O[347]);
| O[346] = f2i(O[328]);
| O[328] = mul(O[348], O[36]);
| outputdata_float(0, 217, R[0], O[348]);
| outputdata_float(0, 299, R[0], O[36]);
| O[347] = f2i(O[328]);
| O[328] = i2f(O[346]);
| O[328] = max(O[328], C[5]);
| O[328] = i2f_div0(I[157], O[328]);
| O[36] = i2f(O[347]);
| O[36] = max(O[36], C[5]);
| O[36] = i2f_div0(I[158], O[36]);
| O[328] = min(O[328], O[36]);
| O[328] = min(O[328], C[5]);
| O[328] = mul(O[328], C[23]);
| O[36] = i2f_mul(O[346], O[328]);
| O[36] = max(O[36], C[0]);
| O[36] = ceil(O[36]);
| O[36] = f2i(O[36]);
| O[36] = clampi(O[36], C[12], I[157]);
| O[328] = i2f_mul(O[347], O[328]);
| O[328] = max(O[328], C[0]);
| O[328] = ceil(O[328]);
| O[328] = f2i(O[328]);
| O[328] = clampi(O[328], C[12], I[158]);
| O[345] = maxi(O[36], O[328]);
| O[348] = i2f(O[345]);
| O[348] = max(O[348], C[5]);
| O[348] = div(C[25], O[348]);
| O[345] = i2f(O[345]);
| O[345] = add(O[345], C[6]);
| O[345] = step(O[345], C[25]);
| outputdata_int32(0, 12, R[0], I[124]);
| O[348] = lerp(C[5], O[348], O[345]);
| O[36] = i2f_mul(O[36], O[348]);
| O[36] = mini(O[36], I[157]);
| O[328] = i2f_mul(O[328], O[348]);
| O[328] = mini(O[328], I[158]);
| O[53] = mul(O[53], C[26]);
| outputdata_float(0, 113, R[0], I[14]);
| O[348] = i2f(O[346]);
| outputdata_int32(0, 72, R[0], O[346]);
| O[348] = i2f_div0(O[36], O[348]);
| outputdata_float(0, 258, R[0], O[348]);
| O[348] = i2f(O[347]);
| outputdata_int32(0, 71, R[0], O[347]);
| O[348] = i2f_div0(O[328], O[348]);
| outputdata_float(0, 259, R[0], O[348]);
| outputdata_float(0, 214, R[0], O[24]);
| O[348] = mul_mul(O[53], O[21], O[54]);
| O[348] = mul(O[348], C[23]);
| O[24] = sub_mul(O[350], O[24], O[348]);
| outputdata_float(0, 215, R[0], O[8]);
| O[348] = mul_mul(O[53], O[21], C[23]);
| O[8] = sub_mul(O[349], O[8], O[348]);
| O[34] = mad_mul(O[34], O[351], O[349], C[6]);
| O[34] = neg(O[34]);
| outputdata_int32(0, 10, R[0], I[122]);
| O[34] = mad_mul(O[34], C[23], C[5], O[53]);
| O[34] = mul(O[34], O[21]);
| O[50] = mad_sub0(O[50], O[351], O[350], C[5]);
| O[50] = mul_mul(O[50], O[53], O[21]);
| O[50] = mul(O[50], O[54]);
| O[57] = mad_mad0(O[57], O[53], O[30], O[22], O[50]);
| O[59] = mad_mad0(O[59], O[53], O[25], O[23], O[50]);
| O[61] = mad_mad0(O[61], O[53], O[52], O[51], O[50]);
| O[51] = mad(O[58], O[34], O[57]);
| O[52] = mad(O[60], O[34], O[59]);
| O[53] = mad(O[35], O[34], O[61]);
| outputdata_int32(0, 51, R[0], I[157]);
| outputdata_int32(0, 52, R[0], I[158]);
| outputdata_int32(0, 53, R[0], O[36]);
| outputdata_int32(0, 54, R[0], O[328]);
| O[35] = i2f(I[157]);
| O[36] = i2f_div0(O[36], O[35]);
| outputdata_float(0, 296, R[0], O[36]);
| O[36] = i2f(I[158]);
| O[328] = i2f_div0(O[328], O[36]);
| outputdata_float(0, 297, R[0], O[328]);
| external_func_call(C[19]R[65535], R[65535], R[65535], R[65535], R[65535], R[65535], O[60], O[61], O[328], O[34], O[35], O[36], R[65535], R[65535], R[65535]);
| outputdata_float(0, 112, R[0], I[13]);
| O[59] = mul_mad1(O[35], O[35], O[34], O[34]);
| O[59] = mad(O[36], O[36], O[59]);
| O[59] = rsq(O[59]);
| O[34] = mul(O[34], O[59]);
| O[35] = mul(O[35], O[59]);
| O[36] = mul(O[36], O[59]);
| O[59] = neg(O[60]);
| O[60] = neg(O[61]);
| O[328] = neg(O[328]);
| O[61] = mul_mad1(O[60], O[60], O[59], O[59]);
| O[61] = mad(O[328], O[328], O[61]);
| O[61] = rsq(O[61]);
| O[57] = mul(O[59], O[61]);
| O[58] = mul(O[60], O[61]);
| O[59] = mul(O[328], O[61]);
| O[328] = mul(O[36], O[58]);
| O[60] = mul_sub0(O[35], O[59], O[328]);
| O[328] = mul(O[34], O[59]);
| O[61] = mul_sub0(O[36], O[57], O[328]);
| O[328] = mul(O[35], O[57]);
| O[328] = mul_sub0(O[34], O[58], O[328]);
| O[50] = mul_mad1(O[61], O[61], O[60], O[60]);
| O[50] = mad(O[328], O[328], O[50]);
| O[50] = rsq(O[50]);
| O[60] = mul(O[60], O[50]);
| O[61] = mul(O[61], O[50]);
| O[328] = mul(O[328], O[50]);
| O[22] = mul_mad1(C[7], O[24], C[7], C[0]);
| O[21] = mul_mad1(C[7], C[0], C[7], O[8]);
| O[50] = mul_mad1(C[7], C[0], C[7], C[0]);
| O[30] = mul_mad1(C[7], C[0], C[7], C[0]);
| outputdata_float(0, 6, R[0], I[6]);
| O[23] = mul(O[24], C[8]);
| O[351] = mul(O[24], C[27]);
| O[25] = mul(O[8], C[28]);
| O[54] = mul(O[8], C[8]);
| O[346] = mul_mad1(O[22], C[8], O[21], C[28]);
| O[344] = mul_mad1(O[22], C[27], O[21], C[8]);
| O[50] = add_add(C[7], O[50], C[0]);
| O[345] = add_add(C[5], O[30], C[0]);
| O[21] = mul_mad1(O[23], O[34], O[351], O[57]);
| O[22] = mul_mad1(O[23], O[35], O[351], O[58]);
| O[30] = mul_mad1(O[23], O[36], O[351], O[59]);
| O[23] = mul_mad1(O[23], C[0], O[351], C[0]);
| O[347] = mad_mad0(C[0], O[60], O[21], C[0], C[0]);
| O[348] = mad_mad0(C[0], O[61], O[22], C[0], C[0]);
| O[349] = mad_mad0(C[0], O[328], O[30], C[0], C[0]);
| O[350] = mad_mad0(C[0], C[0], O[23], C[0], C[5]);
| O[22] = mul_mad1(O[25], O[34], O[54], O[57]);
| O[30] = mul_mad1(O[25], O[35], O[54], O[58]);
| O[23] = mul_mad1(O[25], O[36], O[54], O[59]);
| O[25] = mul_mad1(O[25], C[0], O[54], C[0]);
| O[351] = mad_mad0(C[0], O[60], O[22], C[0], C[0]);
| O[21] = mad_mad0(C[0], O[61], O[30], C[0], C[0]);
| O[54] = mad_mad0(C[0], O[328], O[23], C[0], C[0]);
| O[22] = mad_mad0(C[0], C[0], O[25], C[0], C[5]);
| O[30] = mul_mad1(O[346], O[34], O[344], O[57]);
| O[23] = mul_mad1(O[346], O[35], O[344], O[58]);
| O[25] = mul_mad1(O[346], O[36], O[344], O[59]);
| O[346] = mul_mad1(O[346], C[0], O[344], C[0]);
| O[30] = mad_mad0(O[50], O[60], O[30], O[345], C[0]);
| O[23] = mad_mad0(O[50], O[61], O[23], O[345], C[0]);
| O[25] = mad_mad0(O[50], O[328], O[25], O[345], C[0]);
| O[50] = mad_mad0(O[50], C[0], O[346], O[345], C[5]);
| O[347] = mad(O[350], O[51], O[347]);
| outputdata_float(0, 60, R[0], O[347]);
| O[348] = add_mad1(O[348], C[0], O[350], O[52]);
| outputdata_float(0, 61, R[0], O[348]);
| O[349] = add_mad1(O[349], C[0], O[350], O[53]);
| outputdata_float(0, 62, R[0], O[349]);
| O[350] = mad(O[350], C[5], C[0]);
| outputdata_float(0, 63, R[0], O[350]);
| O[351] = mad(O[22], O[51], O[351]);
| outputdata_float(0, 64, R[0], O[351]);
| O[21] = add_mad1(O[21], C[0], O[22], O[52]);
| outputdata_float(0, 65, R[0], O[21]);
| O[54] = add_mad1(O[54], C[0], O[22], O[53]);
| outputdata_float(0, 66, R[0], O[54]);
| O[22] = mad(O[22], C[5], C[0]);
| outputdata_float(0, 67, R[0], O[22]);
| O[22] = mad(C[0], O[51], O[60]);
| outputdata_float(0, 68, R[0], O[22]);
| O[22] = add_mad1(O[61], C[0], C[0], O[52]);
| outputdata_float(0, 69, R[0], O[22]);
| O[22] = add_mad1(O[328], C[0], C[0], O[53]);
| outputdata_float(0, 70, R[0], O[22]);
| O[22] = mad(C[0], C[5], C[0]);
| outputdata_float(0, 71, R[0], O[22]);
| O[30] = mad(O[50], O[51], O[30]);
| outputdata_float(0, 72, R[0], O[30]);
| O[23] = add_mad1(O[23], C[0], O[50], O[52]);
| outputdata_float(0, 73, R[0], O[23]);
| O[25] = add_mad1(O[25], C[0], O[50], O[53]);
| outputdata_float(0, 74, R[0], O[25]);
| O[50] = mad(O[50], C[5], C[0]);
| outputdata_float(0, 75, R[0], O[50]);
| O[23] = neg(O[51]);
| O[30] = neg(O[52]);
| O[50] = neg(O[53]);
| O[22] = rcp(O[24]);
| outputdata_float(0, 58, R[0], O[24]);
| outputdata_float(0, 256, R[0], O[24]);
| O[25] = rcp(O[8]);
| outputdata_float(0, 59, R[0], O[8]);
| outputdata_float(0, 257, R[0], O[8]);
| O[21] = mul_mad1(O[23], O[34], O[30], O[35]);
| O[54] = mul_mad1(O[23], O[57], O[30], O[58]);
| O[24] = mul_mad1(O[23], O[60], O[30], O[61]);
| O[8] = mul_mad1(O[23], C[0], O[30], C[0]);
| O[349] = mad_add(O[50], O[36], O[21], C[0]);
| O[347] = mad_add(O[50], O[59], O[54], C[0]);
| O[24] = mad_add(O[50], O[328], O[24], C[0]);
| O[8] = mad_add(O[50], C[0], O[8], C[5]);
| O[351] = mul_mad1(O[34], C[8], O[57], C[27]);
| O[348] = mul_mad1(O[34], C[28], O[57], C[8]);
| O[21] = mul_mad1(O[35], C[8], O[58], C[27]);
| O[350] = mul_mad1(O[35], C[28], O[58], C[8]);
| O[54] = mul_mad1(O[36], C[8], O[59], C[27]);
| O[98] = mul_mad1(O[36], C[28], O[59], C[8]);
| O[97] = mul_mad1(O[349], C[8], O[347], C[27]);
| O[99] = mul_mad1(O[349], C[28], O[347], C[8]);
| O[342] = mul_mad1(O[351], O[22], O[348], C[0]);
| O[343] = mul_mad1(O[351], C[0], O[348], O[25]);
| O[349] = mul_mad1(O[351], C[0], O[348], C[0]);
| O[351] = mul_mad1(O[351], C[0], O[348], C[0]);
| O[344] = add_add(O[60], C[0], O[349]);
| O[345] = add_add(C[0], C[0], O[351]);
| O[346] = mul_mad1(O[21], O[22], O[350], C[0]);
| O[347] = mul_mad1(O[21], C[0], O[350], O[25]);
| O[351] = mul_mad1(O[21], C[0], O[350], C[0]);
| O[21] = mul_mad1(O[21], C[0], O[350], C[0]);
| O[348] = add_add(O[61], C[0], O[351]);
| O[349] = add_add(C[0], C[0], O[21]);
| O[350] = mul_mad1(O[54], O[22], O[98], C[0]);
| O[351] = mul_mad1(O[54], C[0], O[98], O[25]);
| O[21] = mul_mad1(O[54], C[0], O[98], C[0]);
| O[54] = mul_mad1(O[54], C[0], O[98], C[0]);
| O[21] = add_add(O[328], C[0], O[21]);
| O[54] = add_add(C[0], C[0], O[54]);
| O[22] = mul_mad1(O[97], O[22], O[99], C[0]);
| O[25] = mul_mad1(O[97], C[0], O[99], O[25]);
| O[98] = mul_mad1(O[97], C[0], O[99], C[0]);
| O[97] = mul_mad1(O[97], C[0], O[99], C[0]);
| O[24] = add_add(O[24], C[0], O[98]);
| O[8] = add_add(O[8], C[0], O[97]);
| O[342] = mad(O[345], C[6], O[342]);
| outputdata_float(0, 92, R[0], O[342]);
| outputdata_float(0, 261, R[0], O[342]);
| O[343] = add_mad1(O[343], C[0], O[345], C[6]);
| outputdata_float(0, 93, R[0], O[343]);
| outputdata_float(0, 262, R[0], O[343]);
| O[344] = add_mad1(O[344], C[0], O[345], C[6]);
| outputdata_float(0, 94, R[0], O[344]);
| outputdata_float(0, 263, R[0], O[344]);
| O[345] = add(O[345], C[0]);
| outputdata_float(0, 95, R[0], O[345]);
| outputdata_float(0, 264, R[0], O[345]);
| O[346] = mad(O[349], C[6], O[346]);
| outputdata_float(0, 96, R[0], O[346]);
| outputdata_float(0, 265, R[0], O[346]);
| O[347] = add_mad1(O[347], C[0], O[349], C[6]);
| outputdata_float(0, 97, R[0], O[347]);
| outputdata_float(0, 266, R[0], O[347]);
| O[348] = add_mad1(O[348], C[0], O[349], C[6]);
| outputdata_float(0, 98, R[0], O[348]);
| outputdata_float(0, 267, R[0], O[348]);
| O[349] = add(O[349], C[0]);
| outputdata_float(0, 99, R[0], O[349]);
| outputdata_float(0, 268, R[0], O[349]);
| O[350] = mad(O[54], C[6], O[350]);
| outputdata_float(0, 100, R[0], O[350]);
| outputdata_float(0, 269, R[0], O[350]);
| O[351] = add_mad1(O[351], C[0], O[54], C[6]);
| outputdata_float(0, 101, R[0], O[351]);
| outputdata_float(0, 270, R[0], O[351]);
| O[21] = add_mad1(O[21], C[0], O[54], C[6]);
| outputdata_float(0, 102, R[0], O[21]);
| outputdata_float(0, 271, R[0], O[21]);
| O[54] = add(O[54], C[0]);
| outputdata_float(0, 103, R[0], O[54]);
| outputdata_float(0, 272, R[0], O[54]);
| O[22] = mad(O[8], C[6], O[22]);
| outputdata_float(0, 104, R[0], O[22]);
| outputdata_float(0, 273, R[0], O[22]);
| O[25] = add_mad1(O[25], C[0], O[8], C[6]);
| outputdata_float(0, 105, R[0], O[25]);
| outputdata_float(0, 274, R[0], O[25]);
| O[24] = add_mad1(O[24], C[0], O[8], C[6]);
| outputdata_float(0, 5, R[0], I[5]);
| outputdata_float(0, 11, R[0], C[6]);
| outputdata_float(0, 12, R[0], C[6]);
| outputdata_float(0, 106, R[0], O[24]);
| outputdata_float(0, 177, R[0], C[6]);
| outputdata_float(0, 275, R[0], O[24]);
| outputdata_float(0, 473, R[0], C[6]);
| outputdata_float(0, 486, R[0], C[6]);
| outputdata_float(0, 487, R[0], C[6]);
| outputdata_float(0, 488, R[0], C[6]);
| outputdata_float(0, 614, R[0], C[6]);
| outputdata_float(0, 627, R[0], C[6]);
| outputdata_float(0, 628, R[0], C[6]);
| outputdata_float(0, 629, R[0], C[6]);
| O[8] = add(O[8], C[0]);
| outputdata_float(0, 107, R[0], O[8]);
| outputdata_float(0, 276, R[0], O[8]);
| O[24] = mul_mad1(O[23], O[34], O[30], O[35]);
| O[25] = mul_mad1(O[23], O[57], O[30], O[58]);
| O[8] = mul_mad1(O[23], O[60], O[30], O[61]);
| O[23] = mul_mad1(O[23], C[0], O[30], C[0]);
| O[24] = mad_add(O[50], O[36], O[24], C[0]);
| O[25] = mad_add(O[50], O[59], O[25], C[0]);
| O[8] = mad_add(O[50], O[328], O[8], C[0]);
| O[50] = mad_add(O[50], C[0], O[23], C[5]);
| O[23] = mul_mad1(O[34], C[8], O[57], C[27]);
| outputdata_float(0, 76, R[0], O[23]);
| O[23] = mul_mad1(O[34], C[28], O[57], C[8]);
| outputdata_float(0, 77, R[0], O[23]);
| O[23] = add(O[60], C[0]);
| outputdata_float(0, 78, R[0], O[23]);
| O[23] = add(C[0], C[0]);
| outputdata_float(0, 79, R[0], O[23]);
| O[23] = mul_mad1(O[35], C[8], O[58], C[27]);
| outputdata_float(0, 80, R[0], O[23]);
| O[23] = mul_mad1(O[35], C[28], O[58], C[8]);
| outputdata_float(0, 81, R[0], O[23]);
| O[23] = add(O[61], C[0]);
| outputdata_float(0, 82, R[0], O[23]);
| outputdata_float(0, 83, R[0], O[23]);
| O[23] = mul_mad1(O[36], C[8], O[59], C[27]);
| outputdata_float(0, 84, R[0], O[23]);
| O[23] = mul_mad1(O[36], C[28], O[59], C[8]);
| outputdata_float(0, 85, R[0], O[23]);
| O[23] = add(O[328], C[0]);
| outputdata_float(0, 86, R[0], O[23]);
| outputdata_float(0, 87, R[0], O[23]);
| O[23] = mul_mad1(O[24], C[8], O[25], C[27]);
| outputdata_float(0, 88, R[0], O[23]);
| O[24] = mul_mad1(O[24], C[28], O[25], C[8]);
| outputdata_float(0, 89, R[0], O[24]);
| outputdata_float(0, 90, R[0], O[8]);
| O[50] = add(O[50], C[0]);
| outputdata_float(0, 91, R[0], O[50]);
| O[22] = mad(C[0], O[51], O[34]);
| O[23] = add_mad1(O[35], C[0], C[0], O[52]);
| O[24] = add_mad1(O[36], C[0], C[0], O[53]);
| O[54] = mad(C[0], O[51], O[57]);
| O[30] = add_mad1(O[58], C[0], C[0], O[52]);
| O[25] = add_mad1(O[59], C[0], C[0], O[53]);
| O[50] = mad(C[0], O[51], O[60]);
| outputdata_float(0, 21, R[0], O[50]);
| O[50] = add_mad1(O[61], C[0], C[0], O[52]);
| outputdata_float(0, 22, R[0], O[50]);
| O[50] = add_mad1(O[328], C[0], C[0], O[53]);
| outputdata_float(0, 23, R[0], O[50]);
| O[50] = mad(C[0], C[5], C[0]);
| outputdata_float(0, 24, R[0], O[50]);
| O[8] = mul_mad1(C[8], O[22], C[27], O[54]);
| outputdata_float(0, 13, R[0], O[8]);
| O[8] = mul_mad1(C[8], O[23], C[27], O[30]);
| outputdata_float(0, 14, R[0], O[8]);
| O[8] = mul_mad1(C[8], O[24], C[27], O[25]);
| outputdata_float(0, 15, R[0], O[8]);
| O[8] = mad(C[0], C[5], C[0]);
| O[21] = mul_mad1(C[8], O[50], C[27], O[8]);
| outputdata_float(0, 16, R[0], O[21]);
| outputdata_float(0, 114, R[0], I[15]);
| outputdata_float(0, 115, R[0], I[16]);
| O[22] = mul_mad1(C[28], O[22], C[8], O[54]);
| outputdata_float(0, 17, R[0], O[22]);
| O[23] = mul_mad1(C[28], O[23], C[8], O[30]);
| outputdata_float(0, 18, R[0], O[23]);
| O[24] = mul_mad1(C[28], O[24], C[8], O[25]);
| outputdata_float(0, 19, R[0], O[24]);
| O[50] = mul_mad1(C[28], O[50], C[8], O[8]);
| outputdata_float(0, 7, R[0], I[7]);
| outputdata_float(0, 20, R[0], O[50]);
| O[50] = mad(C[5], O[51], C[0]);
| outputdata_float(0, 25, R[0], O[50]);
| outputdata_float(0, 49, R[0], O[51]);
| outputdata_float(0, 277, R[0], O[51]);
| O[51] = add_mad1(C[0], C[0], C[5], O[52]);
| outputdata_float(0, 26, R[0], O[51]);
| outputdata_float(0, 50, R[0], O[52]);
| outputdata_float(0, 278, R[0], O[52]);
| O[52] = add_mad1(C[0], C[0], C[5], O[53]);
| outputdata_float(0, 27, R[0], O[52]);
| outputdata_float(0, 51, R[0], O[53]);
| outputdata_float(0, 279, R[0], O[53]);
| O[53] = mad(C[5], C[5], C[0]);
| outputdata_float(0, 28, R[0], O[53]);
| external_func_call(O[34], O[35], O[36], C[0], O[57], O[58], O[59], C[0], O[60], O[61], O[328], C[0], C[0], C[0], C[0], C[5]O[50], O[51], O[52], O[53]);
| outputdata_float(0, 32, R[0], C[0]);
| outputdata_float(0, 33, R[0], O[57]);
| outputdata_float(0, 34, R[0], O[58]);
| outputdata_float(0, 35, R[0], O[59]);
| outputdata_float(0, 36, R[0], C[0]);
| outputdata_float(0, 37, R[0], O[60]);
| outputdata_float(0, 38, R[0], O[61]);
| outputdata_float(0, 39, R[0], O[328]);
| outputdata_float(0, 40, R[0], C[0]);
| outputdata_float(0, 41, R[0], C[0]);
| outputdata_float(0, 42, R[0], C[0]);
| outputdata_float(0, 43, R[0], C[0]);
| outputdata_float(0, 45, R[0], O[50]);
| outputdata_float(0, 46, R[0], O[51]);
| outputdata_float(0, 47, R[0], O[52]);
| outputdata_float(0, 48, R[0], O[53]);
| outputdata_float(0, 52, R[0], O[57]);
| outputdata_float(0, 53, R[0], O[58]);
| outputdata_float(0, 54, R[0], O[59]);
| outputdata_float(0, 55, R[0], O[60]);
| outputdata_float(0, 56, R[0], O[61]);
| outputdata_float(0, 57, R[0], O[328]);
| outputdata_float(0, 122, R[0], C[0]);
| outputdata_float(0, 175, R[0], C[0]);
| outputdata_float(0, 176, R[0], C[0]);
| outputdata_float(0, 181, R[0], C[0]);
| outputdata_float(0, 185, R[0], C[0]);
| outputdata_float(0, 189, R[0], C[0]);
| outputdata_float(0, 197, R[0], C[0]);
| outputdata_float(0, 201, R[0], C[0]);
| outputdata_float(0, 205, R[0], C[0]);
| outputdata_float(0, 211, R[0], C[0]);
| O[328] = clamp(I[192], C[0], C[9]);
| outputdata_float(0, 4, R[0], I[4]);
| outputdata_float(0, 29, R[0], O[34]);
| outputdata_float(0, 30, R[0], O[35]);
| outputdata_float(0, 31, R[0], O[36]);
| outputdata_float(0, 44, R[0], C[5]);
| outputdata_float(0, 255, R[0], O[328]);
| outputdata_float(0, 375, R[0], C[0]);
| outputdata_float(0, 379, R[0], C[0]);
| outputdata_float(0, 383, R[0], C[0]);
| outputdata_float(0, 393, R[0], C[0]);
| outputdata_float(0, 471, R[0], C[0]);
| outputdata_float(0, 472, R[0], C[0]);
| outputdata_float(0, 475, R[0], C[0]);
| outputdata_float(0, 476, R[0], C[0]);
| outputdata_float(0, 477, R[0], C[0]);
| outputdata_float(0, 478, R[0], C[0]);
| outputdata_float(0, 480, R[0], C[0]);
| outputdata_float(0, 481, R[0], C[0]);
| outputdata_float(0, 482, R[0], C[0]);
| outputdata_float(0, 483, R[0], C[0]);
| outputdata_float(0, 485, R[0], C[0]);
| outputdata_float(0, 489, R[0], C[5]);
| outputdata_float(0, 493, R[0], C[0]);
| outputdata_float(0, 497, R[0], C[0]);
| outputdata_float(0, 501, R[0], C[0]);
| outputdata_float(0, 509, R[0], C[0]);
| outputdata_float(0, 513, R[0], C[0]);
| outputdata_float(0, 517, R[0], C[0]);
| outputdata_float(0, 523, R[0], C[0]);
| outputdata_float(0, 524, R[0], C[0]);
| outputdata_float(0, 525, R[0], C[0]);
| outputdata_float(0, 526, R[0], C[0]);
| outputdata_float(0, 528, R[0], C[0]);
| outputdata_float(0, 529, R[0], C[0]);
| outputdata_float(0, 530, R[0], C[0]);
| outputdata_float(0, 531, R[0], C[0]);
| outputdata_float(0, 533, R[0], C[0]);
| outputdata_float(0, 612, R[0], C[0]);
| outputdata_float(0, 613, R[0], C[0]);
| outputdata_float(0, 616, R[0], C[0]);
| outputdata_float(0, 617, R[0], C[0]);
| outputdata_float(0, 618, R[0], C[0]);
| outputdata_float(0, 619, R[0], C[0]);
| outputdata_float(0, 621, R[0], C[0]);
| outputdata_float(0, 622, R[0], C[0]);
| outputdata_float(0, 623, R[0], C[0]);
| outputdata_float(0, 624, R[0], C[0]);
| outputdata_float(0, 626, R[0], C[0]);
| outputdata_float(0, 630, R[0], C[5]);
| outputdata_float(0, 634, R[0], C[0]);
| outputdata_float(0, 635, R[0], C[0]);
| outputdata_float(0, 636, R[0], C[0]);
| outputdata_float(0, 637, R[0], C[0]);
| outputdata_float(0, 639, R[0], C[0]);
| outputdata_float(0, 640, R[0], C[0]);
| outputdata_float(0, 641, R[0], C[0]);
| outputdata_float(0, 642, R[0], C[0]);
| outputdata_float(0, 644, R[0], C[0]);
| outputdata_float(0, 116, R[0], I[17]);
| outputdata_float(0, 123, R[0], I[22]);
| outputdata_float(0, 124, R[0], I[23]);
| outputdata_float(0, 125, R[0], I[24]);
| outputdata_float(0, 126, R[0], I[25]);
| outputdata_float(0, 127, R[0], I[26]);
| outputdata_float(0, 128, R[0], I[27]);
| outputdata_float(0, 129, R[0], I[28]);
| outputdata_float(0, 130, R[0], I[29]);
| outputdata_float(0, 131, R[0], I[30]);
| outputdata_float(0, 132, R[0], I[31]);
| outputdata_float(0, 133, R[0], I[32]);
| outputdata_float(0, 134, R[0], I[33]);
| outputdata_float(0, 135, R[0], I[34]);
| outputdata_float(0, 136, R[0], I[35]);
| outputdata_float(0, 137, R[0], I[36]);
| outputdata_float(0, 138, R[0], I[37]);
| outputdata_float(0, 139, R[0], I[38]);
| outputdata_float(0, 140, R[0], I[39]);
| outputdata_float(0, 141, R[0], I[40]);
| outputdata_float(0, 142, R[0], I[41]);
| outputdata_float(0, 143, R[0], I[42]);
| outputdata_float(0, 144, R[0], I[43]);
| outputdata_float(0, 145, R[0], I[44]);
| outputdata_float(0, 146, R[0], I[45]);
| outputdata_float(0, 147, R[0], I[46]);
| outputdata_float(0, 148, R[0], I[47]);
| outputdata_float(0, 149, R[0], I[48]);
| outputdata_float(0, 150, R[0], I[49]);
| outputdata_float(0, 151, R[0], I[50]);
| outputdata_float(0, 152, R[0], I[51]);
| outputdata_float(0, 153, R[0], I[52]);
| outputdata_float(0, 154, R[0], I[53]);
| outputdata_float(0, 155, R[0], I[54]);
| outputdata_float(0, 156, R[0], I[55]);
| outputdata_float(0, 157, R[0], I[56]);
| outputdata_float(0, 158, R[0], I[57]);
| outputdata_float(0, 159, R[0], I[58]);
| outputdata_float(0, 160, R[0], I[59]);
| outputdata_float(0, 161, R[0], I[60]);
| outputdata_float(0, 162, R[0], I[61]);
| outputdata_float(0, 163, R[0], I[62]);
| outputdata_float(0, 164, R[0], I[63]);
| outputdata_float(0, 212, R[0], C[30]);
| outputdata_float(0, 213, R[0], I[72]);
| outputdata_float(0, 218, R[0], I[64]);
| outputdata_float(0, 219, R[0], I[65]);
| outputdata_float(0, 220, R[0], I[66]);
| outputdata_float(0, 221, R[0], I[67]);
| outputdata_float(0, 222, R[0], I[68]);
| outputdata_float(0, 223, R[0], I[69]);
| outputdata_float(0, 224, R[0], I[70]);
| outputdata_float(0, 226, R[0], I[102]);
| outputdata_float(0, 227, R[0], I[103]);
| outputdata_float(0, 228, R[0], I[73]);
| outputdata_float(0, 229, R[0], I[74]);
| outputdata_float(0, 230, R[0], I[75]);
| outputdata_float(0, 231, R[0], I[76]);
| outputdata_float(0, 232, R[0], I[77]);
| outputdata_float(0, 233, R[0], I[78]);
| outputdata_float(0, 234, R[0], I[79]);
| outputdata_float(0, 235, R[0], I[80]);
| outputdata_float(0, 236, R[0], I[81]);
| outputdata_float(0, 237, R[0], I[82]);
| outputdata_float(0, 238, R[0], I[83]);
| outputdata_float(0, 239, R[0], I[84]);
| outputdata_float(0, 240, R[0], I[85]);
| outputdata_float(0, 241, R[0], I[86]);
| outputdata_float(0, 242, R[0], I[87]);
| outputdata_float(0, 243, R[0], I[88]);
| outputdata_float(0, 244, R[0], I[89]);
| outputdata_float(0, 245, R[0], I[90]);
| outputdata_float(0, 246, R[0], I[91]);
| outputdata_float(0, 247, R[0], I[92]);
| outputdata_float(0, 248, R[0], I[93]);
| outputdata_float(0, 249, R[0], I[94]);
| outputdata_float(0, 250, R[0], I[95]);
| outputdata_float(0, 251, R[0], I[96]);
| outputdata_float(0, 252, R[0], I[97]);
| outputdata_float(0, 253, R[0], I[98]);
| outputdata_float(0, 254, R[0], I[99]);
| outputdata_float(0, 260, R[0], I[100]);
| outputdata_float(0, 302, R[0], I[102]);
| outputdata_float(0, 303, R[0], I[103]);
| outputdata_float(0, 356, R[0], I[111]);
| outputdata_float(0, 361, R[0], I[105]);
| outputdata_float(0, 362, R[0], I[106]);
| outputdata_float(0, 363, R[0], I[107]);
| outputdata_float(0, 364, R[0], I[108]);
| outputdata_float(0, 390, R[0], I[109]);
| outputdata_float(0, 459, R[0], I[111]);
| outputdata_int32(0, 0, R[0], C[29]);
| outputdata_int32(0, 13, R[0], I[125]);
| outputdata_int32(0, 14, R[0], I[126]);
| outputdata_int32(0, 20, R[0], I[127]);
| outputdata_int32(0, 21, R[0], I[128]);
| outputdata_int32(0, 23, R[0], I[130]);
| outputdata_int32(0, 25, R[0], I[132]);
| outputdata_int32(0, 26, R[0], I[133]);
| outputdata_int32(0, 27, R[0], I[134]);
| outputdata_int32(0, 28, R[0], I[135]);
| outputdata_int32(0, 29, R[0], I[136]);
| outputdata_int32(0, 30, R[0], I[137]);
| outputdata_int32(0, 31, R[0], I[138]);
| outputdata_int32(0, 32, R[0], I[139]);
| outputdata_int32(0, 33, R[0], I[140]);
| outputdata_int32(0, 34, R[0], I[141]);
| outputdata_int32(0, 35, R[0], I[142]);
| outputdata_int32(0, 36, R[0], I[143]);
| outputdata_int32(0, 37, R[0], I[144]);
| outputdata_int32(0, 38, R[0], I[145]);
| outputdata_int32(0, 39, R[0], I[146]);
| outputdata_int32(0, 40, R[0], I[147]);
| outputdata_int32(0, 41, R[0], I[148]);
| outputdata_int32(0, 42, R[0], I[149]);
| outputdata_int32(0, 43, R[0], I[150]);
| outputdata_int32(0, 44, R[0], I[151]);
| outputdata_int32(0, 45, R[0], I[152]);
| outputdata_int32(0, 47, R[0], I[153]);
| outputdata_int32(0, 49, R[0], I[155]);
| outputdata_int32(0, 55, R[0], I[159]);
| outputdata_int32(0, 56, R[0], I[160]);
| outputdata_int32(0, 57, R[0], I[161]);
| outputdata_int32(0, 58, R[0], I[162]);
| outputdata_int32(0, 59, R[0], I[163]);
| outputdata_int32(0, 60, R[0], I[164]);
| outputdata_int32(0, 61, R[0], I[165]);
| outputdata_int32(0, 62, R[0], I[166]);
| outputdata_int32(0, 63, R[0], I[167]);
| outputdata_int32(0, 64, R[0], I[168]);
| outputdata_int32(0, 65, R[0], I[169]);
| outputdata_int32(0, 66, R[0], I[170]);
| outputdata_int32(0, 67, R[0], I[171]);
| outputdata_int32(0, 68, R[0], I[172]);
| outputdata_int32(0, 69, R[0], I[173]);
| outputdata_int32(0, 70, R[0], I[174]);
| outputdata_int32(0, 73, R[0], I[175]);
| outputdata_int32(0, 74, R[0], I[176]);
| outputdata_int32(0, 75, R[0], I[177]);
| outputdata_int32(0, 76, R[0], I[178]);
| outputdata_int32(0, 77, R[0], I[179]);
| outputdata_int32(0, 78, R[0], I[180]);
| outputdata_int32(0, 79, R[0], I[181]);
| outputdata_int32(0, 80, R[0], I[182]);
| outputdata_int32(0, 83, R[0], I[185]);
| outputdata_int32(0, 84, R[0], I[186]);
| outputdata_int32(0, 87, R[0], I[188]);
mzxΩ¶O|Hì•èö;ã
Y*;∂∞Ó$K•∞ú>Ò
I¬‰ëgx“Jà;\
@å;w¡@Yá
E’)Q;…
&oÇ;¨1EKµ
;Ø‹6‘ˇE∞ÔÎo±÷I»…
‰“)$Aüe∫]≠;
lµ=nJàN˚;sî„E…
åEì]∏;>Tõﬁ…
M•kóÏ;Kêã
hπ÷);…
;@/—)DºúIvÄpjÏ…
xì;ö©\?Nñ∫/hÑ
|OΩ;/ãÉ·Â÷…
;HÙg]≈
Ò´j¸‡KÄ;ﬁ’
Ø;_}D£B
˚ˆä¿©ÖPE¶;#ßU<Ñ∂…
 Wπ"D≥ì#àyõ'∑…
 Iù~Cè∫¶|4…
ü$T1A¥ª;ïd
”ÿswKª;
 N´}`„à/;ê…
6ZN∞&;˛Œ
ôMG∞Îçnó;…ı…
 óé4;g˛Añ
t;–Lô˛g…
ı≥Ûü¸;%Eº<=]˜›≤…
ƒ—;√ˇ…
¡É*ûóˆ•Ä.;ƒ—


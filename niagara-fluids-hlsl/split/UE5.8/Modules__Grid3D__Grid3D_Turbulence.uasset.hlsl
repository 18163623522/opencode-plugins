p¯]¥t;WJ½¯9ü´ÈÑSê
TurbulenceOut = float3(0, 0, 0);
  float scale = NoiseScale;
  float3 pos = World;
  float x = FastGradientPerlinNoise3D_TEX(pos*scale + Time*NoiseSpeed);
  pos += float3(123.45, 234.56, 345.67);
  float y = FastGradientPerlinNoise3D_TEX(pos*scale + Time*NoiseSpeed);
  pos += float3(-987.65, -876.54, -765.43);
  float z = FastGradientPerlinNoise3D_TEX(pos*scale + Time*NoiseSpeed);
  TurbulenceOut = (float3(x, y, z) + Bias) * Gain;
Œ#‹"à;H€¡Y
Gain = 0.0;
UseBand = false;
// Don't use the band if the min/max are the same.
     UseBand = true;
    if( Density >= DensityBand.x && Density <= DensityBand.y ) 
        Gain = DensityGain;      
    if( Temperature >= TemperatureBand.x && Temperature <= TemperatureBand.y ) 
        Gain = TemperatureGain;      
:U‡F¼;‹úìíû¶
:U‡F¼;‹úìíû
:U‡F¼;‹úìíû¸
:U‡F¼;‹úìíûº
    if( Mode > 0 ) // Ramp
        Gain = saturate((GridValue-ValueRange.x) / (ValueRange.y-ValueRange.x));  
    else if( GridValue >= ValueRange.x && GridValue <= ValueRange.y ) // Band
        Gain = 1.0;  
;´DíÁê
  float3 scale = NoiseScale;
¯;ı9:áLŒcÔ×w-ğÍ
¯;ı9:áLŒcÔ×w-ğM
€;•Ÿ8û‡@Š©!aÌğ¡
¯;ı9:áLŒcÔ×w-ğÑ
¯;ı9:áLŒcÔ×w-ğÕ
¯;ı9:áLŒcÔ×w-ğÙ
Hmœ™5-ÆAŠ;ÀRJ¹Å
Y\İL»úğ€Ü,";ä
0·‡:wO°L[;WÒQ¶ê
Š§\>;C¶
¯;ı9:áLŒcÔ×w-ğ
G,˜¤²;J–ªä/Y
”×E³éı;
ö‚8;8‹
Eíb~y@ºõö;@÷D"Q
Eíb~y@ºõö;@÷D"
Eíb~y@ºõö;@÷D"T
Eíb~y@ºõö;@÷D"W
ÛFU\;6òH½
RßN¾;i|
Ÿ¯€;mç
Eíb~y@ºõö;@÷D"\
Eíb~y@ºõö;@÷D"e
Eíb~y@ºõö;@÷D"n
O]ˆ;@©,úæ*
Eíb~y@ºõö;@÷D"x
«IºÊ;AEN™.$ñ
ô;h¡ˆ
÷;è#)À)@ªÛ[­6tf‹ä
ê¥ò;æ6Bº
K•=õœ;6q—ä
È}ØÁ!)äLaô<\<ıÕ;
E³ËF‚`&“Ÿ>•;ä
×;¥Îãõ
¢b>D‘û;Dz
ô;h¡ˆs
ô;h¡ˆw
ô;h¡ˆ{
;|(ƒKª`›7ÅVµâê
ô;h¡ˆ„
ô;h¡ˆ‰
ô;h¡ˆ
h;w6Ğ0êB»ÏÔÚDÙ
ÿ LÏZ;çr
_\›=›):;lú<
<İU-a1\;
    upgrade_context.set_vec3_input("Turbulence Frequency", (freq.as_float(), freq.as_float(), freq.as_float()))
    upgrade_context.set_vec3_input("Turbulence Gain", (gain.as_float(), gain.as_float(), gain.as_float()))
Í1';0¨K°áW;{ë(
Áƒ*—ö¥€.;ÄÑ


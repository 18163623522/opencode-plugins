Position = float3(0,0,0);
float rand = FastGradientPerlinNoise3D_TEX(AnglePos*AngleNoiseFrequency+float3(AngleNoiseRandomFloat,AngleNoiseRandomFloat*114.514,-AngleNoiseRandomFloat*233.3));
float rand2 = sign(rand)*(1-pow(1-abs(rand),AngleNoiseDifference));
CurrHeight +=  rand2*CurrHeight/MaxHeight * AngleNoiseAmplitude;
Position.z = CurrHeight;
HeightFrac = CurrHeight/(MaxHeight+AngleNoiseAmplitude);
float HeightProfile = HeightFrac;
HeightCurve.SampleCurve(HeightFrac, HeightProfile);
+lerp(ConeThicknessBottom,ConeThicknessTop,HeightProfile)*(ThicknessDistributionRandomFloat*2-1);
¨Ï;Fä@ŸÀ@
;`¶Ã
a±Cİ1;
 z9Dú@•.òÒ
;g‚Ò#
;ĞïOÇN
I“0ü¦ı)¨;*
I“0ü¦ı)¨;Æ
‰İ4d‡;¸&C•ZmÖüİSGñŸ
‡øa²Í$y™;aB¤Mó“Bæ-
İ4d‡;¸&C•ZmÖüİ
²Í$y™;aB¤Mó“Bæ-
ÎÉ4¹|[ëI¼c;
;ÃXL«mzfÎô©iE©
;ÃXL«mzfÎô©
 Oß!g
àF²­ødÜúÈ%;œ%
8’­,k³vK;h–º»/”-
8’­,k³vK;h–º»/”Æ
$—O¼y4Ä;
UH±•‰;
–C¡¿Íò@;NiÆ
HbxGœDˆ­³;wY
;zcíèDåB„
³u-Q¬;
]İ;ÁNtTEœ
bïÇÙz—ÉI¤T¥•;
7D;Áñè
Áƒ*—ö¥€.;ÄÑ


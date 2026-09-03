³î[=!;¬
Transmittance = LightIntensity;
// quality of 1 means we have 1 step per cell
float StepSize = dx / RenderQuality;
float WorldStepSize = StepSize;
float t = 0;
// Make sure we never take more than some max number of steps
int NumStepsForRay = min(MaxNumSteps, tmax / StepSize);
DensityMult *= WorldStepSize;
for (int i = 0; i < NumStepsForRay && Transmittance > 1e-5; ++i)
  float3 CurrPos = RayStart + RayDir * t;
  // Convert local space to unit (0-1)
  float3 CurrUnit = CurrPos / WorldGridExtents + .5;  
  float Density = 0;
  Grid.SampleGrid(CurrUnit.x, CurrUnit.y, CurrUnit.z, DensityIndex, Density);
  if( UseLinearCurve || UseDensityCurve )
    float remap = saturate((Density - DensityCurveOffset) / DensityCurveRange);
    if( UseLinearCurve )
        Density = remap;
    else
        DensityCurve.SampleCurve(remap, Density);
  Transmittance *= exp(-1. * Density * DensityMult);
  t += StepSize;  
;hC›0ÅXC¹3`šK
SunDir  = -View.AtmosphereLightDirection[Index];
  float Density = 0;  
  Grid.SamplePreviousGridFloatAtIndex(CurrUnit, DensityIndex, Density);
@‘â;¤ûjºo
@‘â;¤ûjºoÃ
øX¥¬E?°Iœ°;€œæ
¼BK”sæÎO;¤B
=B F;e
"÷aš;Ü
¼BK”sæÎO;¤B2
¼BK”sæÎO;¤B
àFcLªEbfú A©;
XÈ;0\ÛC´G»lúâ«F¬
; ÿ‘ÔİVK¬0HÙ\‘…mA
; ÿ‘ÔİVK¬0HÙ\‘…mg
o;ìóŸe
; ÿ‘ÔİVK¬0HÙ\‘…m
 PîCøzwA¬[j–í"E¬
çO…2ÇAo;jc¬
Áƒ*—ö¥€.;ÄÑ


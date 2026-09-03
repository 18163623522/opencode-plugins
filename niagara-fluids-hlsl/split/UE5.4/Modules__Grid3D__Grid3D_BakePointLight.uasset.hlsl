Transmittance = LightIntensity;
// accomodate radius of point light (we might have zero here)
    Transmittance /= pow(WorldDistToLight, Falloff);
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
  if( UseDensityCurve )
    float remap = (Density - DensityCurveOffset) / DensityCurveRange;
    DensityCurve.SampleCurve(remap, Density);
  Transmittance *= exp(-1. * Density * DensityMult);
  t += StepSize;  
;CbhVP
*v;Y<D


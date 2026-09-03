.;O8{H\
Color = float4(1,0,0,1);
Color = float4(0,1,0,1);
Color = float4(0,0,1,1);
IsInside = round(Mask) == 1;
OutPosition = Position;
OutVelocity = Velocity;
OutAlive = Alive;
OutState = -1;
OutColor = float4(1,1,1,1);
float3 TmpVel;
SimGridReader.SamplePreviousGridVector3Value<Attribute = "Velocity">(CurrUnit, TmpVel);
float TmpVelMag = length(TmpVel);
float SDFValue;
SDFReader.SamplePreviousGridFloatValue<Attribute = "SDF">(CurrUnit, SDFValue);
// Only init as Foam, never turn back from spray
    OutVelocity = TmpVel;
    OutPosition += Velocity * SimDt;
    AgingRate = FoamAgingRate;
    OutState = 0;
    OutVelocity += Gravity * SimDt;
    AgingRate = SprayAgingRate;
    OutState = 1;
  OutVelocity = TmpVel;
  OutVelocity += BubbleBounancy * SimDt;
  OutPosition += Velocity * SimDt;
  AgingRate = BubbleAgingRate;
  OutState = 2;
// kill non moving or particles out of the domain
    CurrUnit.x < 0 || CurrUnit.x > 1 ||
    CurrUnit.y < 0 || CurrUnit.y > 1 ||
    CurrUnit.z < 0 || CurrUnit.z > 1)
    OutAlive = false;
  AgingRate = FoamAgingRate;
  OutState = 0;
  OutVelocity += Gravity * SimDt;
  AgingRate = SprayAgingRate;
  OutState = 1;
Color = float4(1,1,0,1);


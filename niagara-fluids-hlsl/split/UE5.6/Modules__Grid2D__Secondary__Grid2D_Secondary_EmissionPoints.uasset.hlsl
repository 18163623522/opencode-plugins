µK‹à\µa;óW÷
;«Œ1ë‰KB±W™ÂÐÉ
r;s÷äuäCžBÐ
// vorticity
float vx_1;
float vx_m1;
float vy_1;
float vy_m1;
float2 TmpVector;
GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY+1, TmpVector);
vx_1 = TmpVector.x;
GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY-1, TmpVector);
vx_m1 = TmpVector.x;
GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY, TmpVector);
vy_1 = TmpVector.y;
GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY, TmpVector);
vy_m1 = TmpVector.y;
float curl = abs(((vx_1-vx_m1) - (vy_1-vy_m1)) / (2. * SimDx));
// acceleration
float2 Acceleration = (float2(VelocityX, VelocityY) - float2(PrevVelocityX, PrevVelocityY)) / SimDt;
float AccelerationMag = length(Acceleration);
// curvature
float3 World = SimPos;
World.z += WaterHeight;
float3 Normal = float3(NormalX, NormalY, NormalZ);
float3 Normal_right;
GridCollection.GetPreviousVectorValue<Attribute = "Normal">(IndexX+1, IndexY, Normal_right);
float3 World_right = SimPos;
World_right.x += SimDx;
float TmpH;
GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX+1, IndexY, TmpH);
World_right.z += TmpH;
float3 DiffTmp = World - World_right;
float Curvature_right = dot(Normal - Normal_right, DiffTmp) / dot(DiffTmp, DiffTmp);
float3 Normal_up;
GridCollection.GetPreviousVectorValue<Attribute = "Normal">(IndexX, IndexY+1, Normal_up);
float3 World_up = SimPos;
World_up.y += SimDx;
GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX, IndexY+1, TmpH);
World_up.z += TmpH;
DiffTmp = World - World_up;
float Curvature_up = dot(Normal - Normal_up, DiffTmp) / dot(DiffTmp, DiffTmp);
float Curvature = abs((Curvature_right + Curvature_up) * .5);
// facing ratio of normal and velocity
float CurvatureMult = 1;//smoothstep(MinCurvatureEmitAngle, 1, dot(normalize(Velocity), Normal));
// Noise
float NoiseVal = (FastGradientPerlinNoise3D_TEX(World*NoiseScale+Time * NoiseSpeed)+1)*.5;
NoiseVal = smoothstep(.5, 1, NoiseVal);
// Emit
float EmitVal = 0;
EmitVal += smoothstep(MinEmitVorticity, MaxEmitVorticity, curl);
EmitVal += smoothstep(MinEmitAcceleration, MaxEmitAcceleration, AccelerationMag);
EmitVal += smoothstep(MinEmitCurvature, MaxEmitCurvature, Curvature) * CurvatureMult;
int NumEmitted = 0;
NumEmitted = (int) (EmitVal  * EmissionMult * NoiseVal);
// increment emission buffer by OutGridVal
  float PrevVal = 0;
  EmissionCounter.SetParticleNeighborCount(0, NumEmitted, PrevVal);
  // initialized to -1, so make sure it is 0 for the first time we add particles
  PrevVal = max(0, PrevVal);  
  for (int i = PrevVal; i < NumEmitted + PrevVal &&  i < MaxSecondaryParticlesPerFrame; ++i)
      int d = 0;
      EmissionPositions.SetGridValue(i, 0, 0, CurrUnit.x, d);
      EmissionPositions.SetGridValue(i, 0, 1, CurrUnit.y, d);
Œ;ÆM’#™õ·ð
int NumEmitted = (int) (EmitAmount);
    // if we have an emit amount between 0-1, do russian roulette to emit
    NumEmitted = RandValue < EmitAmount ? 1 : 0;
    NumEmitted = (int) EmitAmount;
      int EmitIndexX, EmitIndexY;
      EmissionPositions.LinearToIndex(i, EmitIndexX, EmitIndexY);
      EmissionPositions.SetGridValue(EmitIndexX, EmitIndexY, 0, CurrUnit.x, d);
      EmissionPositions.SetGridValue(EmitIndexX, EmitIndexY, 1, CurrUnit.y, d);
  float CurrVal = 0;
  EmissionCount.Add(true, NumEmitted, PrevVal, CurrVal);
int NumBoxes;
BoxAngleArray.Length(NumBoxes);
for (int i = 0; i < NumBoxes; ++i)
float3 WorldBoxPos;
float WorldBoxAngle;
float3 WorldBoxSize;
BoxPositionArray.Get(i, WorldBoxPos);
BoxAngleArray.Get(i, WorldBoxAngle);
BoxSizeArray.Get(i, WorldBoxSize);
WorldBoxSize *= BoxSizeMult;
float4 AxisAngleQuat = float4(0, 0, 1, WorldBoxAngle);
AxisAngleQuat.xyz = normalize(AxisAngleQuat.xyz) * sin(AxisAngleQuat.w / 2.f);
AxisAngleQuat.w = cos(AxisAngleQuat.w / 2.f);
// invert
AxisAngleQuat.w *= -1.f;
// translate and rotate box to local space
float3 BoxLocalPos = SimPos - WorldBoxPos;
cross(AxisAngleQuat.xyz, cross(AxisAngleQuat.xyz, BoxLocalPos) * 2.0);
    BoxLocalPos.x >= -.5 * WorldBoxSize.x && BoxLocalPos.x <= .5 * WorldBoxSize.x &&
    BoxLocalPos.y >= -.5 * WorldBoxSize.y && BoxLocalPos.y <= .5 * WorldBoxSize.y &&
    BoxLocalPos.z >= -.5 * WorldBoxSize.z && BoxLocalPos.z <= .5 * WorldBoxSize.z
  NumEmitted = 0;
CO½;_?ï1³
ô2Ì;R¿ãM¹§
°;˜°OL¿ÚUÊéZjŽ
A™Tü;å,¬â«
A™Tü;å,¬â]
fN›Íj;
º:2;ÈE€A¿7û€ö¯ŸTò
ÆÏ;ŒïK¾ä
—²bÿ; ·?NŸúÑãxp÷Šù³»–Z™9E
²bÿ; ·?NŸúÑãxp÷Š
;DA©(¤Ú
;X‚¶¡M
¡½;¦¤Ç
¡½;¦¤÷
Øéþ+‘´;
¡½;¦¤Ë
¡½;¦¤Ï
ÔÈf6#0Iº6À%;
¡½;¦¤Ó
N\­ŽW;ÅH¹»g­¨Ùï2Ó
N\­ŽW;ÅH¹»g­¨Ùï2÷
A™Tü;å,¬â
å;HÔÙG’
B¢Œš±;Tï„Ö
B¢Œš±;Tï„
;+·I¦7
e$;9‰©
D¶²;Lh@2Ìò
°;˜°OL¿ÚUÊéZjŽä
°;˜°OL¿ÚUÊéZjŽ
°;˜°OL¿ÚUÊéZjŽô
³‰F›ö;J¿Š
pUOz½Eº~l;_ê
€¢Và;«å-·Ù
J‹Åj¼;Ä
òßà;SOª<ã¢|¢5÷
ã:I6°cÝO™;rÚ{u
;O¬#Ÿù¥K–ñ­ä
Áƒ*ž—ö¥€.;ÄÑ


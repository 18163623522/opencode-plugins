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


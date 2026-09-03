OutPosition = Position;
OutVelocity = float3(0,0,0);
OutAlive = Alive;
OutColor = float4(1,1,1,1);
float2 TmpVel;
float Height = 0;
GridCollection.SamplePreviousGridFloatValue<Attribute = "WaterHeight">(CurrUnit, Height);
Height += LocalToSimulationTranslation.z; 
float Depth = 0;
GridCollection.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(CurrUnit, Depth);
  OutAlive = false;
GridCollection.SamplePreviousGridVector2DValue<Attribute = "Velocity">(CurrUnit, TmpVel);
OutVelocity.xy = TmpVel;
OutPosition += Velocity * SimDt;
OutPosition.z = Height;
OutColor = float4(1,0,0,1);
    OutAlive = false;
OutVelocity = Velocity + float3(0,0,-980) * SimDt;
OutColor = float4(0,1,0,1);
OutVelocity += BubbleBounancy * SimDt;
OutColor = float4(0,0,1,1);
i;qKHc


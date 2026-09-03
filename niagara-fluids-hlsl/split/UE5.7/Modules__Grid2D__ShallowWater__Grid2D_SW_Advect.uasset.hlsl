∑»e;¡Ô≠
ë;≈88´tL∫„L–mu%
®;¸.ê∞
íü P5X≈'›;bˆÓ¶ÛN√[ı$≠
f;È©qEÔFç-3
Lf;f1ƒ{Gº—?
VelocityX = Input_VelocityX;
VelocityY = Input_VelocityY;
WaterDepth = Input_WaterDepth;
float Scale = DtOverDx * AdvectionVelocityMult;
float2 Index = float2(IndexX, IndexY);
float TmpVal;
float TmpA;
float TmpB;
float TmpC;
float2 TmpVector;
float3 SampleUnit;
  // advect x velocity
  // velocity.x is current sample, velocity.y is average of (x,y) and (x,y+1)
  float2 Velocity = float2(Input_VelocityX, Input_VelocityY);
  // velocity y is average
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY+1, TmpVector);
  TmpA = TmpVector.y;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY+1, TmpVector);
  TmpB = TmpVector.y;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY, TmpVector);
  TmpC = TmpVector.y;
  Velocity.y = .25 * (TmpA + TmpB + TmpC + Input_VelocityY);
  float2 SampleIndex = Index - Scale * Velocity;
  GridCollection.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
  GridCollection.SamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit, TmpVector);
  VelocityX = TmpVector.x;
  // advect y velocity
  // velocity.x is current sample, velocity.y is average of (x,y) and (x+1,y)
  // velocity x is average
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY, TmpVector);
  TmpA = TmpVector.x;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY-1, TmpVector);
  TmpB = TmpVector.x;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY-1, TmpVector);
  TmpC = TmpVector.x;
  Velocity.x = .25 * (TmpA + TmpB + TmpC + Input_VelocityX);
  float2 SampleIndex = Index - Scale * Velocity; 
  VelocityY = TmpVector.y;
  // advect depth
  // velocity.x is average of (x,y) and (x+1,y), velocity.y is average of (x,y) and (x,y+1)
  // velocity is average
  Velocity.x = .5 * (TmpVector.x + Input_VelocityX);
  Velocity.y = .5 * (TmpVector.y + Input_VelocityY);
  // @todo(dmp): this is needed to be stable, but not sure why...
  SampleUnit += 1e-6;
  float FillSrc;
  GridCollection.SamplePreviousGridFloatValue<Attribute = "IsCollider">(SampleUnit, FillSrc);
  GridCollection.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit, TmpVal);
  // account for a difference in fill value between source voxel and destination
  // you are fitting an amount of water in a tighter or bigger space
  WaterDepth = TmpVal * (1.- FillSrc) / (1.-Input_IsCollider);
// compute height
WaterHeight = Input_BottomContour + WaterDepth;
VelocityX = 0;
VelocityY = 0;
WaterDepth = 0;
WaterHeight = 0;
;V§C±qÆÙ√Fê\
;áÊX?âLû÷!l?-‡b
VelocityX = Input_Velocity.x;
VelocityY = Input_Velocity.y;
float2 Velocity;
float2 SampleIndex;
      // velocity.x is current sample, velocity.y is average of (x,y) and (x,y+1)
      Velocity = Input_Velocity;
      // velocity y is average
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY+1, TmpVector);
      TmpA = TmpVector.y;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY+1, TmpVector);
      TmpB = TmpVector.y;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY, TmpVector);
      TmpC = TmpVector.y;
      Velocity.y = .25 * (TmpA + TmpB + TmpC + Input_Velocity.y);
      SampleIndex = Index - Scale * Velocity;
      GridCollection.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
      VelocityGrid.SamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit, TmpVector);
      VelocityX = TmpVector.x;
      // velocity.x is current sample, velocity.y is average of (x,y) and (x+1,y)
      // velocity x is average
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY, TmpVector);
      TmpA = TmpVector.x;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY-1, TmpVector);
      TmpB = TmpVector.x;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY-1, TmpVector);
      TmpC = TmpVector.x;
      Velocity.x = .25 * (TmpA + TmpB + TmpC + Input_Velocity.x);
      SampleIndex = Index - Scale * Velocity; 
      VelocityY = TmpVector.y;
      // velocity.x is average of (x,y) and (x+1,y), velocity.y is average of (x,y) and (x,y+1)
      // velocity is average
      Velocity.x = .5 * (TmpVector.x + Input_Velocity.x);
      Velocity.y = .5 * (TmpVector.y + Input_Velocity.y);
      // @todo(dmp): this is needed to be stable, but not sure why...
      // commenting out 11/22 - more testing needed
      // SampleUnit += 1e-6;
      float FillSrc;
      GridCollection.SamplePreviousGridFloatValue<Attribute = "IsCollider">(SampleUnit, FillSrc);
      WaterGrid.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit, TmpVal);
      // account for a difference in fill value between source voxel and destination
      // you are fitting an amount of water in a tighter or bigger space
      WaterDepth = TmpVal * (1.- FillSrc) / (1.-Input_IsCollider);
      if (CubicInterpolation)
        VelocityGrid.CubicSamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit.xy, TmpVector);
      else 
        VelocityGrid.SamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit.xy, TmpVector);
         WaterGrid.CubicSamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit.xy, TmpVal);
         WaterGrid.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit.xy, TmpVal);
      // float FillSrc;
      // GridCollection.SamplePreviousGridFloatValue<Attribute = "IsCollider">(SampleUnit, FillSrc);
      // WaterDepth = TmpVal * (1.- FillSrc) / (1.-Input_IsCollider);
      //float AdvectedBottomContour;
      //GridCollection.SamplePreviousGridFloatValue<Attribute="BottomContour">(SampleUnit.xy, AdvectedBottomContour);
      //if (AdvectedBottomContour >= Input_BottomContour)
      //{
          WaterDepth = TmpVal;
      //}
Û≤6æ'∫‹Jê∫π±»pB;
OutWaterHeight = WaterHeight;
OutWaterDepth = WaterDepth;
OutVelocity = Velocity;
Diff = abs(NewBottomContour - OldBottomContour);
   Diff = 0;
   OutWaterHeight = NewBottomContour;
   OutWaterDepth = 0;
   OutVelocity = float2(0,0);
`ˆ;ò¨Ià«
/Ú∂Ñ‡:¶@îÎÿ=F;$ 
/Ú∂Ñ‡:¶@îÎÿ=F;$ i
ï;ÄCûÛ
yuG¶;˙
ÄÊjN‹q*Lß;ã≠¢8Ás™
;V§C±qÆÙ√Fê\&
;V§C±qÆÙ√Fê\L
ÑA#@°k≥ØΩ;–e£
Uˆ[B£¶z;s£ù
;áÊX?âLû÷!l?-‡b'
;áÊX?âLû÷!l?-‡b‡
;V§C±qÆÙ√Fê\(
;áÊX?âLû÷!l?-‡b)
oáD≤z:∫Ñö¥;óSﬁMb
;V§C±qÆÙ√Fê\+
oáD≤z:∫Ñö¥;
;áÊX?âLû÷!l?-‡b,
Û≤6æ'∫‹Jê∫π±»pB;3
HdÓï;ÑÏÅz™z±
¡É*ûóˆ•Ä.;ƒ—


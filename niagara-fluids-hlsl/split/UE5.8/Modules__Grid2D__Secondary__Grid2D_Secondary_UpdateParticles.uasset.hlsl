á;üÄ0öUH…—
† ®Re;¹
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
0T½ÀEŠ;
ÀˆCûC¥‘Òi;qKH
WaterReader.SamplePreviousGridFloatValue<Attribute = "WaterHeight">(CurrUnit, Height);
Height += LocalToWorldTranslation.z; 
WaterReader.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(CurrUnit, Depth);
VelocityReader.SamplePreviousGridVector2DValue<Attribute = "Velocity">(CurrUnit, TmpVel);
/Å1Šòf¯@¬U[{îYf›;
•B´™şM\¡:W;
âØxíî=ÅKª˜›!PtÌZ;
L„¼¹ÕßM¢];
H¦o…öR¡ç3;
ñûI¥Ooíœ%)¼;
9;¼OƒA{¨¢ëû™;
9;¼OƒA{¨¢ëû™
float eps = 1e-5;
// kill particles under the surface with very shallow water
    VelocityReader.SamplePreviousGridVector2DValue<Attribute = "Velocity">(CurrUnit, TmpVel);
    OutVelocity.xy = TmpVel;
    OutPosition += Velocity * SimDt;
    OutPosition.z = Height;
    OutColor = float4(1,0,0,1);
    OutVelocity = Velocity + Gravity * SimDt;
    OutColor = float4(0,1,0,1);
    OutVelocity += BubbleBounancy * SimDt;
    OutColor = float4(0,0,1,1);
9;¼OƒA{¨¢ëû™<
9;¼OƒA{¨¢ëû™U
    WaterReader.SamplePreviousGridFloatValue<Attribute = "WaterHeight">(CurrUnit, Height);
    WaterReader.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(CurrUnit, Depth);
    float4 BakedSimSample;
    BakedSimGrid.SampleTexture2D(CurrUnit, 0, BakedSimSample);
    Height = BakedSimSample.x;
    Depth = BakedSimSample.y;
    TmpVel = float2(BakedSimSample.z, BakedSimSample.w);
float3 TmpNormal;
NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(CurrUnit, TmpNormal);
    // Project velocity onto water surface
    OutVelocity = OutVelocity - dot(OutVelocity, TmpNormal) * TmpNormal;
9;¼OƒA{¨¢ëû™=
OutAlive = true;
9;¼OƒA{¨¢ëû™>
<…;â>E¥
ÀˆCûC¥‘Òi;qKHN
“³.½ÔX;C
ÀˆCûC¥‘Òi;qKHO
.½ÔX;C
øâÒ;šO
ÀˆCûC¥‘Òi;qKHP
øâÒ;šP
øâÒ;šy
·gÆ;C–yE¯±däƒQ
·gÆ;C–yE¯±däƒ
"`L¬©˜ß=Töå5z7]ŠÚ0@²–j!`§3;%
ÀˆCûC¥‘Òi;qKHR
øâÒ;šR
5z7]ŠÚ0@²–j!`§3;
·gÆ;C–yE¯±däƒT
ÀˆCûC¥‘Òi;qKHU
øâÒ;šU
„.;*cb¬MÿdÁ
bïÇÙz—ÉI¤T¥•;
Áƒ*—ö¥€.;ÄÑ


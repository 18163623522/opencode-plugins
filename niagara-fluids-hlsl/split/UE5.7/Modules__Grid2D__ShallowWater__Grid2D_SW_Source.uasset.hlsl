M;{›)ý
M;{›)=
M;{›)d
M®)mG¬a_»)Mº;@
M®)mG¬a_»)Mº;
'¨Ð;ÞÌÅH¶)¹
M;{›)C
M®)mG¬a_»)Mº;F
VelocityX = Input_VelocityX;
VelocityY = Input_VelocityY;
WaterDepth = Input_WaterDepth;
WaterHeight = Input_WaterHeight;
    WaterHeight = WorldEmitMin.z;
    WaterDepth = WaterHeight - Input_BottomContour;
    VelocityX = 0;
    VelocityY = 0;
    float NoiseVal = WorldEmitBoundsNoiseMult * FastGradientPerlinNoise3D_TEX(World*WorldEmitBoundsNoiseScale +Time * WorldEmitBoundsNoiseSpeed);
    WaterHeight = WorldEmitMax.z + NoiseVal;
    VelocityX = Velocity.x;
    VelocityY = Velocity.y;
;™Ì&ŽLÁQ
    VelocityX = Velocity.x * VelocityMagnitude;
    VelocityY = Velocity.y * VelocityMagnitude;
VelocityOut = Input_Velocity;
    BoxLocalPos.x >= -.5 * BoxSize.x && BoxLocalPos.x <= .5 * BoxSize.x &&
    BoxLocalPos.y >= -.5 * BoxSize.y && BoxLocalPos.y <= .5 * BoxSize.y &&
    BoxLocalPos.z >= -.5 * BoxSize.z && BoxLocalPos.z <= .5 * BoxSize.z
    if (Sink)
        WaterHeight = WorldEmitMin.z;
        WaterDepth = WaterHeight - Input_BottomContour;
        VelocityOut = float2(0,0);
    else
        float NoiseVal = WorldEmitBoundsNoiseMult * FastGradientPerlinNoise3D_TEX(GridLocalPos*WorldEmitBoundsNoiseScale +Time * WorldEmitBoundsNoiseSpeed);
        WaterHeight = WorldEmitMax.z + NoiseVal;
    BoxLocalPos.x >= -.5 * VelocityBoxSize.x && BoxLocalPos.x <= .5 * VelocityBoxSize.x &&
    BoxLocalPos.y >= -.5 * VelocityBoxSize.y && BoxLocalPos.y <= .5 * VelocityBoxSize.y &&
    BoxLocalPos.z >= -.5 * VelocityBoxSize.z && BoxLocalPos.z <= .5 * VelocityBoxSize.z
    float2 VelAdd = Velocity * VelocityMagnitude;
    if (AdditiveVelocity)
        VelocityOut += VelAdd;
    else if (length(VelAdd) > length(Input_Velocity))
        VelocityOut = VelAdd;
int NumBoxes;
BoxAngleArray.Length(NumBoxes);
for (int i = 0; i < NumBoxes; ++i)
float3 WorldBoxPos;
float WorldBoxAngle;
float3 WorldBoxSize;
BoxPositionArray.Get(i, WorldBoxPos);
BoxAngleArray.Get(i, WorldBoxAngle);
BoxSizeArray.Get(i, WorldBoxSize);
float4 AxisAngleQuat = float4(0, 0, 1, WorldBoxAngle);
AxisAngleQuat.xyz = normalize(AxisAngleQuat.xyz) * sin(AxisAngleQuat.w / 2.f);
AxisAngleQuat.w = cos(AxisAngleQuat.w / 2.f);
//DebugDraw.DrawBox(true, WorldBoxPos, AxisAngleQuat, .5 * WorldBoxSize, float4(1,1,1,1));
// invert
AxisAngleQuat.w *= -1.f;
// translate and rotate box to local space
float3 BoxLocalPos = GridWorldPos - WorldBoxPos;
cross(AxisAngleQuat.xyz, cross(AxisAngleQuat.xyz, BoxLocalPos) * 2.0);
float3 WorldEmitMax = WorldBoxSize * .5 + mul(float4(WorldBoxPos, 1.f), WorldToLocal).xyz;
// size of velocity box
float3 VelocityBoxSize = WorldBoxSize;
    BoxLocalPos.x >= -.5 * WorldBoxSize.x && BoxLocalPos.x <= .5 * WorldBoxSize.x &&
    BoxLocalPos.y >= -.5 * WorldBoxSize.y && BoxLocalPos.y <= .5 * WorldBoxSize.y &&
    BoxLocalPos.z >= -.5 * WorldBoxSize.z && BoxLocalPos.z <= .5 * WorldBoxSize.z
    WaterHeight = WorldEmitMax.z;
    float3 SinkNormal = normalize(float3(SplineVelocity, 0));
    float DistToSink = abs(BoxLocalPos.y);
    // want a sink radius at least as big as the river width
    float SinkRadiusToUse = WorldBoxSize.x;
    if (DistToSink <= SinkRadiusToUse)
        float WaterHeightToTarget = SplineWaterDepth > 1e-5 ? SplineWaterHeight : Input_BottomContour;
        float LerpAmount = smoothstep(0, SinkRadiusToUse, DistToSink);
        float GoalWaterHeight = lerp(WaterHeightToTarget, WaterHeight, LerpAmount);        
        WaterHeight += SinkDissipationRate * (GoalWaterHeight - WaterHeight) * dt;
        float2 GoalVelocity = lerp(float2(0,0), VelocityOut, LerpAmount);
        VelocityOut += .1 * SinkDissipationRate * (GoalVelocity - VelocityOut) * dt;
ý^BMöM“Ü(;yŒXæQ
ý^BMöM“Ü(;yŒXæ!
;ÉñFx-V±áÖhQ
;ÉñFx-V±áÖhK
        WaterHeight = Input_BottomContour;
        WaterDepth = 0;
huèOõéKJ©ˆ™U=W;'æ
J˜F°;ˆ¼€kß
L¯k»~ž;!
›5"!¥ãH‚;
>‘~ùe;KDç
 |AœpBîé„Ó;
/ÞÈII!g "¥;Åã
`e;¹ÛiWK­o&
èë;®~
ÌL# "ZE™M;‡bÑ}
èë;®~œ
™¬;ýŠEŸ¯´D‹C®û
Î]JÄêÂWIKT;„EŠžCà’B’
©Ám®,F…;R®ìÀÌ6®
©Ám®,F…;R®ìÀÌ6æ
ÂWIKT;„EŠžCà’B’
áœdçØG³moçW;µmã
Í;6RãÖ!B¾
 G›¤XïÊßø|1ü
 G›¤XïÊßø|
©Ám®,F…;R®ìÀÌ6±
©Ám®,F…;R®ìÀÌ6´
;ÂB.ÐW6H¨S%+Ìt
;N,QGA®<3A
ÌL# "ZE™M;‡bÑ}µ
ÌL# "ZE™M;‡bÑ}°
©Ám®,F…;R®ìÀÌ6·
;+·I¦7
ý^BMöM“Ü(;yŒXæ
;ÉñFx-V±áÖh
(Ü_½C¢jb¿â;õVnT
ÑV‘h¬¬ê;v„³@¶ìÊ5”xGø»aVj¼1œCœ²û
ž{vDž s8zÊq'=;öç)
nÁ>ÆEŠ;3õU4(
nÁ>ÆEŠ;3õU4(Æ
(Ü_½C¢jb¿â;õV
¬¬ê;v„³@¶ìÊ5”xGø
õ;W½/µ3G¡
=;öç)
²Æ;Ž:A›
 |AœpBîé„Ó;Õ
 |AœpBîé„Ó;ó
C½;·ŒÌå€<
|;0´óéLš5~
 IM—™wÉ~»!Âæ
F;Ñí^¾HL†²6®ÞûZaæ
Áƒ*ž—ö¥€.;ÄÑ


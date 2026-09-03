µ;Å„n9¶
8O&c¸h1ìÓ;◊
cûM*æ;S
˛;TÙª0
N;v´)@
1äÚ›z√˚;Vû
// Unit space position of the current vertex
float3 InUnit = mul(float4(InWorld,1), WorldToLocal).xyz;
InUnit = InUnit / WorldGridExtents + .5;
float3 CameraUnit = mul(float4(CameraWorld,1), WorldToLocal).xyz;
CameraUnit = CameraUnit / WorldGridExtents + .5;
bool IsInside = all(CameraUnit <= float3(1,1,1)+1e-5) && all(CameraUnit >= float3(0,0,0)-1e-5);
float3 OutWorldVertexPos = InWorld;
// true if at least one vertex is behind the near clip plane
bool VertexBehind = false;
// true if at least one vertex is visible
bool VertexVisible = false;
// evaluate the 8 corners of the fluid bbox in clip space 
// find the axis aligned bbox in clip space
float4 BBoxClipMin = float4(INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT);
float4 BBoxClipMax = -1. * float4(INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT);
for (int x = 0; x <= 1; ++x) {
for (int y = 0; y <= 1; ++y) {
for (int z = 0; z <= 1; ++z) {
    // get the fluid box corner in world space
    const float3 BBoxUnit = float3(x,y,z);
    const float3 BBoxLocal = (BBoxUnit - .5) * WorldGridExtents;
    const float3 BBoxWorld =  mul(float4(BBoxLocal,1), LocalToWorld).xyz;
    // world to clip space
    // assume no LWC for now
    FDFVector4 FDFBBoxWorld = 
        DFFromTileOffset_Hack(MakeLWCVector4(MakeLWCVector3(float3(0,0,0), BBoxWorld), 1));
    float4 BBoxClip = DFMultiplyDemote(FDFBBoxWorld, ResolvedView.WorldToClip);
    float2 ScreenPos = BBoxClip.xy / BBoxClip.w;
    // if this vertex is in front of the near clip plane, add it to the aabbox
    if (BBoxClip.w > 0)    
        // vertex is visible
        if (any(abs(ScreenPos) <= float2(1,1)))
            VertexVisible = true;
        BBoxClipMin = min(BBoxClip, BBoxClipMin);
        BBoxClipMax = max(BBoxClip, BBoxClipMax);      
    else
       VertexBehind = true;
BBoxClipMin = min(BBoxClipMin, BBoxClipMax);
BBoxClipMax = max(BBoxClipMin, BBoxClipMax);
// if we have a visible vertex and at least one vertex is behind the near clip plane
// then transform to a clip aligned bbox
    int3 UnitCorner = round(InUnit);
    UnitCorner.z = 0;
    float2 ScreenPosition = 2 * (round(InUnit.xy) - .5);
    float SceneDepth = NearClipOffset;//max(NearClipOffset, BBoxClipMin.z / BBoxClipMin.w);
    float4 Tmp = mul(float4(ScreenPosition * SceneDepth, SceneDepth, 1), DFHackToFloat(ResolvedView.ScreenToWorld));
    OutWorldVertexPos = Tmp.xyz / Tmp.w;
      float4 BBoxClipSize = BBoxClipMax - BBoxClipMin;
      // transform the box back to world space for the current vertex.  
      // vertex is identified by the unit space position
      const int3 UnitCorner = round(InUnit);
      int4 v = float4(1.0 - UnitCorner, UnitCorner.z);
      float4 BBoxClipPos = BBoxClipMin + BBoxClipSize * v;
      // clamp to a near clip plane offset
     // BBoxClipPos.w = max(NearClipOffset, BBoxClipPos.w);
      // output world position for vertex
      float4 Tmp = DFDemote(DFMultiply(BBoxClipPos, ResolvedView.ClipToWorld));
      OutWorldVertexPos = Tmp.xyz;
return OutWorldVertexPos;
int3 UnitCorner = round(InUnit);
UnitCorner.z = 0;
float2 ScreenPosition = 2 * (round(InUnit.xy) - .5);
float SceneDepth = NearClipOffset;//max(NearClipOffset, BBoxClipMin.z / BBoxClipMin.w);
float4 Tmp = mul(float4(ScreenPosition * SceneDepth, SceneDepth, 1), DFHackToFloat(ResolvedView.ScreenToWorld));
return Tmp.xyz / Tmp.w;
float3 InUnit = InLocal / WorldGridExtents + LocalPivot;
float3 CameraUnit = CameraLocal / WorldGridExtents + LocalPivot;
g‡8…ÈCñGñ∏;˙
¡É*ûóˆ•Ä.;ƒ—


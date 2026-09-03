// Unit space position of the current vertex
float3 InUnit = mul(float4(InWorld,1), WorldToLocal).xyz;
InUnit = InUnit / WorldGridExtents + .5;
float3 CameraLocal = mul(float4(CameraWorld,1), WorldToLocal).xyz;
float3 CameraUnit = CameraLocal / WorldGridExtents + .5;
float3 OutWorldVertexPos = InWorld;
// true if at least one vertex is behind the near clip plane
bool VertexBehind = false;
// true if at least one vertex is visible
bool VertexVisible = false;
// evaluate the 8 corners of the fluid bbox in clip space 
// find the axis aligned bbox in clip space
float4 BBoxClipMin = float4(INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT);
float4 BBoxClipMax = -1. * float4(INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT);
float MinW = INFINITE_FLOAT;
float MaxW = -1. * INFINITE_FLOAT;
for (int x = 0; x <= 1; ++x) {
for (int y = 0; y <= 1; ++y) {
for (int z = 0; z <= 1; ++z) {
    const float3 BBoxUnit = float3(x,y,z);
    const float3 BBoxLocal = (BBoxUnit - .5) * WorldGridExtents;
    const float3 BBoxWorld =  mul(float4(BBoxLocal,1), LocalToWorld).xyz;
    float4 BBoxClip = mul(float4(BBoxWorld,1),LWCToFloat(ResolvedView.WorldToClip));
    // if this vertex is in front of the near clip plane, add it to the aabbox
    if (BBoxClip.w > 0)
        // vertex is visible
        if (any(BBoxClip.xy <= BBoxClip.w) && any(-BBoxClip.xy <= BBoxClip.w))
            VertexVisible = true;
      MinW = min(BBoxClip.w, MinW);
      MaxW = max(BBoxClip.w, MaxW);
      BBoxClip /= BBoxClip.w;
      BBoxClipMin = min(BBoxClip, BBoxClipMin);
      BBoxClipMax = max(BBoxClip, BBoxClipMax);      
        VertexBehind = true;
// if we have a visible vertex and at least one vertex is behind the near clip plane
// then transform to a clip aligned bbox
      BBoxClipMin = min(BBoxClipMin, float4(-1,-1,1,1));
      BBoxClipMax = max(BBoxClipMax, float4(-1,-1,1,1));
      BBoxClipMin = min(BBoxClipMin, float4(1,1,1,1));
      BBoxClipMax = max(BBoxClipMax, float4(1,1,1,1));
      // clamp the clip space bbox z to near clip plane
      BBoxClipMax.z = min(1-1e-2, BBoxClipMax.z);
      float4 BBoxClipSize = BBoxClipMax - BBoxClipMin;
      // transform the box back to world space
      int4 v = 1-float4(round(InUnit), 1);
      float4 BBoxClipPos = BBoxClipMin + BBoxClipSize * v;
      // output world position for vertex
      float4 Tmp = mul(BBoxClipPos,LWCToFloat(ResolvedView.ClipToWorld));
      OutWorldVertexPos = Tmp.xyz / Tmp.w;
return OutWorldVertexPos;
// if camera is inside the volume, then align bbox vertices to the camera
//if (CameraUnit.x >= 0 && CameraUnit.x <= 1 &&
//  CameraUnit.y >= 0 && CameraUnit.y <= 1 &&
//  CameraUnit.z >= 0 && CameraUnit.z <= 1)
    // evaluate the 8 corners of the fluid bbox in clip space 
   // find the axis aligned bbox in clip space
   float4 BBoxClipMin = float4(INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT);
   float4 BBoxClipMax = -1. * float4(INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT,INFINITE_FLOAT);
   float MinW = INFINITE_FLOAT;
   float MaxW = -1. * INFINITE_FLOAT;
   for (int x = 0; x <= 1; ++x) {
   for (int y = 0; y <= 1; ++y) {
   for (int z = 0; z <= 1; ++z) {
      const float3 BBoxUnit = float3(x,y,z);
      const float3 BBoxLocal = (BBoxUnit - .5) * WorldGridExtents;
      const float3 BBoxWorld =  mul(float4(BBoxLocal,1), LocalToWorld).xyz;
      float4 BBoxClip = mul(float4(BBoxWorld,1),LWCToFloat(ResolvedView.WorldToClip));
      BBoxClipMax = max(BBoxClip, BBoxClipMax);
   // visible
   if (MaxW > 0.0)
     // at least one vertex is behind the near clip
     if (MinW <= 0.0)
     BBoxClipMax = float4(1,1,1,1);
     BBoxClipMin = float4(-1,-1,-1,1);       
   // clamp the clip space bbox z to near clip plane
   BBoxClipMax.z = min(1-1e-2, BBoxClipMax.z);
  float4 BBoxClipSize = BBoxClipMax - BBoxClipMin;
  // transform the box back to world space
  int4 v = 1-float4(round(InUnit), 1);
  float4 BBoxClipPos = BBoxClipMin + BBoxClipSize * v;
  // output world position for vertex
  float4 Tmp = mul(BBoxClipPos,LWCToFloat(ResolvedView.ClipToWorld));
  OutWorldVertexPos = Tmp.xyz / Tmp.w;
   // visible and at least one vertex is behind the near clip
   if (MaxW > 0.0 && MinW <= 0.0 )
     BBoxClipMin = float4(-1,-1,0,1);       
   BBoxClipMax.z = min(1-1e-3, BBoxClipMax.z);
 // OutWorldVertexPos = Tmp.xyz / Tmp.w;
  CameraUnit.y >= 0 && CameraUnit.y <= 1 &&
  CameraUnit.z >= 0 && CameraUnit.z <= 1)
     float4 BBoxClipMax = float4(1,1,1,1);
     float4 BBoxClipMin = float4(-1,-1,0,1);    


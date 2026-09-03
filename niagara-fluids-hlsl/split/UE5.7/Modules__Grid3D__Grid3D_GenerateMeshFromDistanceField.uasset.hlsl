óLVâµc}I­¼;¶c
    uint3(0,0,1),
    uint3(1,0,1),
    uint3(1,0,0),
    uint3(0,0,0),
    uint3(0,1,1),
    uint3(1,1,1),
    uint3(1,1,0),
    uint3(0,1,0),
const uint3 CubeIndex = GDispatchThreadId;
bool bSuccess;
float CornerWeights[8];
float3 CornerPositions[8];
int CubeType = 0;
int i = 0;
bool AllInside = true;
for (i = 0; i < 8; ++i)
    uint3 CornerIndex = CubeIndex + CornerOffsets[i];
    CornerIndex = clamp(CornerIndex, uint3(0,0,0), uint3(NumVerticesX-1, NumVerticesY-1, NumVerticesZ-1));
float4 Weight;
DistanceRT.GetRenderTargetValue(CornerIndex.x, CornerIndex.y, CornerIndex.z, Weight);
CornerWeights[i] = Weight.x;
    CornerPositions[i] = (float3(CornerIndex) + .5) / float3(NumVerticesX, NumVerticesY, NumVerticesZ);
    CornerPositions[i] = mul(float4(CornerPositions[i], 1.0), UnitToWorld).xyz;
    CubeType |= CornerWeights[i] < IsoValue ? 1l << i : 0l;
for (i = 0; TriToEdges[CubeType][i] != -1; i += 3)
const int2 Edge0 = Edges[TriToEdges[CubeType][i + 0]];
const int2 Edge1 = Edges[TriToEdges[CubeType][i + 1]];
const int2 Edge2 = Edges[TriToEdges[CubeType][i + 2]];
float3 TriangleVerts[3];
TriangleVerts[0] = LERP_EDGE(CornerPositions[Edge0.x], CornerWeights[Edge0.x], CornerPositions[Edge0.y], CornerWeights[Edge0.y]);
TriangleVerts[1] = LERP_EDGE(CornerPositions[Edge1.x], CornerWeights[Edge1.x], CornerPositions[Edge1.y], CornerWeights[Edge1.y]);
TriangleVerts[2] = LERP_EDGE(CornerPositions[Edge2.x], CornerWeights[Edge2.x], CornerPositions[Edge2.y], CornerWeights[Edge2.y]);
float3 TangentX, TangentY, TangentZ;
    float4 TmpV;
    float3 TriCenter = (1./3) * (TriangleVerts[0] + TriangleVerts[1] + TriangleVerts[2]);
    float3 TriCenterUnit = mul(float4(TriCenter, 1.0), WorldToUnit).xyz;
    DistanceRT.SampleRenderTargetValue(TriCenterUnit, 0, TmpV);
    TangentZ = normalize(TmpV.yzw);
float3 UnitDx = 1./float3(NumVerticesX,NumVerticesY,NumVerticesZ);
DistanceRT.SampleRenderTargetValue(TriCenterUnit + float3(1,0,0) * UnitDx, 0, TmpV);
float S_right = TmpV.x;
DistanceRT.SampleRenderTargetValue(TriCenterUnit - float3(1,0,0) * UnitDx, 0, TmpV);
float S_left = TmpV.x;
DistanceRT.SampleRenderTargetValue(TriCenterUnit + float3(0,1,0) * UnitDx, 0, TmpV);
float S_up = TmpV.x;
DistanceRT.SampleRenderTargetValue(TriCenterUnit - float3(0,1,0) * UnitDx, 0, TmpV);
float S_down = TmpV.x;
DistanceRT.SampleRenderTargetValue(TriCenterUnit + float3(0,0,1) * UnitDx, 0, TmpV);
float S_front = TmpV.x;
DistanceRT.SampleRenderTargetValue(TriCenterUnit - float3(0,0,1) * UnitDx, 0, TmpV);
float S_back = TmpV.x;
//TangentZ = normalize(float3(S_right - S_left, S_up - S_down, S_front - S_back));
TangentX = normalize(TriangleVerts[2] - TriangleVerts[0]);
TangentY = normalize(TriangleVerts[1] - TriangleVerts[0]);
//TangentZ = cross(TangentX, TangentY);
TangentY = cross(TangentZ, TangentX);
    float3 Tri0Unit = mul(float4(TriangleVerts[0], 1.0), WorldToUnit).xyz;
    DistanceRT.SampleRenderTargetValue(Tri0Unit, 0, TmpV);
    float3 TangentZ0 = normalize(TmpV.yzw);
    float3 TangentX0 = cross(TangentZ0, TangentX);
    float3 TangentY0 = cross(TangentZ0, TangentX0);
    float3 Tri1Unit = mul(float4(TriangleVerts[1], 1.0), WorldToUnit).xyz;
    DistanceRT.SampleRenderTargetValue(Tri1Unit, 0, TmpV);
    float3 TangentZ1 = normalize(TmpV.yzw);
    float3 TangentX1 = cross(TangentZ1, TangentX);
    float3 TangentY1 = cross(TangentZ1, TangentX1);
    float3 Tri2Unit = mul(float4(TriangleVerts[2], 1.0), WorldToUnit).xyz;
    DistanceRT.SampleRenderTargetValue(Tri2Unit, 0, TmpV);
    float3 TangentZ2 = normalize(TmpV.yzw);
    float3 TangentX2 = cross(TangentZ2, TangentX);
    float3 TangentY2 = cross(TangentZ2, TangentX2);
int TriangleIndex;
#endif //GPU_SIMULATION
jN©›;eØSwh
jN©›;eØSwhŒ
­_Êç;)aI­€ümõ
;%žE®V¹ç\>­@Œ
Áƒ*ž—ö¥€.;ÄÑ


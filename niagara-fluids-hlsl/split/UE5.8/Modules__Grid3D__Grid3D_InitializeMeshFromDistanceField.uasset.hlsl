NumVerticesX = NumGridCellsX;
NumVerticesY = NumGridCellsY;
NumVerticesZ = NumGridCellsZ;
NumCubesX = NumVerticesX - 1;
NumCubesY = NumVerticesY - 1;
NumCubesZ = NumVerticesZ - 1;
TotalCubes = NumCubesX*NumCubesY*NumCubesZ;
TotalVertices = NumVerticesX*NumVerticesY*NumVerticesZ;
int MaxMeshTriangles = TotalCubes * 3;
GeneratedMesh.SetMeshProperties(true, MaxMeshTriangles*3, 0, 0, true);
GeneratedMesh.SetSectionCount(true, 1);
GeneratedMesh.SetSectionData(true, 0, MaxMeshTriangles, 0);
float3 Bounds = float3(NumCubesX, NumCubesY, NumCubesZ) * CellSize * 0.5f;
EmitterProperties.SetFixedBounds(true, true, -Bounds, Bounds);
óëB.;&GŠ
5[‰ˆ-Fƒ”Zg!t;‹š
ÖX?.{0B²!ƒŒ“­œ˜;
¬®;Dš8
Z¾ÀQb•ªKª;aôÄ
;*ÅÜ)yOY_P·C°º
Áƒ*—ö¥€.;ÄÑ


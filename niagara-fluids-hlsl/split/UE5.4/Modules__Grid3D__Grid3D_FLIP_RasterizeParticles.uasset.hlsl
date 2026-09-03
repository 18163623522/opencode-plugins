int IGNORE = 0;
int XIndexInt = round(Index.x);
int YIndexInt = round(Index.y);
int ZIndexInt = round(Index.z);
RasterizationGrid_velocity.InterlockedAddFloatGridValue(XIndexInt, YIndexInt, ZIndexInt, 0, Velocity.x, IGNORE);
RasterizationGrid_velocity.InterlockedAddFloatGridValue(XIndexInt, YIndexInt, ZIndexInt, 1, Velocity.y, IGNORE);
RasterizationGrid_velocity.InterlockedAddFloatGridValue(XIndexInt, YIndexInt, ZIndexInt, 2, Velocity.z, IGNORE);
RasterizationGrid_velocity.InterlockedAddFloatGridValue(XIndexInt, YIndexInt, ZIndexInt, 3, 1, IGNORE);
BoundaryGrid.SetGridValue(XIndexInt, YIndexInt, ZIndexInt, BoundaryIndex, 3, IGNORE);
Grid.SetGridValue(XIndexInt, YIndexInt, ZIndexInt, VelocityIndex+0, Velocity.x, IGNORE);
Grid.SetGridValue(XIndexInt, YIndexInt, ZIndexInt, VelocityIndex+1, Velocity.y, IGNORE);
Grid.SetGridValue(XIndexInt, YIndexInt, ZIndexInt, VelocityIndex+2, Velocity.z, IGNORE);
int XIndexInt = floor(Index.x);
int YIndexInt = floor(Index.y);
int ZIndexInt = floor(Index.z);
float3 GridFraction = Index - float3(XIndexInt, YIndexInt, ZIndexInt);
for (int x = 0; x <= 1; ++x) {
    const float GridWeightX = (x == 0) ? 1.0 - GridFraction.x : GridFraction.x;
    for (int y = 0; y <= 1; ++y) {
        const float GridWeightY = (y == 0) ? 1.0 - GridFraction.y : GridFraction.y;
            for (int z = 0; z <= 1; ++z) {
                const float GridWeightZ = (z == 0) ? 1.0 - GridFraction.z : GridFraction.z;
                const float GridWeightXYZ = 1;//GridWeightX*GridWeightY*GridWeightZ;
                RasterizationGrid_velocity.InterlockedAddFloatGridValueSafe(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 0, GridWeightXYZ*Velocity.x, IGNORE);
                RasterizationGrid_velocity.InterlockedAddFloatGridValueSafe(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 1, GridWeightXYZ*Velocity.y, IGNORE);
                RasterizationGrid_velocity.InterlockedAddFloatGridValueSafe(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 2, GridWeightXYZ*Velocity.z, IGNORE);
                RasterizationGrid_velocity.InterlockedAddFloatGridValue(XIndexInt+x, YIndexInt+y, ZIndexInt+z, 3, GridWeightXYZ, IGNORE);
                BoundaryGrid.SetGridValue(XIndexInt+x, YIndexInt+y, ZIndexInt+z, BoundaryIndex, 3, IGNORE);


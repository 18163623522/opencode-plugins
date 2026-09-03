OutVelocity = Velocity;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
int CellType = round(Boundary);
float TotalWeight = 0;
// if we have a boundary cell, then gather value from closest neighbor cell
    OutVelocity = float3(0,0,0);
    for (int xx = -ExtrapolationHalfWidth; xx <= ExtrapolationHalfWidth; ++xx)  {
    for (int yy = -ExtrapolationHalfWidth; yy <= ExtrapolationHalfWidth; ++yy)  {        
    for (int zz = -ExtrapolationHalfWidth; zz <= ExtrapolationHalfWidth; ++zz)  { 
        const int TmpIndexX = IndexX + xx;
        const int TmpIndexY = IndexY + yy;
        const int TmpIndexZ = IndexZ + zz;
        float TmpBoundary;
        TransientGrid.GetGridValue(TmpIndexX, TmpIndexY, TmpIndexZ, BoundaryIndex, TmpBoundary);
        int TmpCellType = round(TmpBoundary);
        // only extrapolate from fluid cells
        // don't extrapolate from the boundary of the domain to allow particles to pass through as ballistic when they leave
        if (TmpCellType == FLUID_CELL)
            float Weight = 1./length2(float3(xx,yy,zz));
            float3 TmpVelocity;
            Grid.GetPreviousVector3ValueAtIndex(TmpIndexX, TmpIndexY, TmpIndexZ, VelocityIndex, TmpVelocity);
            OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
    if (TotalWeight > 1e-5)
        OutVelocity /= TotalWeight;
Grid.GetFloatGridValue(IndexX, IndexY, IndexZ, 0, OutVelocity.x);
Grid.GetFloatGridValue(IndexX, IndexY, IndexZ, 1, OutVelocity.y);
Grid.GetFloatGridValue(IndexX, IndexY, IndexZ, 2, OutVelocity.z);
float TmpWeight;
Grid.GetFloatGridValue(IndexX, IndexY, IndexZ, 3, TmpWeight);
    OutVelocity /= TmpWeight;
            Grid.GetFloatGridValue(IndexX+xx, IndexY+yy, IndexZ+zz, 0, TmpVelocity.x);
            Grid.GetFloatGridValue(IndexX+xx, IndexY+yy, IndexZ+zz, 1, TmpVelocity.y);
            Grid.GetFloatGridValue(IndexX+xx, IndexY+yy, IndexZ+zz, 2, TmpVelocity.z);
            Grid.GetFloatGridValue(IndexX+xx, IndexY+yy, IndexZ+zz, 3, TmpWeight);
            if (TmpWeight > 1e-5)
                TmpVelocity /= TmpWeight;
                OutVelocity += TmpVelocity * Weight;
                TotalWeight  += Weight;
            else
                TmpVelocity = float3(0,0,0);
        float4 TmpV;
        BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(TmpIndexX, TmpIndexY, TmpIndexZ, TmpV);
        int TmpCellType = round(TmpV.a);
            Grid.GetPreviousVectorValue<Attribute="Velocity">(TmpIndexX, TmpIndexY, TmpIndexZ, TmpVelocity);


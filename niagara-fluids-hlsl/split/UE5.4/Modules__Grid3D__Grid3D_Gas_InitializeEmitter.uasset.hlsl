MinScale = min(RenderScale.x, min(RenderScale.y, RenderScale.z));
WorldSizeOut = WorldSize;
NumCellsOut = ResolutionMaxAxis;
    WorldSizeOut = float3(1,1,1);
    NumCellsOut = 1;
dx = max(CellSize.x, max(CellSize.y, CellSize.z));
dx = dx < 1e-8 ? 1 : dx;


int IGNORE;
// we never want a radius smaller than half of the cell size otherwise
// we can't rasterize an sdf
float Radius = max(SpriteSize.x * .5 * RadiusMult, dx * .5);
float IndexRadius = Radius / dx;
int size = ceil(IndexRadius) + HalfBandwidth;
int IndexX = round(Index.x);
int IndexY = round(Index.y);
int IndexZ = round(Index.z);
for (int xx = -size; xx <= size; ++xx) {
for (int yy = -size;  yy <= size; ++yy) {
for (int zz = -size; zz <= size; ++zz) {
    int3 CurrIndex = int3(IndexX+xx,IndexY+yy,IndexZ+zz);
    float IndexDist = length(Index - CurrIndex) - IndexRadius;
   if (abs(IndexDist) <= HalfBandwidth &&
        CurrIndex.x >= 0 && CurrIndex.x < NumCellsX &&
        CurrIndex.y >= 0 && CurrIndex.y < NumCellsY &&
        CurrIndex.z >= 0 && CurrIndex.z < NumCellsZ)
        Grid.InterlockedMinFloatGridValue(CurrIndex.x, CurrIndex.y, CurrIndex.z, 0, IndexDist * dx, IGNORE);


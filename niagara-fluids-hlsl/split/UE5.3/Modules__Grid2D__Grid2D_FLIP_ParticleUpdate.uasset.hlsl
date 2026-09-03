IsInside = Index.x >= 2 && Index.y >= 2 &&  Index.x <= NumCellsX - 3 && Index.y <= NumCellsY - 3;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
int CellType = round(Value);
IsInsideBoundary = CellType == SOLID_CELL;


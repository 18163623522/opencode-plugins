int Ignore;
int numCellsX;
int numCellsY;
LowResGrid.GetNumCells(numCellsX, numCellsY);
float2 length = (1.0 / float2(numCellsX, numCellsY))*.85;
float t1 = 0.0;
float t2 = 0.0;
float t3 = 0.0;
float t4 = 0.0;
HighResGrid.SampleGrid(UnitCoordinates.x+length.x,  UnitCoordinates.y,  HighResAttribute,  t1);
HighResGrid.SampleGrid(UnitCoordinates.x-length.x,  UnitCoordinates.y,  HighResAttribute,  t2);
HighResGrid.SampleGrid(UnitCoordinates.x,  UnitCoordinates.y+length.y,  HighResAttribute,  t3);
HighResGrid.SampleGrid(UnitCoordinates.x,  UnitCoordinates.y-length.y,  HighResAttribute,  t4);
const float temperature = (t1+t2+t3+t4)/4.0;
int IndexX;
int IndexY;
LowResGrid.UnitToIndex(UnitCoordinates.xy, IndexX, IndexY);
LowResGrid.SetGridValue(IndexX, IndexY, LowResAttribute, temperature, Ignore);
Áƒ*ž—ö¥€.;ÄÑ


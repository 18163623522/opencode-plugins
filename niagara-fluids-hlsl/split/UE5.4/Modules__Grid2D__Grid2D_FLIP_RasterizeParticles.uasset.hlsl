int IGNORE = 0;
int XIndexInt = round(Index.x);
int YIndexInt = round(Index.y);
Grid.SetGridValue(XIndexInt, YIndexInt, 0, Velocity.x, IGNORE);
Grid.SetGridValue(XIndexInt, YIndexInt, 1, Velocity.y, IGNORE);
int XIndexInt = floor(Index.x);
int YIndexInt = floor(Index.y);
float2 GridFraction = Index - float2(XIndexInt, YIndexInt);
for (int x = 0; x <= 1; ++x) {
const float GridWeightX = (x == 0) ? 1.0 - GridFraction.x : GridFraction.x;
  for (int y = 0; y <= 1; ++y) {
    const float GridWeightY = (y == 0) ? 1.0 - GridFraction.y : GridFraction.y;
    float Weight = 1;//GridWeightX * GridWeightY;
    Grid.SetGridValue(XIndexInt+x, YIndexInt+y, 0, Weight*Velocity.x, IGNORE);
    Grid.SetGridValue(XIndexInt+x, YIndexInt+y, 1, Weight*Velocity.y, IGNORE);


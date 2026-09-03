float Vx_right;
Grid.GetGridValue(IndexX+1, IndexY, VectorIndex, Vx_right);
float Vx_left;
Grid.GetGridValue(IndexX, IndexY, VectorIndex, Vx_left);
float Vy_up;
Grid.GetGridValue(IndexX, IndexY+1, VectorIndex+1, Vy_up);
float Vy_down;
Grid.GetGridValue(IndexX, IndexY, VectorIndex+1, Vy_down);
Div = (Vx_right - Vx_left + Vy_up - Vy_down) / dx;
Div = 0.0;
Grid.GetGridValue(IndexX-1, IndexY, VectorIndex, Vx_left);
Grid.GetGridValue(IndexX, IndexY-1, VectorIndex+1, Vy_down);
Div = (Vx_right - Vx_left + Vy_up - Vy_down) / (2. * dx);


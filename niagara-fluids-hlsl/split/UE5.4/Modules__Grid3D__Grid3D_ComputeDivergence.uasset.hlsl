float Vx_right;
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, VectorIndex, Vx_right);
float Vx_left;
Grid.GetGridValue(IndexX-1, IndexY, IndexZ, VectorIndex, Vx_left);
float Vy_up;
Grid.GetGridValue(IndexX, IndexY+1, IndexZ, VectorIndex+1, Vy_up);
float Vy_down;
Grid.GetGridValue(IndexX, IndexY-1, IndexZ, VectorIndex+1, Vy_down);
float Vz_front;
Grid.GetGridValue(IndexX, IndexY, IndexZ+1, VectorIndex+2, Vz_front);
float Vz_back;
Grid.GetGridValue(IndexX, IndexY, IndexZ-1, VectorIndex+2, Vz_back);
Div = (Vx_right - Vx_left + Vy_up - Vy_down + Vz_front - Vz_back) / (2. * dx);
Div = 0.0;


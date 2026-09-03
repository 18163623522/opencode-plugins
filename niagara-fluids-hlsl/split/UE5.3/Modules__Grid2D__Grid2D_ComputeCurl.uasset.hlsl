float Vy_right;
Grid.GetGridValue(IndexX+1, IndexY, VectorIndex+1, Vy_right);
float Vy_left;
Grid.GetGridValue(IndexX-1, IndexY, VectorIndex+1, Vy_left);
float Vx_up;
Grid.GetGridValue(IndexX, IndexY+1, VectorIndex, Vx_up);
float Vx_down;
Grid.GetGridValue(IndexX, IndexY-1, VectorIndex, Vx_down);
curl = ((Vy_right-Vy_left) - (Vx_up-Vx_down)) / (2. * dx);


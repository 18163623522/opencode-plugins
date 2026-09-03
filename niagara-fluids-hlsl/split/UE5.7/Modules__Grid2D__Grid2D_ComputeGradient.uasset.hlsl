float S_right;
Grid.GetGridValue(IndexX+1, IndexY, ScalarIndex, S_right);
float S_left;
Grid.GetGridValue(IndexX-1, IndexY, ScalarIndex, S_left);
float S_up;
Grid.GetGridValue(IndexX, IndexY+1, ScalarIndex, S_up);
float S_down;
Grid.GetGridValue(IndexX, IndexY-1, ScalarIndex, S_down);
Grad = float2(S_right - S_left, S_up - S_down) / (2.0 * dx);
Grad = float2(0.0, 0.0);
;\)4_g
Áƒ*ž—ö¥€.;ÄÑ


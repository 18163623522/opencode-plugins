ù~ôé<€;M¥
float3 V_right;
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, VectorIndex, V_right.x);
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, VectorIndex+1, V_right.y);
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, VectorIndex+2, V_right.z);
float S_right = length(V_right);
float3 V_left;
Grid.GetGridValue(IndexX-1, IndexY, IndexZ, VectorIndex, V_left.x);
Grid.GetGridValue(IndexX-1, IndexY, IndexZ, VectorIndex+1, V_left.y);
Grid.GetGridValue(IndexX-1, IndexY, IndexZ, VectorIndex+2, V_left.z);
float S_left = length(V_left);
float3 V_up;
Grid.GetGridValue(IndexX, IndexY+1, IndexZ, VectorIndex, V_up.x);
Grid.GetGridValue(IndexX, IndexY+1, IndexZ, VectorIndex+1, V_up.y);
Grid.GetGridValue(IndexX, IndexY+1, IndexZ, VectorIndex+2, V_up.z);
float S_up = length(V_up);
float3 V_down;
Grid.GetGridValue(IndexX, IndexY-1, IndexZ, VectorIndex, V_down.x);
Grid.GetGridValue(IndexX, IndexY-1, IndexZ, VectorIndex+1, V_down.y);
Grid.GetGridValue(IndexX, IndexY-1, IndexZ, VectorIndex+2, V_down.z);
float S_down = length(V_down);
float3 V_front;
Grid.GetGridValue(IndexX, IndexY, IndexZ+1, VectorIndex, V_front.x);
Grid.GetGridValue(IndexX, IndexY, IndexZ+1, VectorIndex+1, V_front.y);
Grid.GetGridValue(IndexX, IndexY, IndexZ+1, VectorIndex+2, V_front.z);
float S_front = length(V_front);
float3 V_back;
Grid.GetGridValue(IndexX, IndexY, IndexZ-1, VectorIndex, V_back.x);
Grid.GetGridValue(IndexX, IndexY, IndexZ-1, VectorIndex+1, V_back.y);
Grid.GetGridValue(IndexX, IndexY, IndexZ-1, VectorIndex+2, V_back.z);
float S_back = length(V_back);
Grad = float3(S_right - S_left, S_up - S_down, S_front - S_back) / (2.0 * dx);
Grad = float3(0.0, 0.0, 0.0);
`Á®1†Þ,H°;
€^}S†ÓI¶¶È[.r;<
€^}S†ÓI¶¶È[.r;<H
float S_right;
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, ScalarIndex, S_right);
float S_left;
Grid.GetGridValue(IndexX-1, IndexY, IndexZ, ScalarIndex, S_left);
float S_up;
Grid.GetGridValue(IndexX, IndexY+1, IndexZ, ScalarIndex, S_up);
float S_down;
Grid.GetGridValue(IndexX, IndexY-1, IndexZ, ScalarIndex, S_down);
float S_front;
Grid.GetGridValue(IndexX, IndexY, IndexZ+1, ScalarIndex, S_front);
float S_back;
Grid.GetGridValue(IndexX, IndexY, IndexZ-1, ScalarIndex, S_back);
)æ¦;O‚XC™#ˆ
°-Zë;fL¨Ê
uhe¡ÅïH–;òÿàÔýo
Áƒ*ž—ö¥€.;ÄÑ


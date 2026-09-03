float3 V_up;
float3 V_down;
float3 V_front;
float3 V_back;
float3 V_right;
float3 V_left;
Grid.GetPreviousVector3ValueAtIndex(IndexX, IndexY+1, IndexZ, VectorIndex, V_up);
Grid.GetPreviousVector3ValueAtIndex(IndexX, IndexY-1, IndexZ, VectorIndex, V_down);
Grid.GetPreviousVector3ValueAtIndex(IndexX, IndexY, IndexZ+1, VectorIndex, V_front);
Grid.GetPreviousVector3ValueAtIndex(IndexX, IndexY, IndexZ-1, VectorIndex, V_back);
Grid.GetPreviousVector3ValueAtIndex(IndexX+1, IndexY, IndexZ, VectorIndex, V_right);
Grid.GetPreviousVector3ValueAtIndex(IndexX-1, IndexY, IndexZ, VectorIndex, V_left);
) / (2. * dx);
ïi;«Iš‰g`ã
g8Z?ô;lM‹íðsm1!w
éA»;Rœ7±#
&J¬;âT
Áƒ*ž—ö¥€.;ÄÑ


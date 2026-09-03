7Ú˘Ï%ê);cõgå
øœ;ˇk´¶
VelocityOut = float3(0,0,0);
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
int CellType = round(B_center);
float B_right;
TransientGrid.GetGridValue(IndexX+1, IndexY, IndexZ, SimGrid_BoundaryIndex, B_right);
int CellType_right = round(B_right);
float B_left;
TransientGrid.GetGridValue(IndexX-1, IndexY, IndexZ, SimGrid_BoundaryIndex, B_left);
int CellType_left = round(B_left);
    VelocityOut.x = SV_x_left;
    VelocityOut.x = SV_x_right;
    VelocityOut.x = Velocity.x;
float B_up;
TransientGrid.GetGridValue(IndexX, IndexY+1, IndexZ, SimGrid_BoundaryIndex, B_up);
int CellType_up  = round(B_up);
float B_down;
TransientGrid.GetGridValue(IndexX, IndexY-1, IndexZ, SimGrid_BoundaryIndex, B_down);
int CellType_down  = round(B_down);
    VelocityOut.y = SV_y_down;
    VelocityOut.y = SV_y_up;
    VelocityOut.y = Velocity.y;
float B_front;
TransientGrid.GetGridValue(IndexX, IndexY, IndexZ+1, SimGrid_BoundaryIndex, B_front);
int CellType_front  = round(B_front);
float B_back;
TransientGrid.GetGridValue(IndexX, IndexY, IndexZ-1, SimGrid_BoundaryIndex, B_back);
int CellType_back  = round(B_back);
    VelocityOut.z = SV_z_front;
    VelocityOut.z = SV_z_back;
    VelocityOut.z = Velocity.z;
    VelocityOut.x = SV_x_center;
    VelocityOut.y = SV_y_center;
    VelocityOut.z = SV_z_center;
;rR#›¿Dô#˛
0TÁB_EµK∂ì{Ö§;4s0
0TÁB_EµK∂ì{Ö§;4s2
≠k¥∏¡ƒTJ∞'éXπ1Q∫;
SV_x_right = 0;
SV_x_left = 0;
SV_y_up = 0;
SV_y_down = 0;
SV_z_front = 0;
SV_z_back = 0;
SolidVelocityGrid.GetGridValue(IndexX+1, IndexY, IndexZ, SolidVelocityIndex, SV_x_right);
SolidVelocityGrid.GetGridValue(IndexX-1, IndexY, IndexZ, SolidVelocityIndex, SV_x_left);
SolidVelocityGrid.GetGridValue(IndexX, IndexY+1, IndexZ, SolidVelocityIndex+1, SV_y_up);
SolidVelocityGrid.GetGridValue(IndexX, IndexY-1, IndexZ, SolidVelocityIndex+1, SV_y_down);
SolidVelocityGrid.GetGridValue(IndexX, IndexY, IndexZ+1, SolidVelocityIndex+2, SV_z_front);
SolidVelocityGrid.GetGridValue(IndexX, IndexY, IndexZ-1, SolidVelocityIndex+2, SV_z_back);
:]–;}∏K¥‡
æäbGø‘AodÍ;ò1
æäbGø‘AodÍ;ò
SolidVelocityGrid.GetGridValue(IndexX, IndexY, IndexZ, SolidVelocityIndex, SV_x_center);
SolidVelocityGrid.GetGridValue(IndexX, IndexY, IndexZ, SolidVelocityIndex+1, SV_y_center);
SolidVelocityGrid.GetGridValue(IndexX, IndexY, IndexZ, SolidVelocityIndex+2, SV_z_center);
æäbGø‘AodÍ;ò3
float B_center;
TransientGrid.GetGridValue(IndexX, IndexY, IndexZ, SimGrid_BoundaryIndex, B_center);
0TÁB_EµK∂ì{Ö§;4s4
æäbGø‘AodÍ;ò5
VelocityOut = Velocity;
float4 B_center;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY, IndexZ, B_center);
int CellType = round(B_center.w);
float4 B_right;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX+1, IndexY, IndexZ, B_right);
int CellType_right = round(B_right.w);
float4 B_left;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX-1, IndexY, IndexZ, B_left);
int CellType_left = round(B_left.w);
    VelocityOut.x = B_left.x;
    VelocityOut.x = B_right.x;
float4 B_up;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY+1, IndexZ, B_up);
int CellType_up  = round(B_up.w);
float4 B_down;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY-1, IndexZ, B_down);
int CellType_down  = round(B_down.w);
    VelocityOut.y = B_down.y;
    VelocityOut.y = B_up.y;
float4 B_front;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY, IndexZ+1, B_front);
int CellType_front  = round(B_front.w);
float4 B_back;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY, IndexZ-1, B_back);
int CellType_back  = round(B_back.w);
    VelocityOut.z = B_front.z;
    VelocityOut.z = B_back.z;
    VelocityOut = B_center.xyz;
const int FLUID_CELL = 0;
const int SOLID_CELL = 1;
const int EMPTY_CELL = 2;
float3 TmpFraction;
Grid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX, IndexY, IndexZ, TmpFraction);
F_right = TmpFraction.x;
F_up = TmpFraction.y;
F_front = TmpFraction.z;
Grid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX-1, IndexY, IndexZ, TmpFraction);
F_left = TmpFraction.x;
Grid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX, IndexY-1, IndexZ, TmpFraction);
F_down = TmpFraction.y;
Grid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX, IndexY, IndexZ - 1, TmpFraction);
F_back = TmpFraction.z;
F_right = (int) round(B_right.w) == SOLID_CELL ? 1 : F_right;
F_left = (int) round(B_left.w) == SOLID_CELL ? 1 : F_left;
F_up = (int) round(B_up.w) == SOLID_CELL ? 1 : F_up;
F_down = (int) round(B_down.w) == SOLID_CELL ? 1 : F_down;
F_front = (int) round(B_front.w) == SOLID_CELL ? 1 : F_front;
F_back = (int) round(B_back.w) == SOLID_CELL ? 1 : F_back;
èMq;∏7
int CellType_right = (int) round(B_right.w);
int CellType_left = (int) round(B_left.w);
VelocityOut.x = lerp(VelocityOut.x, B_left.x, F_left);
VelocityOut.x = lerp(VelocityOut.x, B_right.x, F_right);
int CellType_up  = (int) round(B_up.w);
int CellType_down  = (int) round(B_down.w);
VelocityOut.y = lerp(VelocityOut.y, B_down.y, F_down);
VelocityOut.y = lerp(VelocityOut.y, B_up.y, F_up);
int CellType_front  = (int) round(B_front.w);
int CellType_back  = (int) round(B_back.w);
VelocityOut.z = lerp(VelocityOut.z, B_front.z, F_front);
VelocityOut.z = lerp(VelocityOut.z, B_back.z, F_back);
F_right = (int) round(B_right.w) == SOLID_CELL ? 1 : 0;
F_left = (int) round(B_left.w) == SOLID_CELL ? 1 : 0;
F_up = (int) round(B_up.w) == SOLID_CELL ? 1 : 0;
F_down = (int) round(B_down.w) == SOLID_CELL ? 1 : 0;
F_front = (int) round(B_front.w) == SOLID_CELL ? 1 : 0;
F_back = (int) round(B_back.w) == SOLID_CELL ? 1 : 0;
 C’ √T¡BÅ
Gñ< §¢7èé;
'ö`X—;
 Aø}œ
_IKv`KÆ;/Ó˜¸Õ`‡
o/Gã!ﬁ˝I∫≤;
√’Dö˙;8m@%
*e{î[eà®¬LáW$˚Ç¿ ‰;’÷‹6ù=Fá ;,ß-ù˛
ê~n©®;
äËh<˚xn@™„Å¿mÏ˘;›
Vû>;?ÂbMè@√G˘u_X
ÒFºgáo;)aõh
ÒFºgáo;)aõ<
0TÁB_EµK∂ì{Ö§;4s
rˆ“Á÷;
ÒFºgáo;)aõi
Vû>;?ÂbMè@√G˘u_Xi
ÒFºgáo;)aõj
Vû>;?ÂbMè@√G˘u_Xj
ˇ†LœZ;Ár
;·¿5ì€
¡É*ûóˆ•Ä.;ƒ—


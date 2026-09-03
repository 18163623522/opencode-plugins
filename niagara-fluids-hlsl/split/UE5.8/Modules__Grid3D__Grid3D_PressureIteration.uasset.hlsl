VfKåñNìUªÍÖ˘;º
LK;Hìr§˜¿˚
1W$;`lg
Pressure = 0;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
int CellType = round(B_center);
float Scale = dx / dt;
int FluidCellCount = 6;
float BoundaryAdd = 0.0;
float Weight;
    // same as regular jacobi
    Weight = 1;
    int SliceParity = (IndexZ + IterationIndex) % 2;
    int RowParity = (IndexY + SliceParity+1) % 2;
    int CellParity = (IndexX + RowParity ) % 2;
    // will do red-black SOR
    // add 1 since we want to expose a 0-1 parameter
    Weight = CellParity * min(1.93, Relaxation + 1);
int CellType_right = round(B_right);
    FluidCellCount--;
    BoundaryAdd += Scale * (Velocity.x - SV_x_right);
    P_right = 0;
   P_right = 0;
int CellType_left = round(B_left);
    BoundaryAdd -= Scale * (Velocity.x - SV_x_left);
    P_left = 0;
   P_left = 0;
int CellType_up = round(B_up);
    BoundaryAdd += Scale * (Velocity.y - SV_y_up);
    P_up = 0;
   P_up = 0;
int CellType_down = round(B_down);
    BoundaryAdd -=Scale *  (Velocity.y - SV_y_down);
    P_down = 0;
   P_down = 0;
int CellType_front = round(B_front);
    BoundaryAdd += Scale * (Velocity.z - SV_z_front);
    P_front = 0;
   P_front = 0;
int CellType_back = round(B_back);
    BoundaryAdd -= Scale * (Velocity.z - SV_z_back);
    P_back = 0;
   P_back = 0;
    float JacobiPressure = (P_right + P_left + P_up + P_down + P_front + P_back -  dx * dx * Divergence / dt + BoundaryAdd) / FluidCellCount;
    Pressure = (1.f - Weight) * P_center + Weight * JacobiPressure;
¸>∆%@¥;◊—
P_right = 0;
P_left = 0;
P_up = 0;
P_down = 0;
P_front = 0;
P_back = 0;
PressureGrid.GetGridValue(IndexX+1, IndexY, IndexZ, PressureIndex, P_right);
PressureGrid.GetGridValue(IndexX-1, IndexY, IndexZ, PressureIndex, P_left);
PressureGrid.GetGridValue(IndexX, IndexY+1, IndexZ, PressureIndex, P_up);
PressureGrid.GetGridValue(IndexX, IndexY-1, IndexZ, PressureIndex, P_down);
PressureGrid.GetGridValue(IndexX, IndexY, IndexZ+1, PressureIndex, P_front);
PressureGrid.GetGridValue(IndexX, IndexY, IndexZ-1, PressureIndex, P_back);
SV_x_right = 0;
SV_x_left = 0;
SV_y_up = 0;
SV_y_down = 0;
SV_z_front = 0;
SV_z_back = 0;
PressureGrid.GetGridValue(IndexX+1, IndexY, IndexZ, SolidVelocityIndex, SV_x_right);
PressureGrid.GetGridValue(IndexX-1, IndexY, IndexZ, SolidVelocityIndex, SV_x_left);
PressureGrid.GetGridValue(IndexX, IndexY+1, IndexZ, SolidVelocityIndex+1, SV_y_up);
PressureGrid.GetGridValue(IndexX, IndexY-1, IndexZ, SolidVelocityIndex+1, SV_y_down);
PressureGrid.GetGridValue(IndexX, IndexY, IndexZ+1, SolidVelocityIndex+2, SV_z_front);
PressureGrid.GetGridValue(IndexX, IndexY, IndexZ-1, SolidVelocityIndex+2, SV_z_back);
B_right = 0;
B_left = 0;
B_up = 0;
B_down = 0;
B_front = 0;
B_back = 0;
PressureGrid.GetGridValue(IndexX+1, IndexY, IndexZ, BoundaryIndex, B_right);
PressureGrid.GetGridValue(IndexX-1, IndexY, IndexZ, BoundaryIndex, B_left);
PressureGrid.GetGridValue(IndexX, IndexY+1, IndexZ, BoundaryIndex, B_up);
PressureGrid.GetGridValue(IndexX, IndexY-1, IndexZ, BoundaryIndex, B_down);
PressureGrid.GetGridValue(IndexX, IndexY, IndexZ+1, BoundaryIndex, B_front);
PressureGrid.GetGridValue(IndexX, IndexY, IndexZ-1, BoundaryIndex, B_back);
1;W¢≠& L≥g(Â
P_center = 0;
P_center = Pressure;
B_center = 0;
PressureGrid.GetGridValue(IndexX, IndexY, IndexZ, BoundaryIndex, B_center);
float4 B_center;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY, IndexZ, B_center);
int CellType = round(B_center.w);
float P_right;
float P_left;
float P_up;
float P_down;
float P_front;
float P_back;
PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(IndexX+1, IndexY, IndexZ, P_right);
PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(IndexX-1, IndexY, IndexZ, P_left);
PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(IndexX, IndexY+1, IndexZ, P_up);
PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(IndexX, IndexY-1, IndexZ, P_down);
PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(IndexX, IndexY, IndexZ+1, P_front);
PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(IndexX, IndexY, IndexZ-1, P_back);
float4 B_right;
float4 B_left;
float4 B_up;
float4 B_down;
float4 B_front;
float4 B_back;
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX+1, IndexY, IndexZ, B_right);
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX-1, IndexY, IndexZ, B_left);
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY+1, IndexZ, B_up);
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY-1, IndexZ, B_down);
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY, IndexZ+1, B_front);
BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(IndexX, IndexY, IndexZ-1, B_back);
int CellType_right = round(B_right.w);
    BoundaryAdd += Scale * (Velocity.x - B_right.x);
int CellType_left = round(B_left.w);
    BoundaryAdd -= Scale * (Velocity.x - B_left.x);
int CellType_up = round(B_up.w);
    BoundaryAdd += Scale * (Velocity.y - B_up.y);
int CellType_down = round(B_down.w);
    BoundaryAdd -=Scale *  (Velocity.y - B_down.y);
int CellType_front = round(B_front.w);
    BoundaryAdd += Scale * (Velocity.z - B_front.z);
int CellType_back = round(B_back.w);
    BoundaryAdd -= Scale * (Velocity.z - B_back.z);
·!ë‹x+îFø;Ÿ
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
F_right = round(B_right.w) == SOLID_CELL ? 1 : F_right;
F_left = round(B_left.w) == SOLID_CELL ? 1 : F_left;
F_up = round(B_up.w) == SOLID_CELL ? 1 : F_up;
F_down = round(B_down.w) == SOLID_CELL ? 1 : F_down;
F_front = round(B_front.w) == SOLID_CELL ? 1 : F_front;
F_back = round(B_back.w) == SOLID_CELL ? 1 : F_back;
d&ÕK£‰ï;
nÉAúËù;¸@ãI^
nÉAúËù;¸@ãI
float FluidCellCount = 6.0;
    FluidCellCount -= lerp(0, 1, F_right);
    BoundaryAdd += lerp(0, Scale * (Velocity.x - B_right.x), F_right);
    P_right = lerp(P_right, 0, F_right);
    FluidCellCount -= lerp(0, 1, F_left);
    BoundaryAdd -= lerp(0, Scale * (Velocity.x - B_left.x), F_left);
    P_left = lerp(P_left, 0, F_left);
    FluidCellCount -= lerp(0, 1, F_up);
    BoundaryAdd += lerp(0, Scale * (Velocity.y - B_up.y), F_up);
    P_up = lerp(P_up, 0, F_up);
    FluidCellCount -= lerp(0, 1, F_down);
    BoundaryAdd -= lerp(0, Scale * (Velocity.y - B_down.y), F_down);
    P_down = lerp(P_down, 0, F_down);
    FluidCellCount -= lerp(0, 1, F_front);
    BoundaryAdd += lerp(0, Scale * (Velocity.z - B_front.z), F_front);
    P_front = lerp(P_front, 0, F_front);
    FluidCellCount -= lerp(0, 1, F_back);
    BoundaryAdd -= lerp(0, Scale * (Velocity.z - B_back.z), F_back);
    P_back = lerp(P_back, 0, F_back);
F_right = round(B_right.w) == SOLID_CELL ? 1 : 0;
F_left = round(B_left.w) == SOLID_CELL ? 1 : 0;
F_up = round(B_up.w) == SOLID_CELL ? 1 : 0;
F_down = round(B_down.w) == SOLID_CELL ? 1 : 0;
F_front = round(B_front.w) == SOLID_CELL ? 1 : 0;
F_back = round(B_back.w) == SOLID_CELL ? 1 : 0;
 C’ √T¡BÅ
X = 0;
Y = 0;
Z = 0;
X = GDispatchThreadId.x;
Y = GDispatchThreadId.y;
Z = GDispatchThreadId.z;
int IsBlack = IterationIndex % 2;
X = GDispatchThreadId.x * 2 + ((GDispatchThreadId.y + GDispatchThreadId.z + IsBlack) % 2);
int CellType = (int) round(B_center.w);
float F_right;
float F_left;
float F_up;
float F_down;
float F_front;
float F_back;
FractionGrid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX, IndexY, IndexZ, TmpFraction);
FractionGrid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX-1, IndexY, IndexZ, TmpFraction);
FractionGrid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX, IndexY-1, IndexZ, TmpFraction);
FractionGrid.GetPreviousVectorValue<Attribute="FaceFraction">(IndexX, IndexY, IndexZ - 1, TmpFraction);
F_right = (int) round(B_right.w) == SOLID_CELL ? 1 : F_right;
F_left =  (int) round(B_left.w) == SOLID_CELL ? 1 : F_left;
F_up =    (int) round(B_up.w) == SOLID_CELL ? 1 : F_up;
F_down =  (int) round(B_down.w) == SOLID_CELL ? 1 : F_down;
F_front = (int) round(B_front.w) == SOLID_CELL ? 1 : F_front;
F_back =  (int) round(B_back.w) == SOLID_CELL ? 1 : F_back;
F_right = (int) round(B_right.w) == SOLID_CELL ? 1 : 0;
F_left =  (int) round(B_left.w) == SOLID_CELL ? 1 : 0;
F_up =    (int) round(B_up.w) == SOLID_CELL ? 1 : 0;
F_down =  (int) round(B_down.w) == SOLID_CELL ? 1 : 0;
F_front = (int) round(B_front.w) == SOLID_CELL ? 1 : 0;
F_back =  (int) round(B_back.w) == SOLID_CELL ? 1 : 0;
float Divergence;
TemporaryGrid.GetPreviousFloatValue<Attribute="SimFloat">(IndexX, IndexY, IndexZ, Divergence);
float3 Velocity;
SimGrid.GetPreviousVectorValue<Attribute="Velocity">(IndexX, IndexY, IndexZ, Velocity);
float P_center;
PressureGrid.GetOutputGridFloatValue<Attribute="Pressure">(IndexX, IndexY, IndexZ, P_center);
PressureGrid.GetOutputGridFloatValue<Attribute="Pressure">(IndexX+1, IndexY, IndexZ, P_right);
PressureGrid.GetOutputGridFloatValue<Attribute="Pressure">(IndexX-1, IndexY, IndexZ, P_left);
PressureGrid.GetOutputGridFloatValue<Attribute="Pressure">(IndexX, IndexY+1, IndexZ, P_up);
PressureGrid.GetOutputGridFloatValue<Attribute="Pressure">(IndexX, IndexY-1, IndexZ, P_down);
PressureGrid.GetOutputGridFloatValue<Attribute="Pressure">(IndexX, IndexY, IndexZ+1, P_front);
PressureGrid.GetOutputGridFloatValue<Attribute="Pressure">(IndexX, IndexY, IndexZ-1, P_back);
float Weight = clamp(saturate(Relaxation) + 1, 0, 1.99999);
int CellType_right = (int) round(B_right.w);
int CellType_left = (int) round(B_left.w);
int CellType_up = (int) round(B_up.w);
int CellType_down = (int) round(B_down.w);
int CellType_front = (int) round(B_front.w);
int CellType_back = (int) round(B_back.w);
PressureGrid.SetFloatValue<Attribute="Pressure">(IndexX, IndexY, IndexZ, Pressure);
ßÒÑ+ÊFù;
Eß3‡*;
‰;‘ÏTrlJà‰
;—c@’/Ò
õWª˝Œ‰›a7&Bí"¶õÊrêZ°Û;≠
 sÑ∑at„_AôL8Dí
@Æ˘˛¶§B;bﬁÁÎ“
f~´Oç;ú/Ü•%=Ç
f~´Oç;ú/Ü•%=˙
@Æ˘˛¶§B;b
I∂Œ;‹Î≤
I∂Œ;‹Î≤Ôè˙
f~´Oç;ú/Ü•%=Ñ
f~´Oç;ú/Ü•%=Ü
f~´Oç;ú/Ü•%=á
f~´Oç;ú/Ü•%=â
ÏdO¢‘V;œwW3ã
ÏdO¢‘V;œwW3˙
f~´Oç;ú/Ü•%=å
∏^Ø`5(wM£!Ñ+S;dˇ5
∏^Ø`5(wM£!Ñ+S;dˇ
ˇ†LœZ;Ár
ˇÚEì;Ú"∑
K’‘„"@ï¯◊«;:O‡˙
¡É*ûóˆ•Ä.;ƒ—


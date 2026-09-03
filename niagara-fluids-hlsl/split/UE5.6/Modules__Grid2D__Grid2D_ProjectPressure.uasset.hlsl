&;µğ?pn?
êÕBó&3·B“ª„x\;´ğ€
VelocityOut = float2(0,0);
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
int CellType = round(B_center);
float B_right;
PressureGrid.GetFloatValue<Attribute=Boundary>(IndexX+1, IndexY, B_right);
int CellType_right = round(B_right);
float B_left;
PressureGrid.GetFloatValue<Attribute=Boundary>(IndexX-1, IndexY, B_left);
int CellType_left = round(B_left);
    VelocityOut.x = SV_x_left;
    VelocityOut.x = SV_x_right;
    VelocityOut.x = Velocity.x;
float B_up;
PressureGrid.GetFloatValue<Attribute=Boundary>(IndexX, IndexY+1, B_up);
int CellType_up  = round(B_up);
float B_down;
PressureGrid.GetFloatValue<Attribute=Boundary>(IndexX, IndexY-1, B_down);
int CellType_down  = round(B_down);
    VelocityOut.y = SV_y_down;
    VelocityOut.y = SV_y_up;
    VelocityOut.y = Velocity.y;
    VelocityOut.x = SV_x_center;
    VelocityOut.y = SV_y_center;
;rR#İÀD™#ş
0TçB_EµK¶“{…¤;4s
0TçB_EµK¶“{…¤;4sÂ
nØ;À/Õ
SV_x_right = 0;
SV_x_left = 0;
SV_y_up = 0;
SV_y_down = 0;
PressureGrid.GetGridValue(IndexX+1, IndexY, SolidVelocityIndex, SV_x_right);
PressureGrid.GetGridValue(IndexX-1, IndexY, SolidVelocityIndex, SV_x_left);
PressureGrid.GetGridValue(IndexX, IndexY+1, SolidVelocityIndex+1, SV_y_up);
PressureGrid.GetGridValue(IndexX, IndexY-1, SolidVelocityIndex+1, SV_y_down);
:]Ğ;}¸K´à
 A¿}Ïğ
ú¾Ó;¤{éB¬´
_IKv`K®;/î÷üÍ`€
}WÖ(Cˆe;bHuù¨
}WÖ(Cˆe;bHuù¨€
ÃÕDšú;8m@%
*e{”[eˆ¨ÂL‡W$û‚À ä;ÕÖÜ6=F‡ ;,§-ş
;ÕÖÜ6=F‡ ;,§-ş
ŒZo…KˆŠ;Xü"Œ¨€
Áƒ*—ö¥€.;ÄÑ


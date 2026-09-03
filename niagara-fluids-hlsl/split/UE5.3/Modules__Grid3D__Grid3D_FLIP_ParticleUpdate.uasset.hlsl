IsInside = round(Mask) ==2;
  UnitPos.z >= 0 && UnitPos.x <= 1 && 
UnitPos.y <= 1 && UnitPos.z <= 1;
IsInside = Mask > 1e-7;
IsInside = round(Mask) == 1;


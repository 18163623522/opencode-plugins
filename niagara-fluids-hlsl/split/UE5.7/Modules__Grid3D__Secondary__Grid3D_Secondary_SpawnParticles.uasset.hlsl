öÎm¹¿;.å1D
IsAlive = true;
World = float3(0,0,0);
Velocity = float3(0,0,0);
int2 NumCells;
EmissionPositions.GetNumCells(NumCells.x, NumCells.y);
  float3 Unit = float3(0,0,0);
  int xx = Index % NumCells.x;
  int yy = Index / NumCells.x;
  EmissionPositions.GetGridValue(xx, yy, 0, Unit.x);
  EmissionPositions.GetGridValue(xx, yy, 1, Unit.y);
  EmissionPositions.GetGridValue(xx, yy, 2, Unit.z);
  SimGridReader.SamplePreviousGridVector3Value<Attribute = "Velocity">(Unit, Velocity);
//SimGridReader.SampleGrid(Unit.x, Unit.y, Unit.z, 0, Velocity.x);
//SimGridReader.SampleGrid(Unit.x, Unit.y, Unit.z, 1, Velocity.y);
//SimGridReader.SampleGrid(Unit.x, Unit.y, Unit.z, 2, Velocity.z);
  World = mul(float4(Unit, 1), UnitToWorld).xyz;
  IsAlive = true;
  IsAlive = false;
  Color = float4(1,0,0,1);
  Color = float4(0,1,0,1);
Color = float4(1,0,0,1);
;²;×S]
¾ z;|M‘¹y#5Ï
QMİ'76{F”F;´&
Ğg´õ¿;
D’~Dš³;L´¹z
«¤¥³êºSG ;j×4Ş$
«¤¥³êºSG ;j×4Ş$º
V9<C•>x¨ªe;}«
!Vqvš;CF ³ÔÍ?ã7²
!Vqvš;CF ³ÔÍ?ã7²•
&|;@æˆ
’¡(Ê~–;
;(İJÍNœë¤
bïÇÙz—ÉI¤T¥•;
Áƒ*—ö¥€.;ÄÑ


QJ|ƒa¬Î;5Ù
;M€úmóã
IsAlive = true;
World = float3(0,0,0);
Velocity = float3(0,0,0);
  float3 Unit = float3(0,0,0);
  EmissionPositions.GetGridValue(Index, 0, 0, Unit.x);
  EmissionPositions.GetGridValue(Index, 0, 1, Unit.y);
  float2 TmpVelocity;
  GridCollection.SamplePreviousGridVector2DValue<Attribute = "Velocity">(Unit, TmpVelocity);
  Velocity.xy = TmpVelocity;
  float Height;
  GridCollection.SamplePreviousGridFloatValue<Attribute = "WaterHeight">(Unit, Height);
  float OldHeight;
  GridCollection.SamplePreviousGridFloatValue<Attribute = "PrevWaterHeight">(Unit, OldHeight);
  Velocity.z = VerticalVelocityMult * (Height - OldHeight) / SimDt;
  GridCollection.UnitToSimulation(Unit, UnitToSimulation, World);  
  World.z = Height + LocalToSimulationTranslation.z;
  IsAlive = true;
  IsAlive = false;
  Color = float4(1,0,0,1);
  Color = float4(0,1,0,1);
;GöòÿJ®NUÖH(V
  VelocityReader.SamplePreviousGridVector2DValue<Attribute = "Velocity">(Unit, TmpVelocity);
  WaterReader.SamplePreviousGridFloatValue<Attribute = "WaterHeight">(Unit, Height);
  float OldHeight = Height;
//  WaterReader.SamplePreviousGridFloatValue<Attribute = "PrevWaterHeight">(Unit, OldHeight);
  World = mul(float4(Unit, 1.0), UnitToWorld).xyz;
  World.z = Height + LocalToWorldTranslation.z;
  Velocity.xy = TmpVelocity * FluidVelocityMagnitude;
  float3 TmpNormal;
  NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(Unit, TmpNormal);
  Velocity += NormalVelocityMagnitude * TmpNormal;
  Velocity += RandomVelocityMagnitude * RandomVelocity;
  Velocity *= VelocityMult;
  int EmitIndexX, EmitIndexY;
  EmissionPositions.LinearToIndex(Index, EmitIndexX, EmitIndexY);
  EmissionPositions.GetGridValue(EmitIndexX, EmitIndexY, 0, Unit.x);
  EmissionPositions.GetGridValue(EmitIndexX, EmitIndexY, 1, Unit.y);
  // Project velocity onto water surface
  Velocity = Velocity - dot(Velocity, TmpNormal) * TmpNormal;
  Velocity *= FluidVelocityMagnitude;
  EmissionPositions.LinearToIndex(RandIndex, EmitIndexX, EmitIndexY);
  if (SampleFromGrid)
      VelocityReader.SamplePreviousGridVector2DValue<Attribute = "Velocity">(Unit, TmpVelocity);
      WaterReader.SamplePreviousGridFloatValue<Attribute = "WaterHeight">(Unit, Height);  
  else
      float4 BakedSimSample;
      BakedSimGrid.SampleTexture2D(Unit, 0, BakedSimSample);
      TmpVelocity = float2(BakedSimSample.z, BakedSimSample.w);
      Height = BakedSimSample.x;
 v_ó„6ÚDe;
      VelocityReader.SamplePreviousGridVector2DValue<Attribute = "Velocity">(Unit.xy, TmpVelocity);
      WaterReader.SamplePreviousGridFloatValue<Attribute = "WaterHeight">(Unit.xy, Height);  
      BakedSimGrid.SampleTexture2D(Unit.xy, 0, BakedSimSample);
  NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(Unit.xy, TmpNormal);
}Lá‚E‚êÖ8g;¬÷§
}Lá‚E‚êÖ8g;¬÷’
}Lá‚E‚êÖ8g;¬÷¬
}Lá‚E‚êÖ8g;¬÷±
}Lá‚E‚êÖ8g;¬÷¶
}Lá‚E‚êÖ8g;¬÷»
}Lá‚E‚êÖ8g;¬÷À
}Lá‚E‚êÖ8g;¬÷Ä
Q7©;C­>¾G‚™
;GöòÿJ®NUÖH(VÆ
;GöòÿJ®NUÖH(V
;GöòÿJ®NUÖH(VÇ
;GöòÿJ®NUÖH(VÈ
;GöòÿJ®NUÖH(VÉ
;GöòÿJ®NUÖH(VÊ
;GöòÿJ®NUÖH(VË
;GöòÿJ®NUÖH(VÌ
;¾Fkì•AD‘2¹/U)påÕ
¾ z;|M‘¹y#5Ï
QMİ'76{F”F;´&
Ğg´õ¿;
D’~Dš³;L´¹z
«¤¥³êºSG ;j×4Ş$Û
«¤¥³êºSG ;j×4Ş$
}Lá‚E‚êÖ8g;¬÷
«¤¥³êºSG ;j×4Ş$ç
¶ÅK¹©KÑ;¿
«¤¥³êºSG ;j×4Ş$ï
«¤¥³êºSG ;j×4Ş$ö
«¤¥³êºSG ;j×4Ş$ı
V9<C•>x¨ªe;}«
V9<C•>x¨ªe;}
!Vqvš;CF ³ÔÍ?ã7²
!Vqvš;CF ³ÔÍ?ã7²Ù
&|;@æˆ
!Vqvš;CF ³ÔÍ?ã7² 
OM˜;V¿K
i%²I;N·ë!Îîëo
ÇG‡ªÏ5–´;²$
ÇG‡ªÏ5–´;²Ù
CŸM¼;²Å
!Vqvš;CF ³ÔÍ?ã7²%
ÇG‡ªÏ5–´;²)
!Vqvš;CF ³ÔÍ?ã7²*
ÇG‡ªÏ5–´;².
!Vqvš;CF ³ÔÍ?ã7²/
ÇG‡ªÏ5–´;²3
!Vqvš;CF ³ÔÍ?ã7²4
ÇG‡ªÏ5–´;²8
ÛçBºrj½³÷›;
DE€ıõ‚†üÕ;
!Vqvš;CF ³ÔÍ?ã7²;
D“]ÄÏû4œ;
3_7ÉğL¿“ş–rZW–;
¶+?ïG—<†£Æx Î;
8øB¹¯Ã6&{8Ÿ;
!Vqvš;CF ³ÔÍ?ã7²B
×J·;¼†
i%²I;N·ë!ÎîëoN
i%²I;N·ë!Îîëoê
i%²I;N·ë!ÎîëoQ
i%²I;N·ë!ÎîëoT
i%²I;N·ë!ÎîëoW
i%²I;N·ë!ÎîëoZ
7¯—O„gN–pæ,¶Í;¹Õ
i%²I;N·ë!Îîëo]
€¢Và;«å-·Ù
bïÇÙz—ÉI¤T¥•;
Áƒ*—ö¥€.;ÄÑ


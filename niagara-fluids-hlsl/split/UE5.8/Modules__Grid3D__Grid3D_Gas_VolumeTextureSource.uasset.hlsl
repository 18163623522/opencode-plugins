DensityOut = DensityIn;
TemperatureOut = TemperatureIn;
VelocityOut = VelocityIn;
if( ! Enable ) return;
bool valid;
float3 offset = 0.5 - Pivot;
float3 absOffset = abs(offset);
for (int i = 0; i < NumParticles; ++i)
float3 ParticlePos;
ParticleReader.GetVectorByIndex<Attribute = "Position">(i, valid, ParticlePos);
    float3 scale;
    ParticleReader.GetVectorByIndex<Attribute = "Scale">(i, valid, scale);
    float3 halfScale = scale * 0.5 * (absOffset + 1.0);
    float ParticleRadius = sqrt(dot(halfScale, halfScale));
    float Dist = length(CellPosScalarGrid - ParticlePos);
    if(Dist <= ParticleRadius)
        // Move to the origin taking the offset into account
        float3 uvw = CellPosScalarGrid - (ParticlePos + scale * offset);
         // Apply rotation (invert quat to compensate for texture space)
        float4 Q;
        ParticleReader.GetQuaternionByIndex<Attribute = "MeshOrientation">(i, valid, Q);
        uvw += offset * scale;
        float3 T = 2.f * float3(Q.y * uvw.z - Q.z * uvw.y, Q.z * uvw.x - Q.x * uvw.z, Q.x * uvw.y - Q.y * uvw.x);
    uvw += (Q.w * -1.0 * T) + float3(Q.y * T.z - Q.z * T.y, Q.z * T.x - Q.x * T.z, Q.x * T.y - Q.y * T.x);
        uvw -= offset * scale;
       // Scale to unit volume texture uvw
        uvw /= scale;
        // Move to 0-1 space
    uvw += 0.5;
        //uvw = saturate(uvw);
        if(uvw.x >= 0.0 && uvw.x <= 1.0 && uvw.y >= 0.0 && uvw.y <= 1.0 && uvw.z >= 0.0 && uvw.z <= 1.0)
            float DensityScalePP;
            ParticleReader.GetFloatByIndex<Attribute = "fluids_source_density">(i, valid, DensityScalePP);
            if( !valid ) DensityScalePP = 1.0;
            float TempScalePP;
            ParticleReader.GetFloatByIndex<Attribute = "fluids_source_temperature">(i, valid, TempScalePP);
            if( !valid ) TempScalePP = 1.0;
            float Density = 0;
            float Temperature = 0;
            VolumeTextureGrid.SamplePreviousGridFloatValue<Attribute="Density">(uvw, Density);
            VolumeTextureGrid.SamplePreviousGridFloatValue<Attribute="Temperature">(uvw, Temperature);
            Density *= DensityScalePP * DensityScale;
            Temperature *= TempScalePP * TemperatureScale;
            if (CompositingMethod == 0)
                DensityOut += Density;
                TemperatureOut += Temperature;
           else if (CompositingMethod == 1)
                DensityOut = max(Density, DensityOut);
                TemperatureOut = max(Temperature, TemperatureOut);
    if (VelocityCurrCell < VelocityNumCells)
    float DistVelocity = length(CellPosVelocityGrid - ParticlePos);
        if(DistVelocity <= ParticleRadius)
            // Move to the origin taking the offset into account
            float3 uvw = CellPosVelocityGrid - (ParticlePos + scale * offset);
             // Apply rotation (invert quat to compensate for texture space)
            float4 Q;
            ParticleReader.GetQuaternionByIndex<Attribute = "MeshOrientation">(i, valid, Q);
            uvw += offset * scale;
            float3 T = 2.f * float3(Q.y * uvw.z - Q.z * uvw.y, Q.z * uvw.x - Q.x * uvw.z, Q.x * uvw.y - Q.y * uvw.x);
        uvw += (Q.w * -1.0 * T) + float3(Q.y * T.z - Q.z * T.y, Q.z * T.x - Q.x * T.z, Q.x * T.y - Q.y * T.x);
            uvw -= offset * scale;
            // Scale to unit volume texture uvw
            uvw /= scale;
            // Move to 0-1 space
        uvw += 0.5;
            //uvw = saturate(uvw);
            if(uvw.x >= 0.0 && uvw.x <= 1.0 && uvw.y >= 0.0 && uvw.y <= 1.0 && uvw.z >= 0.0 && uvw.z <= 1.0)
                float VelScalePP;
                ParticleReader.GetFloatByIndex<Attribute = "fluids_source_velocityScale">(i, valid, VelScalePP);
                if( !valid ) VelScalePP = 1.0;
                if( VelocityScale > 0.0 )
                    float3 vel;
                    VolumeTextureGrid.SamplePreviousGridVector3Value<Attribute="Velocity">(uvw, vel);
                    vel *= VelScalePP * VelocityScale;
                    T = 2.f * float3(Q.y * vel.z - Q.z * vel.y, Q.z * vel.x - Q.x * vel.z, Q.x * vel.y - Q.y * vel.x);
                vel += (Q.w * T) + float3(Q.y * T.z - Q.z * T.y, Q.z * T.x - Q.x * T.z, Q.x * T.y - Q.y * T.x);
                    if (CompositingMethod == 0)
                        VelocityOut += vel;
                   else if (CompositingMethod == 1)
                        if( length2(vel) > length2(VelocityOut) ) VelocityOut = vel;
ÜJÿq;¼,@˜C¡9
ŸòssÌ;mA©øœÛå¸x¿
ŸòssÌ;mA©øœÛå¸x¿1
Œì []†šD…,h;¢ž]
Œì []†šD…,h;¢ž]Ä
I´ú6B;
O-¡X4†Gœh;
øi;nfü L‘PÏ0H‚­v…
6š5©>?@²;º¼ø¶
cx‚“í]Bª;Q|5™(ì
cx‚“í]Bª;Q|5™(ì/
8E³6;øÎì"«ˆ
Š;ŒA?MÖJ’õ
Áƒ*ž—ö¥€.;ÄÑ


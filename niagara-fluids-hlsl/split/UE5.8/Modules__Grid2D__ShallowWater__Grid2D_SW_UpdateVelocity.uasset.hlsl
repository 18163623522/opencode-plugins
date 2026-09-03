ƒ¬gog;
»VE¥ü¿óùÙù¨;
float2 Velocity = float2(Input_VelocityX, Input_VelocityY);
float Scale = DtOverDx * Gravity;
float LeftDepth;
float LeftHeight;
float2 LeftCollisionVelocity;
float LeftCollisionVelocityX;
float LeftCollisionMask;
float LeftBottomContour;
GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX - 1, IndexY, LeftDepth);
GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX - 1, IndexY, LeftHeight);
GridCollection.GetPreviousVector2DValue<Attribute = "CollisionVelocity">(IndexX - 1, IndexY, LeftCollisionVelocity);
LeftCollisionVelocityX = LeftCollisionVelocity.x;
GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(IndexX - 1, IndexY, LeftCollisionMask);
GridCollection.GetPreviousFloatValue<Attribute = "BottomContour">(IndexX - 1, IndexY, LeftBottomContour);
float DownDepth;
float DownHeight;
float2 DownCollisionVelocity;
float DownCollisionVelocityY;
float DownCollisionMask;
float DownBottomContour;
GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY-1, DownDepth);
GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX, IndexY-1, DownHeight);
GridCollection.GetPreviousVector2DValue<Attribute = "CollisionVelocity">(IndexX, IndexY-1, DownCollisionVelocity);
DownCollisionVelocityY = DownCollisionVelocity.y;
GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(IndexX, IndexY-1, DownCollisionMask);
GridCollection.GetPreviousFloatValue<Attribute = "BottomContour">(IndexX, IndexY-1, DownBottomContour);
float eps = 1;
        LeftCollisionVelocityX = 0;
        LeftCollisionMask = 1. - smoothstep(0, eps, LeftDepth);
        LeftCollisionMask = 1. - smoothstep(0, eps, Input_WaterDepth);
        LeftCollisionMask = 1. - smoothstep(0, eps, Input_WaterDepth * LeftDepth);
    float h_x = Input_WaterHeight;
    float h_x_left = LeftHeight;
    Velocity.x -= Scale * (h_x - h_x_left);
    Velocity.x = lerp(Velocity.x, LeftCollisionVelocityX, LeftCollisionMask);
        DownCollisionVelocityY = 0;
        DownCollisionMask = 1. - smoothstep(0, eps, DownDepth);
        DownCollisionMask = 1. - smoothstep(0, eps, Input_WaterDepth);
        DownCollisionMask = 1. - smoothstep(0, eps, Input_WaterDepth * DownDepth);
    float h_y = Input_WaterHeight;
    float h_y_down = DownHeight;
    Velocity.y -= Scale * (h_y - h_y_down);
    Velocity.y = lerp(Velocity.y, DownCollisionVelocityY, DownCollisionMask);
    Velocity = lerp(Velocity, float2(Input_CollisionVelocityX, Input_CollisionVelocityY), Input_IsCollider);
    float VelMag = length(Velocity);
    if (VelMag > eps)
       Velocity = clamp(VelMag, 0., MaxVelocityMagnitude) * Velocity / VelMag;
VelocityX = Velocity.x * VelocityDissipation;
VelocityY = Velocity.y * VelocityDissipation;
VelocityX = 0;
VelocityY = 0;
;áÊX?âLû÷!l?-‡b
Velocity = float2(Input_VelocityX, Input_VelocityY);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX - 1, IndexY, LeftDepth);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX - 1, IndexY, LeftHeight);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY-1, DownDepth);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX, IndexY-1, DownHeight);
float eps = 1e-8;
float h_x = Input_WaterHeight;
float h_x_left = LeftHeight;
Velocity.x -= Scale * (h_x - h_x_left);
Velocity.x = lerp(Velocity.x, LeftCollisionVelocityX, LeftCollisionMask);
float h_y = Input_WaterHeight;
float h_y_down = DownHeight;
Velocity.y -= Scale * (h_y - h_y_down);
Velocity.y = lerp(Velocity.y, DownCollisionVelocityY, DownCollisionMask);
Velocity = lerp(Velocity, float2(Input_CollisionVelocityX, Input_CollisionVelocityY), Input_IsCollider);
float VelMag = length(Velocity);
   Velocity = clamp(VelMag, 0., MaxVelocityMagnitude) * Velocity / VelMag;
Velocity *= VelocityDissipation;
;!øfµì
Velocity = Input_Velocity;
        LeftCollisionMask = 1;
        DownCollisionMask = 1;
// friction against the bottom.  As depth gets smaller, friction increases and slows down the fluid motion
    // compute the depth to use for friction based on samples in the upwind direction
    // by default (even if the sim doesn't use upwinding for integration
    float2 AvgDepth = Input_WaterDepth;
    if (Upwind)
        // upwinding for computing friction
        if (Velocity.x >= 0)
            AvgDepth.x = LeftDepth;
        if (Velocity.y >= 0)
            AvgDepth.y = DownDepth;  
    else
        AvgDepth = (Input_WaterDepth + float2(LeftDepth, DownDepth)) * .5f;
    // limit force due to variations in dt causing friction force larger than -velocity
    // friction term expressed in meters, so convert depth cm->m
    // https://iopscience.iop.org/article/10.1088/1742-6596/973/1/012032/pdf
    float2 FrictionForce = -Velocity * Friction * VelMag / max(eps, pow(AvgDepth / 100.f, 4./3.f));
    float FrictionMag = length(FrictionForce);
    if (FrictionMag > eps)
        FrictionForce = clamp(FrictionMag, 0, VelMag / dt) * FrictionForce / FrictionMag;
    // Integrate friction force into velocity
    Velocity += dt * FrictionForce;
// Dissipate velocity
// Clamp velocity magnitude based on max allowable velocity
VelMag = length(Velocity);
    Velocity = clamp(VelMag, 0., MaxVelocityMagnitude) * Velocity / VelMag;
ò#;5+@ïU
/;ﬁ¡ 9L§
ÑA#@°k≥ØΩ;–e£
Uˆ[B£¶z;s£ù
;áÊX?âLû÷!l?-‡b&
;áÊX?âLû÷!l?-‡b–
ÑA#@°k≥ØΩ;–e
^Ï}¬’+_HÉÀ;døLæ
HdÓï;ÑÏÅz™z±
Î¯¿;ƒÏÒGí=ÇÅct∏áß
)]ô;{l•Jõ d
¡É*ûóˆ•Ä.;ƒ—


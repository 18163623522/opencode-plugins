@@@ ActorComponent
| GetMatrix | — | — | — | — |
| GetTransform | — | — | — | — |
| GetVelocity | — | — | — | — |
@@@ ArrayDistributionInt
| GetProbabilityAlias | — | — | — | — |
| GetRandomValue | — | — | — | — |
@@@ AsyncGpuTrace
| IssueAsyncRayTraceGpu | DI AsyncGpuTrace, Int QueryID, Position TraceStartWorld, Position TraceEndWorld, ?  | Bool IsQueryValid | E,C✗ | Enqueues a GPU raytrace with the result being available the following frame |
| CreateAsyncRayTraceGpu | DI AsyncGpuTrace, Position TraceStartWorld, Position TraceEndWorld, ?  | Int QueryID, Bool IsQueryValid | E,C✗ | Creates a GPU raytrace with the result being available the following frame (index is returned) |
| ReserveAsyncRayTraceGpu | DI AsyncGpuTrace, Int TraceCount | Int FirstQueryID, Bool IsQueryValid | E,C✗ | Reserves a number of ray trace request slots |
| ReadAsyncRayTraceGpu | DI AsyncGpuTrace, Int PreviousFrameQueryID | Bool CollisionValid, Float CollisionDistance, Position CollisionPosWorld, Vec3 CollisionNormal | ,C✗ | Reads the results of a previously enqueued GPU ray trace |
@@@ ConsoleVariable
| GetConsoleVariableFloat | — | — | — | — |
| GetConsoleVariableInt | — | — | — | — |
| GetConsoleVariableBool | — | — | — | — |
@@@ DataChannelRead
| Num | DI DataChannel interface | Int Num | — | Returns the current number of elements in the Data Channel being read. |
| GetNDCSpawnData | DI DataChannel interface, ? Emitter ID, Int Spawned Particle Exec Index | Int NDC Index, Int NDC Spawn Index, Int NDC Spawn Count | — | Returns data in relation the the NDC item that spawned this particle. Only valid for particles spawned from NDC and only on the frame in which they're spawned. |
| Read | DI DataChannel interface, Int Index | Bool Success | — | Reads Data Channel data at a specific index. Any values we read that are not in the Data Channel data are set to their default values. Returns success if there was a valid Data Channel entry to read from at the given index. |
| Consume | DI DataChannel interface, Bool Consume | Bool Success, Int Index | — | Consumes an item from the Data Channel and reads the specified values. Any values we read that are not in the Data Channel data are set to their default values. Returns success if an entry was available to be consumed in the Data Channel. |
| SpawnConditional | DI DataChannel interface, Bool Enable, ? Emitter ID, enum:NDIDataChannelSpawnMode Mode, enum:NiagaraConditionalOperator Operator, Int Min Spawn Count, Int Max Spawn Count | — | E | Will Spawn particles into the given Emitter between Min and Max counts for every element in the Data Channel. 		Can take optional additional parameters as conditions on spawning. The data passed into the function will be compared against the contents of each Data Channel element. 		For example, you could spawn only for NDC items that match a particular value of an enum. 		For compound data types that contain multiple component floats or ints, comparisons are done on a per component basis. 		For example if you add a Vector condition parameter it will be compared against each component of the corresponding Vector in the Data Channel. 		Result = (Param.X == ChannelValue.X) && (Param.Y == ChannelValue.Y) && (Param.Z == ChannelValue.Z) |
| SpawnDirect | DI DataChannel interface, Bool Enable, ? Emitter ID, enum:NDIDataChannelSpawnMode Mode, Float RandomScaleMin, Float RandomScaleMax, Int ClampMin, Int ClampMax | — | E | Spawns particles into a given emitter for each entry in the Data Channel. Spawn count is determined directly from a value in the Data Channel. Additional per NDC item random scale and a clamp is available. |
| ScaleSpawnCount | DI DataChannel interface, Bool Enable, ? Emitter ID, enum:NDIDataChannelSpawnScaleMode Mode, Float RandomScaleMin, Float RandomScaleMax, Float ClampMin, Float ClampMax, ?  | ?  | E | Applies a scaling value for each NDC Item spawn count based on a variable in the NDC data. Optional additional random scale and clamp operations to the value read from each NDC entry. |
@@@ DataChannelWrite
| Num | DI DataChannel interface | Int Num | — | Returns the number of instances allocated for writing into the Data Channel from this interface. Writes at an index beyond this will fail. |
| Allocate | DI DataChannel interface, ? Emitter ID, Int Allocation Count | — | E | Adds an amount to allocated into the bound NDC data for the given emitter to write into. |
| Write | DI DataChannel interface, ? , Int Index | Bool Success | E,G✗ | Writes data into the Data Channel at a specific index. Values in the DataChannel that are not written here are set to their defaults. Returns success if the index was valid and data was written into the Data Channel. |
| Append | DI DataChannel interface, ?  | Bool Success | E | Appends a new DataChannel to the end of the DataChannel array and writes the specified values. Values in the DataChannel that are not written here are set to their defaults. Returns success if an DataChannel was successfully pushed. |
@@@ DataTable
| IsValid | — | — | — | — |
| GetNumRows | — | — | — | — |
| GetNumFilteredRows | — | — | — | — |
| GetRow | — | — | — | — |
| GetFilteredRow | — | — | — | — |
@@@ DebugDraw
| DrawLine | — | — | — | — |
| DrawRectangle | — | — | — | — |
| DrawCircle | — | — | — | — |
| DrawBox | — | — | — | — |
| DrawSphere | — | — | — | — |
| DrawCylinder | — | — | — | — |
| DrawCone | — | — | — | — |
| DrawTorus | — | — | — | — |
| DrawCoordinateSystem | — | — | — | — |
| DrawGrid2D | — | — | — | — |
| DrawGrid3D | — | — | — | — |
| DrawLinePersistent | — | — | — | — |
| DrawRectanglePersistent | — | — | — | — |
| DrawCirclePersistent | — | — | — | — |
| DrawBoxPersistent | — | — | — | — |
| DrawSpherePersistent | — | — | — | — |
| DrawCylinderPersistent | — | — | — | — |
| DrawConePersistent | — | — | — | — |
| DrawTorusPersistent | — | — | — | — |
| DrawCoordinateSystemPersistent | — | — | — | — |
| DrawGrid2DPersistent | — | — | — | — |
| DrawGrid3DPersistent | — | — | — | — |
@@@ DynamicMesh
| GetMeshProperties | — | — | — | — |
| GetSectionCount | — | — | — | — |
| GetSectionData | — | — | — | — |
| GetLocalBounds | — | — | — | — |
| SetMeshProperties | — | — | ,G✗ | — |
| SetSectionCount | — | — | ,G✗ | — |
| SetSectionData | — | — | ,G✗ | — |
| SetLocalBounds | — | — | ,G✗ | — |
| ClearAllSectionTriangles | — | — | ,G✗ | — |
| ClearSectionTriangles | — | — | ,G✗ | — |
| AllocateSectionTriangles | — | — | — | — |
| GetTriangleVertices | — | — | — | — |
| GetVertexPosition | — | — | — | — |
| GetVertexTangentBasis | — | — | — | — |
| GetVertexTexCoord | — | — | — | — |
| GetVertexColor | — | — | — | — |
| GetVertexData | — | — | — | — |
| SetTriangleVertices | — | — | — | — |
| SetVertexPosition | — | — | — | — |
| SetVertexTangentBasis | — | — | — | — |
| SetVertexTexCoord | — | — | — | — |
| SetVertexColor | — | — | — | — |
| SetVertexData | — | — | — | — |
| AppendTriangle | — | — | — | — |
@@@ EmitterProperties
| GetLocalSpace | — | — | — | — |
| GetBounds | — | — | — | — |
| GetFixedBounds | — | — | — | — |
| SetFixedBounds | — | — | E,G✗ | — |
@@@ GBuffer
| Attribute.ScreenUVFunction | — | — | ,C✗ | — |
@@@ MemoryBuffer
| SetNumElements | — | — | — | — |
| GetNumElements | — | — | — | — |
| SupportedType.LoadFunction | — | — | — | — |
| SupportedType.StoreFunction | — | — | — | — |
| AtomicAdd | — | — | — | — |
| AtomicAnd | — | — | — | — |
| AtomicMax | — | — | — | — |
| AtomicMin | — | — | — | — |
| AtomicOr | — | — | — | — |
| AtomicXor | — | — | — | — |
| AtomicCompareAndExchange | — | — | — | — |
| ClearBufferInt | — | — | — | — |
| ClearBufferFloat | — | — | — | — |
@@@ PhysicsAsset
| GetNumBoxes | — | — | ,C✗ | — |
| GetNumSpheres | — | — | ,C✗ | — |
| GetNumCapsules | — | — | ,C✗ | — |
| GetClosestPoint | — | — | ,C✗ | — |
| GetClosestElement | — | — | ,C✗ | — |
| GetElementPoint | — | — | ,C✗ | — |
| GetElementDistance | — | — | ,C✗ | — |
| GetClosestDistance | — | — | ,C✗ | — |
| GetRestDistance | — | — | ,C✗ | — |
| GetTexturePoint | — | — | ,C✗ | — |
| GetProjectionPoint | — | — | ,C✗ | — |
@@@ SceneCapture2D
| GetTextureSize | — | — | — | — |
| Project | — | — | — | — |
| Deproject | — | — | — | — |
| GetCaptureTransform | — | — | ,G✗ | — |
| SetCaptureTransform | — | — | — | — |
| SetRequestCapture | — | — | — | — |
| TextureLoad | — | — | — | — |
| TextureSample | — | — | — | — |
| TextureProject | — | — | — | — |
| TextureProjectDepth | — | — | — | — |
| TextureDeprojectDepth | — | — | — | — |
@@@ SimCacheReader
| GetNumFrames | — | — | — | — |
| GetNumEmitters | — | — | — | — |
| GetEmitterIndex | — | — | — | — |
| GetNumInstances | — | — | — | — |
| GenFuncInfo.Function | — | — | — | — |
@@@ SimpleCounter
| GetNextValue | — | — | — | — |
| Get | — | — | — | — |
| Set | — | — | E | — |
| Exchange | — | — | E | — |
| Add | — | — | E | — |
| Increment | — | — | E | — |
| Decrement | — | — | E | — |
@@@ SocketReader
| IsValid | — | — | — | — |
| GetComponentToWorld | — | — | — | — |
| GetSocketCount | — | — | — | — |
| GetFilteredSocketCount | — | — | — | — |
| GetUnfilteredSocketCount | — | — | — | — |
| GetSocketTransform | — | — | — | — |
| GetFilteredSocketTransform | — | — | — | — |
| GetUnfilteredSocketTransform | — | — | — | — |
| GetSocketTransformInterpolated | — | — | — | — |
| GetFilteredSocketTransformInterpolated | — | — | — | — |
| GetUnfilteredSocketTransformInterpolated | — | — | — | — |
@@@ StaticMesh
| IsValidVertex | — | — | — | — |
| RandomVertex | — | — | — | — |
| GetVertexCount | — | — | — | — |
| IsValidFilteredVertex | — | — | — | — |
| RandomFilteredVertex | — | — | — | — |
| GetFilteredVertexCount | — | — | — | — |
| GetFilteredVertexAt | — | — | — | — |
| GetVertex | — | — | — | — |
| GetVertexWS | — | — | — | — |
| GetVertexWSInterpolated | — | — | — | — |
| GetVertexColor | — | — | — | — |
| GetVertexUV | — | — | — | — |
| IsValidTriangle | — | — | — | — |
| RandomTriangle | — | — | — | — |
| GetTriangleCount | — | — | — | — |
| IsValidFilteredTriangle | — | — | — | — |
| RandomFilteredTriangle | — | — | — | — |
| GetFilteredTriangleCount | — | — | — | — |
| GetFilteredTriangleAt | — | — | — | — |
| IsValidUnfilteredTriangle | — | — | — | — |
| RandomUnfilteredTriangle | — | — | — | — |
| GetUnfilteredTriangleCount | — | — | — | — |
| GetUnfilteredTriangleAt | — | — | — | — |
| GetTriangle | — | — | — | — |
| GetTriangleWS | — | — | — | — |
| GetTriangleWSInterpolated | — | — | — | — |
| GetTriangleColor | — | — | — | — |
| GetTriangleUV | — | — | — | — |
| GetTriangleIndices | — | — | — | — |
| GetSocketCount | — | — | — | — |
| GetFilteredSocketCount | — | — | — | — |
| GetUnfilteredSocketCount | — | — | — | — |
| RandomSocket | — | — | — | — |
| RandomFilteredSocket | — | — | — | — |
| RandomUnfilteredSocket | — | — | — | — |
| GetSocketTransform | — | — | — | — |
| GetSocketTransformWS | — | — | — | — |
| GetSocketTransformWSInterpolated | — | — | — | — |
| GetFilteredSocketTransform | — | — | — | — |
| GetFilteredSocketTransformWS | — | — | — | — |
| GetFilteredSocketTransformWSInterpolated | — | — | — | — |
| GetUnfilteredSocketTransform | — | — | — | — |
| GetUnfilteredSocketTransformWS | — | — | — | — |
| GetUnfilteredSocketTransformWSInterpolated | — | — | — | — |
| GetFilteredSocket | — | — | — | — |
| GetUnfilteredSocket | — | — | — | — |
| IsValidSection | — | — | — | — |
| GetSectionTriangleCount | — | — | — | — |
| RandomSectionTriangle | — | — | — | — |
| GetSectionTriangleAt | — | — | — | — |
| GetFilteredSectionAt | — | — | — | — |
| GetUnfilteredSectionAt | — | — | — | — |
| GetSectionCount | — | — | — | — |
| GetFilteredSectionCount | — | — | — | — |
| GetUnfilteredSectionCount | — | — | — | — |
| RandomSection | — | — | — | — |
| RandomFilteredSection | — | — | — | — |
| RandomUnfilteredSection | — | — | — | — |
| IsValid | — | — | — | — |
| GetPreSkinnedLocalBounds | — | — | — | — |
| GetMeshBounds | — | — | — | — |
| GetMeshBoundsWS | — | — | — | — |
| GetLocalToWorld | — | — | — | — |
| GetLocalToWorldInverseTransposed | — | — | — | — |
| GetWorldVelocity | — | — | — | — |
| GetInstanceIndex | — | — | — | — |
| SetInstanceIndex | — | — | E,G✗ | — |
| GetTriangleCoordAtUV | — | — | — | — |
| GetTriangleCoordInAabb | — | — | — | — |
| BuildUvMapping | — | — | ,G✗E | — |
| QueryDistanceField | — | — | ,C✗ | Given a world position, this returns the value of the parented static mesh`s signed distance field |
| DeprecatedGetTriColor | — | — | — | — |
| DeprecatedGetTriUV | — | — | — | — |
| DeprecatedRandomSection | — | — | — | — |
| DeprecatedRandomTriCoord | — | — | — | — |
| DeprecatedRandomTriCoordOnSection | — | — | — | — |
| DeprecatedGetVertexPosition | — | — | — | — |
| DeprecatedGetVertexPositionWS | — | — | — | — |
| DeprecatedGetTriPosition | — | — | — | — |
| DeprecatedGetTriPositionWS | — | — | — | — |
| DeprecatedGetTriPositionAndVelocityWS | — | — | — | — |
| DeprecatedGetTriTangents | — | — | — | — |
| DeprecatedGetTriTangentsWS | — | — | — | — |
| DeprecatedGetTriNormal | — | — | — | — |
| DeprecatedGetTriNormalWS | — | — | — | — |
| ⏵NameTrans.Value | — | — | — | — |
@@@ UObjectPropertyReader
| GetComponentTransform | — | — | — | — |
| GetComponentInverseTransform | — | — | — | — |
| ⏵FTypeHelper<TYPE>::GetFunctionName() | — | — | — | — |
@@@ VirtualTexture
| GetAttributesValid | — | — | ,C✗ | — |
| SampleRVT | — | — | ,C✗ | — |
@@@ SkeletalMesh·BoneSampling
| GetSkinnedBoneData | — | — | — | — |
| GetSkinnedBoneDataWS | — | — | — | — |
| GetSkinnedBoneDataInterpolated | — | — | — | — |
| GetSkinnedBoneDataWSInterpolated | — | — | — | — |
| IsValidBone | — | — | — | — |
| RandomBone | — | — | — | — |
| GetBoneCount | — | — | — | — |
| GetParentBone | — | — | — | — |
| RandomFilteredBone | — | — | — | — |
| GetFilteredBoneCount | — | — | — | — |
| GetFilteredBone | — | — | — | — |
| RandomUnfilteredBone | — | — | — | — |
| GetUnfilteredBoneCount | — | — | — | — |
| GetUnfilteredBone | — | — | — | — |
| RandomFilteredSocket | — | — | — | — |
| GetFilteredSocketCount | — | — | — | — |
| GetFilteredSocket | — | — | — | — |
| GetFilteredSocketTransform | — | — | — | — |
| RandomFilteredSocketOrBone | — | — | — | — |
| GetFilteredSocketOrBoneCount | — | — | — | — |
| GetFilteredSocketOrBone | — | — | — | — |
@@@ SkeletalMesh·TriangleSampling
| RandomTriCoord | — | — | — | — |
| IsValidTriCoord | — | — | — | Determine if this tri coordinate's triangle index is valid for this mesh. Note that this only checks the mesh index buffer size and does not include any filtering settings. |
| GetTriangleData | — | — | — | Returns bind pose triangle data. |
| GetTriangleIndices | — | — | — | Returns bind pose triangle data. |
| GetSkinnedTriangleData | — | — | — | Returns skinning dependant data for the pased MeshTriCoord in local space. All outputs are optional and you will incur zerp minimal cost if they are not connected. |
| GetSkinnedTriangleDataWS | — | — | — | Returns skinning dependant data for the pased MeshTriCoord in world space. All outputs are optional and you will incur zerp minimal cost if they are not connected. |
| GetSkinnedTriangleDataInterpolated | — | — | — | Returns skinning dependant data for the pased MeshTriCoord in local space. Interpolates between previous and current frame. All outputs are optional and you will incur zerp minimal cost if they are not connected. |
| GetSkinnedTriangleDataWSInterpolated | — | — | — | Returns skinning dependant data for the pased MeshTriCoord in world space. Interpolates between previous and current frame. All outputs are optional and you will incur zerp minimal cost if they are not connected. |
| GetSkinnedTriangleVertexData | — | — | — | — |
| GetSkinnedTriangleVertexDataWS | — | — | — | — |
| GetSkinnedTriangleVertexDataInterpolated | — | — | — | — |
| GetSkinnedTriangleVertexDataWSInterpolated | — | — | — | — |
| GetTriColor | — | — | — | — |
| GetTriUV | — | — | — | — |
| GetTriCoordVertices | — | — | — | Takes the TriangleIndex from a MeshTriCoord and returns the vertices for that triangle. |
| RandomTriangle | — | — | — | — |
| GetTriangleCount | — | — | — | — |
| RandomFilteredTriangle | — | — | — | — |
| GetFilteredTriangleCount | — | — | — | — |
| GetFilteredTriangle | — | — | — | — |
| GetTriangleCoordAtUV | — | — | — | — |
| GetTriangleCoordInAabb | — | — | — | — |
| GetAdjacentTriangleIndex | — | — | ,C✗ | — |
| GetTriangleNeighbor | — | — | ,C✗ | — |
@@@ SkeletalMesh·VertexSampling
| GetVertexData | — | — | — | Returns bind pose for the vertex |
| GetSkinnedVertexData | — | — | — | Returns skinning dependant data for the pased vertex in local space. All outputs are optional and you will incur zero to minimal cost if they are not connected. |
| GetSkinnedVertexDataWS | — | — | — | Returns skinning dependant data for the pased vertex in world space. All outputs are optional and you will incur zero to minimal cost if they are not connected. |
| GetSkinnedVertexDataInterpolated | — | — | — | Returns skinning dependant data for the pased vertex in local space. All outputs are optional and you will incur zero to minimal cost if they are not connected. |
| GetSkinnedVertexDataInterpolatedWS | — | — | — | Returns skinning dependant data for the pased vertex in world space. All outputs are optional and you will incur zero to minimal cost if they are not connected. |
| GetVertexColor | — | — | — | — |
| GetVertexUV | — | — | — | — |
| IsValidVertex | — | — | — | — |
| RandomVertex | — | — | — | — |
| GetVertexCount | — | — | — | — |
| IsValidFilteredVertex | — | — | — | — |
| RandomFilteredVertex | — | — | — | — |
| GetFilteredVertexCount | — | — | — | — |
| GetFilteredVertex | — | — | — | — |
@@@ 2DArrayTexture
| LoadTexture | — | — | — | — |
| GatherRedTexture | — | — | — | — |
| SampleTexture | — | — | — | — |
| TextureDimensions | — | — | — | — |
@@@ AudioOscilloscope
| SampleAudioBuffer | — | — | — | — |
| GetAudioBufferNumChannels | — | — | — | — |
@@@ AudioPlayer
| PlayAudioAtLocation | Int ParticleID | — | ,G✗E | — |
| PlayPersistentAudio | — | — | ,G✗E | — |
| SetBooleanParameter | — | — | ,G✗E | — |
| SetIntegerParameter | — | — | ,G✗E | — |
| SetFloatParameter | — | — | ,G✗E | — |
| SetInitialBooleanParameter | Bool Is Global Parameter, Int Particle ID | — | ,G✗E | — |
| SetInitialIntegerParameter | Bool Is Global Parameter, Int Particle ID | — | ,G✗E | — |
| SetInitialFloatParameter | Bool Is Global Parameter, Int Particle ID | — | ,G✗E | — |
| UpdateAudioVolume | — | — | ,G✗E | — |
| UpdateAudioPitch | — | — | ,G✗E | — |
| UpdateAudioLocation | — | — | ,G✗E | — |
| UpdateAudioRotation | — | — | ,G✗E | — |
| SetPaused | — | — | ,G✗E | — |
@@@ AudioSpectrum
| AudioSpectrum | — | — | — | — |
| GetNumChannels | — | — | — | — |
@@@ Camera
| GetViewPropertiesGPU | DI Camera interface | Position View Position World, Vec3 View Forward Vector, Vec3 View Up Vector, Vec3 View Right Vector, Vec4 View Size And Inverse Size, Vec4 Screen To View Space, Vec2 , Vec2 , Vec3 PreViewTranslation, Vec4 Buffer Size And Inverse Size, Vec2 Viewport Offset, Float Near Plane, Vec2 , Vec2  | ,C✗ | This function returns the properties of the current view. Only valid for gpu particles. |
| GetClipSpaceTransformsGPU | DI Camera interface | Matrix4 World To Clip Transform, Matrix4 Translated World To Clip Transform, Matrix4 Clip To World Transform, Matrix4 Clip To View Transform, Matrix4 Clip To Translated World Transform, Matrix4 Screen To World Transform, Matrix4 Screen To Translated World Transform, Matrix4 Clip To Previous Clip Transform | ,C✗ | This function returns the clip transforms for the current view. Only valid for gpu particles. |
| GetViewSpaceTransformsGPU | DI Camera interface | Matrix4 Translated World To View Transform, Matrix4 View To Translated World Transform, Matrix4 Translated World To Camera View Transform, Matrix4 Camera View To Translated World Transform, Matrix4 View To Clip Transform, Matrix4 View To ClipNoAA Transform | ,C✗ | This function returns the relevant transforms for the current view. Only valid for gpu particles. |
| ApplyPreViewTranslationToPositionGPU | DI Camera interface, Position World Position | Vec4 Translated Position | ,C✗ | This function applies the pre view translation to a lwc positions such as Particles.Position. The resulting vector can be used with any of the 'Translated X to Y' transform matrices. |
| RemovePreViewTranslationFromPositionGPU | DI Camera interface, Vec4 Translated Position | Position World Position | ,C✗ | This function removes the pre view translation from a vector to return a lwc position. Use the result of a 'X to Translated Y' transform matrix multiplication as input vector. |
| GetFieldOfView | DI Camera interface | Float Field Of View Angle | — | This function returns the field of view angle (in degrees) for the active camera. For gpu particles this returns the x axis fov. |
| GetCameraProperties | DI Camera interface | Position Camera Position World, Vec3 Forward Vector World, Vec3 Up Vector World, Vec3 Right Vector World | — | This function returns the position of the currently active camera. |
| QueryClosestParticlesCPU | DI Camera interface, ID Particle ID, Int Max Valid Results | Bool Is Closest | ,G✗ | This function checks the previously calculated distance of each particle and then returns true for the closest particles and false for the other ones. This function needs to be paired with CalculateParticleDistancesCPU to work correctly. |
| CalculateParticleDistancesCPU | DI Camera interface, ID Particle ID, Position Particle Position World | — | ,G✗E | This function compares the particle position against the camera position and stores the result to be queried in the next frame. The results can then be queried with QueryClosestParticlesCPU. |
| GetTAAJitter | — | — | ,C✗ | — |
| GetSplitscreenInfo | — | enum:SplitScreenType::Type Current Splitscreen Mode, Vec3 PreViewTranslation, Vec4 Buffer Size And Inverse Size, Vec2 Viewport Offset | — | — |
@@@ CollisionQuery
| QuerySceneDepthGPU | Position DepthSamplePosWorld | Float SceneDepth, Position CameraPosWorld, Bool IsInsideView, Position SamplePosWorld, Vec3 SampleWorldNormal | ,C✗ | Projects a given world position to view space and then queries the depth buffer with that position. |
| QueryScenePartialDepthGPU | Position DepthSamplePosWorld | Float SceneDepth, Position CameraPosWorld, Bool IsInsideView, Position SamplePosWorld, Vec3 SampleWorldNormal | ,C✗ | Projects a given world position to view space and then queries the partial depth buffer (opaque emitter using this function are not in this depth buffer) with that position. |
| QueryCustomDepthGPU | Position DepthSamplePosWorld | Float SceneDepth, Position CameraPosWorld, Bool IsInsideView, Position SamplePosWorld, Vec3 SampleWorldNormal | ,C✗ | Projects a given world position to view space and then queries the custom depth buffer with that position. |
| QueryMeshDistanceFieldGPU | Position FieldSamplePosWorld | Float DistanceToNearestSurface, Vec3 FieldGradient, Bool IsDistanceFieldValid | ,C✗ | Queries the global distance field for a given world position. Please note that the distance field resolution gets lower the farther away the queried position is from the camera. |
| IssueAsyncRayTraceGpu | DI CollisionQuery, Int QueryID, Position TraceStartWorld, Position TraceEndWorld, Int TraceChannel | Bool IsQueryValid | E,C✗ | Enqueues a GPU raytrace with the result being available the following frame |
| CreateAsyncRayTraceGpu | DI CollisionQuery, Position TraceStartWorld, Position TraceEndWorld, Int TraceChannel | Int QueryID, Bool IsQueryValid | E,C✗ | Creates a GPU raytrace with the result being available the following frame (index is returned) |
| ReserveAsyncRayTraceGpu | DI CollisionQuery, Int TraceCount | Int FirstQueryID, Bool IsQueryValid | E,C✗ | Reserves a number of ray trace request slots |
| ReadAsyncRayTraceGpu | DI CollisionQuery, Int PreviousFrameQueryID | Bool CollisionValid, Float CollisionDistance, Position CollisionPosWorld, Vec3 CollisionNormal | ,C✗ | Reads the results of a previously enqueued GPU ray trace |
| PerformCollisionQuerySyncCPU | Position TraceStartWorld, Position TraceEndWorld, ? TraceChannel, Bool SkipTrace, Bool TraceComplex | Bool CollisionValid, Bool IsTraceInsideMesh, Position CollisionPosWorld, Vec3 CollisionNormal, Float CollisionMaterialFriction, Float CollisionMaterialRestitution, Int CollisionMaterialIndex | ,G✗ | Traces a ray against the world using a specific channel and return the first blocking hit. |
| PerformCollisionQueryAsyncCPU | Int PreviousFrameQueryID, Position TraceStartWorld, Position TraceEndWorld, ? TraceChannel, Bool SkipTrace, Bool TraceComplex | Int NextFrameQueryID, Bool CollisionValid, Bool IsTraceInsideMesh, Position CollisionPosWorld, Vec3 CollisionNormal, Float CollisionMaterialFriction, Float CollisionMaterialRestitution, Int CollisionMaterialIndex | ,G✗ | Traces a ray against the world using a specific channel and return the first blocking hit the next frame. Note that this is the ASYNC version of the trace function, meaning it will not returns the result right away, but with one frame latency. |
@@@ ColorCurve
| SampleColorCurve | — | — | — | — |
@@@ CubeTexture
| SampleCubeTexture | — | — | ,C✗ | — |
| TextureDimensions | — | — | — | — |
@@@ CurlNoise
| SampleNoiseField | — | — | — | — |
@@@ Curve
| SampleCurve | — | — | — | — |
@@@ Export
| ⏵NDIExportLocal::StoreDataName_DEPRECATED | — | — | — | — |
| ExportData | — | — | E | — |
@@@ Grid2DCollection
| SetNumCells | — | — | E,G✗ | — |
| GetGridValue | — | — | ,C✗ | — |
| GetPreviousValueAtIndex | — | — | ,C✗ | — |
| SetGridValue | — | — | ,C✗ | — |
| SetValueAtIndex | — | — | E,C✗ | — |
| ClearCell | — | — | E,C✗ | — |
| CopyPreviousToCurrentForCell | — | — | E,C✗ | — |
| SetVector4Value | — | — | E,C✗ | — |
| GetPreviousVector4Value | — | — | ,C✗ | — |
| GetVector4Value | — | — | — | — |
| SamplePreviousGridVector4Value | — | — | ,C✗ | — |
| SampleGridVector4Value | — | — | — | — |
| CubicSamplePreviousGridVector4Value | — | — | ,C✗ | — |
| SetVectorValue | — | — | E,C✗ | — |
| SetVector3Value | — | — | — | — |
| GetPreviousVectorValue | — | — | ,C✗ | — |
| GetVector3Value | — | — | — | — |
| SamplePreviousGridVector3Value | — | — | ,C✗ | — |
| SampleGridVector3Value | — | — | — | — |
| CubicSamplePreviousGridVector3Value | — | — | ,C✗ | — |
| SetVector2DValue | — | — | E,C✗ | — |
| SetVector2Value | — | — | — | — |
| GetPreviousVector2DValue | — | — | ,C✗ | — |
| GetVector2Value | — | — | — | — |
| SamplePreviousGridVector2DValue | — | — | ,C✗ | — |
| SampleGridVector2Value | — | — | — | — |
| CubicSamplePreviousGridVector2DValue | — | — | ,C✗ | — |
| SetFloatValue | — | — | E,C✗ | — |
| GetPreviousFloatValue | — | — | ,C✗ | — |
| GetFloatValue | — | — | — | — |
| SamplePreviousGridFloatValue | — | — | ,C✗ | — |
| SampleGridFloatValue | — | — | — | — |
| CubicSamplePreviousGridFloatValue | — | — | ,C✗ | — |
| SampleGrid | — | — | ,C✗ | — |
| SamplePreviousGridAtIndex | — | — | ,C✗ | — |
| CubicSamplePreviousGridAtIndex | — | — | ,C✗ | — |
| GetVector4AttributeIndex | — | — | — | — |
| GetVectorAttributeIndex | — | — | — | — |
| GetVector2DAttributeIndex | — | — | — | — |
| GetFloatAttributeIndex | — | — | — | — |
@@@ Grid3DCollection
| SetNumCells | — | — | E,G✗ | — |
| GetGridValue | — | — | ,C✗ | — |
| GetPreviousValueAtIndex | — | — | ,C✗ | — |
| GetFullGridPreviousValue | — | — | ,C✗ | — |
| SetGridValue | — | — | ,C✗ | — |
| SetFullGridValue | — | — | ,C✗ | — |
| ClearCell | — | — | E,C✗ | — |
| CopyPreviousToCurrentForCell | — | — | E,C✗ | — |
| CopyMaskedPreviousToCurrentForCell | — | — | E,C✗ | — |
| SetVector4Value | — | — | E,C✗ | — |
| GetPreviousVector4Value | — | — | ,C✗ | — |
| SamplePreviousGridVector4Value | — | — | ,C✗ | — |
| CubicSamplePreviousGridVector4Value | — | — | ,C✗ | — |
| SetVectorValue | — | — | E,C✗ | — |
| GetPreviousVectorValue | — | — | ,C✗ | — |
| SamplePreviousGridVector3Value | — | — | ,C✗ | — |
| CubicSamplePreviousGridVector3Value | — | — | ,C✗ | — |
| SetVector2DValue | — | — | E,C✗ | — |
| GetPreviousVector2DValue | — | — | ,C✗ | — |
| SamplePreviousGridVector2DValue | — | — | ,C✗ | — |
| CubicSamplePreviousGridVector2DValue | — | — | ,C✗ | — |
| SetFloatValue | — | — | E,C✗ | — |
| GetPreviousFloatValue | — | — | ,C✗ | — |
| SamplePreviousGridFloatValue | — | — | ,C✗ | — |
| CubicSamplePreviousGridFloatValue | — | — | ,C✗ | — |
| SampleGrid | — | — | ,C✗ | — |
| CubicSampleGrid | — | — | ,C✗ | — |
| SamplePreviousGridAtIndex | — | — | ,C✗ | — |
| CubicSamplePreviousGridAtIndex | — | — | ,C✗ | — |
| SamplePreviousFullGrid | — | — | ,C✗ | — |
| CubicSamplePreviousFullGrid | — | — | ,C✗ | — |
| GetVector4AttributeIndex | — | — | — | — |
| GetVectorAttributeIndex | — | — | — | — |
| GetVector2DAttributeIndex | — | — | — | — |
| GetFloatAttributeIndex | — | — | — | — |
| GetPreviousFloatValueAtIndex | — | — | ,C✗ | — |
| GetPreviousVector2ValueAtIndex | — | — | ,C✗ | — |
| GetPreviousVector3ValueAtIndex | — | — | ,C✗ | — |
| GetPreviousVector4ValueAtIndex | — | — | ,C✗ | — |
| SamplePreviousGridFloatAtIndex | — | — | ,C✗ | — |
| SamplePreviousGridVector2AtIndex | — | — | ,C✗ | — |
| SamplePreviousGridVector3AtIndex | — | — | ,C✗ | — |
| SamplePreviousGridVector4AtIndex | — | — | ,C✗ | — |
| CubicSamplePreviousGridFloatAtIndex | — | — | ,C✗ | — |
| CubicSamplePreviousGridVector2AtIndex | — | — | ,C✗ | — |
| CubicSamplePreviousGridVector3AtIndex | — | — | ,C✗ | — |
| CubicSamplePreviousGridVector4AtIndex | — | — | ,C✗ | — |
| SetFloatValueAtIndex | — | — | E,C✗ | — |
| SetVector2ValueAtIndex | — | — | E,C✗ | — |
| SetVector3ValueAtIndex | — | — | E,C✗ | — |
| SetVector4ValueAtIndex | — | — | E,C✗ | — |
@@@ IntRenderTarget2D
| GetValue | — | — | ,C✗ | Gets the value from the render target at the pixel offset |
| SetValue | — | — | E,C✗ | Sets the value on the render target at the pixel offset. |
| AtomicAdd | — | — | E,C✗ | Atomic min the value to the pixel at the offset, returns the current & previous values. This opertion is thread safe. |
| AtomicCompareAndExchange | — | — | E,C✗ | Compares the pixel value against the comparison value, if they are equal the value is replaced. Original Value is the pixel value before the operation completes. This opertion is thread safe. |
| AtomicMax | — | — | E,C✗ | Atomic max the value to the pixel at the offset, returns the current & previous values. This opertion is thread safe. |
| AtomicMin | — | — | E,C✗ | Atomic min the value to the pixel at the offset, returns the current & previous values. This opertion is thread safe. |
| GetRenderTargetSize | — | — | — | Gets the size of the rendertarget |
| SetRenderTargetSize | — | — | E,G✗ | Sets the size of the rendertarget |
| LinearToIndex | — | — | ,C✗ | Converts a linear index into a pixel coordinate |
| LinearToUV | — | — | ,C✗ | Converts a linear index into a UV coordinate |
| ExecToIndex | — | — | ,C✗ | Returns the execution index as a pixel coordinate |
| ExecToUV | — | — | ,C✗ | Returns the execution index as a UV coordinate |
@@@ Landscape
| GetBaseColor | — | — | ,C✗ | — |
| GetHeight | — | — | ,C✗ | — |
| GetWorldNormal | — | — | ,C✗ | — |
| GetPhysicalMaterialIndex | — | — | ,C✗ | — |
| GenerateVirtualTextureFeedback | — | — | E,G✗ | — |
@@@ MaterialInstanceDynamic
| SetScalarParameter | — | — | — | — |
| SetVector4Parameter | — | — | — | — |
@@@ MaterialParameterCollection
| SetScalarParameter | — | — | — | — |
| SetVector4Parameter | — | — | — | — |
@@@ MeshRendererInfo
| GetNumMeshes | — | — | — | Retrieves the number of meshes on the mesh renderer by index, or -1 if the index is invalid. |
| GetMeshLocalBounds | — | — | — | Retrieves the local bounds of the specified mesh's vertices. |
| GetSubUVDetails | — | — | — | — |
@@@ NeighborGrid3D
| SetNumCells | — | — | E,G✗ | — |
| MaxNeighborsPerCell | — | — | — | — |
| NeighborGridIndexToLinear | — | — | — | — |
| GetParticleNeighbor | — | — | — | — |
| SetParticleNeighbor | — | — | — | — |
| GetParticleNeighborCount | — | — | — | — |
| SetParticleNeighborCount | — | — | — | — |
| AddParticle | — | — | E | — |
@@@ Occlusion
| Deprecated_GetCameraOcclusionRectangle | Position Sample Center World Position, Float Sample Window Width World, Float Sample Window Height World, Float Sample Steps Per Line | Float Visibility Fraction, Float Sample Fraction | — | — |
| GetCameraOcclusionRectangle | — | — | — | — |
| Deprecated_GetCameraOcclusionCircle | Position Sample Center World Position, Float Sample Window Diameter World, Float Samples per ring, Float Number of sample rings | Float Visibility Fraction, Float Sample Fraction | — | — |
| QueryOcclusionFactorWithCircle | — | — | — | — |
| QueryCloudOcclusionWithCircle | — | — | — | — |
@@@ ParticleRead
| GetLocalSpace | — | — | — | — |
| GetNumSpawnedParticlesFunction | — | — | — | — |
| GetIDAtSpawnIndexFunction | — | — | — | — |
| GetNumParticlesFunction | — | — | — | — |
| GetParticleIndexFunction | — | — | — | — |
| GetParticleIndexFromIDTable | — | — | — | — |
| GetIntByIDFunction | — | — | — | — |
| GetBoolByIDFunction | — | — | — | — |
| GetFloatByIDFunction | — | — | — | — |
| GetVec2ByIDFunction | — | — | — | — |
| GetVec3ByIDFunction | — | — | — | — |
| GetPositionByIDFunction | — | — | — | — |
| GetVec4ByIDFunction | — | — | — | — |
| GetColorByIDFunction | — | — | — | — |
| GetQuatByIDFunction | — | — | — | — |
| GetIDByIDFunction | — | — | — | — |
| GetIntByIndexFunction | — | — | — | — |
| GetBoolByIndexFunction | — | — | — | — |
| GetFloatByIndexFunction | — | — | — | — |
| GetVec2ByIndexFunction | — | — | — | — |
| GetVec3ByIndexFunction | — | — | — | — |
| GetVec4ByIndexFunction | — | — | — | — |
| GetPositionByIndexFunction | — | — | — | — |
| GetColorByIndexFunction | — | — | — | — |
| GetQuatByIndexFunction | — | — | — | — |
| GetIDByIndexFunction | — | — | — | — |
| ⏵RenamePair.Value | — | — | — | — |
@@@ PlatformSet
| IsActive | — | — | — | — |
@@@ RW
| GetWorldBBoxSize | — | — | — | — |
| GetNumCells | — | — | — | — |
| SimulationToUnit | — | — | — | — |
| UnitToSimulation | — | — | — | — |
| UnitToIndex | — | — | — | — |
| UnitToFloatIndex | — | — | — | — |
| IndexToUnit | — | — | — | — |
| IndexToLinear | — | — | — | — |
| LinearToIndex | — | — | — | — |
| ExecutionIndexToUnit | — | — | — | — |
| ExecutionIndexToGridIndex | — | — | — | — |
| GetCellSize | — | — | — | — |
| IndexToUnitStaggeredX | — | — | — | — |
| IndexToUnitStaggeredY | — | — | — | — |
@@@ RWUtils
| *Attribute | — | — | — | — |
@@@ RasterizationGrid3D
| SetNumCells | — | — | E,G✗ | — |
| SetNumAttributes | — | — | E,G✗ | — |
| SetFloatResetValue | — | — | E,G✗ | — |
| SetFloatGridValue | — | — | ,C✗ | — |
| SetIntGridValue | — | — | ,C✗ | — |
| InterlockedAddFloatGridValue | — | — | ,C✗ | — |
| InterlockedAddIntGridValue | — | — | ,C✗ | — |
| InterlockedAddFloatGridValueSafe | — | — | ,C✗ | — |
| InterlockedMinFloatGridValue | — | — | ,C✗ | — |
| InterlockedMaxFloatGridValue | — | — | ,C✗ | — |
| GetFloatGridValue | — | — | ,C✗ | — |
| GetIntGridValue | — | — | ,C✗ | — |
@@@ RenderTarget2D
| GetRenderTargetSize | — | — | — | — |
| SetRenderTargetSize | — | — | E,G✗ | — |
| ReleaseResources | — | — | E,G✗ | — |
| GetNumMipLevels | — | — | — | — |
| SetRenderTargetFormat | — | — | E,G✗ | — |
| SetRenderTargetValue | — | — | E,C✗ | — |
| LoadRenderTargetValue | — | — | ,C✗ | — |
| SampleRenderTargetValue | — | — | ,C✗ | — |
| LinearToIndex | — | — | ,C✗ | — |
| ExecToIndex | — | — | ,C✗ | — |
| ExecToUnit | — | — | ,C✗ | — |
| GetRenderTargetValue | — | — | ,C✗ | — |
@@@ RenderTarget2DArray
| GetRenderTargetSize | — | — | — | — |
| SetRenderTargetSize | — | — | E,G✗ | — |
| GetNumMipLevels | — | — | — | — |
| SetRenderTargetFormat | — | — | E,G✗ | — |
| SetRenderTargetValue | — | — | E,C✗ | — |
| GetRenderTargetValue | — | — | ,C✗ | — |
| LoadRenderTargetValue | — | — | ,C✗ | — |
| SampleRenderTargetValue | — | — | ,C✗ | — |
| LinearToIndex | — | — | ,C✗ | — |
| ExecToIndex | — | — | ,C✗ | — |
| ExecToUnit | — | — | ,C✗ | — |
@@@ RenderTargetCube
| GetRenderTargetSize | — | — | — | — |
| SetRenderTargetSize | — | — | E,G✗ | — |
| GetNumMipLevels | — | — | — | — |
| SetRenderTargetFormat | — | — | E,G✗ | — |
| SetRenderTargetValue | — | — | E,C✗ | — |
| SampleRenderTargetValue | — | — | ,C✗ | — |
| LinearToIndex | — | — | ,C✗ | — |
| ExecToIndex | — | — | ,C✗ | — |
| ExecToUnit | — | — | ,C✗ | — |
@@@ RenderTargetVolume
| GetRenderTargetSize | — | — | — | — |
| SetRenderTargetSize | — | — | E,G✗ | — |
| GetNumMipLevels | — | — | — | — |
| SetRenderTargetFormat | — | — | E,G✗ | — |
| SetRenderTargetValue | — | — | E,C✗ | — |
| LoadRenderTargetValue | — | — | ,C✗ | — |
| GetRenderTargetValue | — | — | ,C✗ | — |
| SampleRenderTargetValue | — | — | ,C✗ | — |
| LinearToIndex | — | — | ,C✗ | — |
| ExecToIndex | — | — | ,C✗ | — |
| ExecToUnit | — | — | ,C✗ | — |
@@@ RigidMeshCollisionQuery
| FindActors | DI RigidBody DI, Position Overlap Origin, Quat Overlap Rotation, Vec3 Overlap Extent, enum:CollisionChannel TraceChannel, Bool Skip Overlap | Bool Actors Changed | ,G✗E | — |
| GetNumBoxes | — | — | ,C✗ | — |
| GetNumSpheres | — | — | ,C✗ | — |
| GetNumCapsules | — | — | ,C✗ | — |
| GetNumElements | — | — | — | — |
| GetBoxElementsStartIndex | — | — | ,C✗ | — |
| GetSphereElementsStartIndex | — | — | ,C✗ | — |
| GetCapsuleElementsStartIndex | — | — | ,C✗ | — |
| GetSphereRadius | — | — | ,C✗ | — |
| GetCapsuleSize | — | — | ,C✗ | — |
| GetBoxSize | — | — | ,C✗ | — |
| IsWorldPositionInsideCombinedBounds | — | — | — | — |
| GetClosestPoint | — | — | ,C✗ | — |
| GetClosestPointSimple | — | — | ,C✗ | — |
| GetClosestElement | — | — | ,C✗ | — |
| GetElementPoint | — | — | ,C✗ | — |
| GetElementPointMeshDistanceFieldNoNormal | — | — | ,C✗ | — |
| GetElementDistance | — | — | ,C✗ | — |
| GetClosestDistance | — | — | ,C✗ | — |
| GetClosestPointMeshDistanceField | — | — | ,C✗ | — |
| GetClosestPointMeshDistanceFieldAccurate | — | — | ,C✗ | — |
| GetClosestPointMeshDistanceFieldNoNormal | — | — | ,C✗ | — |
| GetMaxEncodedDistanceMeshDistanceField | — | — | ,C✗ | — |
@@@ SkeletalMesh
| GetPreSkinnedLocalBounds | — | — | — | — |
| GetTriPosition | — | — | — | — |
| GetTriPositionWS | — | — | — | — |
| GetTriPositionVelocityAndNormal | — | — | — | — |
| GetTriPositionVelocityAndNormalWS | — | — | — | — |
| GetTriPositionVelocityAndNormalBinormalTangent | — | — | — | — |
| GetTriPositionVelocityAndNormalBinormalTangentWS | — | — | — | — |
| ⏵RenamePair.Value | — | — | — | — |
@@@ SparseVolumeTexture
| LoadSparseVolumeTexture | — | — | — | — |
| SampleSparseVolumeTexture | — | — | — | — |
| GetSparseVolumeTextureDimensions | — | — | — | — |
| GetSparseVolumeTextureNumMipLevels | — | — | — | — |
| RequestSparseVolumeTextureFrame | — | — | E,G✗ | — |
| GetSparseVolumeTextureNumFrames | — | — | — | — |
@@@ Spline
| SampleSplinePositionByUnitDistance | — | — | — | — |
| SampleSplinePositionByUnitDistanceWS | — | — | — | — |
| SampleSplineRotationByUnitDistance | — | — | — | — |
| SampleSplineRotationByUnitDistanceWS | — | — | — | — |
| SampleSplineDirectionByUnitDistance | — | — | — | — |
| SampleSplineDirectionByUnitDistanceWS | — | — | — | — |
| SampleSplineUpVectorByUnitDistance | — | — | — | — |
| SampleSplineUpVectorByUnitDistanceWS | — | — | — | — |
| SampleSplineRightVectorByUnitDistance | — | — | — | — |
| SampleSplineRightVectorByUnitDistanceWS | — | — | — | — |
| SampleSplineTangentByUnitDistance | — | — | — | — |
| SampleSplineTangentByUnitDistanceWS | — | — | — | — |
| GetSplineLocalToWorld | — | — | — | — |
| GetSplineLocalToWorldInverseTransposed | — | — | — | — |
| FindClosestUnitDistanceFromPositionWS | — | — | — | — |
| GetSplineLength | — | — | — | — |
@@@ SpriteRendererInfo
| IsValid | — | — | — | — |
| GetSourceMode | — | — | — | — |
| GetAlignment | — | — | — | — |
| GetFacingMode | — | — | — | — |
| GetSubUVDetails | — | — | — | — |
@@@ Texture
| LoadTexture2D | — | — | — | — |
| GatherRedTexture2D | — | — | — | — |
| SampleTexture2D | — | — | — | — |
| SamplePseudoVolumeTexture | — | — | — | — |
| GetTextureDimensions | — | — | — | — |
| GetNumMipLevels | — | — | — | — |
@@@ Vector2DCurve
| SampleVector2DCurve | — | — | — | — |
@@@ Vector4Curve
| SampleColorCurve | — | — | — | — |
@@@ VectorCurve
| SampleVectorCurve | — | — | — | — |
@@@ VectorField
| SampleField | — | — | — | — |
| LoadField | — | — | — | — |
| FieldDimensions | — | — | — | — |
| FieldTilingAxes | — | — | — | — |
| FieldBounds | — | — | — | — |
@@@ VirtualTextureSample
| SampleTexture2D | — | — | — | — |
| GetTextureDimensions | — | — | — | — |
| GetNumMipLevels | — | — | — | — |
@@@ VolumeCache
| SetFrame | — | — | E,G✗ | — |
| ReadFile | — | — | E,G✗ | — |
| GetNumCells | — | — | — | — |
| IndexToUnit | — | — | — | — |
| SampleCurrentFrameValue | — | — | ,C✗ | — |
| GetCurrentFrameValue | — | — | ,C✗ | — |
| GetCurrentFrameNumCells | — | — | ,C✗ | — |
@@@ VolumeTexture
| LoadVolumeTexture | — | — | ,C✗ | — |
| SampleVolumeTexture | — | — | ,C✗ | — |
| TextureDimensions3D | — | — | — | — |
@@@ SimpleCounter
| GetNextValue | — | — | — | — |
| Get | — | — | — | — |
| Set | — | — | E | — |
| Exchange | — | — | E | — |
| Add | — | — | E | — |
| Increment | — | — | E | — |
| Decrement | — | — | E | — |

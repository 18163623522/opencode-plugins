int3 BaseIndex = floor(FloatIndex);
// add particles to the current cell it occupies and the neighbors it overlaps
// It is important the particle is represented in all the cells it overlaps to
// correctly find colliding pairs of particles.
for (int x = 0; x <= 1; ++x) {
for (int y = 0; y <= 1; ++y) {
for (int z = 0; z <= 1; ++z) {
    int3 Index = BaseIndex +  int3(x,y,z);
    bool Success;
    NeighborGrid.AddParticle(Index.x, Index.y, Index.z, InstanceIdx, Success);


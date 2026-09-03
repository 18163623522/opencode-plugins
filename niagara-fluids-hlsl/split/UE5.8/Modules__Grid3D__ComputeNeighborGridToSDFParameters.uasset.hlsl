// max search radius for neighbor query
static const int MaxRadius = 5;
// how many cells outisde of a particle do we compute distance values for
HalfBandwidth = SmoothingRadius + 1;
// final radius of particles for rasterizing into SDF
ParticleRadius = max(SimDx * .5 * RadiusMult, SDFDx * .5);
// max distance stored in SDF from particles
SDFMaxDistance = SDFDx * (HalfBandwidth);
// value for all unset cells is 1 cell beyond what we encode from particles (for sphere tracing)
SDFFillValue = SDFMaxDistance + SDFDx;
// the max distance from a particle (ie: radius) in world space that is rasterized into
// the grid
RasterizationRadius = ParticleRadius + SDFMaxDistance;
// how many cells in the NQ do we need to search in order to capture the rasterization radius
SearchRadius = min(MaxRadius, max(1, int(ceil((RasterizationRadius + .5 * SDFDx) / SimDx))));
// etc
BreakMargin = (0.5 * sqrt(3.0) + 0.5) * SimDx - 0.5 * SDFDx;
;ğ/G°
eÏ,;åF­HqòeH»¨[IÓ|f
 G¨RêşaéŞZ
 G¨RêşaéŞZ{
eÏ,;åF­HqòeH»
Áƒ*—ö¥€.;ÄÑ


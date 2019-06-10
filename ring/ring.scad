/* # Butterfly Ring
 * A butterfly ring, for Robin
 *
 * ## Parameters
 * The following parameters are used in shaping the ring.
 *
 * * _diameter_: the inner diameter of the ring.
 * * _width_: the width of the ring.
 * * _height_: the thickness of the ring.
 * * _bulge_: how high is the pentagonal ridge.
 * *_corner_radius_: how round are the edges
 *
 */

diameter=16;
width=8;
height=1;
bulge=0.4;
corner_radius=0.4;

ring(diameter/2, width, height, bulge, corner_radius);
*profile(width, height, bulge, corner_radius);

module ring(radius= 5, width=25, height=20, bulge=3, corner_radius=3) {
  rotate_extrude() translate([radius, 0, 0]) rotate([0, 0, -90]) profile(width, height, bulge, corner_radius);
}

module profile(width, height, bulge, corner_radius) {
  hull() {
    stamp_pattern(width, height, bulge, corner_radius) circle(r=corner_radius); 
  }
}

module stamp_pattern(width, height, bulge, corner_radius) {
    translate([-(width/2 - corner_radius), corner_radius, 0]) children();
    translate([ (width/2 - corner_radius), corner_radius, 0]) children();
    translate([-(width/2 - corner_radius), height-corner_radius, 0]) children();
    translate([ (width/2 - corner_radius), height-corner_radius, 0]) children();
    translate([0, height-corner_radius+bulge,0]) children();
}
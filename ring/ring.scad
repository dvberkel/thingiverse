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

/* butterfly parameters */
bufferfly_height=1;
butterfly_size=20;

/* ring parameters */
ring_diameter=16;
ring_width=8;
ring_height=1;
ring_bulge=0.4;
ring_corner_radius=0.4;

butterfly(bufferfly_height, butterfly_size);

*ring(ring_diameter/2, ring_width, ring_height, ring_bulge, ring_corner_radius);
*profile(ring_width, ring_height, ring_bulge, ring_corner_radius);

module butterfly(height=1, size=20) {
  linear_extrude(height) butterfly_shape(size);
}

module butterfly_shape(size) {
  resize([size, size, 1]) union() {
    square(8, center=true);
    symmetric() {
      translate([5, 4, 0]) circle(d=12);
      translate([4, -5, 0]) circle(d=9);
    }
  }
}

module symmetric() {
  children();
  mirror([1, 0, 0]) children();
}

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
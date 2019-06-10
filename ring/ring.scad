/* # Butterfly Ring
 * A butterfly ring, for Robin
 *
 * ## Parameters
 * The following parameters are used in shaping the ring.
 *
 * ### Butterfly
 *
 * * _butterfly_height_: the thickness of butterfly.
 * * _butterfly_size_: the bounding square of the butterfly.
 * * _butterfly_stem_height: the height of the stem;
 * * _butterfly_stem_diameter: the diameter of the stem;
 *
 * ### Ring
 * 
 * * _diameter_: the inner diameter of the ring.
 * * _width_: the width of the ring.
 * * _height_: the thickness of the ring.
 * * _bulge_: how high is the pentagonal ridge.
 * * _corner_radius_: how round are the edges
 *
 */

/* butterfly parameters */
bufferfly_height=1;
butterfly_size=20;
butterfly_stem_height= 5;
butterfly_stem_diameter=6;
tolerance=0.3;

/* ring parameters */
ring_diameter=16;
ring_width=8;
ring_height=1;
ring_bulge=0.4;
ring_corner_radius=0.4;

/* print separation */
distance = 20;

translate([-distance/2, 0, 0]) butterfly(bufferfly_height, butterfly_size, ring_height + ring_bulge, butterfly_stem_diameter);
translate([ distance/2, 0, ring_width/2]) ring(ring_diameter/2, ring_width, ring_height, ring_bulge, ring_corner_radius, butterfly_stem_diameter + tolerance);

module butterfly(height=1, size=20, connector_height, connector_diameter) {
  union() {
    linear_extrude(height) butterfly_shape(size);
    translate([0, 0, height]) connector(connector_height, connector_diameter);
  }
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

module connector(height, diameter) {
  cylinder(h=height, d=diameter);
}

module ring(radius= 5, width=25, height=20, bulge=3, corner_radius=3, connector_diameter=20) {
  difference () {
    rotate_extrude() translate([radius, 0, 0]) rotate([0, 0, -90]) profile(width, height, bulge, corner_radius);
    rotate([0, 90, 0]) cylinder(h=2*radius, d=connector_diameter);
  }
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
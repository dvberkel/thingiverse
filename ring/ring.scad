/*
 * A butterfly ring, for Robin
 *
 */

profile();

module profile(width=25, height=20, bulge=3, corner_radius=3) {
  hull() {
    translate([-(width/2 - corner_radius), corner_radius, 0]) circle(r=corner_radius);
    translate([ (width/2 - corner_radius), corner_radius, 0]) circle(r=corner_radius);
    translate([-(width/2 - corner_radius), height-corner_radius, 0]) circle(r=corner_radius);
    translate([ (width/2 - corner_radius), height-corner_radius, 0]) circle(r=corner_radius);
    translate([0, height-corner_radius+bulge,0]) circle(r=corner_radius);
  }
}
/*
 * A butterfly ring, for Robin
 *
 */

profile();

module profile(width=25, height=20, bulge=3, corner_radius=3) {
  hull() {
    stamp_pattern(width, height, bulge) circle(r=corner_radius); 
  }
}

module stamp_pattern(width=25, height=20, bulge=3, corner_radius=3) {
    translate([-(width/2 - corner_radius), corner_radius, 0]) children();
    translate([ (width/2 - corner_radius), corner_radius, 0]) children();
    translate([-(width/2 - corner_radius), height-corner_radius, 0]) children();
    translate([ (width/2 - corner_radius), height-corner_radius, 0]) children();
    translate([0, height-corner_radius+bulge,0]) children();
}
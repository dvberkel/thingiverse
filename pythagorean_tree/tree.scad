/* # Parameterized Pythagorean Tree
 *
 * A _Pythagorean Tree_ is a
 *
 * > plane fractal constructed from squares
 *
 * ## Parameters
 *
 * * **depth**: the maximum number of levels to render.
 * * **angle**: the angle which the next square is rotated.
 * * **size**: the size of the side of the base square.
 * * **fill**: whether to add the triangles.
 * 
 */

linear_extrude(5) tree(depth = 3, angle=30, size=50, fill=false);

module tree(depth=2, angle=45, size=10, fill=true){
  union() {
    square([size, size]);
    if (depth != 0) {
      translate([0, size, 0]) rotate(angle) tree(depth=depth-1, angle=angle, size=size*cos(angle), fill=fill);
      translate([size*(1+cos(2*angle))/2, size*(1+sin(2*angle)/2), 0]) rotate(angle-90) tree(depth=depth-1, angle=angle, size=size*sin(angle), fill=fill);
      if (fill) {
        translate([0, size, 0]) polygon([[0,0], [size,0], [size*sin(angle), size*cos(angle)]]);
      }
    }
  }  
}
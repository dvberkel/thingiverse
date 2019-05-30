/* # Steinmetz solid
 *
 * A _Steinmetz solid_ is
 *
 * > the solid body obtained as the intersection of two or three cylinders of equal radius at right angles.
 *
 * ## Parameters
 *
 * * **size**: determines how big the Steinmetz solid is.
 * * **three**: a boolean controlling the number of cylinders.
 */

$fn=100;

steinmetz(three=false);

module steinmetz(size=10, three=false) {
  intersection() {
    rotate([ 0, 0, 0]) cylinder(h=size, d=size, center=true);
    rotate([90, 0, 0]) cylinder(h=size, d=size, center=true);
    if (three) {
      rotate([0, 90, 0]) cylinder(h=size, d=size, center=true);
    }
   }
}

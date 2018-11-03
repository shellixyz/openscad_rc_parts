
use <openscad_library/cube.scad>;

$fs = 0.1;
$fa = 3;

module power_filter() {
    difference() {
        union() {
            cube2([34.6, 13.5, 1.6], center_xy = true); // PCB
            translate([-34.6/2+5.5+10/2, 0, 1.6]) cylinder(d=10, h=11); // big cap
            translate([34.6/2 - 12.25 - 6, 0, 1.6]) cube2([12.25, 12.25, 7.6], center_y = true); // big inductor
            translate([0, 0, -1.6]) cube2([24, 10, 1.7+0.1], center_xy = true); // bottom components
        }
        for (xm = [0, 1]) mirror([xm, 0, 0]) for (ym = [0, 1]) mirror([0, ym, 0]) translate([-34.6/2 + 1 + 2.3/2, 5/2, -1]) cylinder(d=2.3, h=1.6+2); // connections
    }
}
power_filter();


use <openscad_library/cube.scad>;

runcam_eagle_mounting_holes_pos = [ 1.8, 6.8 ];

function runcam_eagle_mounting_holes_pos() = runcam_eagle_mounting_holes_pos;

module runcam_eagle(lens_cap = false) {
    difference() {
        union() {
            hull() { // body
                cube_rounded_vertical_edges([26.4, 26.4, 11], 2.5, center_xy = true);
                translate([0, 0, 11]) cylinder(d1=20, d2=15.4, h=20-11);
            }
            for (my = [0, 1]) mirror([0, my, 0]) translate([0, 26.4/2, 0]) cube2([5, 0.8, 9], center_x = true); // ears
            for (mxy = [0, 1]) mirror([mxy, mxy, 0]) translate([-26.4/2 + 3, -26.4/2 + 3, -1]) cylinder(d=2.9, h=2); // screw heads
            translate([1.6-26.4/2, 26.4/2-15-1.9, -2]) cube([3.5, 15, 3]); // connector
            translate([0, 0, 20]) cylinder(d=14.8, h=3); // lock ring
            translate([0, 0, 20+3]) cylinder(d=11.9, h=4.3); // lens thread
            translate([0, 0, 20+3+4.3]) cylinder(d=17.5, h=4.3); // lens end
            if (lens_cap) translate([0, 0, 20+3+4.3]) cylinder(d=20, h=4.3+1.3); // lens end
        }
        for (z = runcam_eagle_mounting_holes_pos) translate([0, 0, z]) rotate([90, 0, 0]) cylinder(d=1.6, h=30, center=true);
    }
}
runcam_eagle();


clr = 0.15;

XT60_size = [16, 8.35, 16.35]; // w h l
XT60_straight_length = 13;
XT60_pin_distance_from_border = 4.5;
XT60_pin_dia = 4.2;
XT60_pin_length = 4;

use <openscad_library/cube.scad>;

module XT60_male_space_positive(oversize=[2 * clr, 2 * clr, 1 + 2.5 + clr], pin_length = XT60_pin_length, pin_oversize = 2) {
  bevel_points_offset = (XT60_size[0] - XT60_straight_length) * tan(45);
  echo(bevel_points_offset);
  scale([1 + oversize[0] / XT60_size[0], 1 + oversize[1] / XT60_size[1], 1 + oversize[2] / XT60_size[2]]) {
    linear_extrude(height = XT60_size[2]) polygon(points=[[0, 0], [XT60_straight_length, 0], [XT60_size[0], bevel_points_offset], [XT60_size[0], XT60_size[1] - bevel_points_offset], [XT60_straight_length, XT60_size[1]], [0, XT60_size[1]]]);
    hull() {
      translate([XT60_pin_distance_from_border, XT60_size[1] / 2, XT60_size[2] - 1]) cylinder(d=XT60_pin_dia + pin_oversize, h=pin_length+1);
      translate([XT60_size[0] - XT60_pin_distance_from_border, XT60_size[1] / 2, XT60_size[2] - 1]) cylinder(d=XT60_pin_dia + pin_oversize, h=pin_length+1);
    }
  }
}
/*XT60_male_space_positive();*/

module XT60E_M() {
    difference() {
        union() {
            cube2([4, 27.15, 8.25], center_y = true);
            translate([-3.1, 0, 0]) cube2([11.8, 15.6, 8.25], center_y = true);
            translate([11.8 - 3.1 - 0.8, 0, -(9 - 8.25) / 2]) cube2([0.8, 10.5, 9], center_y = true);
            for (yf = [-1, 1]) translate([11.8 - 3.1, yf * 7.2 / 2, 8.25 / 2]) rotate([0, 90, 0]) cylinder(d=4.3, h=5);
        }
        for (ym = [0, 1]) mirror([0, ym, 0]) translate([-1, 27.15 / 2 - (27.15-15.6) / 4, 8.25 / 2]) rotate([0, 90, 0]) cylinder(d=3, h=4+2);
    }
}
/*XT60E_M();*/

XT60E_M_screw_head_thickness = 1.8;
XT60E_M_screw_head_dia = 5;
XT60E_M_screw_head_space = XT60E_M_screw_head_dia + 4 * clr;
XT60E_M_screw_dia = 2.5;
XT60E_M_screw_hole_dia = XT60E_M_screw_dia + 2 * clr;

module XT60E_M_space_positive(screw_base_thickness = 2, oversize = 4 * clr, mount_thickness_oversize = 4 * clr, length_front = 20, length_back = 30, screw_hole_length = 30, screw_head_space_length = 18 - XT60E_M_screw_head_thickness) {
    cube2([4 + mount_thickness_oversize, 27.15 + oversize, 8.25 + oversize], center_y = true);
    translate([-length_front, 0, 0]) cube2([length_front + length_back, 15.6 + oversize, 8.25 + oversize], center_y = true);
    for (ym = [0, 1]) mirror([0, ym, 0]) translate([0, 27.15 / 2 - (27.15-15.6) / 4, 8.25 / 2]) {
        translate([-(screw_base_thickness + 0.1), 0, 0]) rotate([0, 90, 0]) cylinder(d=XT60E_M_screw_hole_dia, h=screw_hole_length + screw_base_thickness + 0.1);
        translate([-screw_base_thickness, 0, 0]) rotate([0, -90, 0]) cylinder(d1=XT60E_M_screw_hole_dia, d2=XT60E_M_screw_head_space + 0.01, h=XT60E_M_screw_head_thickness + 0.01);
        translate([-(screw_base_thickness + screw_head_space_length + XT60E_M_screw_head_thickness), 0, 0]) rotate([0, 90, 0]) cylinder(d=6.5, h=screw_head_space_length);
    }
}
/*XT60E_M_space_positive();*/

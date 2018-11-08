
fc_size = 36;
fc_holes_distance = 31;
fc_holes_dia = 3;
fc_pcb_thickness = 2.5;
fc_space = 3;

fc_usb_space_size = [14, 8]; // X, Y
fc_usb_space_pos = [ 18, -fc_usb_space_size[1] + fc_pcb_thickness + 1 ]; // X, Z
fc_sd_space_size = [ 18, 5];
fc_sd_space_pos = [ 11.5-3, 0];

fc_standoff_dia = 8;
fc_standoff_height = 8;
fc_standoff_bolt_dia = 3;
fc_standoff_hole_dia = 3;
fc_standoff_bolt_length = 6;

fc_hole_inset = (fc_size - fc_holes_distance) / 2;
fc_corner_radius = fc_hole_inset;

use <openscad_library/cube.scad>;
use <openscad_library/mirror.scad>;

module fc(ports = false, center_xy = false, center_x = false, center_y = false) {
  translate([(center_xy || center_x || center_xy ? -fc_size/2 : 0), (center_xy || center_y ? -fc_size/2 : 0), 0]) difference() {
    cube_rounded_vertical_edges([fc_size, fc_size, fc_pcb_thickness], fc_corner_radius);
    for (xf = [-1, 1]) for (yf = [-1, 1]) translate([(fc_size + xf * fc_holes_distance) / 2, (fc_size + yf * fc_holes_distance) / 2, -1]) cylinder(d=fc_holes_dia, h=fc_pcb_thickness+2);
  }
  if (ports) fc_ports();
}
/*fc();*/
/*fc(ports=true);*/

module fc_ports() {
  translate([fc_usb_space_pos[0], fc_size, fc_usb_space_pos[1]]) cube([fc_usb_space_size[0], 50, fc_usb_space_size[1]]);
  translate([fc_sd_space_pos[0], fc_size, fc_sd_space_pos[1]]) cube([fc_sd_space_size[0], 50, fc_sd_space_size[1]]);
  translate([10, fc_size, -2]) rotate([-90, 0, 0]) cylinder(d=5, h=50);
}
/*!fc_ports();*/

module fc_standoff() {
  difference() {
    cylinder(d=fc_standoff_dia, h=fc_standoff_height);
    translate([0, 0, 1]) cylinder(d=fc_standoff_hole_dia, h=fc_standoff_height);
  }
  translate([0, 0, -fc_standoff_bolt_length]) cylinder(d=fc_standoff_bolt_dia, h=fc_standoff_bolt_length);
}
/*fc_standoff();*/

module fc_holes_pattern(d, h) {
  fc_mounting_pattern() cylinder(d=d, h=h);
}
/*fc_holes_pattern(3, 1);*/

module fc_mounting_pattern() {
  for (xf = [-1, 1]) for (yf = [-1, 1]) translate([(xf * fc_holes_distance) / 2, (yf * fc_holes_distance) / 2, 0]) children();
}
/*fc_mounting_pattern() cylinder(d=3, h=3);*/

pixhawk_border_size = [81.3, 49.3];
pixhawk_center_section_size = [42, 44.8];
pixhawk_thickness= 15.9;
pixhawk_size_transition_length = 5;

module pixhawk() {
    cube2([pixhawk_center_section_size[0], pixhawk_center_section_size[1], pixhawk_thickness], center_xy=true);
    mirror_copy_x() hull() {
        translate([pixhawk_center_section_size[0] / 2 - 0.01, 0, 0]) cube2([0.01, pixhawk_center_section_size[1], pixhawk_thickness], center_y=true);
        translate([pixhawk_center_section_size[0] / 2 + pixhawk_size_transition_length, 0, 0]) cube2([(pixhawk_border_size[0] - pixhawk_center_section_size[0]) / 2 - pixhawk_size_transition_length, pixhawk_border_size[1], pixhawk_thickness], center_y=true);
    }
}
/*pixhawk();*/

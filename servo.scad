servo_body_size = [ 12.5, 22.7 ];
servo_body_height = 23;
servo_body_lower_part_height = 18.5;
servo_mount_length = 32.4;
servo_mount_ear_width = (servo_mount_length - servo_body_size[1]) / 2;
servo_mount_thickness = 2.8;
servo_mount_z_pos = 18.8;
servo_tower_height = 5.8;
servo_shaft_dia = 4.6;
servo_shaft_length = 3.9;
servo_mount_hole_dia = 2.2;
servo_mount_screw_hole_dia = 1; // used for mounting_holes == integer
servo_mount_hole_offset = 2.5;
servo_mount_to_top_distance = 12.8;
servo_shaft_offset_from_center = servo_body_size[0];
servo_height_with_horn = 34;

servo_horn_base_dia = 6.8;
servo_horn_base_thickness = 4.6;
servo_horn_horn_base_dia = 4.8;
servo_horn_horn_end_dia = 3.8;
servo_horn_horn_thickness = 1.8;
servo_horn_length = 14;

module MG90S_servo(oversize_xy = 0, mounting_holes = true, horn_angle = 0, rod_link = false) {
  /*translate([(servo_body_size[0] + 2 * oversize_xy) / 2, 0, 0]) difference() {*/
  translate([0, -(servo_body_size[0] + 2 * oversize_xy) / 2, 0]) difference() {
    union() {
      translate([0, (servo_body_size[1] + 2 * oversize_xy) / 2, 0]) {
	translate([0, 0, servo_body_height / 2]) cube([servo_body_size[0] + 2 * oversize_xy, servo_body_size[1] + 2 * oversize_xy, servo_body_height], center=true);
	translate([0, 0, servo_mount_thickness / 2 + servo_mount_z_pos]) cube([servo_body_size[0] + 2 * oversize_xy, servo_mount_length + 2 * oversize_xy, servo_mount_thickness], center=true);
      }
      translate([0, (servo_body_size[0] + 2 * oversize_xy) / 2, servo_body_height]) union() {
	cylinder(d=servo_body_size[0] + 2 * oversize_xy, h=servo_tower_height);
	translate([0, 6, 0]) cylinder(d=5 + 2 * oversize_xy, h=servo_tower_height);
	translate([0, 0, servo_tower_height]) cylinder(d=servo_shaft_dia + 2 * oversize_xy, h=servo_shaft_length);
      }
    }
    if ((oversize_xy == 0) && (mounting_holes == true)) for (yoff = [-servo_mount_hole_offset, servo_body_size[1] + servo_mount_hole_offset]) translate([0, yoff, 0]) cylinder(d=servo_mount_hole_dia, h=servo_body_height);
  }
  if ((mounting_holes != true) && (mounting_holes != false)) for (yoff = [-servo_mount_hole_offset, servo_body_size[1] + servo_mount_hole_offset]) translate([0, yoff - 1 * (servo_body_size[0] + 2 * oversize_xy) / 2, servo_mount_z_pos - mounting_holes]) cylinder(d=servo_mount_screw_hole_dia, h=servo_mount_thickness + 2 * mounting_holes);
  if (horn_angle != false) translate([0, 0, 28.8 + 0.5]) {
    rotate(90 + horn_angle) mirror([0, 0, 1]) translate([0, 0, -servo_horn_base_thickness]) servo_horn();
    if (rod_link) translate([-servo_horn_length * sin(horn_angle), 0 * servo_horn_length + servo_horn_length * cos(horn_angle), servo_horn_base_thickness - servo_horn_horn_thickness / 2]) servo_rod_link();
  }
}
MG90S_servo();
/*MG90S_servo(2 * tol);*/
/*MG90S_servo(2 * tol, 4);*/
/*!MG90S_servo(0, true, 35);*/
/*!rotate([90, 0, 0]) rotate(180) MG90S_servo(0, true, 35);*/
/*!translate([0, servo_body_size[0] / 2 + 1 * (servo_mount_length - servo_body_size[1]) / 2, 0]) MG90S_servo(0, true, 0);*/
/*!translate([0, 0, servo_body_size[0] + (servo_mount_length - servo_body_size[1]) / 2]) rotate([90, 0, 0]) rotate(180) MG90S_servo(0, true, 0);*/

module servo_horn(show_base = true) {
  if (show_base) cylinder(d=servo_horn_base_dia, h=servo_horn_base_thickness);
  difference() {
    hull() {
      cylinder(d=servo_horn_horn_base_dia, h=servo_horn_horn_thickness);
      translate([servo_horn_length, 0, 0]) cylinder(d=servo_horn_horn_end_dia, h=servo_horn_horn_thickness);
    }
    translate([servo_horn_length, 0, -1]) cylinder(d=1, h=servo_horn_horn_thickness + 2);
  }
}
/*!servo_horn();*/


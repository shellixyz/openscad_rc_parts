// motor = DYS2836
motor_dia = 25;
motor_length = 31;
motor_shaft_ring_dia = 9;
motor_shaft_ring_length = 4;
motor_shaft_dia = 4;
motor_shaft_length = 12.5;
motor_base_to_prop_base = 44;

module motor() {
  cylinder(d=motor_dia, h=motor_length);
  translate([0, 0, motor_length]) cylinder(d=motor_shaft_ring_dia, h=motor_shaft_ring_length);
  translate([0, 0, motor_length + motor_shaft_ring_length]) cylinder(d=motor_shaft_dia, h=motor_shaft_length);
}
/*motor();*/

module motor_hole_pattern(spacing, d, h) {
  for (xf = [-1, 1]) translate([xf * spacing[0] / 2, 0, 0]) cylinder(d=d, h=h);
  for (yf = [-1, 1]) translate([0, yf * spacing[1] / 2, 0]) cylinder(d=d, h=h);
}
/*motor_hole_pattern([16, 19], 3, 1);*/

module motor_hole_pattern_16_19(d, h) {
    motor_hole_pattern([16, 19], d, h);
}

/*motor_hole_pattern_16_19(3, 1);*/

prop_size = 9;
prop_dia = prop_size * 25.4;
prop_hub_thickness = 11;
prop_hub_dia = 20;

module propeller() {
  cylinder(d=prop_hub_dia, h=prop_hub_thickness, center=true);
  for (a = [0, 180]) rotate(a) translate([prop_dia / 4, 0, 0]) rotate([45, 0, 0]) cube([prop_dia / 2, 13, 2], center=true);
}
/*propeller();*/

module motor_with_propeller() {
  motor();
  translate([0, 0, prop_hub_thickness / 2 + motor_base_to_prop_base]) propeller();
}
motor_with_propeller();

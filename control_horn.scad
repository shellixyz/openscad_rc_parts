
$fa = 5;
$fs = 0.1;

clr = -0.02;

height = 2;
hole_dia = 1.8;

difference() {
  union() {
    intersection() {
      translate([-111, -71, 0]) linear_extrude(height=height) projection() import("control_horn_base.stl");
      cube([40,40,10]);
    }
    translate([37.5, 10, 0]) cylinder(d=2.8, h=height);
    translate([37.5, 13, 0]) cylinder(d=2.8, h=height);
    translate([37.5, 16, 0]) cylinder(d=2.8, h=height);
  }

  translate([37.5, 15.5, -1]) cylinder(d=hole_dia+2*clr, h=height+2);
}

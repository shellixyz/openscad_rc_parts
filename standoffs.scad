
$fs = 0.1;
$fa = 3;

module standoff(dia, height, screw_length, screw_dia, screw_hole_dia, screw_hole_depth, style="round") {
    difference() {
        union() {
            if (style == "round")
                cylinder(d=dia, h=height);
            else
                cylinder(r=dia/sqrt(3), h=height, $fn=6);
            translate([0, 0, -screw_length]) cylinder(d=screw_dia, h=screw_length+0.1);
        }
        translate([0, 0, height - screw_hole_depth]) cylinder(d=screw_hole_dia, h=screw_hole_depth + 1);
    }
}

realacc_rubber_standoff_dia = 6;
realacc_rubber_standoff_height = 7;
realacc_rubber_standoff_screw_length = 4.5;
realacc_rubber_standoff_screw_dia = 3;
realacc_rubber_standoff_screw_hole_dia = 2.5;
realacc_rubber_standoff_screw_hole_depth = 3;

module realacc_rubber_standoff() {
    standoff(realacc_rubber_standoff_dia, realacc_rubber_standoff_height, realacc_rubber_standoff_screw_length, realacc_rubber_standoff_screw_dia, realacc_rubber_standoff_screw_hole_dia, realacc_rubber_standoff_screw_hole_depth);
}
/*realacc_rubber_standoff();*/

noname_rubber_standoff_dia = 8.3;
noname_rubber_standoff_height = 8.3;
noname_rubber_standoff_screw_length = 6;
noname_rubber_standoff_screw_dia = 3;
noname_rubber_standoff_screw_hole_dia = 2.5;
noname_rubber_standoff_screw_hole_depth = 3;

module noname_rubber_standoff() {
    standoff(noname_rubber_standoff_dia, noname_rubber_standoff_height, noname_rubber_standoff_screw_length, noname_rubber_standoff_screw_dia, noname_rubber_standoff_screw_hole_dia, noname_rubber_standoff_screw_hole_depth);
}
/*noname_rubber_standoff();*/

standoff_dia = 5.5;
standoff_screw_length = 6;
standoff_screw_dia = 3;
standoff_screw_hole_dia = 2.5;
standoff_screw_hole_depth = 4.4;

module standoff_base(height) {
  standoff(standoff_dia, height, standoff_screw_length, standoff_screw_dia, standoff_screw_hole_dia, standoff_screw_hole_depth, style="hex");
}
/*standoff_base(6);*/

module standoff_6mm() {
    standoff_base(6);
}
/*standoff_6mm();*/

module standoff_8mm() {
    standoff_base(8);
}
/*standoff_8mm();*/

module standoff_10mm() {
    standoff_base(10);
}
/*standoff_10mm();*/

module standoff_12mm() {
    standoff_base(12);
}
/*standoff_12mm();*/

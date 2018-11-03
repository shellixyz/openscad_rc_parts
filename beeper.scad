
clr = 0.15;

beeper_dia = 9;
beeper_height = 5.6;
beeper_pin_distance = 5;

beeper_pocket_base_dia = beeper_dia + 4 * clr;
beeper_pocket_base_height = 1.5;
beeper_pocket_space_dia = beeper_dia + 2;
beeper_pocket_space_height = beeper_height + 1.5;
beeper_pocket_wire_passage_dia = beeper_pin_distance + 2;

beeper_cover_dia = beeper_pocket_space_dia + 2 * 1;
beeper_cover_hole_dia = 3;
beeper_cover_thickness = 1;


module beeper_pocket_positive(beeper_wire_passage_height) {
  cylinder(d=beeper_pocket_base_dia, h=beeper_pocket_base_height + 0.01);
  translate([0, 0, beeper_pocket_base_height]) cylinder(d=beeper_pocket_space_dia, h=beeper_pocket_space_height - beeper_pocket_base_height + 0.01);
  translate([0, 0, beeper_pocket_space_height]) cylinder(d=beeper_cover_dia + 4 * clr, h=beeper_cover_thickness + 2 * clr + 1);
  translate([0, 0, -beeper_wire_passage_height + 0.01]) cylinder(d=beeper_pocket_wire_passage_dia, h=beeper_wire_passage_height + 0.01);
}
/*beeper_pocket_positive(10);*/

module beeper_cover() {
  difference() {
    cylinder(d=beeper_cover_dia, h=beeper_cover_thickness);
    translate([0, 0, -1]) cylinder(d=beeper_cover_hole_dia, h=beeper_cover_thickness+2);
  }
}
/*beeper_cover();*/

beeper_pocket_od = beeper_cover_dia + 2;
beeper_pocket_bottom_thickness = 1;
beeper_pocket_height = beeper_pocket_bottom_thickness + beeper_pocket_space_height + beeper_cover_thickness + 2 * clr;
beeper_pocket_min_height = beeper_pocket_space_height + beeper_cover_thickness + 2 * clr;

module beeper_pocket(height = beeper_pocket_height) {
    difference() {
        cylinder(d=beeper_pocket_od, h=height);
        translate([0, 0, height - beeper_pocket_min_height]) beeper_pocket_positive(height - beeper_pocket_min_height + 1);
    }
}
/*beeper_pocket();*/
/*beeper_pocket(20);*/

module beeper_pocket_assembled(height = beeper_pocket_height) {
  beeper_pocket(height);
  /*translate([0, 0, beeper_pocket_bottom_thickness + beeper_pocket_space_height + 2 * clr]) beeper_cover();*/
  translate([0, 0, height - beeper_cover_thickness]) beeper_cover();
}
/*beeper_pocket_assembled(20);*/


clr = 0.15;

use <openscad_library/cube.scad>;
use <openscad_library/mirror.scad>;

module module_retainer(space_size, wall_thickness, corner_radius, height, screw_block_size, screw_hole_dia, screw_block_corner_radius) {
    retainer_size = [ space_size[0] + 2 * wall_thickness, space_size[1] + 2 * wall_thickness, height ];
    difference() {
        cube_rounded_vertical_edges(retainer_size, corner_radius, center_xy = true);
        translate([0, 0, -1]) cube2([space_size[0] - 2 * wall_thickness, retainer_size[1] + 2, retainer_size[2] + 2], center_xy = true);
        translate([0, 0, -1]) cube2([retainer_size[0] + 2, space_size[1] - 2 * wall_thickness, retainer_size[2] + 2], center_xy = true);
        translate([0, 0, -1]) cube2([space_size[0], space_size[1], retainer_size[2] + 2], center_xy = true);
    }
    difference() {
        cube_rounded_vertical_edges([screw_block_size[0], space_size[1] + 2 * screw_block_size[1], space_size[2]], screw_block_corner_radius, center_xy = true);
        translate([0, 0, -1]) cube2([space_size[0], space_size[1], space_size[2] + 2], center_xy = true);
        mirror_copy_y() translate([0, space_size[1] / 2 + screw_block_size[1] / 2, -1]) cylinder(d=screw_hole_dia, h=space_size[2] + 2);
    }
}
/*!module_retainer(ESC_retainer_space_size, ESC_retainer_wall_thickness, ESC_retainer_corner_radius, ESC_size[2] * 2 / 3, retainer_screw_block_size, retainer_screw_hole_dia, retainer_screw_block_corner_radius);*/

retainer_s_corner_radius = 2;
retainer_s_screw_block_corner_radius = 2;

module module_retainer_s(module_size, wall_thickness, screw_head_dia, screw_hole_dia) {
    space_size = [ module_size[0] + 6 * clr, module_size[1] + 6 * clr, module_size[2] + 6 * clr ];
    screw_block_size = [ screw_head_dia + 2, screw_head_dia + 1 ];
    module_retainer(space_size, wall_thickness, retainer_s_corner_radius, module_size[2] * 2 / 3, screw_block_size, screw_hole_dia, retainer_s_screw_block_corner_radius);
}
/*module_retainer_s();*/

module module_retainer_bar_s(module_size, thickness, screw_head_dia, screw_hole_dia) {
    space_size = [ module_size[0] + 6 * clr, module_size[1] + 6 * clr, module_size[2] + 6 * clr ];
    screw_block_size = [ screw_head_dia + 2, screw_head_dia + 1 ];
    difference() {
        cube_rounded_vertical_edges([screw_block_size[0], space_size[1] + 2 * screw_block_size[1], thickness], retainer_s_screw_block_corner_radius, center_xy = true);
        mirror_copy_y() translate([0, space_size[1] / 2 + screw_block_size[1] / 2, -1]) cylinder(d=screw_hole_dia, h=space_size[2] + 2);
    }
}
/*!module_retainer_bar();*/

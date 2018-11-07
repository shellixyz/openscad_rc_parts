
lidar_box_size = [ 32.8, 14.8, 11 ];
lidar_lens_height = 5;
lidar_ears_height = 5;
lidar_ears_width = 10;
lidar_ears_radius = 3;
lidar_mounting_holes_distance = 36;
lidar_mounting_holes_dia = 2.5;

use <openscad_library/cube.scad>;
use <openscad_library/mirror.scad>;

module benewake_tfmini_lidar(show_connector = true) {
    difference() {
        union() {
            /*cube2(lidar_box_size, center_xy = true);*/
            hull() {
                cube_rounded_vertical_edges([lidar_box_size[0], lidar_box_size[1], lidar_box_size[2] - 1], 2, center_xy = true);
                translate([0, 0, lidar_box_size[2] - 0.01]) cube_rounded_vertical_edges([lidar_box_size[0] - 1, lidar_box_size[1] - 1, 1], 1, center_xy = true);
            }
            hull() {
                cube2([lidar_box_size[0], lidar_ears_width, lidar_ears_height], center_xy = true);
                for (xf = [-1, 1]) translate([xf * lidar_mounting_holes_distance / 2, 0, 0]) cylinder(r=lidar_ears_radius, h=lidar_ears_height);
            }
            translate([lidar_box_size[0] / 2 - 11.5, 0, lidar_box_size[2]]) cylinder(d=11.3, h=lidar_lens_height);
            translate([-lidar_box_size[0] / 2 + 11.5, 0, lidar_box_size[2]]) cylinder(d=9.3, h=lidar_lens_height);
            if (show_connector) translate([0, -lidar_box_size[1] / 2 + 1, 0.2]) mirror_y() cube2([6.3, 6, 4.2], center_x = true);
        }
        for (xf = [-1, 1]) translate([xf * lidar_mounting_holes_distance / 2, 0, -1]) cylinder(d=lidar_mounting_holes_dia, h=lidar_ears_height + 2);
    }
}
benewake_tfmini_lidar();

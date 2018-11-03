
battery_size_infinity_3S_2200mAh = [ 106, 34, 26 ];
battery_size_infinity_4S_1500mAh = [ 85, 34.6, 31 ];

use <openscad_library/cube.scad>;

module battery_infinity_3S_2200mAh(center = false, center_xy = false, center_x = false, center_y = false, center_z = false) {
  cube2(battery_size_infinity_3S_2200mAh, center, center_xy, center_x, center_y, center_z);
}
/*battery_infinity_3S_2200mAh();*/

module battery_infinity_4S_1500mAh(center = false, center_xy = false, center_x = false, center_y = false, center_z = false) {
  cube2(battery_size_infinity_4S_1500mAh, center, center_xy, center_x, center_y, center_z);
}
/*battery_infinity_4S_1500mAh();*/

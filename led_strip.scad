
led_strip_8_with_diffuser_size = [ 67.5, 6.5, 14 ];

use <openscad_library/cube.scad>;

module led_strip_8_with_diffuser(center = false, center_xy = false, center_x = false, center_y = false, center_z = false) {
  cube2(led_strip_8_with_diffuser_size, center, center_xy, center_x, center_y, center_z);
}

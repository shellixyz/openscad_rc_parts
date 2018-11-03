
HC05_BT_module_size = [ 37.4, 16.4, 4.5 ];

use <openscad_library/cube.scad>;

function HC05_BT_module_size() = HC05_BT_module_size;

module HC05_bluetooth_module(center = false, center_xy=false, center_x = false, center_y = false, center_z = false) {
  cube2(HC05_BT_module_size, center, center_xy, center_x, center_y, center_z);
}

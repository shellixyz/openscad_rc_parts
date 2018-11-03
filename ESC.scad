
Racestar_30A_ESC_size = [ 35, 15, 5 ];

use <openscad_library/cube.scad>;

function Racestar_30A_ESC_size() = Racestar_30A_ESC_size;

module Racestar_30A_ESC(center = false, center_xy = false, center_x = false, center_y = false, center_z = false) {
    cube2(Racestar_30A_ESC_size, center, center_xy, center_x, center_y, center_z);
}
/*Racestar_30A_ESC();*/

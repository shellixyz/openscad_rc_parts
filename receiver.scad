
XSR_size = [ 27, 19.8, 5 ];
XSR_connector_size = [ 6, 8, 3.5 ];
XSR_connector_pos = [ 0.5, 3 ];

module XSR_receiver() {
  cube(XSR_size);
  translate([-2.5, XSR_size[1] - XSR_connector_size[1] - XSR_connector_pos[0], XSR_connector_pos[1]]) cube(XSR_connector_size);
  for (ypos = [2, 8.5]) translate([XSR_size[0], ypos, 3]) rotate([0, 90, 0]) cylinder(d=1.2, h=5);
}
/*XSR_receiver();*/

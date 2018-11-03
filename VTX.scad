
module TS5823L_VTX() {
    cube([26.1, 19.6, 8.2]); // main PCB + TX module + power supply + LED display + connector
    translate([-2.8, 0, 2]) cube([2.8, 8.8, 4]); // PCB part where the connector is soldered to
    translate([-(2.8 + 1.35), 0.8, 1.5]) cube([1.35, 6.6, 6.6]); // antenna connector square part
    translate([-(2.8 + 1.35), 0.8 + 6.6/2, 1.5 + 6.6/2]) rotate([0, -90, 0]) cylinder(d=6.2, h=8); //antenna connector cylindrical part
}
/*TS5823L_VTX();*/

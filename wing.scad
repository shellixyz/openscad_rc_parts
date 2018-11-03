
// define wing (use sweep distance, see custom wing 2 for sweep angle)
module custom_wing_1(wing_span, sweep_distance, root_chord, tip_chord, elevon_width = 60, elevon_sep = 1, elevon_int_offset = 20) {
  wing_length = wing_span / 2;
  wing_points = [[0, 0], [root_chord, 0], [sweep_distance + tip_chord, wing_length], [sweep_distance, wing_length]];
  /*wing_length = wing_points[3][1] - wing_points[0][1];*/
  echo(wing_length=wing_length);
  polygon(points=wing_points);
  trailing_angle = atan((wing_points[2][0] - wing_points[1][0])/(wing_points[3][1] - wing_points[0][1]));
  polygon(points=[[wing_points[1][0] + elevon_int_offset * sin(trailing_angle) + elevon_sep, wing_points[1][1] + elevon_int_offset * cos(trailing_angle)], [wing_points[1][0] + elevon_int_offset * sin(trailing_angle) + elevon_sep + elevon_width, wing_points[1][1] + elevon_int_offset * cos(trailing_angle)], [wing_points[1][0] + elevon_sep + elevon_width + wing_length * tan(trailing_angle), wing_points[2][1]], [wing_points[1][0] + elevon_sep + elevon_width + wing_length * tan(trailing_angle) - elevon_width, wing_points[2][1]]]);
}
custom_wing_1(wing_span = 2 * 461, sweep_distance = 360, root_chord = 320, tip_chord = 92);

// define wing (use sweep angle, see custom wing 2 for sweep distance)
module custom_wing_2(wing_span, sweep_angle, root_chord, tip_chord, elevon_width = 60, elevon_sep = 1, elevon_int_offset = 20) {
  custom_wing_1(wing_span, wing_span * tan(sweep_angle) / 2, root_chord, tip_chord, elevon_width, elevon_sep, elevon_int_offset);
}
/*!custom_wing_2(wing_span = 2 * 461, sweep_angle = 90-52, root_chord = 320, tip_chord = 92);*/


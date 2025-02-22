var vision_range_total = 0;
var movement_speed_total = 0;
var creatures = 0;
with o_creature {
	vision_range_total += vision_range;
	movement_speed_total += movement_speed;
	creatures++;
}

ds_list_add(vision_list, vision_range_total / creatures);
ds_list_add(speed_list, movement_speed_total / creatures);

alarm_set(0, 60);
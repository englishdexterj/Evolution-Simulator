if food_timer > 0 food_timer -= 1/global.game_speed;
else if global.food < food_max {
	var spawn_center_x = irandom(room_width);
	var spawn_center_y = irandom(room_height);
	var spawn_ang, spawn_dist;
	for (var i = 0; i < irandom_range(food_pocket_size_min, food_pocket_size_max); i++) {
		spawn_ang = random(360);
		spawn_dist = random(32);
		with instance_create_layer(spawn_center_x + lengthdir_x(spawn_dist, spawn_ang), spawn_center_y + lengthdir_y(spawn_dist, spawn_ang), "Instances", o_food) {
			decay = random_range(other.food_decay_min, other.food_decay_max);
		}
		global.food++;
	}
	
	food_timer = food_timer_max;
}
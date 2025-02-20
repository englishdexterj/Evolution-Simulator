age += 1 * (1/global.game_speed);

food -= .15 * (1/global.game_speed); //x% of 1 food lost per second
if reproduction_timer > 0 reproduction_timer -= 1/global.game_speed; //reduce reproduction timer

//die if out of food or far off map edge
if food <= 0 instance_destroy();
if x < -room_width or x > room_width*2 or y < -room_height or y > room_height*2 instance_destroy();
if x < 0 x = room_width;
if x > room_width x = 0;
if y < 0 y = room_height;
if y > room_height y = 0;

//search for food
var food_nearest = instance_nearest(x, y, o_food);

//eat food
if instance_place(x, y, o_food) {
	if food + food_nearest.food <= food_max {
		food += food_nearest.food;
		food_nearest.food = 0;
		instance_destroy(food_nearest);
	} else {
		food_nearest.food -= food_max - food;
		food = food_max;
	}
}

//reproduce
if food >= reproduction_threshold and reproduction_timer <= 0 and age >= reproduction_age {
	food -= reproduction_cost;
	sc_create_offspring();
}

var dir_weight = 0;

//move away from nearby creatures
var creature_nearest = instance_nth_nearest(x, y, o_creature, 2);
if distance_to_object(creature_nearest) <= vision_range {
	var _creature_dir = point_direction(x, y, creature_nearest.x, creature_nearest.y);
	
	var _diff_dir = _creature_dir - direction;
	if _diff_dir > 180 _diff_dir -= 360
	else if _diff_dir < -180 _diff_dir += 360
	
	dir_weight += -sign(_diff_dir);
}

//point towards food
if food < 0.9 && instance_exists(food_nearest) && distance_to_object(food_nearest) <= vision_range {
	var _food_dir = point_direction(x, y, food_nearest.x, food_nearest.y);
	
	var _diff_dir = _food_dir - direction;
	if _diff_dir > 180 _diff_dir -= 360
	else if _diff_dir < -180 _diff_dir += 360
	
	dir_weight += sign(_diff_dir) * 2;
}

image_angle += sign(dir_weight) * 5 + perlin_noise(0, .05) * 3;
direction = image_angle;

//move in current direction
x += lengthdir_x(movement_speed, direction);
y += lengthdir_y(movement_speed, direction);
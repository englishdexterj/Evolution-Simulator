age += 1;

food -= .01 * (1/60); //1% food lost per second

//die if out of food or far off map edge
if food <= 0 instance_destroy();
if x < -room_width or x > room_width*2 or y < -room_height or y > room_height*2 instance_destroy();

//search for food
var food_nearest = instance_nearest(x, y, o_food);

//eat food
if instance_place(x, y, o_food) {
	food = min(food_max, food + .5);
	instance_destroy(food_nearest);
}

//reproduce
if food >= reproduction_threshold {
	food -= reproduction_cost;
	sc_create_offspring();
}

//move away from nearby creatures
var creature_nearest = instance_nth_nearest(x, y, o_creature, 2);
if distance_to_object(creature_nearest) <= vision_range {
	image_angle = point_direction(x, y, creature_nearest.x, creature_nearest.y) + 180;
	direction = image_angle;
}

//point towards food
if instance_exists(food_nearest) && distance_to_object(food_nearest) <= vision_range {
	image_angle = point_direction(x, y, food_nearest.x, food_nearest.y);
	direction = image_angle;
}

//move in current direction
x += lengthdir_x(movement_speed, direction);
y += lengthdir_y(movement_speed, direction);
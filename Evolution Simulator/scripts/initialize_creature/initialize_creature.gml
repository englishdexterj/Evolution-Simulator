function initialize_creature() {
	reproduction_threshold = 0.8;
	reproduction_cost = 0.5;
	reproduction_age = 3;
	reproduction_timer = 0;
	reproduction_timer_max = 5;

	vision_range = (allele[0,0] + allele[0,1]) * 4;
	movement_speed = (allele[1,0] + allele[1,1]) / 40;
}
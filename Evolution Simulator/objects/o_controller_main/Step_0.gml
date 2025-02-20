if keyboard_check_pressed(ord("R")) {
	game_restart();
}

if keyboard_check_pressed(ord("W")) {
	game_set_speed(600, gamespeed_fps);
	global.game_speed = 600;
}

if keyboard_check_pressed(ord("S")) {
	game_set_speed(60, gamespeed_fps);
	global.game_speed = 60;
}
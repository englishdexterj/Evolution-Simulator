decay -= 1/global.game_speed;
if decay <= 0 instance_destroy();
image_alpha = min(decay/2, 1);

if x < 0 or x > room_width or y < 0 or y > room_height instance_destroy();
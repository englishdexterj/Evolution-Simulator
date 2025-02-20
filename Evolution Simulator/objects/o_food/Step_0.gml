decay -= 1/60;
if decay <= 0 instance_destroy();
image_alpha = min(decay/2, 1);

if x < 0 or x > room_width or y < 0 or y > room_height instance_destroy();
draw_text(8, 8, "Food: " + string(global.food));
draw_text(8, 24, "Creatures: " + string(global.creatures));
draw_text(8, 40, "Game Speed: " + string(fps) + " Histogram: " + string(histogram));

for (var j = 0; j < 2; j++) {
	var allele_map = count_allele_pairs(j);

	var allele_keys = ds_map_keys_to_array(allele_map);
	var allele_values = ds_map_values_to_array(allele_map);

	var allele_text = "Allele ";
	for (var i = 0; i < array_length(allele_keys); i++) {
		allele_text = allele_text + string(allele_keys[i]) + "[" + string(allele_values[i]) + "] ";
	}
	draw_text(8, 56 + j * 16, allele_text);
}

draw_set_halign(fa_left);
for (var i = 0; i < ds_list_size(buttons); i++) {
	var _button = ds_list_find_value(buttons, i);
	
	draw_sprite_stretched(_button.sprite, _button.sprite_subimg, _button.x, _button.y, _button.width, _button.height);
	draw_text(_button.x + _button.width * 1.1, _button.y, _button.name);
}

draw_set_halign(fa_center);
for (var i = 0; i < ds_list_size(sliders); i++) {
	var _slider = ds_list_find_value(sliders, i);
	
	draw_sprite_stretched(s_slider_bar, 0, _slider.x, _slider.y + _slider.height/2 , _slider.slider_width, _slider.image_scale);
	draw_sprite_stretched(_slider.sprite, _slider.sprite_subimg, _slider.slider_x, _slider.slider_y, _slider.width, _slider.height);
	draw_text(_slider.x +  _slider.slider_width/2, _slider.y, _slider.name);
}
draw_set_halign(fa_left);

if histogram = 1 {
	draw_histogram("Speed", speed_list, 0, 250);
	draw_histogram("Vision", vision_list, 0, 470);
}
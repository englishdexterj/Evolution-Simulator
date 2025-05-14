enum variables {
	test,
	game_speed,
	max_food
}

speed_list = ds_list_create();
vision_list = ds_list_create();

alarm_set(0, 1);

histogram = 0;

function _button(_x, _y, _sprite, _image_scale, _variable, _name = "") constructor
{
    x = _x;
    y = _y;
	sprite = _sprite;
	sprite_subimg = 0;
	
	variable = _variable;
	
	width = sprite_get_width(sprite) * _image_scale;
	height = sprite_get_height(sprite) * _image_scale;
	
	name = _name;
}

buttons = ds_list_create();

var button = new _button(25, 100, s_button, 4, variables.test, "Histograms");
ds_list_add(buttons, button);

function _slider(_x, _y, _sprite, _image_scale, _slider_width, _variable, _value_min = 0, _value_max = 1, _name = "") constructor
{
    x = _x;
    y = _y;
	slider_x = x;
	slider_y = y;
	sprite = _sprite;
	sprite_subimg = 0;
	slider_width = _slider_width;
	image_scale = _image_scale;
	
	value_max = _value_max;
	value_min = _value_min;
	
	variable = _variable;
	selected = 0;
	
	width = sprite_get_width(sprite) * _image_scale;
	height = sprite_get_height(sprite) * _image_scale;
	
	name = _name;
}

sliders = ds_list_create();

slider[0] = new _slider(25, 150, s_slider, 4, 200, variables.game_speed, 10, 600, "Game Speed");
ds_list_add(sliders, slider[0]);

slider[1] = new _slider(25, 200, s_slider, 4, 200, variables.max_food, 100, 1000, "Max Food");
ds_list_add(sliders, slider[1]);
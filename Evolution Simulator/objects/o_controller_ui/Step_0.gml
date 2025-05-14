for (var i = 0; i < ds_list_size(buttons); i++) {
	var _button = ds_list_find_value(buttons, i);
	
	if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _button.x, _button.y, _button.x + _button.width, _button.y + _button.height) {
		if mouse_check_button(mb_left) {
			_button.sprite_subimg = 1;
		} else if mouse_check_button_released(mb_left) {
			_button.sprite_subimg = 0;
			histogram = -histogram+1;
		}
	} else {
		_button.sprite_subimg = 0;
	}
}

for (var i = 0; i < ds_list_size(sliders); i++) {
	var _slider = ds_list_find_value(sliders, i);

	if _slider.selected {
		if mouse_check_button_released(mb_left) {
			_slider.selected = 0;
			_slider.sprite_subimg = 0;
			
			var _value = ((_slider.slider_x - _slider.x) / _slider.slider_width) * (_slider.value_max - _slider.value_min) + _slider.value_min;
			
			switch _slider.variable {
				case variables.test:
					
					break;
				case variables.game_speed:
					game_set_speed(_value, gamespeed_fps);
					break;
				case variables.max_food:
					o_controller_food.food_max = _value;
					break;
				default:
					show_debug_message("o_controller_ui: No Slider Variable Assigned");
					break;
			}
		}
		_slider.slider_x = clamp(device_mouse_x_to_gui(0), _slider.x, _slider.x + _slider.slider_width);
	} else {
		_slider.sprite_subimg = 0;
	}
	
	if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _slider.slider_x, _slider.slider_y, _slider.slider_x + _slider.width, _slider.slider_y + _slider.height) {
		if mouse_check_button_pressed(mb_left) {
			_slider.sprite_subimg = 1;
			_slider.selected = 1;
		}
	}
}
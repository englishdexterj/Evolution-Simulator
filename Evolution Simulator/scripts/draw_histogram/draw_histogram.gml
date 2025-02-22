function draw_histogram(name, list, xx, yy, height = 200, width = 500) {
	var list_size = ds_list_size(list);
	var line_width = (width / list_size);
	var tracker_min = 99999;
	var tracker_max = 0;
	
	for (var i = 0; i < ds_list_size(list); i++) {
		var _tracker = ds_list_find_value(list, i);
		if _tracker < tracker_min tracker_min = _tracker;
		if _tracker > tracker_max tracker_max = _tracker;
	}
	
	var tracker_width = -height / (tracker_max - tracker_min);
	
	for (var i = 0; i < ds_list_size(list)-1; i++) {
		draw_line(i * line_width, (ds_list_find_value(list, i) - tracker_min) * tracker_width + yy+height, (i+1) * line_width, (ds_list_find_value(list, i+1) - tracker_min) * tracker_width + yy+height);
	}
	draw_text(xx+8, yy+height, string(tracker_min));
	draw_text(xx+8, yy, string(name) + " " + string(tracker_max));
}
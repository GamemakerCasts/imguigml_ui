/// @description 

if(keyboard_check_pressed(vk_escape)) {
	_is_selected = false;
}

if(_is_selected) {
	_window_x = x;
	_window_y = bbox_bottom + 32;
		
	if(ui.ready()) {
		ui.window("Player Information", "player", _window_x, _window_y, 0, 0, function() {
			ui.label("[ Object Information ]");
			ui.separator();
			
			ui.slider_float("Rotation", "obj_rotation", [image_angle], 0, 360, function(_a) {
				image_angle = _a;
				direction = _a;
			});
			
			ui.slider_float("Image X Scale", "xscale", [image_xscale], 0, 10, function(_a) {
				image_xscale = _a;
			});
			
			ui.slider_float("Image Y Scale", "yscale", [image_yscale], 0, 10, function(_a) {
				image_yscale = _a;
			});
			
			ui.drag_float("Speed", "speed", [speed], 0, 1, function(_a) {
				speed = _a;
			}, 0.01);
			
			ui.button("Pause", "p", function() {
				speed = 0;
			}, -1, 32);
		}, EImGui_WindowFlags.NoTitleBar + EImGui_WindowFlags.NoResize);
	}
}
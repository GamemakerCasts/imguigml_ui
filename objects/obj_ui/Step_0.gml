
if(ui.ready()) {
	
	ui.window("Player", "Player_1", 300, 200, 10, 10, function() {
		ui.label("Player Information");
		ui.slider_int("Jump Height", "player_1", [obj_Player._jump_height], -30, 0, function(_a) {
			obj_Player._jump_height = _a;
		});
	});
	
}
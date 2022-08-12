
if(ui.ready()) {
	
	ui.window("Player", "Player_1", 10, 10, 300, 200, function() {
		ui.columns("column_test", function() {
			ui.label("Player Information");
		}, function() {
			ui.label("Jump Height");
			ui.slider_int("", "player_1_jump_height", [obj_Player._jump_height], -30, 0, function(_a) {
				obj_Player._jump_height = _a;
			});
		});
	});
	
}
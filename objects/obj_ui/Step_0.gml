/// @step

if(ui.ready()) {
	
	#region MENU
		ui.menu_main(function() {
			ui.menu_strip("File", "mnuFile", function() {
				ui.menu_item("New", "mnuFileNew", function() {
					show_message("New");
				});
				
				ui.menu_item("Open", "mnuFileOpen", function() {
					show_message("Open");
				});
			});
			
			ui.menu_strip("Edit", "mnuEdit", function() {
			});
			
			ui.menu_strip("Help", "mnuHelp", function() {
				ui.menu_item("About", "mnuHelpAbout", function() {
					show_message("About");
				});
			});
		});
	#endregion

	#region WINDOWS
		//ui.window("Test Window", "window_test_1", 300, 400, 200, 200, function() {
		//	ui.label("Hello World");
		//});
		
		//ui.window("Test Window", "window_test_1", 300, 400, 0, 0, function() {
		//	ui.label("This is a label and this window will be able to grow and shrink with what is inside");
		//	ui.label("I also have no title bar!");
		//}, EImGui_WindowFlags.NoTitleBar);
		
		//ui.window("Test", "test_window", 200, 100, 0, 0, function() {
		//	ui.label("Hello World");
		//	ui.separator();
		
		//	ui.slider_float("Scale", "scale_xy", [obj_Player.image_xscale, obj_Player.image_yscale, obj_Player.image_angle], 0, 1, function(_a, _b, _c) {
		//		obj_Player.image_xscale = _a;
		//		obj_Player.image_yscale = _b;
		//		obj_Player.image_angle = _c * 100;
		//	});
		//});
	#endregion
	
}
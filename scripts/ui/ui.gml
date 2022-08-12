function UI() constructor {
	
	/// @func init()
	/// @desc initializes the imgui library
	static init = function() {
		if(instance_exists(imgui) == false) {
			instance_create_depth(0, 0, 0, imgui);
		}
	}
	
	/// @func ready()
	/// @desc Called to check if the UI class is ready
	/// @returns Bool
	static ready = function() {
		return imguigml_ready();
	}

	#region BUTTONS
		/// @func button(_label, _on_click, [_size_x = 0], [_size_y = 0])
		/// @param {String} _label This is the label for the button
		/// @param {String} _id The id of the button. Needs to be unique
		/// @param {Function} _on_click Gets call if clicked
		/// @param {Real} _size_x Width of button. Use 0 for automatic sizing
		/// @param {Real} _size_y Height of button. Use 0 for automatic sizing
		static button = function(_label, _id, _on_click, _size_x = 0, _size_y = 0) {
			if(imguigml_button(string(_label) + "###" + string(_id), _size_x, _size_y) == true) {
				_on_click();
			}
		}

		/// @func button_small(_label, _on_click)
		/// @param {String} _label This is the label for the button
		/// @param {String} _id The id of the button. Needs to be unique
		/// @param {Function} _on_click Gets call if clicked
		static button_small = function(_label, _id, _on_click) {
			if(imguigml_small_button(string(_label) + "###" + string(_id)) == true) {
				_on_click();
			}
		}
	#endregion

	#region SLIDERS
		/// @func slider_int(_label, _values, _min, _max, _on_change, [_format = "%.0f"])
		/// @param {String} _label This is the label to show
		/// @param {String} _id The id of the button. Needs to be unique
		/// @param {Array} _values Array of values to assign to each slider
		/// @param {Real} _min The minimum amount allowed when sliding
		/// @param {Real} _max The maximum amount allow when sliding
		/// @param {Function} _on_change The call back function to call when the value has changed
		/// @param {String} _format The format of the string to display
		static slider_int = function(_label, _id, _values, _min, _max, _on_change, _format = "%.0f") {
		var slider_length = array_length(_values);
		var ret = [0, 0];
		
		switch(slider_length) {
			case 1:
				ret = imguigml_slider_int(string(_label) + "###" + string(_id), _values[0], _min, _max, _format);
			break;
			case 2:
				ret = imguigml_slider_int2(string(_label) + "###" + string(_id), _values[0], _values[1], _min, _max, _format);
			break;
			case 3:
				ret = imguigml_slider_int3(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _min, _max, _format);
			break;
			default: // 4
				ret = imguigml_slider_int4(string(_label) + "###" + string(_id), _values[0], _values[1], _values[3], _values[4], _min, _max, _format);
			break;
		}
		
		if(ret[0] == 1) {
			switch(slider_length) {
				case 1:
					_on_change(ret[1]);
				break;
				case 2:
					_on_change(ret[1], ret[2]);
				break;
				case 3:
					_on_change(ret[1], ret[2], ret[3]);
				break;
				default: // 4
					_on_change(ret[1], ret[2], ret[3], ret[4]);
				break;
			}
		}
	}
	
	/// @func slider_float(_label, _values, _min, _max, _on_change, [_format = "%.3f]")
	/// @param {String} _label This is the label to show
	/// @param {String} _id The id of the button. Needs to be unique
	/// @param {Array} _values Array of values to assign to each slider
	/// @param {Real} _min The minimum amount allowed when sliding
	/// @param {Real} _max The maximum amount allow when sliding
	/// @param {Function} _on_change The call back function to call when the value has changed
	/// @param {String} _format The format of the string to display
	static slider_float = function(_label, _id, _values, _min, _max, _on_change, _format = "%.3f", _flags = EImGui_SliderFlags.None) {
		var slider_length = array_length(_values);
		var ret = [0, 0];
		
		switch(slider_length) {
			case 1:
				ret = imguigml_slider_float(string(_label) + "###" + string(_id), _values[0], _min, _max, _format, _flags);
			break;
			case 2:
				ret = imguigml_slider_float2(string(_label) + "###" + string(_id), _values[0], _values[1], _min, _max, _format, _flags);
			break;
			case 3:
				ret = imguigml_slider_float3(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _min, _max, _format, _flags);
			break;
			default: // 4
				ret = imguigml_slider_float4(string(_label) + "###" + string(_id), _values[0], _values[1], _values[3], _values[4], _min, _max, _format, _flags);
			break;
		}
		
		if(ret[0] == 1) {
			switch(slider_length) {
				case 1:
					_on_change(ret[1]);
				break;
				case 2:
					_on_change(ret[1], ret[2]);
				break;
				case 3:
					_on_change(ret[1], ret[2], ret[3]);
				break;
				default: // 4
					_on_change(ret[1], ret[2], ret[3], ret[4]);
				break;
				}
			}
		}
	#endregion

	#region MENUS
		/// @func menu_main(_callback)
		/// @desc This will create a main menu bar at the top of applications
		/// @param {Function} _callback This is the callback function. Inside you will place other menu items
		static menu_main = function(_callback) {
			if(imguigml_begin_main_menu_bar()) {
				_callback();
			}
			
			imguigml_end_main_menu_bar();
		}

		/// @func menu_strip(_label, _id, _on_click)
		/// @desc Menu Strip will go on current window. Please have EImGui_WindowFlags.MenuBar on the window
		/// @param {String} _label This if the menu text
		/// @param {String} _id The id of the button. Needs to be unique
		/// @param {Function} _on_click This is what you want to happen when they click it
		static menu_strip = function(_label, _id, _on_click) {
			if(imguigml_begin_menu_bar()) {
				if(imguigml_begin_menu(string(_label) + "###" + string(_id))) {
					_on_click();

					imguigml_end_menu();
				}
				
				imguigml_end_menu_bar();
			}
		}

		/// @func menu_item(_label, _id, _on_click)
		/// @param {String} _label This if the menu text
		/// @param {String} _id The id of the button. Needs to be unique
		/// @param {Function} _on_click This is what you want to happen when they click it
		/// @param {String} _shortcut Short cut key
		static menu_item = function(_label, _id, _on_click, _shortcut = "") {
			if(imguigml_menu_item(string(_label) + "###" + string(_id), _shortcut)) {
				_on_click();
			}
		}
	#endregion

	#region DRAGS (SAME AS A SLIDER WITHOUT HANDLE)
		/// @func drag_int(_label, _id, _values, _min, _max, _on_change, [_step = 0.5], [_format = "%.0f"], [_flags = EImGui_SliderFlags.None])
		/// @param {String} _label This if the menu text
		/// @param {String} _id The id of the drag. Needs to be unique
		/// @param {Array} _values The default values to assign
		/// @param {Real} _min Minimum value that can be achieved by dragging
		/// @param {Real} _max Maximum value that can be achieved by dragging
		/// @param {Function} _on_change The callback function when something changed
		/// @param {Real} _step how much to increment in
		/// @param {Real} _format the decimal format
		/// @param {Real} _flags The flags to pass through
		static drag_int = function(_label, _id, _values, _min, _max, _on_change, _step = 0.5, _format = "%.0f", _flags = EImGui_SliderFlags.None) {
			var ret = [0,0];
			var drag_length = array_length(_values);
		
			switch(drag_length) {
				case 1:
					ret = imguigml_drag_int(string(_label) + "###" + string(_id), _values[0], _step, _min, _max, _format);
				break;
				case 2:
					ret = imguigml_drag_int2(string(_label) + "###" + string(_id), _values[0], _values[1], _step, _min, _max, _format);
				break;
				case 3:
					ret = imguigml_drag_int3(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _step, _min, _max, _format);
				break;
				default: // 4
					ret = imguigml_drag_int4(string(_label) + "###" + string(_id), _values[0], _values[1], _values[3], _values[4], _step, _min, _max, _format);
				break;
			}
		
			if(ret[0] == 1) {
				switch(drag_length) {
					case 1:
						_on_change(ret[1]);
					break;
					case 2:
						_on_change(ret[1], ret[2]);
					break;
					case 3:
						_on_change(ret[1], ret[2], ret[3]);
					break;
					default: // 4
						_on_change(ret[1], ret[2], ret[3], ret[4]);
					break;
				}
			}
		}

		/// @func drag_float(_label, _id, _values, _min, _max, _on_change, [_step = 0.5], [_format = "%.3f"], [_flags = EImGui_SliderFlags.None])
		/// @param {String} _label This if the menu text
		/// @param {String} _id The id of the drag. Needs to be unique
		/// @param {Array} _values The default values to assign
		/// @param {Real} _min Minimum value that can be achieved by dragging
		/// @param {Real} _max Maximum value that can be achieved by dragging
		/// @param {Function} _on_change The callback function when something changed
		/// @param {Real} _step how much to increment in
		/// @param {Real} _format the decimal format
		/// @param {Real} _flags The flags to pass through
		static drag_float = function(_label, _id, _values, _min, _max, _on_change, _step = 0.5, _format = "%.3f", _flags = EImGui_SliderFlags.None) {
			var ret = [0,0];
			var drag_length = array_length(_values);

			switch(drag_length) {
				case 1:
					ret = imguigml_drag_float(string(_label) + "###" + string(_id), _values[0], _step, _min, _max, _format, _flags);
				break;
				case 2:
					ret = imguigml_drag_float2(string(_label) + "###" + string(_id), _values[0], _values[1], _step, _min, _max, _format, _flags);
				break;
				case 3:
					ret = imguigml_drag_float3(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _step, _min, _max, _format, _flags);
				break;
				default: // 4
					ret = imguigml_drag_float4(string(_label) + "###" + string(_id), _values[0], _values[1], _values[3], _values[4], _step, _min, _max, _format, _flags);
				break;
			}

			if(ret[0] == 1) {
				switch(drag_length) {
					case 1:
						_on_change(ret[1]);
					break;
					case 2:
						_on_change(ret[1], ret[2]);
					break;
					case 3:
						_on_change(ret[1], ret[2], ret[3]);
					break;
					default: // 4
						_on_change(ret[1], ret[2], ret[3], ret[4]);
					break;
				}
			}
		}
	#endregion

	#region INPUTS (WITH BUTTONS)
		/// @func input_int(_label, _values, _step, _step_fast, _on_change, _flags)
		/// @parameter _label {String} Label
		/// @parameter _id {String} This is the ID (needs to be unique)
		/// @parameter _values {Array} Array of values
		/// @parameter _step {Real} How fast when clicked
		/// @parameter _step_fast {Real} How fast when held down
		/// @parameter _on_change {Function} Function to call on change
		/// @parameter _flags {Real} Flags
		static input_int = function(_label, _id, _values, _step, _step_fast, _on_change, _flags = 0) {
			var ret = [0,0];
			var int_length = array_length(_values);
		
			switch(int_length) {
				case 1:
					ret = imguigml_input_int(string(_label) + "###" + string(_id), _values[0], _step, _step_fast, _flags);
				break;
				case 2:
					ret = imguigml_input_int2(string(_label) + "###" + string(_id), _values[0], _values[1], _step, _step_fast, _flags);
				break;
				case 3:
					ret = imguigml_input_int3(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _step, _step_fast, _flags);
				break;
				default:
					ret = imguigml_input_int4(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _values[3], _step, _step_fast, _flags);
				break;
			}
		
			if(ret[0] == 1) {
				switch(int_length) {
					case 1:
						_on_change(ret[1]);
					break;
					case 2:
						_on_change(ret[1], ret[2]);
					break;
					case 3:
						_on_change(ret[1], ret[2], ret[3]);
					break;
					default: // 4
						_on_change(ret[1], ret[2], ret[3], ret[4]);
					break;
				}
			}
		}
		
		/// @func input_float(_label, _id, _values, _step, _step_fast, _on_change, [_decimal_precision = 1], [_flags = 0])
		/// @param {String} _label The label to write beside. 
		/// @param {String} _id The id to help. Needs to be unique
		/// @param {Array} _values The values to change
		/// @param {Real} _step When you click the + button. Only applies to single
		/// @param {Real} _step_fast When you hold the + button. Only applies to single
		/// @param {Function} _on_change The callback function
		/// @param {Real} _decimal_precision The decimal precision. Default 0.1
		/// @param {Real} _flags Flags to pass from EImGui_InputTextFlags
		static input_float = function(_label, _id, _values, _step, _step_fast, _on_change, _decimal_precision = 1, _flags = 0) {
			var ret = [0,0];
			var int_length = array_length(_values);
		
			switch(int_length) {
				case 1:
					ret = imguigml_input_float(string(_label) + "###" + string(_id), _values[0], _step, _step_fast, _decimal_precision, _flags);
				break;
				case 2:
					ret = imguigml_input_float2(string(_label) + "###" + string(_id), _values[0], _values[1], _decimal_precision, _flags);
				break;
				case 3:
					ret = imguigml_input_float3(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _decimal_precision, _flags);
				break;
				default:
					ret = imguigml_input_float4(string(_label) + "###" + string(_id), _values[0], _values[1], _values[2], _values[3], _decimal_precision, _flags);
				break;
			}
		
			if(ret[0] == 1) {
				switch(int_length) {
					case 1:
						_on_change(ret[1]);
					break;
					case 2:
						_on_change(ret[1], ret[2]);
					break;
					case 3:
						_on_change(ret[1], ret[2], ret[3]);
					break;
					default: // 4
						_on_change(ret[1], ret[2], ret[3], ret[4]);
					break;
				}
			}
		}
	#endregion

	#region CHECKBOX
		/// @func checkbox(_label, _id, _value, _on_change)
		/// @param {String} _label Title name of the window
		/// @param {String} _id This is the ID. Needs to be unique
		/// @param {String} _value default value
		/// @param {Function} _on_change callback function
		static checkbox = function(_label, _id, _value, _on_change) {
			var ret = imguigml_checkbox(string(_label) + "###" + string(_id), _value);

			if(ret[0] == 1) {
				_on_change(ret[1]);
			}
		}
	#endregion

	#region HELPERS
	
		/// @func gui_width()
		/// @desc returns the gui width
		/// @return Real
		static gui_width = function() {
			return display_get_gui_width();
		}
		
		/// @func gui_height()
		/// @desc returns the gui height
		/// @return Real
		static gui_height = function() {
			return display_get_gui_height();
		}
	
		/// @func is_item_hover()
		/// @desc will return true/false if an imgui control is being hovered
		/// @return Bool
		static is_item_hovered = function() {
			return imguigml_is_any_item_hovered();
		}

		/// @func separator()
		/// @desc Will generate a horizontal separate if used in a menu. This becomes vertical otherwise
		static separator = function() {
			imguigml_separator();
		}

		/// @func same_line([_width = 0])
		/// @desc Will cause the next control to be on the same line
		/// @param {Real} _width how much space between
		static same_line = function(_width = 0) {
			imguigml_same_line(_width);
		}

		/// @func new_line()
		/// @desc Will force a new line between controls
		static new_line = function() {
			imguigml_new_line();
		}

		/// @func set_input_width([_width = 0])
		/// @param {Real} _width 0 = default to ~2/3 of windows width >0.0f: width in pixels <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side)
		static set_input_width = function(_width = 0) {
			imguigml_push_item_width(_width);
		}

		///@func indent([_amount = 0])
		///@param {Real} _amount The amount to unindent. If above 0 then use pixel for indent otherwise default amount
		static indent = function(_amount = 0) {
			imguigml_indent(_amount);
		}
	
		///@func unindent([_amount = 0])
		///@param {Real} _amount The amount to indent. If above 0 then use pixel for indent otherwise default amount
		static unindent = function(_amount = 0) {
			imguigml_unindent(_amount);
		}

		/// @func tooltip(_string)
		/// @desc Call after a control to apply a tooltip when mousing over
		/// @param {String} _string  the text to use
		static tooltip = function(_string) {
			if(imguigml_is_item_hovered()) {
				imguigml_set_tooltip(string(_string))
			}
		}
	#endregion

	#region WINDOW
		/// @func window(_label, _width, _height, _x, _y, _callback, [_flags = EImGui_WindowFlags.NoCollapse + EImGui_WindowFlags.NoResize])
		/// @param {String} _label Title name of the window
		/// @param {String} _id This is the ID. Needs to be UNIQUE
		/// @param {Real} _x Position X
		/// @param {Real} _y Position Y
		/// @param {Real} _width Width of window. Use 0 for auto fit
		/// @param {Real} _height Height of window. Use 0 for auto fit
		/// @param {Function} _callback Function to run when open
		/// @param _flags
		static window  = function(_label, _id, _x, _y, _width, _height, _callback, _flags = EImGui_WindowFlags.NoCollapse + EImGui_WindowFlags.NoResize) {
			imguigml_set_next_window_size(_width, _height);
			imguigml_set_next_window_pos(_x, _y);
		
			var ret = imguigml_begin(string(_label) + "###" + string(_id), undefined, _flags);
	
			if(ret[0] == 1) {
				_callback();
			}
			imguigml_end();
		}
	#endregion
	
	#region Colors
		/// @func color_edit(_label, _id, _red, _green, _blue, _on_change, [_flags = 0])
		/// @param {String} _label Title name of the window
		/// @param {String} _id This is the ID. Needs to be UNIQUE
		/// @param {Real} _red Red value between 0 - 1
		/// @param {Real} _green Green value between 0 - 1
		/// @param {Real} _blue Blue value between 0 - 1
		/// @param {Function} _on_change The function to call when something changed
		/// @param {Real} _flags Flags from EImGui_ColorEditFlags
		static color_edit = function(_label, _id, _red, _green, _blue, _on_change, _flags = 0) {
			var ret = imguigml_color_edit3(string(_label) + "###" + string(_id), _red, _green, _blue, _flags);
			
			if(ret[0] == 1) {
				_on_change(ret[1], ret[2], ret[3]);
			}
		}
		
		/// @func color_edit(_label, _id, _red, _green, _blue, _alpha, _on_change, [_flags = 0])
		/// @param {String} _label Title name of the window
		/// @param {String} _id This is the ID. Needs to be UNIQUE
		/// @param {Real} _red Red value between 0 - 1
		/// @param {Real} _green Green value between 0 - 1
		/// @param {Real} _blue Blue value between 0 - 1
		/// @param {Real} _alpha Alpha value between 0 - 1
		/// @param {Function} _on_change The function to call when something changed
		/// @param {Real} _flags Flags from EImGui_ColorEditFlags
		static color_edit_alpha = function(_label, _id, _red, _green, _blue, _alpha, _on_change, _flags = 0) {
			var ret = imguigml_color_edit4(string(_label) + "###" + string(_id), _red, _green, _blue, _alpha, _flags);
			
			if(ret[0] == 1) {
				_on_change(ret[1], ret[2], ret[3], ret[4]);
			}
		}
	#endregion
	
	#region Columns
		/// @func columns(id, ... columns)
		/// @param {String} id
		/// @param {Function} call back for each column
		static columns = function() {
			var column_count = argument_count - 1;
			imguigml_columns(column_count, argument[0]);
			
			for (var i = 0; i < column_count; i++) {
				argument[i + 1]();
			    imguigml_next_column();
			}
		}
	#endregion

	#region Labels
		/// @func label(_string)
		/// @desc Place a static label
		/// @param {String} _string The text to draw
		static label = function(_string) {
			imguigml_text(_string);
		}
	#endregion

	#region Text
		/// @func input_text(_label, _id, _text, _max_length, _on_change, [_callback = undefined], [_flags = 0], [_user_data = undefined])
		/// @param {String} _label Title name of the window
		/// @param {String} _id This is the ID. Needs to be UNIQUE
		/// @param {Real} _max_length Maximum length of input characters
		/// @param {Function} _on_change Function to call when changed
		/// @param {Function} _callback No idea
		/// @param {Any} _flags No idea
		/// @param {Any} _user_data No idea
		static input_text = function(_label, _id, _text, _max_length, _on_change, _callback = undefined, _flags = 0, _user_data = undefined) {
			var ret = imguigml_input_text(string(_label) + "###" + string(_id), _text, _max_length, _flags, _callback, _user_data)
			
			if(ret[0] == true) {
				_on_change(ret[1]);
			}
		}
	#endregion
	 
}
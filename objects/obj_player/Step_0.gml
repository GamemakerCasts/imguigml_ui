/// @description 

var input_horizontal = input_check("right") - input_check("left");
var bbox_side = 0;

#region HORIZONTAL MOVEMENT
	if(input_horizontal != 0) {
		var _max_speed = _max_speed_walk;
	
		if(input_check("run")) {
			_max_speed = _max_speed_run;
		}
	
		if(input_horizontal > 0) {
			bbox_side = bbox_right;
		} else {
			bbox_side = bbox_left;
		}
	
		movement_horizontal += input_horizontal * _acceleration;
		movement_horizontal = clamp(movement_horizontal, -_max_speed, _max_speed);
	} else {
		if(movement_horizontal >= _deceleration) {
			movement_horizontal -= _deceleration;
		} else if(movement_horizontal <= -_deceleration) {
			movement_horizontal += _deceleration;
		} else {
			movement_horizontal = 0;
		}
	}

	if(
		tilemap_get_at_pixel(collision_tiles, bbox_side + movement_horizontal, bbox_top) > 0
		|| tilemap_get_at_pixel(collision_tiles, bbox_side + movement_horizontal, bbox_bottom) > 0) {
	
		if(movement_horizontal > 0) {
			x = x - (x mod 32) + 31 - (bbox_right - x);
		} else {
			x = x - (x mod 32) - (bbox_left - x);
		}
	
		movement_horizontal = 0
	}

	x += movement_horizontal
#endregion

#region VERTICAL MOVEMENT
	movement_vertical += _gravity;
	
	if(input_check_pressed("jump")) {
		if(is_on_ground) { 
			is_on_ground = false;
			movement_vertical += _jump_height;
		}
	}
	
	if(movement_vertical > 0) {
		bbox_side = bbox_bottom;
	} else {
		bbox_side = bbox_top;
	}

	if(
		tilemap_get_at_pixel(collision_tiles, bbox_left, bbox_side + movement_vertical) > 0
		|| tilemap_get_at_pixel(collision_tiles, bbox_right, bbox_side + movement_vertical) > 0) {
	
		if(movement_vertical > 0) {
			y = y - (y mod 32) + 31 - (bbox_bottom - y);
		} else {
			y = y - (y mod 32) - (bbox_top - y);
		}
	
		movement_vertical = 0;
		is_on_ground = true;
	}

	y += movement_vertical
#endregion

//If the player pressed the "Shoot" button, fire a bullet
if (input_check_pressed("shoot")) {
	show_debug_message("bang");
}
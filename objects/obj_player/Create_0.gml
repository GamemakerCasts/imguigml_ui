/// @description 

collision_layer_id = layer_get_id("ts_Collision");
collision_tiles = layer_tilemap_get_id(collision_layer_id);

_gravity = 1;
_jump_height = -14;
_acceleration = 1;
_deceleration = 1;
_max_speed_walk = 5;
_max_speed_run = 8;

movement_horizontal = 0;
movement_vertical = 0;

is_on_ground = false;
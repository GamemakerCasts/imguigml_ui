/// @description 

if(target == noone) {
	target = instance_find(obj_Player, 0);
}

cam.SetViewPos(target.x - (cam.GetViewWidth() / 2), target.y - (cam.GetViewHeight() / 2));
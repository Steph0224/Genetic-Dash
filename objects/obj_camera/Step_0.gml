if(!instance_exists(target)){
	exit;	
}

// Seguimiento del jugador
x = target.x - cam_w/2 + 100
y = target.y - cam_h/2 - 80

x = clamp(x, 0, room_width - cam_w)
y = clamp(y, 0, room_height - cam_h)

camera_set_view_pos(cam, x, y)
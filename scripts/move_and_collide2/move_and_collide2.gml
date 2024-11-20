// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function move_and_collide2(_hspd, _vspd, _obj){

	if(place_meeting(x + hspd, y, _obj)){
		while(!place_meeting(x + sign(_hspd), y, _obj)){
			x += sign(_hspd)
		}
		_hspd = 0
	}
	
	x += _hspd
	
	if(place_meeting(x, y + vspd, _obj)){
		while(!place_meeting(x, y + sign(_vspd), _obj)){
			y += sign(_vspd)
		}
		_vspd = 0
	}

	y += _vspd
}
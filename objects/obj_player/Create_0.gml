//Definición de variables de juego
ended = false

// Definición de variables de configuración
is_sound_effect_playing = false

// Definición de variables de estado
on_ground = false
on_cealing = false
on_front = false
on_trampoline = false
on_jump_orb = false
on_takeoff = false
on_landing = false
is_flying = false

// Definición de variables de movimiento
run_speed = 3.2
grav = 0.55
terminal_vspd = 7
up_terminal_vspd = -7
acc = 0.2
air_acc = 0.3
jump_spd = -9
trampoline_jump_spd = -10.3

// Movimiento de personaje
move_x = 0
move_y = 0
hspd = 0
vspd = 0
jump_input = false

// Animaciones

animations = {
	idling:		{frames: [15, 22]},
	running:	{frames: [0, 10] },
	jumping:	{frames: [11, 12]},
	falling:	{frames: [13, 14]},
	flying:		{frames: [12, 13]},
}

function set_animations(state){
	new_animation = variable_struct_get(animations, state);
	animations_frames = new_animation.frames
}

set_animations("idling");

// Sensors confg
sensor_view_hdist = 500
sensor_view_vdist= 300

// Sensors data
// Ahead
nearest_wall_ahead = noone //
nearest_fire_ahead = noone // 1
nearest_saw_ahead = noone //
nearest_trampoline_ahead = noone // 2
// Uphead
nearest_wall_uphead = noone //
nearest_fire_uphead = noone // 3
nearest_saw_uphead = noone //
// Downhead
nearest_wall_aheadown = noone 
nearest_fire_aheadown = noone // 4
nearest_saw_aheadown = noone //
// Up
nearest_wall_up = noone //
nearest_fire_up = noone // 5
nearest_saw_up = noone //
// Down
nearest_wall_down = noone //
nearest_fire_down = noone // 6
nearest_saw_down = noone //
// Bools
is_on_jump_orb = noone // 7
sensor_is_flying = noone // 8
is_on_ground = noone // 9

// Sensors pre-results
d_nearest_wall_ahead = sensor_view_hdist
d_nearest_fire_ahead = sensor_view_hdist
d_nearest_saw_ahead = sensor_view_hdist
d_nearest_trampoline = sensor_view_hdist

d_nearest_wall_uphead = sensor_view_hdist
d_nearest_fire_uphead = sensor_view_hdist
d_nearest_saw_uphead = sensor_view_hdist

d_nearest_wall_aheadown = sensor_view_vdist 
d_nearest_fire_aheadown = sensor_view_vdist
d_nearest_saw_aheadown = sensor_view_vdist

d_nearest_wall_up = sensor_view_vdist
d_nearest_fire_up = sensor_view_vdist
d_nearest_saw_up = sensor_view_vdist

d_nearest_wall_down = sensor_view_vdist
d_nearest_fire_down = sensor_view_vdist
d_nearest_saw_down = sensor_view_vdist


// Sensor results

d_obstacle_ahead = sensor_view_hdist
d_obstacle_uphead = sensor_view_hdist
d_trampoline_ahead = sensor_view_hdist
d_obstacle_aheadown = sensor_view_vdist
d_obstacle_up = sensor_view_vdist
d_obstacle_down = sensor_view_vdist
b_is_on_jump_orb = false
b_is_flying = false
b_is_on_ground = true

// Distance sensors function
function get_nearest_object(_obj, _vertical_offs, _horizontal_offs, _xdistance, _ydistance){
var _collist = ds_list_create()
var _vertical_offset = _vertical_offs
var _horizontal_offset = _horizontal_offs
var _num = collision_line_list(x + _horizontal_offs, y + _vertical_offs, x + _horizontal_offs + _xdistance, y + _vertical_offs + _ydistance, _obj, false, true, _collist, true)
if (_num > 0){
	var _nearest_object = _collist[| 0]
	ds_list_destroy(_collist)
	return _nearest_object
  }

ds_list_destroy(_collist)
return noone
}


// Get player input
function get_player_input(){
	return keyboard_check(vk_space)
}
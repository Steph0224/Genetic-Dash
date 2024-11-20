// Player state variables
on_ground = place_meeting(x, y + 1, obj_wall)
on_cealing = place_meeting(x, y - 1, obj_wall)
on_front = place_meeting(x + 1, y, obj_wall)
on_trampoline = place_meeting(x - 5, y, obj_trampoline)
on_jump_orb = place_meeting(x, y, obj_jump_orb)


// Change is_flying variable is needed
on_takeoff = place_meeting(x, y, obj_takeoff_sign)
on_landing = place_meeting(x, y, obj_landing_sign)


// Check if there is a sound effect playing
if (!on_trampoline and !on_jump_orb and !on_takeoff and !on_landing){
	is_sound_effect_playing = false
}

if (on_takeoff){
	is_flying = true
	if (!is_sound_effect_playing) audio_play_sound(snd_takeoff, 0, false)
	is_sound_effect_playing = true
}

if (on_landing){
	is_flying = false
	if (!is_sound_effect_playing) audio_play_sound(snd_landing, 0, false)
	is_sound_effect_playing = true
}

// Sensors measurements
// Ahead
nearest_wall_ahead = get_nearest_object(obj_wall, -10, 0, sensor_view_hdist, 0)
nearest_fire_ahead = get_nearest_object(obj_fire_obstacle, -10, 0, sensor_view_hdist, 0)
nearest_saw_ahead = get_nearest_object(obj_saw, -10, 0, sensor_view_hdist, 0)
nearest_trampoline_ahead = get_nearest_object(obj_trampoline, -10, 0, sensor_view_hdist, 0)

if (is_flying){
	nearest_wall_ahead = get_nearest_object(obj_wall, 5, 0, sensor_view_hdist, 0)
	nearest_fire_ahead = get_nearest_object(obj_fire_obstacle, 5, 0, sensor_view_hdist, 0)
	nearest_saw_ahead = get_nearest_object(obj_saw, 5, 0, sensor_view_hdist, 0)
}

// Uphead
nearest_wall_uphead = get_nearest_object(obj_wall, -70, 0, sensor_view_hdist, 0)
nearest_fire_uphead = get_nearest_object(obj_fire_obstacle, -70, 0, sensor_view_hdist, 0)
nearest_saw_uphead= get_nearest_object(obj_saw, -70, 0, sensor_view_hdist, 0)
// Aheadown
nearest_wall_aheadown = get_nearest_object(obj_wall, -10, 40, 0, sensor_view_vdist)
nearest_fire_aheadown = get_nearest_object(obj_fire_obstacle, -10, 40, 0, sensor_view_vdist)
nearest_saw_aheadown = get_nearest_object(obj_saw, -10, 40, 0, sensor_view_vdist)
// Up
nearest_wall_up = get_nearest_object(obj_wall, -10, 0, 0, -sensor_view_vdist)
nearest_fire_up = get_nearest_object(obj_fire_obstacle, -10, 0, 0, -sensor_view_vdist)
nearest_saw_up= get_nearest_object(obj_saw, -10, 0, 0, -sensor_view_vdist)
// Down
nearest_wall_down = get_nearest_object(obj_wall, -10, 0, 0, sensor_view_vdist)
nearest_fire_down = get_nearest_object(obj_fire_obstacle, -10, 0, 0, sensor_view_vdist)
nearest_saw_down = get_nearest_object(obj_saw, -10, 0, 0, sensor_view_vdist)
// Bools
is_on_jump_orb = on_jump_orb
sensor_is_flying = is_flying
is_on_ground = on_ground

// Sensors pre-results

// Distance from wall ahead
if(instance_exists(nearest_wall_ahead)){
	d_nearest_wall_ahead = point_distance(x, y, nearest_wall_ahead.x, nearest_wall_ahead.y)
}
else{
	d_nearest_wall_ahead = sensor_view_hdist
}

// Distance from fire ahead
if(instance_exists(nearest_fire_ahead)){
	d_nearest_fire_ahead = point_distance(x, y, nearest_fire_ahead.x, nearest_fire_ahead.y)
}
else{
	d_nearest_fire_ahead = sensor_view_hdist
}

// Distance from saw ahead
if(instance_exists(nearest_saw_ahead)){
	d_nearest_saw_ahead = point_distance(x, y, nearest_saw_ahead.x, nearest_saw_ahead.y)
}
else{
	d_nearest_saw_ahead = sensor_view_hdist
}

// Distance from trampoline ahead
if(instance_exists(nearest_trampoline_ahead)){
	d_nearest_trampoline = point_distance(x, y, nearest_trampoline_ahead.x, nearest_trampoline_ahead.y)
}
else{
	d_nearest_trampoline = sensor_view_hdist
}

// Distance from wall uphead
if(instance_exists(nearest_wall_uphead)){
	d_nearest_wall_uphead = point_distance(x, y, nearest_wall_uphead.x, nearest_wall_uphead.y)
}
else{
	d_nearest_wall_uphead = sensor_view_hdist
}

// Distance from fire uphead
if(instance_exists(nearest_fire_uphead)){
	d_nearest_fire_uphead = point_distance(x, y, nearest_fire_uphead.x, nearest_fire_uphead.y)
}
else{
	d_nearest_fire_uphead = sensor_view_hdist
}

// Distance from saw uphead
if(instance_exists(nearest_saw_uphead)){
	d_nearest_saw_uphead = point_distance(x, y, nearest_saw_uphead.x, nearest_saw_uphead.y)
}
else{
	d_nearest_saw_uphead = sensor_view_hdist
}

// Distance from wall aheadown
if(instance_exists(nearest_wall_aheadown)){
	d_nearest_wall_aheadown = point_distance(x, y, nearest_wall_aheadown.x, nearest_wall_aheadown.y)
}
else{
	d_nearest_wall_aheadown = sensor_view_vdist
}

// Distance from fire aheadown
if(instance_exists(nearest_fire_aheadown)){
	d_nearest_fire_aheadown = point_distance(x, y, nearest_fire_aheadown.x, nearest_fire_aheadown.y)
}
else{
	d_nearest_fire_aheadown = sensor_view_vdist
}

// Distance from saw aheadown
if(instance_exists(nearest_saw_aheadown)){
	d_nearest_saw_aheadown = point_distance(x, y, nearest_saw_aheadown.x, nearest_saw_aheadown.y)
}
else{
	d_nearest_saw_aheadown = sensor_view_vdist
}

// Distance from wall up
if(instance_exists(nearest_wall_up)){
	d_nearest_wall_up = point_distance(x, y, nearest_wall_up.x, nearest_wall_up.y)
}
else{
	d_nearest_wall_up = sensor_view_vdist
}

// Distance from fire up
if(instance_exists(nearest_fire_up)){
	d_nearest_fire_up = point_distance(x, y, nearest_fire_up.x, nearest_fire_up.y)
}
else{
	d_nearest_fire_up = sensor_view_vdist
}

// Distance from saw up
if(instance_exists(nearest_saw_up)){
	d_nearest_saw_up = point_distance(x, y, nearest_saw_up.x, nearest_saw_up.y)
}
else{
	d_nearest_saw_up = sensor_view_vdist
}

// Distance from wall down
if(instance_exists(nearest_wall_down)){
	d_nearest_wall_down = point_distance(x, y, nearest_wall_down.x, nearest_wall_down.y)
}
else{
	d_nearest_wall_down = sensor_view_vdist
}


// Distance from fire down
if(instance_exists(nearest_fire_down)){
	d_nearest_fire_down = point_distance(x, y, nearest_fire_down.x, nearest_fire_down.y)
}
else{
	d_nearest_fire_down = sensor_view_vdist
}

// Distance from saw down
if(instance_exists(nearest_saw_down)){
	d_nearest_saw_down = point_distance(x, y, nearest_saw_down.x, nearest_saw_down.y)
}
else{
	d_nearest_saw_down = sensor_view_vdist
}


// Sensors results

d_obstacle_ahead = min(d_nearest_wall_ahead, d_nearest_fire_ahead, d_nearest_saw_ahead)
d_obstacle_uphead = min(d_nearest_wall_uphead, d_nearest_fire_uphead, d_nearest_saw_uphead)
d_trampoline_ahead = d_nearest_trampoline

d_obstacle_aheadown = min(d_nearest_fire_aheadown, d_nearest_saw_aheadown)
if (d_nearest_wall_aheadown < d_obstacle_aheadown){
	d_obstacle_aheadown = sensor_view_vdist
}

d_obstacle_up = min(d_nearest_wall_up, d_nearest_fire_up, d_nearest_saw_up)

d_obstacle_down = min(d_nearest_fire_down, d_nearest_saw_down)
if (d_nearest_wall_down < d_obstacle_down){
	d_obstacle_down = sensor_view_vdist
}

b_is_on_ground = is_on_ground
b_is_on_jump_orb = is_on_jump_orb
b_is_flying = sensor_is_flying

// show_debug_message(d_obstacle_ahead)

// Catching key pressing
move_x = 1

jump_input = get_player_input()

	
if(!is_flying){
	
	// Calculating horizontal movement
	hspd = lerp(hspd, run_speed * move_x, acc)

	// Calculating vertical movement
	vspd += grav
	vspd = min(terminal_vspd, vspd)
	
	// On ground gravity must be 2
	if (on_ground){
		vspd = 2
	}

	// Setting animations
	if (hspd > 0 and on_ground)			set_animations("running")
	else if (hspd == 0 and on_ground)	set_animations("idling")
	else if(!on_ground and vspd < 0)	set_animations("jumping")
	else if(!on_ground and vspd > 0)	set_animations("falling")

	// Movement
	if(on_ground and jump_input){
		vspd = jump_spd
		audio_play_sound(snd_jump, 0, false)
	}

	if(jump_input and on_jump_orb){
		vspd = jump_spd
		if (!is_sound_effect_playing) audio_play_sound(snd_double_jump, 0, false)
		is_sound_effect_playing = true
	}


	if(!on_ground){
		hspd = lerp(hspd, run_speed * 1.5 * move_x, air_acc)
	}

	if(on_trampoline){
		vspd = trampoline_jump_spd
		if (!is_sound_effect_playing) audio_play_sound(snd_boing, 0, false)
		is_sound_effect_playing = true
	}	

	move_and_collide2(hspd, vspd, obj_wall)

	if(on_cealing){
		audio_play_sound(snd_dead, 0, false)
		instance_destroy()
	}

	if(on_front){
		audio_play_sound(snd_dead, 0, false)
		instance_destroy()
	}
} else {
	// Calculating horizontal movement
	hspd = lerp(hspd, run_speed * move_x, acc)

	// Calculating vertical movement
	vspd += grav
	vspd = min(terminal_vspd, vspd)
	
	// Set flying animation
	set_animations("flying")
	
	// Adjusting horizontal speed
	hspd = hspd * 1.05
	
	// Setting new vertical movement
	if(jump_input){
		vspd -= grav * 3
	}
	
	// Setting a max up speed
	vspd = max(up_terminal_vspd, vspd)
	
	// Making the move
	move_and_collide2(hspd, vspd, obj_wall)
	
	// Dying on front
	if(on_front){
		audio_play_sound(snd_dead, 0, false)
		instance_destroy()
	}
}

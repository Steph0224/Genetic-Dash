// Estado para saber si choca con player
on_player = false
player_out = false

// Animaciones
trampoline_animations = {
	idling:		{frames: [0, 1]},
	active:		{frames: [1, 8]},
}

function set_trampoline_animations(state){
	new_animation = variable_struct_get(trampoline_animations, state);
	animations_frames = new_animation.frames
}

set_trampoline_animations("idling");
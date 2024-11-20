n_players = 20
counter = obj_counter
n_generations = 0
alarm_set(0, 1)
bots = ds_list_create()

function create_bot(){
	//if (counter.frame_counter % 2 == 0){
		var _xoffset = random_range(-8, 8)
		var _bot = instance_create_layer(obj_startpos.x + _xoffset, obj_startpos.y, "Instances", obj_bot)
		_bot.image_blend = make_color_hsv(random(255), 255, 255)
		return _bot
	//}
}

function initgen(_n){
	repeat(_n){
		var _bot = create_bot()
		ds_list_add(bots, _bot)		
	}
}

function nextgen(){
	
	ds_list_clear(bots)
	
	 show_debug_message("Peso del mejor")
	 show_debug_message(string(best_w))
	 show_debug_message(string(best_b))
	 
	 // Creating arrays copies
	 best_w_copy = matrix_copy(best_w)
	 best_b_copy = matrix_copy(best_b)
	 
	 best_w_copy_2 = matrix_copy(best_w)
	 best_b_copy_2 = matrix_copy(best_b)
	 
	
	initgen(n_players)
	
	
	for(var _i = 0; _i < n_players; _i++){
		var _pob = bots[|_i]
		if(_i < 1){
			_pob.neural_network.w = best_w_copy
			_pob.neural_network.b = best_b_copy
			show_debug_message(_i)
			show_debug_message("Padre")
			show_debug_message(_pob.neural_network.w)
		} else {
			
			var _offset = 0
			var _prob_w = 0
			var _prob_b = 0
			
			if (_i < n_players - 2){
				if (random(100) < 50){
				_offset = random_range(-2, 2) * choose(1, -1)
				_prob_w = 60
				_prob_b = 25
				show_debug_message(_i)
				show_debug_message("Hijo loco")
			} else {
				_offset = random_range(1, -1) * choose(1, -1)
				_prob_w = 30
				_prob_b = 15
				show_debug_message(_i)
				show_debug_message("Hijo medio")
			}
			
			if(random(100) < 20){
				_prob_w = 20
				_prob_b = 7
				_offset = random_range(0.5, -0.5) * choose(1, -1)
				show_debug_message(_i)
				show_debug_message("Hijo conservador")
			}
			} else {
				_prob_w = 20
				_prob_b = 5
				_offset = random_range(-1.5, 1.5)
				show_debug_message(_i)
				show_debug_message("Hijo conservador y loco")
			}
			
			_pob.neural_network.w = mutate_matrix(best_w_copy_2, _prob_w, _offset)
			_pob.neural_network.b = mutate_matrix(best_b_copy_2, _prob_b, _offset)
			show_debug_message(_pob.neural_network.w)
		}
	}
	
	
	
	show_debug_message("Peso del mejor al final")
	show_debug_message(string(best_w))
	show_debug_message(string(best_b))
	
	n_generations += 1
}

best_w = noone
best_b = noone
event_inherited();

decision_thres = 0

neural_network = instance_create_layer(x, y, "Instances", obj_nn)

function get_sensor_matrix(){
	var _matrix = create_random_matrix(neural_network.n_inputs, 1)
	_matrix[0][0] = 1 - (d_obstacle_ahead/sensor_view_hdist) // 0-1
	_matrix[1][0] = 1 - (d_obstacle_uphead/sensor_view_hdist) // 0-1
	_matrix[2][0] = 1 - (d_trampoline_ahead/sensor_view_hdist) // 0-1
	_matrix[3][0] = 1 - (d_obstacle_aheadown/sensor_view_vdist) // 0-1
	_matrix[4][0] = (d_obstacle_up/sensor_view_vdist) // 0-1
	_matrix[5][0] = 1 - (d_obstacle_down/sensor_view_vdist) // 0-1
	_matrix[6][0] = int64(b_is_on_jump_orb) // 0-1
	_matrix[7][0] = int64(b_is_flying) // 0-1
	if (b_is_flying){
		_matrix[0][0] = (1 - (d_obstacle_ahead/sensor_view_hdist)) * 2.25
		_matrix[1][0] = (1 - (d_obstacle_uphead/sensor_view_hdist)) * 0
		_matrix[5][0] = (1 - (d_obstacle_down/sensor_view_vdist)) *	0.3
		_matrix[3][0] = (1 - (d_obstacle_aheadown/sensor_view_vdist)) * 1.25
	}
	return _matrix
}

function get_player_input(){
	var _x = get_sensor_matrix()
	var _y = neural_network.evaluate(_x)
	if(_y[0][0] > decision_thres){
		return true	
	}
	return false
}
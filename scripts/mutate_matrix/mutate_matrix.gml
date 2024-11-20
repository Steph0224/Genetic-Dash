function mutate_matrix(_matrix, _prob, _off){
	
	var _matrix_copy = matrix_copy(_matrix)
	
	var n_rows = array_length(_matrix_copy)
	var n_cols = array_length(_matrix_copy[0])
	
	for(var _i = 0; _i < n_rows; _i++){
		for(var _j = 0; _j < n_cols; _j++){
			if(random(100) < _prob){
				_matrix_copy[_i][_j] = clamp(_matrix_copy[_i][_j] + _off, -1, 1)
			}
		}
	}
	
	return _matrix_copy
}
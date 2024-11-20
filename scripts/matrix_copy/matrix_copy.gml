function matrix_copy(_matrix){
	
	var _matrix_copy = [];
	
	var n_rows = array_length(_matrix)
	var n_cols = array_length(_matrix[0])
	
	for(var _i = 0; _i < n_rows; _i++){
		for(var _j = 0; _j < n_cols; _j++){
			_matrix_copy[_i][_j] = _matrix[_i][_j]
		}
	}
	
    //for (var _i = 0; _i < array_length(_matrix); _i++) {
      //  _matrix_copy[_i] = _matrix[_i];
    //}
	return _matrix_copy
}
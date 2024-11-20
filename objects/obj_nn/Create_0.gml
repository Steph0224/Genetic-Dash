n_inputs = 8
n_outputs = 1
n_hidden = 0

//No training
//w = create_random_matrix(n_outputs, n_inputs)
//b = create_random_matrix(n_outputs, 1)

//Trained with level 1
//w = [ [ 0.89,0.76,-0.51,1,0.08,0.70,1 ] ]
//b = [ [ -0.87 ] ]

// Trained with level 1 - 2
//w = [ [ 0.89,0.76,-0.51,1,0.08,0.70,1 ] ]
//b = [ [ -0.87 ] ]

// Preparing for level 3
//w = [ [ 0.89,0.76,-0.51,1,0.08,0.72,1,random_range(-1,1)  ] ]
//b = [ [ -0.85 ] ]

// Trained with level 1 - 2 - 3
w = [ [ 0.89,0.03,-0.44,1,0.08,0.72,1,-0.39 ] ]
b = [ [ -0.85 ] ]


function evaluate(_x, _w = w, _b = b){
	return _matrix_sum(_matrix_multiply(w, _x), b)
}

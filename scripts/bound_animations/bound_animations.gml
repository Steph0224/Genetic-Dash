// Función para mantener las animaciones entre el rango de frames que estas ocupan
function bound_animations(index, bounds){
	if (index < bounds[0] or index > bounds[1] + 0.99){
		return bounds[0];
	}
	
	return index;
}
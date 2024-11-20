// Asignación de la animación
image_index = bound_animations(image_index, animations_frames)

// Ver conexión con xyz
if instance_exists(nearest_saw_up){
	draw_line_width_color(x, y - 10, nearest_saw_up.x, nearest_saw_up.y, 2, c_red, c_red)
}
if instance_exists(nearest_saw_down){
	draw_line_width_color(x, y - 10, nearest_saw_down.x, nearest_saw_down.y, 2, c_blue, c_blue)
}

// Dibujar personaje
draw_self();
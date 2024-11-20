// Obtener si hay colisión con el player
on_player = place_meeting(x + 5 , y, obj_player)

if (on_player) set_trampoline_animations("active")

if (image_index >= image_number - 2) {
    // Detiene la animación y vuelve al primer frame
    set_trampoline_animations("idling")
}
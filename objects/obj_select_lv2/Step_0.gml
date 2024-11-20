if (mouse_check_button(mb_left)) {
    var mouseX = device_mouse_x(0); // Obtén la posición X del mouse
    var mouseY = device_mouse_y(0); // Obtén la posición Y del mouse

    if (position_meeting(mouseX, mouseY, id)) {
        // El mouse está sobre el objeto y se hizo clic izquierdo
        room_goto(Room_lv2); // Cambia a la sala deseada
    }
}
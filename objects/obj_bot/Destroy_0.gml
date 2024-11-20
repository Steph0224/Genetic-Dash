show_debug_message("died here")

obj_optimizer.best_w = neural_network.w
obj_optimizer.best_b = neural_network.b

if(instance_number(obj_bot) == 1){
	obj_optimizer.nextgen()
}

instance_destroy(neural_network)
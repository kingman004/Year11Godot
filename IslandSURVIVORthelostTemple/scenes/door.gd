extends AnimatedSprite2D

func _process(delta):
	var sticks = get_tree().get_node_count_in_group("sticks")
	if sticks == 0:
		play("open door")
		$StaticBody2D.queue_free()
		set_process(false)
		

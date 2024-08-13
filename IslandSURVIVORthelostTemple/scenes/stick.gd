extends Area2D


func _on_body_entered(body):

	if PlayerStats.collecting == "sticks":
		print ("+1 stick!")
		PlayerStats.add_stick(1)
		queue_free()

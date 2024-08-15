extends CollisionPolygon2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var sticks = get_tree().get_nodes_in_group("Stick")
	if sticks.size() == 0:
		

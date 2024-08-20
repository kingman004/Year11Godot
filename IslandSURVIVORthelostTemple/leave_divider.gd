extends StaticBody2D
@onready var player: CharacterBody2D = $"../Player"


func _process(delta: float) -> void:
	var sticks = get_tree().get_nodes_in_group("Stick")
	if sticks.size() == 0:
		queue_free()

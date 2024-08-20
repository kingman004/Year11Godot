extends StaticBody2D
@onready var player: CharacterBody2D = $"../Player"


func _process(delta: float) -> void:
	var leaves = get_tree().get_nodes_in_group("Leaves")
	if leaves.size() == 0:
		queue_free()

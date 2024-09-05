extends Area2D

@onready var forest_noise = $AudioStreamPlayer2D
@onready var player: CharacterBody2D = $"../Player"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$AudioStreamPlayer2D.play()
		get_parent().get_node("BackgroundMusicPlayer").stop()

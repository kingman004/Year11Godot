extends CanvasLayer


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_settings_pressed():
	pass

func _on_quit_pressed():
	get_tree().quit()

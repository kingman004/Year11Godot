#this code updates the ui of the player
extends CanvasLayer
@onready var stick_bar = $MarginContainer/CenterContainer/VBoxContainer/StickProgress/ProgressBar
@onready var leaves_bar = $MarginContainer/CenterContainer/VBoxContainer/LeavesProgress/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stick_bar.value = PlayerStats.sticks
	leaves_bar.value = PlayerStats.leaves

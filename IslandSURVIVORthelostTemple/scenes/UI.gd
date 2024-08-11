extends CanvasLayer
@onready var stick_progress = $MarginContainer/CenterContainer/VBoxContainer/StickProgress
@onready var leaves_progress = $MarginContainer/CenterContainer/VBoxContainer/LeavesProgress


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stick_progress.value = PlayerStats.sticks

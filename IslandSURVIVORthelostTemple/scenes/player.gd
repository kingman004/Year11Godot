extends CharacterBody2D
 
@onready var sprite_2d = $CanvasLayer/Sprite2D

@export var SPEED = 50.0
@export var ACCERATION = 20
@export var FRICTION = 10.0
@onready var sprite =$AnimatedSprite2D
var direction = Vector2.ZERO
var last_direction="right"
#func set_animation(anim):
	##var anim_name = ""
	#if last_direction == "left":
		#if velocity == Vector2.ZERO:
			#anim_name = "idle left"
		#if velocity != Vector2.ZERO:
			#anim_name = "walk left"
#
	#elif last_direction == "right":
		#if velocity == Vector2.ZERO:
			#anim_name = "idle right"
		#if velocity != Vector2.ZERO:
			#anim_name = "walk right"
#
	#elif last_direction == "up":
		#if velocity == Vector2.ZERO:
			#anim_name = "idle up"
		#if velocity != Vector2.ZERO:
			#anim_name = "walk up"
#
	#elif last_direction == "down":
		#if velocity == Vector2.ZERO:
			#anim_name = "idle down"
		#if velocity != Vector2.ZERO:
			#anim_name = "walk down"
	#sprite.play(anim_name)
	#



func _process(delta):
	var sticks = get_tree().get_nodes_in_group("Stick")
	if sticks.size() == 0:
		sticks = get_tree().get_nodes_in_group("Leaves")
	var current_position = global_position
	var closest_stick = null
	var min_distance = INF
	
	for stick in sticks:
		var stick_position = stick.global_position
		var distance = current_position.distance_to(stick_position)
		if distance < min_distance:
			min_distance = distance
			closest_stick = stick
	
	if closest_stick != null:
		var closest_stick_position = closest_stick.global_position
		var angle = (closest_stick_position - current_position).angle()
		sprite_2d.rotation = angle
#chatgpt^
func _physics_process(delta):
	var anim_name
	if Input.is_action_pressed("run"):
		SPEED = 80
		anim_name = "run "
	else:
		SPEED = 50
		anim_name = "walk "
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right","up","down")
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCERATION)
		if direction.x > 0:
			last_direction = "right"
		elif direction.x <0:
			last_direction = "left"
		elif direction.y<0:
			last_direction = "up"
		elif direction.y > 0:
			last_direction = "down"
	else:
		velocity = velocity.move_toward(Vector2. ZERO, FRICTION)
		anim_name = "idle "
	anim_name+=last_direction
	sprite.play(anim_name)
	#set_animation(anim_name)
	move_and_slide()



# Declare the progress bars as export variables so they can be set in the inspector
@export var progress_bar_1 : ProgressBar
@export var progress_bar_2 : ProgressBar

func _ready():
	# Connect the "value_changed" signal of progress_bar_1 to a method in this script

	
	# Initially set progress_bar_2 to be invisible
	progress_bar_2.visible = false


func _on_progress_bar_value_changed(value):
		# Check if the value of progress_bar_1 has reached 100
	if value >= 10:
		# Make progress_bar_2 visible
		progress_bar_2.visible = true
		progress_bar_1.visible = false
	else:
		# Ensure progress_bar_2 is not visible if progress_bar_1 is not at 100
		progress_bar_2.visible = false


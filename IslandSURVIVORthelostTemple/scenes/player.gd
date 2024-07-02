extends CharacterBody2D
 

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

extends Node2D

@export var speed: float = 100.0
@export var chase_range: float = 300.0  # Range within which the dino will chase the player
var player: Node2D  # Reference to the player node
var animated_sprite: AnimatedSprite2D
var game_over: bool = false  # Flag to track game over state
var chasing = false
func _ready():
	animated_sprite = $AnimatedSprite2D
	player = get_parent().get_node("Player")  # Adjust the path as needed
	animated_sprite.play("idle")  # Start with the idle animation

func _process(delta: float):
	if game_over:
		if Input.is_action_just_pressed("restart"):  # Check for "R" key
			_restart_game()
		return  # Skip the rest of the process if the game is over

	# Calculate distance to player
	var distance_to_player = position.distance_to(player.position)

	if distance_to_player < chase_range and chasing:
		# Move towards the player
		var direction = (player.position - position).normalized()
		position += direction * speed * delta

		# Play move animation
		animated_sprite.play("move")

		# Flip sprite based on direction
		animated_sprite.flip_h = direction.x < 0

		# Check for collision with the player
		if position.distance_to(player.position) < 5:  # Adjust threshold as necessary
			_on_dino_collision()

	else:
		# Play idle animation if not chasing
		animated_sprite.play("idle")

func _on_dino_collision():
	# Stop the game
	get_tree().paused = true
	game_over = true
	print("Game Over! Press 'R' to restart.")

func _restart_game():
	# Reset the game state
	get_tree().paused = false
	game_over = false
	
	# Reset positions or states here if needed
	position = Vector2(100, 100)  # Reset dino position (adjust as necessary)
	player.position = Vector2(400, 300)  # Reset player position (adjust as necessary)
	print("Game restarted! You can play again.")


func _on_timer_timeout() -> void:
	chasing = !chasing
	$Timer.wait_time = randi_range(2,5)
	$Timer.start()
	


func _on_dinosaurheartbeat_70443_body_entered(body: Node2D) -> void:
	if body == player:
		$AudioStreamPlayer2D2.play()
	


func _on_dinosaur_286565_area_entered(body: Node2D) -> void:
	if body == player:
		$AudioStreamPlayer2D2.play()


func _on_dinosaurheartbeat_70443_body_exited(body: Node2D) -> void:
	if body == player:
		$AudioStreamPlayer2D2.stop()




func _on_dinosaur_286565_body_exited(body: Node2D) -> void:
	if body == player:
		$AudioStreamPlayer2D2.stop()

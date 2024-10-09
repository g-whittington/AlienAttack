extends CharacterBody2D

@export var move_speed := 500
# This is like a blueprint to create rockets
const ROCKET = preload("res://scenes/rocket.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot_rocket()

# Player has an attribute "velocity" which move_and_slide() uses to move
func _physics_process(delta: float) -> void:
	# Only move when the keys are actually pressed
	velocity = Vector2.ZERO
	
	# Capture the desiried directional movement
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	
	# Make sure your vector is normalized
	velocity = velocity.normalized() * move_speed
	
	# Call this to move the player by its velocity
	move_and_slide()
	
	# Clamp the player position to the screen sizea
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
# Handles the instantiating of rocket scences on request
func shoot_rocket() -> void:
	add_child(ROCKET.instantiate())

extends CharacterBody2D

@export var move_speed := 300

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

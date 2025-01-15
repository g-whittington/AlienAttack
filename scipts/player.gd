extends CharacterBody2D


signal took_damage

@export var move_speed := 300

# This is like a blueprint to create rockets
const ROCKET = preload("res://scenes/rocket.tscn")
@onready var rocket_fire_sound: AudioStreamPlayer = $RocketFireSound

# removes the tie of the rocket instances from the player transform
@onready var rocket_container: Node = $RocketContainer

func _ready():
	get_node("RocketContainer")

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
	rocket_fire_sound.play()
	# make a rocket object
	var rocket_instance := ROCKET.instantiate()
	# set its position to the player and an additional 80px to the right
	rocket_instance.global_position = global_position + Vector2(80, 0)
	# add it to the list of rockets so it doesn't movw with the player
	rocket_container.add_child(rocket_instance)

func take_damage() -> void:
	emit_signal("took_damage")

func die() -> void:
	queue_free()

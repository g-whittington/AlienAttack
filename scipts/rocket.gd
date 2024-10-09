extends Area2D

@export var speed: int = 500

func _physics_process(delta: float) -> void:
	# Having speed*delta, it now changes the pixels/second moved to be
	# what we set the speed variable to. 
	global_position.x += speed*delta

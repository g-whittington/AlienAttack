extends Area2D


@export var speed: int = -300

func _physics_process(delta: float) -> void:
	global_position.x += speed*delta

# allowing the enemy instacne be the one to queue free it
func die() -> void:
	queue_free()

# collision resolution for with the player
func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	die()

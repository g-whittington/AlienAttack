extends Node2D


# enemies that can be spawned
const ENEMY = preload("res://scenes/enemy.tscn")

@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	print("one seonds")

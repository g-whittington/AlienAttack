extends Node2D


signal enemy_spawned(enemy_instance: Area2D)
# enemies that can be spawned
const ENEMY = preload("res://scenes/enemy.tscn")

@onready var timer: Timer = $Timer
@onready var spawn_positions: Node2D = $SpawnPositions

func _on_timer_timeout() -> void:
	spawn_enemy()
	
func spawn_enemy() -> void:
	# create an enemy
	var enemy_instance := ENEMY.instantiate()
	# get one of the SpawnPos's location
	var spawn_position : Marker2D = spawn_positions.get_children().pick_random()
	# change the enemy postion to be on the marker
	enemy_instance.global_position = spawn_position.global_position
		
	emit_signal("enemy_spawned", enemy_instance)

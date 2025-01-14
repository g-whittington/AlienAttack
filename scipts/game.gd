extends Node2D


var lives := 3
var score := 0

@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD

func _ready():
	hud.set_score_label(score)

# will kill missed enemies
func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()

# handles the lives count in the game scene 
func _on_player_took_damage() -> void:
	lives -= 1
	if lives == 0:
		player.die()

# used to add enemies as children of the game scene instead of spawner
func _on_enemy_spawner_enemy_spawned(enemy_instance: Area2D) -> void:
	# connects the enemy signal in the game scene
	enemy_instance.connect("enemy_death", _on_enemy_death)
	add_child(enemy_instance)

func _on_enemy_death() -> void:
	score += 100
	hud.set_score_label(score)
	

extends Node2D


var lives := 3

@onready var player: CharacterBody2D = $Player

# will kill missed enemies
func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()

# handles the lives count in the game scene 
func _on_player_took_damage() -> void:
	lives -= 1
	if lives == 0:
		player.die()

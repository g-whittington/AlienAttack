extends Node2D


var lives := 3
var score := 0

@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD
@onready var ui: CanvasLayer = $UI

const GAME_OVER_SCREEN = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives_left_label(lives)

# will kill missed enemies
func _on_death_zone_area_entered(area: Area2D) -> void:
	# so score is not increased 
	area.queue_free()

# handles the lives count in the game scene 
func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives_left_label(lives)
	if lives == 0:
		player.die()
		
		# awaiting for the timeout signal to pulse
		await get_tree().create_timer(1.5).timeout
		
		var game_over: Control = GAME_OVER_SCREEN.instantiate()
		game_over.set_score(score)
		ui.add_child(game_over)

# used to add enemies as children of the game scene instead of spawner
func _on_enemy_spawner_enemy_spawned(enemy_instance: Area2D) -> void:
	# connects the enemy signal in the game scene
	enemy_instance.connect("enemy_death", _on_enemy_death)
	add_child(enemy_instance)

func _on_enemy_death() -> void:
	score += 100
	hud.set_score_label(score)
	

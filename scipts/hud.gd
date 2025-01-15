extends Control


@onready var score: Label = $Score
@onready var lives_left: Label = $LivesLeft

func set_score_label(new_score: int) -> void:
	score.text = "SCORE: " + str(new_score)
	
func set_lives_left_label(new_lives: int) -> void:
	lives_left.text = str(new_lives)

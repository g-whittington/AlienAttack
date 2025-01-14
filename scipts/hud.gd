extends Control


@onready var score: Label = $Score

func set_score_label(new_score: int) -> void:
	score.text = "SCORE: " + str(new_score)

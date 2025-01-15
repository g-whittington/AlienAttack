extends Control


func set_score(end_score: int) -> void:
	$Panel/Score.text = "SCORE: " + str(end_score)

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

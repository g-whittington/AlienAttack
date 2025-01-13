extends Node2D


# will kill missed enemies
func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()

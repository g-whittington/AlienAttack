extends Path2D


@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var enemy: Area2D = $PathFollow2D/Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	path_follow_2d.progress_ratio = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow_2d.progress_ratio += 0.2*delta
	
	if path_follow_2d.progress_ratio >= 1:
		queue_free()

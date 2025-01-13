extends Area2D


@export var speed: int = 500
# used to delete rocket instances when the rocket is off screen
@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleNotifier

func _ready():
	# can use code to connect signals
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float) -> void:
	# Having speed*delta, it now changes the pixels/second moved to be
	# what we set the speed variable to. 
	global_position.x += speed*delta

func _on_screen_exited():
	# deletes the instance at the end of the frame it is called on
	queue_free()

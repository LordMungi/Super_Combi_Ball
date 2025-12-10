extends Control

@onready var pauseMenu = $"."

func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	if get_tree().paused == true:
		pauseMenu.show()
		Engine.time_scale = 0
	else:
		pauseMenu.hide()
		Engine.time_scale = 1
	pass

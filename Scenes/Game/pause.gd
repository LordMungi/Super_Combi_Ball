extends Control

@onready var pauseMenu = $"."

func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	if get_tree().paused == true:
		pauseMenu.show()
		Engine.time_scale = 0
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		pauseMenu.hide()
		Engine.time_scale = 1
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass

extends Control

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")

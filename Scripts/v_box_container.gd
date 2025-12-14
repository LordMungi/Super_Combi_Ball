extends VBoxContainer


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Settings/settings.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits/credits.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

extends VBoxContainer



func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")
	pass

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Settings/settings.tscn")
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits/credits.tscn")
	pass 


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass

extends Node3D

signal hitPlayer

func _ready():
	add_to_group("spikes")

func _on_area_3d_body_entered(body: Node3D) -> void:
	_player_hit()
	pass # Replace with function body.
	
func _player_hit() ->void:
		hitPlayer.emit()
		pass

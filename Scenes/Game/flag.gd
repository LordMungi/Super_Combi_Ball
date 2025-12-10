extends Area3D

signal playerWon

func _ready() -> void:
	pass 

func _on_body_entered(body: Node3D) -> void:
	_on_player_won()
	pass 
	
func _on_player_won() -> void:
	playerWon.emit()
	pass

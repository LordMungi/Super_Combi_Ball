extends Node3D

var player : CharacterBody3D
var level : Node3D
var spikes = []
var flag = Area3D

func _ready() -> void:
	level = get_parent().get_node("Level")
	spikes = level.get_tree().get_nodes_in_group("spikes")
	player = get_parent().get_node("Character")
	flag = level.get_node("Flag")
	for spike in spikes:
		spike.hitPlayer.connect(_on_player_hit)
	pass 
	flag.playerWon.connect(_on_player_won)

func _on_player_hit() ->void:
	player.global_position = player.checkPoint
	player.velocity = Vector3.ZERO
	print("golpeo")
	
func _on_player_won()->void:
	##show que gano
	pass

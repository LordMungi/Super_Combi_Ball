extends Node3D

var player : CharacterBody3D
var level : Node3D
var spikes = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = get_parent().get_node("Level")
	spikes = level.get_tree().get_nodes_in_group("spikes")
	player = get_parent().get_node("Character")
	for spike in spikes:
		spike.hitPlayer.connect(_on_player_hit)
	pass # Replace with function body.

func _on_player_hit() ->void:
	player.global_position = player.checkPoint
	player.velocity = Vector3.ZERO
	print("golpeo")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

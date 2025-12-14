extends Node3D

signal game_won

var spikes = []
var flag = Area3D
@onready var player : CharacterBody3D = %Character
@onready var level : Node3D = %Level
@onready var music : AudioStreamPlayer = %SuspenseMusic

func _ready() -> void:
	spikes = level.get_tree().get_nodes_in_group("spikes")
	flag = level.get_node("Flag")
	for spike in spikes:
		spike.hitPlayer.connect(_on_player_hit)
	pass 
	flag.playerWon.connect(_on_player_won)
	
func _process(delta: float) -> void:
		_loopAudio(music)

func _on_player_hit() ->void:
	player.global_position = player.checkPoint
	player.velocity = Vector3.ZERO
	
func _on_player_won()->void:
	emit_signal("game_won")
	get_tree().change_scene_to_file("res://Scenes/Game/win_sceen.tscn")

	
func _loopAudio(audio) -> void:
	if audio:
		if	!audio.playing:
			audio.play()
	pass
	

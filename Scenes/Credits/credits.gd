extends Control

@onready var modelsList : ItemList = %ModelsList
@onready var soundsList : ItemList = %SoundsList
@onready var progList : ItemList = %ProgList

var modelsLinks = Dictionary()
var soundsLinks = Dictionary()
var progLinks = Dictionary()

func _ready() -> void:
	modelsLinks[0] = "https://void1gaming.itch.io/free-3d-assets-collection"
	modelsLinks[1] = "https://raildogameart.itch.io/cheese-miner"
	
	soundsLinks[0] = "https://untrended.itch.io/stealth-ambients"
	
	progLinks[0] = "https://agustinlaure.itch.io/"
	progLinks[1] = "https://movious.itch.io/"
	progLinks[2] = "https://lordmungi.itch.io/"

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
		
	for i in modelsLinks.size():
		if modelsList.is_selected(i):
			modelsList.deselect(i)
			goToReferredLink(modelsLinks[i])
		
	for i in soundsLinks.size():
		if soundsList.is_selected(i):
			soundsList.deselect(i)
			goToReferredLink(soundsLinks[i])
			
	for i in progLinks.size():
		if progList.is_selected(i):
			progList.deselect(i)
			goToReferredLink(progLinks[i])
	
func goToReferredLink(link):
	OS.shell_open(link)

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")

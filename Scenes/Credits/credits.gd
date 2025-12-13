extends Control

@onready var modelsList : ItemList = %ModelsList
@onready var soundsList : ItemList = %SoundsList

var modelsLinks = Dictionary()
var soundsLinks = Dictionary()

func _ready() -> void:
	modelsLinks[0] = "https://void1gaming.itch.io/free-3d-assets-collection"
	modelsLinks[1] = "https://raildogameart.itch.io/cheese-miner"
	
	soundsLinks[0] = "https://untrended.itch.io/stealth-ambients"
	pass 

func _process(delta: float) -> void:
	for i in modelsLinks.size():
		if modelsList.is_selected(i):
			modelsList.deselect(i)
			goToReferredLink(modelsLinks[i])
			pass
		pass
		
	for i in soundsLinks.size():
		if soundsList.is_selected(i):
			soundsList.deselect(i)
			goToReferredLink(soundsLinks[i])
			pass
		pass
	pass
	
func goToReferredLink(link):
	OS.shell_open(link)
	pass

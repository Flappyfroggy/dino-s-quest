extends Area2D
@onready var interactable: Area2D = $interactables
func _ready():
	interactable.interact = _on_interact

func _on_interact():
	DialogueManager.show_dialogue_balloon(load("res://jeff.dialogue"), "start")
	return

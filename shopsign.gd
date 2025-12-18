extends Area2D
@onready var interactable: Area2D = $interactables
func _ready():
	interactable.interact = _on_interact

func _on_interact():
	if e.finish_dialogue:
		e.finish_dialogue = false
		DialogueManager.show_dialogue_balloon(load("res://shop_sign.dialogue"), "start")

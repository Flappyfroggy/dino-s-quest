extends Area2D
@onready var interactable: Area2D = $interactables
@onready var sprite = $Sprite2D
func _ready():
	interactable.interact = _on_interact
	sprite.play("default")
func _on_interact():
	if e.finish_dialogue:
		DialogueManager.show_dialogue_balloon(load("res://catsleep.dialogue"), "start")
		e.finish_dialogue = false
		return

extends Area2D
@onready var interactable: Area2D = $interactables

func _ready():
	interactable.interact = _on_interact

func _on_interact():
	var game1score =+ 100
	e.game1score = str(game1score)
	queue_free()

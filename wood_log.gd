extends Area2D
@onready var interactable: Area2D = $interactables
func _ready():
	interactable.interact = _on_interact

func _on_interact():
	e.game1score += 100
	e.game1actualscore = str(e.game1score)
	e.k = true
	queue_free()

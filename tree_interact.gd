extends Area2D
@onready var interactable: Area2D = $interactables
func _ready():
	interactable.interact = _on_interact

func _on_interact():
	e.game1score -= 50
	e.game1actualscore = str(e.game1score)
	e.l = true
	queue_free()

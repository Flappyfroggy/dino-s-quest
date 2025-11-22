extends Area2D
@onready var questui1 = preload("res://billboard_ui.tscn")
@onready var interactable: Area2D = $interactables
var questui
func _ready() -> void:
	interactable.interact = _on_interact
	questui = questui1.instantiate()
	add_child(questui)
	questui.hide()
	questui.visible = false

func _on_interact():
	questui.show()

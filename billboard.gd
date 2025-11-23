extends Area2D
@onready var questui1 = preload("res://actual_billboard_ui.tscn")
@onready var interactable: Area2D = $interactables
var questui
var canvaslayer
func _ready():
	interactable.interact = _on_interact
	questui = questui1.instantiate()
	add_child(questui)
	canvaslayer = questui.get_node("CanvasLayer")
	canvaslayer.hide()
	

func _on_interact():
	canvaslayer.show()
	
func _process(_delta):
	if e.n:
		canvaslayer.hide()

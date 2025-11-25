extends Area2D
@onready var questui1 = preload("res://actual_billboard_ui.tscn")
@onready var interactable: Area2D = $interactables
@onready var finishminigame1screen = preload("res://minigame1complete.tscn")
@onready var questui2 = preload("res://minigame_1_complete.tscn")

var questui
var canvaslayer
var finishminigame1screencanvas
var f
var questuii
var questuii_canvas
func _ready():
	interactable.interact = _on_interact
	questui = questui1.instantiate()
	add_child(questui)
	canvaslayer = questui.get_node("CanvasLayer")
	canvaslayer.hide()
	questuii = questui2.instantiate()
	add_child(questuii)
	questuii_canvas = questuii.get_node("CanvasLayer")
	questuii_canvas.hide()

func _on_interact():
	canvaslayer.show()
	if e.finishminigame1 and not e.shown1:
		f = finishminigame1screen.instantiate()
		add_child(f)
		finishminigame1screencanvas = f.get_node("CanvasLayer")
		finishminigame1screencanvas.show()
		canvaslayer.hide()
	if e.finishminigame1 and e.shown1:
		questuii_canvas.show()
func _process(_delta):
	if e.n:
		canvaslayer.hide()
		e.n = false
	if e.exit:
		finishminigame1screencanvas.hide()
		canvaslayer.hide()
		e.f = false
		e.shown1 = true

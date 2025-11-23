extends Button
var quest1
var canvasquest1
func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	quest1 = preload("res://billboard_ui.tscn").instantiate()
	add_child(quest1)
	canvasquest1 = quest1.get_node("CanvasLayer")
	e.n = true

func _process(_delta):
	if e.f:
		canvasquest1.hide()
		e.f = false

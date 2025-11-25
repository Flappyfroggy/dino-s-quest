extends Button
var quest1
var canvasquest1
func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	if not e.finishminigame1:
		quest1 = preload("res://billboard_ui.tscn").instantiate()
		add_child(quest1)
		canvasquest1 = quest1.get_node("CanvasLayer")
		e.n = true
	
#following deletes the help the mayor request ui,
#e.f is activated through the exit button on that page
func _process(_delta):
	if e.f:
		canvasquest1.hide()
		e.f = false

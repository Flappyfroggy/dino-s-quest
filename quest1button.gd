extends Button
var quest1
func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	quest1 = preload("res://billboard_ui.tscn").instantiate()
	add_child(quest1)
	e.n = true

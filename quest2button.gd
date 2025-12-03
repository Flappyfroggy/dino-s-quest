extends Button
var quest2
var canvasquest2
func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	if not e.finishminigame2:
		quest2 = preload("res://secondquest_ui.tscn").instantiate()
		add_child(quest2)
		canvasquest2 = quest2.get_node("CanvasLayer")
		e.n = true
		#e.n hides the billboard page with the quests
		# through the billboard code
		pass
	
#following deletes the help the penguin request ui,
#e.f is activated through the exit button on that page
func _process(_delta):
	if e.closequest2:
		canvasquest2.hide()
		e.closequest2 = false

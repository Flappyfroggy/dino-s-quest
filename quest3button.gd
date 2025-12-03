extends Button
var quest3
var canvasquest3
func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	if not e.finishminigame3:
		quest3 = preload("res://thirdquest_ui.tscn").instantiate()
		add_child(quest3)
		canvasquest3 = quest3.get_node("CanvasLayer")
		e.n = true
		#e.n hides the billboard page with the quests
		# through the billboard code
		pass
	
#following deletes the help the villager request ui,
#e.f is activated through the exit button on that page
func _process(_delta):
	if e.closequest3:
		canvasquest3.hide()
		e.closequest3 = false

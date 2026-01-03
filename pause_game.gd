extends Control
func _ready():
	e.paused = true
	get_tree().paused = true
func _on_button_pressed() -> void:
	e.paused = false
	e.pausemenu_added = false
	get_tree().paused = false
	queue_free()
	

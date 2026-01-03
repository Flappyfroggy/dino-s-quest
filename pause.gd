extends Control
@onready var pause_menu_preload = preload("res://pause_game.tscn")
func _on_button_pressed() -> void:
	if not e.pausemenu_added:
		var pause_menu = pause_menu_preload.instantiate()
		add_child(pause_menu)
		e.pausemenu_added = true

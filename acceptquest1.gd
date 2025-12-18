extends Button
@onready var transition = $"../../../AnimationPlayer"
func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	transition.play("new_animation")
	get_tree().change_scene_to_file("res://minigame_1.tscn")

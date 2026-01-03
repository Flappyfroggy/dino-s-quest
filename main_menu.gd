extends Node2D
@onready var animation = $AnimationPlayer
@onready var sprite = $AnimationPlayer/Sprite2D
func _on_button_pressed() -> void:
	sprite.show()
	animation.play("new_animation")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://village.tscn")

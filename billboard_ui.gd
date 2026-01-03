extends Control
@onready var t = $AnimationPlayer
@onready var canvas = $CanvasLayer
func _on_acceptbutton_pressed() -> void:
	canvas.hide()
	t.play("new_animation")
	sfx.click_sfx()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://minigame_1.tscn")

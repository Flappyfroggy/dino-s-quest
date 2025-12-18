extends Control
@onready var t = $AnimationPlayer
@onready var c= $CanvasLayer
func _on_acceptbutton_pressed() -> void:
	c.hide()
	t.play("new_animation")
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://space_Shooter.tscn")

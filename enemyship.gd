extends CharacterBody2D
func _physics_process(_delta):
	velocity.y = 50
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
		queue_free()
		e.spacepoint_int += int(50)
		e.spaceshootpoints = str(e.spacepoint_int)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	e.spacepoint_int -= int(300)
	e.spaceshootpoints = str(e.spacepoint_int)

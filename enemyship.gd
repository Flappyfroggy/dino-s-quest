extends CharacterBody2D
func _physics_process(_delta):
	velocity.y = 50
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
		queue_free()
		

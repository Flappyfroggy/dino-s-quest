extends CharacterBody2D

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = 100
	elif Input.is_action_pressed("left"):
		velocity.x = -100
	if Input.is_action_pressed("attack"):
		shoot()
	move_and_slide()
	
func shoot():
	pass


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.

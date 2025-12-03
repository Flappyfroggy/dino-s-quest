extends StaticBody2D
func _physics_process(delta):
	position.x += -600 * delta
	position.y = 433

func _on_zombie_area_entered(area: Area2D) -> void:
	if area.name == "dagger":
		queue_free()
		e.zombiedeadcount += 1
	if area.name == "dino":
		e.finishminigame3 = true
		get_tree().change_scene_to_file("res://village.tscn")

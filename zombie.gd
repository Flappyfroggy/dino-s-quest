extends StaticBody2D
@onready var transition_sprite = $Sprite2D2
@onready var animation = $AnimationPlayer
func _physics_process(delta):
	position.x += -600 * delta
	position.y = 433
func _ready():
	transition_sprite.hide()
func _on_zombie_area_entered(area: Area2D) -> void:
	if area.name == "dagger":
		queue_free()
		e.zombiedeadcount += 1
		e.playsound = true
	if area.name == "dino":
		e.finishminigame3 = true
		transition_sprite.show()
		animation.play("transition")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://village.tscn")

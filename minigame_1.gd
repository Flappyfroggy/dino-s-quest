extends Node2D
@onready var transition = $AnimationPlayer
func _ready():
	transition.play("new_animation")

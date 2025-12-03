extends Node2D
@export var p_1: Vector2 = Vector2(619,259)
@export var p_2: Vector2 = Vector2(3500,500)
@onready var spawntimer = $Timer
@onready var zombie_instance = preload("res://zombie.tscn")
var existing_positions: Array = []
func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	var rando_point_inside: Vector2 = Vector2(x_value, y_value)
	return (rando_point_inside)
func spawn():
	var zombie = zombie_instance.instantiate()
	add_child(zombie)
	var pos = get_random_point_inside(p_1, p_2)
	zombie.position = pos
	existing_positions.append(pos)
	return
func _ready():
	spawntimer.start()
	spawntimer.timeout.connect(self.timeout)
func timeout():
	randomize()
	for i in range(2):
		spawn()
	spawntimer.start()

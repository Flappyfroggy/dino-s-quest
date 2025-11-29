extends Node2D
@export var p_1: Vector2 = Vector2(36,63)
@export var p_2: Vector2 = Vector2(1152,70)
@onready var enemyship: Resource = preload("res://enemyship.tscn")
@onready var shiptimer
var enempyship_instance
var existing_positions: Array = []
func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	var rando_point_inside: Vector2 = Vector2(x_value, y_value)
	return (rando_point_inside)
func spawn():
	enempyship_instance = enemyship.instantiate()
	add_child(enempyship_instance)
	var pos = get_random_point_inside(p_1, p_2)
	enempyship_instance.position = pos
	existing_positions.append(pos)
	return
func _ready():
	shiptimer = get_node("Timer")
	shiptimer.timeout.connect(self._on_timer_end)
	randomize()
	for i in range(2):
		spawn()
func _on_timer_end():
	e.shiptimero = true
	print("timer ended")
func _physics_process(_delta):
	if e.shiptimero:
		print("ship spawn")
		randomize()
		for i in range(3):
			spawn()
		e.shiptimero = false
		e.shiptimerstarted = false
	if not e.shiptimero and not e.shiptimerstarted:
		shiptimer.start()
		print("ship timer started")
		e.shiptimerstarted = true

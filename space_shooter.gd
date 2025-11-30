extends Node2D
@export var p_1: Vector2 = Vector2(120,81)
@export var p_2: Vector2 = Vector2(1152,133)
@onready var enemyship: Resource = preload("res://enemyship.tscn")
@onready var shiptimer
@onready var points = $Label
@onready var timelimit = $TIMELIMIT
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
	timelimit.timeout.connect(self.timeout)
	timelimit.start()
	randomize()
	for i in range(2):
		spawn()
func _on_timer_end():
	e.shiptimero = true
func timeout():
	get_tree().change_scene_to_file("res://village.tscn")
	e.finishminigame2 = true
func _physics_process(_delta):
	if e.shiptimero:
		randomize()
		for i in range(3):
			spawn()
		e.shiptimero = false
		e.shiptimerstarted = false
	if not e.shiptimero and not e.shiptimerstarted:
		shiptimer.start()
		e.shiptimerstarted = true
	var timeleft = timelimit.time_left
	var timelefto = str(round(timeleft))
	points.text = "Time = " + timelefto + " Points = " + e.spaceshootpoints

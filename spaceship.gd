extends CharacterBody2D
@onready var lasercd = $Timer
var left = 0
var right = 1152
func _ready():
	lasercd.timeout.connect(self._on_timer_timeout)
func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		if self.global_position.x < right:
			velocity.x = 300
	elif Input.is_action_pressed("left"):
		if self.global_position.x > left:
			velocity.x = -300
	if Input.is_action_pressed("attack"):
		shoot()
	move_and_slide()
	
func shoot():
	if not e.lasercd:
		var laser = preload("res://laser.tscn").instantiate()
		add_child(laser)
		lasercd.start()
		e.lasercd = true
func _on_timer_timeout():
	e.lasercd = false
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "eepy":
		e.spacepoint_int -= int(300)
		e.spaceshootpoints = str(e.spacepoint_int)
func _process(float) -> void:
	velocity.x = 0

extends CharacterBody2D
var initial_p = Vector2(1.0, 0.0)
var notfloor = 0.0
var gravity = 2000.0
func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x = e.speed
	elif Input.is_action_pressed("left"):
		velocity.x = -e.speed
	if not is_on_floor():
		velocity.y += gravity * delta
		notfloor += delta
	if is_on_floor():
		notfloor = 0.0
	if notfloor >= 3:
		position = initial_p
		notfloor = 0
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = e.jump
	move_and_slide()

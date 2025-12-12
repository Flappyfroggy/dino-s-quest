extends CharacterBody2D
var initial_p = Vector2(1.0, 0.0)
var notfloor = 0.0
var gravity = 2000.0
var notcooldown
var started
@onready var timer = $Timer
@onready var dagger_scene = preload("res://dagger.tscn")
@onready var leftdagger_scene = preload("res://dagger_left.tscn")
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
	if  Input.is_action_just_pressed("attack") and e.allowdagger:
		shoot()
	if Input.is_action_just_pressed("left_attack") and e.allowdagger:
		shoot_left()
	move_and_slide()
func _ready():
	if not e.playerdialogue:
		DialogueManager.show_dialogue_balloon(load("res://player.dialogue"), "start")
		e.playerdialogue = true
func shoot():
	if notcooldown:
		var dagger = dagger_scene.instantiate()
		add_child(dagger)
		notcooldown = false
		started = false
func shoot_left():
	if notcooldown:
		var left_dagger = leftdagger_scene.instantiate()
		add_child(left_dagger)
		notcooldown = false
		started = false
func _process(_float) -> void:
	if not notcooldown and not started:
		timer.start()
		started = true

func _on_timer_timeout() -> void:
	notcooldown = true

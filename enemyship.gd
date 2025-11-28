extends CharacterBody2D
@onready var shiptimer = $Timer
func _physics_process(_delta):
	velocity.y = 100
	move_and_slide()
	if not e.shiptimer:
		shiptimer.start()
func _on_timer():
	e.shiptimer = true
	
func _ready():
	shiptimer.timeout.connect(self._on_timer)
#THIS TIMER ISNT WORKIN

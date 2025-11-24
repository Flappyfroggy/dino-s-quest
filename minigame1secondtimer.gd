extends Timer
@onready var timerlabel: Label = $"/root/minigame1level2/CharacterBody2D/Label"
@onready var debristimer: Timer = $"/root/minigame1level2/Timer2"
var timelefto
var debristimer_started
func _ready():
	self.timeout.connect(_on_timer_timeout)
	debristimer.timeout.connect(self._t)
	
func _process(_delta):
	var timeleft = self.time_left
	timelefto = str(round(timeleft))
	if not debristimer_started:
		timerlabel.text = "LEVEL 2: You have " + timelefto + " seconds and a total score of " + e.game1actualscore
	if e.l and not debristimer_started:
		timerlabel.text = "thats not debris!"
		debristimer.start()
		debristimer_started = true
	if e.k and not debristimer_started:
		timerlabel.text = "removed debris!"
		debristimer.start()
		debristimer_started = true
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://village.tscn")
	e.finishminigame1 = true
func _t():
	e.l = false
	e.k = false
	debristimer_started = false

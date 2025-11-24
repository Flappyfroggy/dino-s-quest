extends Timer
@onready var timerlabel: Label = $"/root/minigame1/CharacterBody2D/Label"
@onready var debristimer: Timer = $"/root/minigame1/Timer2"
var timelefto
func _ready():
	self.timeout.connect(_on_timer_timeout)
	debristimer.timeout.connect(_t)
func _process(_delta):
	var timeleft = self.time_left
	timelefto = str(round(timeleft))
	timerlabel.text = "You have " + timelefto + " seconds and a score of " + e.game1actualscore
	if e.l:
		timerlabel.text = "thats not debris!"
		debristimer.start()
func _on_timer_timeout():
	print ("timer done")
func _t():
	print ("hello")
	e.l = false

extends Timer
@onready var timerlabel: Label = $"/root/minigame1/CharacterBody2D/Label"
func _ready():
	self.timeout.connect(_on_timer_timeout)
func _process(_delta):
	var timeleft = self.time_left
	var timelefto = str(round(timeleft))
	timerlabel.text = "You have " + timelefto + " seconds and a score of " + e.game1score
func _on_timer_timeout():
	print ("timer done")

extends Timer
@onready var timerlabel: Label = $"/root/minigame1/CharacterBody2D/Label"
@onready var debristimer: Timer = $"/root/minigame1/Timer2"
@onready var transition_sprite = $o_o
@onready var animation = $AnimationPlayer
var timelefto
var debristimer_started
func _ready():
	self.timeout.connect(_on_timer_timeout)
	debristimer.timeout.connect(self._t)
	transition_sprite.hide()
func _process(_delta):
	var timeleft = self.time_left
	timelefto = str(round(timeleft))
	if not debristimer_started:
		timerlabel.text = "You have " + timelefto + " seconds and a score of " + e.game1actualscore
	if e.l and not debristimer_started:
		timerlabel.text = "thats not debris!"
		debristimer.start()
		debristimer_started = true
	if e.k and not debristimer_started:
		timerlabel.text = "removed debris!"
		debristimer.start()
		debristimer_started = true
func _on_timer_timeout():
	transition_sprite.show()
	animation.play("new_animation")
func _t():
	e.l = false
	e.k = false
	debristimer_started = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://minigame_1_level_2.tscn")

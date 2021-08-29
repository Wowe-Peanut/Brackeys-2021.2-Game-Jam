extends Node2D

onready var timer = $Timer
onready var countdown = $TimerDisplay
onready var StartButton = $SpeechBubble/StartButton

var Started = false

func _ready():
	timer.set_wait_time(30)
	timer.connect("timeout", self, "TimerDone")
	SetPickable(false)

func SetPickable(A):
	for _i in $Objects.get_children():
		_i.set_pickable(A)
	


func _process(delta):
	if Started:
		var r = timer.time_left
		countdown.text = str(int(r))

func TimerDone():
	timer.stop()
	Global.End()


func _on_StartButton_pressed():
	timer.start()
	SetPickable(true)
	Started = true
	Global.StartMusic()
	$SpeechBubble.hide()

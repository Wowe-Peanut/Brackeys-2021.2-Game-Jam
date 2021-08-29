extends Node2D

onready var timer = $Timer
onready var countdown = $TimerDisplay
onready var StartButton = $SpeechBubble/StartButton

func _ready():
	timer.set_wait_time(30)
	timer.connect("timeout", self, "TimerDone")



func _process(delta):
	var r = timer.time_left
	if r >= 60:
		countdown.text = str(int(r / 60)) + ":" + str(int(r)%60)
		pass
	else:
		countdown.text = str(int(r))
		pass

func TimerDone():
	timer.stop()
	Global.End()


func _on_StartButton_pressed():
	timer.start()
	$SpeechBubble.hide()

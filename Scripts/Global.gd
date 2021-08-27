extends Node2D

onready var AudioPlayer = $AudioStreamPlayer
var held_object = null

var MessyThings = 0

func _ready():
	#AudioPlayer.play()
	pass

func UpMess():
	MessyThings += 1
	print(MessyThings)
 

#Makes it so that only 1 object is picked up at a time
#Functions can be extended to other objects we wanna pickup (look at clothing.tscn for example)
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()

func _unhandled_input(event):
	if event.is_action_released("click") && held_object:
		held_object.drop(Input.get_last_mouse_speed())
		held_object = null

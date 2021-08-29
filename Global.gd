extends Node2D

onready var AudioPlayer = $AudioStreamPlayer
var held_object = null

var MessyThings = 0

func _ready():
	get_tree().change_scene("res://Menu.tscn")

func UpMess():
	MessyThings += 1

func GetMess():
	return MessyThings

func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()

func _unhandled_input(event):
	if event.is_action_released("click") && held_object:
		held_object.drop(Input.get_last_mouse_speed())
		held_object = null

func End():
	get_tree().change_scene("res://EndScreen.tscn")
	
	
func StartMusic():
	AudioPlayer.play()

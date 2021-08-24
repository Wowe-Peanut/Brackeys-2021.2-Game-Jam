extends StaticBody2D

var on = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if not on:
			get_node("Sprite").texture = load("res://Assets/Yellow_Circle.png")
			print("ON")
			on = true
		else:
			get_node("Sprite").texture = load("res://Assets/Blue_Circle.png")
			print("OFF")
			on = false

#func _on_CeillingLight_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
#		if not on:
#			$CeillingLight.texture = load("res://Assests/Yellow_Circle.png")
#			print("ON")
#		else:
#			$CeillingLight.texture = load("res://Assests/Blue_Circle.png")
#			print("OFF")

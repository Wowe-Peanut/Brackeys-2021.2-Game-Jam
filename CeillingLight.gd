extends StaticBody2D

onready var sprite = $Sprite

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
			sprite.region_rect.position.y = 520
			on = true
		else:
			sprite.region_rect.position.y = 70
			on = false

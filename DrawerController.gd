extends Area2D

onready var clothing = preload("res://FoldedClothing.tscn")

var opened = false
var contents = []
var clothing_offset = Vector2(-65, -60)

func _ready():
	populate()
	
func populate():
	randomize()
	for i in range(3):
		var n = clothing.instance()
		contents.append(n)
		add_child(n)
		n.hide()
		n.position += clothing_offset
		n.position.x += i * 64

func _on_Drawer_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if opened:
			close()
		else:
			open()

func open():
	opened = !opened
	$Sprite.scale = Vector2(0.65, 0.65)
	show_contents()
	
func close():
	opened = !opened
	$Sprite.scale = Vector2(0.5, 0.5)
	hide_contents()
	
func show_contents():
	for c in contents:
		if(is_instance_valid(c)):
			c.show()

func hide_contents():
	for c in contents:
		if(is_instance_valid(c)):
			c.hide()

func remove_clothing():
	pass

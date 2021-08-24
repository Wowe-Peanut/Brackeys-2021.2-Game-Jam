extends Area2D

onready var clothing = preload("res://FoldedClothing.tscn")

var opened = false
var open_offset = Vector2(28, 10)
var contents = []
var clothing_offset = Vector2(-55, -42)

func _ready():
	populate()
	
func populate():
	randomize()
	for i in range(rand_range(1, 4)):
		var n = clothing.instance()
		contents.append(n)
		add_child(n)
		n.hide()
		n.position += clothing_offset
		n.position.x += i * 32

func _on_Drawer_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if opened:
			close()
		else:
			open()

func open():
	$Sprite.texture = load("res://Assets/TempDrawerOpen.png")
	opened = !opened
	position += open_offset
	$Hitbox.position += open_offset
	show_contents()
	
func close():
	$Sprite.texture = load("res://Assets/TempDrawerClosed.png")
	opened = !opened
	position -= open_offset
	$Hitbox.position -= open_offset
	hide_contents()
	
func show_contents():
	for c in contents:
		c.show()

func hide_contents():
	for c in contents:
		c.hide()


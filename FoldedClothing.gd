extends Area2D

onready var clothing_prefab  = preload("res://Clothing.tscn")
onready var sprite = $Sprite

onready var clothing = clothing_prefab.instance()


func _ready():
	randomize()
	var a = int(rand_range(0, 4))
	if a == 0:
		clothing.SetType("Shirt")
	elif a == 1:
		clothing.SetType("Pants")
	elif a == 2:
		clothing.SetType("Socks")
	elif a == 3:
		clothing.SetType("Underwear")

			
func _on_FoldedClothing_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		clothing.position = self.global_position
		get_tree().get_root().get_node("Room").add_child(clothing)
		self.queue_free()

extends Area2D

onready var clothing_prefab  = preload("res://Clothing.tscn")
onready var sprite = $Sprite

var clothing


func _ready(): 
	clothing = clothing_prefab.instance()
	randomize()
	var a = int(rand_range(0, 4))
	if a == 0:
		sprite.region_rect = Rect2(91, 116, 228, 107)
		clothing.clothing_type = "Shirt"
	elif a == 1:
		sprite.region_rect = Rect2(740, 116, 228, 107)
		clothing.clothing_type = "Pants"
	elif a == 2:
		sprite.region_rect = Rect2(420, 116, 230, 107)
		clothing.clothing_type = "Socks"
	elif a == 3:
		sprite.region_rect = Rect2(420, 116, 230, 107)
		clothing.clothing_type = "Underwear"
			
func _on_FoldedClothing_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		clothing.position = self.global_position
		get_tree().get_root().get_node("Room").add_child(clothing)
		self.queue_free()

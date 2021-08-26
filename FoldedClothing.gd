extends Area2D

onready var clothing_prefab  = preload("res://Clothing.tscn")
onready var sprite = $Sprite

onready var clothing = clothing_prefab.instance()


func _ready():
	var type = clothing.type
	
			
func _on_FoldedClothing_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		clothing.position = self.global_position
		get_tree().get_root().get_node("Room").add_child(clothing)
		self.queue_free()

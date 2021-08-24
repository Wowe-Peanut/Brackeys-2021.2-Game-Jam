extends Area2D

onready var clothing  = preload("res://Clothing.tscn")

func _on_FoldedClothing_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		print("Clicked")
		var clothing_instance = clothing.instance()
		clothing_instance.position = self.global_position
		get_tree().get_root().get_node("Room").add_child(clothing_instance)
		self.hide()

extends RigidBody2D

onready var sprite = $Sprite

var normal_rect = Rect2(20, 20, 535, 430)
var broken_rect = Rect2(431, 535, 534, 430)

func _ready():
	mode = RigidBody2D.MODE_STATIC
	sprite.region_rect = normal_rect
	
func break_self():
	sprite.region_rect = broken_rect
	print("break")

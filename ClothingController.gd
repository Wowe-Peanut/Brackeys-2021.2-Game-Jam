extends RigidBody2D

onready var hitbox = $Hitbox
onready var sprite = $Sprite

var held = false
var offset = Vector2.ZERO
signal clicked



func _ready():
	self.connect("clicked", Global, "_on_pickable_clicked")
	emit_signal("clicked", self)
	
func SetType(Type):
	"""
	match Type:
		"Shirt":
			sprite.region_rect = Rect2(61, 54, 46, 32)
		"Pants":
			sprite.region_rect = Rect2(55, 55, 38, 40)
		"Socks":
			sprite.region_rect = Rect2(19, 30, 21, 23)
		"Underwear":
			sprite.region_rect = Rect2(47, 36, 30, 20)
	"""


func _on_Clothing_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		emit_signal("clicked", self)
	
		
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position() + offset
	
func pickup():
	mode = RigidBody2D.MODE_STATIC
	held = true
	offset = global_position - get_global_mouse_position()

func drop(impulse=Vector2.ZERO):
	if held:
		mode = RigidBody2D.MODE_RIGID
		apply_central_impulse(impulse)
		held = false



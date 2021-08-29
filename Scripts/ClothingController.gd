extends RigidBody2D

onready var hitbox = $Hitbox
onready var sprite = $Sprite

var held = false
var offset = Vector2.ZERO
signal clicked

var clothing_type = ""

func _ready():
	self.connect("clicked", Global, "_on_pickable_clicked")
	emit_signal("clicked", self)
	if clothing_type == "Shirt":
		sprite.region_rect = Rect2(54, 535, 480, 365)
	elif clothing_type == "Pants":
		sprite.region_rect = Rect2(550, 550, 380, 400)
	elif clothing_type == "Socks":
		sprite.region_rect = Rect2(190, 300, 210, 230)
	elif clothing_type == "Underwear":
		sprite.region_rect = Rect2(470, 360, 300, 200)
	Global.UpMess()
	
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
		apply_torque_impulse(impulse.length()*10)
		held = false



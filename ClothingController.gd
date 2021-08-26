extends RigidBody2D

onready var hitbox = $Hitbox

var held = false
var offset = Vector2.ZERO
signal clicked



func _ready():
	self.connect("clicked", Global, "_on_pickable_clicked")
	emit_signal("clicked", self)
	
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

func _on_Clothing_clicked():
	pass # Replace with function body.

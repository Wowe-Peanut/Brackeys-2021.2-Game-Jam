extends RigidBody2D

var held = false
var offset = Vector2.ZERO
signal clicked

func _ready():
	#mode = RigidBody2D.MODE_STATIC
	self.connect("clicked", Global, "_on_pickable_clicked")
	


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

func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		emit_signal("clicked", self)

extends RigidBody2D

onready var hitbox = $Hitbox

var held = false
var offset = Vector2.ZERO

func _ready():
	held = true
	pass

func _on_Clothing_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		pickup()
	if event.is_action_released("click"):
		drop(Input.get_last_mouse_speed())
		pass
		
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position() + offset
	if(Input.is_action_just_released("click")):
		held = false

func pickup():
	mode = RigidBody2D.MODE_STATIC
	held = true
	offset = global_position - get_global_mouse_position()

func drop(impulse=Vector2.ZERO):
	if held:
		mode = RigidBody2D.MODE_RIGID
		apply_central_impulse(impulse)
		held = false

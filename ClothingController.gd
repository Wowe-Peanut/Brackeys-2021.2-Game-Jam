extends RigidBody2D

onready var hitbox = $Hitbox

var held = false
var offset

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
		global_transform.origin = get_global_mouse_position()

func pickup():
	mode = RigidBody2D.MODE_STATIC
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		mode = RigidBody2D.MODE_RIGID
		apply_central_impulse(impulse)
		held = false

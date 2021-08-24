extends RigidBody2D

onready var hitbox = $Hitbox

var held = false

func _ready():
	#hitbox.disabled = true
	pass

func _on_Clothing_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		pickup()

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if !event.pressed:
			drop(Input.get_last_mouse_speed())
		



		
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()

func pickup():
	if held:
		return
	mode = RigidBody2D.MODE_STATIC
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		mode = RigidBody2D.MODE_RIGID
		apply_central_impulse(impulse)
		held = false

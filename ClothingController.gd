extends RigidBody2D

onready var hitbox = $Hitbox

var held = false

func _ready():
	#hitbox.disabled = true
	pass

func _on_Clothing_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		held = true
		
func _physics_process(delta):
	if(held):
		position = get_global_mouse_position()
		

extends RigidBody2D

onready var sprite = $Sprite
onready var hitbox = $Hitbox
var held = false
var offset = Vector2.ZERO
signal clicked

var normal_rect = Rect2(20, 20, 535, 430)
var broken_rect = Rect2(431, 535, 534, 430)

func _ready():
	self.connect("clicked", Global, "_on_pickable_clicked")
	hitbox.set_deferred("disabled", true)
	mode = RigidBody2D.MODE_STATIC
	sprite.region_rect = normal_rect
	
func break_self():
	mode = RigidBody2D.MODE_RIGID
	hitbox.set_deferred("disabled", false)
	sprite.region_rect = broken_rect
	print("break")

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

func _on_TV_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		emit_signal("clicked", self)

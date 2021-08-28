extends RigidBody2D

var held = false
var offset = Vector2.ZERO
var tv
var tv_broken = false

signal clicked

func _ready():
	#mode = RigidBody2D.MODE_STATIC
	self.connect("clicked", Global, "_on_pickable_clicked")
	tv = get_tree().get_root().get_node("Room/TV")


func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position() + offset
		if not tv_broken and global_position.distance_to(tv.global_position) > 400:
			tv.break_self()
			tv_broken = true
			
func _process(delta):
	update()
	
func pickup():
	mode = RigidBody2D.MODE_STATIC
	held = true
	offset = global_position - get_global_mouse_position()

func drop(impulse=Vector2.ZERO):
	if held:
		mode = RigidBody2D.MODE_RIGID
		apply_central_impulse(impulse)
		held = false

func _on_GameConsole_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		emit_signal("clicked", self)
		
func _draw():
	if not tv_broken:
		draw_line(Vector2(0, 0), tv.global_position - global_position, Color.black, 3)


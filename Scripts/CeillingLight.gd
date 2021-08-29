extends Area2D

onready var sprite = $Sprite
onready var hitbox = $Hitbox

var on = true
var exploded = false
var clicks = 0 #How many times its been turned on/off
var hits = 0 #How many things have been thrown at it


func _ready():
	pass

func _input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if not on:
			on()
			clicks += 1
			on = true
		else:
			off()
			clicks += 1
			on = false
				
		if clicks > 10:
			flicker_uncontrollably()
				
func on():
	sprite.region_rect.position.x = 1580
	
func off():
	sprite.region_rect.position.x = 820
			
func flicker_uncontrollably():
	$Hitbox.disabled = true
	var interval = 0.02
	for i in range(20):
		yield(get_tree().create_timer(rand_range(.05, .1)), "timeout")
		if not on:
			on()
			on = true
		else:
			off()
			on = false
	explode()
					
func explode():
	on = false
	sprite.region_rect.position.x = 41
	hitbox.set_deferred("disabled", true)
	Global.UpMess()
	
func _on_CeillingLight_body_entered(body):
	if on:
		hits += 1
		if hits >= 5:
			explode()
		else:
			randomize()
			body.linear_velocity = Vector2(0, 0)
			body.apply_central_impulse(Vector2(1000, 0))
			body.apply_torque_impulse(1000.0)



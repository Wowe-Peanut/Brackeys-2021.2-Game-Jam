extends StaticBody2D

onready var sprite = $Sprite

var on = false
var exploded = false
var light_offset = Vector2(-1, 3)
var clicked = 0

func _input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if not on:
			on()
			clicked += 1
			on = true
		else:
			off()
			clicked += 1
			on = false
				
		if clicked > 10:
			flicker_uncontrollably()
			
			
		
			
func on():
	sprite.region_rect.position.y = 600
	sprite.position += light_offset
	
func off():
	sprite.region_rect.position.y = -2
	sprite.position -= light_offset
			
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
	sprite.region_rect.position.y = 300
	sprite.region_rect.position.x = 285
	

extends Area2D

onready var sprite = $Sprite

var on = true
var exploded = false
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
	Global.UpMess()
	
func _on_CeillingLight_body_entered(body):
	if body.name == "Clothing" && on:
		body.queue_free()
		Global.UpMess()
		pass


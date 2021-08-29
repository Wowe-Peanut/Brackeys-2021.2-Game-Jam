extends Area2D


onready var sprite = $Sprite
var broken = false

func _ready():
	sprite.region_rect = Rect2(114, 563, 538, 382)

func _on_Window_body_entered(body):
	if (body.name == "Ball" || body.name == "GameConsole" || body.name == "TV") && body.linear_velocity.length() > 1000 && not broken:
		if body.name == "GameConsole":
			body.break_off()
		else:
			Global.UpMess()
		sprite.region_rect = Rect2(112, 100, 567, 382)
		body.queue_free()
		
		broken = true
		pass

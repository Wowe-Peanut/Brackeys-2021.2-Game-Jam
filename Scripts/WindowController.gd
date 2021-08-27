extends Area2D


onready var sprite = $Sprite

func _ready():
	sprite.region_rect = Rect2(114, 563, 538, 382)

func _on_Window_body_entered(body):
	if body.name == "Ball" && body.linear_velocity.length() > 1000:
		sprite.region_rect = Rect2(112, 100, 567, 382)
		body.queue_free()
		Global.UpMess()
		pass

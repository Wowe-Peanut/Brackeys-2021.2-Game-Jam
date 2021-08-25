extends Node2D

onready var AudioPlayer = $AudioStreamPlayer2D

func _ready():
	AudioPlayer.play()
	pass

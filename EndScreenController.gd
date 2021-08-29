extends Control



func _ready():
	$ScoreLabal.text = str(Global.GetMess()) + "/12"


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Menu.tscn")

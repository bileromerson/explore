extends Control

func _input(event):
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene("cenas/menu.tscn")

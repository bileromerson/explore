extends MarginContainer

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene("cenas/menu.tscn")
	
	if Input.is_action_just_pressed("direita"):
		get_tree().change_scene("res://cenas/como jogar 2.tscn")

extends MarginContainer
onready var fade = $ColorRect
onready var menu = $Menu

func _input(event):
	if Input.is_action_just_pressed("pause"):
		var pause = not get_tree().paused
		get_tree().paused = pause
		
	
	if get_tree().paused == true:
		fade.visible = true
		menu.visible = true
	else:
		fade.visible = false
		menu.visible = false
#sair para menu
func _on_sair_pressed():
	get_tree().change_scene("res://cenas/menu.tscn")
	pass # Replace with function body.

#continuar jogando
func _on_continuar_pressed():
	#faser tela sumir e despausar o jogo
	pass # Replace with function body.
#reset
func _on_reset_pressed():
	get_tree().change_scene("res://cenas/jogo.tscn")
	pass # Replace with function body.

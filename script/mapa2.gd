extends TileMap

func _on_Area2D_body_entered(body):
	if is_in_group("coletar"):
		get_tree().change_scene("res://cenas/game over.tscn")
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	get_tree().change_scene("res://cenas/jogo1.tscn")
	pass # Replace with function body.

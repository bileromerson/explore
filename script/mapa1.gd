extends TileMap

#cair do mapa
func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://cenas/game over.tscn")
	pass # Replace with function body.

#portal
func _on_portal2_body_entered(body):
	get_tree().change_scene("res://cenas/mapa2.tscn")
	pass # Replace with function body.

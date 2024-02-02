extends Control
func _ready():
	$"AnimatedSprite".play("fogo!")
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.is_in_group("coletar"):
		body.tocha = true
		queue_free()
	pass # Replace with function body.

	 

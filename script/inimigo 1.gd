extends KinematicBody2D
var gravidade = 20
var velx = 0
var pulo = -490
var impulsoy = 0
var vector = Vector2()
#gravidade------------------------------------------------------------
func _ready():
	$"AnimatedSprite".play("parado")
	$"AnimatedSprite".flip_h = true
	pass
func _physics_process(delta):
	vector.y += gravidade
	vector = move_and_slide(vector,Vector2.UP)
	position = Vector2(position.x + velx,position.y)
#andando--------------------------------------------------------------
func _on_esquerda_detect_body_entered(body):
	if body.is_in_group("coletar"):
		velx = -1
		$"AnimatedSprite".play("andando")
		$"AnimatedSprite".flip_h=true
	pass # Replace with function body.
	
func _on_direita_detect_body_entered(body):
	if body.is_in_group("coletar"):
		velx = 1
		$"AnimatedSprite".play("andando")
		$"AnimatedSprite".flip_h=false
	pass # Replace with function body.
	

func _on_ataque2_body_exited(body):
	if body.is_in_group("coletar"):
		velx = 1
		$"AnimatedSprite".play("andando")
		$"AnimatedSprite".flip_h=false
	pass # Replace with function body.

func _on_ataque1_body_exited(body):
	if body.is_in_group("coletar"):
		velx = -1
		$"AnimatedSprite".play("andando")
		$"AnimatedSprite".flip_h=true
	pass # Replace with function body
	
#parado---------------------------------------------------------------

func _on_parede_colisao_body_entered(body):
	if body.is_in_group("enemi para"):
		velx= 0
		$"AnimatedSprite".play("parado")
	pass # Replace with function body.

#ataque---------------------------------------------------------------

func _on_ataque1_body_entered(body):
	if body.is_in_group("coletar"):
		velx= 0
		$"AnimatedSprite".play("ataque")
		$"AnimatedSprite".flip_h=true
	pass # Replace with function body.

func _on_ataque2_body_entered(body):
	if body.is_in_group("coletar"):
		velx= 0
		$"AnimatedSprite".play("ataque")
		$"AnimatedSprite".flip_h=false
	pass 




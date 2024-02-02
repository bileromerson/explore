extends KinematicBody2D

var tocha: bool = false
var gravidade = 20
var velocidade = 450
var pulo = -750
var vida = 3
var vidamax = 3
var segurar := false
var subindo = false
var caindo = true
var vector = Vector2()

func _physics_process(delta):
	vector.y += gravidade
	if vector.y >= 0:
		subindo = false
		caindo = true
		
	elif vector.y < 0 && vector.y != 20:
		caindo = false
		subindo = true
		
	if caindo:
		$player.play("caindo")
	elif subindo:
		$player.play("pulo")

#movimentasao do personajem-------------------------------------------
#andando--------------------------------------------------------------
	if Input.is_action_pressed("direita"):
		vector.x = velocidade
		$"player".play("andando")
		$"imagem".flip_h = false
		
	elif Input . is_action_pressed("esqerda"):
		vector.x = -velocidade
		$"player".play("andando")
		$"imagem".flip_h = true
	
#agachado-------------------------------------------------------------
			
	elif Input . is_action_just_pressed("rastera"):
		vector.x = 0
		$"player".play("agachado")
		
#ataque--------------------------------------------------------------
	elif Input . is_action_pressed("ataque"):
		vector.x = 0
		$"player".play("ataque")
		
# parado--------------------------------------------------------------
	elif is_on_floor():
		vector.x = 0
		$"player".play("parado")
#animasao de pulo-----------------------------------------------------
		
	if is_on_floor():
		if Input.is_action_pressed("pular"):
			vector.y = pulo
			
	
		
	vector = move_and_slide(vector,Vector2.UP)
#dano-------------------------------------------------------------------



#segurar item-----------------------------------------------------------
func _process(delta):
	if !tocha:
		$"Light2D".energy = false
	else:
		$"Light2D".energy = true
#teleport-----------------------------------------------------------------

func teleport(area: Area2D):
	for portal in get_tree().get_nodes_in_group("portal"):
		if portal != area:
			if(portal.id == area.id):
				if (!portal.portal_is_locked):
					area.lock_portal()
					global_position = portal.global_position
					
func _on_detectar_area_entered(area):
	if area.is_in_group("portal"):
		if (!area.portal_is_locked):
			teleport(area)

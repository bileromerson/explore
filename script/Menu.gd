extends MarginContainer


var opcaoAtual = 0

onready var opcaoUm = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Label
onready var opcaoDois = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Label
onready var opcaoTres = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Label

func _ready():
	TrocarOpcao(0)
	pass

func _process(delta):
	if Input.is_action_just_pressed("rastera") and opcaoAtual < 2:
		opcaoAtual += 1
		TrocarOpcao(opcaoAtual)
	elif Input.is_action_just_pressed("pular") and opcaoAtual  > 0:
		opcaoAtual -= 1
		TrocarOpcao(opcaoAtual)
	elif Input.is_action_just_pressed("ui_accept"):
		EscolherOpcao(opcaoAtual)
	
func TrocarOpcao(opcaoAtual):
	opcaoUm.text = ""
	opcaoDois.text = ""
	opcaoTres.text = ""
	
	if opcaoAtual == 0:
		opcaoUm.text  = ">"
	elif opcaoAtual == 1:
		opcaoDois.text = ">"
	elif opcaoAtual == 2:
		opcaoTres.text = ">"

func EscolherOpcao(opcaoAtual):
	if opcaoAtual == 0:
		get_tree().change_scene("res://cenas/mapa1.tscn")
	elif opcaoAtual == 1:
		get_tree().change_scene("cenas/crditos.tscn")
	elif opcaoAtual == 2:
		get_tree().change_scene("cenas/como jogar.tscn")

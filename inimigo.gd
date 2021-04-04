extends KinematicBody2D

var flip = true
var posicao_inicial = true
var posicao_final = true
var velocidade = 23.3
const UP = Vector2(0, -1)
var movimento = Vector2.ZERO

func _ready():
	$sprite.play("andar")
	set_physics_process(false)
	movimento.x = -velocidade
	
func _process(delta):
	movimento.y += ScriptGlobal.GRAVIDADE
	movimento.x -= velocidade
	
	if $DetectorParedeEsq.is_colliding():
		print("batendo esq")
		movimento.x *= -1
	elif $DetectorParedeDir.is_colliding():
		print("batendo dir")
		movimento.x *= -1
		
	
	movimento.y = move_and_slide(movimento, UP).y






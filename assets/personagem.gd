extends KinematicBody2D

const UP = Vector2(0, -1)
var movimento = Vector2()
const JUMP_HEIGHT = -550


func _physics_process(delta):
	movimento.y += ScriptGlobal.GRAVIDADE
	
	if Input.is_action_pressed("ui_right"):
		movimento.x = ScriptGlobal.VELOCIDADE
		$sprite.play("correr")
		#para flipar viraro personagemao outro lado
		$sprite.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -ScriptGlobal.VELOCIDADE
		$sprite.play("correr")
		$sprite.flip_h = false
	else:
		movimento.x = 0
		$sprite.play("parado")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimento.y = JUMP_HEIGHT
			#pra não desser muito rapido: movimento = funcao
	movimento = move_and_slide(movimento, UP)

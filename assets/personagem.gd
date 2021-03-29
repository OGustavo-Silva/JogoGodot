extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
const GRAVIDADE = 20
const SPEED = 600
const JUMP_HEIGHT = -550


func _physics_process(delta):
	motion.y += GRAVIDADE
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$sprite.play("correr")
		#para flipar viraro personagemao outro lado
		$sprite.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$sprite.play("correr")
		$sprite.flip_h = false
	else:
		motion.x = 0
		$sprite.play("parado")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			#pra não desser muito rapido: motion = funcao
	motion = move_and_slide(motion, UP)

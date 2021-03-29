extends StaticBody2D

var flip = true
var posicao_inicial = true
var posicao_final = true
var velocidade = 23.3

func _ready():
	$sprite.play("andar")
	#ponto onde o inimigo está
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 500
	
func _process(delta):
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$sprite.flip_h = true;
		if($".".position.x >= posicao_final):
			flip = false
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$sprite.flip_h = false
		if($".".position.x <= posicao_inicial):
			flip = true





extends CharacterBody2D

var mouse_pos : Vector2 #= Vector2.ZERO
var caixas_seguradas : int
var caixa_limite : bool = true

@onready var anim = $AnimatedSprite2D
@onready var collision = $CollisionShape2D_0
@onready var area2d = $Area2D_0

func _ready():
	pass


func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	global_position = mouse_pos
	position.y = 630

func torre_de_caixas(n:int):
	collision.scale.y = 1
	await get_tree().create_timer(0.1).timeout
	collision.scale.y += 0.5 * n
	collision.position.y -= 32 #VAI TER Q MUDAR ISSO AQUI QUANDO COLOCAR A ARTE CERTA
	area2d.position.y -= 64 #VAI TER Q MUDAR ISSO AQUI QUANDO COLOCAR A ARTE CERTA

func _on_area_2d_area_entered(area):
	if area.is_in_group("base"):
		print(caixas_seguradas)
		if caixa_limite:
			area.morte_caixa()
			caixas_seguradas += 1
			torre_de_caixas(caixas_seguradas)
			if caixas_seguradas == 1:
				anim.play("1_caixa")
			elif caixas_seguradas == 2:
				anim.play("2_caixa")
			elif caixas_seguradas == 3:
				anim.play("3_caixa")
			elif caixas_seguradas == 4:
				anim.play("4_caixa")
			elif caixas_seguradas == 5:
				anim.play("5_caixa")
				caixa_limite = false
	if area.is_in_group("kombi"):
		Global.score += caixas_seguradas
		await get_tree().create_timer(0.1).timeout
		caixas_seguradas = 0
		anim.play("Idle")
		caixa_limite = true
		collision.scale.y = 1
		collision.position.y = 0
		area2d.position.y = 0
		

extends Node2D

@export var box_scene: PackedScene

#tentativa de aumentar a velocidade com que cai as caixas
var tempo_min = 0.5
var tempo_max = 3.0
var tempo = 0.0

func new_game():
	$StartTimer.start()
	Global.score = 0
	Global.life = 3

func _ready() -> void:
	new_game()

func _process(delta: float):
	tempo = lerp(tempo_max, tempo_min, 0.1)
	#print(tempo)

func _on_start_timer_timeout() -> void:
	caixa_spawn()

func caixa_spawn(): #função que faz cuspir as caixas
	while true:
		var box = box_scene.instantiate()
		box.position = Vector2(randf_range(20, 1180), -40) #mudar isso depois
		add_child(box)
		await get_tree().create_timer(tempo).timeout

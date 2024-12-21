extends Node2D

@export var box_scene: PackedScene

var tempo = 2.0

func new_game():
	$StartTimer.start()
	Global.score = 0
	Global.life = 3

func _ready() -> void:
	new_game()

func _process(delta: float):
	#tempo = lerp(tempo_max, tempo_min, 0.5)
	print(tempo)
	adjust_time()
	print(Global.score)

func _on_start_timer_timeout() -> void:
	caixa_spawn()

func caixa_spawn(): #função que faz cuspir as caixas
	while true:
		var box = box_scene.instantiate()
		box.position = Vector2(randf_range(32, 1000), -40) #mudar isso depois
		add_child(box)
		await get_tree().create_timer(tempo).timeout

func adjust_time():
	if Global.score >= 5:
		tempo = 1.5
	if Global.score >= 10:
		tempo = 1.0
	if Global.score >= 15:
		tempo = 0.5
	if Global.score >= 20:
		tempo = 0.3

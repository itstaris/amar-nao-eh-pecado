extends Area2D

@onready var box = $".."

func morte_caixa():
	box.queue_free()

func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
func _on_area_entered(area) -> void:
	if area.is_in_group("chao"):
		Global.life -=1
		if Global.life == 0:
			game_over()
		#await get_tree().create_timer(3).timeout
		morte_caixa()

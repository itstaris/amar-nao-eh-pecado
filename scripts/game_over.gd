extends CanvasLayer

@onready var score_label: Label = $Control/ScoreLabel
@onready var high_score_label: Label = $Control/HighScoreLabel

func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _ready():
	score_label.text = str("Score: ", Global.score)
	if Global.score > Global.high_score:
		Global.high_score = Global.score
		high_score_label.text = str("High Score: ", Global.high_score)
	else:
		high_score_label.text = str("High Score: ", Global.high_score)

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/hud.tscn")

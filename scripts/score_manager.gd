extends Control

@onready var score_counter: Label = $score_counter as Label
@onready var life_counter: Label = $life_counter

func _ready() -> void:
	score_counter.text = str("%04d" % Global.score)
	life_counter.text = str("x ", Global.life)

func _process(delta: float) -> void:
	score_counter.text = str("%04d" % Global.score)
	life_counter.text = str("x ", Global.life)

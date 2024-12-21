extends Control

@onready var score_counter: Label = $score_counter as Label
@onready var life_counter: Label = $life_counter
@onready var instruction: Label = $instruction

func _ready() -> void:
	score_counter.text = str("%04d" % Global.score)
	life_counter.text = str("x ", Global.life)
	await get_tree().create_timer(4.0).timeout
	instruction.text = str("Put them in the van!")
	await get_tree().create_timer(4.0).timeout
	instruction.queue_free()

func _process(delta: float) -> void:
	score_counter.text = str("%04d" % Global.score)
	life_counter.text = str("x ", Global.life)

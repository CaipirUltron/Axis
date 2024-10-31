extends Node

var fps = 0
var score = 0
@onready var score_label: Label = $ScoreLabel
@onready var win_label: Label = $"../Player/Camera2D/Win"
@onready var fps_label: Label = $"../Player/Camera2D/FPS"

func _process(delta: float) -> void:
	
	var fps_text = "FPS = %d"
	fps = 1/delta
	fps_label.text = fps_text % fps

func add_point():
	score += 1
	score_label.text = "Tu pegou " + str(score) + " moedas até agora."
	
	if score > 5:
		score_label.text = "Tu pegou " + str(score) + " moedas. Foda"

	if score >= 10:
		win_label.show()

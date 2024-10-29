extends Node2D

var fps = 0
@onready var fps_label: Label = $Player/Camera2D/FPS

func _process(delta: float) -> void:
	
	fps = 1/delta
	fps_label.text = "FPS = " + str(fps)

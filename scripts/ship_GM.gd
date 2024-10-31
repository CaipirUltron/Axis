extends Node2D

var fps = 0
@onready var fps_label: Label = $GUI/FPS
@onready var camera: Camera2D = $Camera2D
func _process(delta: float) -> void:
	
	var fps_text = "FPS = %d"
	fps = 1/delta
	fps_label.text = fps_text % fps
	fps_label.global_position = camera.global_position

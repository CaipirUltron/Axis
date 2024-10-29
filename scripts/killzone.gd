extends Area2D

signal killed
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("YOU DIED!")
	Engine.time_scale = 0.5
	killed.emit()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
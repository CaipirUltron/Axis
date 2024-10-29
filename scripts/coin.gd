extends Area2D

@onready var game_manager: Node = %GM
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	 # Replace with function body.
	game_manager.add_point()
	animation_player.play("pickup")

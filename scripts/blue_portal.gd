@tool
extends Area2D

@onready var portal_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var flip = false
@export var send_to = Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	portal_sprite.flip_h = not flip

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	portal_sprite.flip_h = not flip

# Called when the player (or whatever body in collision layer 2) enters the Area2D
func _on_body_entered(_body: Node2D) -> void:
	
	var direction
	if send_to.flip: direction = -1
	else: direction = 1
	_body.global_position = send_to.global_position + direction * Vector2(30,0)

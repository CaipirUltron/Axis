extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	'''
	This will make the enemy move at constant speed and invert its motion once it encounters a wall.
	'''
	
	if ray_cast_right.is_colliding(): 
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding(): 
		direction = +1
		animated_sprite.flip_h = false

	position.x += direction * SPEED * delta

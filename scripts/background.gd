extends Node2D

const BASE_FACTOR = 0.01
const DECR = 0.7

var factors = Array()
var BG_refs = Array()

@export var num_backgrounds = 12
@onready var camera_2d: Camera2D = $"../Camera2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# For each parallax background layer, load new sprite with texture
	for i in num_backgrounds:
		factors.append(BASE_FACTOR*(DECR**i))
		
		var sprite = Sprite2D.new()
		sprite.texture = load("res://assets/sprites/background/BG"+str(i+1)+".png")
		self.add_child(sprite)
		sprite.z_index = -(i+1)

		BG_refs.append(sprite)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var cam_pos = camera_2d.global_position
	
	self.global_position = Vector2( cam_pos[0], 0.0 )
	
	for k in num_backgrounds:
		BG_refs[k].global_rotation = factors[k] * cam_pos[0]

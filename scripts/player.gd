extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
@export var animated_sprite: AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor(): 
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay wa actions.
	var direction = Input.get_axis("move_left", "move_right")
	var vertical = Input.get_axis("move_down", "move_up")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if direction == 0 or vertical == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run") 
		
	#if vertical:
		#velocity.y = - vertical * SPEED
	#else:
		#velocity.y = move_toward(velocity.y,0, SPEED)
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")

const speed = 80
const acceleration = 10

func get_input_direction() -> Vector2:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction.x < 0:
		sprite.flip_h = true
	if direction.x > 0:
		sprite.flip_h = false
		
	return direction

func _process(delta: float) -> void:
	var input_dir = get_input_direction().normalized()
	
	if input_dir == Vector2.ZERO:
		sprite.play("Idle")
	else:
		sprite.play("Run")
		
	velocity = Vector2(
		lerp(velocity.x, input_dir.x * speed, acceleration * delta),
		lerp(velocity.y, input_dir.y * speed, acceleration * delta)
	)
	
	#velocity = Vector2(input_dir.x * speed, input_dir.y * speed)
	
	move_and_slide()

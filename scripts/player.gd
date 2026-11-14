extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0

func _physics_process(delta: float) -> void:

	var direction = Input.get_axis("ui_left", "ui_right")

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	velocity.x = direction * SPEED

	print("Direction: ", direction)
	print("Actual velocity: ", velocity)

	move_and_slide()

extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0

var health = 100
var is_game_over = false

@onready var health_label = $Label


func _ready():
	update_health()


func update_health():
	health_label.text = "Health: " + str(health)


func heal(amount: int):
	health = min(health + amount, 100)
	update_health()


func game_over():
	if is_game_over:
		return

	is_game_over = true
	get_tree().call_deferred("change_scene_to_file", "res://scenes/title_screen.tscn")


func _physics_process(delta: float) -> void:

	# Check health
	if health <= 0:
		game_over()
		return

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_monster_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:

	health = max(health - 20, 0)
	update_health()

	print("Current Health: ", health)


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		game_over()

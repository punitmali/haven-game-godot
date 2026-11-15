extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0

const JUMP_SFX := "res://assets/sound/jump.mp3"
const DEATH_SFX := "res://assets/sound/death.mp3"
const MEDI_SFX := "res://assets/sound/healthkit.mp3"
const BG_MUSIC := "res://assets/sound/bgmusic.mp3"

var health = 100
var is_game_over = false

@onready var health_label = $Label
func heal(amount: int):
	health = min(health + amount, 100)
	update_health()

var _sfx: AudioStreamPlayer
var _music: AudioStreamPlayer


func _load_mp3(path: String) -> AudioStreamMP3:
	if ResourceLoader.exists(path):
		return load(path)
	return AudioStreamMP3.load_from_file(path)


func _play(stream: AudioStream) -> void:
	if stream == null or _sfx == null:
		return
	_sfx.stream = stream
	_sfx.play()


func _ready():
	update_health()
	_sfx = AudioStreamPlayer.new()
	add_child(_sfx)
	var music := _load_mp3(BG_MUSIC)
	if music:
		music.loop = true
		_music = AudioStreamPlayer.new()
		_music.stream = music
		add_child(_music)
		_music.play()


func update_health():
	health_label.text = "Health: " + str(health)


func medi(amount: int):
	health = min(health + amount, 100)
	update_health()
	_play(_load_mp3(MEDI_SFX))


func game_over():
	if is_game_over:
		return

	is_game_over = true
	if _music:
		_music.stop()
	var death := _load_mp3(DEATH_SFX)
	_play(death)
	if death and _sfx:
		await _sfx.finished
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


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
		_play(_load_mp3(JUMP_SFX))

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()


func take_damage():
	health = max(health - 20, 0)
	update_health()
	print("Current Health: ", health)

func _on_monster_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_3_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_5_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()
		
func _on_monster_6_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_7_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_8_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_9_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_10_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_11_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_12_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()


func _on_monster_13_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == self:
		take_damage()

extends Control

static var won := false

const LOSE: Texture2D = preload("res://assets/WhatsApp Image 2026-11-15 at 3.27.11 PM.jpeg")
const WIN: Texture2D = preload("res://assets/WhatsApp Image 2026-11-15 at 3.27.38 PM.jpeg")


func _ready() -> void:
	$Art.texture = WIN if won else LOSE
	$Retry.pressed.connect(_on_retry)
	$Menu.pressed.connect(_on_menu)


func _on_retry() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

extends Area2D

@export var heal_amount: int = 5


func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D):
	if body.has_method("heal"):
		body.heal(heal_amount)
		queue_free()

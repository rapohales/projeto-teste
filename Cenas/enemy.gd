extends RigidBody2D

@export var min_speed = 150
@export var max_speed = 250
var mob_types = ["walk", "swin", "fly"]

func _ready() -> void:
	$AnimatedSprite2D.animation = mob_types[randi() % mob_types.size]

func _on_visibility_screen_exited() -> void:
	queue_free()

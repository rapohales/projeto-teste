extends RigidBody2D

@export var min_speed = 150
@export var max_speed = 250
var mob_types = ["walk", "swin", "fly"]

func _ready() -> void:
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()

func _on_visibility_screen_exited() -> void:
	queue_free()

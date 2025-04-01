extends Node

@export var mob_scene: PackedScene
var score
	


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$Hud.show_game_over()
	


func new_game():
	$Hud.update_score(score)
	$Hud.show_message("Get Ready")
	$Player.show()
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_score_timer_timeout():
	score +=1
	$Hud.update_score(score)
	
	
func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_mob_timer_timeout():
	print("mobspawnou")
	var mob = mob_scene.instantiate()
	var mob_spawn_loc = $MobPath/MobSpawnLocation
	mob_spawn_loc.progress_ratio = randf()
	mob.position = mob_spawn_loc.position
	
	var direction = mob_spawn_loc.rotation + PI /2
	direction = randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	
func _ready():
	pass

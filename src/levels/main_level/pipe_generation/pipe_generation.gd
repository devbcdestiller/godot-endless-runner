class_name PipeGeneration

extends Node

@export var pipes_scene: PackedScene
@export var score_scene: PackedScene


func spawn_pipes():
	var pipes = pipes_scene.instantiate()
	var score_area = score_scene.instantiate()
	var spawn_location: PathFollow2D = get_node("Spawn/SpawnLocation")

	spawn_location.progress_ratio = randf()
	pipes.position = spawn_location.position
	score_area.position = spawn_location.position
	add_child(pipes)
	add_child(score_area)

 
func _on_generate_timer_timeout():
	spawn_pipes()

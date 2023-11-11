extends Node2D


@export var pipe_gap: float = 100.0
@export var pipe_speed: float = 100.0
@export var min_pipe_gap_multiplier: float = 1.0
@export var max_pipe_gap_multiplier: float = 1.5


func calculate_pipe_gap(gap_multiplier: float):
	$PipeBottom.position = Vector2($PipeTop.position.x, $PipeTop.position.y + pipe_gap * gap_multiplier)


func _process(delta):
	self.position.x -= delta * pipe_speed


func _on_ready():
	var gap_multiplier: float = randf_range(min_pipe_gap_multiplier, max_pipe_gap_multiplier)
	calculate_pipe_gap(gap_multiplier)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

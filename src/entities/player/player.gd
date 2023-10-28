class_name Player

extends RigidBody2D

signal hit

@export var jump_force: float = -1000.0
@export var max_speed: float = 750.0


func _integrate_forces(state):
	if state.linear_velocity.y < 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	if Input.is_action_just_pressed("jump"):
		state.apply_impulse(Vector2(0.0, jump_force))
		
	state.linear_velocity = state.linear_velocity.limit_length(max_speed)


func _on_body_entered(body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

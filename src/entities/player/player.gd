class_name Player

extends RigidBody2D

signal hit

@export var jump_force: float = -1000.0
@export var max_speed: float = 500.0


var isGameOver: bool = false

func on_collision():
	isGameOver = true
	hit.emit()
	self.sleeping = true
	$CollisionShape2D.set_deferred("disabled", true)


func _init():
	self.max_contacts_reported = 1
	self.contact_monitor = true
	self.lock_rotation = true


func _integrate_forces(state):
	if isGameOver:
		return
	
	if state.linear_velocity.y < 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	if Input.is_action_just_pressed("jump"):
		state.apply_impulse(Vector2(0.0, jump_force))
		
	state.linear_velocity = state.linear_velocity.limit_length(max_speed)


func _on_body_entered(_body):
	on_collision()

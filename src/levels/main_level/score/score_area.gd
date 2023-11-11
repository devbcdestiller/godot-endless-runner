class_name ScoreArea

extends Area2D

signal score


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	score.emit()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

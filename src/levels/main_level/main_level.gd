class_name MainLevel

extends Node


func _on_player_hit():
	print("Game Over!")
	$PauseableTree.process_mode = Node.PROCESS_MODE_DISABLED
	
	
func _on_player_score():
	print("SCORE!")

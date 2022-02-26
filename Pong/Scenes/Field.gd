extends Node2D


signal goal_left
signal goal_right

func _on_LeftGoal_body_entered(body):
	emit_signal("goal_left")


func _on_RightGoal_body_entered(body):
	emit_signal("goal_right")

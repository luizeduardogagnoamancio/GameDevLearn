extends Node2D

onready var hud = get_node("HUD")
var score_player_one = 0
var score_player_two = 0

var max_score = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score()
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if $StartTimer.time_left > 1:
		hud.get_node("CountdownContainer/CenterContainer/Label").set_text(str(round($StartTimer.time_left)))
		


func _on_Field_goal_left():
	score_player_two += 1
	update_score()
	start_new_round()
	
	
func _on_Field_goal_right():
	score_player_one += 1
	update_score()
	start_new_round()
	
	
func start_new_round():
	$Ball.reset()
	hud.get_node("CountdownContainer").set_visible(true)
	$StartTimer.start()

func _on_StartTimer_timeout():
	hud.get_node("CountdownContainer").set_visible(false)
	$Ball.set_start_direction()

func update_score():
	hud.get_node("Points/Score_Player1").set_text(str(score_player_one))
	hud.get_node("Points/Score_Player2").set_text(str(score_player_two))

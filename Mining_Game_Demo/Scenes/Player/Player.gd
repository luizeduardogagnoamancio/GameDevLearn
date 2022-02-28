extends KinematicBody2D

export (int) var speed = 200
onready var anim = $AnimationPlayer
onready var sword = $Sword

var MAX_SPEED = 100
var ACCELETARION = 500
var motion = Vector2.ZERO
var last_dir = ""


func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELETARION * delta)
	else:
		apply_movement(axis * ACCELETARION * delta)
	
	if axis.x > 0 or (axis.y != 0 and last_dir == "right"):
		anim.play("walk_right")
		last_dir = "right"
	elif axis.x < 0 or (axis.y != 0 and last_dir == "left"):
		anim.play("walk_left")
		last_dir = "left"
	elif axis.x == 0 and axis.y == 0:
		if last_dir == "right":
			anim.play("idle_right")
		else:
			anim.play("idle_left")
	motion = move_and_slide(motion)
	
	
func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	
	


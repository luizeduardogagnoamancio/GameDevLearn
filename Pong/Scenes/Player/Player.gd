extends KinematicBody2D

var speed = 200

var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed


# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	get_input()
	velocity = move_and_slide(velocity)

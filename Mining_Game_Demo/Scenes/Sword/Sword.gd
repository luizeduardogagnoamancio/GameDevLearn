extends Node2D


onready var sprite = $Sprite

func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_flip_signal():
	sprite.flip_h = true

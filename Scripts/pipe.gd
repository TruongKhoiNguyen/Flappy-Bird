class_name Pipe
extends StaticBody2D


const PIPE_WIDTH := 26 


@onready var camera := get_tree().get_root().get_node("main/bird/camera") 


func _process(_delta):
	if $right.global_position.x <= camera.global_position.x - Game.SCREEN_WIDTH / 2:
		queue_free()

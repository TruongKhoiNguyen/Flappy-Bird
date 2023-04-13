class_name Ground
extends StaticBody2D


const GROUND_HEIGHT := 56


@onready var camera := get_tree().get_root().get_node("main/bird/camera") 


func _process(_delta):
	if $bottom_right.global_position.x <= camera.global_position.x - Game.SCREEN_WIDTH / 2:
		queue_free()

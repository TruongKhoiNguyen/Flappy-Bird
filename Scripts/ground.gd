class_name Ground
extends StaticBody2D


const GROUND_HEIGHT := 56

var camera: Camera2D

func _process(_delta):
	if not camera:
		return 
		
	if $bottom_right.global_position.x <= camera.global_position.x - Game.SCREEN_WIDTH / 2:
		queue_free()

func add_camera(p_camera: Camera2D):
	camera = p_camera

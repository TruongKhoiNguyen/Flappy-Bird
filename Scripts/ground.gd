class_name Ground
extends StaticBody2D

const GROUND_HEIGHT = 56

var camera: Camera2D
@onready var bottom_right := $bottom_right

func _process(_delta):
	if not camera:
		return 
		
	var camera_edge_position_x := camera.global_position.x - Game.SCREEN_WIDTH / 2
	if bottom_right.global_position.x <= camera_edge_position_x:
		queue_free()

func add_camera(p_camera: Camera2D):
	camera = p_camera

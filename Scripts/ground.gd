extends StaticBody2D

const SCREEN_WIDTH = 144

@onready var camera = get_tree().get_root().get_node("main/bird/camera") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $bottom_right.global_position.x <= camera.global_position.x - SCREEN_WIDTH / 2:
		queue_free()

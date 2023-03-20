extends StaticBody2D

const SCREEN_WIDTH = 144

@onready var camera = get_tree().get_root().get_node("main/bird/camera") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $bottom_right.global_position.x <= camera.global_position.x - SCREEN_WIDTH / 2:
#		print("Out of view")
		queue_free()
	pass

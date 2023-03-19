extends RigidBody2D

@export var flap_velocity = 300

#@export var max_angle = deg_to_rad(90)
#@export var min_angle = -deg_to_rad(30)
#
#@export var fall_rotation = 1
#@export var flap_rotation = -1

@export var start_velocity = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity.x = start_velocity

func _input(event):
	if event.is_action_pressed("Flap"):
		linear_velocity.y = -flap_velocity
#		if rotation > min_angle:
#			angular_velocity = flap_rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

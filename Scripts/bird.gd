extends RigidBody2D

@export var flap_velocity = 300

@export var max_angle = deg_to_rad(90)
@export var min_angle = -deg_to_rad(30)

@export var fall_rotation = 1
@export var flap_rotation = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Flap"):
		linear_velocity.y = -flap_velocity
		if rotation > min_angle:
			angular_velocity = flap_rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if linear_velocity.y > 0:
		angular_velocity = fall_rotation
	
	# Limit flying angle
	if rotation > max_angle:
		angular_velocity = 0
		rotation = max_angle
	elif rotation < min_angle:
		angular_velocity = 0 
		rotation = min_angle

extends RigidBody2D

@export var flap_force = 150
@export var start_velocity = 50

func _ready():
	linear_velocity = Vector2(start_velocity, linear_velocity.y)

func _integrate_forces(state):	
	if Input.is_action_pressed("Flap"):
		state.linear_velocity = Vector2(linear_velocity.x, -flap_force)
		state.angular_velocity = -3
		
	# Limit rotation of the bird
	if rotation_degrees < -30 or rotation_degrees > 90:
		var new_rotation = clamp(rotation, deg_to_rad(-30), deg_to_rad(90))
		var new_transform = Transform2D(new_rotation, position)
		state.transform = new_transform
		state.angular_velocity = 0
	
	if linear_velocity.y > 0:
		state.angular_velocity = 1.5

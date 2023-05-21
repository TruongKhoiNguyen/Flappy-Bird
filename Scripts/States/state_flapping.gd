class_name FlappingState
extends State

var bird

var animation_player: AnimationPlayer
var sound_flap: AudioStreamPlayer
	
func _init(p_bird):
	bird = p_bird
	bird.linear_velocity = Vector2(bird.start_velocity, bird.linear_velocity.y)
	animation_player = bird.get_node('sprite/animation_player')
	sound_flap = bird.get_node("sound_flap")
		
func integrate_forces(state):
	if Input.is_action_pressed("Flap"):
		state.angular_velocity = -3
		
	if Input.is_action_just_pressed("Flap"):
		state.linear_velocity = Vector2(bird.linear_velocity.x, -bird.flap_force)
		animation_player.play('Flap')
		sound_flap.play()
		
	# Limit rotation of the bird
	if bird.rotation_degrees < -30 or bird.rotation_degrees > 90:
		var new_rotation = clamp(bird.rotation, deg_to_rad(-30), deg_to_rad(90))
		var new_transform = Transform2D(new_rotation, bird.position)
		state.transform = new_transform
		state.angular_velocity = 0
		
	if bird.linear_velocity.y > 0:
		state.angular_velocity = 1.5
	
func exit():
	pass

func on_body_entered(other_body):
	if other_body.is_in_group("pipes"):
		bird.set_bird_state(bird.STATE.HIT)
	elif other_body.is_in_group("grounds"):
		bird.set_bird_state(bird.STATE.GROUNDED)
	pass

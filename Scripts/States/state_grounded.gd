class_name GroundedState
extends State

var bird: Bird

func _init(p_bird: Bird):
	bird = p_bird
	
	bird.linear_velocity = Vector2(0, 0)
	bird.angular_velocity = 0
	
	if bird.prev_state != bird.STATE.HIT:
		(bird.get_node("sound_hit") as AudioStreamPlayer).play()
	
func integrate_forces(_state):
	pass

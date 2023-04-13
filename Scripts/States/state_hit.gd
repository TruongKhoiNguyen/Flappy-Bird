class_name HitState
extends State

var bird: Bird

func _init(p_bird: Bird):
	bird = p_bird
	
	bird.linear_velocity = Vector2(0, 0)
	bird.angular_velocity = 2
	
	var other_body = bird.get_colliding_bodies()[0]
	bird.add_collision_exception_with(other_body)
	pass 
	
func integrate_forces(_state):
	pass
	
func on_body_entered(other_body):
	if other_body.is_in_group("grounds"):
		bird.set_bird_state(bird.STATE.GROUNDED)
	pass

func exit():
	pass

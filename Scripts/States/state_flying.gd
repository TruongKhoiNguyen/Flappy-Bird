class_name FlyingState
extends State

var bird: Bird
var prev_gravity_scale: float
	
func _init(p_bird: Bird):
	bird = p_bird
	bird.get_node("sprite/animation_player").play("Fly")
	bird.linear_velocity = Vector2(bird.start_velocity, bird.linear_velocity.y)
	prev_gravity_scale = bird.gravity_scale
	bird.gravity_scale = 0
		
func integrate_forces(_state):
	pass
	
func exit():
	bird.gravity_scale = prev_gravity_scale
	bird.get_node("sprite/animation_player").stop()
	bird.get_node("sprite").position = Vector2(0, 0)

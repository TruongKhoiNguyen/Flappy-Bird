extends Node

var bird
var prev_gravity_scale
	
func _init(bird):
	self.bird = bird
	bird.get_node("sprite/animation_player").play("Fly")
	bird.linear_velocity = Vector2(bird.start_velocity, bird.linear_velocity.y)
	prev_gravity_scale = bird.gravity_scale
	bird.gravity_scale = 0
		
func integrate_forces(state):
	pass
	
func exit():
	bird.gravity_scale = prev_gravity_scale
	bird.get_node("sprite/animation_player").stop()
	bird.get_node("sprite").position = Vector2(0, 0)

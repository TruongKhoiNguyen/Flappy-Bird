extends Node

var bird

func _init(bird):
	self.bird = bird
	
	bird.linear_velocity = Vector2(0, 0)
	bird.angular_velocity = 0
	pass
	
func integrate_forces(state):
	pass

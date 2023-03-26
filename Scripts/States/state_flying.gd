extends Node

var bird
	
func _init(bird):
	self.bird = bird
	bird.get_node("sprite/animation_player").play("Fly")
	bird.gravity_scale = 0
		
func integrate_forces(state):
	pass

extends RigidBody2D


enum STATE {FLYING, FLAPPING, HIT, GROUNDED}


@export var flap_force = 150
@export var start_velocity = 50

var bird_state


func _ready():
	set_bird_state(STATE.FLAPPING)

func _integrate_forces(state):	
	bird_state.integrate_forces(state)
	
func set_bird_state(state):
	if bird_state != null:
		bird_state.exit()
	
	match state:
		STATE.FLYING:
			bird_state = FlyingState.new(self)
		STATE.FLAPPING:
			bird_state = FlappingState.new(self)
		STATE.HIT:
			bird_state = HitState.new(self)
		STATE.GROUNDED:
			bird_state = GroundedState.new(self)
	
	
# Flying State ---------------------------------------------------------------
class FlyingState:
	var bird
	
	func _init(bird):
		self.bird = bird
		
	func integrate_force(state):
		pass


# Flapping State -------------------------------------------------------------
class FlappingState:
	var bird
	
	func _init(bird):
		self.bird = bird
		bird.linear_velocity = Vector2(bird.start_velocity, bird.linear_velocity.y)
		
	func integrate_forces(state):
		if Input.is_action_pressed("Flap"):
			state.linear_velocity = Vector2(bird.linear_velocity.x, -bird.flap_force)
			state.angular_velocity = -3
		
		# Limit rotation of the bird
		if bird.rotation_degrees < -30 or bird.rotation_degrees > 90:
			var new_rotation = clamp(bird.rotation, deg_to_rad(-30), deg_to_rad(90))
			var new_transform = Transform2D(new_rotation, bird.position)
			state.transform = new_transform
			state.angular_velocity = 0
		
		if bird.linear_velocity.y > 0:
			state.angular_velocity = 1.5


# Hit State ------------------------------------------------------------------
class HitState:
	var bird
	
	func _init(bird):
		self.bird = bird
		
	func integrate_forces(state):
		pass
		
		
# Grounded State -------------------------------------------------------------
class GroundedState:
	var bird
	
	func _init(bird):
		self.bird = bird
		
	func integrate_forces(state):
		pass

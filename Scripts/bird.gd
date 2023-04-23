class_name Bird
extends RigidBody2D


signal state_changed(bird: Bird)
enum STATE {FLYING, FLAPPING, HIT, GROUNDED}


@export var flap_force := 150
@export var start_velocity := 50

@onready var bird_state:State = FlyingState.new(self)
var prev_state: STATE


func _ready():
	connect("body_entered", _on_body_entered)
	

func _on_body_entered(other_body):
	if bird_state.has_method("on_body_entered"):
		bird_state.on_body_entered(other_body)
	pass


func _integrate_forces(state):	
	bird_state.integrate_forces(state)
	
	
func set_bird_state(state: STATE) -> void:
	if bird_state != null:
		bird_state.exit()
	
	prev_state = get_bird_state()
	
	match state:
		STATE.FLYING:
			bird_state = FlyingState.new(self)
		STATE.FLAPPING:
			bird_state = FlappingState.new(self)
		STATE.HIT:
			bird_state = HitState.new(self)
		STATE.GROUNDED:
			bird_state = GroundedState.new(self)
	
	state_changed.emit(self)
	
func get_bird_state() -> STATE:
	if bird_state is FlyingState:
		return STATE.FLYING
	elif  bird_state is FlappingState:
		return STATE.FLAPPING
	elif bird_state is HitState:
		return STATE.HIT
		
	return STATE.GROUNDED

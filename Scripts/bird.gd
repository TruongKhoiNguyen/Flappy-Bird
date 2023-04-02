extends RigidBody2D

const FlappingState = preload("res://Scripts/States/state_flapping.gd")
const FlyingState   = preload("res://Scripts/States/state_flying.gd")
const HitState      = preload("res://Scripts/States/state_hit.gd")
const GroundedState = preload("res://Scripts/States/state_grounded.gd")

enum STATE {FLYING, FLAPPING, HIT, GROUNDED}


@export var flap_force = 150
@export var start_velocity = 50

var bird_state

signal state_changed


func _ready():
	set_bird_state(STATE.FLYING)
	connect("body_entered", _on_body_entered)
	

func _on_body_entered(other_body):
	if bird_state.has_method("on_body_entered"):
		bird_state.on_body_entered(other_body)
	pass


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
	
	emit_signal("state_changed")
	
func get_bird_state():
	if bird_state is FlyingState:
		return STATE.FLYING
	elif  bird_state is FlappingState:
		return STATE.FLAPPING
	elif bird_state is HitState:
		return STATE.HIT
	elif bird_state is GroundedState:
		return STATE.GROUNDED

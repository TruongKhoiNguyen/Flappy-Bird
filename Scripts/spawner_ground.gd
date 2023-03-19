extends Node2D

const scn_ground = preload("res://Scenes/ground.tscn")
const GROUND_WIDTH = 168

@export var PREFILL = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(PREFILL):
		spawn_and_move()

func spawn_and_move():
	spawn_ground()
	move_to_next_pos()

func spawn_ground():
	var new_ground = scn_ground.instantiate()
	new_ground.position = position
	new_ground.connect("tree_exited", spawn_and_move)
	$Container.add_child(new_ground)
	
func move_to_next_pos():
	position.x += GROUND_WIDTH

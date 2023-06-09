extends Node2D

const scn_ground = preload("res://Scenes/ground.tscn")
const GROUND_WIDTH = 168

@export var PREFILL = 3

@onready var camera := get_parent().get_node("bird/camera")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(PREFILL):
		spawn_and_move()

func spawn_and_move():
	spawn()
	move_to_next_pos()

func spawn():
	var new_ground = scn_ground.instantiate()
	new_ground.add_camera(camera)
	new_ground.position = position
	new_ground.connect("tree_exited", spawn_and_move)
	$container.add_child.call_deferred(new_ground)
	
func move_to_next_pos():
	position.x += GROUND_WIDTH

extends Node2D

const scn_pipe = preload("res://Scenes/pipe.tscn")
const PIPE_WIDTH = Pipe.PIPE_WIDTH

const OFFSET_Y = 55
const OFFSET_X = 55
const GROUND_HEIGHT = Ground.GROUND_HEIGHT

@export var prefill := 3 

@onready var viewport_height := get_viewport_rect().size.y
@onready var viewport_width := get_viewport_rect().size.x

@onready var camera: Camera2D = get_tree().get_root().get_node("main/bird/camera")
@onready var children_container := $container
		
func start():
	randomize()
	go_to_init_pos()
	
	for i in range(prefill):
		spawn_and_move()

func go_to_init_pos() -> void:
	var x := cal_init_pos(camera.global_position.x)
	var y := generate_pos_y()
	move(x, y)

func spawn_and_move():
	spawn()
	move_to_next_pos()

func spawn() -> void:
	var new_pipe := create_child(position, spawn_and_move)
	children_container.add_child.call_deferred(new_pipe)

func move_to_next_pos() -> void:
	move(
		cal_next_pos(position.x),
		generate_pos_y()
	)
	
func create_child(p_position: Vector2, on_exit: Callable) -> Pipe:
	var new_pipe := scn_pipe.instantiate()
	new_pipe.position = p_position
	new_pipe.tree_exited.connect(on_exit)
	
	return new_pipe
	
func move(x: float, y: float) -> void:
	position = Vector2(x, y)

func cal_init_pos(camera_position: float) -> float:
	var x := viewport_width + PIPE_WIDTH / 2
	x += camera_position
	
	return x
	
func cal_next_pos(current_pos: float) -> float:
	return current_pos + PIPE_WIDTH / 2 + OFFSET_X + PIPE_WIDTH / 2
	
func generate_pos_y() -> int:
	return int(randi_range(
		0 + OFFSET_Y, viewport_height - GROUND_HEIGHT - OFFSET_Y))

func _on_bird_state_changed(_bird):
	start()

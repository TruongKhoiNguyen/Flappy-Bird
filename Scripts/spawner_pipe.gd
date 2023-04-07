extends Node2D

const scn_pipe = preload("res://Scenes/pipe.tscn")
const PIPE_WIDTH = 26 

const OFFSET_Y = 55
const GROUND_HEIGHT = 56
const OFFSET_X = 55

const PREFILL = 3 

@onready var viewport_height := get_viewport_rect().size.y
		
func start():
	go_to_init_pos()
	
	for i in range(PREFILL):
		spawn_and_move()

func go_to_init_pos():
	randomize()
	var init_pos = Vector2()
	init_pos.x = get_viewport_rect().size.x + PIPE_WIDTH / 2
	init_pos.y = int(randi_range(0 + OFFSET_Y, viewport_height - GROUND_HEIGHT - OFFSET_Y))
	
	var camera = get_tree().get_root().get_node("main/bird/camera")
	if camera:
		init_pos.x += camera.global_position.x
		
	position = init_pos

func spawn_and_move():
	spawn()
	move_to_next_pos()

func spawn():
	var new_pipe = scn_pipe.instantiate()
	new_pipe.position = position
	new_pipe.connect("tree_exited", spawn_and_move)
	$container.add_child.call_deferred(new_pipe)
	
func move_to_next_pos():
	var next_pos := position
	next_pos.x += PIPE_WIDTH / 2 + OFFSET_X + PIPE_WIDTH / 2
	next_pos.y = int(randi_range(0 + OFFSET_Y, viewport_height - GROUND_HEIGHT - OFFSET_Y))
	position = next_pos


func _on_bird_state_changed(_bird):
	start()
	pass

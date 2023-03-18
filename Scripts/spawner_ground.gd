extends Node2D

const scn_ground = preload("res://Scenes/ground.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_ground()


func spawn_ground():
	var new_ground = scn_ground.instantiate()
	new_ground.position = position
	$Container.add_child(new_ground)
	

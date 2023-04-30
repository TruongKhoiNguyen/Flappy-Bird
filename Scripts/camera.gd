extends Camera2D

@export var duration := 0.18
@export var magnitude := 3

var time := 0.0

func shake():
	var initial_offset := offset
	
	while time < duration:
		time += get_process_delta_time()
		time = min(time, duration)
		
		var shake_offset := Vector2()
		shake_offset.x = randi_range(-magnitude, magnitude)
		shake_offset.y = randi_range(-magnitude, magnitude)
		
		offset = initial_offset + shake_offset
		
		await get_tree().process_frame
		
	time = 0
	offset = initial_offset


func _on_bird_state_changed(bird: Bird):
	if (
			bird.get_bird_state() == bird.STATE.GROUNDED 
			or bird.get_bird_state() == bird.STATE.HIT
	):
		shake()
		bird.state_changed.disconnect(_on_bird_state_changed)
	

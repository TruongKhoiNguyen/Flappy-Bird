extends TextureButton


func _on_pressed():
	get_tree().paused = true


func _on_bird_state_changed(bird: Bird):
	if (
			bird.get_bird_state() == bird.STATE.GROUNDED 
			or bird.get_bird_state() == bird.STATE.HIT
	):
		hide()

extends Control



func _on_bird_state_changed(bird):
	if bird.get_bird_state() == bird.STATE.GROUNDED:
		show()
	pass

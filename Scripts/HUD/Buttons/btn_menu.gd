extends TextureButton



func _on_pressed():
	get_tree().paused = false
	StateManager.change_stage(StateManager.STAGE_MENU)

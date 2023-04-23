extends TextureButton


func _on_pressed():
	get_tree().paused = true
	print("Click")

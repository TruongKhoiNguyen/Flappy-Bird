extends TextureButton


func _ready():
	grab_focus()

func on_pressed():
	var bird: Bird = get_tree().get_root().get_node("main/bird")
	if bird:
		bird.set_bird_state(bird.STATE.FLAPPING)
		
	hide()


func _on_pressed():
	var bird: Bird = get_tree().get_root().get_node("main/bird")
	if bird:
		bird.set_bird_state(bird.STATE.FLAPPING)
		
	hide()
	pass

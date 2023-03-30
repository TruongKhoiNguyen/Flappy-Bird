extends TextureButton


func _ready():
	connect("pressed", on_pressed)
	grab_focus()

func on_pressed():
	var bird = get_tree().get_root().get_node("main/bird")
	if bird:
		bird.set_bird_state(bird.STATE.FLAPPING)
		
	hide()

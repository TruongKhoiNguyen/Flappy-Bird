extends AnimatedSprite2D


func ready():
	go_to_random_position()


func go_to_random_position():
	var rand_angle := deg_to_rad(randi_range(0, 360))
	var rand_radius := randi_range(0, Medal.MEDAL_RADIUS)
	
	var x := rand_radius * cos(rand_angle) + Medal.MEDAL_RADIUS
	var y := rand_radius * sin(rand_angle) + Medal.MEDAL_RADIUS
	
	position = Vector2(x, y)


func _on_medal_shown():
	$animation.play("shine")

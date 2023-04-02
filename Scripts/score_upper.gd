extends Area2D

func _on_body_entered(body):
	if body.is_in_group("birds"):
		Game.score_current += 1
	pass

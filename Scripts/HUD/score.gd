extends Label


func _ready():
	Game.connect("score_current_changed", _on_score_current_changed)
	
	text = str(Game.score_current)
	pass
	

func _on_score_current_changed():
	text = str(Game.score_current)
	pass

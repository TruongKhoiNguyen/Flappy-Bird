extends Label

func _ready():
	text = str(Game.score_best)
	Game.score_best_changed.connect(_on_score_best_changed)
	pass

func _on_score_best_changed():
	text = str(Game.score_best)
	pass

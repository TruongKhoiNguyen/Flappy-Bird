extends TextureRect


func _ready():
	Game.score_best_changed.connect(_on_score_best_changed)
	pass
	

func _on_score_best_changed():
	show()
	pass

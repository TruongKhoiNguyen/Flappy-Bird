extends Node


signal score_current_changed
signal score_best_changed


var score_current = 0:
	set(value):
		score_current = value
		emit_signal("score_current_changed")
	
		
var score_best = 0:
	set(value):
		score_best = value
		emit_signal("score_best_changed")

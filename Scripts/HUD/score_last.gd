extends Label

signal counting_finished


var lerp_time := 0.0
var lerp_duration := 0.5

	
func count_to_score_current():
	while lerp_time < lerp_duration:
		lerp_time += get_process_delta_time()
		lerp_time = min(lerp_time, lerp_duration)
		var percent := lerp_time / lerp_duration
		text = str(int(lerp(0, Game.score_current, percent)))
		await get_tree().process_frame
		
	Game.score_best = Game.score_current # Comparing with score_best is done in the setter
	counting_finished.emit()
	pass


func _on_animation_animation_finished(_anim_name):
	count_to_score_current()
	pass 

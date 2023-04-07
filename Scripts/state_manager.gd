extends CanvasLayer

signal stage_changed

const STAGE_MAIN := "res://Scenes/main.tscn"

var is_stage_changing := false

func change_stage(stage_path: String) -> void:
	if is_stage_changing:
		return
		
	is_stage_changing = true
	
	$tex_black/animation.play("fade_in")
	await $tex_black/animation.animation_finished
	
	get_tree().change_scene_to_file(stage_path)
	stage_changed.emit()
	
	$tex_black/animation.play("fade_out")
	await $tex_black/animation.animation_finished
	
	is_stage_changing = false
	pass

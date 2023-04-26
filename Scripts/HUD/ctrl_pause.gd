extends Control


func _ready():
	hide()


func _on_btn_pause_pressed():
	show()


func _on_btn_resume_pressed():
	hide()

extends TextureRect


const MEDAL_BRONZE :Texture2D = preload("res://Sprites/medal_bronze.png")
const MEDAL_SILVER :Texture2D = preload("res://Sprites/medal_silver.png")
const MEDAL_GOLD :Texture2D = preload("res://Sprites/medal_gold.png")
const MEDAL_PLATINUM :Texture2D = preload("res://Sprites/medal_platinum.png")


func _on_score_last_counting_finished() -> void:
	var sprite: Texture2D = null
	
	if Game.score_current >= Game.Medal.BRONZE:
		sprite = MEDAL_BRONZE
	if Game.score_current >= Game.Medal.SILVER:
		sprite = MEDAL_SILVER
	if Game.score_current >= Game.Medal.GOLD:
		sprite = MEDAL_GOLD
	if Game.score_current >= Game.Medal.PLATINUM:
		sprite = MEDAL_PLATINUM
		
	
	if sprite != null:
		texture = sprite
		show()
	

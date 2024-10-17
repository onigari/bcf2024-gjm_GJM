extends Control


func _ready():
	SoundManager.main_bgm.playing = false
	SoundManager.game_over_sfx.play()
	$VBoxContainer/PlayAgainButton.grab_focus()


func _on_play_again_button_pressed() -> void:
	SoundManager.click_sfx.play()
	HealthManager.current_health = HealthManager.max_health
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
	

func _on_return_button_pressed() -> void:
	SoundManager.click_sfx.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Main_menu.tscn")
	#hide()


func _on_exit_button_pressed() -> void:
	get_tree().quit()

extends Control


func _ready():
	$MarginContainer/VBoxContainer/NewGameButton.grab_focus()
	SoundManager.main_bgm.play()


func _on_new_game_pressed() -> void:
	SoundManager.click_sfx.play()
	get_tree().change_scene_to_file("res://Levels/Level0.tscn")
	
	# change scene to level 0


func _on_continue_pressed() -> void:
	SoundManager.click_sfx.play()
	print("Continue")
	
	# change scene to last played


func _on_settings_pressed() -> void:
	SoundManager.click_sfx.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_quit_pressed() -> void:
	SoundManager.click_sfx.play()
	print("Quit")
	get_tree().quit()


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

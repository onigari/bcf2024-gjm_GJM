extends Control


func _ready():
	$CenterContainer/VBoxContainer/ResumeButton.grab_focus()


func _on_resume_button_pressed() -> void:
	SoundManager.resume_sfx.play()
	hide()
	get_tree().paused = false


func _on_return_button_pressed() -> void:
	SoundManager.click_sfx.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Main_menu.tscn")
	#hide()


func _on_exit_button_pressed() -> void:
	get_tree().quit()

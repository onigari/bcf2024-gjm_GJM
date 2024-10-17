extends Node2D


@onready var master_volume_slider = $CanvasLayer/OptionsContainer/MasterVolumeSlider
@onready var music_volume_slider = $CanvasLayer/OptionsContainer/MusicVolumeSlider
@onready var sfx_volume_slider = $CanvasLayer/OptionsContainer/SfxVolumeSlider

var options


func _ready():
	options = OptionsManager.read_options()
	master_volume_slider.value = options.master_volume if options.has("master_volume") else 1.0
	music_volume_slider.value = options.music_volume if options.has("music_volume") else 1.0
	sfx_volume_slider.value = options.sfx_volume if options.has("sfx_volume") else 1.0


func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		back_to_main_menu()


func _on_back_button_pressed():
	back_to_main_menu()


func back_to_main_menu():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_master_volume_slider_value_changed(value):
	options.master_volume = value
	OptionsManager.write_options(options)
	SoundManager.set_master_volume(value)	


func _on_music_volume_slider_value_changed(value):
	options.music_volume = value
	OptionsManager.write_options(options)
	SoundManager.set_music_volume(value)


func _on_sfx_volume_slider_value_changed(value):
	options.sfx_volume = value
	OptionsManager.write_options(options)
	SoundManager.set_sfx_volume(value)



func _on_key_binding_button_pressed():
	get_tree().change_scene_to_file("res://scenes/key_binding.tscn")

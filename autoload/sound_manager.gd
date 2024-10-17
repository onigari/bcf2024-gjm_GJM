extends Node


@onready var click_sfx := $ClickSFX
@onready var resume_sfx := $ResumeSFX
@onready var main_bgm := $MainBgm
@onready var coin_sfx := $MarioCoin
@onready var game_over_sfx: AudioStreamPlayer = $GameOver
@onready var jump_sfx: AudioStreamPlayer = $Jump


var master_bus
var music_bus
var sfx_bus


func _ready():
	master_bus = AudioServer.get_bus_index("Master")
	music_bus = AudioServer.get_bus_index("Music")
	sfx_bus = AudioServer.get_bus_index("SFX")


func init_sound_system():
	set_master_volume()
	set_music_volume()
	set_sfx_volume()


func set_master_volume(value = -1):
	if value == -1:
		value = OptionsManager.get_master_volume()
	# the value is between 0 and 1
	AudioServer.set_bus_volume_db(master_bus, linear_to_db(value))


func set_music_volume(value = -1):
	if value == -1:
		value = OptionsManager.get_music_volume()
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))


func set_sfx_volume(value = -1):
	if value == -1:
		value = OptionsManager.get_sfx_volume()
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(value))

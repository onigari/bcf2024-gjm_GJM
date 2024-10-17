extends Node


const DEFAULT_MASTER_VOLUME = 1.0
const DEFAULT_MUSIC_VOLUME = 1.0
const DEFAULT_SFX_VOLUME = 1.0


const options_path = "user://options.dat"


func read_options():
	var options = {}
	var file = FileAccess.open(options_path, FileAccess.READ)
	if file:
		options = file.get_var()
		file.close()
	return options


func write_options(options):
	var file = FileAccess.open(options_path, FileAccess.WRITE)
	file.store_var(options)
	file.close()


func get_master_volume():
	var options = read_options()
	return options.master_volume if options.has("master_volume") else DEFAULT_MASTER_VOLUME


func get_music_volume():
	var options = read_options()
	return options.music_volume if options.has("music_volume") else DEFAULT_MUSIC_VOLUME


func get_sfx_volume():
	var options = read_options()
	return options.sfx_volume if options.has("sfx_volume") else DEFAULT_SFX_VOLUME

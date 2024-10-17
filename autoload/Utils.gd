extends Node

const SAVE_PATH = "res://savegame.bin"

func savegame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		var data: Dictionary = {
			"Lives": Game.Lives,
			"gold": Game.Gold,  # Ensure consistent key casing
		}
		var jstr = JSON.stringify(data)
		file.store_line(jstr)
		file.close()  # Don't forget to close the file

func loadgame():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			if not file.eof_reached():
				var current_line = JSON.parse_string(file.get_line())
				if current_line:
					Game.playerHP = current_line["Lives"]  # Use the correct casing
					Game.Gold = current_line["Gold"]  # Ensure consistent key casing
			file.close()

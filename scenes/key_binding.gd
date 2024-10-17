extends Node2D

#func get_all_children(in_node, array := []):
	#array.push_back(in_node)
	#for child in in_node.get_children():
		#array = get_all_children(child, array)
	#return array
#
#
#func _on_restore_default_button_pressed():
	#KeyManager.reset_keymap()
	## refresh UI
	#for item in get_all_children($CanvasLayer/ControlsContainer):
		#if item is KeyBindingButton:
			#item.display_current_key()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

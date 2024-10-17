extends Control


func _on_area_2d_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

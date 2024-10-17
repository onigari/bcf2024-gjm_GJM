extends Area2D

var can_open=false

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Interact") and can_open):
		get_tree().change_scene_to_file("res://Levels/level_2.tscn")


func _on_body_entered(body: Node2D) -> void:
	can_open=true


func _on_body_exited(body: Node2D) -> void:
	can_open=false

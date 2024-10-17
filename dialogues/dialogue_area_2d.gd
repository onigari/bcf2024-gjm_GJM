extends Area2D

const custom_balloon = preload("res://dialogues/balloon.tscn")
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "level0"


func action():
	var balloon : Node = custom_balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	#DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)

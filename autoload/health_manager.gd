extends Node

@export var max_health := 50
var current_health : int
@onready var anim:AnimatedSprite2D=$AnimatedSprite2D

signal on_health_changed(health)


func _ready():
	current_health = max_health
	
	
func decrease_health(amount : int):
	
	current_health = 0 if current_health <= amount else (current_health - amount)
	
	print("decrease health called ", current_health)
	on_health_changed.emit(current_health)
	
	if current_health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
	
func increase_health(amount : int):
	current_health = max_health if current_health+amount >= max_health else current_health + amount
	
	print("increase health called ", current_health)
	on_health_changed.emit(current_health)

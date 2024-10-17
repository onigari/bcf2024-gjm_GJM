extends Node

@export var boss_character : CharacterBody2D
@export var boss_sprite : AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not boss_character.is_on_floor():
		boss_character.velocity.y += boss_character.get_gravity().y * delta
		
	boss_character.move_and_slide()

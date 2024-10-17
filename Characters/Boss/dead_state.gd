extends NodeState


@export var boss_character : CharacterBody2D
@export var boss_sprite : AnimatedSprite2D


func on_process(delta):
	pass
	
	
func on_physics_process(delta):
	if boss_character.health <= 0:
		boss_sprite.play("dead")
		await boss_sprite.animation_finished
		queue_free()
	
	
func enter():
	pass
	
func exit():
	pass

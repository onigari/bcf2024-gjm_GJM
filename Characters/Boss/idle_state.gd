extends NodeState

@export var boss_character : CharacterBody2D
@export var boss_sprite : AnimatedSprite2D
@export var slow_down_speed := 300

func on_process(delta):
	pass
	
	
func on_physics_process(delta):
	boss_character.velocity.x = move_toward(boss_character.velocity.x, 0, slow_down_speed * delta)
	boss_sprite.play("idle")
	boss_character.move_and_slide()
	
	
func enter():
	pass
	
func exit():
	pass

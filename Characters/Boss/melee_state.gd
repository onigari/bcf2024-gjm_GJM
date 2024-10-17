extends NodeState

@export var boss_character : CharacterBody2D
@export var boss_sprite : AnimatedSprite2D
@export var speed := 25

var player : CharacterBody2D


func on_process(delta):
	pass
	
	
func on_physics_process(delta):
	var direction : int
	
	if boss_character.global_position > player.global_position:
		boss_sprite.flip_h = false
		direction = -1
	else:
		boss_sprite.flip_h = true
		direction = 1
		
	boss_sprite.play("melee")
	
	boss_character.velocity.x += direction * speed * delta
	boss_character.velocity.x = clamp(boss_character.velocity.x, -speed, speed)
	boss_character.move_and_slide()
	
	
func enter():
	player = get_tree().get_nodes_in_group("Player")[0] as CharacterBody2D
	
	
func exit():
	pass

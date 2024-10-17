extends NodeState

@export var boss_character : CharacterBody2D
@export var boss_sprite : AnimatedSprite2D
@export var bullet_sprite : AnimatedSprite2D
@export var speed := 50
@onready var muzzle: Marker2D = $"../../Muzzle"

var player : CharacterBody2D
var bullet_scene = preload("res://Characters/Boss/BossBullet.tscn")


func on_process(delta):
	pass
	
	
func on_physics_process(delta):
	var direction : int
	
	boss_character.velocity.x = 0
	boss_sprite.play("ranged")
	
	await boss_sprite.animation_finished
	
	if boss_character.global_position > player.global_position:
		boss_sprite.flip_h = false
		direction = -1
	else:
		boss_sprite.flip_h = true
		direction = 1
	
	var new_bullet = bullet_scene.instantiate()
	get_parent().add_child(new_bullet)
	new_bullet.global_position = muzzle.global_position + (Vector2(32,0) if direction>0 else Vector2(0,0))
	new_bullet.direction = direction
	
	
	
func enter():
	var playerNode = get_tree().get_nodes_in_group("Player")
	if playerNode:
		player = playerNode[0] as CharacterBody2D
	
	
func exit():
	pass

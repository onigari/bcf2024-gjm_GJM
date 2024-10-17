class_name Boar extends CharacterBody2D

var player
@export var health = 40
var chase = false
@onready var anim = get_node("AnimatedSprite2D")
const SPEED = 50
var can_play_attack = true
var attack_timer = 0
var wait_time = 1
var can_damage = true
var initial_position = self.position
var direction = 1  # This will keep track of the movement direction

func _ready():
	pass

func _process(delta: float) :
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# If the boar is chasing the player
	if chase:
		anim.play("run")
		player = get_node("../Player")
		var dir = (player.position - self.position).normalized()

		# Flip sprite based on player position
		get_node("AnimatedSprite2D").flip_h = dir.x > 0

		# Move towards the player
		velocity.x = 1.5 * SPEED * dir.x
	else:
		# Boar's wandering movement
		if is_on_wall():
			# Reverse direction when colliding with a wall
			direction *= -1

		velocity.x = SPEED * direction
		
		# Flip sprite based on direction
		get_node("AnimatedSprite2D").flip_h = direction > 0
		anim.play("walk")
	
	player = get_node("../Player")
	# Stop if the player is very close
	if abs(player.position.x - self.position.x) < 20:
		velocity.x = 0
	
	move_and_slide()

func _on_player_detection_body_entered(body: Node2D) :
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body: Node2D) :
	if body.name == "Player":
		chase = false
		
func die(): 
	$PlayerDeath.collision_mask = 0
	collision_mask = 1000000
	var tween1 = get_tree().create_tween()
	tween1.tween_property(self, "modulate:a", 0, 0.3)
	tween1.tween_callback(queue_free)

func knockedback():
	var tween = get_tree().create_tween()
	if get_node("AnimatedSprite2D").flip_h == true:
		tween.tween_property(self, "position", position - Vector2(20, 0), 0.35)
	else:
		tween.tween_property(self, "position", position + Vector2(20, 0), 0.35)
	anim.play("hurt")
	await anim.animation_finished
	if chase == true:
		anim.play("run")
	else:
		anim.play("walk")
	
func _on_slash_detection_body_entered(body: Node2D) -> void:
	$Damageable.hit(5)

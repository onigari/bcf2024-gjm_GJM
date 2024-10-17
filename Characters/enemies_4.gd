class_name Bee extends CharacterBody2D

var player
@export var health=40
var chase = false
@onready var anim=get_node("AnimatedSprite2D")
const SPEED = 100
var can_play_attack=true
var attack_timer=0
var wait_time=1
var can_damage=true
var initial_position=self.position
func _ready():
	anim.play("fly")
	

func _process(delta: float) :



	if chase:
		
			
		player = get_node("../Player")
		var direction = (player.position - self.position).normalized()
		
		get_node("AnimatedSprite2D").flip_h = direction.x > 0
		
		velocity = SPEED * direction
		
		
	else:
			var direction = (initial_position - self.position).normalized()
			velocity = SPEED * direction
			get_node("AnimatedSprite2D").flip_h = direction.x > 0
			anim.play("fly")
			
	
	player = get_node("../Player")
	if abs(player.position - self.position)<Vector2(15,15):
		velocity.x=0
	move_and_slide()

func _on_player_detection_body_entered(body: Node2D) :
	
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body: Node2D) :
	if body.name == "Player":
		chase = false
		
func die(): 
	
	$PlayerDeath.collision_mask=0
	collision_mask=1000000
	var tween1=get_tree().create_tween()
	tween1.tween_property(self,"modulate:a",0,0.3)
	tween1.tween_callback(queue_free)

func knockedback():
	var tween=get_tree().create_tween()
	if(get_node("AnimatedSprite2D").flip_h==true):
		tween.tween_property(self,"position",position-Vector2(20,0),0.35)
	else:
		tween.tween_property(self,"position",position+Vector2(20,0),0.35)
	anim.play("hurt")
	await anim.animation_finished
	anim.play("fly")
	
	
	


func _on_slash_detection_body_entered(body: Node2D) -> void:
	$Damageable.hit(5)

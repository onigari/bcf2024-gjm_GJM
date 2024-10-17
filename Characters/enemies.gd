class_name Snail extends CharacterBody2D

var player
@export var health=25
var chase = false
@onready var anim=get_node("AnimatedSprite2D")
const SPEED = 55

var can_play_attack=true
var attack_timer=0
var wait_time=1
var can_damage=true
var initial_position

func _ready():
	anim.play("Idle")
	initial_position=self.position
	#print(self.position)

func _process(delta: float) :
	
	if not is_on_floor():
		velocity+= get_gravity() * delta
		
	
	if chase:
		if anim.animation!="Death":
			anim.play("Walk")
		player = get_node("../Player")
		var direction = (player.position - self.position).normalized()
		
		get_node("AnimatedSprite2D").flip_h = direction.x > 0
		
		velocity.x = SPEED * direction.x
		
		
	else:
		if anim.animation!="Death":
			anim.play("Idle")
			
			velocity.x = 0
	
	player = get_node("../Player")
	if abs(player.position.x - self.position.x)<30:
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
	anim.play("Death")
	await anim.animation_finished
	self.queue_free()

func knockedback():
	
	var direction = (player.position - self.position).normalized()
	if(get_node("AnimatedSprite2D").flip_h==true):
		var tween=get_tree().create_tween()
		var tween2=get_tree().create_tween()
		tween.tween_property(self,"position",position-Vector2(20,0),0.35)
		tween2.tween_property(self,"modulate:a",0,0.15)
		tween2.tween_property(self,"modulate:a",255,0.15)
		
	else:
		player = get_node("../Player")
		var tween=get_tree().create_tween()
		var tween2=get_tree().create_tween()
		tween.tween_property(self,"position",position+Vector2(20,0),0.35)
		
		tween2.tween_property(self,"modulate:a",0,0.15)
		tween2.tween_property(self,"modulate:a",255,0.15)


func _on_slash_detection_body_entered(body: Node2D) -> void:
	$Damageable.hit(5)

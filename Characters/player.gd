extends CharacterBody2D

class_name Player
@export var health=50
@export var jump_time : float=0.25
@export var coyote_time: float=0.2

var coyote_timer:float=0
var jump_timer:float=0
@onready var melee_collision=$Sword/CollisionShape2D
@export var speed = 200.0
@export var JUMP_VELOCITY = -350.0
@export var double_jump_velocity=-100
@onready var anim:AnimatedSprite2D=$AnimatedSprite2D
@onready var anime=$AnimationPlayer
@onready var timer=$Timer
@onready var shoot_timer := $WindSlashAnimation as Timer
@onready var slash = $AnimatedSprite2D/Slash as Slash

var is_shooting := true
var shoot=true
var can_double_jump:bool=true
var animation_locked:bool=false
var can_do_second_attack=true
var was_in_air=false
var run_animation_locked=false
var can_run=true
var has_jumped=true
var can_fall=true
var not_attacking=true
var can_move=true
var count=1
var timer_started=false
var damage_multiplier=false
var is_jumping=false
var boss_can_range = true

signal facing_direction_changed(facing_right:bool)
signal multiply_damage(damage_multiplier)


@onready var interactives_finder: Area2D = $Marker2D/DialogueArea2D




func _physics_process(delta: float) -> void:
	if Game.can_move == true:
		if not is_on_floor():
			velocity += 0.9*get_gravity() * delta
			coyote_timer +=delta
			if(coyote_timer>=coyote_time):
				has_jumped=true
		else:
			coyote_timer=0
			has_jumped=false
			is_jumping=false
		
			
		# Handle jump.
		if Input.is_action_just_pressed("jump"):
			if is_on_floor() :
				velocity.y = JUMP_VELOCITY
				can_double_jump=true
				is_jumping=true
			elif coyote_timer<=coyote_time and is_jumping==false:
				velocity.y = JUMP_VELOCITY
				can_double_jump=true
				is_jumping=true
			elif can_double_jump:
					velocity.y =JUMP_VELOCITY
					can_double_jump=false
					is_jumping=true

		var direction := Input.get_axis("left", "right")
		if direction==-1:
			get_node("AnimatedSprite2D").flip_h=true
		elif direction==1:
			get_node("AnimatedSprite2D").flip_h=false
			
		emit_signal("facing_direction_changed",!get_node("AnimatedSprite2D").flip_h)
			
		if direction and can_move :
			
			velocity.x = direction * speed
			if(not velocity.y==0):
				if(velocity.y>0):
					if get_node("AnimatedSprite2D").animation!="Death" and not_attacking:
						if(has_jumped and !animation_locked):
							anim.play("jump_loop")

					
				else:
					if get_node("AnimatedSprite2D").animation!="Death" and not_attacking :

						anim.play("jump_start")
			else:
				if get_node("AnimatedSprite2D").animation!="Death" and not_attacking :
					if(velocity.x!=0 and can_run ):
						anim.play("run")
			
			
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			if velocity.y==0 and is_on_floor():
				if get_node("AnimatedSprite2D").animation!="Death" and not_attacking :
					anim.play("idle")
			if Input.is_action_just_pressed("jump") :
				if get_node("AnimatedSprite2D").animation!="Death" and not_attacking :
					anim.play("jump_start")
					
		if(count==1):
			if Input.is_action_just_pressed("attack"):
				timer.start()
				attack()
		
		if Input.is_action_just_pressed("shoot"):
				shoot1()
				is_shooting=slash.shoot(!get_node("AnimatedSprite2D").flip_h)
		move_and_slide()
		
		
		emit_signal("multiply_damage",damage_multiplier)
	
	
func shoot1():
	if not_attacking:
		SoundManager.jump_sfx.play()
	not_attacking=false
	if(velocity.y==0):
		can_move=false
	anime.play("attack3")
	await anime.animation_finished
	not_attacking=true
	can_move=true
		
	
		
func attack():
	if not_attacking:
		SoundManager.jump_sfx.play()
	damage_multiplier=false
	not_attacking=false
	can_move=false
	anime.play("attack1")
	
	await anime.animation_finished
	not_attacking=true
	can_move=true
	if(!timer.is_stopped()):
		attack2()
	
func attack2():
	if not_attacking:
		SoundManager.jump_sfx.play()
	damage_multiplier=true
	not_attacking=false
	can_move=false
	anime.play("attack2")
	await anime.animation_finished
	not_attacking=true
	can_move=true


func die():
	anim.play("Death")
	await anim.animation_finished
	#get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
	
func knockedback():
	pass


func _on_hurtbox_body_entered(body) -> void:
	if body.is_in_group("Enemy"):
		print("enemy hit u ", 1)
		HealthManager.decrease_health(1)


#func _on_hurtbox_area_entered(area: Area2D) -> void:
	#if area.is_in_group("EnemyBullet") and boss_can_range:
		#area.queue_free()
		#boss_can_range = false
		##print("bullet entered ", area.ranged_damage_amount)
		#HealthManager.decrease_health(1)
		

func _on_timer_2_timeout() -> void:
	boss_can_range = true

	
func _unhandled_input(event: InputEvent) -> void:
	var interactives = interactives_finder.get_overlapping_areas()
	if interactives.size() > 0 :
		Game.can_move = false
		#interactives_entered = true
		#interactives_entered = interactives_entered - 1
		interactives[0].action()
		interactives[0].queue_free()
	#elif interactives.size() <= 0:
		#interactives_entered = false
		
	if Input.is_action_just_pressed("ui_accept"):
			return

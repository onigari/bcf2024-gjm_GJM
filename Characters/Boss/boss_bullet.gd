extends Area2D


@export var ranged_damage_amount := 1
var speed := 600
var direction : int


func _physics_process(delta: float) -> void:
	move_local_y(direction * speed * delta)


func _on_timer_timeout() -> void:
	queue_free()


#func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("Player"):
		#HealthManager.decrease_health(ranged_damage_amount)
		#queue_free()

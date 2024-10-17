extends Area2D
var in_range
var damage=3
var gay=true

func _on_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is Damaegable:
			get_parent().get_node("AnimationPlayer").play("attack")
			await get_parent().get_node("AnimationPlayer").animation_finished
			get_parent().get_node("AnimatedSprite2D").play("attack")
			HealthManager.decrease_health(damage)


func _on_area_2d_body_exited(body: Node2D) -> void:
	get_parent().get_node("AnimationPlayer").play("walk")
	get_parent().get_node("AnimatedSprite2D").play("walk")

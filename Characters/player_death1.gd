extends Area2D
var in_range
var damage=3
var gay=true


func _on_body_entered(body: Node2D) -> void:
	
	for child in body.get_children():
		if child is Damaegable:
			get_parent().get_node("AnimationPlayer").play("attack")
			print("snail")
			HealthManager.decrease_health(damage)

			


func _on_area_2d_body_exited(body: Node2D) -> void:
	get_parent().get_node("AnimationPlayer").play("walk")
	

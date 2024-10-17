extends Area2D
var in_range
var damage=1
var gay=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	for child in body.get_children():
		if child is Damaegable:
				get_parent().get_node("AnimationPlayer").play("attack")
				child.hit(damage)
			


func _on_area_2d_body_exited(body: Node2D) -> void:
	get_parent().get_node("AnimationPlayer").play("walk")
	get_parent().get_node("AnimatedSprite2D").play("fly")

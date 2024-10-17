extends Area2D
var in_range
var damage=3
var gay=true
# Called when the node enters the scene tree for the first time.

	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



	


	


func _on_body_entered(body: Node2D) -> void:
	
	for child in body.get_children():
		if child is Damaegable:
				get_parent().get_node("AnimationPlayer").play("attack")
				get_parent().get_node("AnimatedSprite2D").play("attack")
				child.hit(damage)

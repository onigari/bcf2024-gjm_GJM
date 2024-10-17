extends Area2D

var can_open=false
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Interact") and can_open:
			$AnimatedSprite2D.play("Open")
			await $AnimatedSprite2D.animation_finished
			Game.coins +=10
			$"../Hud/CoinCanvas/Label".text = "x " + str(Game.coins)
			var tween=get_tree().create_tween()
			tween.tween_property(self,"modulate:a",0,0.2)
			tween.tween_callback(queue_free)


func _on_body_entered(body: Node2D) -> void:
	can_open=true
		


func _on_body_exited(body: Node2D) -> void:
	can_open=false

extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../Hud/HPCanvas/HP".text = "HP: " + str(HealthManager.current_health)


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		Game.coins += 1
		if Game.coins >= 20:
			Game.coins -= 20
			HealthManager.increase_health(15)
		print("Coins: " + str(Game.coins))
		SoundManager.coin_sfx.play()
		$"../Hud/CoinCanvas/Label".text = "x " + str(Game.coins)
		var tween=get_tree().create_tween()
		var tween1=get_tree().create_tween()
		tween.tween_property(self,"position",position-Vector2(0,35),0.35)
		tween1.tween_property(self,"modulate:a",0,0.2)
		tween.tween_callback(queue_free)

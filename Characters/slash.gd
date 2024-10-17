class_name Slash extends Marker2D
## Represents a weapon that spawns and shoots bullets.
## The Cooldown timer controls the cooldown duration between shots.


const SLASH_VELOCITY = 850
const SLASH_SCENE = preload("res://attacks/wind_slash.tscn")


@onready var timer := $Cooldown as Timer


# This method is only called by Player.gd.
func shoot(direction: float = 1.0) -> bool:
	
	if not timer.is_stopped():
		return false
	var wind_slash:= SLASH_SCENE.instantiate() as Wind_Slash
	 
	
	wind_slash.set_as_top_level(true)
	add_child(wind_slash)
	
	if direction==0:
		wind_slash.global_position = global_position - Vector2(30,0)
		wind_slash.linear_velocity =Vector2(-1 * SLASH_VELOCITY, 0.0)
		wind_slash.get_node("Sprite2D").flip_h=true
		#wind_slash.get_node("CollisionShape2D").position=wind_slash.get_node("CollisionShape2D").facing_left
	else:
		wind_slash.linear_velocity =Vector2(1 * SLASH_VELOCITY, 0.0)
		wind_slash.global_position = global_position 
		wind_slash.get_node("CollisionShape2D")
		
	timer.start()
	return true

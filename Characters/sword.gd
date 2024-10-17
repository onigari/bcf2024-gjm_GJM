extends Area2D

var damage=10
var dam:int
@export var player: Player
@export var facing_shape: Facing_CollisionShape_2D

func _ready() -> void:
	player.connect("facing_direction_changed", _on_facing_direction_changed)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_facing_direction_changed(facing_right:bool):
	if(facing_right):
		facing_shape.position=facing_shape.facing_right_position
		
	else:
		facing_shape.position=facing_shape.facing_left_position
		

		
		


func _on_player_multiply_damage(damage_multiplier) -> void:
	if(damage_multiplier):
		dam=damage*2
	else:
		dam=damage
	

func _on_body_entered(body):
	if(body is Snail):
		dam=dam*0.75
	
	for child in body.get_children():
		if child is Damaegable:
			child.hit(dam)
			

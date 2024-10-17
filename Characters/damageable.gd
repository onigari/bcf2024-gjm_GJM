extends Node

class_name Damaegable

@export var hp:float=20

# Called when the node enters the scene tree for the first time.
func hit(damage:int):
	get_parent().knockedback()
	hp -= damage
	print(hp)
	if(hp<=0):
		print(get_parent())
		if get_parent() is not Player:
			get_parent().die()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	

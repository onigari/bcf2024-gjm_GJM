class_name Wind_Slash extends RigidBody2D


@onready var animation_player := $AnimationPlayer as AnimationPlayer


func destroy() -> void:
	self.queue_free()

extends Node

@export var finite_state_machine : FiniteStateMachine


func _on_melee_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		finite_state_machine.transition_to("melee")


func _on_melee_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		finite_state_machine.transition_to("ranged")


func _on_ranged_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		finite_state_machine.transition_to("ranged")


func _on_ranged_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		finite_state_machine.transition_to("idle")

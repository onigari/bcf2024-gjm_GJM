extends Node2D

#@export var heart_full : Texture2D = preload("res://Assets/icons/heart_full.png")
#@export var heart_empty : Texture2D = preload("res://Assets/icons/heart_empty.png")

#@onready var heart_1: Sprite2D = $heart1
#@onready var heart_2: Sprite2D = $heart2
#@onready var heart_3: Sprite2D = $heart3
#
#@onready var player : Player = $"../Player"
#
#
#func _ready() -> void:
	#HealthManager.on_health_changed.connect(_on_player_health_changed)
	###heart_1.texture = heart_full
	###heart_2.texture = heart_full
	###heart_3.texture = heart_full
	###
	##
#func _on_player_health_changed(player_current_health: int):
	##if player_current_health == HealthManager.max_health:
		##heart_3.texture = heart_full
	##else:
		##heart_3.texture = heart_empty
		##
	##if player_current_health >= 2:
		##heart_2.texture = heart_full
	##else:
		##heart_2.texture = heart_empty
		##
	##if player_current_health >= 1:
		##heart_1.texture = heart_full
	##else:
		##heart_1.texture = heart_empty
		#
	#if player_current_health <= 0:
		#player.die()

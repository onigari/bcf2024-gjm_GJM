extends Node2D

@onready var pause_menu: Control = $PauseCanvas/PauseMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.coins = 0
	pause_menu.visible = false


func _process(delta):
	#GameManager.capture_mouse()
	if pause_menu.visible:
		pause_menu.visible = false
		
		
func _notification(what: int) -> void:
	if what == MainLoop.NOTIFICATION_APPLICATION_FOCUS_OUT:
		GameManager.pause_game(pause_menu)


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("pause"):
		$PauseCanvas/PauseMenu/CenterContainer/VBoxContainer/ResumeButton.grab_focus()
		GameManager.pause_game(pause_menu)


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

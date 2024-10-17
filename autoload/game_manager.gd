extends Node


var player
var camera
var world_environment
var mouse_captured = false


func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true


func release_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false


func pause_game(pause_menu):
	#SoundManager.click_sfx.play()
	#await get_tree().create_timer(0.05).timeout
	#release_mouse()
	pause_menu.visible = true
	get_tree().paused = true


var boundary = {
	"left": 0.0,
	"right": 0.0,
	"top": 0.0,
	"bottom": 0.0,
}
var boundary_margin = 10.0


func set_camera(_camera):
	camera = _camera


func set_boundary(left, right, top, bottom):
	boundary.left = left
	boundary.right = right
	boundary.top = top
	boundary.bottom = bottom


func is_in_boundary(node, add_margin = true):
	var margin = boundary_margin if add_margin else 0.0
	return (node.global_position.x > boundary.left - margin
		and node.global_position.x < boundary.right + margin
		and node.global_position.z > boundary.top - margin
		and node.global_position.z < boundary.bottom + margin)


func set_player(_player):
	player = _player


#func fire_player_weapon(root_node):
	#for weapon in player.weapons:
		#if weapon.active:
			#var bullet = bullet_scene.instantiate()
			#bullet.init(weapon)
			#root_node.add_child(bullet)
	#SoundManager.fire_bullet()


func spawn_power_up(root_node, enemy):
	var power_up_scene = enemy.power_up
	if power_up_scene != null:
		var power_up = power_up_scene.instantiate()
		power_up.init(enemy)
		root_node.add_child(power_up)

#
#func create_hit_effect(root_node, enemy, bullet):
	#var hit_effect = hit_effect_scene.instantiate()
	#hit_effect.init(bullet.position.x, bullet.position.z)
	#root_node.add_child(hit_effect)
	#if enemy.is_in_group("metal"):
		#SoundManager.metal_hit_effect()
	#else:
		#SoundManager.rock_hit_effect()


func fire_enemy_weapon(root_node, enemy, event):
	for weapon in enemy.weapons:
		if weapon.name == event.fire.weapon:
			if is_in_boundary(weapon, false):
				var bullet = event.fire.shot.instantiate()
				bullet.init(weapon, enemy.rotation.y)
				root_node.add_child(bullet)

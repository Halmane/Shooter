extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/laser.tscn") 
var grenade_scene: PackedScene = preload("res://scenes/grenade.tscn")

func _on_gate_player_entered_gate():
	print("player entered gate")
 

func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle())
	laser.direction = direction
	$Projectiles.add_child(laser)
	

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(1,1),1)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(0.6,0.6),2)

extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction)
var can_laser: bool = true
var can_grenade: bool = true

func _process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser:
		$GPUParticles2D.emitting = true
		can_laser = false
		$LaserTimer.start()
		var laser_markers = $LaserStartPos.get_children()
		var laser_pos = laser_markers[randi() % laser_markers.size()]
		laser.emit(laser_pos.global_position, player_direction)
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		var grenade_pos = $GranadeStartPos
		grenade.emit(grenade_pos.global_position, player_direction)


func _on_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true

extends StaticBody2D

var light_off: bool = false

func _process(delta):
	if(randi() % 100>=98 and !light_off):
		$Timer.start(randfn(0.3, 0.1))
		light_off = true
		$PointLight2D.energy = 0
	


func _on_timer_timeout():
	light_off = false
	$PointLight2D.energy = 10

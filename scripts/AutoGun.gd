extends Node2D



func _on_timer_timeout():
	$BulletEmmiter.fire_bullet_with_force(Vector2(cos(rotation), sin(rotation))*1000)
	#$BulletEmmiter.fire_bullet()


func _on_health_component_died():
	$CPUParticles2D.emitting = true
	$Timer.stop()
	$Sprite2D.hide()
	$HurtBox.disable()


func _on_cpu_particles_2d_finished():
	print_debug("died")
	queue_free()


func _on_hurt_box_hit(area):
	$Die.play()

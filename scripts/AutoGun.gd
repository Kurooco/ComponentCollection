extends Node2D





func _on_timer_timeout():
	$BulletEmmiter.fire_bullet_with_force(Vector2(100, -100))
	#$BulletEmmiter.fire_bullet()

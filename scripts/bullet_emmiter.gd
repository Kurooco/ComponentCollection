extends Node2D

signal bullet_fired

@export var bullets : PackedScene
@export var fire_direction : Vector2

func fire_bullet():
	#get_angle_to(position+fire_direction)
	var new_bullet = bullets.instantiate()
	add_child(new_bullet)
	emit_signal("bullet_fired")


func fire_bullet_with_force(force):
	#get_angle_to(position+fire_direction)
	var new_bullet = bullets.instantiate()
	new_bullet.apply_impulse(force, position)
	add_child(new_bullet)
	emit_signal("bullet_fired")

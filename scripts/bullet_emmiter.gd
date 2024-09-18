extends Node2D

signal bullet_fired(bullet)

@export var bullets : PackedScene
@export var fire_direction : Vector2
@export var friendly : bool

func fire_bullet():
	#get_angle_to(position+fire_direction)
	var new_bullet = bullets.instantiate()
	new_bullet.friendly = friendly
	$"/root/Autoload".main_node.add_child(new_bullet)
	emit_signal("bullet_fired", new_bullet)


func fire_bullet_with_force(force):
	#get_angle_to(position+fire_direction)
	var new_bullet = bullets.instantiate()
	new_bullet.friendly = friendly
	new_bullet.apply_impulse(force, position)
	$"/root/Autoload".main_node.add_child(new_bullet)
	new_bullet.global_position = global_position
	#emit_signal("bullet_fired", new_bullet)

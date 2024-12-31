extends Node2D

signal bullet_fired(bullet)

const POOL_SIZE = 200

@export var bullet_type : PackedScene
@export var fire_direction : Vector2
@export var friendly : bool
var bullet_pool
var next_bullet

func _ready():
	pass
	#bullet_pool = []
	#for i in POOL_SIZE:
	#	bullet_pool.append(bullet_type.instantiate()); 
	#next_bullet = 0

func fire_bullet():
	var new_bullet = bullet_type.instantiate()
	new_bullet.friendly = friendly
	$"/root/Autoload".main_node.add_child(new_bullet)
	new_bullet.global_position = global_position
	emit_signal("bullet_fired", new_bullet)

func fire_bullet_with_same_rotation():
	fire_bullet_with_rotation(rotation)

func fire_bullet_with_rotation(rotation):
	var new_bullet = bullet_type.instantiate()
	new_bullet.friendly = friendly
	$"/root/Autoload".main_node.add_child(new_bullet)
	new_bullet.global_position = global_position
	new_bullet.rotation = rotation
	emit_signal("bullet_fired", new_bullet)

func fire_bullet_with_force(force):
	var new_bullet = bullet_type.instantiate()
	new_bullet.friendly = friendly
	new_bullet.apply_impulse(force, position)
	$"/root/Autoload".main_node.add_child(new_bullet)
	new_bullet.global_position = global_position
	emit_signal("bullet_fired", new_bullet)

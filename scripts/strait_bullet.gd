extends Area2D

@export var friendly : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$WeaponArea.friendly = friendly

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Vector2(cos(rotation), sin(rotation))*1000
	print_debug(rotation)
	move_local_x(cos(rotation))
	move_local_y(sin(rotation))


func _on_body_entered(body):
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func successful_hit():
	pass

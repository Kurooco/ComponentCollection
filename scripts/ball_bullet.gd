extends RigidBody2D

@export var friendly : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$WeaponArea.friendly = friendly


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$WeaponArea.force = linear_velocity


func _on_weapon_area_hit_landed():
	die()

func die():
	$DeathHandler.die()

func _on_cpu_particles_2d_finished():
	queue_free()
	

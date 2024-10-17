extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -1000.0
const FIRE_VELOCITY = 1000
var starting_position

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	starting_position = position

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		if(!$Walk.playing):
			$Walk.play()
		velocity.x += direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity.x *= pow(.001, delta)
	move_and_slide()
	
	# control head
	if(position.x < get_global_mouse_position().x):
		$Head.flip_v = false
	else:
		$Head.flip_v = true
	$Head.look_at(get_global_mouse_position())

	# fire bullets
	if(Input.is_action_pressed("fire")):
		$Head.frame = 1
		if($Timer.is_stopped()):
			$Timer.start()
	else:
		$Head.frame = 0
		$Timer.stop()


func _on_health_component_died():
	die()
	

func _on_hurt_box_hit(weapon):
	if(weapon.instant_kill):
		die()
	else:
		$Hurt.play()
		velocity += weapon.force
		print(weapon.global_position.x)
		print(global_position.x)
		print_debug(global_position.x - weapon.global_position.x)
	
	
func die():
	$Die.play()
	position = starting_position
	velocity = Vector2.ZERO
	$HealthComponent.reset()


func _on_timer_timeout():
	$BulletEmmiter.fire_bullet_with_force((get_global_mouse_position()-position).normalized() * FIRE_VELOCITY)

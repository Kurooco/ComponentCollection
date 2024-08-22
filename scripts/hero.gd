extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if(!$Walk.playing):
			$Walk.play()
		velocity.x += direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	
	velocity.x *= .92
	move_and_slide()


func _on_health_component_died():
	hide()
	$Die.play()


func _on_hurt_box_hit(name, damage, force, weapon_position):
	$Hurt.play()
	velocity.x += force * (position.x - weapon_position.x)
	
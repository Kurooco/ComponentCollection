extends Node2D

@export var particles : Node 
@export var disable_collision : Array[Node]
@export var sprite_to_hide : Node
@export var time_until_death = 1.0

signal has_died

# Called when the node enters the scene tree for the first time.
func _ready():
	if(time_until_death > 0):
		$Timer.set("wait_time", time_until_death)
		$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	die()


func die():
	$Timer.stop()
	emit_signal("has_died")
	if(particles != null):
		particles.emitting = true
	if(!disable_collision.is_empty()):
		for i in disable_collision:
			i.set_deferred("disabled", true)
	if(sprite_to_hide != null):
		sprite_to_hide.hide()
	

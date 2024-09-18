extends Area2D

signal hit(area)
@export var health_component : Node
@export var friendly : bool
@export var collision_shape : Node

func _on_hit(area):
	if(friendly != area.friendly):
		area.successful_hit()
		health_component.take_damage(area.damage);
		emit_signal("hit", area)
		
func disable():
	collision_shape.set_deferred("disabled", true)

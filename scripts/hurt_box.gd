extends Area2D

signal hit(name, damage, force, weapon_position : Vector2)
@export var health_component : Node


func _on_hit(area):
	area.successful_hit()
	health_component.take_damage(area.damage);
	emit_signal("hit", area.name, area.damage, area.force, area.position)

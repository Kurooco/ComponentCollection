extends Area2D

signal hit_landed
@export var damage : int
@export var force : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func successful_hit():
	emit_signal("hit_landed")


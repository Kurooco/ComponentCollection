extends Node2D

signal died
@export var max_health : int
var current_health

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health

func take_damage(amount):
	current_health -= amount
	if(current_health <= 0):
		current_health = 0
		emit_signal("died")
		
func heal(amount):
	current_health = min(current_health+amount, max_health)
	
func reset():
	current_health = max_health

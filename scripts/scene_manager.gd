extends Node

@export var levels : Array[PackedScene]
var current_level

# Called when the node enters the scene tree for the first time.
func _ready():
	set_level(0);
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_level(num):
	var new_level = levels[num].instantiate()
	$"/root/Autoload".main_node = new_level
	if(current_level != null):
		current_level.queue_free()
	current_level = new_level
	add_child(new_level);

extends Node

@export var movement_script: GDScript 

@export var health = 5
@export var walkspeed = 10

var velocity = Vector3.ZERO
var direction = Vector3.BACK

enum STATES {WALKING, TALKING}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func change_states(new_state):
	pass

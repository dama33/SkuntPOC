extends CharacterBody3D

@export var health = 5
@export var walkspeed = 10

var direction = Vector3.BACK
var current_state=STATES.WALKING
var starting_position

enum STATES {WALKING, TALKING}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	starting_position = position
	change_direction()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state == STATES.WALKING:
		position+=direction*walkspeed*delta
		if position.distance_to(starting_position) > 10:
			change_direction()	
	look_at(direction)
	
func choose(array):
	array.shuffle()
	return array.front()	
	
func change_states(new_state):
	pass
	
func change_direction():
	if direction == Vector3.BACK:
		direction = Vector3.FORWARD
	else:
		direction = Vector3.BACK


func _on_interactable_unfocused(interactor):
	print("UNFOCUSED")

func _on_interactable_interacted(interactor):
	print("INTERACTED")

func _on_interactable_focused(interactor):
	print("FOCUSED")

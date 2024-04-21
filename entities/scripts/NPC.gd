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
	current_state = new_state
	
func change_direction():
	direction = -direction


func _on_interactable_unfocused(interactor):
	pass

func _on_interactable_interacted(interactor):
	look_at(Global.player.position)
	change_states(STATES.TALKING)
	Global.player.change_states(Global.player.STATES.TALKING)
	await get_tree().create_timer(3).timeout
	change_states(STATES.WALKING)
	Global.player.change_states(Global.player.STATES.WALKING)

func _on_interactable_focused(interactor):
	pass

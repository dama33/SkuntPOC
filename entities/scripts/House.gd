extends Node3D

@onready var animationPlayer:= $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_focused(_interactor):
	pass # Replace with function body.


func _on_interactable_interacted(_interactor):
	play_door_open()

func _on_interactable_unfocused(_interactor):
	pass # Replace with function body.

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "Door Open"):
		var inside_house = load("res://Inside House.tscn").instantiate()
		get_tree().root.add_child(inside_house)
		var parent = Global.player.get_parent()
		var array = get_tree().root.get_children()
		parent.remove_child(Global.player)
		var tree = get_tree()
		var root = tree.root
		inside_house.add_child(Global.player)
		root.remove_child(parent)
		var arrayAfterRemove = root.get_children()
		var parentHopefullyInsideHouse = Global.player.get_parent()
		Global.player.position = inside_house.find_child("SpawnLocation").global_position

func get_animation_player():
	return animationPlayer
	
func play_door_open():
	animationPlayer.play("Door Open",-1,.4)
	
func play_door_close():
	animationPlayer.play("Door Close",-1,.4)

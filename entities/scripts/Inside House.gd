extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_interacted(interactor):
	var parent = Global.player.get_parent()
	var sample_world = load("res://Sample World.tscn").instantiate()
	get_tree().root.add_child(sample_world)
	var array = get_tree().root.get_children()
	parent.remove_child(Global.player)
	sample_world.add_child(Global.player)
	get_tree().root.remove_child(parent)
	Global.player.position = sample_world.find_child("SpawnLocation").global_position

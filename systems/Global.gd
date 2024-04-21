extends Node

@onready var player = preload("res://systems/player/Player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func register_player(current_player):
	player = current_player

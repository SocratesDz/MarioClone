class_name PlayerState
extends State

onready var constants = preload("res://Constants.gd")

var player: Player

func _ready() -> void:
	yield(owner, "ready")

class_name SmallCoin
extends Node2D

onready var _animationPlayer := $AnimationPlayer

func _ready():
	hit()

func hit():
	_animationPlayer.play("hit")
	yield(_animationPlayer, "animation_finished")
	queue_free()

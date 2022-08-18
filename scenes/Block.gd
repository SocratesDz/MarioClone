class_name Block
extends StaticBody2D

enum Type { BREAKABLE, ITEM }

onready var _animatedSprite := $AnimatedSprite
onready var _animationPlayer := $AnimationPlayer

export(Type) var type setget _set_type

var current_animation = ""

func _set_type(value):
	type = value
	match type:
		Type.BREAKABLE:
			current_animation = "breakable"
		Type.ITEM:
			current_animation = "item"

func _process(delta):
	_animatedSprite.animation = current_animation

func destroy():
	_animationPlayer.play("destroy")
	yield(_animationPlayer, "animation_finished")
	queue_free()

func hit():
	_animationPlayer.play("hit")

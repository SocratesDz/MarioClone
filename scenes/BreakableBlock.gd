class_name BreakableBlock
extends StaticBody2D

onready var animationPlayer := $AnimationPlayer

func hit():
	pass

func destroy():
	animationPlayer.play("destroy")
	yield(animationPlayer, "animation_finished")
	queue_free()
	

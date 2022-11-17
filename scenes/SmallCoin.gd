class_name SmallCoin
extends Node2D

onready var _animationPlayer := $AnimationPlayer
onready var _fx_sounds := $FXSounds

func _ready():
	hit()

func hit():
	_animationPlayer.play("hit")
	_fx_sounds.play_sound(FXSounds.FxSoundId.COIN)
	yield(_animationPlayer, "animation_finished")
	queue_free()

func show_score():
	print("show 100 points")

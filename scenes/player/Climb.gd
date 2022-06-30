class_name Climb
extends PlayerState

func enter(_msg: Dictionary = {}) -> void:
	player.animation_tree.play_duck()

class_name Duck
extends PlayerState

func enter(_msg: Dictionary = {}) -> void:
	player.animation_tree.play_duck()

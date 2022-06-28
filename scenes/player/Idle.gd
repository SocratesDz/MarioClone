class_name Idle
extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity.x = 0

func physics_update(delta: float) -> void:
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		state_machine.transition_to("Walk")

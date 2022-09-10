class_name Idle
extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity.x = 0
	player.animation_tree.play_idle()

func physics_update(_delta: float) -> void:
	player.move_and_slide(Vector2.ZERO, Vector2.UP)
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.transition_to("Walk")
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.transition_to("OnAir", {do_jump = true})

	if not player.is_on_floor():
		state_machine.transition_to("OnAir", {do_jump = false})

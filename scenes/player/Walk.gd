class_name Walk
extends PlayerState

func physics_update(delta: float) -> void:
	player.velocity.y += player.constants.GRAVITY
	
	var motion = Input.get_action_strength("right") - Input.get_action_strength("left")
	var speed_change = motion * player.MAX_WALK_SPEED * player.constants.UNIT_SIZE
	
	player.velocity.x = lerp(player.velocity.x, speed_change, 0.01)
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("OnAir", {do_jump = true})
	if abs(player.velocity.x) < 0.2:
		state_machine.transition_to("Idle")

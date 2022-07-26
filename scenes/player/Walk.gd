class_name Walk
extends PlayerState

func enter(_msg: Dictionary = {}) -> void:
	player.animation_tree.play_walk()

func physics_update(_delta: float) -> void:
	player.velocity.y += player.constants.GRAVITY
	
	var is_running_fire = 2 if Input.is_action_pressed("fire_run") else 1
	var motion = Input.get_action_strength("right") - Input.get_action_strength("left")
	var speed_change = motion * player.MAX_WALK_SPEED * player.constants.UNIT_SIZE * is_running_fire
	
	player.velocity.x = lerp(player.velocity.x, speed_change, 0.1)
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	player.animation_tree.set_direction(motion)
	player.animation_tree.set_walk_speed(abs(clamp(player.velocity.x, -1.0, 1.0)))
	
	if can_skid(motion, player.velocity.x):
		player.animation_tree.play_skid()
	else:
		player.animation_tree.play_walk()
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("OnAir", {do_jump = true})
	if abs(player.velocity.x) < 0.2:
		state_machine.transition_to("Idle")
	if Input.is_action_just_pressed("fire_run"):
#		state_machine.transition_to("Fire")
		pass

func can_skid(motion, velocity_x) -> bool:
	if(is_zero_approx(motion) or is_zero_approx(velocity_x)):
		return false
	return (motion/velocity_x) < 0

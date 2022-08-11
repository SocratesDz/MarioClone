class_name OnAir
extends PlayerState

var max_jump_speed

func enter(msg := {}) -> void:
	max_jump_speed = player.MAX_JUMP_SPEED * player.constants.UNIT_SIZE
	
	if msg.get("do_jump"):
		player.velocity.y = -max_jump_speed
		
	player.animation_tree.play_jump()

func physics_update(_delta: float) -> void:
	var is_running_fire = 2 if Input.is_action_pressed("fire_run") else 1
	var motion = Input.get_action_strength("right") - Input.get_action_strength("left")
	var speed_x_dx = motion * player.MAX_WALK_SPEED * player.constants.UNIT_SIZE * is_running_fire

	player.velocity.y += player.constants.GRAVITY * 1.5

	player.velocity.x = speed_x_dx
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if Input.is_action_just_released("jump") and player.velocity.y < max_jump_speed/2 and is_running_fire < 2:
		player.velocity.y = player.velocity.y/2
	
	if player.is_on_floor():
		if abs(player.velocity.x) > 0.2:
			state_machine.transition_to("Walk")
		else:
			state_machine.transition_to("Idle")

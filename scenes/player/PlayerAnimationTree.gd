class_name PlayerAnimationTree
extends AnimationTree

onready var state_machine_playback = get("parameters/playback")
onready var powerup_transition_tween = $PowerupTransitionTween

var direction: int = 1
var powerup_status: float = -1.0
var walk_speed: float = 1.0 setget set_walk_speed

func play_idle():
	set("parameters/Idle/Idle Blend/blend_amount", powerup_status)
	state_machine_playback.travel("Idle")

func play_jump():
	set("parameters/Jump/Jump Blend/blend_amount", powerup_status)
	state_machine_playback.travel("Jump")

func play_climb():
	set("parameters/Climb/Climb Blend/blend_amount", powerup_status)
	state_machine_playback.travel("Climb")

func play_walk():
	set("parameters/Walk/Walk Blend/blend_amount", powerup_status)
	state_machine_playback.travel("Walk")

func play_duck():
	set("parameters/Duck/Duck Blend/blend_amount", powerup_status)
	state_machine_playback.travel("Duck")

func play_skid():
	set("parameters/Skid/Skid Blend/blend_amount", powerup_status)
	state_machine_playback.travel("Skid")

func play_powerup_transition(powerup: float) -> void:
	# set powerup status to a value in-between
	if powerup_status > powerup:
		powerup_status -= 0.5
	elif powerup_status < powerup:
		powerup_status += 0.5
	else:
		return
	set_powerup_status()
	yield(get_tree().create_timer(0.5), "timeout")
	powerup_status = powerup
	set_powerup_status()

func set_walk_speed(speed: float):
	walk_speed = speed
	set("parameters/Walk/walk_speed/scale", walk_speed)

func set_powerup_status():
	# idle
	set("parameters/Idle/Idle Blend/blend_amount", powerup_status)
	# jump
	set("parameters/Jump/Jump Blend/blend_amount", powerup_status)
	# climb
	set("parameters/Climb/Climb Blend/blend_amount", powerup_status)
	# walk
	set("parameters/Walk/Walk Blend/blend_amount", powerup_status)
	# duck
	set("parameters/Duck/Duck Blend/blend_amount", powerup_status)
	# skid
	set("parameters/Skid/Skid Blend/blend_amount", powerup_status)

func set_direction(motion: float):
	if(int(motion) > 0 or int(motion) < 0):
		direction = motion

	# idle
	set("parameters/Idle/small_idle/blend_position", direction)
	set("parameters/Idle/big_idle/blend_position", direction)
	set("parameters/Idle/fire_idle/blend_position", direction)

	# jump
	set("parameters/Jump/small_jump/blend_position", direction)
	set("parameters/Jump/big_jump/blend_position", direction)
	set("parameters/Jump/fire_jump/blend_position", direction)

	# climb
	set("parameters/Climb/small_climb/blend_position", direction)
	set("parameters/Climb/big_climb/blend_position", direction)
	set("parameters/Climb/fire_climb/blend_position", direction)

	# walk
	set("parameters/Walk/small_walk/blend_position", direction)
	set("parameters/Walk/big_walk/blend_position", direction)
	set("parameters/Walk/fire_walk/blend_position", direction)

	# duck
	set("parameters/Duck/small_duck/blend_position", direction)
	set("parameters/Duck/big_duck/blend_position", direction)
	set("parameters/Duck/fire_duck/blend_position", direction)

	# skid
	set("parameters/Skid/small_skid/blend_position", direction)
	set("parameters/Skid/big_skid/blend_position", direction)
	set("parameters/Skid/fire_skid/blend_position", direction)

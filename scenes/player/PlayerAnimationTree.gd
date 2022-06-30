class_name PlayerAnimationTree
extends AnimationTree

onready var state_machine_playback = get("parameters/playback")

var direction = 1

func play_idle():
	set("parameters/Idle/Idle Blend/blend_amount", -1)
	state_machine_playback.travel("Idle")

func play_jump():
	set("parameters/Jump/Jump Blend/blend_amount", -1)
	state_machine_playback.travel("Jump")

func play_climb():
	set("parameters/Climb/Climb Blend/blend_amount", -1)
	state_machine_playback.travel("Climb")

func play_walk():
	set("parameters/Walk/Walk Blend/blend_amount", -1)
	state_machine_playback.travel("Walk")

func play_duck():
	set("parameters/Duck/Duck Blend/blend_amount", -1)
	state_machine_playback.travel("Duck")

func play_skid():
	set("parameters/Skid/Skid Blend/blend_amount", -1)
	state_machine_playback.travel("Skid")

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

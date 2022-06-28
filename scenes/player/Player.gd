class_name Player
extends KinematicBody2D

const MAX_WALK_SPEED := 4
const MAX_JUMP_SPEED := 30

onready var constants = preload("res://Constants.gd")
#onready var animation_tree = $AnimationTree
#
#var animation_state_machine_playback: AnimationNodeStateMachinePlayback
#
var facing_right := true
var input_direction := Vector2.ZERO
var velocity := Vector2.ZERO



#var is_ducking := false
#var is_running := false
#var jump_force := 0.0

func _ready():
#	animation_state_machine_playback = animation_tree["parameters/playback"]
#	var animation_state_machine = animation_tree.tree_root
#	animation_state_machine_playback.start(animation_state_machine.get_start_node())
	pass

func _physics_process(delta: float) -> void:
	#_process_input(delta)
	#_process_movement(delta)
	_process_animations()

func _process_input(delta: float) -> void:
	#input_direction = Vector2.ZERO
	walk()
	if Input.is_action_pressed("left"): move_left()
	if Input.is_action_pressed("right"): move_right()
	if Input.is_action_pressed("jump"): jump(delta)
	if Input.is_action_just_released("jump"): release_jump_force()
	if Input.is_action_pressed("down"): duck(true)
	if Input.is_action_just_released("down"): duck(false)
	if Input.is_action_pressed("fire_run"): run(true)
	if Input.is_action_just_released("fire_run"): run(false)

func _process_movement(delta: float) -> void:
#	var max_speed = MAX_RUNNING_SPEED if is_running else MAX_WALK_SPEED
#	var jump_speed = MAX_JUMP_SPEED if is_running else MIN_JUMP_SPEED
#
#	var horizontal_movement = input_direction.x * constants.UNIT_SIZE * max_speed
#
#	var friction = delta * (MAX_WALK_SPEED if is_running else MAX_RUNNING_SPEED)
#
#	var _jump_force = jump_force * MIN_JUMP_SPEED
#	_jump_force = clamp(_jump_force, MIN_JUMP_SPEED, MAX_JUMP_SPEED)
#
#	velocity.x = lerp(velocity.x, horizontal_movement, friction)
#	velocity.y += (input_direction.y * _jump_force * constants.GRAVITY) + constants.GRAVITY
#	velocity = move_and_slide(velocity, Vector2.UP)
	var motion = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_direction.x = motion
	if Input.is_action_pressed("jump"):
		input_direction.y = 1000

	velocity.x = lerp(velocity.x, input_direction.x * MAX_WALK_SPEED * 16, delta * MAX_WALK_SPEED)
	velocity = move_and_slide(velocity, Vector2.UP)
	
	pass
	
func _process_animations() -> void:
	# handle animation states
#	var current_animation = "small_idle"
#	if !is_on_floor():
#		current_animation = "small_jump"
#	elif round(velocity.length()) > 0:
#		current_animation = "small_walk"
#	animation_state_machine_playback.travel(current_animation)
	pass

func walk() -> void:
	input_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")

func move_left() -> void:
#	input_direction.x = -1
	pass

func move_right() -> void:
#	input_direction.x = 1
	pass

func jump(delta: float) -> void:
#	if is_on_floor():
#		input_direction.y = -1
#	jump_force += 1
	pass

func duck(should_duck: bool) -> void:
#	if should_duck and is_on_floor():
#		is_ducking = true
#	else:
#		is_ducking = false
	pass

func run(should_run: bool) -> void:
#	is_running = should_run
	pass

func release_jump_force():
#	jump_force = 0
	pass

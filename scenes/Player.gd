extends KinematicBody2D

const MAX_WALK_SPEED := 4
const MAX_RUNNING_SPEED := 8

const MIN_JUMP_SPEED := 20
const MAX_JUMP_SPEED := 30

onready var constants = preload("res://Constants.gd")

var input_direction := Vector2.ZERO
var velocity := Vector2.ZERO

var is_ducking := false
var is_running := false
var jump_force := 0.0

func _physics_process(delta: float) -> void:
	_process_input(delta)
	_process_movement(delta)
	_process_animations()

func _process_input(delta: float) -> void:
	input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("left"): move_left()
	if Input.is_action_pressed("right"): move_right()
	if Input.is_action_just_pressed("jump"): jump(delta)
	#if Input.is_action_just_released("jump"): release_jump_force()
	if Input.is_action_pressed("down"): duck(true)
	if Input.is_action_just_released("down"): duck(false)
	if Input.is_action_pressed("fire_run"): run(true)
	if Input.is_action_just_released("fire_run"): run(false)

func _process_movement(delta: float) -> void:
	var max_speed = MAX_RUNNING_SPEED if is_running else MAX_WALK_SPEED
	var jump_speed = MAX_JUMP_SPEED if is_running else MIN_JUMP_SPEED
	
	var horizontal_movement = input_direction.x * constants.UNIT_SIZE * max_speed
	
	var friction = delta * (MAX_WALK_SPEED if is_running else MAX_RUNNING_SPEED)
	
	velocity.x = lerp(velocity.x, horizontal_movement, friction)
	velocity.y += (input_direction.y * jump_speed * constants.GRAVITY) + constants.GRAVITY
	velocity = move_and_slide(velocity)
	
func _process_animations() -> void:
	# handle animation states
	pass

func move_left() -> void:
	input_direction.x = -1

func move_right() -> void:
	input_direction.x = 1

func jump(delta: float) -> void:
	input_direction.y = -1
	jump_force += delta

func duck(should_duck: bool) -> void:
	if should_duck and is_on_floor():
		is_ducking = true
	else:
		is_ducking = false

func run(should_run: bool) -> void:
	is_running = should_run

func release_jump_force():
	jump_force = 0

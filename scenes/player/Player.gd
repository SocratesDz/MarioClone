class_name Player
extends KinematicBody2D

const MAX_WALK_SPEED := 4
const MAX_JUMP_SPEED := 24

enum PowerUp { NONE = -1, SUPER = 0, FIRE = 1 }

export (NodePath) var left_limit
export (NodePath) var top_limit
export (NodePath) var bottom_limit
export (NodePath) var right_limit

onready var constants = preload("res://Constants.gd")
onready var animation_tree: PlayerAnimationTree = $PlayerAnimationTree
onready var camera: Camera2D = $Camera2D

var facing_right := true
var velocity := Vector2.ZERO

var power_up = PowerUp.NONE

func _ready():
	var positions = {
		"left": get_node(left_limit) as Position2D,
		"top": get_node(top_limit) as Position2D,
		"right": get_node(right_limit) as Position2D,
		"bottom": get_node(bottom_limit) as Position2D
	}
	if(left_limit and top_limit 
	and bottom_limit and right_limit):
		camera.limit_top = positions.top.position.y
		camera.limit_left = positions.left.position.x
		camera.limit_bottom = positions.bottom.position.y
		camera.limit_right = positions.right.position.x
		print("camera limits set")

func _physics_process(delta):
	_handle_hits()

func powerup(power_up) -> void:
	self.power_up = power_up
	animation_tree.play_powerup_transition(float(self.power_up))
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Q:
			animation_tree.play_powerup_transition(float(PowerUp.NONE))

func _block_collision(block):
	if block is Block:
		if block.type == Block.Type.BREAKABLE:
			if power_up != PowerUp.NONE:
				block.destroy()
			else:
				block.hit()
		if block.type == Block.Type.ITEM:
			block.hit()

func _handle_hits():
	var collision = get_last_slide_collision()
	if collision and collision.normal == Vector2.DOWN:
		_block_collision(collision.collider)

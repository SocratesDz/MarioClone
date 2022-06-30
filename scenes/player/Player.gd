class_name Player
extends KinematicBody2D

const MAX_WALK_SPEED := 4
const MAX_JUMP_SPEED := 24

onready var constants = preload("res://Constants.gd")
onready var animation_tree: PlayerAnimationTree = $PlayerAnimationTree

var facing_right := true
var velocity := Vector2.ZERO

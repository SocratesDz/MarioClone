class_name Enemy
extends KinematicBody2D

export(int) var speed_x = -32
export(float) var gravity = 98

var velocity = Vector2.ZERO

onready var animated_sprite = $AnimatedSprite

var is_dead = false

func _physics_process(delta):
	if is_dead:
		speed_x = 0
	velocity = move_and_slide(Vector2(speed_x, gravity), Vector2.UP)
	var collision = get_last_slide_collision()
	if(collision and is_on_wall()):
		speed_x *= -1

func hit():
	animated_sprite.animation = "stomped"
	is_dead = true

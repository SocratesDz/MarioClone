class_name Mushroom
extends KinematicBody2D

onready var timer = $ActiveTimer
onready var collision_shape = $CollisionShape2D

export(bool) var active = false

var speedx := 32.0
var gravity := 98.0

func _physics_process(_delta: float) -> void:
	collision_shape.disabled = not active
	if active:
		move_and_slide(Vector2(speedx, gravity), Vector2.UP)
		if timer.is_stopped():
			var collision = get_last_slide_collision()
			if collision:
				if collision.collider.is_in_group("player"):
					var player = collision.collider
					player.powerup(PowerUpNS.PowerUp.SUPER)
					queue_free()
				elif is_on_wall():
					speedx *= -1

func _on_ActiveTimer_timeout():
	timer.stop()

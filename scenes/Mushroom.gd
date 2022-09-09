class_name Mushroom
extends KinematicBody2D

onready var timer = $ActiveTimer

func _physics_process(_delta: float) -> void:
	move_and_slide(Vector2.ZERO)
	if timer.is_stopped():
		var collision = get_last_slide_collision()
		if collision and collision.collider is Player:
			var player = collision.collider as Player
			player.powerup(PowerUpNS.PowerUp.SUPER)
			timer.start()

func _on_ActiveTimer_timeout():
	timer.stop()

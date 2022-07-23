extends StaticBody2D

onready var raycast = $RayCast2D
onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	if raycast.is_colliding() and raycast.get_collider() is Player:
			raycast.enabled = false
			animation_player.play("Hit")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Hit":
		raycast.enabled = true

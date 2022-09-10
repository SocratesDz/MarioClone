tool
class_name Block
extends StaticBody2D

enum Type { BREAKABLE, ITEM }

export(bool) var is_invisible_block = false

onready var _animated_sprite := $AnimatedSprite
onready var _animation_player := $AnimationPlayer
onready var _collision_shape := $CollisionShape2D
onready var _item_positon := $ItemPosition

onready var _small_coin_scene := preload("res://scenes/SmallCoin.tscn")
onready var _mushroom_scene := preload("res://scenes/Mushroom.tscn")

export(Type) var type setget _set_type
export(int) var coin_amount = 0
export(PowerUpNS.PowerUp) var power_up = PowerUpNS.PowerUp.NONE

var current_animation = ""

var is_used = false

func _ready():
	_animated_sprite.animation = current_animation
	set_block_as_invisible(is_invisible_block)

func _set_type(value):
	type = value
	match type:
		Type.BREAKABLE:
			current_animation = "breakable"
		Type.ITEM:
			current_animation = "item"

func disable_collisions():
	_collision_shape.set_deferred("disabled", true)

func destroy():
	_animation_player.play("destroy")
	yield(_animation_player, "animation_finished")
	queue_free()

func hit():
	if not is_used:
		set_block_as_invisible(false)
		_animation_player.play("hit")
		if power_up == PowerUpNS.PowerUp.NONE and coin_amount > 0:
			var coin = _small_coin_scene.instance()
			coin.position = _item_positon.position
			add_child(coin)
		elif power_up == PowerUpNS.PowerUp.SUPER:
			# Instance item
			var mushroom = _mushroom_scene.instance()
			add_child(mushroom)
			mushroom.z_as_relative = true
			mushroom.z_index = -1
			set_as_used()
			# Animate item
			var tween = get_tree().create_tween()
			tween.tween_property(mushroom, "position", _item_positon.position, 1).set_trans(Tween.TRANS_LINEAR)
			yield(tween, "finished")
			mushroom.active = true
	
func set_block_as_invisible(value: bool) -> void:
	is_invisible_block = value
	_animated_sprite.visible = not is_invisible_block
	_collision_shape.one_way_collision = is_invisible_block
	_collision_shape.rotation_degrees = 0 if not is_invisible_block else 180

func set_as_used():
	is_used = true
	current_animation = "used"
	_animation_player.play("used")
	

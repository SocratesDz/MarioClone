tool
class_name Block
extends StaticBody2D

enum Type { BREAKABLE, ITEM }

export(bool) var is_invisible_block = false

onready var _animated_sprite := $AnimatedSprite
onready var _animation_player := $AnimationPlayer
onready var _collision_shape := $CollisionShape2D
onready var _small_coin_scene := preload("res://scenes/SmallCoin.tscn")

export(Type) var type setget _set_type

var current_animation = ""

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
	set_block_as_invisible(false)
	_animation_player.play("hit")
	var coin = _small_coin_scene.instance()
	coin.position.y = -16
	add_child(coin)
	

func set_block_as_invisible(value: bool) -> void:
	is_invisible_block = value
	_animated_sprite.visible = not is_invisible_block
	_collision_shape.one_way_collision = is_invisible_block
	_collision_shape.rotation_degrees = 0 if not is_invisible_block else 180

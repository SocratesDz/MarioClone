class_name FXSounds
extends Node2D

enum FxSoundId {
	JUMP,
	COIN,
	POWERUP
}

# Music
onready var jump_fx = $Jump
onready var coin_fx = $Coin
onready var powerup_fx = $Powerup

onready var _sound_players = {
	FxSoundId.JUMP: jump_fx,
	FxSoundId.COIN: coin_fx,
	FxSoundId.POWERUP: powerup_fx
}

# This function accepts a FxSoundId enum value.
func play_sound(id):
	var stream: AudioStreamPlayer2D = _sound_players[id]
	stream.play()

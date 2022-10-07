extends Node

# Fx
onready var jump_fx = $FX/Jump
onready var coin_fx = $FX/Coin
onready var powerup_fx = $FX/Powerup

# Music
onready var die_music = $Music/Die
onready var game_over_music = $Music/GameOver 

func play_jump_fx():
	 jump_fx.play()

extends Node

enum MusicId {
	DIE,
	GAME_OVER,
	OVERWORLD,
	PAUSE,
	STAR,
	UNDERWORLD,
	WIN,
	CASTLE
}

# Music
onready var die_music = $Die
onready var game_over_music = $GameOver
onready var overworld_music = $Overworld
onready var pause_music = $Pause
onready var star_music = $Star
onready var underworld_music = $Underworld
onready var win_music = $Win
onready var castle_music = $Castle

onready var _music_players = {
	MusicId.DIE: die_music,
	MusicId.GAME_OVER: game_over_music,
	MusicId.OVERWORLD: overworld_music,
	MusicId.PAUSE: pause_music,
	MusicId.STAR: star_music,
	MusicId.UNDERWORLD: underworld_music,
	MusicId.WIN: win_music,
	MusicId.CASTLE: castle_music
}

var _current_player: AudioStreamPlayer = null

func play_music(music_id):
	if _current_player: _current_player.stop()
	var player: AudioStreamPlayer = _music_players[music_id]
	_current_player = player
	_current_player.play()

func stop_music():
	_current_player.stop()

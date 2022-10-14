extends Control

func _on_GameOverBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.GAME_OVER)


func _on_DieBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.DIE)


func _on_OverworldBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.OVERWORLD)


func _on_PauseBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.PAUSE)


func _on_StarBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.STAR)


func _on_UnderworldBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.UNDERWORLD)


func _on_WinBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.WIN)


func _on_CastleBtn_pressed():
	MusicSystem.play_music(MusicSystem.MusicId.CASTLE)

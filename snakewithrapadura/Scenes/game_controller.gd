extends Node

func get_music_time():
	return $AudioStreamPlayer.get_playback_position()

func get_music_length():
	return $AudioStreamPlayer.stream.get_length()
	

extends Node

var music_position=0
var music=preload("res://sound/MusicaPrincipal.mp3")
var inverted_music=preload("res://sound/MusicaPrincipal.mp3")
var inverted=false
func get_music_time():
	return $AudioStreamPlayer.get_playback_position()

func get_music_length():
	return $AudioStreamPlayer.stream.get_length()
	
func pause_music():
	music_position=$AudioStreamPlayer.get_playback_position()
	$AudioStreamPlayer.stop()
	
func invert_music():
	$AudioStreamPlayer.stream=inverted_music
	$AudioStreamPlayer.play(inverted_music.get_length()-music_position)
	inverted=true
	get_parent().get_parent().material.set_shader_parameter("on",1)

func _on_audio_stream_player_finished() -> void:
	if inverted:
		$"../Revive".queue_free()
		get_parent().get_parent().material.set_shader_parameter("on",0)

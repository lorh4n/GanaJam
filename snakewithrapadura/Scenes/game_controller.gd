extends Node

var music_position=0
var music=preload("res://sound/MusicaPrincipal.mp3")
var inverted_music=preload("res://sound/MusicaPrincipal_Invertido.mp3")
var revive_music=preload("res://sound/RefraoInicio.mp3")
var inverted=false
var reviving=false
func get_music_time():
	if not inverted:
		return $AudioStreamPlayer.get_playback_position()
	else:
		return $AudioStreamPlayer.stream.get_length()-$AudioStreamPlayer.get_playback_position()

func get_music_length():
	return $AudioStreamPlayer.stream.get_length()
	
func pause_music():
	music_position=$AudioStreamPlayer.get_playback_position()
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream=revive_music
	$AudioStreamPlayer.play()
	reviving=true
	$"../AnimationPlayer".stop()
	for i in $"../Spawner".get_children():
		i.queue_free()
	
func invert_music():
	reviving=false
	$AudioStreamPlayer.stream=inverted_music
	$AudioStreamPlayer.play(inverted_music.get_length()-music_position)
	inverted=true
	get_parent().get_parent().material.set_shader_parameter("on",1)
	

func revert_music():
	$AudioStreamPlayer.stream=music
	$AudioStreamPlayer.play()
	inverted=false
	$"../AnimationPlayer".stop()

func _on_audio_stream_player_finished() -> void:
	if inverted:
		$"../Revive".queue_free()
		get_parent().get_parent().material.set_shader_parameter("on",0)
		#spawn snake, restart animation player
		$"../Player".visible=true
		$"../Player".disabled=false
		revert_music()
	elif not reviving:
		get_tree().change_scene_to_file("res://Scenes/ganhou.tscn")

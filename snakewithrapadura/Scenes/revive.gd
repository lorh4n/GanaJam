extends Node2D
@export var game_controller:Node
func _ready():
	GodRevive()

func GodRevive(): 
	$AnimationPlayer.play("GodRevive")
	game_controller.pause_music()

func _on_button_reset_pressed() -> void:
	$ButtonReset.visible=false
	game_controller.invert_music()
	

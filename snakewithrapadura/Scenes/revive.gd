extends Node2D

func _ready():
	GodRevive()

func GodRevive(): 
	$AnimationPlayer.play("GodRevive")

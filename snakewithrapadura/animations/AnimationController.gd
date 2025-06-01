extends Node


func _ready():
	print("Hello")
	God_hide()

func God_show(): 
	$AnimationGod.play("Camisa_show")

func God_hide(): 
	$AnimationGod.play("God_hide")
	print("chamou")

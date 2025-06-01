extends Button

var scene = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	pass

func nextSlide():
	scene = scene + 1
	if scene == 1:
		$"../AnimationPlayer".play("HistorySlide2")
	if scene == 2:
		$"../AnimationPlayer".play("Slide3")
	if scene == 3:
		get_tree().change_scene_to_file("res://Scenes/NormalGame.tscn")
		

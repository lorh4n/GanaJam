extends Node

const BATERA = preload("res://Scenes/batera.tscn")
const CAPIVARA = preload("res://Scenes/Capivara.tscn")

var positions = [
	Vector2(1152, 500),
	Vector2(1152, 300),
	Vector2(1152, 200)
]

var scenes = {
	"batera": BATERA,
	"capivara": CAPIVARA
}

func spawnar(object_name: String, skip_position: int) -> void:
	print("hello")
	if skip_position < 1 or skip_position > 3:
		return
	
	var scene = scenes.get(object_name.to_lower())
	if not scene:
		return
	
	for i in range(3):
		if i + 1 != skip_position:
			var new_node = scene.instantiate()
			new_node.position = positions[i]
			print("filho")
			add_child(new_node)

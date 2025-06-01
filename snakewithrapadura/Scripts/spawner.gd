extends Node

enum ObjectType {
	tipo1,
}

const NODE_A = preload("res://animations/objetos/test.tscn")

var positions = [
	Vector2(0, 0),
	Vector2(100, 200),
	Vector2(300, 400)
]

func spawnar(object_type_str: String, skip_position: int) -> void:
	if skip_position < 1 or skip_position > 3:
		return

	# Converte a string para o valor do enum
	var object_type: ObjectType
	match object_type_str.to_upper():
		"TIPO1":
			object_type = ObjectType.tipo1
		_:
			print("Tipo inválido: ", object_type_str)
			return

	# Seleciona a cena com base no tipo
	var node_scene
	match object_type:
		ObjectType.tipo1:
			node_scene = NODE_A
		_:
			return

	# Instancia os nós nas posições
	for i in [0, 1, 2]:
		if i + 1 != skip_position:
			var new_node = node_scene.instantiate()
			new_node.position = positions[i]
			add_child(new_node)

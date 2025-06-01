extends Node

func _ready():
	$"../AnimationPlayer".play("Spawnar")

const batera = preload("res://Scenes/Object/batera.tscn")
const gamuto = preload("res://Scenes/Object/gamuto.tscn")
const capivara = preload("res://Scenes/Object/Capivara.tscn")
const mistura = preload("res://Scenes/Object/mistura.tscn")
const brasil = preload("res://Scenes/Object/brasil.tscn")
const guitarra = preload("res://Scenes/Object/Guitarra.tscn")
const pao = preload("res://Scenes/Object/pao_mortadela.tscn")
const rede = preload("res://Scenes/Object/rede.tscn")
const sakura = preload("res://Scenes/Object/sakura.tscn")
const saque = preload("res://Scenes/Object/Saque.tscn")
const shibainu = preload("res://Scenes/Object/shibainu.tscn")
const violao = preload("res://Scenes/Object/violao.tscn")
const zabumba = preload("res://Scenes/Object/zabumba.tscn")



var positions = [
	Vector2(960, 360),
	Vector2(960, 420),
	Vector2(960, 480)
]

var scenes = {
	"batera" : batera,
	"gamuto" : gamuto,
	"capivara" : capivara,
	"mistura" : mistura,
	"brasil" : brasil,
	"guitarra" : guitarra,
	"pao" : pao,
	"rede" : rede,
	"sakura" : sakura,
	"saque" : saque,
	"shibainu" : shibainu,
	"violao" : violao,
	"zabumba" : zabumba
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

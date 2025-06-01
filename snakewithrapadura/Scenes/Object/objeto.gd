extends StaticBody2D


const SPEED = 100.0
var direction = 1

func _physics_process(delta: float) -> void:
	position.x -= direction * SPEED * delta

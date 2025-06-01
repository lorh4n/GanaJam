extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const MIN_LIMIT=Vector2(0,370)
const MAX_LIMIT=Vector2(960,515)
var disabled=false
@onready var revive=preload("res://Scenes/Revive.tscn")
func _ready():
	$AnimationPlayer.play("Andar_da_Cobra")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	if not disabled:
	# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		var directionUp := Input.get_axis("ui_up", "ui_down")
		if directionUp:
			velocity.y = directionUp * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED) 

		move_and_slide()
		position=position.max(MIN_LIMIT).min(MAX_LIMIT)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Objeto"):
		$".".set_visible(false)
		var cena = revive.instantiate()
		
		cena.game_controller=$"../GameController"
		get_parent().add_child(cena)
		

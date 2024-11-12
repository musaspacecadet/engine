# walk.gd
class_name Crouchwalk
extends State

@export var speed: float = 300.0
@export var animation : AnimatedSprite2D
@export var animation_name : String = "crouch_walk"

func enter_state() -> void:
	player.crouched = true
	animation.play(animation_name)

func process_state(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		player.velocity.x = speed
		animation.scale.x = 1
	elif Input.is_action_pressed("move_left"):
		player.velocity.x = -speed
		animation.scale.x = -1
	else:
		player.state_machine.change_state("Crouch")
		
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.state_machine.change_state("Jump")
	elif !player.is_on_floor():
		player.state_machine.change_state("Fall")

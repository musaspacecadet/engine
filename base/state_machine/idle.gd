class_name Idle
extends State

@export var animation : AnimatedSprite2D
@export var animation_name : String = "idle"
   
func enter_state() -> void:
	player.velocity.x = 0
	animation.play(animation_name)

func process_state(delta: float) -> void:
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		player.state_machine.change_state("Walk")
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.state_machine.change_state("Jump")
	elif Input.is_action_just_pressed("crouch") and player.is_on_floor():
		player.state_machine.change_state("Crouch")

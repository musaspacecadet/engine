class_name Crouch
extends State

@export var animation : AnimatedSprite2D
@export var animation_name : String = "crouch"

func enter_state() -> void:
	animation.play(animation_name)
	if player.crouched:
		animation.set_frame_and_progress(3,1.0)
		animation.pause()
	else:
		animation.play(animation_name)
		player.crouched = true
	player.velocity.x = 0
	
	


func process_state(delta: float) -> void:
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		player.state_machine.change_state("Crouchwalk")
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.state_machine.change_state("Jump")
	elif Input.is_action_just_pressed("crouch") and player.is_on_floor():
		player.state_machine.change_state("Idle")
	else:
		pass

func exit_state() -> void:
	player.crouched = false

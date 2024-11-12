# fall.gd
class_name Fall
extends State

@export var animation : AnimatedSprite2D
@export var animation_name : String = "fall"
@export var air_control_speed: float = 200.0 # Speed for horizontal control in the air
 
func enter_state() -> void:
	animation.play(animation_name)
	
func process_state(delta: float) -> void:
	if player.is_on_floor():
		player.state_machine.change_state("Idle")
	
	# Handle horizontal movement in the air
	if Input.is_action_pressed("move_left"):
		player.velocity.x = -air_control_speed
		animation.scale.x = -1
	elif Input.is_action_pressed("move_right"):
		player.velocity.x = air_control_speed
		animation.scale.x = 1

class_name Jump
extends State


@export var animation : AnimatedSprite2D
@export var animation_name : String = "jump"

@export var jump_force: float = 400.0
@export var min_jump_force: float = 200.0
@export var gravity_scale: float = 2.5
@export var max_hold_time: float = 0.3
@export var air_control_speed: float = 200.0 # Speed for horizontal control in the air

var jump_timer: float = 0.0
var holding_jump: bool = false

func enter_state() -> void:
	player.velocity.y = -jump_force
	animation.play(animation_name)
	holding_jump = true
	jump_timer = 0.0

func process_state(delta: float) -> void:
	# Handle horizontal movement in the air
	if Input.is_action_pressed("move_left"):
		player.velocity.x = -air_control_speed
		animation.scale.x = -1
	elif Input.is_action_pressed("move_right"):
		player.velocity.x = air_control_speed
		animation.scale.x = 1
 
	# Apply vertical jump force
	jump_timer += delta
	if holding_jump and jump_timer < max_hold_time:
		player.velocity.y = -lerp(jump_force, min_jump_force, jump_timer / max_hold_time)

	# Check if jump button is released
	if not Input.is_action_pressed("jump"):
		holding_jump = false

	# Transition to "Fall" state if moving downward
	if player.velocity.y > 0:
		player.velocity.y += gravity_scale * delta # Apply increased gravity for fall
		player.state_machine.change_state("Fall")

extends CharacterBody2D

@onready var machine = $state_machine
@export  var state_machine : Machine = machine

var crouched : bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

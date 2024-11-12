# state_machine.gd
class_name Machine
extends State

# Dictionary to store each state node by name
var states = {}
@export var initial_state: State = null
var current_state: State = null

# Change the current state
func change_state(new_state_name: String) -> void:
	if current_state:
		current_state.exit_state()
	current_state = states.get(new_state_name)
	current_state.enter_state()
	print("[STATE MACHINE] "+current_state.name,">>"+new_state_name)


func _ready() -> void:
	# Initialize the states dictionary with each child state node
	for state in get_children():
		states[state.name] = state
		state.player = get_parent()  # Reference to the player node
	print(states)
	# Set the initial state to Idle
	change_state("Idle")

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.process_state(delta)

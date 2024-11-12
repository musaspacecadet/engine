class_name State
extends Node

# Reference to the main player node for accessing properties and methods
@export var player: CharacterBody2D

# Function to be overridden by each state
func enter_state() -> void:
	pass

func exit_state() -> void:
	pass

func process_state(delta: float) -> void:
	pass

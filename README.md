# Simple Platformer Character Controller for Godot

This project is a basic character controller for a platformer game in Godot, using a state machine to handle character actions such as **Idle**, **Walk**, **Jump**, **Crouch**, **Fall**, and **CrouchWalk**.

## Features

- **State Machine** for organizing character states
- **Smooth Transitions** between actions
- **Demo**: See the controller in action below!

![Demo of Character Controller](./demo.avi)

## Controls

- **Left/Right**: Move
- **Down**: Crouch
- **Space**: Jump

## States

- **Idle**: Standing still
- **Walk**: Moving horizontally
- **Jump**: Ascending in air
- **Crouch**: Crouching on the ground
- **Fall**: Descending in air
- **CrouchWalk**: Crouch while moving

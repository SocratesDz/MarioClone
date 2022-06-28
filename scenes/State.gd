class_name State
extends Node

var state_machine = null

## Called when entering a transition with a dictionary parameter
func enter(_msg := {}) -> void:
	pass

## Handle _unhandled_input() function
func handle_input(_event: InputEvent) -> void:
	pass

## Handle _process() function
func update(_delta: float) -> void:
	pass

## Handle _physics_process() function
func physics_update(_delta: float) -> void:
	pass

## Called before exiting the state
func exit() -> void:
	pass

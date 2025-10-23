extends "res://addons/character_controller/character.gd"


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event is InputEventJoypadButton:
		crouch_mode = 1
		sprint_mode = 1
	if event is InputEventKey:
		crouch_mode = 0
		sprint_mode = 0

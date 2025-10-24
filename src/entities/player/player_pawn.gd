extends "res://addons/character_controller/character.gd"


func _ready():
	super()
	Interactive3D.interact_focused_global.connect(_on_interactive_focused)
	Interactive3D.interact_blured_global.connect(_on_interactive_blured)


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

	if event.is_action_pressed("activate"):
		%InteractRayCast3D.interact()


func _on_interactive_focused(_target: Interactive3D) -> void:
	RETICLE.dot_size = 2.0


func _on_interactive_blured(_target: Interactive3D) -> void:
	RETICLE.dot_size = 1.0

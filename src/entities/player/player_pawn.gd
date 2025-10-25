extends "res://addons/character_controller/character.gd"

@onready var STAMINA_BAR: Range = %StaminaBar

var stamina_max := 3.0
var stamina_timer := 0.0
var stamina := stamina_max


func _ready():
	super()
	Interactive3D.interact_focused_global.connect(_on_interactive_focused)
	Interactive3D.interact_blured_global.connect(_on_interactive_blured)
	STAMINA_BAR.max_value = stamina_max
	STAMINA_BAR.value = stamina


func _notification(what: int) -> void:
	if what == NOTIFICATION_PAUSED:
		STAMINA_BAR.visible = false


func _physics_process(delta: float) -> void:
	super(delta)

	if stamina_timer > 0.0:
		stamina_timer -= delta

	if state == "sprinting":
		stamina = max(0, stamina - delta)
		stamina_timer = 1.5
	elif stamina_timer <= 0.0:
		if state == "normal" and moving:
			stamina = min(stamina_max, stamina + delta * 0.5)
		else:
			stamina = min(stamina_max, stamina + delta)

	can_sprint = stamina > 0

	STAMINA_BAR.visible = stamina < stamina_max
	STAMINA_BAR.max_value = stamina_max
	STAMINA_BAR.value = stamina


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

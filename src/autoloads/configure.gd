extends Node

var previous_mouse_mode: Input.MouseMode


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	DialogueManager.process_mode = Node.PROCESS_MODE_ALWAYS
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)


func _on_dialogue_started(_res: DialogueResource) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true


func _on_dialogue_ended(_res: DialogueResource) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false

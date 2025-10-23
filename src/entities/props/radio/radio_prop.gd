extends Interactive3D

@export var dialogue_source: DialogueResource


func _on_interacted() -> void:
	if dialogue_source != null:
		DialogueManager.show_dialogue_balloon(dialogue_source, "start")

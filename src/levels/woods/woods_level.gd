extends "res://levels/base_level.gd"


func _ready() -> void:
	Fade.fade_out.call_deferred(0.0001)
	#DialogueManager.show_dialogue_balloon(dialogue)
	#await DialogueManager.dialogue_ended
	Fade.fade_in.call_deferred(1.0)

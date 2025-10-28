extends Area3D

@export var dialogue: DialogueResource
@export var trigger_enabled: bool = true
@export var trigger_once: bool = true

@export_node_path("Node3D") var look_at_node: NodePath
@export var look_at_timer: float = 0.5

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	if not trigger_enabled:
		return

	if body.is_in_group("player"):
		if look_at_node and body.has_method("trigger_look_at"):
			body.trigger_look_at(get_node(look_at_node), look_at_timer)
		if dialogue != null:
			DialogueManager.show_dialogue_balloon(dialogue)
			body.velocity.x = 0.0
			body.velocity.z = 0.0
		if trigger_once:
			trigger_enabled = false

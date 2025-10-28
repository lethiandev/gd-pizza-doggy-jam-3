extends Node3D

@export var environment: Environment = preload("uid://dub3md6aqlp3d")


func _enter_tree() -> void:
	if environment != null:
		$WorldEnvironment.environment = environment

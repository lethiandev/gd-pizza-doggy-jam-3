extends RayCast3D
class_name InteractRayCast3D

@export var exceptions: Array[CollisionObject3D] = []

var last_collider: Object
var interactive: Interactive3D


func _ready() -> void:
	for exception_node in exceptions:
		add_exception(exception_node)


func _physics_process(_delta: float) -> void:
	if last_collider == get_collider():
		return

	if last_collider is Interactive3D:
		last_collider.focus_blur()

	interactive = null
	last_collider = get_collider()
	if last_collider is Interactive3D:
		interactive = get_collider()
		last_collider.focus_grab()

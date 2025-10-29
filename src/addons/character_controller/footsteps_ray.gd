extends RayCast3D

@export var foosteps_default := &"default"
@export var footstep_library: Dictionary[StringName, AudioStream]


func _physics_process(delta: float) -> void:
	var library_name: StringName = ""

	if is_colliding():
		var collider: Object = get_collider()
		if collider.has_meta("footsteps"):
			library_name = collider.get_meta("footsteps")

	var stream = footstep_library[foosteps_default]
	if footstep_library.has(library_name):
		stream = footstep_library[library_name]

	if $FootstepsPlayer.stream != stream:
		$FootstepsPlayer.stream = stream

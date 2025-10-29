extends CPUParticles3D


func _ready() -> void:
	finished.connect(queue_free)
	$FlyingParticles.emitting = true
	$FlyingParticles.one_shot = true

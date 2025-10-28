extends Node


func look_at(target: Vector3, timer: float) -> void:
	var player: Node3D = get_parent()
	var player_head: Node3D = player.HEAD

	if player_head == null:
		return

	var from_basis := player_head.global_basis
	var target_basis := Basis.looking_at(target - player_head.global_position)

	var tween = create_tween()
	var interpolate := _interpolate_rotation.bind(player_head, from_basis, target_basis)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CIRC)
	tween.tween_method(interpolate, 0.0, 1.0, timer)


func _interpolate_rotation(weight: float, head: Node3D, from: Basis, to: Basis) -> void:
	head.global_basis = from.slerp(to, weight)

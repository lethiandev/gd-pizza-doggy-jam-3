@tool
extends EditorScenePostImport


func _post_import(scene: Node) -> Object:
	for child in scene.get_children():
		_reset_transform(child)
	return scene


func _reset_transform(node: Node) -> void:
	if node is Node3D:
		node.transform = Transform3D()

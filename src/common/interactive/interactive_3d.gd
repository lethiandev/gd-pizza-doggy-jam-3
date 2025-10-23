extends Area3D
class_name  Interactive3D

signal interact_focused()
signal interact_blured()
signal interacted()

static var interact_focused_global := make_signal(&"interact_focused_global", { "name": "target", "type": TYPE_OBJECT })
static var interact_blured_global := make_signal(&"interact_blured_global", { "name": "target", "type": TYPE_OBJECT })
static var interacted_global := make_signal(&"interact_blured_global", { "name": "target", "type": TYPE_OBJECT })

# Workaround for GDScript not having static signals
static func make_signal(signal_name: StringName, ...args: Array) -> Signal:
	(Interactive3D as Object).add_user_signal(signal_name, args)
	return Signal((Interactive3D as Object), signal_name)

static var focused: Interactive3D = null

@export var interact_once := false


func focus_grab() -> void:
	if focused == self:
		return

	if focused != null:
		focused.focus_blur()

	focused = self
	interact_focused.emit()
	interact_focused_global.emit(self)


func focus_blur() -> void:
	if focused != self:
		return

	focused = null
	interact_blured.emit()
	interact_blured_global.emit(self)


func interact() -> void:
	if interact_once:
		monitorable = false

	interacted.emit()
	interacted_global.emit(self)

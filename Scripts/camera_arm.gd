extends SpringArm3D

@export var mouseSensibility: float = 0.005
@export var minVerticalAngle: float = -PI/2
@export var maxVerticalAngle: float = PI/4

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * mouseSensibility
		rotation.y = wrapf(rotation.y, 0.0, TAU)
		rotation.x -= event.relative.y * mouseSensibility
		rotation.x = clamp(rotation.x, minVerticalAngle, maxVerticalAngle)

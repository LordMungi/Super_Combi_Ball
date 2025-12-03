extends CharacterBody3D


const SPEED = 12.0
const JUMP_STRENGTH = 8
const AIR_RESISTANCE = 0.05

const JUMP_VELOCITY = 4.5

var hasJumped: bool

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).rotated(Vector3.UP, $CameraArm.rotation.y)
	if direction and not hasJumped:
		velocity.x = direction.x *  SPEED
		velocity.z = direction.z * SPEED
		velocity.y = JUMP_STRENGTH
		hasJumped = true
		$Timer.start()
	else:
		velocity.x = move_toward(velocity.x, 0, AIR_RESISTANCE)
		velocity.z = move_toward(velocity.z, 0, AIR_RESISTANCE)
	
	move_and_slide()

func _on_timer_timeout() -> void:
	hasJumped = false

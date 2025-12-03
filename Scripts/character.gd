extends CharacterBody3D

const AIR_RESISTANCE = 3

var power = 600
var jumpStrength = 500
var hasJumped: bool

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = move_toward(velocity.x, 0, AIR_RESISTANCE * delta)
	velocity.z = move_toward(velocity.z, 0, AIR_RESISTANCE * delta)
		
	if not hasJumped:
		var direction
		if Input.is_action_just_pressed("move_forward"):
			direction = Vector3(0, 0, -1).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 600
			jumpStrength = 500
		elif Input.is_action_just_pressed("move_backward"):
			direction = Vector3(0, 0, 1).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 100
			jumpStrength = 100
		elif Input.is_action_just_pressed("move_right"):
			direction = Vector3(1, 0, 0).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 500
			jumpStrength = 200
		elif Input.is_action_just_pressed("move_left"):
			direction = Vector3(-1, 0, 0).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 500
			jumpStrength = 200
		elif Input.is_action_just_pressed("move_up"):
			direction = Vector3(0, 0, -1).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 100
			jumpStrength = 700
		elif Input.is_action_just_pressed("move_down"):
			direction = Vector3(0, 0, -1).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 100
			jumpStrength = -700
		
		if direction:
			velocity.x = direction.x *  power * delta
			velocity.z = direction.z * power * delta
			velocity.y = jumpStrength * delta
			hasJumped = true
			$Timer.start()
		
	move_and_slide()

func _on_timer_timeout() -> void:
	hasJumped = false

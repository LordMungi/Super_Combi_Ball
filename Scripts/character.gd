extends CharacterBody3D

const AIR_RESISTANCE = 3

var spawn : Marker3D
var power = 600
var jumpStrength = 500

var isGravityOn: bool = true
var hasJumped: bool	

var checkPoint : Vector3

func _ready():
	spawn = get_parent().get_node("Level").get_node("SpawnPosition")
	velocity.x = 0
	velocity.y = 0
	velocity.z = 0
	global_position = spawn.global_position
	checkPoint = spawn.global_position

func _physics_process(delta: float) -> void:
	
	if not is_on_floor() and isGravityOn:
		velocity += get_gravity() * delta
		
	velocity.x = move_toward(velocity.x, 0, AIR_RESISTANCE * delta)
	velocity.z = move_toward(velocity.z, 0, AIR_RESISTANCE * delta)
		
	if not hasJumped:
		var direction
		if Input.is_action_just_pressed("move_forward"):
			direction = Vector3(0, 0, -1).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 600
			jumpStrength = 250
		elif Input.is_action_just_pressed("move_backward"):
			direction = Vector3(0, 0, 1).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 100
			jumpStrength = 100
		elif Input.is_action_just_pressed("move_right"):
			direction = Vector3(1, 0, 0).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 400
			jumpStrength = 100
		elif Input.is_action_just_pressed("move_left"):
			direction = Vector3(-1, 0, 0).rotated(Vector3.UP, $CameraArm.rotation.y)
			power = 400
			jumpStrength = 100
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
	
	if Input.is_action_just_pressed("toggle_gravity"):
		isGravityOn = not isGravityOn
		
	$GravShield.visible = not isGravityOn
	if hasJumped:
		$UI/AnimatedSprite2D.animation = "OFF"
	else:
		$UI/AnimatedSprite2D.animation = "ON"
		
	move_and_slide()

func _on_timer_timeout() -> void:
	hasJumped = false

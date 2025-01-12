extends CharacterBody3D

var sensitivity = 0.003
const SPEED = -10.0
const JUMP_VELOCITY = 5
@onready var head = $head
@onready var camera = $head/Camera3D
@onready var leftgun = $"mesh/Guns/leftrailgun"
@onready var rightgun = $"mesh/Guns/rightrailgun"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
		leftgun.rotate_x(-event.relative.y * sensitivity)
		rightgun.rotate_x(-event.relative.y * sensitivity)






func _physics_process(delta: float) -> void:
	position += transform.basis.z * SPEED * delta
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle flight.
	#if Input.is_action_pressed("ui_e"):
		#velocity.y = SPEED
	#elif Input.is_action_pressed("ui_q"):
		#velocity.y = SPEED * -1
	#else:
		#velocity.y = move_toward(velocity.y, 0, SPEED)
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
	#	
	#	velocity.x = direction.x * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	#	velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

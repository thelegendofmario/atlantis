extends CharacterBody3D


const default_speed = 10.0
var SPEED = 10
const JUMP_VELOCITY = 8
var stamina = max_stamina
const max_stamina = 100
var sprinting = false
var sprint_speed = 20
var can_sprint = false
var sensitivity = 0.003
@onready var head = $"okayer model"
@onready var camera = $"okayer model/Camera3D"


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Global.dPlayer_Health = 255


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sensitivity)
		camera.rotate_z(-event.relative.y * sensitivity)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if sprinting:
		SPEED = sprint_speed
	else:
		SPEED = default_speed
	
	if stamina < max_stamina:
		stamina += 1
	
	if stamina == max_stamina:
		can_sprint = true
	elif stamina <= 0:
		can_sprint = false
	
	if Input.is_action_pressed("sprint") and stamina > 0:
		sprinting = true
		stamina -= 2
	else:
		sprinting = false


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		$AnimationPlayer.play()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		$AnimationPlayer.pause()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if Global.dPlayer_Health <= 0:
		get_tree().change_scene_to_file("res://THE_BAD_END.tscn")


	move_and_slide()


func _on_timer_timeout() -> void:
	Global.dPlayer_Health -= 2.55

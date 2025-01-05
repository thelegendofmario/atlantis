extends CharacterBody3D


const SPEED = 10.0
const JUMP_VELOCITY = 10


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("ui_left"):
		self.rotate_y(0.1)
		
	if Input.is_action_pressed("ui_right"):
		self.rotate_y(-0.1)
	
	var input_dir := Input.get_vector("", "", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		$AnimationPlayer.play()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		$AnimationPlayer.pause()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if Global.player_health <= 0:
		get_tree().change_scene_to_file("res://THE_BAD_END.tscn")
	


	move_and_slide()

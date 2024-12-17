extends CharacterBody2D

const DEFAULT_STAMINA = 100.0
var stamina = DEFAULT_STAMINA
const DEFAULT_SPEED = 100.0
const JUMP_VELOCITY = -350.0
const WATER_JUMP_VELOCITY = JUMP_VELOCITY*10
var SPEED
var force = 3000
var defAir = 1000
@export_range(1,12) var anim_speed = 5

func _ready() -> void:
	$AnimationPlayer.speed_scale = anim_speed

func _physics_process(delta: float) -> void:
	
	#air -= 1
	# Add the gravity.
	if move_and_slide():
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -force)
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and Global.player_in_water:
		velocity.y = WATER_JUMP_VELOCITY

	if Input.is_action_pressed("sprint"):
		SPEED = SPEED*1.5
		stamina -= 1
	else:
		stamina += 1
		SPEED = DEFAULT_SPEED
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		$AnimationPlayer.play()
		velocity.x = direction * SPEED
	else:
		$AnimationPlayer.pause()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

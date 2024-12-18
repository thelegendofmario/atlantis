extends CharacterBody2D

const DEFAULT_STAMINA = 100.0
const DEFAULT_HEALTH = 100.0
var stamina = 0
const DEFAULT_SPEED = 100.0
const MAX_SPEED = 400.0
const JUMP_VELOCITY = -350.0
const WATER_JUMP_VELOCITY = JUMP_VELOCITY*1.25
var SPEED = DEFAULT_SPEED
var force = 3000
var defAir = 1000
var can_sprint = true
@export_range(1,12) var anim_speed = 5

func _ready() -> void:
	$AnimationPlayer.speed_scale = anim_speed
	Global.player_stamina = DEFAULT_STAMINA
	Global.player_health = DEFAULT_HEALTH

func _physics_process(delta: float) -> void:
	stamina = Global.player_stamina
		#air -= 1
	# Add the gravity.
	if move_and_slide():
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -force)
	if stamina == DEFAULT_STAMINA:
		can_sprint = true
	elif stamina <= 0:
		can_sprint = false
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and Global.player_in_water:
		velocity.y = WATER_JUMP_VELOCITY

	if Input.is_action_pressed("sprint") and can_sprint:
		if SPEED <= MAX_SPEED:
			SPEED = SPEED*1.05 
		Global.player_stamina -= 1
		$AnimationPlayer.speed_scale *= 1.25
	else:
		$AnimationPlayer.speed_scale = anim_speed
		if stamina < DEFAULT_STAMINA:
			Global.player_stamina += 1
		SPEED = lerpf(SPEED, DEFAULT_SPEED, 0.05)
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

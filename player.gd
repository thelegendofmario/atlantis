extends CharacterBody2D

const DEFAULT_STAMINA = 100.0
const DEFAULT_HEALTH = 100.0
var stamina = 0
const DEFAULT_SPEED = 200.0
const MAX_SPEED = 400.0
const JUMP_VELOCITY = -350.0
const WATER_JUMP_VELOCITY = JUMP_VELOCITY*1.25
var SPEED = DEFAULT_SPEED
var force = 3000
var defAir = 1000
var can_sprint = true
@onready var anime = $AnimatedSprite2D
@export_range(1,12) var anim_speed = 5

func _ready() -> void:
	Global.player_stamina = DEFAULT_STAMINA
	Global.player_health = DEFAULT_HEALTH

func _physics_process(delta: float) -> void:
	stamina = Global.player_stamina
		#air -= 1
	# Add the gravity.
	
	var direction := Input.get_axis("left", "right")
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
		anime.play("fly")
	if Global.player_in_water:
		Global.air -= 1
	else:
		Global.air += 1
		
	if Global.air <= 0:
		get_tree().change_scene_to_file("res://THE_BAD_END.tscn") 

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpSound.play()
	elif Input.is_action_just_pressed("jump") and Global.player_in_water:
		velocity.y = WATER_JUMP_VELOCITY
		$JumpSound.play()

	if Input.is_action_pressed("sprint") and can_sprint:
		if SPEED <= MAX_SPEED:
			SPEED = SPEED*1.05 
		Global.player_stamina -= 1
	else:
		if stamina < DEFAULT_STAMINA:
			Global.player_stamina += 1
#<<<<<<< HEAD
		if SPEED > 0:
			#SPEED -= 1
			velocity.x = direction * SPEED
			SPEED = lerpf(SPEED, DEFAULT_SPEED, 0.05)
#=======
		SPEED = lerpf(SPEED, DEFAULT_SPEED, 0.05)
#>>>>>>> 77b48ee99fda81fcf657585862ccd8a702366f95
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		velocity.x = direction * SPEED
	else:
		
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction and is_on_floor():
		anime.play("run")
	elif !direction and is_on_floor():
		anime.play("idle")

	move_and_slide()
	


func _on_coll_for_spikes_area_entered(area: Area2D) -> void:
	if area.is_in_group("spike") or area.is_in_group("enemys"):
		print("player hurt :)")
		$HurtSound.play()
		velocity.y = -200

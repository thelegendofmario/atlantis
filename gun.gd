extends CharacterBody2D


@onready var Muzzle = $MUZZLE
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var Bullet = preload("res://bullet.tscn")

func shoot():
	var b = Bullet.instantiate()
	
	owner.add_child(b)
	b.global_position = Muzzle.global_position
	b.global_rotation = Muzzle.global_rotation

func _physics_process(delta: float) -> void:
	# Add the gravity.
	look_at(get_global_mouse_position())

	move_and_slide()
	if Input.is_action_just_pressed("kama") and Global.player_stamina > 0:
		shoot()
		Global.player_stamina -= 25
	

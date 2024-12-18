extends CharacterBody2D


@onready var Muzzle = $MUZZLE
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var Bullet = preload("res://bullet.tscn")

func play_anim(movement):
	var anim = $AnimatedSprite2D
	if movement == 1:
		anim.play("bluestage1")
	if movement == 2:
		anim.play("bluestage2")
	if movement == 3:
		anim.play("bluestage3")
	if movement == 4:
		anim.play("bluestage4")
	if movement == 5:
		anim.play("bluestage5")

func shoot():
	var b = Bullet.instantiate()
	
	owner.add_child(b)
	b.global_position = Muzzle.global_position
	b.global_rotation = Muzzle.global_rotation

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if Global.player_artifacts == 0:
		play_anim(1)
	elif Global.player_artifacts == 1:
		play_anim(2)
	elif Global.player_artifacts == 2:
		play_anim(3)
	elif Global.player_artifacts == 3:
		play_anim(4)
	elif Global.player_artifacts == 4:
		play_anim(5)
	
	
	look_at(get_global_mouse_position())

	move_and_slide()
	if Input.is_action_just_pressed("kama") and Global.player_stamina > 0:
		shoot()
		Global.player_stamina -= 25
	

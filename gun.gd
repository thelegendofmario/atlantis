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
	if movement == 6:
		anim.play("multi")

func shoot():
	var i = Global.player_artifacts
	var rot = 0
	for n in i:
		var b = Bullet.instantiate()
		owner.add_child(b)
		b.global_position = Muzzle.global_position
		b.global_rotation = rot  + Muzzle.global_rotation
		n += 1
		rot += 0.1
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if Global.player_artifacts == 1:
		play_anim(1)
	elif Global.player_artifacts == 2:
		play_anim(2)
	elif Global.player_artifacts == 3:
		play_anim(3)
	elif Global.player_artifacts == 4:
		play_anim(4)
	elif Global.player_artifacts == 5:
		play_anim(5)
	elif Global.player_artifacts == 6:
		play_anim(6)
	
	
	look_at(get_global_mouse_position())

	move_and_slide()
	if Input.is_action_just_pressed("kama") and Global.player_stamina > 0:
		shoot()
		Global.player_stamina -= 25
	

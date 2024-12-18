extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DEFAULT_HEALTH = 100
var health = DEFAULT_HEALTH
var direction = -1
var speed = -250


func _ready() -> void:
	play_anim(3)

func play_anim(movement):
	var anim = $AnimatedSprite2D
	if movement == 0:
		anim.play("idle")
	if movement == 1:
		anim.play("attack")
	if movement == 3:
		anim.play("walk")
	if movement == 4:
		anim.play("running")
	if movement == 5:
		anim.play("death")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if health == 0:
		queue_free()
	
	position += transform.x * speed * delta 
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.player_health -=10


func _on_timer_timeout() -> void:
	scale.x = scale.x * -1


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.player_health -=10

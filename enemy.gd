extends CharacterBody2D

const DEFAULT_HEALTH = 100
var health = DEFAULT_HEALTH
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal hurt_player

var direction = -1
var speed = -250

func _ready() -> void:
	play_anim(3)

func play_anim(movement):
	var anim = $AnimatedSprite2D
	if movement == 3:
		anim.play("walk")


func _physics_process(delta) -> void:
	# Add the gravity.
	
	position += transform.x * speed * delta 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.player_health -=10


func _on_timer_timeout() -> void:
	scale.x = scale.x * -1


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.player_health -=10
		hurt_player.emit()
		print("player hit")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		health -=10
		if health <= 0:
			queue_free()
		area.queue_free()

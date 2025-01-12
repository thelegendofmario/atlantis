extends Area2D


# Called when the node enters the scene tree for the first time.
func _on_timer_timeout() -> void:
	queue_free()

var speed = -2500
var grav = 100
var rot = 0.01
var negrot = -0.01
func _physics_process(delta):
	position += transform.x * speed * delta 
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("crate"):
		queue_free()
	if body.is_in_group("ground"):
		queue_free()
	



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("button"):
		queue_free()
